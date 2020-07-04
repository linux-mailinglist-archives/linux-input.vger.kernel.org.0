Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3A4214612
	for <lists+linux-input@lfdr.de>; Sat,  4 Jul 2020 15:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgGDN16 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jul 2020 09:27:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36197 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726405AbgGDN15 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Jul 2020 09:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593869275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7a0ApzYItPVhPX+NIKWbG13G70cdg9p4q0C14bHVojk=;
        b=gtOWtFLyeI8UPMWbyKl3CwKfi3kBuf4HmQs6xVHe/VmGPJGyadPnO1cpYYy0cklwcrghY8
        yRKV+heg5kPvHdKznHHe3lUT6Mx7sjyQGe76wgqetINQOC/45Es1ltfmNsivMao9m49gLf
        cK9ha6uphM1jYjZn/VqmiAnA4vi1DwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-5NeFPeOEP3SDQy_rFb3k-Q-1; Sat, 04 Jul 2020 09:27:53 -0400
X-MC-Unique: 5NeFPeOEP3SDQy_rFb3k-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FAC3800401;
        Sat,  4 Jul 2020 13:27:52 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4027760BF1;
        Sat,  4 Jul 2020 13:27:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 4/5] HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support
Date:   Sat,  4 Jul 2020 15:27:41 +0200
Message-Id: <20200704132742.60197-5-hdegoede@redhat.com>
In-Reply-To: <20200704132742.60197-1-hdegoede@redhat.com>
References: <20200704132742.60197-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some of the function keys special functions all use the same
0x000c0001 usage code, add a mapping for these based on the usage_index;

And add support for the Speaker and Mic mute LEDs integrated into the
F1 and F4 keys.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h    |   1 +
 drivers/hid/hid-lenovo.c | 105 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 874fc3791f3b..dc1a3781fe62 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -723,6 +723,7 @@
 #define USB_DEVICE_ID_LENOVO_CUSBKBD	0x6047
 #define USB_DEVICE_ID_LENOVO_CBTKBD	0x6048
 #define USB_DEVICE_ID_LENOVO_SCROLLPOINT_OPTICAL	0x6049
+#define USB_DEVICE_ID_LENOVO_TP10UBKBD	0x6062
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index f2eb91704e9c..ccf41adcfa2b 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -33,7 +33,9 @@
 #include "hid-ids.h"
 
 struct lenovo_drvdata {
+	u8 led_report[3]; /* Must be first for proper alignment */
 	int led_state;
+	struct mutex led_report_mutex;
 	struct led_classdev led_mute;
 	struct led_classdev led_micmute;
 	int press_to_select;
@@ -48,6 +50,34 @@ struct lenovo_drvdata {
 
 #define map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
 
+#define TP10UBKBD_LED_OUTPUT_REPORT	9
+
+#define TP10UBKBD_FN_LOCK_LED		0x54
+#define TP10UBKBD_MUTE_LED		0x64
+#define TP10UBKBD_MICMUTE_LED		0x74
+
+#define TP10UBKBD_LED_OFF		1
+#define TP10UBKBD_LED_ON		2
+
+static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
+				     enum led_brightness value)
+{
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
+	int ret;
+
+	mutex_lock(&data->led_report_mutex);
+
+	data->led_report[0] = TP10UBKBD_LED_OUTPUT_REPORT;
+	data->led_report[1] = led_code;
+	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
+	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 3,
+				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+	if (ret)
+		hid_err(hdev, "Set LED output report error: %d\n", ret);
+
+	mutex_unlock(&data->led_report_mutex);
+}
+
 static const __u8 lenovo_pro_dock_need_fixup_collection[] = {
 	0x05, 0x88,		/* Usage Page (Vendor Usage Page 0x88)	*/
 	0x09, 0x01,		/* Usage (Vendor Usage 0x01)		*/
@@ -175,6 +205,37 @@ static int lenovo_input_mapping_scrollpoint(struct hid_device *hdev,
 	return 0;
 }
 
+static int lenovo_input_mapping_tp10_ultrabook_kbd(struct hid_device *hdev,
+		struct hid_input *hi, struct hid_field *field,
+		struct hid_usage *usage, unsigned long **bit, int *max)
+{
+	/*
+	 * The ThinkPad 10 Ultrabook Keyboard uses 0x000c0001 usage for
+	 * a bunch of keys which have no standard consumer page code.
+	 */
+	if (usage->hid == 0x000c0001) {
+		switch (usage->usage_index) {
+		case 8: /* Fn-Esc: Fn-lock toggle */
+			map_key_clear(KEY_FN_ESC);
+			return 1;
+		case 9: /* Fn-F4: Mic mute */
+			map_key_clear(KEY_MICMUTE);
+			return 1;
+		case 10: /* Fn-F7: Control panel */
+			map_key_clear(KEY_CONFIG);
+			return 1;
+		case 11: /* Fn-F8: Search (magnifier glass) */
+			map_key_clear(KEY_SEARCH);
+			return 1;
+		case 12: /* Fn-F10: Open My computer (6 boxes) */
+			map_key_clear(KEY_FILE);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
 static int lenovo_input_mapping(struct hid_device *hdev,
 		struct hid_input *hi, struct hid_field *field,
 		struct hid_usage *usage, unsigned long **bit, int *max)
@@ -195,6 +256,9 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_SCROLLPOINT_OPTICAL:
 		return lenovo_input_mapping_scrollpoint(hdev, hi, field,
 							usage, bit, max);
+	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
+							       usage, bit, max);
 	default:
 		return 0;
 	}
@@ -677,6 +741,7 @@ static void lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	struct device *dev = led_cdev->dev->parent;
 	struct hid_device *hdev = to_hid_device(dev);
 	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
+	u8 tp10ubkbd_led[] = { TP10UBKBD_MUTE_LED, TP10UBKBD_MICMUTE_LED };
 	int led_nr = 0;
 
 	if (led_cdev == &data_pointer->led_micmute)
@@ -691,6 +756,9 @@ static void lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	case USB_DEVICE_ID_LENOVO_TPKBD:
 		lenovo_led_set_tpkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+		lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
+		break;
 	}
 }
 
@@ -831,6 +899,25 @@ static int lenovo_probe_cptkbd(struct hid_device *hdev)
 	return 0;
 }
 
+static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
+{
+	struct lenovo_drvdata *data;
+
+	/* All the custom action happens on the USBMOUSE device for USB */
+	if (hdev->type != HID_TYPE_USBMOUSE)
+		return 0;
+
+	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->led_report_mutex);
+
+	hid_set_drvdata(hdev, data);
+
+	return lenovo_register_leds(hdev);
+}
+
 static int lenovo_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
@@ -856,6 +943,9 @@ static int lenovo_probe(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_CBTKBD:
 		ret = lenovo_probe_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+		ret = lenovo_probe_tp10ubkbd(hdev);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -894,6 +984,17 @@ static void lenovo_remove_cptkbd(struct hid_device *hdev)
 			&lenovo_attr_group_cptkbd);
 }
 
+static void lenovo_remove_tp10ubkbd(struct hid_device *hdev)
+{
+	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
+
+	if (data == NULL)
+		return;
+
+	led_classdev_unregister(&data->led_micmute);
+	led_classdev_unregister(&data->led_mute);
+}
+
 static void lenovo_remove(struct hid_device *hdev)
 {
 	switch (hdev->product) {
@@ -904,6 +1005,9 @@ static void lenovo_remove(struct hid_device *hdev)
 	case USB_DEVICE_ID_LENOVO_CBTKBD:
 		lenovo_remove_cptkbd(hdev);
 		break;
+	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+		lenovo_remove_tp10ubkbd(hdev);
+		break;
 	}
 
 	hid_hw_stop(hdev);
@@ -940,6 +1044,7 @@ static const struct hid_device_id lenovo_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IBM, USB_DEVICE_ID_IBM_SCROLLPOINT_800DPI_OPTICAL) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IBM, USB_DEVICE_ID_IBM_SCROLLPOINT_800DPI_OPTICAL_PRO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_SCROLLPOINT_OPTICAL) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_TP10UBKBD) },
 	{ }
 };
 
-- 
2.26.2

