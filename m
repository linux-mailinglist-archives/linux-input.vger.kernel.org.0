Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1589E32053E
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 13:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhBTM0Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 07:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47696 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229476AbhBTM0Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 07:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613823889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZIKWrnRDYv8sa2G8Jr0EICzOrIU0mYbpp5jK3asY/jE=;
        b=KoyKn7Gdc/pFEDr3kLxqHI+gLzG8vzugo4XAf5Lt4X/pYYAS3+SGeMlpFRnoxAMqFKRiqz
        td3Lfl4FqRRXQhLER53fiSrAcAkAkuf7vlNtFj26eIuT7rdx/5I5i8gvzFVxPdC+EvlgCI
        S3GUDVR6W1RuFpiHa/vTsJhJxRaB7is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-yGplpkcHOCyExWT1XTIZ3w-1; Sat, 20 Feb 2021 07:24:47 -0500
X-MC-Unique: yGplpkcHOCyExWT1XTIZ3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4453918449E2;
        Sat, 20 Feb 2021 12:24:46 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1DCD8100239F;
        Sat, 20 Feb 2021 12:24:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 2/7] HID: lenovo: Fix lenovo_led_set_tp10ubkbd() error handling
Date:   Sat, 20 Feb 2021 13:24:33 +0100
Message-Id: <20210220122438.21857-3-hdegoede@redhat.com>
In-Reply-To: <20210220122438.21857-1-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the following issues with lenovo_led_set_tp10ubkbd() error handling:

1. On success hid_hw_raw_request() returns the number of bytes send.
   So we should check for (ret != 3) rather then for (ret != 0).

2. Actually propagate errors to the caller.

3. Since the LEDs are part of an USB keyboard-dock the mute LEDs can go
   away at any time. Don't log an error when ret == -ENODEV and set the
   LED_HW_PLUGGABLE flag to avoid errors getting logged when the USB gets
   disconnected.

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Rewrite to fix a bunch of other error-handling issues too
---
 drivers/hid/hid-lenovo.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 4dc5e5f932ed..49b8767a8d30 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -62,8 +62,8 @@ struct lenovo_drvdata {
 #define TP10UBKBD_LED_OFF		1
 #define TP10UBKBD_LED_ON		2
 
-static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
-				     enum led_brightness value)
+static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
+				    enum led_brightness value)
 {
 	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
 	int ret;
@@ -75,10 +75,12 @@ static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
 	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 3,
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret)
+	if (ret != 3 && ret != -ENODEV)
 		hid_err(hdev, "Set LED output report error: %d\n", ret);
 
 	mutex_unlock(&data->led_report_mutex);
+
+	return ret < 0 ? ret : 0;
 }
 
 static void lenovo_tp10ubkbd_sync_fn_lock(struct work_struct *work)
@@ -349,7 +351,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 {
 	struct hid_device *hdev = to_hid_device(dev);
 	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
-	int value;
+	int value, ret;
 
 	if (kstrtoint(buf, 10, &value))
 		return -EINVAL;
@@ -364,7 +366,9 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 		lenovo_features_set_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
-		lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
+		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
+		if (ret)
+			return ret;
 		break;
 	}
 
@@ -785,6 +789,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	u8 tp10ubkbd_led[] = { TP10UBKBD_MUTE_LED, TP10UBKBD_MICMUTE_LED };
 	int led_nr = 0;
+	int ret = 0;
 
 	if (led_cdev == &data_pointer->led_micmute)
 		led_nr = 1;
@@ -799,11 +804,11 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		lenovo_led_set_tpkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
-		lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
+		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int lenovo_register_leds(struct hid_device *hdev)
@@ -825,6 +830,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	data->led_mute.name = name_mute;
 	data->led_mute.brightness_get = lenovo_led_brightness_get;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_mute.flags = LED_HW_PLUGGABLE;
 	data->led_mute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_mute);
 	if (ret < 0)
@@ -833,6 +839,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	data->led_micmute.name = name_micm;
 	data->led_micmute.brightness_get = lenovo_led_brightness_get;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_micmute.flags = LED_HW_PLUGGABLE;
 	data->led_micmute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_micmute);
 	if (ret < 0) {
-- 
2.30.1

