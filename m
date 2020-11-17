Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A032B5B3C
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 09:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgKQIsJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 03:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgKQIsJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 03:48:09 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0A8C0613CF
        for <linux-input@vger.kernel.org>; Tue, 17 Nov 2020 00:48:08 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id o21so28316210ejb.3
        for <linux-input@vger.kernel.org>; Tue, 17 Nov 2020 00:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7XStV/2dVeiArIHuu6Y5yZaJGXPki6yS2KcN0YZ/+g=;
        b=iDQbpqxfAxNYssRozJceRlRHbu3hCuXinNTCf7Yl0syf94+HSfkh8kqIVWEx4a/nt1
         OPC9KiXdebs6JgfYDpdxSmk9Xs5lkIdymWd+gz5eP2wQGRh/tYbUlGCheXerUpuNXJoe
         L2AlcUDfwu7BuKypcdvANtY61q3CrjcnDbO16wE/pwnWsE3qxEv2wA5orln8w22ZG5m1
         agtaPMUW27x7T8LlqqwcTxL8jyqmD1UY3ghn9v+wGTlJrPfTxIOrtYc2kj1IVWfswaWW
         UEVzWhld1dhDaeMoFqiw2Lrlg3f7neSnweGpbZJM/VTH4g2+J7VXP59jjCA31EyC/j2Q
         ogdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7XStV/2dVeiArIHuu6Y5yZaJGXPki6yS2KcN0YZ/+g=;
        b=NPhHdHs3p74KdO57ZYv8lpZ8312NOoLdDEQXXcWQtWhdDfpvzYgphB0BGA8KsFcUvO
         5ntherMlB+Qn8Hj5O4sLx76GmJ6kr2uBqkgXn0TpbXgAhv9ShKfHj87ivg16P6duZFfa
         UlUpSlDLAV5baNOsT3iHXlMLYY7BBru8PlURVOesK5gZSu75MRWepZBrA42oh/xz+4AL
         AKh4l+KRBzlpcAcjFKGzq5k2dSaGmIlX5aWdLozxvqfCAYIdktm25sfQcOaL4BelF5TE
         oNWCnEvzrt4oHh8unNkC6xt/v1WmDRT/2EkhAVV56pWxBG8Ae76Kp+TLSlV6bKkVjbBW
         ky8Q==
X-Gm-Message-State: AOAM533qcfgvrH/lgxpVy6dh4bYIJNgDJZBkcgjHiCr8A0M/cjgQrBZR
        vUs3KkO6ub3dbqLEfra4iuArm0+jeMk=
X-Google-Smtp-Source: ABdhPJzXZm/AE2xxd4uf6e4wNi3VpxGpRbufCCp+caSdlUYnldi7fuk3pAl1C6a3PbBh3tActIK7wA==
X-Received: by 2002:a17:906:934d:: with SMTP id p13mr17640284ejw.245.1605602887131;
        Tue, 17 Nov 2020 00:48:07 -0800 (PST)
Received: from aurora.lan (g17120.upc-g.chello.nl. [80.57.17.120])
        by smtp.gmail.com with ESMTPSA id lz27sm11425683ejb.39.2020.11.17.00.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 00:48:06 -0800 (PST)
From:   "Wladimir J. van der Laan" <laanwj@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        Ethan Warth <redyoshi49q@gmail.com>,
        "Wladimir J . van der Laan" <laanwj@gmail.com>
Subject: [PATCH] HID: add support for 0079:1846 Mayflash/Dragonrise USB Gamecube Adapter
Date:   Tue, 17 Nov 2020 09:48:00 +0100
Message-Id: <20201117084800.2054276-1-laanwj@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ethan Warth <redyoshi49q@gmail.com>

Mayflash/Dragonrise seems to have yet another device ID for one of their
Gamecube controller adapters.  Previous to this commit, the adapter
registered only one /dev/input/js* device, and all controller inputs (from
any controller) were mapped to this device.  This patch defines the 1846
USB device ID and enables the HID_QUIRK_MULTI_INPUT quirk for it, which
fixes that (with the patch, four /dev/input/js* devices are created, one
for each of the four controller ports).

Signed-off-by: Ethan Warth <redyoshi49q@gmail.com>
Tested-by: Wladimir J. van der Laan <laanwj@gmail.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-mf.c     | 2 ++
 drivers/hid/hid-quirks.c | 2 ++
 3 files changed, 5 insertions(+)

This patch is not my work but a direct repost of
https://lore.kernel.org/lkml/CAAPc1Th4mgE=ntLY=NXn2Jbfgi0OBpZ5R2sYGhWJ_4+syuPA9w@mail.gmail.com/T/.

The original patch was not merged due to a line break issue. I have corrected this.

I have tested it against current master as well as ubuntu focal's 5.4.0,
and it works, it separates the adapter into four different evdev devices,
making it usable in Linux. It also enables rumble (which I have not tested due to lack
of a capable controller).

[   67.150155] usb 2-1: new full-speed USB device number 2 using xhci_hcd
[   67.325014] usb 2-1: New USB device found, idVendor=0079, idProduct=1846, bcdDevice= 1.00
[   67.325020] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   67.325024] usb 2-1: Product: GameCube Controller Adapter
[   67.325026] usb 2-1: Manufacturer: Nintendo
[   67.367729] input: Nintendo GameCube Controller Adapter as /devices/pci0000:00/0000:00:10.0/usb2/2-1/2-1:1.0/0003:0079:1846.0004/input/input21
[   67.367906] input: Nintendo GameCube Controller Adapter as /devices/pci0000:00/0000:00:10.0/usb2/2-1/2-1:1.0/0003:0079:1846.0004/input/input22
[   67.367992] input: Nintendo GameCube Controller Adapter as /devices/pci0000:00/0000:00:10.0/usb2/2-1/2-1:1.0/0003:0079:1846.0004/input/input23
[   67.368066] input: Nintendo GameCube Controller Adapter as /devices/pci0000:00/0000:00:10.0/usb2/2-1/2-1:1.0/0003:0079:1846.0004/input/input24
[   67.368143] hid_mf 0003:0079:1846.0004: input,hidraw3: USB HID v1.10 Joystick [Nintendo GameCube Controller Adapter] on usb-0000:00:10.0-1/input0
[   67.368155] hid_mf 0003:0079:1846.0004: Force feedback for HJZ Mayflash game controller adapters by Marcel Hasler <mahasler@gmail.com>

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d69842f79fc665c53243331c3efc9e458233ca65..9132f007fee468099fa08446b7092e0be8ab64f6 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -357,6 +357,7 @@
 #define USB_DEVICE_ID_DRAGONRISE_DOLPHINBAR	0x1803
 #define USB_DEVICE_ID_DRAGONRISE_GAMECUBE1	0x1843
 #define USB_DEVICE_ID_DRAGONRISE_GAMECUBE2	0x1844
+#define USB_DEVICE_ID_DRAGONRISE_GAMECUBE3	0x1846
 
 #define USB_VENDOR_ID_DWAV		0x0eef
 #define USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER	0x0001
diff --git a/drivers/hid/hid-mf.c b/drivers/hid/hid-mf.c
index fc75f30f537c95dbc7a4c19581c6953ef76e40a8..92d7ecd41a78fb94910f044daf4bfb91594f93d3 100644
--- a/drivers/hid/hid-mf.c
+++ b/drivers/hid/hid-mf.c
@@ -153,6 +153,8 @@ static const struct hid_device_id mf_devices[] = {
 		.driver_data = HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE2),
 		.driver_data = 0 }, /* No quirk required */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE3),
+		.driver_data = HID_QUIRK_MULTI_INPUT },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, mf_devices);
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 7a2be0205dfd12a81a82e963893ca664512bb526..e67134a4c3dec7533a9fecefb293a8a624bf28de 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -72,6 +72,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_REDRAGON_SEYMUR2), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_DOLPHINBAR), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE1), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE3), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_PS3), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_WIIU), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DWAV, USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER), HID_QUIRK_MULTI_INPUT | HID_QUIRK_NOGET },
@@ -479,6 +480,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_DOLPHINBAR) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE1) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_GAMECUBE3) },
 #endif
 #if IS_ENABLED(CONFIG_HID_MICROSOFT)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_COMFORT_MOUSE_4500) },
-- 
2.25.1

