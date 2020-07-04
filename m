Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB55214611
	for <lists+linux-input@lfdr.de>; Sat,  4 Jul 2020 15:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgGDN14 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jul 2020 09:27:56 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60191 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726703AbgGDN14 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 4 Jul 2020 09:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593869273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lsPi6PHHXqZvUtrLJgb91Vgb5hSgDyXgr6F33FeCtoA=;
        b=IW7L5q6TAQSBAoNiemRRvhIOrb7T0dKSHQgvG4B8Aori8dnJBPJIzGCKT/1aL/pQkCfkO+
        vKX7QkVfnXyxWSkrsbmK+9bf7Qwk0Zj4RFVY9tsHBd3QWEACgIJFsABGN65XXAWksz9gSb
        M4goP5EzNlZQR5kImqWD3n1yJOu1zyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-3iazZsEIPPCTLuUe13aWyQ-1; Sat, 04 Jul 2020 09:27:49 -0400
X-MC-Unique: 3iazZsEIPPCTLuUe13aWyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D6FB186A20E;
        Sat,  4 Jul 2020 13:27:48 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7849D60BF1;
        Sat,  4 Jul 2020 13:27:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/5] HID: lenovo: Merge tpkbd and cptkbd data structures
Date:   Sat,  4 Jul 2020 15:27:38 +0200
Message-Id: <20200704132742.60197-2-hdegoede@redhat.com>
In-Reply-To: <20200704132742.60197-1-hdegoede@redhat.com>
References: <20200704132742.60197-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Merge the tpkbd and cptkbd data structures, into a single unified
structure instead of having a separate data structure per keyboard type.

This is a preparation patch for making the tpkbd LED functions more
generic, so that they can be re-used for supporting the LEDs on the
Thinkpad 10 ultrabook keyboard.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 56 +++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 96fa2a2c2cd3..e58d270c909d 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -32,7 +32,7 @@
 
 #include "hid-ids.h"
 
-struct lenovo_drvdata_tpkbd {
+struct lenovo_drvdata {
 	int led_state;
 	struct led_classdev led_mute;
 	struct led_classdev led_micmute;
@@ -42,12 +42,8 @@ struct lenovo_drvdata_tpkbd {
 	int select_right;
 	int sensitivity;
 	int press_speed;
-};
-
-struct lenovo_drvdata_cptkbd {
 	u8 middlebutton_state; /* 0:Up, 1:Down (undecided), 2:Scrolling */
 	bool fn_lock;
-	int sensitivity;
 };
 
 #define map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
@@ -242,7 +238,7 @@ static int lenovo_send_cmd_cptkbd(struct hid_device *hdev,
 static void lenovo_features_set_cptkbd(struct hid_device *hdev)
 {
 	int ret;
-	struct lenovo_drvdata_cptkbd *cptkbd_data = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
 
 	ret = lenovo_send_cmd_cptkbd(hdev, 0x05, cptkbd_data->fn_lock);
 	if (ret)
@@ -258,7 +254,7 @@ static ssize_t attr_fn_lock_show_cptkbd(struct device *dev,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_cptkbd *cptkbd_data = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", cptkbd_data->fn_lock);
 }
@@ -269,7 +265,7 @@ static ssize_t attr_fn_lock_store_cptkbd(struct device *dev,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_cptkbd *cptkbd_data = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value))
@@ -288,7 +284,7 @@ static ssize_t attr_sensitivity_show_cptkbd(struct device *dev,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_cptkbd *cptkbd_data = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n",
 		cptkbd_data->sensitivity);
@@ -300,7 +296,7 @@ static ssize_t attr_sensitivity_store_cptkbd(struct device *dev,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_cptkbd *cptkbd_data = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value) || value < 1 || value > 255)
@@ -357,7 +353,7 @@ static int lenovo_raw_event(struct hid_device *hdev,
 static int lenovo_event_cptkbd(struct hid_device *hdev,
 		struct hid_field *field, struct hid_usage *usage, __s32 value)
 {
-	struct lenovo_drvdata_cptkbd *cptkbd_data = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
 
 	/* "wheel" scroll events */
 	if (usage->type == EV_REL && (usage->code == REL_WHEEL ||
@@ -404,7 +400,7 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 static int lenovo_features_set_tpkbd(struct hid_device *hdev)
 {
 	struct hid_report *report;
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 
 	report = hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[4];
 
@@ -425,7 +421,7 @@ static ssize_t attr_press_to_select_show_tpkbd(struct device *dev,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", data_pointer->press_to_select);
 }
@@ -436,7 +432,7 @@ static ssize_t attr_press_to_select_store_tpkbd(struct device *dev,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value))
@@ -455,7 +451,7 @@ static ssize_t attr_dragging_show_tpkbd(struct device *dev,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", data_pointer->dragging);
 }
@@ -466,7 +462,7 @@ static ssize_t attr_dragging_store_tpkbd(struct device *dev,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value))
@@ -485,7 +481,7 @@ static ssize_t attr_release_to_select_show_tpkbd(struct device *dev,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", data_pointer->release_to_select);
 }
@@ -496,7 +492,7 @@ static ssize_t attr_release_to_select_store_tpkbd(struct device *dev,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value))
@@ -515,7 +511,7 @@ static ssize_t attr_select_right_show_tpkbd(struct device *dev,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", data_pointer->select_right);
 }
@@ -526,7 +522,7 @@ static ssize_t attr_select_right_store_tpkbd(struct device *dev,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value))
@@ -545,7 +541,7 @@ static ssize_t attr_sensitivity_show_tpkbd(struct device *dev,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n",
 		data_pointer->sensitivity);
@@ -557,7 +553,7 @@ static ssize_t attr_sensitivity_store_tpkbd(struct device *dev,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value) || value < 1 || value > 255)
@@ -574,7 +570,7 @@ static ssize_t attr_press_speed_show_tpkbd(struct device *dev,
 		char *buf)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n",
 		data_pointer->press_speed);
@@ -586,7 +582,7 @@ static ssize_t attr_press_speed_store_tpkbd(struct device *dev,
 		size_t count)
 {
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	int value;
 
 	if (kstrtoint(buf, 10, &value) || value < 1 || value > 255)
@@ -647,7 +643,7 @@ static enum led_brightness lenovo_led_brightness_get_tpkbd(
 {
 	struct device *dev = led_cdev->dev->parent;
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	int led_nr = 0;
 
 	if (led_cdev == &data_pointer->led_micmute)
@@ -663,7 +659,7 @@ static void lenovo_led_brightness_set_tpkbd(struct led_classdev *led_cdev,
 {
 	struct device *dev = led_cdev->dev->parent;
 	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	struct hid_report *report;
 	int led_nr = 0;
 
@@ -684,7 +680,7 @@ static void lenovo_led_brightness_set_tpkbd(struct led_classdev *led_cdev,
 static int lenovo_probe_tpkbd(struct hid_device *hdev)
 {
 	struct device *dev = &hdev->dev;
-	struct lenovo_drvdata_tpkbd *data_pointer;
+	struct lenovo_drvdata *data_pointer;
 	size_t name_sz = strlen(dev_name(dev)) + 16;
 	char *name_mute, *name_micmute;
 	int i;
@@ -712,7 +708,7 @@ static int lenovo_probe_tpkbd(struct hid_device *hdev)
 		hid_warn(hdev, "Could not create sysfs group: %d\n", ret);
 
 	data_pointer = devm_kzalloc(&hdev->dev,
-				    sizeof(struct lenovo_drvdata_tpkbd),
+				    sizeof(struct lenovo_drvdata),
 				    GFP_KERNEL);
 	if (data_pointer == NULL) {
 		hid_err(hdev, "Could not allocate memory for driver data\n");
@@ -767,7 +763,7 @@ static int lenovo_probe_tpkbd(struct hid_device *hdev)
 static int lenovo_probe_cptkbd(struct hid_device *hdev)
 {
 	int ret;
-	struct lenovo_drvdata_cptkbd *cptkbd_data;
+	struct lenovo_drvdata *cptkbd_data;
 
 	/* All the custom action happens on the USBMOUSE device for USB */
 	if (hdev->product == USB_DEVICE_ID_LENOVO_CUSBKBD
@@ -852,7 +848,7 @@ static int lenovo_probe(struct hid_device *hdev,
 
 static void lenovo_remove_tpkbd(struct hid_device *hdev)
 {
-	struct lenovo_drvdata_tpkbd *data_pointer = hid_get_drvdata(hdev);
+	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 
 	/*
 	 * Only the trackpoint half of the keyboard has drvdata and stuff that
-- 
2.26.2

