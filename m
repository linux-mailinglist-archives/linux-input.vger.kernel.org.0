Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98A07B5227
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 17:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfIQP6W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 11:58:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42813 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbfIQP6V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 11:58:21 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAFro-0005CM-Lo; Tue, 17 Sep 2019 17:58:12 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAFrn-0007Mu-M1; Tue, 17 Sep 2019 17:58:11 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 6/6] Input: edt-ft5x06 - add supply voltage support
Date:   Tue, 17 Sep 2019 17:58:08 +0200
Message-Id: <20190917155808.27818-7-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917155808.27818-1-m.felsch@pengutronix.de>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently the driver do not care about the regulator which supplies the
controller. This can lead into problems since we support (deep-)sleep
because the regulator can be turned off before we send the (deep-)sleep
command to the controller. Using a own regulator improves the power
consumption during sleep even more.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 53 ++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index b95ce5a7482d..6429e915ec94 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -27,6 +27,7 @@
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/ratelimit.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
@@ -96,6 +97,7 @@ struct edt_ft5x06_ts_data {
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *wake_gpio;
+	struct regulator *vdd;
 
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *debug_dir;
@@ -1090,6 +1092,23 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
+	if (IS_ERR(tsdata->vdd)) {
+		error = PTR_ERR(tsdata->vdd);
+		if (error == -EPROBE_DEFER)
+			return error;
+		dev_err(&client->dev,
+			"Failed to request vdd-supply, error %d\n", error);
+		return error;
+	}
+
+	error = regulator_enable(tsdata->vdd);
+	if (error) {
+		dev_err(&client->dev,
+			"Failed to enable vdd-supply, error %d\n", error);
+		return error;
+	}
+
 	/*
 	 * We need to go this way to keep backward compatibility with old DT's
 	 * which may assume the default-on mechanism.
@@ -1111,7 +1130,8 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	input = devm_input_allocate_device(&client->dev);
 	if (!input) {
 		dev_err(&client->dev, "failed to allocate input device.\n");
-		return -ENOMEM;
+		error = -ENOMEM;
+		goto err_reg_disable;
 	}
 
 	mutex_init(&tsdata->mutex);
@@ -1122,7 +1142,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	error = edt_ft5x06_ts_identify(client, tsdata, fw_version);
 	if (error) {
 		dev_err(&client->dev, "touchscreen probe failed\n");
-		return error;
+		goto err_reg_disable;
 	}
 
 	edt_ft5x06_ts_set_regs(tsdata);
@@ -1158,7 +1178,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 				INPUT_MT_DIRECT);
 	if (error) {
 		dev_err(&client->dev, "Unable to init MT slots.\n");
-		return error;
+		goto err_reg_disable;
 	}
 
 	i2c_set_clientdata(client, tsdata);
@@ -1173,16 +1193,16 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 					client->name, tsdata);
 	if (error) {
 		dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
-		return error;
+		goto err_reg_disable;
 	}
 
 	error = devm_device_add_group(&client->dev, &edt_ft5x06_attr_group);
 	if (error)
-		return error;
+		goto err_reg_disable;
 
 	error = input_register_device(input);
 	if (error)
-		return error;
+		goto err_reg_disable;
 
 	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
 	device_init_wakeup(&client->dev, en_wakeup);
@@ -1194,6 +1214,10 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		tsdata->reset_gpio ? desc_to_gpio(tsdata->reset_gpio) : -1);
 
 	return 0;
+
+err_reg_disable:
+	regulator_disable(tsdata->vdd);
+	return error;
 }
 
 static int edt_ft5x06_ts_remove(struct i2c_client *client)
@@ -1225,8 +1249,16 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
 
 	ret = edt_ft5x06_register_write(tsdata, PMOD_REGISTER_OPMODE,
 					PMOD_REGISTER_HIBERNATE);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Failed to set hibernate mode\n");
+		return ret;
+	}
+
+	ret = regulator_disable(tsdata->vdd);
+	if (ret) {
+		dev_err(dev, "Failed to disable vdd\n");
+		return ret;
+	}
 
 	return ret;
 }
@@ -1235,12 +1267,19 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+	int error;
 
 	if (device_may_wakeup(dev)) {
 		disable_irq_wake(client->irq);
 		return 0;
 	}
 
+	error = regulator_enable(tsdata->vdd);
+	if (error) {
+		dev_err(&client->dev, "Failed to enable vdd\n");
+		return error;
+	}
+
 	/* Recover from hibernate mode if hardware supports it */
 	if (tsdata->wake_gpio) {
 		gpiod_set_value_cansleep(tsdata->wake_gpio, 0);
-- 
2.20.1

