Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A94C3758
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 16:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387581AbfJAO3z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 10:29:55 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:56426 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388925AbfJAO3z (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Oct 2019 10:29:55 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id A9C2CA2405;
        Tue,  1 Oct 2019 16:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1569940193;
        bh=ZfFAl5slIX6BZUhMX14bAZoNHkJmdi7i65/tACs7alY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F9oMFiHz1s9imdLragvWtkGbokmKirB+pac3YRJA2TfW4SCLWc8j4Dk7MTgw/pkIg
         sqL315c2SxSepvd0Z9Tnc4nQq/Y4BRxbA12RZIx+lLqQpnLKRpQbG3IE+qftkHC9S5
         4IHovUfTFeVbeCovcKBjPahwEr9YnBj/zACZqK7M=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v2 4/5] Input: mpr121: Add polling mode
Date:   Tue,  1 Oct 2019 16:29:39 +0200
Message-Id: <1569940180-11417-5-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1569940180-11417-1-git-send-email-michal.vokac@ysoft.com>
References: <1569940180-11417-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In case the interrupt line is not available, polling can be used
to read out the state of the keys. Period of the polling needs to
be configured by the poll-interval DT property.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes since v1:
 - Use poll-interval property name instead of linux,poll-interval.

 drivers/input/keyboard/mpr121_touchkey.c | 69 +++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index ee80de44ce3f..40d6e5087cde 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -54,6 +54,9 @@
 /* MPR121 has 12 keys */
 #define MPR121_MAX_KEY_COUNT		12
 
+#define MPR121_MIN_POLL_INTERVAL	10
+#define MPR121_MAX_POLL_INTERVAL	200
+
 struct mpr121_touchkey {
 	struct i2c_client	*client;
 	struct input_dev	*input_dev;
@@ -115,11 +118,11 @@ static struct regulator *mpr121_vdd_supply_init(struct device *dev)
 	return vdd_supply;
 }
 
-static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
+static void mpr_touchkey_report(struct input_dev *dev)
 {
-	struct mpr121_touchkey *mpr121 = dev_id;
-	struct i2c_client *client = mpr121->client;
+	struct mpr121_touchkey *mpr121 = input_get_drvdata(dev);
 	struct input_dev *input = mpr121->input_dev;
+	struct i2c_client *client = mpr121->client;
 	unsigned long bit_changed;
 	unsigned int key_num;
 	int reg;
@@ -127,14 +130,14 @@ static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
 	reg = i2c_smbus_read_byte_data(client, ELE_TOUCH_STATUS_1_ADDR);
 	if (reg < 0) {
 		dev_err(&client->dev, "i2c read error [%d]\n", reg);
-		goto out;
+		return;
 	}
 
 	reg <<= 8;
 	reg |= i2c_smbus_read_byte_data(client, ELE_TOUCH_STATUS_0_ADDR);
 	if (reg < 0) {
 		dev_err(&client->dev, "i2c read error [%d]\n", reg);
-		goto out;
+		return;
 	}
 
 	reg &= TOUCH_STATUS_MASK;
@@ -155,8 +158,14 @@ static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
 
 	}
 	input_sync(input);
+}
+
+static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
+{
+	struct mpr121_touchkey *mpr121 = dev_id;
+
+	mpr_touchkey_report(mpr121->input_dev);
 
-out:
 	return IRQ_HANDLED;
 }
 
@@ -229,14 +238,10 @@ static int mpr_touchkey_probe(struct i2c_client *client,
 	int vdd_uv;
 	struct mpr121_touchkey *mpr121;
 	struct input_dev *input_dev;
+	u32 poll_interval = 0;
 	int error;
 	int i;
 
-	if (!client->irq) {
-		dev_err(dev, "irq number should not be zero\n");
-		return -EINVAL;
-	}
-
 	vdd_supply = mpr121_vdd_supply_init(dev);
 	if (IS_ERR(vdd_supply))
 		return PTR_ERR(vdd_supply);
@@ -274,6 +279,7 @@ static int mpr_touchkey_probe(struct i2c_client *client,
 	if (device_property_read_bool(dev, "autorepeat"))
 		__set_bit(EV_REP, input_dev->evbit);
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
+	input_set_drvdata(input_dev, mpr121);
 
 	input_dev->keycode = mpr121->keycodes;
 	input_dev->keycodesize = sizeof(mpr121->keycodes[0]);
@@ -288,13 +294,40 @@ static int mpr_touchkey_probe(struct i2c_client *client,
 		return error;
 	}
 
-	error = devm_request_threaded_irq(dev, client->irq, NULL,
-					  mpr_touchkey_interrupt,
-					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					  dev->driver->name, mpr121);
-	if (error) {
-		dev_err(dev, "Failed to register interrupt\n");
-		return error;
+	device_property_read_u32(dev, "poll-interval", &poll_interval);
+
+	if (client->irq) {
+		error = devm_request_threaded_irq(dev, client->irq, NULL,
+						  mpr_touchkey_interrupt,
+						  IRQF_TRIGGER_FALLING |
+						  IRQF_ONESHOT,
+						  dev->driver->name, mpr121);
+		if (error) {
+			dev_err(dev, "Failed to register interrupt\n");
+			return error;
+		}
+	} else if (poll_interval) {
+		if (poll_interval < MPR121_MIN_POLL_INTERVAL)
+			return -EINVAL;
+
+		if (poll_interval > MPR121_MAX_POLL_INTERVAL)
+			return -EINVAL;
+
+		error = input_setup_polling(input_dev, mpr_touchkey_report);
+		if (error) {
+			dev_err(dev, "Failed to setup polling\n");
+			return error;
+		}
+
+		input_set_poll_interval(input_dev, poll_interval);
+		input_set_min_poll_interval(input_dev,
+					    MPR121_MIN_POLL_INTERVAL);
+		input_set_max_poll_interval(input_dev,
+					    MPR121_MAX_POLL_INTERVAL);
+	} else {
+		dev_err(dev,
+			"invalid IRQ number and polling not configured\n");
+		return -EINVAL;
 	}
 
 	error = input_register_device(input_dev);
-- 
2.1.4

