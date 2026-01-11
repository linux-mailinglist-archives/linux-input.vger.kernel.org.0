Return-Path: <linux-input+bounces-16949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EAD0FE11
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 22:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A1073026F2D
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 21:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C5525D208;
	Sun, 11 Jan 2026 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="P0v5zrN2";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gJyhp0Y3"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4124225C80D;
	Sun, 11 Jan 2026 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165321; cv=none; b=stzJGGD7amAFQsM+I6WJiiwMkzcE0cbSM3UsgTZCrieNm3mAVeK/IvBI8AVpRpmyK0a3aNBV7+FiYfaDL78T4J3lmzFD6mLkLutoFJQZP4GLJ4y5+PUysj//Bm5V0Z796s9xyuXz/XGInp4gDWQ6aBrPuDYupEl+LhL5AifxiEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165321; c=relaxed/simple;
	bh=XOT3QHnEHf+j4tkADk806eVKgvjr6vy3r9RI/vgE5fI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/GSxCF0+k0gBTQl6AjY8KExmfcASJ1Q0Q3WLtPK6zpWG8FvslGE37Z02HrksdFtGQZCaptYgFHJAC37/3HWfajfy+aV+xQjNBMbyK0eHAWysTwNXZPjgdgKn+b7o/Hj46pSWdi8SmujHW4xsGRi1lX2NChNZibg4cFnumR9nIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=P0v5zrN2; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gJyhp0Y3; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dq7Gz0Mpdz9tRK;
	Sun, 11 Jan 2026 22:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768165307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bAp5wj1QsQkjO2feTn+Rz1NYt5n3zihw0ta7t0FIGAA=;
	b=P0v5zrN2TH3biPDv7CgQXnYHFXW/y0Y2k69EIqA/F90kEjJIMWeS5G/ETKqVvHLYQ9n5Ta
	GndsB7JSil1ab62yLeYdgUlBai7+r/NmUll08DIKQfL4Z386reBNh8TEAq+QvqL+IfLOzx
	1Gb23rJG43tkzqVqWAc5Brv/IsGaZbCcaTIEGkDdvF/C2DESJHrYK2CbDhsTQIy1xWKCqu
	eOD3sXPw43E2yiAN+EwFFpbPFVGtuWkkjOuB8mECwpU7+cEH3VAnDei4ACwxvW7t2jX1Oz
	oGC4t6zPDKkB/vvP/SujzWnA72RVxivov9+5DYdFsKqEtQTsXjmkqBa0cujMLQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gJyhp0Y3;
	spf=pass (outgoing_mbo_mout: domain of rosalie@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=rosalie@mailbox.org
From: Rosalie Wanders <rosalie@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768165305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bAp5wj1QsQkjO2feTn+Rz1NYt5n3zihw0ta7t0FIGAA=;
	b=gJyhp0Y3MG1OZ2BTkCSQHy2LU3RecwpizcJ28UT3RFI/lCgj0KYj/FjdXswFhznkdGb1kw
	rhwtRdqUdlSfZHCTLQxdzom0ppu2yAvvIh8ME63ChNW7/Koy9aE7iKJrXBOe4brY40vdQU
	jIHJmd8F0K9OC95KDpKFRZIb+SgrbGVn4J2op7TsuxROFq0ks0OFbpoA2l7GDz1LwYMuZg
	Md7Hb5iNki/tTA3ChRnOYTT5p9lT5igft/yMoVq/JLDuuWkvZC+RGVPVtByd8o0i05HSUk
	UMDMQL9i37eJzeKU3cAP/pHomxOjrm4JZOEDvNMRmVaNf5x6T2fKYuW4glFLYg==
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Rosalie Wanders <rosalie@mailbox.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: sony: add support for bluetooth Rock Band 4 PS4 guitars
Date: Sun, 11 Jan 2026 22:00:50 +0100
Message-ID: <20260111210051.51743-2-rosalie@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4b33427ea95a75bfb35
X-MBO-RS-META: e8q151kjfn5cxm5w1n4i1pz4x98nckwt
X-Rspamd-Queue-Id: 4dq7Gz0Mpdz9tRK

This commit adds support for the PDP Jaguar and MadCatz Stratocaster.

Signed-off-by: Rosalie Wanders <rosalie@mailbox.org>
---
 drivers/hid/hid-ids.h  | 12 ++++++++----
 drivers/hid/hid-sony.c | 24 +++++++++++++++---------
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d95768c8fe06..43f86061cab2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1101,6 +1101,11 @@
 #define USB_DEVICE_ID_ORTEK_WKB2000	0x2000
 #define USB_DEVICE_ID_ORTEK_IHOME_IMAC_A210S	0x8003
 
+#define USB_VENDOR_ID_PDP	0x0e6F
+#define USB_DEVICE_ID_PDP_PS4_JAGUAR	0x0173
+#define USB_DEVICE_ID_PDP_PS4_RIFFMASTER	0x024a
+#define USB_DEVICE_ID_PDP_PS5_RIFFMASTER	0x0249
+
 #define USB_VENDOR_ID_PLANTRONICS	0x047f
 #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3210_SERIES	0xc055
 #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES	0xc056
@@ -1149,10 +1154,6 @@
 #define USB_VENDOR_ID_POWERCOM		0x0d9f
 #define USB_DEVICE_ID_POWERCOM_UPS	0x0002
 
-#define USB_VENDOR_ID_PDP	0x0e6F
-#define USB_DEVICE_ID_PDP_PS4_RIFFMASTER	0x024a
-#define USB_DEVICE_ID_PDP_PS5_RIFFMASTER	0x0249
-
 #define USB_VENDOR_ID_PRODIGE		0x05af
 #define USB_DEVICE_ID_PRODIGE_CORDLESS	0x3062
 
@@ -1539,6 +1540,9 @@
 #define USB_VENDOR_ID_RISO_KAGAKU	0x1294	/* Riso Kagaku Corp. */
 #define USB_DEVICE_ID_RI_KA_WEBMAIL	0x1320	/* Webmail Notifier */
 
+#define USB_VENDOR_ID_MADCATZ	0x0738
+#define USB_DEVICE_ID_MADCATZ_PS4_STRATOCASTER	0x8261
+
 #define USB_VENDOR_ID_MULTIPLE_1781	0x1781
 #define USB_DEVICE_ID_RAPHNET_4NES4SNES_OLD	0x0a9d
 #define USB_DEVICE_ID_PHOENIXRC        0x0898
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index e2f17a99fa42..d0270ffec4f4 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -62,8 +62,9 @@
 #define GH_GUITAR_CONTROLLER      BIT(14)
 #define GHL_GUITAR_PS3WIIU        BIT(15)
 #define GHL_GUITAR_PS4            BIT(16)
-#define RB4_GUITAR_PS4            BIT(17)
-#define RB4_GUITAR_PS5            BIT(18)
+#define RB4_GUITAR_PS4_USB        BIT(17)
+#define RB4_GUITAR_PS4_BT         BIT(18)
+#define RB4_GUITAR_PS5            BIT(19)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -627,7 +628,6 @@ static int gh_guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 static int rb4_guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 			  struct hid_field *field, struct hid_usage *usage,
 			  unsigned long **bit, int *max)
-
 {
 	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_BUTTON) {
 		unsigned int key = usage->hid & HID_USAGE;
@@ -1041,7 +1041,10 @@ static int sony_raw_event(struct hid_device *hdev, struct hid_report *report,
 	} else if ((sc->quirks & NSG_MRXU_REMOTE) && rd[0] == 0x02) {
 		nsg_mrxu_parse_report(sc, rd, size);
 		return 1;
-	} else if ((sc->quirks & RB4_GUITAR_PS4) && rd[0] == 0x01 && size == 64) {
+	} else if ((sc->quirks & RB4_GUITAR_PS4_USB) && rd[0] == 0x01 && size == 64) {
+		rb4_ps4_guitar_parse_report(sc, rd, size);
+		return 1;
+	} else if ((sc->quirks & RB4_GUITAR_PS4_BT) && rd[0] == 0x01 && size == 78) {
 		rb4_ps4_guitar_parse_report(sc, rd, size);
 		return 1;
 	} else if ((sc->quirks & RB4_GUITAR_PS5) && rd[0] == 0x01 && size == 64) {
@@ -1098,7 +1101,7 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (sc->quirks & GH_GUITAR_CONTROLLER)
 		return gh_guitar_mapping(hdev, hi, field, usage, bit, max);
 
-	if (sc->quirks & RB4_GUITAR_PS4)
+	if (sc->quirks & (RB4_GUITAR_PS4_USB | RB4_GUITAR_PS4_BT))
 		return rb4_guitar_mapping(hdev, hi, field, usage, bit, max);
 
 	if (sc->quirks & RB4_GUITAR_PS5)
@@ -2119,8 +2122,6 @@ static int sony_input_configured(struct hid_device *hdev,
 
 	} else if (sc->quirks & MOTION_CONTROLLER) {
 		sony_init_output_report(sc, motion_send_output_report);
-	} else if (sc->quirks & (RB4_GUITAR_PS4 | RB4_GUITAR_PS5)) {
-		sc->input_dev = hidinput->input;
 	}
 
 	if (sc->quirks & SONY_LED_SUPPORT) {
@@ -2148,6 +2149,7 @@ static int sony_input_configured(struct hid_device *hdev,
 			goto err_close;
 	}
 
+	sc->input_dev = hidinput->input;
 	return 0;
 err_close:
 	hid_hw_close(hdev);
@@ -2378,9 +2380,13 @@ static const struct hid_device_id sony_devices[] = {
 		.driver_data = GHL_GUITAR_PS4 | GH_GUITAR_CONTROLLER },
 	/* Rock Band 4 PS4 guitars */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PDP, USB_DEVICE_ID_PDP_PS4_RIFFMASTER),
-		.driver_data = RB4_GUITAR_PS4 },
+		.driver_data = RB4_GUITAR_PS4_USB },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CRKD, USB_DEVICE_ID_CRKD_PS4_GIBSON_SG),
-		.driver_data = RB4_GUITAR_PS4 },
+		.driver_data = RB4_GUITAR_PS4_USB },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_PDP, USB_DEVICE_ID_PDP_PS4_JAGUAR),
+		.driver_data = RB4_GUITAR_PS4_BT },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_PS4_STRATOCASTER),
+		.driver_data = RB4_GUITAR_PS4_BT },
 	/* Rock Band 4 PS5 guitars */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PDP, USB_DEVICE_ID_PDP_PS5_RIFFMASTER),
 		.driver_data = RB4_GUITAR_PS5 },
-- 
2.52.0


