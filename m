Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2FF655336
	for <lists+linux-input@lfdr.de>; Fri, 23 Dec 2022 18:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbiLWRVz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Dec 2022 12:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbiLWRVy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Dec 2022 12:21:54 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3D11132
        for <linux-input@vger.kernel.org>; Fri, 23 Dec 2022 09:21:53 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id i9so7893683edj.4
        for <linux-input@vger.kernel.org>; Fri, 23 Dec 2022 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgpXyYil+VbMzb1BctMd2h2Nr4YQ8hdcp/RgfIPjY9Q=;
        b=ARiBQJt2ZElK2niUZE+688l8BiXF6GR6777F7Yol75U+iZj0/V4FfzLO4MHrC6GZCd
         warvQer+N7dh0fA8JTQ32o1IDq6OiMroJ2yuasfZTg/iU4GlqKovgVx7Khbzg+Vm7ehe
         BIUbBVp8LiR+Rp5nQSh2DbmWGS3GzTyY2fos5bKXCGMhmYzg0XUjTKU69N3ImHsCcgLw
         MyCwYrdduKQQJRyPVff9Fn0EDEC7jwb5pISiMfNB8s9qqQbM7MRYYdmKIud7nrq1HkNm
         re49FJl4EbgZ4yrJpczcS7GqJfIxMrzghMcxsKxokqJU7F1SJqNcnQCBKZQKmupAmOIv
         NfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgpXyYil+VbMzb1BctMd2h2Nr4YQ8hdcp/RgfIPjY9Q=;
        b=BapX7QgvXtgu5dCrOWVHw+U4r2XQpVylDMmXk+htrJqCJ+tYxb9S8KC2IcFdcX3JJ2
         SHD69ghN4JcWDmD+5+afGetxg0rllcq4qdvd8Sl352ORcSvqxlu0NL3dqdMPTGkPQ0wW
         Qf9dboLfI4cH5NxPJX/LGE6SjHvj8pg893+k0IpW7sgu8CwoiizBhn+WDJwgd4+gGjvH
         Nv/1dhKrb3WMj6hY6hJCmbVoVaKDQRPneLr6QX9BjT5g1NvCFrDhclW56htAxFwwSnol
         W5THXIRrbLE5wSd9EBCih8AbjghyMuJXoHXdQNHYV4Ip7FTYeuQhCkojMmIsFWFEKZQH
         Hnag==
X-Gm-Message-State: AFqh2kozsa/eniXngEB8H74dDXsjQVWcUp5xYZrkz6KySuk3OEF++XC9
        hvyNNIVqVEhKctAIIW+Xazm9OIJalfg=
X-Google-Smtp-Source: AMrXdXsveJAwUoXxp1mBXsB/oWih8/PqyNzrrMU4bHckvdpthpxmEVQ2CbyvpOX6P7yVCF7w+Rn04A==
X-Received: by 2002:aa7:c69a:0:b0:46d:e3f8:4ed4 with SMTP id n26-20020aa7c69a000000b0046de3f84ed4mr8835744edq.21.1671816111573;
        Fri, 23 Dec 2022 09:21:51 -0800 (PST)
Received: from localhost ([151.74.146.154])
        by smtp.gmail.com with ESMTPSA id h13-20020a0564020e0d00b0046b00a9eeb5sm1686316edh.49.2022.12.23.09.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 09:21:51 -0800 (PST)
From:   Giuseppe Bilotta <giuseppe.bilotta@gmail.com>
To:     Linux Input ML <linux-input@vger.kernel.org>
Cc:     Giuseppe Bilotta <giuseppe.bilotta@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [RFC PATCH] HID: support the NACON / BigBen PS4 / PC Compact controller
Date:   Fri, 23 Dec 2022 18:21:30 +0100
Message-Id: <20221223172130.938395-1-giuseppe.bilotta@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

---

I have recently come into possession of a NACON / Big Ben Interactive
USB wired PC Compact controller (USB vendor:device 146b:0603).
This is advertised as an «officially licensed PS4™ wired controller»
that «also boasts full compatibility with PC games».

It is supposed to be similar to a DualShock 4 controller except for the
lack of built-in speaker, light bar and “SIXAXIS” motion sensor.
In particular, in addition to the typical gamepad goodies, it has a
built-in touchpad and an audio jack.

As things are currently, the Linux kernel automatically matches it with
the xpad driver, that detects this as a “Generic X-Box controller”.
This kind of works, but in addition to minor issues such as the default
axis mapping being wrong (which could be fixed in the xpad driver),
the major downside for the xpad driver binding to the controller
is that it fails to expose the touchpad and the audio jack.

My hope was to let the xpad driver skip this device, and to manage it
through the hid subsystem, expecting the hid-sony and/or hid-playstation
drivers to be able to manage it.

However, I obviously don't understand enough about how the hid driver
manages the bindings, and so far I've been at a loss about making this
work. The hack to ignore the device in xpad works, although it's a
horrible hack that probably shouldn't be needed in the first place,
but the HID subsystem doesn't seem to pick up the device.
This patch is my very poor (and currently NOT WORKING) attempt,
and since I'm obviously going at this all wrong, I'd be glad for
any recommendations on how to approach this.

Cheers,

Giuseppe Bilotta


 drivers/hid/hid-ids.h         | 1 +
 drivers/hid/hid-playstation.c | 5 ++++-
 drivers/hid/hid-quirks.c      | 1 +
 drivers/hid/hid-sony.c        | 3 +++
 drivers/input/joystick/xpad.c | 5 +++++
 5 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 82713ef3aaa6..78d993415071 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -250,6 +250,7 @@
 #define USB_VENDOR_ID_BETOP_2185V2BFM	0x20bc
 
 #define USB_VENDOR_ID_BIGBEN	0x146b
+#define USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTROLLER	0x0603
 #define USB_DEVICE_ID_BIGBEN_PS3OFMINIPAD	0x0902
 
 #define USB_VENDOR_ID_BTC		0x046e
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index f399bf0d3c8c..8302394479bd 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2589,7 +2589,8 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_stop;
 	}
 
-	if (hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER ||
+	if (hdev->product == USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTROLLER ||
+		hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER ||
 		hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_2 ||
 		hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE) {
 		dev = dualshock4_create(hdev);
@@ -2632,6 +2633,8 @@ static void ps_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id ps_devices[] = {
+	/* NACON / BigBen Interact Wired PC Compact controller */
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTROLLER) },
 	/* Sony DualShock 4 controllers for PS4 */
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0e9702c7f7d6..fa9503257621 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -639,6 +639,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP_LTD, USB_DEVICE_ID_SUPER_JOY_BOX_5_PRO) },
 #endif
 #if IS_ENABLED(CONFIG_HID_SONY)
+	{ HID_USB_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTROLLER) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_HARMONY_PS3) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_PS3_BDREMOTE) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_NSG_MR5U_REMOTE) },
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 13125997ab5e..4f5d5643dd19 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -3180,6 +3180,9 @@ static const struct hid_device_id sony_devices[] = {
 	/* SMK-Link PS3 BD Remote Control */
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_PS3_BDREMOTE),
 		.driver_data = PS3REMOTE },
+	/* NACON / BigBen Interact Wired PC Compact controller */
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTROLLER),
+		.driver_data = DUALSHOCK4_CONTROLLER_USB },
 	/* Sony Dualshock 4 controllers for PS4 */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER),
 		.driver_data = DUALSHOCK4_CONTROLLER_USB },
diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 2959d80f7fdb..d3d3ce84bd6c 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -92,6 +92,7 @@
 #define XTYPE_XBOX360W    2
 #define XTYPE_XBOXONE     3
 #define XTYPE_UNKNOWN     4
+#define XTYPE_NOTXBOX     0xff
 
 /* Send power-off packet to xpad360w after holding the mode button for this many
  * seconds
@@ -281,6 +282,7 @@ static const struct xpad_device {
 	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
 	{ 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
+	{ 0x146b, 0x0603, "BigBen Interactive PC Compact Controller", 0, XTYPE_NOTXBOX },
 	{ 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
@@ -1951,6 +1953,9 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 			break;
 	}
 
+	if (xpad_device[i].xtype == XTYPE_NOTXBOX)
+		return -ENODEV;
+
 	xpad = kzalloc(sizeof(struct usb_xpad), GFP_KERNEL);
 	if (!xpad)
 		return -ENOMEM;
-- 
2.39.0

