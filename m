Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82772214613
	for <lists+linux-input@lfdr.de>; Sat,  4 Jul 2020 15:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgGDN16 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jul 2020 09:27:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23979 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726738AbgGDN16 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Jul 2020 09:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593869276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zMQuObWF8SOR2juv3v/Q8LUOKMljefx7uy8grCyN0A8=;
        b=NG4bbW5uOSsX7b/PIMvG0P+QLJYq2x4V6wFyVI8/Ijm3NOVqXPkGEqfOHt3lcqRPBd7Ye+
        zRCwmLBS1LxDKLqMszSG3dI2WUhQ7fJBMbJCuH+yeBvb01p3T/Vr1bASK6hIhFAdYYyOlk
        fVwyjrBWGzZE3qDz9mC9HWPvvhYCAUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-jgSot7ZNPJWhFR_THzF_mA-1; Sat, 04 Jul 2020 09:27:54 -0400
X-MC-Unique: jgSot7ZNPJWhFR_THzF_mA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC42BFC0;
        Sat,  4 Jul 2020 13:27:53 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7648860BF1;
        Sat,  4 Jul 2020 13:27:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 5/5] HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard fn_lock support
Date:   Sat,  4 Jul 2020 15:27:42 +0200
Message-Id: <20200704132742.60197-6-hdegoede@redhat.com>
In-Reply-To: <20200704132742.60197-1-hdegoede@redhat.com>
References: <20200704132742.60197-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for setting the Fn lock value of the ThinkPad 10 Ultrabook
Keyboard through sysfs, re-using the fn_lock sysfs attribute read/write
helpers from the existing ThinkPad Compact Keyboard with TrackPoint
support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 72 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index ccf41adcfa2b..b5122ee46801 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -29,6 +29,7 @@
 #include <linux/hid.h>
 #include <linux/input.h>
 #include <linux/leds.h>
+#include <linux/workqueue.h>
 
 #include "hid-ids.h"
 
@@ -38,6 +39,8 @@ struct lenovo_drvdata {
 	struct mutex led_report_mutex;
 	struct led_classdev led_mute;
 	struct led_classdev led_micmute;
+	struct work_struct fn_lock_sync_work;
+	struct hid_device *hdev;
 	int press_to_select;
 	int dragging;
 	int release_to_select;
@@ -78,6 +81,15 @@ static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 	mutex_unlock(&data->led_report_mutex);
 }
 
+static void lenovo_tp10ubkbd_sync_fn_lock(struct work_struct *work)
+{
+	struct lenovo_drvdata *data =
+		container_of(work, struct lenovo_drvdata, fn_lock_sync_work);
+
+	lenovo_led_set_tp10ubkbd(data->hdev, TP10UBKBD_FN_LOCK_LED,
+				 data->fn_lock);
+}
+
 static const __u8 lenovo_pro_dock_need_fixup_collection[] = {
 	0x05, 0x88,		/* Usage Page (Vendor Usage Page 0x88)	*/
 	0x09, 0x01,		/* Usage (Vendor Usage 0x01)		*/
@@ -344,6 +356,9 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 	case USB_DEVICE_ID_LENOVO_CBTKBD:
 		lenovo_features_set_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+		lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
+		break;
 	}
 
 	return count;
@@ -420,6 +435,24 @@ static int lenovo_raw_event(struct hid_device *hdev,
 	return 0;
 }
 
+static int lenovo_event_tp10ubkbd(struct hid_device *hdev,
+		struct hid_field *field, struct hid_usage *usage, __s32 value)
+{
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
+
+	if (usage->type == EV_KEY && usage->code == KEY_FN_ESC && value == 1) {
+		/*
+		 * The user has toggled the Fn-lock state. Toggle our own
+		 * cached value of it and sync our value to the keyboard to
+		 * ensure things are in sync (the sycning should be a no-op).
+		 */
+		data->fn_lock = !data->fn_lock;
+		schedule_work(&data->fn_lock_sync_work);
+	}
+
+	return 0;
+}
+
 static int lenovo_event_cptkbd(struct hid_device *hdev,
 		struct hid_field *field, struct hid_usage *usage, __s32 value)
 {
@@ -462,6 +495,8 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 	case USB_DEVICE_ID_LENOVO_CUSBKBD:
 	case USB_DEVICE_ID_LENOVO_CBTKBD:
 		return lenovo_event_cptkbd(hdev, field, usage, value);
+	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
 	default:
 		return 0;
 	}
@@ -899,9 +934,19 @@ static int lenovo_probe_cptkbd(struct hid_device *hdev)
 	return 0;
 }
 
+static struct attribute *lenovo_attributes_tp10ubkbd[] = {
+	&dev_attr_fn_lock.attr,
+	NULL
+};
+
+static const struct attribute_group lenovo_attr_group_tp10ubkbd = {
+	.attrs = lenovo_attributes_tp10ubkbd,
+};
+
 static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
 {
 	struct lenovo_drvdata *data;
+	int ret;
 
 	/* All the custom action happens on the USBMOUSE device for USB */
 	if (hdev->type != HID_TYPE_USBMOUSE)
@@ -912,10 +957,32 @@ static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
 		return -ENOMEM;
 
 	mutex_init(&data->led_report_mutex);
+	INIT_WORK(&data->fn_lock_sync_work, lenovo_tp10ubkbd_sync_fn_lock);
+	data->hdev = hdev;
 
 	hid_set_drvdata(hdev, data);
 
-	return lenovo_register_leds(hdev);
+	/*
+	 * The Thinkpad 10 ultrabook USB kbd dock's Fn-lock defaults to on.
+	 * We cannot read the state, only set it, so we force it to on here
+	 * (which should be a no-op) to make sure that our state matches the
+	 * keyboard's FN-lock state. This is the same as what Windows does.
+	 */
+	data->fn_lock = true;
+	lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, data->fn_lock);
+
+	ret = sysfs_create_group(&hdev->dev.kobj, &lenovo_attr_group_tp10ubkbd);
+	if (ret)
+		return ret;
+
+	ret = lenovo_register_leds(hdev);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	sysfs_remove_group(&hdev->dev.kobj, &lenovo_attr_group_tp10ubkbd);
+	return ret;
 }
 
 static int lenovo_probe(struct hid_device *hdev,
@@ -993,6 +1060,9 @@ static void lenovo_remove_tp10ubkbd(struct hid_device *hdev)
 
 	led_classdev_unregister(&data->led_micmute);
 	led_classdev_unregister(&data->led_mute);
+
+	sysfs_remove_group(&hdev->dev.kobj, &lenovo_attr_group_tp10ubkbd);
+	cancel_work_sync(&data->fn_lock_sync_work);
 }
 
 static void lenovo_remove(struct hid_device *hdev)
-- 
2.26.2

