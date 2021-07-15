Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DA63CAD73
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242702AbhGOUC1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 16:02:27 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:43805 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343507AbhGOUBN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 16:01:13 -0400
Received: by mail-qt1-f178.google.com with SMTP id c13so2794003qtc.10
        for <linux-input@vger.kernel.org>; Thu, 15 Jul 2021 12:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6r4wv/f5he5h+i+UzapIlgcyooZUMVvAWy3JTE5EHVE=;
        b=kIUYbxh5lQ1c4NRriMFEEyb/Np9c6rvd3vz9kNWCqlsMLRWQAs6Kk0M6ttD4KmC1yr
         GXNqcwOHKJYsG2XdSmf+UUzEgNoIbZmLKvyqa7fI6xzY+54edpgGi1IjF1Jotx6ZPgib
         5VmWNVpaUCisP85B1ah+8Rfj7+xl5bXmp1gUxGaXzb+01EPHHhnYI7k/gSE1eu3wEqx4
         q3VsDMyms6ZR3BgcaBvyOBog931In3GK749dHBiThRkFYqWjW4ru38KnZrsQyH4Tm2Wt
         ZgsPVX012QiP9ujYWAMlEf9oHlcnLkNlmUr+F8qZMtp/6Fig0JNB7JkXXCrl/vFcRDeX
         MQvQ==
X-Gm-Message-State: AOAM530UP9VziOpz78iG5ml30Fo6ooAZOwvdjPjOJWpQ3eg27hfXomc0
        J0CUUJP31jYMm/0HpexrMos=
X-Google-Smtp-Source: ABdhPJzRE11zhdGsWEedGI+bGce0xsvVcLgJWNkgFn7OARjoB279kFzJMTRy0/TeEESaskxfLPyA2w==
X-Received: by 2002:ac8:110c:: with SMTP id c12mr5705073qtj.201.1626379094559;
        Thu, 15 Jul 2021 12:58:14 -0700 (PDT)
Received: from localhost.localdomain (bras-base-sconpq1802w-grc-12-74-14-61-132.dsl.bell.ca. [74.14.61.132])
        by smtp.gmail.com with ESMTPSA id n188sm579871qke.54.2021.07.15.12.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:58:13 -0700 (PDT)
From:   Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>,
        Pascal Giard <pascal.giard@etsmtl.ca>
Subject: [PATCH] HID: sony: support for the ghlive ps4 dongles
Date:   Thu, 15 Jul 2021 15:57:20 -0400
Message-Id: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This commit adds support for the Guitar Hero Live PS4 dongles.

These dongles require a "magic" USB interrupt message to be sent
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
 drivers/hid/Kconfig    |  2 +-
 drivers/hid/hid-ids.h  |  7 ++--
 drivers/hid/hid-sony.c | 76 +++++++++++++++++++++++++++++++++++++-----
 3 files changed, 72 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 160554903ef9..b743e7f2587a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -952,7 +952,7 @@ config HID_SONY
 	  * Buzz controllers
 	  * Sony PS3 Blue-ray Disk Remote Control (Bluetooth)
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
-	  * Guitar Hero Live PS3 and Wii U guitar dongles
+	  * Guitar Hero Live PS3, Wii U, and PS4 guitar dongles
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
index b3722c51ec78..a8ff6f767e5d 100644
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
@@ -85,7 +87,10 @@
 #define NSG_MRXU_MAX_X 1667
 #define NSG_MRXU_MAX_Y 1868
 
-#define GHL_GUITAR_POKE_INTERVAL 10 /* In seconds */
+/* The PS3/Wii U dongles require a poke every 10 seconds, but the PS4
+ * requires one every 8 seconds. Using 8 seconds for all for simplicity.
+ */
+#define GHL_GUITAR_POKE_INTERVAL 8 /* In seconds */
 #define GUITAR_TILT_USAGE 44
 
 /* Magic value and data taken from GHLtarUtility:
@@ -97,6 +102,13 @@ static const char ghl_ps3wiiu_magic_data[] = {
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
@@ -642,7 +654,7 @@ static void ghl_magic_poke(struct timer_list *t)
 		hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
 }
 
-static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
+static int ghl_init_urb_ps3wiiu(struct sony_sc *sc, struct usb_device *usbdev)
 {
 	struct usb_ctrlrequest *cr;
 	u16 poke_size;
@@ -674,6 +686,47 @@ static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
 	return 0;
 }
 
+static int ghl_init_urb_ps4(struct sony_sc *sc, struct usb_device *usbdev)
+{
+	int i;
+	struct usb_interface *intf;
+	struct usb_endpoint_descriptor *ep;
+	u16 poke_size;
+	u8 *databuf;
+	unsigned int pipe;
+	struct usb_endpoint_descriptor *ep_irq_out = NULL;
+
+	intf = to_usb_interface(sc->hdev->dev.parent);
+	if (intf->cur_altsetting->desc.bNumEndpoints != 2)
+		return -ENODEV;
+
+	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
+		ep = &intf->cur_altsetting->endpoint[i].desc;
+
+		if (usb_endpoint_xfer_int(ep)) {
+			if (usb_endpoint_dir_out(ep))
+				ep_irq_out = ep;
+		}
+	}
+
+	if (!ep_irq_out)
+		return -ENODEV;
+
+	poke_size = ARRAY_SIZE(ghl_ps4_magic_data);
+	pipe = usb_sndintpipe(usbdev, ep_irq_out->bEndpointAddress);
+
+	databuf = devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);
+	if (databuf == NULL)
+		return -ENOMEM;
+
+	memcpy(databuf, ghl_ps4_magic_data, poke_size);
+	usb_fill_int_urb(
+		sc->ghl_urb, usbdev, pipe,
+		databuf, poke_size,
+		ghl_magic_poke_cb, sc, ep_irq_out->bInterval);
+	return 0;
+}
+
 static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 			  struct hid_field *field, struct hid_usage *usage,
 			  unsigned long **bit, int *max)
@@ -3030,21 +3083,23 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
+			ret = ghl_init_urb_ps3wiiu(sc, usbdev);
+		else if (sc->quirks & GHL_GUITAR_PS4)
+			ret = ghl_init_urb_ps4(sc, usbdev);
 		if (ret) {
 			hid_err(hdev, "error preparing URB\n");
 			return ret;
 		}
-
 		timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
 		mod_timer(&sc->ghl_poke_timer,
 			  jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
 	}
-
 	return ret;
 }
 
@@ -3052,7 +3107,7 @@ static void sony_remove(struct hid_device *hdev)
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
 
-	if (sc->quirks & GHL_GUITAR_PS3WIIU) {
+	if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
 		del_timer_sync(&sc->ghl_poke_timer);
 		usb_free_urb(sc->ghl_urb);
 	}
@@ -3172,11 +3227,14 @@ static const struct hid_device_id sony_devices[] = {
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

