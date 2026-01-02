Return-Path: <linux-input+bounces-16772-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416ACEF575
	for <lists+linux-input@lfdr.de>; Fri, 02 Jan 2026 22:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C255300671B
	for <lists+linux-input@lfdr.de>; Fri,  2 Jan 2026 21:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6926D2D543E;
	Fri,  2 Jan 2026 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="waczKhOT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ed+Pd548"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E613219A8D;
	Fri,  2 Jan 2026 21:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767388449; cv=none; b=qpSiasRzh+8MP0q8x0sTovvYvaBS4gj0y9G8yPEAsQ7TKE2Y2Y4uvshPlqGAf1slfAm++upGha5L2xbXwI1GLYjtGBWWYlmETJmqLIgpQxo6OR8lnYLMZGPS/lhXCaZeYbI36SoNx/p7BIUiI7/9gb/iZHWAv8O1TKSU+x4XYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767388449; c=relaxed/simple;
	bh=SsaKR+J9XtKckH5zCvDZIq2wUpJsh8zJBqPjYHH7Lno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfnRZGasdRC0Ow7/GEzD9JHixx4WWmVbif+KWQIfT28N/H4gXjL89tK5Yy5CQfpDNkr3n3M477EhVN9TefAOC78/3dQq7t6BzHPHEi7VfZX7txvSfN/LDU02jgcKZEHWlvEsyEDjYNjItPqDN4kuA5DmRJUn3UOAof2FPA7zNzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=waczKhOT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ed+Pd548; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4djbzB4jjHz9t46;
	Fri,  2 Jan 2026 22:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767388438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lLkTHuMkudXtEPTykF1U6V6o9oJpwQcyrEzFjSnEBUU=;
	b=waczKhOTm0vjEvSsd/MqO9WlsAsliZSbGsvSZrABZTGZMHlphndIluY1GwqLlgjbZlN8yZ
	aTsPirf2q2f5Ps5yg3KbUy37Vbbr5JKkTk3ELoLabr0Y1RPY7Iy2XPgyPVL08iHkv653kx
	IcJwVxbUhZ/+XaIK6qrdlxl3M+am9gVXzlbe3FT4jCq6Qzu3guqd2Kj3doYKm/hlNUR6+6
	gvGVuj0/jlobkbRDEYjhjPOZMeMi6Rl0PQIpsZFR3N6tVLUXk7VR34sx4PNqf34OGJWSa+
	nHWEPzPkbjEe1T6HYTqjEeSACRsyPhXIE+vNAh/usAfPpS7D3T5brebrKUUKsQ==
From: Rosalie Wanders <rosalie@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767388436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lLkTHuMkudXtEPTykF1U6V6o9oJpwQcyrEzFjSnEBUU=;
	b=Ed+Pd5480d7YyT+S6B9vJ+SczKU5xkWYNW37SIS6yJjRVpYb2VNoOCBXbjxgJEtKNnzfRm
	O7ZMA6Sa7ID6/hJhXYkTiVS+K7w1DQ502G4JQVniBxX/70+IPH2tanRGDRmD3yu2gjEHnw
	92uUa1kFHxe2lqt9IoGI2brv+9EUWMnm7fEEGRlvs6nXKbvL75Ocm63/ybp0IhsMO+1Upu
	ZifoMlOtx28N8kT9y5BgAXf+JHuTQRjXeyo3roRHjsjxBUfxIG1/sJUkJvZ1A9XfOnwTQ9
	VQ2L5ixp2AhVSC54p2ru44tj2Rhnk+EdCY3J97FL0m1yZRIsumgL7Rt9GpcdvA==
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Rosalie Wanders <rosalie@mailbox.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: sony: add support for Rock Band 4 PS4 and PS5 guitars
Date: Fri,  2 Jan 2026 22:12:28 +0100
Message-ID: <20260102211228.82324-2-rosalie@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tjeyhz6b6ek9c869yx4qy3fnm4wiw1hz
X-MBO-RS-ID: 285212e62f265e113dc

This commit adds support for the PDP RiffMaster and the CRKD Gibson SG
in both their PS4 and PS5 modes.

These devices aren't mapped correctly without these changes, they also
lack support for their whammy and tilt functionality which this patch
adds support for by binding them to the left and right triggers.

Signed-off-by: Rosalie Wanders <rosalie@mailbox.org>
---
 drivers/hid/Kconfig    |   4 +-
 drivers/hid/hid-ids.h  |   8 +++
 drivers/hid/hid-sony.c | 119 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 127 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 920a64b66b25..932e4110bb38 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1084,7 +1084,7 @@ config HID_SIGMAMICRO
 	  - Rapoo V500
 
 config HID_SONY
-	tristate "Sony PS2/3/4 accessories"
+	tristate "Sony PS2/3/4/5 accessories"
 	depends on USB_HID
 	depends on NEW_LEDS
 	depends on LEDS_CLASS
@@ -1094,12 +1094,12 @@ config HID_SONY
 	Support for
 
 	  * Sony PS3 6-axis controllers
-	  * Sony PS4 DualShock 4 controllers
 	  * Buzz controllers
 	  * Sony PS3 Blue-ray Disk Remote Control (Bluetooth)
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
 	  * Guitar Hero Live PS3, Wii U and PS4 guitar dongles
 	  * Guitar Hero PS3 and PC guitar dongles
+	  * Rock Band 4 PS4 and PS5 guitars
 
 config SONY_FF
 	bool "Sony PS2/3/4 accessories force feedback support"
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d31711f1aaec..d95768c8fe06 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -363,6 +363,10 @@
 #define USB_DEVICE_ID_PRODIKEYS_PCMIDI	0x2801
 #define USB_DEVICE_ID_CREATIVE_SB0540	0x3100
 
+#define USB_VENDOR_ID_CRKD	0x3651
+#define USB_DEVICE_ID_CRKD_PS4_GIBSON_SG	0x1500
+#define USB_DEVICE_ID_CRKD_PS5_GIBSON_SG	0x1600
+
 #define USB_VENDOR_ID_CVTOUCH		0x1ff7
 #define USB_DEVICE_ID_CVTOUCH_SCREEN	0x0013
 
@@ -1145,6 +1149,10 @@
 #define USB_VENDOR_ID_POWERCOM		0x0d9f
 #define USB_DEVICE_ID_POWERCOM_UPS	0x0002
 
+#define USB_VENDOR_ID_PDP	0x0e6F
+#define USB_DEVICE_ID_PDP_PS4_RIFFMASTER	0x024a
+#define USB_DEVICE_ID_PDP_PS5_RIFFMASTER	0x0249
+
 #define USB_VENDOR_ID_PRODIGE		0x05af
 #define USB_DEVICE_ID_PRODIGE_CORDLESS	0x3062
 
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index b966e4044238..e2f17a99fa42 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -14,6 +14,7 @@
  *  Copyright (c) 2020-2021 Pascal Giard <pascal.giard@etsmtl.ca>
  *  Copyright (c) 2020 Sanjay Govind <sanjay.govind9@gmail.com>
  *  Copyright (c) 2021 Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
+ *  Copyright (c) 2026 Rosalie Wanders <rosalie@mailbox.org>
  */
 
 /*
@@ -61,6 +62,8 @@
 #define GH_GUITAR_CONTROLLER      BIT(14)
 #define GHL_GUITAR_PS3WIIU        BIT(15)
 #define GHL_GUITAR_PS4            BIT(16)
+#define RB4_GUITAR_PS4            BIT(17)
+#define RB4_GUITAR_PS5            BIT(18)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -418,6 +421,27 @@ static const unsigned int sixaxis_keymap[] = {
 	[0x11] = BTN_MODE, /* PS */
 };
 
+static const unsigned int rb4_absmap[] = {
+	[0x30] = ABS_X,
+	[0x31] = ABS_Y,
+};
+
+static const unsigned int rb4_keymap[] = {
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
@@ -484,6 +508,7 @@ struct sony_sc {
 	spinlock_t lock;
 	struct list_head list_node;
 	struct hid_device *hdev;
+	struct input_dev *input_dev;
 	struct input_dev *touchpad;
 	struct input_dev *sensor_dev;
 	struct led_classdev *leds[MAX_LEDS];
@@ -584,7 +609,7 @@ static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev,
 	return 0;
 }
 
-static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
+static int gh_guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 			  struct hid_field *field, struct hid_usage *usage,
 			  unsigned long **bit, int *max)
 {
@@ -599,6 +624,38 @@ static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
+static int rb4_guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
+			  struct hid_field *field, struct hid_usage *usage,
+			  unsigned long **bit, int *max)
+
+{
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_BUTTON) {
+		unsigned int key = usage->hid & HID_USAGE;
+
+		if (key >= ARRAY_SIZE(rb4_keymap))
+			return 0;
+
+		key = rb4_keymap[key];
+		hid_map_usage_clear(hi, usage, bit, max, EV_KEY, key);
+		return 1;
+	} else if ((usage->hid & HID_USAGE_PAGE) == HID_UP_GENDESK) {
+		unsigned int abs = usage->hid & HID_USAGE;
+
+		/* Let the HID parser deal with the HAT. */
+		if (usage->hid == HID_GD_HATSWITCH)
+			return 0;
+
+		if (abs >= ARRAY_SIZE(rb4_absmap))
+			return 0;
+
+		abs = rb4_absmap[abs];
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
@@ -915,6 +972,40 @@ static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	input_sync(sc->touchpad);
 }
 
+static void rb4_ps4_guitar_parse_report(struct sony_sc *sc, u8 *rd, int size)
+{
+	/*
+	 * Rock Band 4 PS4 guitars have whammy and
+	 * tilt functionality, they're located at
+	 * byte 44 and 45 respectively.
+	 *
+	 * We will map these values to the triggers
+	 * because the guitars don't have anything
+	 * mapped there.
+	 */
+	input_report_abs(sc->input_dev, ABS_Z, rd[44]);
+	input_report_abs(sc->input_dev, ABS_RZ, rd[45]);
+
+	input_sync(sc->input_dev);
+}
+
+static void rb4_ps5_guitar_parse_report(struct sony_sc *sc, u8 *rd, int size)
+{
+	/*
+	 * Rock Band 4 PS5 guitars have whammy and
+	 * tilt functionality, they're located at
+	 * byte 41 and 42 respectively.
+	 *
+	 * We will map these values to the triggers
+	 * because the guitars don't have anything
+	 * mapped there.
+	 */
+	input_report_abs(sc->input_dev, ABS_Z, rd[41]);
+	input_report_abs(sc->input_dev, ABS_RZ, rd[42]);
+
+	input_sync(sc->input_dev);
+}
+
 static int sony_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *rd, int size)
 {
@@ -950,6 +1041,12 @@ static int sony_raw_event(struct hid_device *hdev, struct hid_report *report,
 	} else if ((sc->quirks & NSG_MRXU_REMOTE) && rd[0] == 0x02) {
 		nsg_mrxu_parse_report(sc, rd, size);
 		return 1;
+	} else if ((sc->quirks & RB4_GUITAR_PS4) && rd[0] == 0x01 && size == 64) {
+		rb4_ps4_guitar_parse_report(sc, rd, size);
+		return 1;
+	} else if ((sc->quirks & RB4_GUITAR_PS5) && rd[0] == 0x01 && size == 64) {
+		rb4_ps5_guitar_parse_report(sc, rd, size);
+		return 1;
 	}
 
 	if (sc->defer_initialization) {
@@ -999,7 +1096,13 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
 		return sixaxis_mapping(hdev, hi, field, usage, bit, max);
 
 	if (sc->quirks & GH_GUITAR_CONTROLLER)
-		return guitar_mapping(hdev, hi, field, usage, bit, max);
+		return gh_guitar_mapping(hdev, hi, field, usage, bit, max);
+
+	if (sc->quirks & RB4_GUITAR_PS4)
+		return rb4_guitar_mapping(hdev, hi, field, usage, bit, max);
+
+	if (sc->quirks & RB4_GUITAR_PS5)
+		return rb4_guitar_mapping(hdev, hi, field, usage, bit, max);
 
 	/* Let hid-core decide for the others */
 	return 0;
@@ -2016,6 +2119,8 @@ static int sony_input_configured(struct hid_device *hdev,
 
 	} else if (sc->quirks & MOTION_CONTROLLER) {
 		sony_init_output_report(sc, motion_send_output_report);
+	} else if (sc->quirks & (RB4_GUITAR_PS4 | RB4_GUITAR_PS5)) {
+		sc->input_dev = hidinput->input;
 	}
 
 	if (sc->quirks & SONY_LED_SUPPORT) {
@@ -2271,6 +2376,16 @@ static const struct hid_device_id sony_devices[] = {
 	/* Guitar Hero Live PS4 guitar dongles */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_REDOCTANE, USB_DEVICE_ID_REDOCTANE_PS4_GHLIVE_DONGLE),
 		.driver_data = GHL_GUITAR_PS4 | GH_GUITAR_CONTROLLER },
+	/* Rock Band 4 PS4 guitars */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_PDP, USB_DEVICE_ID_PDP_PS4_RIFFMASTER),
+		.driver_data = RB4_GUITAR_PS4 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CRKD, USB_DEVICE_ID_CRKD_PS4_GIBSON_SG),
+		.driver_data = RB4_GUITAR_PS4 },
+	/* Rock Band 4 PS5 guitars */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_PDP, USB_DEVICE_ID_PDP_PS5_RIFFMASTER),
+		.driver_data = RB4_GUITAR_PS5 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CRKD, USB_DEVICE_ID_CRKD_PS5_GIBSON_SG),
+		.driver_data = RB4_GUITAR_PS5 },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, sony_devices);
-- 
2.52.0


