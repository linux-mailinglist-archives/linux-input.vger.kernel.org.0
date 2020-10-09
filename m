Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA9B288059
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 04:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731210AbgJIC2Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 22:28:25 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38285 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729724AbgJIC2Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Oct 2020 22:28:25 -0400
Received: by mail-qt1-f196.google.com with SMTP id q26so6874802qtb.5;
        Thu, 08 Oct 2020 19:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m93jwKh8C2NEfHByLajq1wyssq+xUmEKljAW0LMm/sc=;
        b=d3zxpqLKP3giov1FlPGGl2hk7t0PB+vu1myTXohzRt7M/C9yidWNV49RhEcG0eG/AN
         /1D6bzoVe6tBc0rStouB755oRlL7ZGjvoR17CcPENIA1M4e+81KdQiWhXXk4lSK1RiCE
         +KwyTQNrP1R3tL8ZbZnjD4U6u+qiif3b3ss4io1zAVxTA7C8/G/EAPu/XoZUq5AkZ6j5
         Hwo8NdKjfKfErS9hsUypiRQpN3hXhiijp7bt5H/3son4oXj47ibNmiw7k+75a3aIdccq
         Jbqr7+aq9S2DocIPieNjuReWrT0eVtvOkAp1t3HFhIp699btb10H7pQD8Qjn2ExONMGj
         aAIQ==
X-Gm-Message-State: AOAM5334AoSX6okXF4Kx/1KhAqWHCGCDuJUfcwherz0tMziTqX94JWt9
        VKB2cIYJ/6a/23zo0hF/Sttuny8VZSFGhA==
X-Google-Smtp-Source: ABdhPJzB77fj+3PXYe+G02R/1RduQI+t7slI9ktEzD9H7dD63qYyvgRdZ2tED7MryvKQgwxkHRXqlQ==
X-Received: by 2002:ac8:3385:: with SMTP id c5mr11476692qtb.46.1602210503473;
        Thu, 08 Oct 2020 19:28:23 -0700 (PDT)
Received: from localhost.localdomain ([104.221.112.78])
        by smtp.gmail.com with ESMTPSA id 90sm5103708qtb.6.2020.10.08.19.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 19:28:22 -0700 (PDT)
From:   Pascal Giard <pascal.giard@etsmtl.ca>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Pascal Giard <pascal.giard@etsmtl.ca>
Subject: [PATCH] HID: ghlive: support for ghlive ps3/wii u dongles
Date:   Thu,  8 Oct 2020 22:27:22 -0400
Message-Id: <20201009022722.123943-1-pascal.giard@etsmtl.ca>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This commit introduces the Guitar Hero Live driver which adds support
for the PS3 and Wii U dongles.

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
 drivers/hid/Kconfig      |   6 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-ghlive.c | 220 +++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h    |   3 +
 4 files changed, 230 insertions(+)
 create mode 100644 drivers/hid/hid-ghlive.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 34f07371716d..0bf8dd1629f7 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -362,6 +362,12 @@ config HID_GFRM
 	---help---
 	Support for Google Fiber TV Box remote controls
 
+config HID_GHLIVE
+	tristate "Guitar Hero Live PS3/Wii U support"
+	depends on HID
+	help
+	  Support for the Guitar Hero Live PS3 and Wii U guitar devices.
+
 config HID_GLORIOUS
 	tristate "Glorious PC Gaming Race mice"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index d8ea4b8c95af..6394f5bbf8a5 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_HID_ELO)		+= hid-elo.o
 obj-$(CONFIG_HID_EZKEY)		+= hid-ezkey.o
 obj-$(CONFIG_HID_GEMBIRD)	+= hid-gembird.o
 obj-$(CONFIG_HID_GFRM)		+= hid-gfrm.o
+obj-$(CONFIG_HID_GHLIVE)	+= hid-ghlive.o
 obj-$(CONFIG_HID_GLORIOUS)  += hid-glorious.o
 obj-$(CONFIG_HID_GOOGLE_HAMMER)	+= hid-google-hammer.o
 obj-$(CONFIG_HID_GT683R)	+= hid-gt683r.o
diff --git a/drivers/hid/hid-ghlive.c b/drivers/hid/hid-ghlive.c
new file mode 100644
index 000000000000..db5814aff17f
--- /dev/null
+++ b/drivers/hid/hid-ghlive.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *	HID driver for Guitar Hero Live PS3 and Wii U Guitar devices.
+ *
+ *	Copyright (c) 2020 Pascal Giard <pascal.giard@etsmtl.ca>
+ */
+
+#include <linux/hid.h>
+#include <linux/usb.h>
+#include <linux/timer.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+MODULE_AUTHOR("Pascal Giard <pascal.giard@etsmtl.ca>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HID driver for Activision GH Live PS3 and Wii U Guitar devices");
+
+#define GHL_GUITAR_PS3WIIU	 BIT(2)
+#define GHL_GUITAR_CONTROLLER	 BIT(1)
+
+#define GHL_GUITAR_POKE_INTERVAL 10 /* In seconds */
+
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
+
+struct ghlive_sc {
+	struct hid_device *hdev;
+	struct usb_device *usbdev;
+	unsigned long quirks;
+	int device_id;
+	unsigned int poke_current;
+	struct timer_list poke_timer;
+};
+
+static void ghl_magic_poke_cb(struct urb *urb)
+{
+	if (urb) {
+		/* Free cr and databuf allocated in ghl_magic_poke() */
+		kfree(urb->setup_packet);
+		kfree(urb->transfer_buffer);
+	}
+}
+
+static void ghl_magic_poke(struct timer_list *t)
+{
+	struct ghlive_sc *sc = from_timer(sc, t, poke_timer);
+
+	int ret;
+	unsigned int pipe;
+	struct urb *urb;
+	struct usb_ctrlrequest *cr;
+	const u16 poke_size =
+		ARRAY_SIZE(ghl_ps3wiiu_magic_data);
+	u8 *databuf;
+
+	pipe = usb_sndctrlpipe(sc->usbdev, 0);
+
+	cr = kzalloc(sizeof(*cr), GFP_ATOMIC);
+	if (!cr)
+		goto resched;
+
+	databuf = kzalloc(poke_size, GFP_ATOMIC);
+	if (!databuf) {
+		kfree(cr);
+		goto resched;
+	}
+
+	urb = usb_alloc_urb(0, GFP_ATOMIC);
+	if (!urb) {
+		kfree(databuf);
+		kfree(cr);
+		goto resched;
+	}
+
+	if (sc->quirks & (GHL_GUITAR_CONTROLLER | GHL_GUITAR_PS3WIIU)) {
+		cr->bRequestType =
+			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
+		cr->bRequest = USB_REQ_SET_CONFIGURATION;
+		cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
+		cr->wIndex = 0;
+		cr->wLength = cpu_to_le16(poke_size);
+		memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);
+
+		usb_fill_control_urb(
+			urb, sc->usbdev, pipe,
+			(unsigned char *) cr, databuf, poke_size,
+			ghl_magic_poke_cb, NULL);
+		ret = usb_submit_urb(urb, GFP_ATOMIC);
+		if (ret < 0) {
+			kfree(databuf);
+			kfree(cr);
+		}
+	}
+	usb_free_urb(urb);
+
+resched:
+	/* Reschedule for next time */
+	mod_timer(&sc->poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
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
+static int ghlive_mapping(struct hid_device *hdev, struct hid_input *hi,
+			      struct hid_field *field, struct hid_usage *usage,
+			      unsigned long **bit, int *max)
+{
+	struct ghlive_sc *sc = hid_get_drvdata(hdev);
+
+	if (sc->quirks & GHL_GUITAR_CONTROLLER)
+		return guitar_mapping(hdev, hi, field, usage, bit, max);
+
+	/* Let hid-core decide for the others */
+	return 0;
+}
+
+static int ghlive_probe(struct hid_device *hdev,
+			    const struct hid_device_id *id)
+{
+	int ret;
+	unsigned long quirks = id->driver_data;
+	struct ghlive_sc *sc;
+	unsigned int connect_mask = HID_CONNECT_DEFAULT;
+
+	sc = devm_kzalloc(&hdev->dev, sizeof(*sc), GFP_KERNEL);
+	if (sc == NULL)
+		return -ENOMEM;
+
+	sc->quirks = quirks;
+	hid_set_drvdata(hdev, sc);
+	sc->hdev = hdev;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, connect_mask);
+	if (ret) {
+		hid_err(hdev, "hw start failed\n");
+		return ret;
+	}
+
+	if (!(hdev->claimed & HID_CLAIMED_INPUT)) {
+		hid_err(hdev, "failed to claim input\n");
+		hid_hw_stop(hdev);
+		return -ENODEV;
+	}
+
+	if (sc->quirks & GHL_GUITAR_CONTROLLER) {
+		sc->usbdev = to_usb_device(hdev->dev.parent->parent);
+		sc->poke_current = 0;
+		timer_setup(&sc->poke_timer, ghl_magic_poke, 0);
+		mod_timer(&sc->poke_timer,
+			  jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
+	}
+
+	return ret;
+}
+
+static void ghlive_remove(struct hid_device *hdev)
+{
+	struct ghlive_sc *sc = hid_get_drvdata(hdev);
+
+	del_timer_sync(&sc->poke_timer);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id ghlive_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY_GHLIVE, USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE),
+		.driver_data = GHL_GUITAR_CONTROLLER | GHL_GUITAR_PS3WIIU},
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, ghlive_devices);
+
+static struct hid_driver ghlive_driver = {
+	.name		= "ghlive",
+	.id_table	= ghlive_devices,
+	.input_mapping	= ghlive_mapping,
+	.probe		= ghlive_probe,
+	.remove	= ghlive_remove,
+};
+
+static int __init ghlive_init(void)
+{
+	dbg_hid("GHLive:%s\n", __func__);
+	return hid_register_driver(&ghlive_driver);
+}
+
+static void __exit ghlive_exit(void)
+{
+	dbg_hid("GHLive:%s\n", __func__);
+
+	hid_unregister_driver(&ghlive_driver);
+}
+module_init(ghlive_init);
+module_exit(ghlive_exit);
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
 
-- 
2.28.0

