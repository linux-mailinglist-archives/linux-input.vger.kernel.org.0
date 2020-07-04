Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3974214610
	for <lists+linux-input@lfdr.de>; Sat,  4 Jul 2020 15:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgGDN1z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jul 2020 09:27:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49679 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726405AbgGDN1y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Jul 2020 09:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593869272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JOSHrVzaGQIxnZBlulc9ddPdsCShk5STEGF2tFBn2I0=;
        b=T09tRWKIj7CmRzF5VN9LeyrMfvG3mTK9OOmXgFkRZxCrOr9Ibt1tFt2QrJI3DRDYiS2fYz
        8W9TRaRHu7BTCSW60GMKRlhoenKTaiWcuL5MzuH9Aumz5MAlXBsojzZAY/S1dAX9ryO/8D
        rUUoFdxPoXr9kH2PZEaVhgr7iDlpJSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-6S7eDb76M2-KImEI4AQzIw-1; Sat, 04 Jul 2020 09:27:50 -0400
X-MC-Unique: 6S7eDb76M2-KImEI4AQzIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDC34BFC0;
        Sat,  4 Jul 2020 13:27:49 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D2A4A60BF1;
        Sat,  4 Jul 2020 13:27:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/5] HID: lenovo: Factor out generic parts of the LED code
Date:   Sat,  4 Jul 2020 15:27:39 +0200
Message-Id: <20200704132742.60197-3-hdegoede@redhat.com>
In-Reply-To: <20200704132742.60197-1-hdegoede@redhat.com>
References: <20200704132742.60197-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Factor out the generic parts of the tpkbd LED code, so that they can be
re-used for supporting the LEDs on the Thinkpad 10 ultrabook kbd.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 98 ++++++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 40 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index e58d270c909d..feb0cbc6742e 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -638,7 +638,18 @@ static const struct attribute_group lenovo_attr_group_tpkbd = {
 	.attrs = lenovo_attributes_tpkbd,
 };
 
-static enum led_brightness lenovo_led_brightness_get_tpkbd(
+static void lenovo_led_set_tpkbd(struct hid_device *hdev)
+{
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
+	struct hid_report *report;
+
+	report = hdev->report_enum[HID_OUTPUT_REPORT].report_id_hash[3];
+	report->field[0]->value[0] = (data_pointer->led_state >> 0) & 1;
+	report->field[0]->value[1] = (data_pointer->led_state >> 1) & 1;
+	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
+}
+
+static enum led_brightness lenovo_led_brightness_get(
 			struct led_classdev *led_cdev)
 {
 	struct device *dev = led_cdev->dev->parent;
@@ -654,13 +665,12 @@ static enum led_brightness lenovo_led_brightness_get_tpkbd(
 				: LED_OFF;
 }
 
-static void lenovo_led_brightness_set_tpkbd(struct led_classdev *led_cdev,
+static void lenovo_led_brightness_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
 	struct device *dev = led_cdev->dev->parent;
 	struct hid_device *hdev = to_hid_device(dev);
 	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
-	struct hid_report *report;
 	int led_nr = 0;
 
 	if (led_cdev == &data_pointer->led_micmute)
@@ -671,20 +681,54 @@ static void lenovo_led_brightness_set_tpkbd(struct led_classdev *led_cdev,
 	else
 		data_pointer->led_state |= 1 << led_nr;
 
-	report = hdev->report_enum[HID_OUTPUT_REPORT].report_id_hash[3];
-	report->field[0]->value[0] = (data_pointer->led_state >> 0) & 1;
-	report->field[0]->value[1] = (data_pointer->led_state >> 1) & 1;
-	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
+	switch (hdev->product) {
+	case USB_DEVICE_ID_LENOVO_TPKBD:
+		lenovo_led_set_tpkbd(hdev);
+		break;
+	}
+}
+
+static int lenovo_register_leds(struct hid_device *hdev)
+{
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
+	size_t name_sz = strlen(dev_name(&hdev->dev)) + 16;
+	char *name_mute, *name_micm;
+	int ret;
+
+	name_mute = devm_kzalloc(&hdev->dev, name_sz, GFP_KERNEL);
+	name_micm = devm_kzalloc(&hdev->dev, name_sz, GFP_KERNEL);
+	if (name_mute == NULL || name_micm == NULL) {
+		hid_err(hdev, "Could not allocate memory for led data\n");
+		return -ENOMEM;
+	}
+	snprintf(name_mute, name_sz, "%s:amber:mute", dev_name(&hdev->dev));
+	snprintf(name_micm, name_sz, "%s:amber:micmute", dev_name(&hdev->dev));
+
+	data->led_mute.name = name_mute;
+	data->led_mute.brightness_get = lenovo_led_brightness_get;
+	data->led_mute.brightness_set = lenovo_led_brightness_set;
+	data->led_mute.dev = &hdev->dev;
+	ret = led_classdev_register(&hdev->dev, &data->led_mute);
+	if (ret < 0)
+		return ret;
+
+	data->led_micmute.name = name_micm;
+	data->led_micmute.brightness_get = lenovo_led_brightness_get;
+	data->led_micmute.brightness_set = lenovo_led_brightness_set;
+	data->led_micmute.dev = &hdev->dev;
+	ret = led_classdev_register(&hdev->dev, &data->led_micmute);
+	if (ret < 0) {
+		led_classdev_unregister(&data->led_mute);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int lenovo_probe_tpkbd(struct hid_device *hdev)
 {
-	struct device *dev = &hdev->dev;
 	struct lenovo_drvdata *data_pointer;
-	size_t name_sz = strlen(dev_name(dev)) + 16;
-	char *name_mute, *name_micmute;
-	int i;
-	int ret;
+	int i, ret;
 
 	/*
 	 * Only register extra settings against subdevice where input_mapping
@@ -720,37 +764,11 @@ static int lenovo_probe_tpkbd(struct hid_device *hdev)
 	data_pointer->sensitivity = 0xa0;
 	data_pointer->press_speed = 0x38;
 
-	name_mute = devm_kzalloc(&hdev->dev, name_sz, GFP_KERNEL);
-	name_micmute = devm_kzalloc(&hdev->dev, name_sz, GFP_KERNEL);
-	if (name_mute == NULL || name_micmute == NULL) {
-		hid_err(hdev, "Could not allocate memory for led data\n");
-		ret = -ENOMEM;
-		goto err;
-	}
-	snprintf(name_mute, name_sz, "%s:amber:mute", dev_name(dev));
-	snprintf(name_micmute, name_sz, "%s:amber:micmute", dev_name(dev));
-
 	hid_set_drvdata(hdev, data_pointer);
 
-	data_pointer->led_mute.name = name_mute;
-	data_pointer->led_mute.brightness_get = lenovo_led_brightness_get_tpkbd;
-	data_pointer->led_mute.brightness_set = lenovo_led_brightness_set_tpkbd;
-	data_pointer->led_mute.dev = dev;
-	ret = led_classdev_register(dev, &data_pointer->led_mute);
-	if (ret < 0)
-		goto err;
-
-	data_pointer->led_micmute.name = name_micmute;
-	data_pointer->led_micmute.brightness_get =
-		lenovo_led_brightness_get_tpkbd;
-	data_pointer->led_micmute.brightness_set =
-		lenovo_led_brightness_set_tpkbd;
-	data_pointer->led_micmute.dev = dev;
-	ret = led_classdev_register(dev, &data_pointer->led_micmute);
-	if (ret < 0) {
-		led_classdev_unregister(&data_pointer->led_mute);
+	ret = lenovo_register_leds(hdev);
+	if (ret)
 		goto err;
-	}
 
 	lenovo_features_set_tpkbd(hdev);
 
-- 
2.26.2

