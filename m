Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7462ECEBB
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 12:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbhAGL2f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 06:28:35 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:38415 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAGL2e (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 06:28:34 -0500
Received: from [114.252.213.174] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1kxTSJ-0006gc-J6; Thu, 07 Jan 2021 11:27:52 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, jkosina@suse.cz
Cc:     hui.wang@canonical.com
Subject: [PATCH] HID: multitouch: add a quirk to skip set inputmode for 2 new laptops
Date:   Thu,  7 Jan 2021 19:27:08 +0800
Message-Id: <20210107112708.25990-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

we have 2 latest Thinkpad laptops, the synaptics trackpoint module is
connected to i8042 bus and the synaptics touchpad module is on the i2c
bus. The trackpoint is driven by input/mouse/trackpoint.c and the
touchpad is driven by hid-multitouch.c.

They all work well independently, but if users press any buttons of
trackpoint and meanwhile move finger on the touchpad, the touchpad
can't work, the i2c bus can't generate interrupts even. That is to say
the touchpad can't work with trackpoint together, once trackpoint
works, the touchpad stops working.

The current hid driver parses the device descriptor and selects the
hid-multitouch.c and applies the MT_CLS_WIN_8 to the touchpad, I found
this issue begins to happen after the driver sets the
MT_INPUTMODE_TOUCHPAD to the device, If skipping to set it, the
touchpad work well and doesn't have that issue, even after suspend and
resume, the touchpad still work well.

This touchpad module doesn't support multi inputmodes, and its init
mode is set by BIOS already, it is safe to skip to set it again in
the kernel driver.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/hid/hid-multitouch.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 0743ef51d3b2..3a658c4b4b05 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -70,6 +70,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_WIN8_PTP_BUTTONS	BIT(18)
 #define MT_QUIRK_SEPARATE_APP_REPORT	BIT(19)
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
+#define MT_QUIRK_SKIP_SET_INPUTMODE	BIT(21)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -191,6 +192,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_EXPORT_ALL_INPUTS		0x0013
 /* reserved					0x0014 */
 #define MT_CLS_WIN_8_FORCE_MULTI_INPUT		0x0015
+#define MT_CLS_WIN_8_SKIP_SET_INPUTMODE		0x0016
 
 /* vendor specific classes */
 #define MT_CLS_3M				0x0101
@@ -283,6 +285,15 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_WIN8_PTP_BUTTONS |
 			MT_QUIRK_FORCE_MULTI_INPUT,
 		.export_all_inputs = true },
+	{ .name = MT_CLS_WIN_8_SKIP_SET_INPUTMODE,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_IGNORE_DUPLICATES |
+			MT_QUIRK_HOVERING |
+			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_STICKY_FINGERS |
+			MT_QUIRK_WIN8_PTP_BUTTONS |
+			MT_QUIRK_SKIP_SET_INPUTMODE,
+		.export_all_inputs = true },
 
 	/*
 	 * vendor specific classes
@@ -1419,6 +1430,8 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 
 	switch (usage->hid) {
 	case HID_DG_INPUTMODE:
+		if (cls->quirks & MT_QUIRK_SKIP_SET_INPUTMODE)
+			return false;
 		/*
 		 * Some elan panels wrongly declare 2 input mode features,
 		 * and silently ignore when we set the value in the second
@@ -2058,6 +2071,11 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_SYNAPTICS, 0xce09) },
 
+	/* Synaptics devices */
+	{ .driver_data = MT_CLS_WIN_8_SKIP_SET_INPUTMODE,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_SYNAPTICS, 0xce57) },
+
 	/* TopSeed panels */
 	{ .driver_data = MT_CLS_TOPSEED,
 		MT_USB_DEVICE(USB_VENDOR_ID_TOPSEED2,
-- 
2.25.1

