Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD992AA8D4
	for <lists+linux-input@lfdr.de>; Sun,  8 Nov 2020 02:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728785AbgKHBik (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Nov 2020 20:38:40 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45123 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgKHBik (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Nov 2020 20:38:40 -0500
Received: by mail-qt1-f194.google.com with SMTP id v11so3303715qtq.12;
        Sat, 07 Nov 2020 17:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2JstapKGE1TulCskGqaCRg5+AG41sVedd8xdrsTQoAE=;
        b=mMMLEVRpJKHm/W1vR+bTZYxjfXgb3vK/2B8hR1Hn2Ve+Gh2iGWnWfr4J/1RVZ7F+1U
         aIzEhWdMK6ZKcpgj18nmA+3bFI2LNMwOgnC27sQ7nqs1dPjJGcQ2AfEjoqKB9phBLtbA
         /loSy2H+828EUTT6/XCig9RZDCw32QeWhnHfNYCbGLcsEm60+jDor3TXOeb7VhxaArB5
         cdY0alok3cog2HqQrpuLVXMk20qr7QJhkMNXrkC/8/U0cdrFLqXRMyHFhcKO9XK98jEm
         urqeKQNKAV5wti0MgOETLjhDeZDIZDjABAtRgZCjIGe/5VXys/R8po7iLR+cp2OR2pwf
         7uEg==
X-Gm-Message-State: AOAM532ltcZNbua1bUeyeGxpkxS472WR8OkwN2VtwRn6rq7YtAaFjQIL
        oIWlSnMrT+5fUdtAG9JSAFg=
X-Google-Smtp-Source: ABdhPJxbkHXBEAy6UYFCcubSB89rhmR1BDoPWPtV+GOxoQQw6Q54NxtVJf8QVoHR1Rrli4aN1eJsoA==
X-Received: by 2002:a05:622a:291:: with SMTP id z17mr7932088qtw.180.1604799517406;
        Sat, 07 Nov 2020 17:38:37 -0800 (PST)
Received: from localhost.localdomain ([104.221.112.78])
        by smtp.gmail.com with ESMTPSA id g1sm3367525qtp.74.2020.11.07.17.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 17:38:36 -0800 (PST)
From:   Pascal Giard <pascal.giard@etsmtl.ca>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Pascal Giard <pascal.giard@etsmtl.ca>
Subject: [PATCH v2] HID: sony: support for ghlive ps3/wii u dongles
Date:   Sat,  7 Nov 2020 20:38:18 -0500
Message-Id: <20201108013818.12214-1-pascal.giard@etsmtl.ca>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201009022722.123943-1-pascal.giard@etsmtl.ca>
References: <20201009022722.123943-1-pascal.giard@etsmtl.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This commit adds support for the Guitar Hero Live PS3 and Wii U dongles.

These dongles require a "magic" USB control message [1] to be sent
approximately every 10 seconds otherwise the dongle will not report
events where the strumbar is hit while a fret is being held.

Also, inspired by a patch sent on linux-input by Sanjay Govind [2], the
accelerometer is mapped to ABS_RY for tilt.

Interestingly, the Wii U and PS3 dongles share the same VID and PID.

[1] https://github.com/ghlre/GHLtarUtility/
[2] https://marc.info/?l=linux-input&m=157242835928542&w=2

Signed-off-by: Pascal Giard <pascal.giard@etsmtl.ca>
---
differences from v1:
* Patches hid-sony instead of creating a new driver
* Changed memory allocation scheme in case of fail
---
 drivers/hid/Kconfig    |   1 +
 drivers/hid/hid-ids.h  |   3 ++
 drivers/hid/hid-sony.c | 115 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 34f07371716d..e2df2ae112a5 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -897,6 +897,7 @@ config HID_SONY
 	  * Buzz controllers
 	  * Sony PS3 Blue-ray Disk Remote Control (Bluetooth)
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
+	  * Guitar Hero Live PS3 and Wii U guitar dongles
 
 config SONY_FF
 	bool "Sony PS2/3/4 accessories force feedback support" 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 1c71a1aa76b2..e3a3942079cf 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1060,6 +1060,9 @@
 #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER		0x0002
 #define USB_DEVICE_ID_SONY_WIRELESS_BUZZ_CONTROLLER	0x1000
 
+#define USB_VENDOR_ID_SONY_GHLIVE			0x12ba
+#define USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE	0x074b
+
 #define USB_VENDOR_ID_SINO_LITE			0x1345
 #define USB_DEVICE_ID_SINO_LITE_CONTROLLER	0x3008
 
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 4c6ed6ef31f1..700bea6239f6 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -11,6 +11,7 @@
  *  Copyright (c) 2013 Colin Leitner <colin.leitner@gmail.com>
  *  Copyright (c) 2014-2016 Frank Praznik <frank.praznik@gmail.com>
  *  Copyright (c) 2018 Todd Kelner
+ *  Copyright (c) 2020 Pascal Giard <pascal.giard@etsmtl.ca>
  */
 
 /*
@@ -35,6 +36,8 @@
 #include <linux/idr.h>
 #include <linux/input/mt.h>
 #include <linux/crc32.h>
+#include <linux/usb.h>
+#include <linux/timer.h>
 #include <asm/unaligned.h>
 
 #include "hid-ids.h"
@@ -56,6 +59,8 @@
 #define NSG_MR5U_REMOTE_BT        BIT(14)
 #define NSG_MR7U_REMOTE_BT        BIT(15)
 #define SHANWAN_GAMEPAD           BIT(16)
+#define GHL_GUITAR_PS3WIIU        BIT(17)
+#define GHL_GUITAR_CONTROLLER     BIT(18)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -79,6 +84,17 @@
 #define NSG_MRXU_MAX_X 1667
 #define NSG_MRXU_MAX_Y 1868
 
+#define GHL_GUITAR_POKE_INTERVAL 10 /* In seconds */
+#define GHL_GUITAR_TILT_USAGE 44
+
+/* Magic value and data taken from GHLtarUtility:
+ * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
+ * Note: The Wii U and PS3 dongles happen to share the same!
+ */
+static const u16 ghl_ps3wiiu_magic_value = 0x201;
+static const char ghl_ps3wiiu_magic_data[] = {
+	0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
+};
 
 /* PS/3 Motion controller */
 static u8 motion_rdesc[] = {
@@ -578,6 +594,10 @@ struct sony_sc {
 	enum ds4_dongle_state ds4_dongle_state;
 	/* DS4 calibration data */
 	struct ds4_calibration_data ds4_calib_data[6];
+	/* GH Live */
+	struct timer_list ghl_poke_timer;
+	struct usb_ctrlrequest *ghl_cr;
+	u8 *ghl_databuf;
 };
 
 static void sony_set_leds(struct sony_sc *sc);
@@ -601,6 +621,87 @@ static inline void sony_schedule_work(struct sony_sc *sc,
 	}
 }
 
+static void ghl_magic_poke_cb(struct urb *urb)
+{
+	if (urb) {
+		/* Free sc->ghl_cr and sc->ghl_databuf allocated in
+		 * ghl_magic_poke()
+		 */
+		kfree(urb->setup_packet);
+		kfree(urb->transfer_buffer);
+	}
+}
+
+static void ghl_magic_poke(struct timer_list *t)
+{
+	struct sony_sc *sc = from_timer(sc, t, ghl_poke_timer);
+
+	int ret;
+	unsigned int pipe;
+	struct urb *urb;
+	struct usb_device *usbdev = to_usb_device(sc->hdev->dev.parent->parent);
+	const u16 poke_size =
+		ARRAY_SIZE(ghl_ps3wiiu_magic_data);
+
+	pipe = usb_sndctrlpipe(usbdev, 0);
+
+	if (!sc->ghl_cr) {
+		sc->ghl_cr = kzalloc(sizeof(*sc->ghl_cr), GFP_ATOMIC);
+		if (!sc->ghl_cr)
+			goto resched;
+	}
+
+	if (!sc->ghl_databuf) {
+		sc->ghl_databuf = kzalloc(poke_size, GFP_ATOMIC);
+		if (!sc->ghl_databuf)
+			goto resched;
+	}
+
+	urb = usb_alloc_urb(0, GFP_ATOMIC);
+	if (!urb)
+		goto resched;
+
+	if (sc->quirks & (GHL_GUITAR_CONTROLLER | GHL_GUITAR_PS3WIIU)) {
+		sc->ghl_cr->bRequestType =
+			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
+		sc->ghl_cr->bRequest = USB_REQ_SET_CONFIGURATION;
+		sc->ghl_cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
+		sc->ghl_cr->wIndex = 0;
+		sc->ghl_cr->wLength = cpu_to_le16(poke_size);
+		memcpy(sc->ghl_databuf, ghl_ps3wiiu_magic_data, poke_size);
+
+		usb_fill_control_urb(
+			urb, usbdev, pipe,
+			(unsigned char *) sc->ghl_cr, sc->ghl_databuf,
+			poke_size, ghl_magic_poke_cb, NULL);
+		ret = usb_submit_urb(urb, GFP_ATOMIC);
+		if (ret < 0) {
+			kfree(sc->ghl_databuf);
+			kfree(sc->ghl_cr);
+		}
+	}
+	usb_free_urb(urb);
+
+resched:
+	/* Reschedule for next time */
+	mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
+}
+
+static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
+			  struct hid_field *field, struct hid_usage *usage,
+			  unsigned long **bit, int *max)
+{
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_MSVENDOR) {
+		unsigned int abs = usage->hid & HID_USAGE;
+
+		if (abs == GHL_GUITAR_TILT_USAGE) {
+			hid_map_usage_clear(hi, usage, bit, max, EV_ABS, ABS_RY);
+			return 1;
+		}
+	}
+	return 0;
+}
+
 static ssize_t ds4_show_poll_interval(struct device *dev,
 				struct device_attribute
 				*attr, char *buf)
@@ -1343,6 +1444,8 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (sc->quirks & DUALSHOCK4_CONTROLLER)
 		return ds4_mapping(hdev, hi, field, usage, bit, max);
 
+	if (sc->quirks & GHL_GUITAR_CONTROLLER)
+		return guitar_mapping(hdev, hi, field, usage, bit, max);
 
 	/* Let hid-core decide for the others */
 	return 0;
@@ -2885,6 +2988,12 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return -ENODEV;
 	}
 
+	if (sc->quirks & GHL_GUITAR_CONTROLLER) {
+		timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
+		mod_timer(&sc->ghl_poke_timer,
+			  jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
+	}
+
 	return ret;
 }
 
@@ -2892,6 +3001,9 @@ static void sony_remove(struct hid_device *hdev)
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
 
+	if (sc->quirks & GHL_GUITAR_CONTROLLER)
+		del_timer_sync(&sc->ghl_poke_timer);
+
 	hid_hw_close(hdev);
 
 	if (sc->quirks & DUALSHOCK4_CONTROLLER_BT)
@@ -3003,6 +3115,9 @@ static const struct hid_device_id sony_devices[] = {
 	/* SMK-Link NSG-MR7U Remote Control */
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_NSG_MR7U_REMOTE),
 		.driver_data = NSG_MR7U_REMOTE_BT },
+	/* Guitar Hero Live PS3 and Wii U guitar dongles */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_GHLIVE, USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE),
+		.driver_data = GHL_GUITAR_CONTROLLER | GHL_GUITAR_PS3WIIU},
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, sony_devices);
-- 
2.29.2

