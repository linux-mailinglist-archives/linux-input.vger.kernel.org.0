Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D1C24EB67
	for <lists+linux-input@lfdr.de>; Sun, 23 Aug 2020 06:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgHWEml (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Aug 2020 00:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgHWEmc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Aug 2020 00:42:32 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626A5C061755
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:32 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id q9so4723809oth.5
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wq0/Pj1O8yYJggYmNDAaxhok80jCPLOBBgyuI0F4NKU=;
        b=LdVuAjutBI1rbyg4Ih3B8Fi9nyLIyhBg9X9sHQG5xueevnqimSpmaoID0o4JYq2SYo
         AVo0qGlMEjLjreSeeI7MYFcYBQgF1opcxV6PbCBm7vn0rIxMPiuV1lnPCMtbGHMk0JbZ
         V2LVHX2/gZGZikuc0Zjdmz/UwZbXhZeoxYN7ZBxI88e4IrI3JukSo2+qhDCjcVbjoypU
         PPlDyUMnhBF/Osj+9HIuRgJrDKvKK30MWAjrcrNzokyKcgKQ3nZX95cAHzE7lZr+6Egp
         ezYEcWp8nUilCaKdO5FSlZdn8E9gSfHr8nBu1bPNOx3auI4jQbLrt25k7A2R1Tigz9ho
         +/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wq0/Pj1O8yYJggYmNDAaxhok80jCPLOBBgyuI0F4NKU=;
        b=dwn7uk/pK348buwT9qEEFviwyW/HigjCG80w2oJt2Soyr7br1TZBe/QM8bHsxO+Xhi
         Bxb+iMwx6h+IZzQqeTh7PFUPGKUHUT0XA/5yhEvOfCVTawzVPHfyhBjdXLv0MK4KoGBY
         nVi6joOXn7eR6pq4seiREaD78xWqt/Fz9gSBqgLGlrCJwaVW1/I8ryJrIOMURJxEvDu8
         nmXTbdoFMaqzEzmUGp1rGgIR9hN9getDA9+ZWn/AyUElcv9Ya85im9OZaaccWpyLmmhR
         RqINzjG4ramcWR7MO642KIe4QLASDeL9Xj0tRfTRlV7L0bOpIoCWvZZmSALMJGPd6H/s
         Bwdg==
X-Gm-Message-State: AOAM532wzNdoJY9MHCWr5epSW5yVqTXDDtmoXyJ7guEi3X9LV1QIpzbW
        T3rp9NsjRYrvgS008qlBIVketZ11E1Q3RZiv
X-Google-Smtp-Source: ABdhPJzoNr92d60TK0HdGWXPsuhE8tAfbCpEBY31lM9mcQ33NChSBMz3I4SoFW/gAEbQvT1cBKmcfg==
X-Received: by 2002:a05:6830:1519:: with SMTP id k25mr273912otp.208.1598157751410;
        Sat, 22 Aug 2020 21:42:31 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id z10sm1308572otk.6.2020.08.22.21.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 21:42:30 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v12 12/14] HID: nintendo: add support for reading user calibration
Date:   Sat, 22 Aug 2020 23:41:55 -0500
Message-Id: <20200823044157.339677-13-djogorchock@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823044157.339677-1-djogorchock@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
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
index afb461d765b1..88a853570faf 100644
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
2.28.0

