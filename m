Return-Path: <linux-input+bounces-8217-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB509D6FEA
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2024 14:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC8C0281ED7
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2024 13:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC381FAC40;
	Sun, 24 Nov 2024 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQyDAILX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEFF1FAC3B;
	Sun, 24 Nov 2024 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452952; cv=none; b=CEcu7P3UD7tZlnykEAlv6c7Uxv4lpe/ed0ij+mzseazpg2650mG3JR5wbxgu7pzCIAB2PX2Q7my6v1fg8XhSYuCfWx8NsspPh8my5HeB0Yz5wLSFGOUXs3KgqoIIhGjuN5YQwI9qYAU0k2sIEGPz4x3doi0z8NHU/E9tHNYKUuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452952; c=relaxed/simple;
	bh=g0BibJLeN17rS6ml5me4L/IRwSiuw45e+hTxPBM6Osw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvUjxa8IHWs6vL702LinnnbNJxjnvzmtXPP31uuI57sT72+9ikvOkC44Mip4GE84h3PY85pfZG15a3fjZUVgujgncYD3N0y9Bhvhed5LEmlTDqnUzGU1khEKkxLlnE/sQzK55Gfezt/mlY+pIkSXojSFgQRyJzaRwm49CHYy2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQyDAILX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7F5C4CED1;
	Sun, 24 Nov 2024 12:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452952;
	bh=g0BibJLeN17rS6ml5me4L/IRwSiuw45e+hTxPBM6Osw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQyDAILXqglt0ZmanRL+B3quSUUeIEoRuUtLlmngjO4t6fPlzWiUfOW2UyJzbmapY
	 uAJcVlHc3VEH5o72BLGrS4Ym9juQTAtb05ynQGy02vi20dzE7TG/RWkkkh2isrqlIi
	 Txa1Ea6JlBNCyzwbg2xtATzR+AlykM2VfBONjU/k0snAGUB53yjajF9hg+cbMd4r7V
	 a1R20o47I3ZM69TdYD8FMkwQv3qWEq8894TMshCVPqsGU/g/Jee0FnJKi3k96js+7D
	 mAcOCn2hKuIUIT9lgU5aqhW/NpRURvS4EULd4CQcXqigGERpMfelgA3HRcPPA4k6ko
	 SdvwW+q3vLDVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Callahan Kovacs <callahankovacs@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 9/9] HID: magicmouse: Apple Magic Trackpad 2 USB-C driver support
Date: Sun, 24 Nov 2024 07:54:23 -0500
Message-ID: <20241124125515.3340625-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125515.3340625-1-sashal@kernel.org>
References: <20241124125515.3340625-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Callahan Kovacs <callahankovacs@gmail.com>

[ Upstream commit 87a2f10395c82c2b4687bb8611a6c5663a12f9e7 ]

Adds driver support for the USB-C model of Apple's Magic Trackpad 2.

The 2024 USB-C model is compatible with the existing Magic Trackpad 2
driver but has a different hardware ID.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219470
Signed-off-by: Callahan Kovacs <callahankovacs@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h        |  1 +
 drivers/hid/hid-magicmouse.c | 56 ++++++++++++++++++++++++++----------
 2 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index f1c106f5e90b9..790966e5b6ec4 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -94,6 +94,7 @@
 #define USB_DEVICE_ID_APPLE_MAGICMOUSE2	0x0269
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD	0x030e
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2	0x0265
+#define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC	0x0324
 #define USB_DEVICE_ID_APPLE_FOUNTAIN_ANSI	0x020e
 #define USB_DEVICE_ID_APPLE_FOUNTAIN_ISO	0x020f
 #define USB_DEVICE_ID_APPLE_GEYSER_ANSI	0x0214
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index c9c968d4b36a3..9bb8daf7f7860 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -224,7 +224,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 		touch_minor = tdata[4];
 		state = tdata[7] & TOUCH_STATE_MASK;
 		down = state != TOUCH_STATE_NONE;
-	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		   input->id.product ==
+			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		id = tdata[8] & 0xf;
 		x = (tdata[1] << 27 | tdata[0] << 19) >> 19;
 		y = -((tdata[3] << 30 | tdata[2] << 22 | tdata[1] << 14) >> 19);
@@ -256,8 +258,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 	/* If requested, emulate a scroll wheel by detecting small
 	 * vertical touch motions.
 	 */
-	if (emulate_scroll_wheel && (input->id.product !=
-			USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)) {
+	if (emulate_scroll_wheel &&
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		unsigned long now = jiffies;
 		int step_x = msc->touches[id].scroll_x - x;
 		int step_y = msc->touches[id].scroll_y - y;
@@ -356,7 +359,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 		input_report_abs(input, ABS_MT_POSITION_X, x);
 		input_report_abs(input, ABS_MT_POSITION_Y, y);
 
-		if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)
+		if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		    input->id.product ==
+			    USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC)
 			input_report_abs(input, ABS_MT_PRESSURE, pressure);
 
 		if (report_undeciphered) {
@@ -364,7 +369,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
 				input_event(input, EV_MSC, MSC_RAW, tdata[7]);
 			else if (input->id.product !=
-					USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)
+					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+				 input->id.product !=
+					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC)
 				input_event(input, EV_MSC, MSC_RAW, tdata[8]);
 		}
 	}
@@ -490,7 +497,9 @@ static int magicmouse_raw_event(struct hid_device *hdev,
 		magicmouse_emit_buttons(msc, clicks & 3);
 		input_report_rel(input, REL_X, x);
 		input_report_rel(input, REL_Y, y);
-	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		   input->id.product ==
+			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		input_mt_sync_frame(input);
 		input_report_key(input, BTN_MOUSE, clicks & 1);
 	} else { /* USB_DEVICE_ID_APPLE_MAGICTRACKPAD */
@@ -542,7 +551,9 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 			__set_bit(REL_WHEEL_HI_RES, input->relbit);
 			__set_bit(REL_HWHEEL_HI_RES, input->relbit);
 		}
-	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		   input->id.product ==
+			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		/* If the trackpad has been connected to a Mac, the name is
 		 * automatically personalized, e.g., "José Expósito's Trackpad".
 		 * When connected through Bluetooth, the personalized name is
@@ -618,7 +629,9 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 				  MOUSE_RES_X);
 		input_abs_set_res(input, ABS_MT_POSITION_Y,
 				  MOUSE_RES_Y);
-	} else if (input->id.product ==  USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		   input->id.product ==
+			   USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		input_set_abs_params(input, ABS_MT_PRESSURE, 0, 253, 0, 0);
 		input_set_abs_params(input, ABS_PRESSURE, 0, 253, 0, 0);
 		input_set_abs_params(input, ABS_MT_ORIENTATION, -3, 4, 0, 0);
@@ -657,7 +670,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 	input_set_events_per_packet(input, 60);
 
 	if (report_undeciphered &&
-	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		__set_bit(EV_MSC, input->evbit);
 		__set_bit(MSC_RAW, input->mscbit);
 	}
@@ -682,7 +696,9 @@ static int magicmouse_input_mapping(struct hid_device *hdev,
 
 	/* Magic Trackpad does not give relative data after switching to MT */
 	if ((hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD ||
-	     hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
+	     hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	     hi->input->id.product ==
+		     USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	    field->flags & HID_MAIN_ITEM_RELATIVE)
 		return -1;
 
@@ -718,7 +734,8 @@ static int magicmouse_enable_multitouch(struct hid_device *hdev)
 	int ret;
 	int feature_size;
 
-	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	    hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
 			feature_size = sizeof(feature_mt_trackpad2_bt);
 			feature = feature_mt_trackpad2_bt;
@@ -763,7 +780,8 @@ static int magicmouse_fetch_battery(struct hid_device *hdev)
 
 	if (!hdev->battery || hdev->vendor != USB_VENDOR_ID_APPLE ||
 	    (hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
-	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2))
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
 		return -1;
 
 	report_enum = &hdev->report_enum[hdev->battery_report_type];
@@ -832,7 +850,9 @@ static int magicmouse_probe(struct hid_device *hdev,
 
 	if (id->vendor == USB_VENDOR_ID_APPLE &&
 	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 && hdev->type != HID_TYPE_USBMOUSE)))
+	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
+	      hdev->type != HID_TYPE_USBMOUSE)))
 		return 0;
 
 	if (!msc->input) {
@@ -847,7 +867,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 	else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
 			MOUSE2_REPORT_ID, 0);
-	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		 id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		if (id->vendor == BT_VENDOR_ID_APPLE)
 			report = hid_register_report(hdev, HID_INPUT_REPORT,
 				TRACKPAD2_BT_REPORT_ID, 0);
@@ -917,7 +938,8 @@ static __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	 */
 	if (hdev->vendor == USB_VENDOR_ID_APPLE &&
 	    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	    *rsize == 83 && rdesc[46] == 0x84 && rdesc[58] == 0x85) {
 		hid_info(hdev,
 			 "fixing up magicmouse battery report descriptor\n");
@@ -948,6 +970,10 @@ static const struct hid_device_id magic_mice[] = {
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2), .driver_data = 0 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2), .driver_data = 0 },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC), .driver_data = 0 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC), .driver_data = 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, magic_mice);
-- 
2.43.0


