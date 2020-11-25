Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E08A2C43C0
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 16:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730749AbgKYPgo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 10:36:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:54464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730731AbgKYPgn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 10:36:43 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89C2721D7F;
        Wed, 25 Nov 2020 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606318602;
        bh=PhV5uaDhmqHw5CUW204MCd55v6G2ULGtBNvW9ZgaP6c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PHBnd2OepdDi1f0dB39PLTGHSaUv8yZd0G7bzg8GleG3tBze+AKfs+Jy1vNgaiSJc
         i1F1mMyvQni/aQ63jVfjeI4Th4TWISXe0XRE9bmFXAANB0JfyLr6gR5wrj21xrs2di
         MLcVGqJC0hEY9RdefT66iJFFpNSmLYmHaQlmyV8o=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/23] HID: ite: Replace ABS_MISC 120/121 events with touchpad on/off keypresses
Date:   Wed, 25 Nov 2020 10:36:17 -0500
Message-Id: <20201125153638.810419-2-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125153638.810419-1-sashal@kernel.org>
References: <20201125153638.810419-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 3c785a06dee99501a17f8e8cf29b2b7e3f1e94ea ]

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
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ite.c | 61 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 044a93f3c1178..742c052b0110a 100644
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
2.27.0

