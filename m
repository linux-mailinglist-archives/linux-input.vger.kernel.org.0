Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EAF374AA8
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhEEVlF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41607 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234828AbhEEVko (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620250786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PPX0O4STRSFoNhKftLhat1v0JRKfbgj4o8mwnxUmJ1g=;
        b=IxiChxf7CiMLoqfw/kmVxsaXhSRsaJullaGEXiuLhpmWkbc5sb+JWE1pqs5eeGitg1gFmn
        pY/gAnCIQ8yna6XSi8YK7cjxn+NHI9r7aL39DS5GWUIhUkvIo+a4q12mvQbFP7R6YtCvSw
        rPVSUBZpqkM9xJpMacOD0EAgV6IohRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-b_H48ho-PzuwPBKOnHc4TA-1; Wed, 05 May 2021 17:39:45 -0400
X-MC-Unique: b_H48ho-PzuwPBKOnHc4TA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9699A1800D41;
        Wed,  5 May 2021 21:39:44 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AC1195D6A8;
        Wed,  5 May 2021 21:39:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 3/6] HID: multitouch: Disable event reporting on suspend on the Asus T101HA touchpad
Date:   Wed,  5 May 2021 23:39:32 +0200
Message-Id: <20210505213935.631351-4-hdegoede@redhat.com>
In-Reply-To: <20210505213935.631351-1-hdegoede@redhat.com>
References: <20210505213935.631351-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Asus T101HA has a problem with spurious wakeups when the lid is
closed, this is caused by the screen sitting so close to the touchpad
that the touchpad ends up reporting touch events, causing these wakeups.

Add a quirk which disables event reporting on suspend when set, and
enable this quirk for the Asus T101HA touchpad fixing the spurious
wakeups, while still allowing the device to be woken by pressing a
key on the keyboard (which is part of the same USB device).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-multitouch.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 9d9f3e1bd5f4..cfb68e443ddd 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -70,6 +70,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_WIN8_PTP_BUTTONS	BIT(18)
 #define MT_QUIRK_SEPARATE_APP_REPORT	BIT(19)
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
+#define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -191,6 +192,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_EXPORT_ALL_INPUTS		0x0013
 /* reserved					0x0014 */
 #define MT_CLS_WIN_8_FORCE_MULTI_INPUT		0x0015
+#define MT_CLS_WIN_8_DISABLE_WAKEUP		0x0016
 
 /* vendor specific classes */
 #define MT_CLS_3M				0x0101
@@ -283,6 +285,15 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_WIN8_PTP_BUTTONS |
 			MT_QUIRK_FORCE_MULTI_INPUT,
 		.export_all_inputs = true },
+	{ .name = MT_CLS_WIN_8_DISABLE_WAKEUP,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_IGNORE_DUPLICATES |
+			MT_QUIRK_HOVERING |
+			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_STICKY_FINGERS |
+			MT_QUIRK_WIN8_PTP_BUTTONS |
+			MT_QUIRK_DISABLE_WAKEUP,
+		.export_all_inputs = true },
 
 	/*
 	 * vendor specific classes
@@ -759,7 +770,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 			return 1;
 		case HID_DG_CONFIDENCE:
 			if ((cls->name == MT_CLS_WIN_8 ||
-			     cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT) &&
+			     cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT ||
+			     cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP) &&
 				(field->application == HID_DG_TOUCHPAD ||
 				 field->application == HID_DG_TOUCHSCREEN))
 				app->quirks |= MT_QUIRK_CONFIDENCE;
@@ -1749,8 +1761,14 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 #ifdef CONFIG_PM
 static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 {
+	struct mt_device *td = hid_get_drvdata(hdev);
+
 	/* High latency is desirable for power savings during S3/S0ix */
-	mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
+	if (td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP)
+		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
+	else
+		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
+
 	return 0;
 }
 
@@ -1809,6 +1827,12 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_ANTON,
 			USB_DEVICE_ID_ANTON_TOUCH_PAD) },
 
+	/* Asus T101HA */
+	{ .driver_data = MT_CLS_WIN_8_DISABLE_WAKEUP,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_ASUSTEK,
+			   USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
+
 	/* Asus T304UA */
 	{ .driver_data = MT_CLS_ASUS,
 		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
-- 
2.31.1

