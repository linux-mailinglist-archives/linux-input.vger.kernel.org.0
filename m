Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCD210001
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2019 20:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfD3S7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Apr 2019 14:59:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:38466 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbfD3S7S (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Apr 2019 14:59:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6645BAC23;
        Tue, 30 Apr 2019 18:59:16 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     linux-kernel@vger.kernel.org
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 1/2] input: edt-ft5x06 - add polled input support
Date:   Tue, 30 Apr 2019 20:58:58 +0200
Message-Id: <20190430185859.24015-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some hardware configurations might pass on providing an interrupt line.
In that case there is always the option to use a polled input approach.
This patch adapts the driver for it.

The polled approach is only triggered if no interrupt is provided by the
firmware or platform data.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 100 ++++++++++++++++++-------
 1 file changed, 72 insertions(+), 28 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 702bfda7ee77..e58645c72c2f 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -39,6 +39,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
+#include <linux/input-polldev.h>
 #include <linux/of_device.h>
 
 #define WORK_REGISTER_THRESHOLD		0x00
@@ -97,6 +98,7 @@ struct edt_reg_addr {
 struct edt_ft5x06_ts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct input_polled_dev *poll_dev;
 	struct touchscreen_properties prop;
 	u16 num_x;
 	u16 num_y;
@@ -181,9 +183,8 @@ static bool edt_ft5x06_ts_check_crc(struct edt_ft5x06_ts_data *tsdata,
 	return true;
 }
 
-static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
+static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 {
-	struct edt_ft5x06_ts_data *tsdata = dev_id;
 	struct device *dev = &tsdata->client->dev;
 	u8 cmd;
 	u8 rdbuf[63];
@@ -210,7 +211,7 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 		break;
 
 	default:
-		goto out;
+		return;
 	}
 
 	memset(rdbuf, 0, sizeof(rdbuf));
@@ -222,7 +223,7 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 	if (error) {
 		dev_err_ratelimited(dev, "Unable to fetch data, error: %d\n",
 				    error);
-		goto out;
+		return;
 	}
 
 	/* M09/M12 does not send header or CRC */
@@ -232,11 +233,11 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 			dev_err_ratelimited(dev,
 					"Unexpected header: %02x%02x%02x!\n",
 					rdbuf[0], rdbuf[1], rdbuf[2]);
-			goto out;
+			return;
 		}
 
 		if (!edt_ft5x06_ts_check_crc(tsdata, rdbuf, datalen))
-			goto out;
+			return;
 	}
 
 	for (i = 0; i < tsdata->max_support_points; i++) {
@@ -273,11 +274,23 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 
 	input_mt_report_pointer_emulation(tsdata->input, true);
 	input_sync(tsdata->input);
+}
 
-out:
+static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
+{
+	struct edt_ft5x06_ts_data *tsdata = dev_id;
+
+	edt_ft5x06_process(tsdata);
 	return IRQ_HANDLED;
 }
 
+static void edt_ft5x06_poll(struct input_polled_dev *dev)
+{
+	struct edt_ft5x06_ts_data *tsdata = dev->private;
+
+	edt_ft5x06_process(tsdata);
+}
+
 static int edt_ft5x06_register_write(struct edt_ft5x06_ts_data *tsdata,
 				     u8 addr, u8 value)
 {
@@ -1059,7 +1072,9 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 					 const struct i2c_device_id *id)
 {
 	const struct edt_i2c_chip_data *chip_data;
+	struct input_polled_dev *poll_dev = NULL;
 	struct edt_ft5x06_ts_data *tsdata;
+	bool polled = !(client->irq);
 	struct input_dev *input;
 	unsigned long irq_flags;
 	int error;
@@ -1112,15 +1127,38 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 		msleep(300);
 	}
 
-	input = devm_input_allocate_device(&client->dev);
-	if (!input) {
-		dev_err(&client->dev, "failed to allocate input device.\n");
-		return -ENOMEM;
+	if (polled) {
+		poll_dev = devm_input_allocate_polled_device(&client->dev);
+		if (!poll_dev) {
+			dev_err(&client->dev,
+				"failed to allocate polled input device.\n");
+			return -ENOMEM;
+		}
+
+		poll_dev->poll = edt_ft5x06_poll;
+		poll_dev->private = tsdata;
+
+		tsdata->poll_dev = poll_dev;
+		tsdata->input = poll_dev->input;
+
+		input = poll_dev->input;
+
+		device_property_read_u32(&client->dev, "poll-interval",
+					 &poll_dev->poll_interval);
+
+	} else {
+		input = devm_input_allocate_device(&client->dev);
+		if (!input) {
+			dev_err(&client->dev,
+				"failed to allocate input device.\n");
+			return -ENOMEM;
+		}
+
+		tsdata->input = input;
 	}
 
 	mutex_init(&tsdata->mutex);
 	tsdata->client = client;
-	tsdata->input = input;
 	tsdata->factory_mode = false;
 
 	error = edt_ft5x06_ts_identify(client, tsdata, fw_version);
@@ -1167,26 +1205,32 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, tsdata);
 
-	irq_flags = irq_get_trigger_type(client->irq);
-	if (irq_flags == IRQF_TRIGGER_NONE)
-		irq_flags = IRQF_TRIGGER_FALLING;
-	irq_flags |= IRQF_ONESHOT;
-
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					NULL, edt_ft5x06_ts_isr, irq_flags,
-					client->name, tsdata);
-	if (error) {
-		dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
-		return error;
-	}
-
 	error = devm_device_add_group(&client->dev, &edt_ft5x06_attr_group);
 	if (error)
 		return error;
 
-	error = input_register_device(input);
-	if (error)
-		return error;
+	if (polled) {
+		error = input_register_polled_device(poll_dev);
+		if (error)
+			return error;
+	} else {
+		irq_flags = irq_get_trigger_type(client->irq);
+		if (irq_flags == IRQF_TRIGGER_NONE)
+			irq_flags = IRQF_TRIGGER_FALLING;
+		irq_flags |= IRQF_ONESHOT;
+
+		error = devm_request_threaded_irq(&client->dev, client->irq,
+						NULL, edt_ft5x06_ts_isr, irq_flags,
+						client->name, tsdata);
+		if (error) {
+			dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
+			return error;
+		}
+
+		error = input_register_device(input);
+		if (error)
+			return error;
+	}
 
 	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
 	device_init_wakeup(&client->dev, 1);
-- 
2.21.0

