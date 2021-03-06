Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4AE32FAE3
	for <lists+linux-input@lfdr.de>; Sat,  6 Mar 2021 14:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhCFNh5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Mar 2021 08:37:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39990 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230429AbhCFNh0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 6 Mar 2021 08:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615037845;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UYifwL+fh8NSeq8g32TheQ5oBEnYzn30GpwXR8FS8Y8=;
        b=frllsiZtyULPe4LHlxHwJL23h9lSnLxPj3Zi4AK6s5eWtJgpOp2wpClfS2Cv0GVOCcjJ37
        6ncz4tDKg8ix+WCIOCKO7NA1+YDud8LkVgHpsjiVo3OC6poCf/cY5raeizmAxTmaHaxgPt
        FHpOYBrDrJ1NbDQyiZgUTesgto8lYbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-XgFBTKnJOF2Wcfp1Tb3n8Q-1; Sat, 06 Mar 2021 08:37:23 -0500
X-MC-Unique: XgFBTKnJOF2Wcfp1Tb3n8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD84A1842143;
        Sat,  6 Mar 2021 13:37:22 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D75E019C66;
        Sat,  6 Mar 2021 13:37:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/3] HID: multitouch: Disable event reporting on suspend on the Asus T101HA touchpad
Date:   Sat,  6 Mar 2021 14:37:15 +0100
Message-Id: <20210306133716.453447-2-hdegoede@redhat.com>
In-Reply-To: <20210306133716.453447-1-hdegoede@redhat.com>
References: <20210306133716.453447-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
2.30.1

