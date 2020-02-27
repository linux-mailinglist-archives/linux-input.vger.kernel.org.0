Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA651715EB
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 12:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbgB0L21 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 06:28:27 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:32905 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbgB0L21 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 06:28:27 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL4-0000p6-Gu; Thu, 27 Feb 2020 12:28:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL3-0001kG-9d; Thu, 27 Feb 2020 12:28:21 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     dmitry.torokhov@gmail.com, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, LW@KARO-electronics.de
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/4] Input: edt-ft5x06 - move parameter restore into helper
Date:   Thu, 27 Feb 2020 12:28:17 +0100
Message-Id: <20200227112819.16754-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227112819.16754-1-m.felsch@pengutronix.de>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
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

We need to restore the parameters if we switch between the
factory/work mode and during the resume process if we switched off the
power-supply. Therefore refactor edt_ft5x06_work_mode() and move the
"restore the parameters" into a helper routine so we can reuse it later.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 43 ++++++++++++++------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 9b8450794a8a..bb9107093796 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -527,6 +527,29 @@ static const struct attribute_group edt_ft5x06_attr_group = {
 	.attrs = edt_ft5x06_attrs,
 };
 
+static void edt_ft5x06_restore_reg_parameters(struct edt_ft5x06_ts_data *tsdata)
+{
+	struct edt_reg_addr *reg_addr = &tsdata->reg_addr;
+
+	edt_ft5x06_register_write(tsdata, reg_addr->reg_threshold,
+				  tsdata->threshold);
+	edt_ft5x06_register_write(tsdata, reg_addr->reg_gain,
+				  tsdata->gain);
+	if (reg_addr->reg_offset != NO_REGISTER)
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset,
+					  tsdata->offset);
+	if (reg_addr->reg_offset_x != NO_REGISTER)
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_x,
+					  tsdata->offset_x);
+	if (reg_addr->reg_offset_y != NO_REGISTER)
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_y,
+					  tsdata->offset_y);
+	if (reg_addr->reg_report_rate != NO_REGISTER)
+		edt_ft5x06_register_write(tsdata, reg_addr->reg_report_rate,
+				  tsdata->report_rate);
+
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int edt_ft5x06_factory_mode(struct edt_ft5x06_ts_data *tsdata)
 {
@@ -592,7 +615,6 @@ static int edt_ft5x06_work_mode(struct edt_ft5x06_ts_data *tsdata)
 {
 	struct i2c_client *client = tsdata->client;
 	int retries = EDT_SWITCH_MODE_RETRIES;
-	struct edt_reg_addr *reg_addr = &tsdata->reg_addr;
 	int ret;
 	int error;
 
@@ -624,24 +646,7 @@ static int edt_ft5x06_work_mode(struct edt_ft5x06_ts_data *tsdata)
 	kfree(tsdata->raw_buffer);
 	tsdata->raw_buffer = NULL;
 
-	/* restore parameters */
-	edt_ft5x06_register_write(tsdata, reg_addr->reg_threshold,
-				  tsdata->threshold);
-	edt_ft5x06_register_write(tsdata, reg_addr->reg_gain,
-				  tsdata->gain);
-	if (reg_addr->reg_offset != NO_REGISTER)
-		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset,
-					  tsdata->offset);
-	if (reg_addr->reg_offset_x != NO_REGISTER)
-		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_x,
-					  tsdata->offset_x);
-	if (reg_addr->reg_offset_y != NO_REGISTER)
-		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_y,
-					  tsdata->offset_y);
-	if (reg_addr->reg_report_rate != NO_REGISTER)
-		edt_ft5x06_register_write(tsdata, reg_addr->reg_report_rate,
-				  tsdata->report_rate);
-
+	edt_ft5x06_restore_reg_parameters(tsdata);
 	enable_irq(client->irq);
 
 	return 0;
-- 
2.20.1

