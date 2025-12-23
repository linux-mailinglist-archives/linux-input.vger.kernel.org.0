Return-Path: <linux-input+bounces-16682-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5BCDAC95
	for <lists+linux-input@lfdr.de>; Wed, 24 Dec 2025 00:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A1F2301142A
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 23:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D3819309C;
	Tue, 23 Dec 2025 23:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vEv9qqFu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GNcgaSOU"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2474BE1;
	Tue, 23 Dec 2025 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766530854; cv=none; b=kUnrawIbCv3VMDFmSBbaBZ1iRtPWankJQT8mUvt9dYIcd5Fypm+X+ypE4z2x9UbEG6Y/f8dl3kqx/dAQCxgPm1TLmuFVlkV3Tajaedh4MvJtfQrDt8CCdLRk1f6w7lDTbZxQ0HNyCpZ655prFtogMZboFaJ3WIGVSzaZppNc5jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766530854; c=relaxed/simple;
	bh=RJj5LXz6N2yhbxBQzjGaJKsAokCv3VFYDZOjdPixagQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnOBCB4t6xuozMr8qcdg5Gr6OapOiJD3ohDyjT+IkSZd2XsR3p3pmBUjHagTvS0cmPWlcf5BH3GynCtTFyPmTwWp4TL3/1qmySd5amBXUIlysBp8Nb1rNVp4TXWMJHKmPZ76ptMO3vylEHK6hL/lMPRapA7Pt3Geg1ulGtphzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vEv9qqFu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GNcgaSOU; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dbVq05x8Hz9sr5;
	Wed, 24 Dec 2025 00:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766530844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rVSKaiuZieN13W0rJmRD6PRMp7iwI7WVVFQtnAtIorY=;
	b=vEv9qqFuIrxztdQYS5W1SdSRfpY8yn98ucPZsLFTZFw1GX6y/6RZMEVWVAL0P33bbTM4s0
	8rX7Ttby1cua4iNfYmV75U+INMpRNj77zPOrlsTG24RhosksvxaRUciotjQ3no2y0nqZbs
	jSizkOt1v1DOSPh4qN4fGTI8KHO+0bWOD5Jbu9qQSKaL4WRb8aTbr5x95NPkb/aTCTYW/E
	nzxdjwNShapGaS//SG0qE2rTvWD3y5s0OrbEmMiU7aCgHS8s1RhrkQd3zmlZWcdQ6aXv8T
	0+7rwVp5W62uO805nEJuAfNMUm0MnB03hsItyPr4usmlFh7Fa04Mfzl0IYU0Lg==
From: Rosalie Wanders <rosalie@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766530843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rVSKaiuZieN13W0rJmRD6PRMp7iwI7WVVFQtnAtIorY=;
	b=GNcgaSOUj7O5cWuld5c4mVEoRkm0t57Gz2pOxuhCPc7sIgHFRk1pwPVceGzoCezdZ1lt6F
	lWkVWQWSGcz+RzPMWEooommXT+91WkYys1YJu3+2uLIMbRCjBgw2EH0UXugeRRgQTOSacr
	ax0fDccFI0rdB6iiD6GsADFTx5tiJf2aHctc+0tBAeeRUAVCIid8ny3VtLnc66hDigSmqn
	tSqSOMiJ49m7RCrjUX0aq/GPTHInCLc75bb7XgJiQaFD47BtG2Vm78U+n98iJKnzrHw5/n
	NBuqRUw3yBSyNAQFhbgOS+nKxjA+VsrHtSHtpuYEMcQkTf+7USVtgwIkHNJ0/Q==
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Rosalie Wanders <rosalie@mailbox.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: sony: support for Rock Band 4 PS4 dongles
Date: Tue, 23 Dec 2025 23:59:51 +0100
Message-ID: <20251223225952.27245-1-rosalie@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5smpfb15az965ws7zzroe8fm8ed84r5i
X-MBO-RS-ID: edb3e03dfe29ca84079

This commits adds support for all Rock Band 4 PS4 dongles.

These devices aren't mapped correctly without these changes,
they also lack support for the 'whammy' and 'tilt' functionality
which this patch adds support for too by binding them to the
left and right triggers.

Signed-off-by: Rosalie Wanders <rosalie@mailbox.org>
---
 drivers/hid/Kconfig    |  1 +
 drivers/hid/hid-ids.h  |  7 ++++
 drivers/hid/hid-sony.c | 91 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 920a64b66b25..78fe170c6e9c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1100,6 +1100,7 @@ config HID_SONY
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
 	  * Guitar Hero Live PS3, Wii U and PS4 guitar dongles
 	  * Guitar Hero PS3 and PC guitar dongles
+	  * Rock Band 4 PS4 guitar dongles
 
 config SONY_FF
 	bool "Sony PS2/3/4 accessories force feedback support"
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d31711f1aaec..909a8ab6a784 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1145,6 +1145,10 @@
 #define USB_VENDOR_ID_POWERCOM		0x0d9f
 #define USB_DEVICE_ID_POWERCOM_UPS	0x0002
 
+#define USB_VENDOR_ID_PDP	0x0e6F
+#define USB_DEVICE_ID_PDP_PS4_JAGUAR_DONGLE	0x0173
+#define USB_DEVICE_ID_PDP_PS4_RIFFMASTER_DONGLE	0x024a
+
 #define USB_VENDOR_ID_PRODIGE		0x05af
 #define USB_DEVICE_ID_PRODIGE_CORDLESS	0x3062
 
@@ -1531,6 +1535,9 @@
 #define USB_VENDOR_ID_RISO_KAGAKU	0x1294	/* Riso Kagaku Corp. */
 #define USB_DEVICE_ID_RI_KA_WEBMAIL	0x1320	/* Webmail Notifier */
 
+#define USB_VENDOR_ID_MADCATZ	0x0738
+#define USB_DEVICE_ID_MADCATZ_PS4_STRATOCOASTER_DONGLE	0x8261
+
 #define USB_VENDOR_ID_MULTIPLE_1781	0x1781
 #define USB_DEVICE_ID_RAPHNET_4NES4SNES_OLD	0x0a9d
 #define USB_DEVICE_ID_PHOENIXRC        0x0898
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index b966e4044238..4287dc5abc86 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -14,6 +14,7 @@
  *  Copyright (c) 2020-2021 Pascal Giard <pascal.giard@etsmtl.ca>
  *  Copyright (c) 2020 Sanjay Govind <sanjay.govind9@gmail.com>
  *  Copyright (c) 2021 Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
+ *  Copyright (c) 2025 Rosalie Wanders <rosalie@mailbox.org>
  */
 
 /*
@@ -61,6 +62,7 @@
 #define GH_GUITAR_CONTROLLER      BIT(14)
 #define GHL_GUITAR_PS3WIIU        BIT(15)
 #define GHL_GUITAR_PS4            BIT(16)
+#define RB4_GUITAR_PS4            BIT(17)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -418,6 +420,27 @@ static const unsigned int sixaxis_keymap[] = {
 	[0x11] = BTN_MODE, /* PS */
 };
 
+static const unsigned int rb4_ps4_absmap[] = {
+	[0x30] = ABS_X,
+	[0x31] = ABS_Y,
+};
+
+static const unsigned int rb4_ps4_keymap[] = {
+	[0x1] = BTN_WEST, /* Square */
+	[0x2] = BTN_SOUTH, /* Cross */
+	[0x3] = BTN_EAST, /* Circle */
+	[0x4] = BTN_NORTH, /* Triangle */
+	[0x5] = BTN_TL, /* L1 */
+	[0x6] = BTN_TR, /* R1 */
+	[0x7] = BTN_TL2, /* L2 */
+	[0x8] = BTN_TR2, /* R2 */
+	[0x9] = BTN_SELECT, /* Share */
+	[0xa] = BTN_START, /* Options */
+	[0xb] = BTN_THUMBL, /* L3 */
+	[0xc] = BTN_THUMBR, /* R3 */
+	[0xd] = BTN_MODE, /* PS */
+};
+
 static enum power_supply_property sony_battery_props[] = {
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_CAPACITY,
@@ -484,6 +507,7 @@ struct sony_sc {
 	spinlock_t lock;
 	struct list_head list_node;
 	struct hid_device *hdev;
+	struct input_dev *input_dev;
 	struct input_dev *touchpad;
 	struct input_dev *sensor_dev;
 	struct led_classdev *leds[MAX_LEDS];
@@ -584,7 +608,7 @@ static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev,
 	return 0;
 }
 
-static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
+static int ghguitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 			  struct hid_field *field, struct hid_usage *usage,
 			  unsigned long **bit, int *max)
 {
@@ -599,6 +623,38 @@ static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
+static int rb4guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
+			  struct hid_field *field, struct hid_usage *usage,
+			  unsigned long **bit, int *max)
+
+{
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_BUTTON) {
+		unsigned int key = usage->hid & HID_USAGE;
+
+		if (key >= ARRAY_SIZE(rb4_ps4_keymap))
+			return 0;
+
+		key = rb4_ps4_keymap[key];
+		hid_map_usage_clear(hi, usage, bit, max, EV_KEY, key);
+		return 1;
+	} else if ((usage->hid & HID_USAGE_PAGE) == HID_UP_GENDESK) {
+		unsigned int abs = usage->hid & HID_USAGE;
+
+		/* Let the HID parser deal with the HAT. */
+		if (usage->hid == HID_GD_HATSWITCH)
+			return 0;
+
+		if (abs >= ARRAY_SIZE(rb4_ps4_absmap))
+			return 0;
+
+		abs = rb4_ps4_absmap[abs];
+		hid_map_usage_clear(hi, usage, bit, max, EV_ABS, abs);
+		return 1;
+	}
+
+	return 0;
+}
+
 static const u8 *motion_fixup(struct hid_device *hdev, u8 *rdesc,
 			      unsigned int *rsize)
 {
@@ -915,6 +971,22 @@ static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	input_sync(sc->touchpad);
 }
 
+static void rb4_guitar_parse_report(struct sony_sc *sc, u8 *rd, int size)
+{
+	/*
+	 * Rock Band 4 PS4 guitars have whammy and
+	 * tilt functionality, they're located at
+	 * byte 44 and 45 respectively.
+	 * We will map these values to the triggers
+	 * because the guitars don't have anything
+	 * mapped there
+	 */
+	input_report_abs(sc->input_dev, ABS_Z, rd[44]);
+	input_report_abs(sc->input_dev, ABS_RZ, rd[45]);
+
+	input_sync(sc->input_dev);
+}
+
 static int sony_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *rd, int size)
 {
@@ -950,6 +1022,9 @@ static int sony_raw_event(struct hid_device *hdev, struct hid_report *report,
 	} else if ((sc->quirks & NSG_MRXU_REMOTE) && rd[0] == 0x02) {
 		nsg_mrxu_parse_report(sc, rd, size);
 		return 1;
+	} else if ((sc->quirks & RB4_GUITAR_PS4) && rd[0] == 0x01 && size == 64) {
+		rb4_guitar_parse_report(sc, rd, size);
+		return 1;
 	}
 
 	if (sc->defer_initialization) {
@@ -999,7 +1074,10 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
 		return sixaxis_mapping(hdev, hi, field, usage, bit, max);
 
 	if (sc->quirks & GH_GUITAR_CONTROLLER)
-		return guitar_mapping(hdev, hi, field, usage, bit, max);
+		return ghguitar_mapping(hdev, hi, field, usage, bit, max);
+
+	if (sc->quirks & RB4_GUITAR_PS4)
+		return rb4guitar_mapping(hdev, hi, field, usage, bit, max);
 
 	/* Let hid-core decide for the others */
 	return 0;
@@ -2016,6 +2094,8 @@ static int sony_input_configured(struct hid_device *hdev,
 
 	} else if (sc->quirks & MOTION_CONTROLLER) {
 		sony_init_output_report(sc, motion_send_output_report);
+	} else if (sc->quirks & RB4_GUITAR_PS4) {
+		sc->input_dev = hidinput->input;
 	}
 
 	if (sc->quirks & SONY_LED_SUPPORT) {
@@ -2271,6 +2351,13 @@ static const struct hid_device_id sony_devices[] = {
 	/* Guitar Hero Live PS4 guitar dongles */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_REDOCTANE, USB_DEVICE_ID_REDOCTANE_PS4_GHLIVE_DONGLE),
 		.driver_data = GHL_GUITAR_PS4 | GH_GUITAR_CONTROLLER },
+	/* Rock Band 4 PS4 guitar dongles */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_PDP, USB_DEVICE_ID_PDP_PS4_RIFFMASTER_DONGLE),
+		.driver_data = RB4_GUITAR_PS4 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_PDP, USB_DEVICE_ID_PDP_PS4_JAGUAR_DONGLE),
+		.driver_data = RB4_GUITAR_PS4 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_PS4_STRATOCOASTER_DONGLE),
+		.driver_data = RB4_GUITAR_PS4 },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, sony_devices);
-- 
2.52.0


