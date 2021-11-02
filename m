Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D41E442B76
	for <lists+linux-input@lfdr.de>; Tue,  2 Nov 2021 11:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhKBKRS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Nov 2021 06:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhKBKRQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Nov 2021 06:17:16 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A17C061714
        for <linux-input@vger.kernel.org>; Tue,  2 Nov 2021 03:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
        Resent-Message-ID:In-Reply-To:References;
        bh=CIE3obVCB0hYn/RqD4zQ+KPMnAddLhZyIwoBcDDMNuY=; t=1635848081; x=1637057681; 
        b=SzNSaZLAVveHfHM03bFG0D08PtomKBldSrz1a1qZXVMLkJrKbBe0xs0tMBC1NAeK5WtVuPVuo7E
        YLTvGBYm4xhWkVlFSQ4n0D2MOU1LN45RrLmhvpfHxEEyt7vuHGml/rgJv1fb0mDRTTsompc88Qe7n
        /lwYHWYEx8TriiQidrBY07Iozs3IZ/ch/ZA9XPCHyok5PI+/GZhqKo8Bo7xMEWL0vsQitagzo+cIO
        eF1M8AZzwoND4vXt+aFomyZtyKAyd3gLhTQanYGGrIGLFW8gnBbIjlZC9ReBOPHsyJpZoNrzX0NOa
        u1Ut56fUliqbZaOhAW4LUy2bWBzdNZGMm6+Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.95)
        (envelope-from <benjamin@sipsolutions.net>)
        id 1mhqoQ-009xJu-2W;
        Tue, 02 Nov 2021 11:14:38 +0100
From:   Benjamin Berg <benjamin@sipsolutions.net>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benjamin Berg <bberg@redhat.com>
Subject: [PATCH] HID: apple: Add 2021 magic keyboard model
Date:   Tue,  2 Nov 2021 11:08:26 +0100
Message-Id: <20211102100826.26824-1-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Benjamin Berg <bberg@redhat.com>

The newer magic keyboard (and laptop) models have a different Fn key
configuration. Also, the PIDs are still missing.

This patch adds the new keycodes and the PID for the small magic
keyboard model (without numpad and fingerprint reader, MK2A3Y/A,
Model A2450).

Signed-off-by: Benjamin Berg <bberg@redhat.com>
---

Other PIDs will also need to be added and the translation table
selection will need updating at that point. For now, this works well for
the small magic keyboard model without fingerprint reader.
---
 drivers/hid/hid-apple.c | 33 ++++++++++++++++++++++++++++++++-
 drivers/hid/hid-ids.h   |  1 +
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 6ccfa0cb997a..fb3fb658f6d9 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -70,6 +70,28 @@ struct apple_key_translation {
 	u8 flags;
 };
 
+static const struct apple_key_translation apple2021_fn_keys[] = {
+	{ KEY_BACKSPACE, KEY_DELETE },
+	{ KEY_ENTER,	KEY_INSERT },
+	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
+	{ KEY_F2,	KEY_BRIGHTNESSUP,   APPLE_FLAG_FKEY },
+	{ KEY_F3,	KEY_SCALE,          APPLE_FLAG_FKEY },
+	{ KEY_F4,	KEY_SEARCH,         APPLE_FLAG_FKEY },
+	{ KEY_F5,	KEY_MICMUTE,        APPLE_FLAG_FKEY },
+	{ KEY_F6,	KEY_SLEEP,          APPLE_FLAG_FKEY },
+	{ KEY_F7,	KEY_PREVIOUSSONG,   APPLE_FLAG_FKEY },
+	{ KEY_F8,	KEY_PLAYPAUSE,      APPLE_FLAG_FKEY },
+	{ KEY_F9,	KEY_NEXTSONG,       APPLE_FLAG_FKEY },
+	{ KEY_F10,	KEY_MUTE,           APPLE_FLAG_FKEY },
+	{ KEY_F11,	KEY_VOLUMEDOWN,     APPLE_FLAG_FKEY },
+	{ KEY_F12,	KEY_VOLUMEUP,       APPLE_FLAG_FKEY },
+	{ KEY_UP,	KEY_PAGEUP },
+	{ KEY_DOWN,	KEY_PAGEDOWN },
+	{ KEY_LEFT,	KEY_HOME },
+	{ KEY_RIGHT,	KEY_END },
+	{ }
+};
+
 static const struct apple_key_translation macbookair_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
@@ -214,7 +236,9 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 	}
 
 	if (fnmode) {
-		if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+		if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021_ANSI)
+			table = apple2021_fn_keys;
+		else if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
 				hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
 			table = macbookair_fn_keys;
 		else if (hid->product < 0x21d || hid->product >= 0x300)
@@ -377,6 +401,9 @@ static void apple_setup_input(struct input_dev *input)
 	for (trans = apple_iso_keyboard; trans->from; trans++)
 		set_bit(trans->to, input->keybit);
 
+	for (trans = apple2021_fn_keys; trans->from; trans++)
+		set_bit(trans->to, input->keybit);
+
 	if (swap_fn_leftctrl) {
 		for (trans = swapped_fn_leftctrl_keys; trans->from; trans++)
 			set_bit(trans->to, input->keybit);
@@ -548,6 +575,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI),
 		.driver_data = APPLE_HAS_FN },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021_ANSI),
+		.driver_data = APPLE_HAS_FN },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021_ANSI),
+		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_ANSI),
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 29564b370341..41038f6355a8 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -164,6 +164,7 @@
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021_ANSI 0x029c
 #define USB_DEVICE_ID_APPLE_WELLSPRING9_ANSI	0x0272
 #define USB_DEVICE_ID_APPLE_WELLSPRING9_ISO		0x0273
 #define USB_DEVICE_ID_APPLE_WELLSPRING9_JIS		0x0274
-- 
2.31.1

