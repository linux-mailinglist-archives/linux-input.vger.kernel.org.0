Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388A034E65D
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 13:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhC3Ldr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 07:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhC3Ldg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 07:33:36 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F899C061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:36 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x26so12001020pfn.0
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/43es5lmfTvSMg9V9lh/7OQVghMj1iNxFqwqD88gyCk=;
        b=BFnGrbRPZIIOQ/Aw2ZIBLwCl5vNC8ayWqE2WakhAXVg0WKaqDR4gJ68gOThpeTtsdC
         QlVtfLTifr0NptfE7cc1ozLYTAMtPDbyudHJ6vdWelWKvmLX47i/6z/cNCr154qPiNTm
         +oKLlpFICxum/EtpsIKaIDf3v98KjtJH3vgPcwrqDDlWyudnt6eE7ou21nAr6Qb7hys3
         /W3hzChr0M8zzC9Eyc8IhjTGqDXl1eoUknXoep8gCbe64qiRzrIiLuVK5H30qsX7MMwF
         4fNVfSzn2Q7Jp4uO9b5SoxzlHw2zvfadwxyCHApBrBgoJDnS7YEknmF8pZMgmqsjCQ/V
         +n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/43es5lmfTvSMg9V9lh/7OQVghMj1iNxFqwqD88gyCk=;
        b=cagI5ty1bQpLLXbGbRRlc+kzjr5jUEv7Y2W2vMgL3C0+yPoMiPgK59ZlpNuj5gwzF3
         65/fqKYD/iKKqcZqX5sBg+m3Ew5euQLf28iiunseyu1DVyfv4evIbXcE/i7JZChCoKjn
         Wsf8LnQ0cUlry2angC68GeylnyBlzzZjdpjzY7ecVyxNKS6yCUeUzSDz4Ru+glbfHKPF
         vfTZ1qQracZx1Ox/CFxm8Irj1xOutk6OO66vZHJ+y81LfpxydKLAZLY2S3AKkiy1iQ68
         AbewCQeCCut6jNED7A95xxGCO4vXY7kkzDnudqiRNbixd2EkJLiLD1tgEGu9XevzBLrJ
         AtDA==
X-Gm-Message-State: AOAM531I4/ZT44rFJp7eow21nFtDVSnapov96FoRc6fwpz9qOoFDDUXd
        GAcvuAI99UCyjnFVm3N/gGWPLfWZaEr7NRuc
X-Google-Smtp-Source: ABdhPJwFe/V6vhgJ+RAD2g+gxX+e0qvnVoltkOla+j3IC2mInHbGdpcC6WSV4M/ZDn35Uz4yOMNd3g==
X-Received: by 2002:a65:62cb:: with SMTP id m11mr27871521pgv.77.1617104015286;
        Tue, 30 Mar 2021 04:33:35 -0700 (PDT)
Received: from johnchen902-arch-ryzen.. (2001-b011-3815-5a81-9afa-9bff-fe6e-3ce2.dynamic-ip6.hinet.net. [2001:b011:3815:5a81:9afa:9bff:fe6e:3ce2])
        by smtp.gmail.com with ESMTPSA id y4sm19650868pfn.67.2021.03.30.04.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 04:33:35 -0700 (PDT)
From:   John Chen <johnchen902@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Rohit Pidaparthi <rohitpid@gmail.com>,
        RicardoEPRodrigues <ricardo.e.p.rodrigues@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        John Chen <johnchen902@gmail.com>
Subject: [PATCH v2 1/4] HID: magicmouse: add Apple Magic Mouse 2 support
Date:   Tue, 30 Mar 2021 19:33:16 +0800
Message-Id: <20210330113319.14010-2-johnchen902@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210330113319.14010-1-johnchen902@gmail.com>
References: <20210330113319.14010-1-johnchen902@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Bluetooth device
	Vendor 004c (Apple)
	Device 0269 (Magic Mouse 2)

Add support for Apple Magic Mouse 2, putting the device in multi-touch
mode.

Co-authored-by: Rohit Pidaparthi <rohitpid@gmail.com>
Co-authored-by: RicardoEPRodrigues <ricardo.e.p.rodrigues@gmail.com>
Signed-off-by: John Chen <johnchen902@gmail.com>
---
 drivers/hid/hid-ids.h        |  1 +
 drivers/hid/hid-magicmouse.c | 53 ++++++++++++++++++++++++++++++++----
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e42aaae3138f..fa0edf03570a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -93,6 +93,7 @@
 #define BT_VENDOR_ID_APPLE		0x004c
 #define USB_DEVICE_ID_APPLE_MIGHTYMOUSE	0x0304
 #define USB_DEVICE_ID_APPLE_MAGICMOUSE	0x030d
+#define USB_DEVICE_ID_APPLE_MAGICMOUSE2	0x0269
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD	0x030e
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2	0x0265
 #define USB_DEVICE_ID_APPLE_FOUNTAIN_ANSI	0x020e
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index abd86903875f..7aad6ca56780 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -54,6 +54,7 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 #define TRACKPAD2_USB_REPORT_ID 0x02
 #define TRACKPAD2_BT_REPORT_ID 0x31
 #define MOUSE_REPORT_ID    0x29
+#define MOUSE2_REPORT_ID   0x12
 #define DOUBLE_REPORT_ID   0xf7
 /* These definitions are not precise, but they're close enough.  (Bits
  * 0x03 seem to indicate the aspect ratio of the touch, bits 0x70 seem
@@ -195,7 +196,8 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 	int id, x, y, size, orientation, touch_major, touch_minor, state, down;
 	int pressure = 0;
 
-	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE) {
+	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
 		id = (tdata[6] << 2 | tdata[5] >> 6) & 0xf;
 		x = (tdata[1] << 28 | tdata[0] << 20) >> 20;
 		y = -((tdata[2] << 24 | tdata[1] << 16) >> 20);
@@ -296,7 +298,8 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 			input_report_abs(input, ABS_MT_PRESSURE, pressure);
 
 		if (report_undeciphered) {
-			if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE)
+			if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
+			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
 				input_event(input, EV_MSC, MSC_RAW, tdata[7]);
 			else if (input->id.product !=
 					USB_DEVICE_ID_APPLE_MAGICTRACKPAD2)
@@ -380,6 +383,34 @@ static int magicmouse_raw_event(struct hid_device *hdev,
 		 * ts = data[3] >> 6 | data[4] << 2 | data[5] << 10;
 		 */
 		break;
+	case MOUSE2_REPORT_ID:
+		/* Size is either 8 or (14 + 8 * N) */
+		if (size != 8 && (size < 14 || (size - 14) % 8 != 0))
+			return 0;
+		npoints = (size - 14) / 8;
+		if (npoints > 15) {
+			hid_warn(hdev, "invalid size value (%d) for MOUSE2_REPORT_ID\n",
+					size);
+			return 0;
+		}
+		msc->ntouches = 0;
+		for (ii = 0; ii < npoints; ii++)
+			magicmouse_emit_touch(msc, ii, data + ii * 8 + 14);
+
+		/* When emulating three-button mode, it is important
+		 * to have the current touch information before
+		 * generating a click event.
+		 */
+		x = (int)((data[3] << 24) | (data[2] << 16)) >> 16;
+		y = (int)((data[5] << 24) | (data[4] << 16)) >> 16;
+		clicks = data[1];
+
+		/* The following bits provide a device specific timestamp. They
+		 * are unused here.
+		 *
+		 * ts = data[11] >> 6 | data[12] << 2 | data[13] << 10;
+		 */
+		break;
 	case DOUBLE_REPORT_ID:
 		/* Sometimes the trackpad sends two touch reports in one
 		 * packet.
@@ -392,7 +423,8 @@ static int magicmouse_raw_event(struct hid_device *hdev,
 		return 0;
 	}
 
-	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE) {
+	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
 		magicmouse_emit_buttons(msc, clicks & 3);
 		input_report_rel(input, REL_X, x);
 		input_report_rel(input, REL_Y, y);
@@ -415,7 +447,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 
 	__set_bit(EV_KEY, input->evbit);
 
-	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE) {
+	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
 		__set_bit(BTN_LEFT, input->keybit);
 		__set_bit(BTN_RIGHT, input->keybit);
 		if (emulate_3button)
@@ -480,7 +513,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 	 * the origin at the same position, and just uses the additive
 	 * inverse of the reported Y.
 	 */
-	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE) {
+	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
 		input_set_abs_params(input, ABS_MT_ORIENTATION, -31, 32, 1, 0);
 		input_set_abs_params(input, ABS_MT_POSITION_X,
 				     MOUSE_MIN_X, MOUSE_MAX_X, 4, 0);
@@ -586,6 +620,7 @@ static int magicmouse_probe(struct hid_device *hdev,
 {
 	const u8 *feature;
 	const u8 feature_mt[] = { 0xD7, 0x01 };
+	const u8 feature_mt_mouse2[] = { 0xF1, 0x02, 0x01 };
 	const u8 feature_mt_trackpad2_usb[] = { 0x02, 0x01 };
 	const u8 feature_mt_trackpad2_bt[] = { 0xF1, 0x02, 0x01 };
 	u8 *buf;
@@ -631,6 +666,9 @@ static int magicmouse_probe(struct hid_device *hdev,
 	if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE)
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
 			MOUSE_REPORT_ID, 0);
+	else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
+		report = hid_register_report(hdev, HID_INPUT_REPORT,
+			MOUSE2_REPORT_ID, 0);
 	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
 		if (id->vendor == BT_VENDOR_ID_APPLE)
 			report = hid_register_report(hdev, HID_INPUT_REPORT,
@@ -660,6 +698,9 @@ static int magicmouse_probe(struct hid_device *hdev,
 			feature_size = sizeof(feature_mt_trackpad2_usb);
 			feature = feature_mt_trackpad2_usb;
 		}
+	} else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+		feature_size = sizeof(feature_mt_mouse2);
+		feature = feature_mt_mouse2;
 	} else {
 		feature_size = sizeof(feature_mt);
 		feature = feature_mt;
@@ -696,6 +737,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 static const struct hid_device_id magic_mice[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICMOUSE), .driver_data = 0 },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
-- 
2.31.0

