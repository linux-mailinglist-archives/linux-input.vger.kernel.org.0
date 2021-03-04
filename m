Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBF632DA52
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 20:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbhCDTXe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 14:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22178 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235268AbhCDTXX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 14:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jJWvEXMPdn/hDTF23NBJ1u9d2bVMCcesew96JpPlBeA=;
        b=SlbeCYnDOOhR7ZlMF/KcGNRoz0i/CMNr+RQgtbSdW+lwzxpCJPOeb6A8oCsb32KduT7MBn
        zvepY/OxakHWiAV0eTibgcZUp1qDnZXuaHoKL0fgzgDtNdVsMc+gHZNjpSQazNb6sKEu4k
        c0bwQXViyfkF5vnvjTQwejsEp5pXdFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-sz7MCxA8O9yRESRWYWoc3Q-1; Thu, 04 Mar 2021 14:21:56 -0500
X-MC-Unique: sz7MCxA8O9yRESRWYWoc3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54EAB801814;
        Thu,  4 Mar 2021 19:21:55 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-177.ams2.redhat.com [10.36.114.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 41DA619CAB;
        Thu,  4 Mar 2021 19:21:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v4 9/9] HID: lenovo: Add support for Thinkpad X1 Tablet Thin keyboard
Date:   Thu,  4 Mar 2021 20:21:34 +0100
Message-Id: <20210304192134.520919-10-hdegoede@redhat.com>
In-Reply-To: <20210304192134.520919-1-hdegoede@redhat.com>
References: <20210304192134.520919-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Thinkpad X1 Tablet Thin keyboard's HID interface for the media-keys
and other special functions, is quite similar to the Thinkpad 10 ultrabook
keyboard's mouse/media-keys HID interface.

The only difference is that it needs a bit different key mappings.

Add support for the mute-LED and the non-standard media-keys on this
keyboard by re-using the tp10_ultrabook_kbd code combined with a new
lenovo_input_mapping_x1_tab_kbd() function.

Co-authored-by: Alexander Kobel <a-kobel@a-kobel.de>
Tested-by: Alexander Kobel <a-kobel@a-kobel.de>
Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 61 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index a33de5022ec3..93b1f935e526 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -266,6 +266,54 @@ static int lenovo_input_mapping_tp10_ultrabook_kbd(struct hid_device *hdev,
 	return 0;
 }
 
+static int lenovo_input_mapping_x1_tab_kbd(struct hid_device *hdev,
+		struct hid_input *hi, struct hid_field *field,
+		struct hid_usage *usage, unsigned long **bit, int *max)
+{
+	/*
+	 * The ThinkPad X1 Tablet Thin Keyboard uses 0x000c0001 usage for
+	 * a bunch of keys which have no standard consumer page code.
+	 */
+	if (usage->hid == 0x000c0001) {
+		switch (usage->usage_index) {
+		case 0: /* Fn-F10: Enable/disable bluetooth */
+			map_key_clear(KEY_BLUETOOTH);
+			return 1;
+		case 1: /* Fn-F11: Keyboard settings */
+			map_key_clear(KEY_KEYBOARD);
+			return 1;
+		case 2: /* Fn-F12: User function / Cortana */
+			map_key_clear(KEY_MACRO1);
+			return 1;
+		case 3: /* Fn-PrtSc: Snipping tool */
+			map_key_clear(KEY_SELECTIVE_SCREENSHOT);
+			return 1;
+		case 8: /* Fn-Esc: Fn-lock toggle */
+			map_key_clear(KEY_FN_ESC);
+			return 1;
+		case 9: /* Fn-F4: Mute/unmute microphone */
+			map_key_clear(KEY_MICMUTE);
+			return 1;
+		case 10: /* Fn-F9: Settings */
+			map_key_clear(KEY_CONFIG);
+			return 1;
+		case 13: /* Fn-F7: Manage external displays */
+			map_key_clear(KEY_SWITCHVIDEOMODE);
+			return 1;
+		case 14: /* Fn-F8: Enable/disable wifi */
+			map_key_clear(KEY_WLAN);
+			return 1;
+		}
+	}
+
+	if (usage->hid == (HID_UP_KEYBOARD | 0x009a)) {
+		map_key_clear(KEY_SYSRQ);
+		return 1;
+	}
+
+	return 0;
+}
+
 static int lenovo_input_mapping(struct hid_device *hdev,
 		struct hid_input *hi, struct hid_field *field,
 		struct hid_usage *usage, unsigned long **bit, int *max)
@@ -289,6 +337,8 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
 							       usage, bit, max);
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
+		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
 	default:
 		return 0;
 	}
@@ -375,6 +425,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 		lenovo_features_set_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
 		if (ret)
 			return ret;
@@ -519,6 +570,7 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 	case USB_DEVICE_ID_LENOVO_CBTKBD:
 		return lenovo_event_cptkbd(hdev, field, usage, value);
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
 	default:
 		return 0;
@@ -800,6 +852,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		lenovo_led_set_tpkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
 	}
@@ -1038,6 +1091,7 @@ static int lenovo_probe(struct hid_device *hdev,
 		ret = lenovo_probe_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		ret = lenovo_probe_tp10ubkbd(hdev);
 		break;
 	default:
@@ -1103,6 +1157,7 @@ static void lenovo_remove(struct hid_device *hdev)
 		lenovo_remove_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
+	case USB_DEVICE_ID_LENOVO_X1_TAB:
 		lenovo_remove_tp10ubkbd(hdev);
 		break;
 	}
@@ -1142,6 +1197,12 @@ static const struct hid_device_id lenovo_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IBM, USB_DEVICE_ID_IBM_SCROLLPOINT_800DPI_OPTICAL_PRO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_SCROLLPOINT_OPTICAL) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_TP10UBKBD) },
+	/*
+	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard
+	 * part, while letting hid-multitouch.c handle the touchpad and trackpoint.
+	 */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
 	{ }
 };
 
-- 
2.30.1

