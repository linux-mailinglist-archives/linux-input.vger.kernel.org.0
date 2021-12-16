Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E364780B9
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 00:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhLPXhW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 18:37:22 -0500
Received: from finn.gateworks.com ([108.161.129.64]:36208 "EHLO
        finn.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229755AbhLPXhW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 18:37:22 -0500
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by finn.localdomain with esmtp (Exim 4.93)
        (envelope-from <tharvey@gateworks.com>)
        id 1my0Cz-0093am-MQ; Thu, 16 Dec 2021 23:30:45 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>
Subject: [RFC PATCH 3/4] input: edt-ft5x06 - add support for DFROBOT touch controllers
Date:   Thu, 16 Dec 2021 15:30:40 -0800
Message-Id: <20211216233041.1220-4-tharvey@gateworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216233041.1220-1-tharvey@gateworks.com>
References: <20211216233041.1220-1-tharvey@gateworks.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the touch controller found on a DFROBOT DFR0550/DFR0776
touchscreen display.

These touchscreen displays are intended to be compatible with the official
Raspberry Pi 7in display which has an FTx06 touch controller directly
attached to the 15pin connector to the host processor. However these
displays have an FTx06 touch controller that connected to an I2C master
on a STM32F103 micro controller which polls the FTx06 and emulates a
virtual I2C device connected to the 15pin connector to the host processor.

The emulated FTx06 implements a subset of the FTx06 register set but
must be read with individual transactions between reading the number
of points and the point data itself.

Additionally there is no IRQ made available.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 .../input/touchscreen/edt-ft5x06.yaml         |  1 +
 drivers/input/touchscreen/edt-ft5x06.c        | 65 ++++++++++++++++---
 2 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index a0d4dabf03b8..45a9cb1d4f14 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -40,6 +40,7 @@ properties:
       - edt,edt-ft5506
       - evervision,ev-ft5726
       - focaltech,ft6236
+      - dfr,dfr0550
 
   reg:
     maxItems: 1
diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 06662f2258b1..a3622d6e8e65 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -84,6 +84,7 @@ enum edt_ver {
 	EDT_M12,
 	EV_FT,
 	GENERIC_FT,
+	DFR,
 };
 
 struct edt_reg_addr {
@@ -134,6 +135,7 @@ struct edt_ft5x06_ts_data {
 
 struct edt_i2c_chip_data {
 	int  max_support_points;
+	bool dfr;
 };
 
 static int edt_ft5x06_ts_readwrite(struct i2c_client *client,
@@ -195,6 +197,7 @@ static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 	int i, type, x, y, id;
 	int offset, tplen, datalen, crclen;
 	int error;
+	int num_points;
 
 	switch (tsdata->version) {
 	case EDT_M06:
@@ -202,6 +205,7 @@ static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 		offset = 5; /* where the actual touch data starts */
 		tplen = 4;  /* data comes in so called frames */
 		crclen = 1; /* length of the crc data */
+		datalen = tplen * tsdata->max_support_points + offset + crclen;
 		break;
 
 	case EDT_M09:
@@ -212,6 +216,14 @@ static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 		offset = 3;
 		tplen = 6;
 		crclen = 0;
+		datalen = tplen * tsdata->max_support_points + offset + crclen;
+		break;
+	/* DFR needs to read 1 byte R2 for num points */
+	case DFR:
+		cmd = 0x2;
+		offset = 3;
+		crclen = 0;
+		datalen = 1;
 		break;
 
 	default:
@@ -219,7 +231,6 @@ static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 	}
 
 	memset(rdbuf, 0, sizeof(rdbuf));
-	datalen = tplen * tsdata->max_support_points + offset + crclen;
 
 	error = edt_ft5x06_ts_readwrite(tsdata->client,
 					sizeof(cmd), &cmd,
@@ -242,11 +253,31 @@ static void edt_ft5x06_process(struct edt_ft5x06_ts_data *tsdata)
 
 		if (!edt_ft5x06_ts_check_crc(tsdata, rdbuf, datalen))
 			return;
+		num_points = tsdata->max_support_points;
+	} else if (tsdata->version == DFR) {
+		num_points = min(rdbuf[0] & 0xf, tsdata->max_support_points);
+	} else {
+		num_points = min(rdbuf[2] & 0xf, tsdata->max_support_points);
 	}
 
-	for (i = 0; i < tsdata->max_support_points; i++) {
+	for (i = 0; i < num_points; i++) {
 		u8 *buf = &rdbuf[i * tplen + offset];
 
+		/* DFR must read each point in separate transaction */
+		if (tsdata->version == DFR) {
+			cmd = 3+6*i;
+			datalen = 4;
+			buf = rdbuf;
+			error = edt_ft5x06_ts_readwrite(tsdata->client,
+							sizeof(cmd), &cmd,
+							datalen, buf);
+			if (error) {
+				dev_err_ratelimited(dev, "Unable to fetch point data, error: %d\n",
+						    error);
+				return;
+			}
+		}
+
 		type = buf[0] >> 6;
 		/* ignore Reserved events */
 		if (type == TOUCH_EVENT_RESERVED)
@@ -1072,6 +1103,9 @@ static void edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 		reg_addr->reg_num_x = NO_REGISTER;
 		reg_addr->reg_num_y = NO_REGISTER;
 		break;
+
+	case DFR:
+		break;
 	}
 }
 
@@ -1206,21 +1240,29 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	tsdata->input = input;
 	tsdata->factory_mode = false;
 
-	error = edt_ft5x06_ts_identify(client, tsdata, fw_version);
-	if (error) {
-		dev_err(&client->dev, "touchscreen probe failed\n");
-		return error;
+	if (chip_data->dfr) {
+		tsdata->version = DFR;
+		snprintf(tsdata->name, EDT_NAME_LEN, "DFROBOT");
+		fw_version[0] = 0;
+	} else {
+		error = edt_ft5x06_ts_identify(client, tsdata, fw_version);
+		if (error) {
+			dev_err(&client->dev, "touchscreen probe failed\n");
+			return error;
+		}
 	}
 
 	/*
 	 * Dummy read access. EP0700MLP1 returns bogus data on the first
 	 * register read access and ignores writes.
 	 */
-	edt_ft5x06_ts_readwrite(tsdata->client, 2, buf, 2, buf);
+	if (!chip_data->dfr) /* this gets the DFR controller out of sync */
+		edt_ft5x06_ts_readwrite(tsdata->client, 2, buf, 2, buf);
 
 	edt_ft5x06_ts_set_regs(tsdata);
 	edt_ft5x06_ts_get_defaults(&client->dev, tsdata);
-	edt_ft5x06_ts_get_parameters(tsdata);
+	if (!chip_data->dfr)
+		edt_ft5x06_ts_get_parameters(tsdata);
 
 	dev_dbg(&client->dev,
 		"Model \"%s\", Rev. \"%s\", %dx%d sensors\n",
@@ -1423,12 +1465,18 @@ static const struct edt_i2c_chip_data edt_ft6236_data = {
 	.max_support_points = 2,
 };
 
+static const struct edt_i2c_chip_data edt_dfr0550_data = {
+	.max_support_points = 5,
+	.dfr = true,
+};
+
 static const struct i2c_device_id edt_ft5x06_ts_id[] = {
 	{ .name = "edt-ft5x06", .driver_data = (long)&edt_ft5x06_data },
 	{ .name = "edt-ft5506", .driver_data = (long)&edt_ft5506_data },
 	{ .name = "ev-ft5726", .driver_data = (long)&edt_ft5506_data },
 	/* Note no edt- prefix for compatibility with the ft6236.c driver */
 	{ .name = "ft6236", .driver_data = (long)&edt_ft6236_data },
+	{ .name = "dfr0550", .driver_data = (long)&edt_dfr0550_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, edt_ft5x06_ts_id);
@@ -1441,6 +1489,7 @@ static const struct of_device_id edt_ft5x06_of_match[] = {
 	{ .compatible = "evervision,ev-ft5726", .data = &edt_ft5506_data },
 	/* Note focaltech vendor prefix for compatibility with ft6236.c */
 	{ .compatible = "focaltech,ft6236", .data = &edt_ft6236_data },
+	{ .compatible = "dfr,dfr0550", .data = &edt_dfr0550_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, edt_ft5x06_of_match);
-- 
2.17.1

