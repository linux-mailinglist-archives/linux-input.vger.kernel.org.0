Return-Path: <linux-input+bounces-7998-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4919C341F
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2024 18:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B80528032E
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2024 17:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534FB53E23;
	Sun, 10 Nov 2024 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEwKFDkF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB81C28E;
	Sun, 10 Nov 2024 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731261012; cv=none; b=kC8vWDP1ygelX5pV+wjDV2gbSPa8DRdqJ0Da0eY+wug3y6KUzKoQ0r6NBQQ7k8d4Bj33IeOiUWVWaSsSCaZ9n5NkwFx+j9ulEEQa3iSoInY0FeFfI9gQzkXLmj2y+D9piyh9xSBDmI55dKt4uk1OAVktTpATAea6w5M2p7fV6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731261012; c=relaxed/simple;
	bh=1Vm3VwqsE3exLcFAUQBW7bYM4cjM8XuBsrC3XOACKsA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kn74/nL6NvNjbLeHfvHW6FKf2G96AKirwxfqlsNvPDfwmYlB33Pb2GNNoIH0dVLdjkmW8wwRkRazpxo5CfYE1lM8x5R2bnYRCDhxq+vwBDdBjJmK/8tcGI5HlpFmFHY3juDLTfKeH+JoBUpCi637MElOqSyvp86G0L/N0KuPitM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEwKFDkF; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-288642376bcso1950595fac.1;
        Sun, 10 Nov 2024 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731261009; x=1731865809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRFi72RwYPLeyOTyr4Y4v/YPnFQSTAYVgzSlRcP4LEY=;
        b=mEwKFDkFktXEwaRb9araCKKKyXh4798V9ywOJihX8kt6qH5eRPI/CZYrhfLwsGNvXO
         zNa/Zj+/EyWsw9wrGrIRr0nEgry6SAiOPeErXHhwlb8fjWN7CNMoTjh/T/Lzwh0Am+nJ
         HTfWmh1n91cLfOdATcfuqi+d/jW2hgViPYNwRFowqSUUX9PF0N+SX0e9FXCRYoLEMJW5
         PkRnwwzbpduZSDnS1PMAGle0Zb+Z/XVgcxgIdVhcRxrvIuCc6msg+bwHWdaGGFrIEfoJ
         3Crpmjn8Fn90GH0gkqTb/9VRgVJfdZybd+Had4Cur3tFaa7hz7XUQSk5N6gcwV/yjog7
         fO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731261009; x=1731865809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRFi72RwYPLeyOTyr4Y4v/YPnFQSTAYVgzSlRcP4LEY=;
        b=Br5AID5sNat2FptBtZmPSBXAK0DZgGtfWVPM4lcDcZ3WBjoy4Z4ZeFGbI6mSfInHJF
         ZjDr5/JyORd18artHSlNM+V/hIdQKS/QxVMuYxQsJu+ATKrlmlkFsQQZXzmj9/wbl53i
         X+0PEulT6UWdwcvTlviVgC08+dEufMkgNAOpddeLT65/+FTDeS726gnLAhBbTG/vEWPo
         1lGoCz2vuUZDtI0Q7W/B1JCQAKM/W3yDs9ipYU9Y0yqc2cfYOo6w44HyKz2AIhB8HnLo
         wZ0DH9vH6DYxe8+5RuAs/nZK/IxQUf1bghcHAZ8fEPrM4KDrlw15na/28N+oipI1J9wb
         U8uA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3F4i5YJI7ndFcUwPbpKPGYLXyY/wSsOGRbYK9Q1jgRfEMRQHmpqn3vdvaGG5pzH/lgo4kks7mGJx0w==@vger.kernel.org, AJvYcCWva43XXJ//L1xn2FqQgHPDsoU9ExAV1Q8egq/julD/m23jYTRQ8DIVHvsLjW9qvS3XnoQzFy+Oo3hciEwJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz00N/7Dt6X3jzWI/oeyLwq9UIZSqgVMWVT0M9x2X7jXQgRN4yP
	P0a59z1glXKspnCT3w02u8X3wCCXeidL3DgaMx9F7sAan19e2QjW
X-Google-Smtp-Source: AGHT+IH3K5pWOlKkzE6lK4+Y5h5qm0wmwJr6gJIkISCvbGf1slQ48yjSeK0YE13/dzaoE1QyDS9Gcw==
X-Received: by 2002:a05:6870:e809:b0:277:f722:45e1 with SMTP id 586e51a60fabf-29560063890mr7864320fac.17.1731261009481;
        Sun, 10 Nov 2024 09:50:09 -0800 (PST)
Received: from linux.attlocal.net ([2600:1702:5d48:b900:3eac:735c:7f69:1569])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-29546d0f3cdsm2282749fac.26.2024.11.10.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 09:50:09 -0800 (PST)
From: Callahan Kovacs <callahankovacs@gmail.com>
To: visitorckw@gmail.com,
	callahankovacs@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jose.exposito89@gmail.com
Subject: Re: [PATCH] HID: magicmouse: Apple Magic Trackpad 2 USB-C driver support
Date: Sun, 10 Nov 2024 11:48:55 -0600
Message-ID: <20241110175003.13210-1-callahankovacs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZzDHrOr43KO+CtuL@visitorckw-System-Product-Name>
References: <ZzDHrOr43KO+CtuL@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Thanks for your patch. However, all kernel patches require the author
> to add a Signed-off-by tag at the end of the commit message. Could you
> please resend the patch with this correction?

Hi Kuan-Wei,

Thanks, my apologies for missing that step. See the signed patch below.


Adds driver support for the USB-C model of Apple's Magic Trackpad 2.

The 2024 USB-C model is compatible with the existing Magic Trackpad 2
driver but has a different hardware ID.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219470

Signed-off-by: Callahan Kovacs <callahankovacs@gmail.com>
---
 drivers/hid/hid-ids.h        |  1 +
 drivers/hid/hid-magicmouse.c | 56 ++++++++++++++++++++++++++----------
 2 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 781c5aa298..245a3901c7 100644
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
index 2eb285b97f..4ba30f4974 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -227,7 +227,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
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
@@ -259,8 +261,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
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
@@ -359,7 +362,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 		input_report_abs(input, ABS_MT_POSITION_X, x);
 		input_report_abs(input, ABS_MT_POSITION_Y, y);
 
-		if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)
+		if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		    input->id.product ==
+			    USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC)
 			input_report_abs(input, ABS_MT_PRESSURE, pressure);
 
 		if (report_undeciphered) {
@@ -367,7 +372,9 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
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
@@ -493,7 +500,9 @@ static int magicmouse_raw_event(struct hid_device *hdev,
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
@@ -545,7 +554,9 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
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
@@ -621,7 +632,9 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
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
@@ -660,7 +673,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 	input_set_events_per_packet(input, 60);
 
 	if (report_undeciphered &&
-	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	    input->id.product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		__set_bit(EV_MSC, input->evbit);
 		__set_bit(MSC_RAW, input->mscbit);
 	}
@@ -685,7 +699,9 @@ static int magicmouse_input_mapping(struct hid_device *hdev,
 
 	/* Magic Trackpad does not give relative data after switching to MT */
 	if ((hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD ||
-	     hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
+	     hi->input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	     hi->input->id.product ==
+		     USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	    field->flags & HID_MAIN_ITEM_RELATIVE)
 		return -1;
 
@@ -721,7 +737,8 @@ static int magicmouse_enable_multitouch(struct hid_device *hdev)
 	int ret;
 	int feature_size;
 
-	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	    hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
 			feature_size = sizeof(feature_mt_trackpad2_bt);
 			feature = feature_mt_trackpad2_bt;
@@ -766,7 +783,8 @@ static int magicmouse_fetch_battery(struct hid_device *hdev)
 
 	if (!hdev->battery || hdev->vendor != USB_VENDOR_ID_APPLE ||
 	    (hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
-	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2))
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
 		return -1;
 
 	report_enum = &hdev->report_enum[hdev->battery_report_type];
@@ -835,7 +853,9 @@ static int magicmouse_probe(struct hid_device *hdev,
 
 	if (id->vendor == USB_VENDOR_ID_APPLE &&
 	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 && hdev->type != HID_TYPE_USBMOUSE)))
+	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
+	      hdev->type != HID_TYPE_USBMOUSE)))
 		return 0;
 
 	if (!msc->input) {
@@ -850,7 +870,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 	else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
 			MOUSE2_REPORT_ID, 0);
-	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
+	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+		 id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
 		if (id->vendor == BT_VENDOR_ID_APPLE)
 			report = hid_register_report(hdev, HID_INPUT_REPORT,
 				TRACKPAD2_BT_REPORT_ID, 0);
@@ -920,7 +941,8 @@ static __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	 */
 	if (hdev->vendor == USB_VENDOR_ID_APPLE &&
 	    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
-	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	    *rsize == 83 && rdesc[46] == 0x84 && rdesc[58] == 0x85) {
 		hid_info(hdev,
 			 "fixing up magicmouse battery report descriptor\n");
@@ -951,6 +973,10 @@ static const struct hid_device_id magic_mice[] = {
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


