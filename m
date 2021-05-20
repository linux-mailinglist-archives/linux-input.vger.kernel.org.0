Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B08538B9A9
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbhETWtJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbhETWtE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:49:04 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED96C061761
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:41 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id u33so9480004qvf.9
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i0BIBWLRv0flhMJctKeDg8V6EhiWLCWQgTJ+1Lih4Ik=;
        b=kTyPdJ/oVjAk8ahDAdWeGfmNFwHjKZ67sgvS9/bkOpn4gFS3b6K4Gb7J1DFxaWLwE9
         e2fjAKZIeONK+D5LKh49hHCiWC7WswRJuvGwc3eLF1aLUPNRt0GzRSotxl7Fnvzx/qB/
         kIqcYnBzfCX1fopgO8d7t6bZeMUbO956qrG9V8NENB1WQFN0gCUWLPN83l7kjwnoQrzP
         Jb34jZXfyBhxR5azbQvJWy1ZHJMXt7zOiO2Cg/hGx1BsF7RRdux+tOxefzH3wcHwHaEY
         3RziQOJ4sY1HRdRjcFn+vpqzjyyJ6sTqfgl33LtCQobc7yJXH1zdWD1B34mFPlXIYucJ
         9BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i0BIBWLRv0flhMJctKeDg8V6EhiWLCWQgTJ+1Lih4Ik=;
        b=L5fSQBZBNYwxzMUfNg8qHmA+pfpF57TxYTy3u61q4kE//xMRfHMxttyUKBJmnWlIQ8
         93LuIs6SSrrvmDoamn4Ew+0gDeSjnWSCetutkXpeyL/AZwgdnbROVFXEB0Mi1Pds00G+
         0tyQWeFC7uxbdqO8Fkf1xrRsFXdFeVftGRhRUN3b55rqiuIUxxdqrR3TrwYHE8qu9bWe
         mql/AAcdLE2qHQKwSRtTcrsNyy3mhdQ9vc2ZNp7KXtRWiUs6hUTT8hWNI9LOJ3OOPVER
         WfNT/IxQeqa4e06ieklIg4eITxo3lVzrw8zPmsTTsTrmIThog8TUXGfRBaLOxe4UcmLq
         ak2Q==
X-Gm-Message-State: AOAM53226KS5wA6KPD0pi3hNGG7gvN7/qj6ibkhXEFPt1bmtTcErcpiN
        XtYZT02N2SaLo700y10bFu6MMWNv6oUuaA==
X-Google-Smtp-Source: ABdhPJyJKvj9X0gcfeKQRHfEBlw+XWe/ONOZgJXg8WD4dRnhoDPnlApWokQhmYYTiSTPfXgEbh+Mxw==
X-Received: by 2002:ad4:5b81:: with SMTP id 1mr4771104qvp.12.1621550860227;
        Thu, 20 May 2021 15:47:40 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:39 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 12/15] HID: nintendo: add support for reading user calibration
Date:   Thu, 20 May 2021 18:47:12 -0400
Message-Id: <20210520224715.680919-13-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If the controller's SPI flash contains user stick calibration(s), they
should be prioritized over the factory calibrations. The user
calibrations have 2 magic bytes preceding them. If the bytes are the
correct magic values, the user calibration is used.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 206 ++++++++++++++++++++++++++-----------
 1 file changed, 148 insertions(+), 58 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 62231e50ca020..cdb931d9bfae4 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -23,6 +23,7 @@
  */
 
 #include "hid-ids.h"
+#include <asm/unaligned.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/hid.h>
@@ -96,11 +97,23 @@ static const u8 JC_USB_RESET			= 0x06;
 static const u8 JC_USB_PRE_HANDSHAKE		= 0x91;
 static const u8 JC_USB_SEND_UART		= 0x92;
 
-/* SPI storage addresses of factory calibration data */
-static const u16 JC_CAL_DATA_START		= 0x603d;
-static const u16 JC_CAL_DATA_END		= 0x604e;
-#define JC_CAL_DATA_SIZE	(JC_CAL_DATA_END - JC_CAL_DATA_START + 1)
+/* Magic value denoting presence of user calibration */
+static const u16 JC_CAL_USR_MAGIC_0		= 0xB2;
+static const u16 JC_CAL_USR_MAGIC_1		= 0xA1;
+static const u8 JC_CAL_USR_MAGIC_SIZE		= 2;
+
+/* SPI storage addresses of user calibration data */
+static const u16 JC_CAL_USR_LEFT_MAGIC_ADDR	= 0x8010;
+static const u16 JC_CAL_USR_LEFT_DATA_ADDR	= 0x8012;
+static const u16 JC_CAL_USR_LEFT_DATA_END	= 0x801A;
+static const u16 JC_CAL_USR_RIGHT_MAGIC_ADDR	= 0x801B;
+static const u16 JC_CAL_USR_RIGHT_DATA_ADDR	= 0x801D;
+#define JC_CAL_STICK_DATA_SIZE \
+	(JC_CAL_USR_LEFT_DATA_END - JC_CAL_USR_LEFT_DATA_ADDR + 1)
 
+/* SPI storage addresses of factory calibration data */
+static const u16 JC_CAL_FCT_DATA_LEFT_ADDR	= 0x603d;
+static const u16 JC_CAL_FCT_DATA_RIGHT_ADDR	= 0x6046;
 
 /* The raw analog joystick values will be mapped in terms of this magnitude */
 static const u16 JC_MAX_STICK_MAG		= 32767;
@@ -524,38 +537,140 @@ static int joycon_set_player_leds(struct joycon_ctlr *ctlr, u8 flash, u8 on)
 	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
-static const u16 DFLT_STICK_CAL_CEN = 2000;
-static const u16 DFLT_STICK_CAL_MAX = 3500;
-static const u16 DFLT_STICK_CAL_MIN = 500;
-static int joycon_request_calibration(struct joycon_ctlr *ctlr)
+static int joycon_request_spi_flash_read(struct joycon_ctlr *ctlr,
+					 u32 start_addr, u8 size, u8 **reply)
 {
 	struct joycon_subcmd_request *req;
-	u8 buffer[sizeof(*req) + 5] = { 0 };
 	struct joycon_input_report *report;
-	struct joycon_stick_cal *cal_x;
-	struct joycon_stick_cal *cal_y;
+	u8 buffer[sizeof(*req) + 5] = { 0 };
+	u8 *data;
+	int ret;
+
+	if (!reply)
+		return -EINVAL;
+
+	req = (struct joycon_subcmd_request *)buffer;
+	req->subcmd_id = JC_SUBCMD_SPI_FLASH_READ;
+	data = req->data;
+	put_unaligned_le32(start_addr, data);
+	data[4] = size;
+
+	hid_dbg(ctlr->hdev, "requesting SPI flash data\n");
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ);
+	if (ret) {
+		hid_err(ctlr->hdev, "failed reading SPI flash; ret=%d\n", ret);
+	} else {
+		report = (struct joycon_input_report *)ctlr->input_buf;
+		/* The read data starts at the 6th byte */
+		*reply = &report->reply.data[5];
+	}
+	return ret;
+}
+
+/*
+ * User calibration's presence is denoted with a magic byte preceding it.
+ * returns 0 if magic val is present, 1 if not present, < 0 on error
+ */
+static int joycon_check_for_cal_magic(struct joycon_ctlr *ctlr, u32 flash_addr)
+{
+	int ret;
+	u8 *reply;
+
+	ret = joycon_request_spi_flash_read(ctlr, flash_addr,
+					    JC_CAL_USR_MAGIC_SIZE, &reply);
+	if (ret)
+		return ret;
+
+	return reply[0] != JC_CAL_USR_MAGIC_0 || reply[1] != JC_CAL_USR_MAGIC_1;
+}
+
+static int joycon_read_stick_calibration(struct joycon_ctlr *ctlr, u16 cal_addr,
+					 struct joycon_stick_cal *cal_x,
+					 struct joycon_stick_cal *cal_y,
+					 bool left_stick)
+{
 	s32 x_max_above;
 	s32 x_min_below;
 	s32 y_max_above;
 	s32 y_min_below;
-	u8 *data;
 	u8 *raw_cal;
 	int ret;
 
-	req = (struct joycon_subcmd_request *)buffer;
-	req->subcmd_id = JC_SUBCMD_SPI_FLASH_READ;
-	data = req->data;
-	data[0] = 0xFF & JC_CAL_DATA_START;
-	data[1] = 0xFF & (JC_CAL_DATA_START >> 8);
-	data[2] = 0xFF & (JC_CAL_DATA_START >> 16);
-	data[3] = 0xFF & (JC_CAL_DATA_START >> 24);
-	data[4] = JC_CAL_DATA_SIZE;
+	ret = joycon_request_spi_flash_read(ctlr, cal_addr,
+					    JC_CAL_STICK_DATA_SIZE, &raw_cal);
+	if (ret)
+		return ret;
+
+	/* stick calibration parsing: note the order differs based on stick */
+	if (left_stick) {
+		x_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 0), 0,
+						12);
+		y_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 1), 4,
+						12);
+		cal_x->center = hid_field_extract(ctlr->hdev, (raw_cal + 3), 0,
+						  12);
+		cal_y->center = hid_field_extract(ctlr->hdev, (raw_cal + 4), 4,
+						  12);
+		x_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 6), 0,
+						12);
+		y_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 7), 4,
+						12);
+	} else {
+		cal_x->center = hid_field_extract(ctlr->hdev, (raw_cal + 0), 0,
+						  12);
+		cal_y->center = hid_field_extract(ctlr->hdev, (raw_cal + 1), 4,
+						  12);
+		x_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 3), 0,
+						12);
+		y_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 4), 4,
+						12);
+		x_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 6), 0,
+						12);
+		y_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 7), 4,
+						12);
+	}
+
+	cal_x->max = cal_x->center + x_max_above;
+	cal_x->min = cal_x->center - x_min_below;
+	cal_y->max = cal_y->center + y_max_above;
+	cal_y->min = cal_y->center - y_min_below;
+
+	return 0;
+}
+
+static const u16 DFLT_STICK_CAL_CEN = 2000;
+static const u16 DFLT_STICK_CAL_MAX = 3500;
+static const u16 DFLT_STICK_CAL_MIN = 500;
+static int joycon_request_calibration(struct joycon_ctlr *ctlr)
+{
+	u16 left_stick_addr = JC_CAL_FCT_DATA_LEFT_ADDR;
+	u16 right_stick_addr = JC_CAL_FCT_DATA_RIGHT_ADDR;
+	int ret;
 
 	hid_dbg(ctlr->hdev, "requesting cal data\n");
-	ret = joycon_send_subcmd(ctlr, req, 5, HZ);
+
+	/* check if user stick calibrations are present */
+	if (!joycon_check_for_cal_magic(ctlr, JC_CAL_USR_LEFT_MAGIC_ADDR)) {
+		left_stick_addr = JC_CAL_USR_LEFT_DATA_ADDR;
+		hid_info(ctlr->hdev, "using user cal for left stick\n");
+	} else {
+		hid_info(ctlr->hdev, "using factory cal for left stick\n");
+	}
+	if (!joycon_check_for_cal_magic(ctlr, JC_CAL_USR_RIGHT_MAGIC_ADDR)) {
+		right_stick_addr = JC_CAL_USR_RIGHT_DATA_ADDR;
+		hid_info(ctlr->hdev, "using user cal for right stick\n");
+	} else {
+		hid_info(ctlr->hdev, "using factory cal for right stick\n");
+	}
+
+	/* read the left stick calibration data */
+	ret = joycon_read_stick_calibration(ctlr, left_stick_addr,
+					    &ctlr->left_stick_cal_x,
+					    &ctlr->left_stick_cal_y,
+					    true);
 	if (ret) {
 		hid_warn(ctlr->hdev,
-			 "Failed to read stick cal, using defaults; ret=%d\n",
+			 "Failed to read left stick cal, using dflts; e=%d\n",
 			 ret);
 
 		ctlr->left_stick_cal_x.center = DFLT_STICK_CAL_CEN;
@@ -565,6 +680,17 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
 		ctlr->left_stick_cal_y.center = DFLT_STICK_CAL_CEN;
 		ctlr->left_stick_cal_y.max = DFLT_STICK_CAL_MAX;
 		ctlr->left_stick_cal_y.min = DFLT_STICK_CAL_MIN;
+	}
+
+	/* read the right stick calibration data */
+	ret = joycon_read_stick_calibration(ctlr, right_stick_addr,
+					    &ctlr->right_stick_cal_x,
+					    &ctlr->right_stick_cal_y,
+					    false);
+	if (ret) {
+		hid_warn(ctlr->hdev,
+			 "Failed to read right stick cal, using dflts; e=%d\n",
+			 ret);
 
 		ctlr->right_stick_cal_x.center = DFLT_STICK_CAL_CEN;
 		ctlr->right_stick_cal_x.max = DFLT_STICK_CAL_MAX;
@@ -573,44 +699,8 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
 		ctlr->right_stick_cal_y.center = DFLT_STICK_CAL_CEN;
 		ctlr->right_stick_cal_y.max = DFLT_STICK_CAL_MAX;
 		ctlr->right_stick_cal_y.min = DFLT_STICK_CAL_MIN;
-
-		return ret;
 	}
 
-	report = (struct joycon_input_report *)ctlr->input_buf;
-	raw_cal = &report->reply.data[5];
-
-	/* left stick calibration parsing */
-	cal_x = &ctlr->left_stick_cal_x;
-	cal_y = &ctlr->left_stick_cal_y;
-
-	x_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
-	y_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
-	cal_x->center = hid_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
-	cal_y->center = hid_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
-	x_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
-	y_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
-	cal_x->max = cal_x->center + x_max_above;
-	cal_x->min = cal_x->center - x_min_below;
-	cal_y->max = cal_y->center + y_max_above;
-	cal_y->min = cal_y->center - y_min_below;
-
-	/* right stick calibration parsing */
-	raw_cal += 9;
-	cal_x = &ctlr->right_stick_cal_x;
-	cal_y = &ctlr->right_stick_cal_y;
-
-	cal_x->center = hid_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
-	cal_y->center = hid_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
-	x_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
-	y_min_below = hid_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
-	x_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
-	y_max_above = hid_field_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
-	cal_x->max = cal_x->center + x_max_above;
-	cal_x->min = cal_x->center - x_min_below;
-	cal_y->max = cal_y->center + y_max_above;
-	cal_y->min = cal_y->center - y_min_below;
-
 	hid_dbg(ctlr->hdev, "calibration:\n"
 			    "l_x_c=%d l_x_max=%d l_x_min=%d\n"
 			    "l_y_c=%d l_y_max=%d l_y_min=%d\n"
-- 
2.31.1

