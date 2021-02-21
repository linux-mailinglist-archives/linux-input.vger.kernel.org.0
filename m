Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4BFA3209E3
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhBULVz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:21:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22376 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229897AbhBULVq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613906419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iX0cNjQmZHy4OyRs7N5fibYSZZQznF42u0dwIt7UY28=;
        b=KJLCYPhGvWDikYuleH7Gjf+QuHxbJZTJYuvnqnQ7UTjlrRWwY2mOF+bHDRMxgvzLQBMQsk
        bcDjxcHSWPBiiqlFoRuU4oSwJwe1OuCANqFV0v0HiLxrr181qNjdveXHhZNdYrVWjDG0sU
        nvswHmTRBAS8tzIyLFDTiD+yW0KF3Ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-cja4P8-UO36iRd4X_FAcKw-1; Sun, 21 Feb 2021 06:20:17 -0500
X-MC-Unique: cja4P8-UO36iRd4X_FAcKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 067FF18449E1;
        Sun, 21 Feb 2021 11:20:16 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 932DF6268F;
        Sun, 21 Feb 2021 11:20:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH v3 2/7] HID: lenovo: Fix lenovo_led_set_tp10ubkbd() error handling
Date:   Sun, 21 Feb 2021 12:20:00 +0100
Message-Id: <20210221112005.102116-3-hdegoede@redhat.com>
In-Reply-To: <20210221112005.102116-1-hdegoede@redhat.com>
References: <20210221112005.102116-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the following issues with lenovo_led_set_tp10ubkbd() error handling:

1. On success hid_hw_raw_request() returns the number of bytes sent.
   So we should check for (ret != 3) rather then for (ret != 0).

2. Actually propagate errors to the caller.

3. Since the LEDs are part of an USB keyboard-dock the mute LEDs can go
   away at any time. Don't log an error when ret == -ENODEV and set the
   LED_HW_PLUGGABLE flag to avoid errors getting logged when the USB gets
   disconnected.

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Return -EIO when hid_hw_raw_request() returns a value != 3 and >= 0

Changes in v2:
- Rewrite to fix a bunch of other error-handling issues too
---
 drivers/hid/hid-lenovo.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 4dc5e5f932ed..ee175ab54281 100644
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
@@ -75,10 +75,18 @@ static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
 	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 3,
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret)
-		hid_err(hdev, "Set LED output report error: %d\n", ret);
+	if (ret != 3) {
+		if (ret != -ENODEV)
+			hid_err(hdev, "Set LED output report error: %d\n", ret);
+
+		ret = ret < 0 ? ret : -EIO;
+	} else {
+		ret = 0;
+	}
 
 	mutex_unlock(&data->led_report_mutex);
+
+	return ret;
 }
 
 static void lenovo_tp10ubkbd_sync_fn_lock(struct work_struct *work)
@@ -349,7 +357,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 {
 	struct hid_device *hdev = to_hid_device(dev);
 	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
-	int value;
+	int value, ret;
 
 	if (kstrtoint(buf, 10, &value))
 		return -EINVAL;
@@ -364,7 +372,9 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 		lenovo_features_set_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
-		lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
+		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
+		if (ret)
+			return ret;
 		break;
 	}
 
@@ -785,6 +795,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	u8 tp10ubkbd_led[] = { TP10UBKBD_MUTE_LED, TP10UBKBD_MICMUTE_LED };
 	int led_nr = 0;
+	int ret = 0;
 
 	if (led_cdev == &data_pointer->led_micmute)
 		led_nr = 1;
@@ -799,11 +810,11 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
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
@@ -825,6 +836,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	data->led_mute.name = name_mute;
 	data->led_mute.brightness_get = lenovo_led_brightness_get;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_mute.flags = LED_HW_PLUGGABLE;
 	data->led_mute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_mute);
 	if (ret < 0)
@@ -833,6 +845,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	data->led_micmute.name = name_micm;
 	data->led_micmute.brightness_get = lenovo_led_brightness_get;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_micmute.flags = LED_HW_PLUGGABLE;
 	data->led_micmute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_micmute);
 	if (ret < 0) {
-- 
2.30.1

