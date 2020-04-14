Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F751A7733
	for <lists+linux-input@lfdr.de>; Tue, 14 Apr 2020 11:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437547AbgDNJSy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Apr 2020 05:18:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39961 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437500AbgDNJSv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Apr 2020 05:18:51 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jOHiQ-0005BN-R6; Tue, 14 Apr 2020 09:18:47 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] HID: multitouch: Remove MT_CLS_WIN_8_DUAL
Date:   Tue, 14 Apr 2020 17:18:42 +0800
Message-Id: <20200414091842.25972-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After commit c23e2043d5f7 ("HID: multitouch: do not filter mice nodes"),
MT_CLS_WIN_8 also supports mouse nodes, hence make MT_CLS_WIN_8_DUAL
redundant.

Remove MT_CLS_WIN_8_DUAL accordingly.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/hid/hid-ids.h        |  9 --------
 drivers/hid/hid-multitouch.c | 45 ++----------------------------------
 2 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b18b13147a6f..7134389afd2e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -76,12 +76,8 @@
 
 #define USB_VENDOR_ID_ALPS_JP		0x044E
 #define HID_DEVICE_ID_ALPS_U1_DUAL	0x120B
-#define HID_DEVICE_ID_ALPS_U1_DUAL_PTP	0x121F
-#define HID_DEVICE_ID_ALPS_U1_DUAL_3BTN_PTP	0x1220
 #define HID_DEVICE_ID_ALPS_U1		0x1215
 #define HID_DEVICE_ID_ALPS_T4_BTNLESS	0x120C
-#define HID_DEVICE_ID_ALPS_1222		0x1222
-
 
 #define USB_VENDOR_ID_AMI		0x046b
 #define USB_DEVICE_ID_AMI_VIRT_KEYBOARD_AND_MOUSE	0xff10
@@ -281,9 +277,6 @@
 
 #define USB_VENDOR_ID_CIDC		0x1677
 
-#define I2C_VENDOR_ID_CIRQUE		0x0488
-#define I2C_PRODUCT_ID_CIRQUE_121F	0x121F
-
 #define USB_VENDOR_ID_CJTOUCH		0x24b8
 #define USB_DEVICE_ID_CJTOUCH_MULTI_TOUCH_0020	0x0020
 #define USB_DEVICE_ID_CJTOUCH_MULTI_TOUCH_0040	0x0040
@@ -729,8 +722,6 @@
 #define USB_DEVICE_ID_LENOVO_SCROLLPOINT_OPTICAL	0x6049
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
-#define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
-#define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 
 #define USB_VENDOR_ID_LG		0x1fd2
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 362805ddf377..bcd37abb2a4a 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -188,7 +188,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 /* reserved					0x0011 */
 #define MT_CLS_WIN_8				0x0012
 #define MT_CLS_EXPORT_ALL_INPUTS		0x0013
-#define MT_CLS_WIN_8_DUAL			0x0014
+/* reserved					0x0014 */
 
 /* vendor specific classes */
 #define MT_CLS_3M				0x0101
@@ -272,14 +272,6 @@ static const struct mt_class mt_classes[] = {
 		.quirks = MT_QUIRK_ALWAYS_VALID |
 			MT_QUIRK_CONTACT_CNT_ACCURATE,
 		.export_all_inputs = true },
-	{ .name = MT_CLS_WIN_8_DUAL,
-		.quirks = MT_QUIRK_ALWAYS_VALID |
-			MT_QUIRK_IGNORE_DUPLICATES |
-			MT_QUIRK_HOVERING |
-			MT_QUIRK_CONTACT_CNT_ACCURATE |
-			MT_QUIRK_WIN8_PTP_BUTTONS,
-		.export_all_inputs = true },
-
 	/*
 	 * vendor specific classes
 	 */
@@ -754,8 +746,7 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 			MT_STORE_FIELD(inrange_state);
 			return 1;
 		case HID_DG_CONFIDENCE:
-			if ((cls->name == MT_CLS_WIN_8 ||
-				cls->name == MT_CLS_WIN_8_DUAL) &&
+			if (cls->name == MT_CLS_WIN_8 &&
 				(field->application == HID_DG_TOUCHPAD ||
 				 field->application == HID_DG_TOUCHSCREEN))
 				app->quirks |= MT_QUIRK_CONFIDENCE;
@@ -1786,32 +1777,6 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_3M,
 			USB_DEVICE_ID_3M3266) },
 
-	/* Alps devices */
-	{ .driver_data = MT_CLS_WIN_8_DUAL,
-		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
-			USB_VENDOR_ID_ALPS_JP,
-			HID_DEVICE_ID_ALPS_U1_DUAL_PTP) },
-	{ .driver_data = MT_CLS_WIN_8_DUAL,
-		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
-			USB_VENDOR_ID_ALPS_JP,
-			HID_DEVICE_ID_ALPS_U1_DUAL_3BTN_PTP) },
-	{ .driver_data = MT_CLS_WIN_8_DUAL,
-		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
-			USB_VENDOR_ID_ALPS_JP,
-			HID_DEVICE_ID_ALPS_1222) },
-
-	/* Lenovo X1 TAB Gen 2 */
-	{ .driver_data = MT_CLS_WIN_8_DUAL,
-		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
-			   USB_VENDOR_ID_LENOVO,
-			   USB_DEVICE_ID_LENOVO_X1_TAB) },
-
-	/* Lenovo X1 TAB Gen 3 */
-	{ .driver_data = MT_CLS_WIN_8_DUAL,
-		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
-			   USB_VENDOR_ID_LENOVO,
-			   USB_DEVICE_ID_LENOVO_X1_TAB3) },
-
 	/* Anton devices */
 	{ .driver_data = MT_CLS_EXPORT_ALL_INPUTS,
 		MT_USB_DEVICE(USB_VENDOR_ID_ANTON,
@@ -1846,12 +1811,6 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_CHUNGHWAT,
 			USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH) },
 
-	/* Cirque devices */
-	{ .driver_data = MT_CLS_WIN_8_DUAL,
-		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
-			I2C_VENDOR_ID_CIRQUE,
-			I2C_PRODUCT_ID_CIRQUE_121F) },
-
 	/* CJTouch panels */
 	{ .driver_data = MT_CLS_NSMU,
 		MT_USB_DEVICE(USB_VENDOR_ID_CJTOUCH,
-- 
2.17.1

