Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D907292319
	for <lists+linux-input@lfdr.de>; Mon, 19 Oct 2020 09:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgJSHsZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 03:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24496 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727864AbgJSHsZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 03:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603093703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yLUl2UEG5uxm7VbNvyY/oa+0hPu9UGUuZW2RfTBx7Zw=;
        b=NJW8PS30GsoVcfBiVSnjPDVLslo5dJSqQxn0uMRq4IXUGSDgMoWnapzStUQpJAmK12yXEx
        stBqyIW1GDl3/mmu0xHXhaoBqG30TvMvdnIYKARKJ7dUUQmw20/LN6wDkfehIHEXaZMccK
        /aMpe/U/BappzGocB2o9WeAuBphnGYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-yUktvYwXNM2FnPuXfMbd5w-1; Mon, 19 Oct 2020 03:48:21 -0400
X-MC-Unique: yUktvYwXNM2FnPuXfMbd5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17C58835B49;
        Mon, 19 Oct 2020 07:48:20 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC7261983;
        Mon, 19 Oct 2020 07:48:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: ite: Replace ABS_MISC 120/121 events with touchpad on/off keypresses
Date:   Mon, 19 Oct 2020 09:48:14 +0200
Message-Id: <20201019074814.17722-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The usb-hid keyboard-dock for the Acer Switch 10 SW5-012 model declares
an application and hid-usage page of 0x0088 for the INPUT(4) report which
it sends. This reports contains 2 8-bit fields which are declared as
HID_MAIN_ITEM_VARIABLE.

The keyboard-touchpad combo never actually generates this report, except
when the touchpad is toggled on/off with the Fn + F7 hotkey combo. The
toggle on/off is handled inside the keyboard-dock, when the touchpad is
toggled off it simply stops sending events.

When the touchpad is toggled on/off an INPUT(4) report is generated with
the first content byte set to 120/121, before this commit the kernel
would report this as ABS_MISC 120/121 events.

Patch the descriptor to replace the HID_MAIN_ITEM_VARIABLE with
HID_MAIN_ITEM_RELATIVE (because no key-presss release events are send)
and add mappings for the 0x00880078 and 0x00880079 usages to generate
touchpad on/off key events when the touchpad is toggled on/off.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ite.c | 61 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 044a93f3c117..742c052b0110 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -11,6 +11,48 @@
 
 #include "hid-ids.h"
 
+#define QUIRK_TOUCHPAD_ON_OFF_REPORT		BIT(0)
+
+static __u8 *ite_report_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int *rsize)
+{
+	unsigned long quirks = (unsigned long)hid_get_drvdata(hdev);
+
+	if (quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) {
+		if (*rsize == 188 && rdesc[162] == 0x81 && rdesc[163] == 0x02) {
+			hid_info(hdev, "Fixing up ITE keyboard report descriptor\n");
+			rdesc[163] = HID_MAIN_ITEM_RELATIVE;
+		}
+	}
+
+	return rdesc;
+}
+
+static int ite_input_mapping(struct hid_device *hdev,
+		struct hid_input *hi, struct hid_field *field,
+		struct hid_usage *usage, unsigned long **bit,
+		int *max)
+{
+
+	unsigned long quirks = (unsigned long)hid_get_drvdata(hdev);
+
+	if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
+	    (usage->hid & HID_USAGE_PAGE) == 0x00880000) {
+		if (usage->hid == 0x00880078) {
+			/* Touchpad on, userspace expects F22 for this */
+			hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_F22);
+			return 1;
+		}
+		if (usage->hid == 0x00880079) {
+			/* Touchpad off, userspace expects F23 for this */
+			hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_F23);
+			return 1;
+		}
+		return -1;
+	}
+
+	return 0;
+}
+
 static int ite_event(struct hid_device *hdev, struct hid_field *field,
 		     struct hid_usage *usage, __s32 value)
 {
@@ -37,13 +79,27 @@ static int ite_event(struct hid_device *hdev, struct hid_field *field,
 	return 0;
 }
 
+static int ite_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+
+	hid_set_drvdata(hdev, (void *)id->driver_data);
+
+	ret = hid_open_report(hdev);
+	if (ret)
+		return ret;
+
+	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+}
+
 static const struct hid_device_id ite_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE8595) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_258A, USB_DEVICE_ID_258A_6A88) },
 	/* ITE8595 USB kbd ctlr, with Synaptics touchpad connected to it. */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_SYNAPTICS,
-		     USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },
+		     USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012),
+	  .driver_data = QUIRK_TOUCHPAD_ON_OFF_REPORT },
 	/* ITE8910 USB kbd ctlr, with Synaptics touchpad connected to it. */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_SYNAPTICS,
@@ -55,6 +111,9 @@ MODULE_DEVICE_TABLE(hid, ite_devices);
 static struct hid_driver ite_driver = {
 	.name = "itetech",
 	.id_table = ite_devices,
+	.probe = ite_probe,
+	.report_fixup = ite_report_fixup,
+	.input_mapping = ite_input_mapping,
 	.event = ite_event,
 };
 module_hid_driver(ite_driver);
-- 
2.28.0

