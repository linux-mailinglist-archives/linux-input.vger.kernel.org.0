Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C912C4D99
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 04:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732144AbgKZDCh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 22:02:37 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:47035 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731887AbgKZDCh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 22:02:37 -0500
Received: by mail-qv1-f67.google.com with SMTP id p12so343036qvj.13;
        Wed, 25 Nov 2020 19:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=57koFlbDPORGww8mKO+LYNTjbrgnpLCpuYjs0Z4cUQw=;
        b=FtsS0H9I5EesWnQBhD4jYj9vYTjWXWAPlzNfzzAyT4V0NF2/Px/wokGXd3LD92Y0Tx
         gAwg9u/LgNknr/FGX7wt7XceTNBxAR7hkQ0d/oQL/rzNyfh5vd/Q3Ae7sZLs82LShFvO
         Ty+TFwgoyiXDNON+5ULmer4Ns1JALTy+bZBmYgDdrtyx86pcmsvnHiDNRKQtIkgicQVO
         ym/sAqgJaypPU72ejnyg+LCvctXYoEdkBls5XHV3Da1Kwt5bdaYSxYZiocSuq+uVG5nX
         jpIjeFO+N//+lWS2bzl7CwKxfglrWnJzULhIp0DpN3/5w0tPzi7NAJEvM2u9Fnz7zvP2
         cvGw==
X-Gm-Message-State: AOAM530+unE21s0y7yLr1VXtniiGxgau55c0KXo0Ztb15QdAvsl9lmEr
        GNX1LSw9mTvuawFzY2WQ7NA=
X-Google-Smtp-Source: ABdhPJzq4CoPDiXogGDpQsLnKSK68KhXYR1ivoGOOC0oH8SM94Vz5g2JKojkI7yfPLRvdFalt9sykw==
X-Received: by 2002:a0c:9141:: with SMTP id q59mr1021351qvq.3.1606359755526;
        Wed, 25 Nov 2020 19:02:35 -0800 (PST)
Received: from localhost.localdomain ([104.221.112.78])
        by smtp.gmail.com with ESMTPSA id z26sm1462891qki.40.2020.11.25.19.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 19:02:34 -0800 (PST)
From:   Pascal Giard <pascal.giard@etsmtl.ca>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Pascal Giard <pascal.giard@etsmtl.ca>
Subject: [PATCH v3] HID: sony: support for ghlive ps3/wii u dongles
Date:   Wed, 25 Nov 2020 22:02:30 -0500
Message-Id: <20201126030230.304940-1-pascal.giard@etsmtl.ca>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201108013818.12214-1-pascal.giard@etsmtl.ca>
References: <20201108013818.12214-1-pascal.giard@etsmtl.ca>
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

Changes in v3:
* Only use one quirk as for now only the PS3/WiiU dongle is supported.

Changes in v2:
* Patches hid-sony instead of creating a new driver
* Changed memory allocation scheme in case of fail
---
 drivers/hid/Kconfig    |   1 +
 drivers/hid/hid-ids.h  |   3 ++
 drivers/hid/hid-sony.c | 112 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 05315b434276..3386f13e06d1 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -898,6 +898,7 @@ config HID_SONY
 	  * Buzz controllers
 	  * Sony PS3 Blue-ray Disk Remote Control (Bluetooth)
 	  * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
+	  * Guitar Hero Live PS3 and Wii U guitar dongles
 
 config SONY_FF
 	bool "Sony PS2/3/4 accessories force feedback support" 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 74fc1df6e3c2..75603262dd4e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1064,6 +1064,9 @@
 #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER		0x0002
 #define USB_DEVICE_ID_SONY_WIRELESS_BUZZ_CONTROLLER	0x1000
 
+#define USB_VENDOR_ID_SONY_GHLIVE			0x12ba
+#define USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE	0x074b
+
 #define USB_VENDOR_ID_SINO_LITE			0x1345
 #define USB_DEVICE_ID_SINO_LITE_CONTROLLER	0x3008
 
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 2f073f536070..08efe45dccbc 100644
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
@@ -56,6 +59,7 @@
 #define NSG_MR5U_REMOTE_BT        BIT(14)
 #define NSG_MR7U_REMOTE_BT        BIT(15)
 #define SHANWAN_GAMEPAD           BIT(16)
+#define GHL_GUITAR_PS3WIIU        BIT(17)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -79,6 +83,17 @@
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
@@ -578,6 +593,10 @@ struct sony_sc {
 	enum ds4_dongle_state ds4_dongle_state;
 	/* DS4 calibration data */
 	struct ds4_calibration_data ds4_calib_data[6];
+	/* GH Live */
+	struct timer_list ghl_poke_timer;
+	struct usb_ctrlrequest *ghl_cr;
+	u8 *ghl_databuf;
 };
 
 static void sony_set_leds(struct sony_sc *sc);
@@ -601,6 +620,85 @@ static inline void sony_schedule_work(struct sony_sc *sc,
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
+	sc->ghl_cr->bRequestType =
+		USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
+	sc->ghl_cr->bRequest = USB_REQ_SET_CONFIGURATION;
+	sc->ghl_cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
+	sc->ghl_cr->wIndex = 0;
+	sc->ghl_cr->wLength = cpu_to_le16(poke_size);
+	memcpy(sc->ghl_databuf, ghl_ps3wiiu_magic_data, poke_size);
+
+	usb_fill_control_urb(
+		urb, usbdev, pipe,
+		(unsigned char *) sc->ghl_cr, sc->ghl_databuf,
+		poke_size, ghl_magic_poke_cb, NULL);
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret < 0) {
+		kfree(sc->ghl_databuf);
+		kfree(sc->ghl_cr);
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
@@ -1360,6 +1458,8 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (sc->quirks & DUALSHOCK4_CONTROLLER)
 		return ds4_mapping(hdev, hi, field, usage, bit, max);
 
+	if (sc->quirks & GHL_GUITAR_PS3WIIU)
+		return guitar_mapping(hdev, hi, field, usage, bit, max);
 
 	/* Let hid-core decide for the others */
 	return 0;
@@ -2902,6 +3002,12 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return -ENODEV;
 	}
 
+	if (sc->quirks & GHL_GUITAR_PS3WIIU) {
+		timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
+		mod_timer(&sc->ghl_poke_timer,
+			  jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
+	}
+
 	return ret;
 }
 
@@ -2909,6 +3015,9 @@ static void sony_remove(struct hid_device *hdev)
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
 
+	if (sc->quirks & GHL_GUITAR_PS3WIIU)
+		del_timer_sync(&sc->ghl_poke_timer);
+
 	hid_hw_close(hdev);
 
 	if (sc->quirks & DUALSHOCK4_CONTROLLER_BT)
@@ -3020,6 +3129,9 @@ static const struct hid_device_id sony_devices[] = {
 	/* SMK-Link NSG-MR7U Remote Control */
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_NSG_MR7U_REMOTE),
 		.driver_data = NSG_MR7U_REMOTE_BT },
+	/* Guitar Hero Live PS3 and Wii U guitar dongles */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_GHLIVE, USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE),
+		.driver_data = GHL_GUITAR_PS3WIIU},
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, sony_devices);
-- 
2.29.2

