Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B5D3E5C93
	for <lists+linux-input@lfdr.de>; Tue, 10 Aug 2021 16:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238608AbhHJOKb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Aug 2021 10:10:31 -0400
Received: from mail-qk1-f170.google.com ([209.85.222.170]:42618 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbhHJOKa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Aug 2021 10:10:30 -0400
Received: by mail-qk1-f170.google.com with SMTP id s132so1585102qke.9
        for <linux-input@vger.kernel.org>; Tue, 10 Aug 2021 07:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ksIJFfmk3oieVqkl1wB8+leH32E1C35SBWhX4/Ms3b4=;
        b=eMPdFohlaVxPSUPdetp/1IZNJoFwdHgPy99BbJ81rK38S/EvjkF1quIOf9U4lOxMrq
         P8IN1/XOvh6Ai768o4l1jsMULPyVxXWKRZ80boJft05P+W9DUnMrYHyMTTtpRU/UXHsT
         W0azLpASpHkUiJboXsuX4TXkKPJaZLaa7xY0qTg+yJqiAwawl9fVcdQdgdrpT7NSxD0V
         FJOnBVE+i7NQ3rKXssFA9SJRFoILqxWq+nriSwYA5TPSs1sKxke5lyVpHQWOWN2mxGE8
         A2Q8oAMlqO5kSOlDYoRq6JhMvQwWWTne2qVgoXGOsJ7hqd49nt641KvxyKAOKyNi5jCd
         +yzg==
X-Gm-Message-State: AOAM531D7kAvpZdNVGJJtYWL0UtYpjoh3IL/ja20i8VpBr1+OOofVhQ6
        /h0JZOSyq0spSBEt8eAhMCk=
X-Google-Smtp-Source: ABdhPJzdCexgkCc7+d2AW/uPk/TgzqyWHqoKuZABXPW84LRC2RF3eReF8gBdo2RNlX6h6J14Q5Tz9w==
X-Received: by 2002:a05:620a:f98:: with SMTP id b24mr13861908qkn.367.1628604608224;
        Tue, 10 Aug 2021 07:10:08 -0700 (PDT)
Received: from localhost.localdomain (bras-base-sconpq1802w-grc-12-74-14-61-132.dsl.bell.ca. [74.14.61.132])
        by smtp.gmail.com with ESMTPSA id g1sm10888286qkd.89.2021.08.10.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 07:10:07 -0700 (PDT)
From:   Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>,
        Pascal Giard <pascal.giard@etsmtl.ca>
Subject: [PATCH v2] HID: sony: support for the ghlive ps4 dongles
Date:   Tue, 10 Aug 2021 10:09:32 -0400
Message-Id: <20210810140932.6652-1-daniel.nguyen.1@ens.etsmtl.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This commit adds support for the Guitar Hero Live PS4 dongles.

These dongles require a "magic" USB control message to be sent
every 8 seconds otherwise the dongle will not report events where
the strumbar is hit while a fret is being held.

Note that the GHL_GUITAR_POKE_INTERVAL is reduced to 8 seconds in order
to support PS3, Wii U, and PS4 GHL dongles.

Also note that the constant for vendor id 0x1430 has been renamed from
Activision to RedOctane as self-declared by the device.

Co-developed-by: Pascal Giard <pascal.giard@etsmtl.ca>
Signed-off-by: Pascal Giard <pascal.giard@etsmtl.ca>
Signed-off-by: Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
---

Changes in v2:
* Substituted interrupt messages for control messages
* Removed static const magic value because it will be auto-generated
---
 drivers/hid/Kconfig    |  2 +-
 drivers/hid/hid-ids.h  |  7 ++++---
 drivers/hid/hid-sony.c | 46 ++++++++++++++++++++++++++++++------------
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 160554903ef9..6b17bebcd4a9 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -952,7 +952,7 @@ config HID_SONY
 	  * Buzz controllers
 	  * Sony PS3 Blue-ray Disk Remote Control (Bluetooth)
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
-	  * Guitar Hero Live PS3 and Wii U guitar dongles
+	  * Guitar Hero Live PS3, Wii U and PS4 guitar dongles
 	  * Guitar Hero PS3 and PC guitar dongles
 
 config SONY_FF
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8f1893e68112..55990018836a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -41,9 +41,6 @@
 #define USB_VENDOR_ID_ACTIONSTAR	0x2101
 #define USB_DEVICE_ID_ACTIONSTAR_1011	0x1011
 
-#define USB_VENDOR_ID_ACTIVISION	0x1430
-#define USB_DEVICE_ID_ACTIVISION_GUITAR_DONGLE	0x474c
-
 #define USB_VENDOR_ID_ADS_TECH		0x06e1
 #define USB_DEVICE_ID_ADS_TECH_RADIO_SI470X	0xa155
 
@@ -1018,6 +1015,10 @@
 #define USB_VENDOR_ID_REALTEK		0x0bda
 #define USB_DEVICE_ID_REALTEK_READER	0x0152
 
+#define USB_VENDOR_ID_REDOCTANE		0x1430
+#define USB_DEVICE_ID_REDOCTANE_GUITAR_DONGLE	0x474c
+#define USB_DEVICE_ID_REDOCTANE_PS4_GHLIVE_DONGLE	0x07bb
+
 #define USB_VENDOR_ID_RETROUSB		0xf000
 #define USB_DEVICE_ID_RETROUSB_SNES_RETROPAD	0x0003
 #define USB_DEVICE_ID_RETROUSB_SNES_RETROPORT	0x00f1
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index b3722c51ec78..e48f7720a47c 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -11,8 +11,9 @@
  *  Copyright (c) 2013 Colin Leitner <colin.leitner@gmail.com>
  *  Copyright (c) 2014-2016 Frank Praznik <frank.praznik@gmail.com>
  *  Copyright (c) 2018 Todd Kelner
- *  Copyright (c) 2020 Pascal Giard <pascal.giard@etsmtl.ca>
+ *  Copyright (c) 2020-2021 Pascal Giard <pascal.giard@etsmtl.ca>
  *  Copyright (c) 2020 Sanjay Govind <sanjay.govind9@gmail.com>
+ *  Copyright (c) 2021 Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
  */
 
 /*
@@ -62,6 +63,7 @@
 #define SHANWAN_GAMEPAD           BIT(16)
 #define GH_GUITAR_CONTROLLER      BIT(17)
 #define GHL_GUITAR_PS3WIIU        BIT(18)
+#define GHL_GUITAR_PS4            BIT(19)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -85,18 +87,27 @@
 #define NSG_MRXU_MAX_X 1667
 #define NSG_MRXU_MAX_Y 1868
 
-#define GHL_GUITAR_POKE_INTERVAL 10 /* In seconds */
+/* The PS3/Wii U dongles require a poke every 10 seconds, but the PS4
+ * requires one every 8 seconds. Using 8 seconds for all for simplicity.
+ */
+#define GHL_GUITAR_POKE_INTERVAL 8 /* In seconds */
 #define GUITAR_TILT_USAGE 44
 
-/* Magic value and data taken from GHLtarUtility:
+/* Magic data taken from GHLtarUtility:
  * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
  * Note: The Wii U and PS3 dongles happen to share the same!
  */
-static const u16 ghl_ps3wiiu_magic_value = 0x201;
 static const char ghl_ps3wiiu_magic_data[] = {
 	0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
+/* Magic data for the PS4 dongles sniffed with a USB protocol
+ * analyzer.
+ */
+static const char ghl_ps4_magic_data[] = {
+	0x30, 0x02, 0x08, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+
 /* PS/3 Motion controller */
 static u8 motion_rdesc[] = {
 	0x05, 0x01,         /*  Usage Page (Desktop),               */
@@ -642,14 +653,14 @@ static void ghl_magic_poke(struct timer_list *t)
 		hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
 }
 
-static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
+static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev,
+					   const char ghl_magic_data[], u16 poke_size)
 {
 	struct usb_ctrlrequest *cr;
-	u16 poke_size;
 	u8 *databuf;
 	unsigned int pipe;
+	u16 ghl_magic_value = (((HID_OUTPUT_REPORT + 1) << 8) | ghl_magic_data[0]);
 
-	poke_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
 	pipe = usb_sndctrlpipe(usbdev, 0);
 
 	cr = devm_kzalloc(&sc->hdev->dev, sizeof(*cr), GFP_ATOMIC);
@@ -663,10 +674,10 @@ static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
 	cr->bRequestType =
 		USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
 	cr->bRequest = USB_REQ_SET_CONFIGURATION;
-	cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
+	cr->wValue = cpu_to_le16(ghl_magic_value);
 	cr->wIndex = 0;
 	cr->wLength = cpu_to_le16(poke_size);
-	memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);
+	memcpy(databuf, ghl_magic_data, poke_size);
 	usb_fill_control_urb(
 		sc->ghl_urb, usbdev, pipe,
 		(unsigned char *) cr, databuf, poke_size,
@@ -3030,11 +3041,17 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return -ENODEV;
 	}
 
-	if (sc->quirks & GHL_GUITAR_PS3WIIU) {
+	if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
 		sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
 		if (!sc->ghl_urb)
 			return -ENOMEM;
-		ret = ghl_init_urb(sc, usbdev);
+
+		if (sc->quirks & GHL_GUITAR_PS3WIIU)
+			ret = ghl_init_urb(sc, usbdev, ghl_ps3wiiu_magic_data,
+							   ARRAY_SIZE(ghl_ps3wiiu_magic_data));
+		else if (sc->quirks & GHL_GUITAR_PS4)
+			ret = ghl_init_urb(sc, usbdev, ghl_ps4_magic_data,
+							   ARRAY_SIZE(ghl_ps4_magic_data));
 		if (ret) {
 			hid_err(hdev, "error preparing URB\n");
 			return ret;
@@ -3052,7 +3069,7 @@ static void sony_remove(struct hid_device *hdev)
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
 
-	if (sc->quirks & GHL_GUITAR_PS3WIIU) {
+	if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
 		del_timer_sync(&sc->ghl_poke_timer);
 		usb_free_urb(sc->ghl_urb);
 	}
@@ -3172,11 +3189,14 @@ static const struct hid_device_id sony_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_RHYTHM, USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE),
 		.driver_data = GHL_GUITAR_PS3WIIU | GH_GUITAR_CONTROLLER },
 	/* Guitar Hero PC Guitar Dongle */
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ACTIVISION, USB_DEVICE_ID_ACTIVISION_GUITAR_DONGLE),
+	{ HID_USB_DEVICE(USB_VENDOR_ID_REDOCTANE, USB_DEVICE_ID_REDOCTANE_GUITAR_DONGLE),
 		.driver_data = GH_GUITAR_CONTROLLER },
 	/* Guitar Hero PS3 World Tour Guitar Dongle */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_RHYTHM, USB_DEVICE_ID_SONY_PS3_GUITAR_DONGLE),
 		.driver_data = GH_GUITAR_CONTROLLER },
+	/* Guitar Hero Live PS4 guitar dongles */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_REDOCTANE, USB_DEVICE_ID_REDOCTANE_PS4_GHLIVE_DONGLE),
+		.driver_data = GHL_GUITAR_PS4 | GH_GUITAR_CONTROLLER },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, sony_devices);
-- 
2.25.1

