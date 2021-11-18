Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7D44560F1
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 17:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhKRQzQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 11:55:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhKRQzP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 11:55:15 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57277C061574;
        Thu, 18 Nov 2021 08:52:15 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 133so5995412wme.0;
        Thu, 18 Nov 2021 08:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AKDtoIEa6uOMWZH+EMXFP1HC6hBoeaP+M8ptDKzlpq8=;
        b=bwBEscOtXG6FCmrlgs/scbH1cO425jH9fqE496ZCrAOu3e6BPd322QUMXHsOgmXssj
         VseyOIQMxZrflBkpS3BajpQAKhWnRxM22ZOt60i/jsmOL7ntQHAOBu5In25VEF6Cktz3
         QIkgPfv5clzeohJdMAYjiGNXtSVLFywVIZVyUODsf3sEcVJEBCxnpTvOz1L+TqHKjCmI
         rbCuiXWn+avxVnRG/COMUGJRi565lWM3fVC/U3CAk98/itazRnJ6V4s8ebU9MR9mACl+
         expVepyF7OrWes0dMutVr6tNhYJq2Zpz5oyYcFbDkKj3s9/ch5AiX9m7DA7Pctx7BwOT
         QXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AKDtoIEa6uOMWZH+EMXFP1HC6hBoeaP+M8ptDKzlpq8=;
        b=67j/RDPCtj1JAlh2TP/VIGJN2hqTNBJAuEbLQ67Z0zXKk08xrIQ1h2kdR37IjPL+vO
         9Bgp3riq0qCDixJGLhiDUTkGeOvnjkgOhj6DcBgL8p098+LqeCx5o4+AFwWjY7lZAvKz
         6qhytGNjsD56ttzkULxu8fctVK4FAecp/GoCJneF1XGPK/7txqy0qSfKxvqQNN/EYIsW
         1PgkP+dRui0/0SVcAOsq2FuyQcj+R51CU9S1reby3ro/k0/dp8gr2AibBpeW0qmuQWjo
         PdfITN7vnkLkjTQBLVUSV+tbIZljhlsyNGZ9bfwQR51ztSXztgS9ENBz1B8VA35NU8C8
         43PQ==
X-Gm-Message-State: AOAM533KKGm0AdpoKkMIlwKWcjkEE66+R7ffPNBuwNjRy5MGYwnCWmsA
        N1nvfN1iieept840vYa8vJuoQIdsORs=
X-Google-Smtp-Source: ABdhPJw0eFpxgFkpAUPF95VMie+cvJ5LS3AeMXstnJV/sf8deTO/E6ryQNtABu+2SKNfku2jLrjoKw==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr12078094wmh.99.1637254333788;
        Thu, 18 Nov 2021 08:52:13 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id a12sm350410wrm.62.2021.11.18.08.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 08:52:12 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] HID: magicmouse: Report battery level over USB
Date:   Thu, 18 Nov 2021 17:52:08 +0100
Message-Id: <20211118165208.5664-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When connected over USB, the Apple Magic Mouse 2 and the Apple Magic
Trackpad 2 register multiple interfaces, one of them is used to report
the battery level.

However, unlike when connected over Bluetooth, the battery level is not
reported automatically and it is required to fetch it manually.

Fix the battery report descriptor and add a timer to fetch the battery
level.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 94 +++++++++++++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 686788ebf3e1..167b6a5dd226 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -57,6 +57,8 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 #define MOUSE_REPORT_ID    0x29
 #define MOUSE2_REPORT_ID   0x12
 #define DOUBLE_REPORT_ID   0xf7
+#define USB_BATTERY_TIMEOUT_MS 60000
+
 /* These definitions are not precise, but they're close enough.  (Bits
  * 0x03 seem to indicate the aspect ratio of the touch, bits 0x70 seem
  * to be some kind of bit mask -- 0x20 may be a near-field reading,
@@ -140,6 +142,7 @@ struct magicmouse_sc {
 
 	struct hid_device *hdev;
 	struct delayed_work work;
+	struct timer_list battery_timer;
 };
 
 static int magicmouse_firm_touch(struct magicmouse_sc *msc)
@@ -735,6 +738,44 @@ static void magicmouse_enable_mt_work(struct work_struct *work)
 		hid_err(msc->hdev, "unable to request touch data (%d)\n", ret);
 }
 
+static int magicmouse_fetch_battery(struct hid_device *hdev)
+{
+#ifdef CONFIG_HID_BATTERY_STRENGTH
+	struct hid_report_enum *report_enum;
+	struct hid_report *report;
+
+	if (!hdev->battery || hdev->vendor != USB_VENDOR_ID_APPLE ||
+	    (hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2))
+		return -1;
+
+	report_enum = &hdev->report_enum[hdev->battery_report_type];
+	report = report_enum->report_id_hash[hdev->battery_report_id];
+
+	if (!report || report->maxfield < 1)
+		return -1;
+
+	if (hdev->battery_capacity == hdev->battery_max)
+		return -1;
+
+	hid_hw_request(hdev, report, HID_REQ_GET_REPORT);
+	return 0;
+#else
+	return -1;
+#endif
+}
+
+static void magicmouse_battery_timer_tick(struct timer_list *t)
+{
+	struct magicmouse_sc *msc = from_timer(msc, t, battery_timer);
+	struct hid_device *hdev = msc->hdev;
+
+	if (magicmouse_fetch_battery(hdev) == 0) {
+		mod_timer(&msc->battery_timer,
+			  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
+	}
+}
+
 static int magicmouse_probe(struct hid_device *hdev,
 	const struct hid_device_id *id)
 {
@@ -742,11 +783,6 @@ static int magicmouse_probe(struct hid_device *hdev,
 	struct hid_report *report;
 	int ret;
 
-	if (id->vendor == USB_VENDOR_ID_APPLE &&
-	    id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
-	    hdev->type != HID_TYPE_USBMOUSE)
-		return -ENODEV;
-
 	msc = devm_kzalloc(&hdev->dev, sizeof(*msc), GFP_KERNEL);
 	if (msc == NULL) {
 		hid_err(hdev, "can't alloc magicmouse descriptor\n");
@@ -772,6 +808,16 @@ static int magicmouse_probe(struct hid_device *hdev,
 		return ret;
 	}
 
+	timer_setup(&msc->battery_timer, magicmouse_battery_timer_tick, 0);
+	mod_timer(&msc->battery_timer,
+		  jiffies + msecs_to_jiffies(USB_BATTERY_TIMEOUT_MS));
+	magicmouse_fetch_battery(hdev);
+
+	if (id->vendor == USB_VENDOR_ID_APPLE &&
+	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 && hdev->type != HID_TYPE_USBMOUSE)))
+		return 0;
+
 	if (!msc->input) {
 		hid_err(hdev, "magicmouse input not registered\n");
 		ret = -ENOMEM;
@@ -832,17 +878,52 @@ static void magicmouse_remove(struct hid_device *hdev)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
 
-	if (msc)
+	if (msc) {
 		cancel_delayed_work_sync(&msc->work);
+		del_timer_sync(&msc->battery_timer);
+	}
 
 	hid_hw_stop(hdev);
 }
 
+static __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				     unsigned int *rsize)
+{
+	/*
+	 * Change the usage from:
+	 *   0x06, 0x00, 0xff, // Usage Page (Vendor Defined Page 1)  0
+	 *   0x09, 0x0b,       // Usage (Vendor Usage 0x0b)           3
+	 * To:
+	 *   0x05, 0x01,       // Usage Page (Generic Desktop)        0
+	 *   0x09, 0x02,       // Usage (Mouse)                       2
+	 */
+	if (hdev->vendor == USB_VENDOR_ID_APPLE &&
+	    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) &&
+	    *rsize == 83 && rdesc[46] == 0x84 && rdesc[58] == 0x85) {
+		hid_info(hdev,
+			 "fixing up magicmouse battery report descriptor\n");
+		*rsize = *rsize - 1;
+		rdesc = kmemdup(rdesc + 1, *rsize, GFP_KERNEL);
+		if (!rdesc)
+			return NULL;
+
+		rdesc[0] = 0x05;
+		rdesc[1] = 0x01;
+		rdesc[2] = 0x09;
+		rdesc[3] = 0x02;
+	}
+
+	return rdesc;
+}
+
 static const struct hid_device_id magic_mice[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICMOUSE), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
@@ -858,6 +939,7 @@ static struct hid_driver magicmouse_driver = {
 	.id_table = magic_mice,
 	.probe = magicmouse_probe,
 	.remove = magicmouse_remove,
+	.report_fixup = magicmouse_report_fixup,
 	.raw_event = magicmouse_raw_event,
 	.event = magicmouse_event,
 	.input_mapping = magicmouse_input_mapping,
-- 
2.25.1

