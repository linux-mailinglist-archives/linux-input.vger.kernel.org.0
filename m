Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E59C1D56B7
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 18:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgEOQxB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 12:53:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45952 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgEOQxA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 12:53:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id B80C22A34B5
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com, Dmitry Torokhov <dtor@chromium.org>
Subject: [PATCHv2 7/7] Input: elan_i2c: Support inhibiting
Date:   Fri, 15 May 2020 18:52:51 +0200
Message-Id: <20200515165251.28952-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515164943.28480-1-andrzej.p@collabora.com>
References: <20200515164943.28480-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dmitry Torokhov <dtor@chromium.org>

This also implies adjusting suspend/resume.

Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/input/mouse/elan_i2c_core.c | 112 ++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 23 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 8719da540383..b3f67bd080a4 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -309,6 +309,71 @@ static int elan_initialize(struct elan_tp_data *data)
 	return error;
 }
 
+static int elan_reactivate(struct elan_tp_data *data)
+{
+	struct device *dev = &data->client->dev;
+	int ret;
+
+	ret = elan_enable_power(data);
+	if (ret)
+		dev_err(dev, "failed to restore power: %d\n", ret);
+
+	ret = elan_initialize(data);
+	if (ret)
+		dev_err(dev, "failed to re-initialize touchpad: %d\n", ret);
+
+	return ret;
+}
+
+static int elan_uninhibit(struct input_dev *input)
+{
+	struct elan_tp_data *data = input_get_drvdata(input);
+	struct i2c_client *client = data->client;
+	int ret;
+
+	dev_dbg(&client->dev, "uninhibiting\n");
+
+	ret = mutex_lock_interruptible(&data->sysfs_mutex);
+	if (ret)
+		return ret;
+
+	ret = elan_reactivate(data);
+	if (ret == 0)
+		enable_irq(client->irq);
+
+	mutex_unlock(&data->sysfs_mutex);
+
+	return ret;
+}
+
+static int elan_inhibit(struct input_dev *input)
+{
+	struct elan_tp_data *data = input_get_drvdata(input);
+	struct i2c_client *client = data->client;
+	int ret;
+
+	dev_dbg(&client->dev, "closing\n");
+
+	/*
+	 * We are taking the mutex to make sure sysfs operations are
+	 * complete before we attempt to bring the device into low[er]
+	 * power mode.
+	 */
+	ret = mutex_lock_interruptible(&data->sysfs_mutex);
+	if (ret)
+		return ret;
+
+	disable_irq(client->irq);
+
+	ret = elan_disable_power(data);
+	if (ret)
+		enable_irq(client->irq);
+
+	mutex_unlock(&data->sysfs_mutex);
+
+	return ret;
+}
+
 static int elan_query_device_info(struct elan_tp_data *data)
 {
 	int error;
@@ -1085,6 +1150,8 @@ static int elan_setup_input_device(struct elan_tp_data *data)
 	input->id.bustype = BUS_I2C;
 	input->id.vendor = ELAN_VENDOR_ID;
 	input->id.product = data->product_id;
+	input->uninhibit = elan_uninhibit;
+	input->inhibit = elan_inhibit;
 	input_set_drvdata(input, data);
 
 	error = input_mt_init_slots(input, ETP_MAX_FINGERS,
@@ -1308,15 +1375,19 @@ static int __maybe_unused elan_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	disable_irq(client->irq);
+	mutex_lock(&data->input->mutex);
+	if (input_device_enabled(data->input)) {
+		disable_irq(client->irq);
 
-	if (device_may_wakeup(dev)) {
-		ret = elan_sleep(data);
-		/* Enable wake from IRQ */
-		data->irq_wake = (enable_irq_wake(client->irq) == 0);
-	} else {
-		ret = elan_disable_power(data);
+		if (device_may_wakeup(dev)) {
+			ret = elan_sleep(data);
+			/* Enable wake from IRQ */
+			data->irq_wake = (enable_irq_wake(client->irq) == 0);
+		} else {
+			ret = elan_disable_power(data);
+		}
 	}
+	mutex_unlock(&data->input->mutex);
 
 	mutex_unlock(&data->sysfs_mutex);
 	return ret;
@@ -1326,26 +1397,21 @@ static int __maybe_unused elan_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct elan_tp_data *data = i2c_get_clientdata(client);
-	int error;
+	int ret = 0;
 
-	if (device_may_wakeup(dev) && data->irq_wake) {
-		disable_irq_wake(client->irq);
-		data->irq_wake = false;
-	}
+	mutex_lock(&data->input->mutex);
+	if (input_device_enabled(data->input)) {
+		if (data->irq_wake) {
+			disable_irq_wake(client->irq);
+			data->irq_wake = false;
+		}
 
-	error = elan_enable_power(data);
-	if (error) {
-		dev_err(dev, "power up when resuming failed: %d\n", error);
-		goto err;
+		ret = elan_reactivate(data);
+		enable_irq(data->client->irq);
 	}
+	mutex_unlock(&data->input->mutex);
 
-	error = elan_initialize(data);
-	if (error)
-		dev_err(dev, "initialize when resuming failed: %d\n", error);
-
-err:
-	enable_irq(data->client->irq);
-	return error;
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(elan_pm_ops, elan_suspend, elan_resume);
-- 
2.17.1

