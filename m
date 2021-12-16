Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F3D4780BB
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 00:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhLPXhX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 18:37:23 -0500
Received: from finn.gateworks.com ([108.161.129.64]:36212 "EHLO
        finn.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229771AbhLPXhX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 18:37:23 -0500
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by finn.localdomain with esmtp (Exim 4.93)
        (envelope-from <tharvey@gateworks.com>)
        id 1my0Cz-0093am-8J; Thu, 16 Dec 2021 23:30:45 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [RFC PATCH 2/4] input: edt-ft5x06 - add polled input support
Date:   Thu, 16 Dec 2021 15:30:39 -0800
Message-Id: <20211216233041.1220-3-tharvey@gateworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216233041.1220-1-tharvey@gateworks.com>
References: <20211216233041.1220-1-tharvey@gateworks.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some hardware configurations might pass on providing an interrupt line.
In that case there is always the option to use a polled input approach.
This patch adapts the driver for it.

The polled approach is only triggered if no interrupt is provided by the
firmware or platform data.

Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 63 ++++++++++++++++++--------
 1 file changed, 45 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bb2e1cbffba7..06662f2258b1 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -187,9 +187,8 @@ static bool edt_ft5x06_ts_check_crc(struct edt_ft5x06_ts_data *tsdata,
 	return true;
 }
 
-static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
+static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 {
-	struct edt_ft5x06_ts_data *tsdata = dev_id;
 	struct device *dev = &tsdata->client->dev;
 	u8 cmd;
 	u8 rdbuf[63];
@@ -216,7 +215,7 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 		break;
 
 	default:
-		goto out;
+		return;
 	}
 
 	memset(rdbuf, 0, sizeof(rdbuf));
@@ -228,7 +227,7 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 	if (error) {
 		dev_err_ratelimited(dev, "Unable to fetch data, error: %d\n",
 				    error);
-		goto out;
+		return;
 	}
 
 	/* M09/M12 does not send header or CRC */
@@ -238,11 +237,11 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
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
@@ -274,11 +273,23 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 
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
 
+static void edt_ft5x06_ts_poll(struct input_dev *dev)
+{
+	struct edt_ft5x06_ts_data *tsdata = input_get_drvdata(dev);
+
+	edt_ft5x06_process(tsdata);
+}
+
 static int edt_ft5x06_register_write(struct edt_ft5x06_ts_data *tsdata,
 				     u8 addr, u8 value)
 {
@@ -1080,6 +1091,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	u8 buf[2] = { 0xfc, 0x00 };
 	struct input_dev *input;
 	unsigned long irq_flags;
+	u32 poll_interval = 0;
 	int error;
 	char fw_version[EDT_NAME_LEN];
 
@@ -1234,17 +1246,32 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 
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
+	device_property_read_u32(&client->dev, "poll-interval",
+				 &poll_interval);
+	if (poll_interval) {
+		error = input_setup_polling(input, edt_ft5x06_ts_poll);
+		if (error) {
+			dev_err(&client->dev,
+				"Unable to set up polling mode: %d\n", error);
+			return error;
+		}
+		input_set_drvdata(input, tsdata);
+		input_set_poll_interval(input, poll_interval);
+		dev_info(&client->dev, "Polling device at %dms\n",
+			 poll_interval);
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
 	}
 
 	error = devm_device_add_group(&client->dev, &edt_ft5x06_attr_group);
-- 
2.17.1

