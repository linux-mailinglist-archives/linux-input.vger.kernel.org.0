Return-Path: <linux-input+bounces-9854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 535CEA2D6BE
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 15:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57C2F1888D54
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 14:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C05D2475CF;
	Sat,  8 Feb 2025 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBPnQUxm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1E61991BF
	for <linux-input@vger.kernel.org>; Sat,  8 Feb 2025 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026669; cv=none; b=XDilyaajkCL7essv691/Y9cbKcoOVE9vRiNzfgGu2w853JV238r2ozf68yA+JVDK1torDF90odMJKW+nzL6FG88CCmuZU/7/wNpaWu0lSpMKwOMz9pc8ZB5/Fz2pH838to7OfQd3dGqWEQTV9T8FrmE5+zck0FIpkTGFo0Ted7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026669; c=relaxed/simple;
	bh=y0nsZzCE7cjIgvgiT6mrrvscB6SUSUE0GuJN7RexB/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xf+h4qqftNGa3k9HeGH1YgUzHd4gMSLZ8wJGw57uZ8fROWF6fPar9D5CJcVEW4Rwdcg7o+YC7OBuCdbfn1gXPi/qIDV2GwXJNNaTzcVQtMmosR6P1cQ2iY0z9v6PzhJ+kawCTvgnBGDVZksn69Z4xcNZOHzLrSHzu/bJFpwifVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBPnQUxm; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e436c59113so27401416d6.3
        for <linux-input@vger.kernel.org>; Sat, 08 Feb 2025 06:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739026666; x=1739631466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J32XANUs/xUqFozdV5fmknjfIeuUbmFkT1K3l06i6jU=;
        b=FBPnQUxmyXHQ30WtA4b7sC6R0pJA7q/tfyDZS8nfWVD20Zlshd53AKW8Y61gsKqWhD
         paUdcPVVtU5/eSnIOmkXGpoOCFtTBQTgsX0UMyVMmZtP5ZQVSkxG0g4M2XTGtUL1fhNs
         juP25gL9JAvkUqSjRaUiJQpV2FjS0nIrTBqgDM6zAayi8FpIXTg1clKjUqo8tWCwXR5H
         0OSGSif8p1sy9by+Q3ZarDgGiNkJiZyb+Jx1rF5m2zyym9Sm4wEoRVqUphOYpWZZDZPP
         q1TZtps5svIvsGK1TrvGErBHbzaOwSw2IzA9HmIUq0ysGrC6FZ+cFxBWSx88b7VpAFt0
         FOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739026666; x=1739631466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J32XANUs/xUqFozdV5fmknjfIeuUbmFkT1K3l06i6jU=;
        b=bJnBRY++E2NYUdmUrHpEcfOW/DGrAQJXnT5llS8bxp8NiQDiciwv3eA2HP9MsvMpFm
         tXLB8x9g7TySB/EBAye/G/MefFC6o0iCtfpSUkAo621r7TaciotZYLJ3bPN4KR35jUT3
         nkLrj9sUuZH5ZZcUHb+1sn7omGizfT4KJ4P/AX9adoJsULfgVe3q/8SpTL7AD4c+CGiu
         Kf78hQbNwwelKxRl05S/AExwiv7g5ycLCvhGoDMCYi+f859t+EXRiIuBWSHYqC9mZYcK
         UuHsno5Xaty32oBE5WvnbIB5vdEc1SdMqe5jeEqN7WtCNLEMyTb63vLcc+wMdxsU8yF4
         gPzg==
X-Gm-Message-State: AOJu0YwUF7t5NP9o2It8RbChKS0KiS1zNdypMadx8jx5q5SXwJCCdD/Z
	eLdbZXyEA6+6pyZNuAGBw3uqJsH0gVPOox4LpR4t1FPQN8QIdomO
X-Gm-Gg: ASbGncsl7zyMzgaX8nhkFLU/EgH39KZOTJkYCZcp0Jn0nsSG7M+TmtGS8jbWPU/fDD8
	1BiD+WJ7dYhjlMA0VE7yhPIVFvD3jEs7pRKWEEmGxy5bSFeUagmRn9sgzl1xFujWZyi2tqTV9Tg
	HtOXzHHz17EmFSMpVUyLYvlkFxfPw0EIaVeENrgIo3W2cuCKP6QCzNX0Gn05P6F84JqZrLH1Qmm
	eCFYCVK2eQT0lsv86DqTDwSx8C2XvJI6pe7Ehb2L+rKQk/AVRs1Vu0kK7pAICBCEjYTxJKqds0t
	Ck37W0lspuUWgyJf3cOqZaY493z1P/C59tIdUz6w/7xQwEH/vA==
X-Google-Smtp-Source: AGHT+IHgWvtVbiyJcWpzl6Qem7olDwWbt61NHOnvGionqDPF7AHt2SmGcHOjrEliCjMtAnfdT/oB4g==
X-Received: by 2002:a05:6214:2526:b0:6e4:2bc8:fb79 with SMTP id 6a1803df08f44-6e4456713cbmr99996146d6.21.1739026666265;
        Sat, 08 Feb 2025 06:57:46 -0800 (PST)
Received: from localhost.localdomain ([76.65.124.61])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44b9d4593sm13986216d6.97.2025.02.08.06.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:57:45 -0800 (PST)
From: Daniel Nguyen <daniel.cm.nguyen@gmail.com>
X-Google-Original-From: Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	pascal.giard@gmail.com,
	Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>,
	Pascal Giard <pascal.giard@etsmtl.ca>
Subject: [PATCH v2] Input: xpad - add support for GHL Xbox One controller
Date: Sat,  8 Feb 2025 09:57:17 -0500
Message-Id: <20250208145717.1249-1-daniel.nguyen.1@ens.etsmtl.ca>
X-Mailer: git-send-email 2.39.0.windows.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for the Guitar Hero Live (GHL) Xbox One dongles.

These dongles require a "magic" USB interrupt message to be sent every 8
seconds, otherwise the dongle will not report events where the strumbar
is hit while a fret is being held.

Therefore, ghl_poke_timer and ghl_urb are added to struct usb_xpad.
ghl_poke_timer ensures periodicity and ghl_urb contains the "magic"
data.

The mapping of buttons and axes was chosen to be coherent with GHL
dongles of other consoles. Refer to drivers/hid/hid-sony.c.

Co-developed-by: Pascal Giard <pascal.giard@etsmtl.ca>
Signed-off-by: Pascal Giard <pascal.giard@etsmtl.ca>
Signed-off-by: Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
---

Changes in v2:
* Removed line regarding ASUS ROG RAIKIRI PRO that does not belong.
* Incremented copyright year to 2025
---
 drivers/input/joystick/xpad.c | 181 +++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 8fe2a51df649..6b6dd5f74d33 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -11,6 +11,8 @@
  *               2006 Adam Buchbinder <adam.buchbinder@gmail.com>
  *               2007 Jan Kratochvil <honza@jikos.cz>
  *               2010 Christoph Fritz <chf.fritz@googlemail.com>
+ *               2025 Pascal Giard <pascal.giard@etsmtl.ca>
+ *               2025 Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
  *
  * This driver is based on:
  *  - information from     http://euc.jp/periphs/xbox-controller.ja.html
@@ -70,9 +72,16 @@
 #include <linux/module.h>
 #include <linux/usb/input.h>
 #include <linux/usb/quirks.h>
+#include <linux/timer.h>
 
 #define XPAD_PKT_LEN 64
 
+/*
+ * The Guitar Hero Live (GHL) Xbox One dongles require a poke
+ * every 8 seconds.
+ */
+#define GHL_GUITAR_POKE_INTERVAL 8 /* in seconds */
+
 /*
  * xbox d-pads should map to buttons, as is required for DDR pads
  * but we map them to axes when possible to simplify things
@@ -104,6 +113,8 @@
 #define PKT_XBE2_FW_5_EARLY 3
 #define PKT_XBE2_FW_5_11    4
 
+#define QUIRK_GHL_XBOXONE	BIT(0)
+
 static bool dpad_to_buttons;
 module_param(dpad_to_buttons, bool, S_IRUGO);
 MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes for unknown pads");
@@ -126,6 +137,7 @@ static const struct xpad_device {
 	char *name;
 	u8 mapping;
 	u8 xtype;
+	u8 quirks;
 } xpad_device[] = {
 	/* Please keep this list sorted by vendor and product ID. */
 	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
@@ -289,6 +301,7 @@ static const struct xpad_device {
 	{ 0x12ab, 0x0301, "PDP AFTERGLOW AX.1", 0, XTYPE_XBOX360 },
 	{ 0x12ab, 0x0303, "Mortal Kombat Klassic FightStick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x12ab, 0x8809, "Xbox DDR dancepad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
+	{ 0x1430, 0x079B, "RedOctane GHL Controller", 0, XTYPE_XBOXONE, QUIRK_GHL_XBOXONE},
 	{ 0x1430, 0x4748, "RedOctane Guitar Hero X-plorer", 0, XTYPE_XBOX360 },
 	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
@@ -451,6 +464,12 @@ static const signed short xpad_btn_paddles[] = {
 	-1						/* terminating entry */
 };
 
+/* used for the dmap mapping of the GHL Xbox One dongle */
+static const struct {int x; int y; } xpad_dpad_ghl[] = {
+	{0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1},
+	{0, 0}
+};
+
 /*
  * Xbox 360 has a vendor-specific class, so we cannot match it with only
  * USB_INTERFACE_INFO (also specifically refused by USB subsystem), so we
@@ -511,6 +530,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
 	XPAD_XBOX360_VENDOR(0x12ab),		/* Xbox 360 dance pads */
 	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane Xbox 360 controllers */
+	XPAD_XBOXONE_VENDOR(0x1430),		/* RedOctane Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x146b),		/* Bigben Interactive controllers */
 	XPAD_XBOX360_VENDOR(0x1532),		/* Razer Sabertooth */
 	XPAD_XBOXONE_VENDOR(0x1532),		/* Razer Wildcat */
@@ -677,6 +697,14 @@ static const u8 xboxone_rumbleend_init[] = {
 	0x00, GIP_MOTOR_ALL, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
+/*
+ * Magic data for the GHL Xbox One dongles sniffed with a USB
+ * protocol analyzer.
+ */
+static const char ghl_xboxone_magic_data[] = {
+	0x22, 0x00, 0x00, 0x08, 0x02, 0x08, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+
 /*
  * This specifies the selection of init packets that a gamepad
  * will be sent on init *and* the order in which they will be
@@ -686,12 +714,15 @@ static const u8 xboxone_rumbleend_init[] = {
 static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_ack_id),
 	XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_ack_id),
+	XBOXONE_INIT_PKT(0x1430, 0x079b, xboxone_hori_ack_id),
 	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_power_on),
 	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
+	XBOXONE_INIT_PKT(0x1430, 0x079b, xboxone_pdp_led_on),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
+	XBOXONE_INIT_PKT(0x1430, 0x079b, xboxone_pdp_auth),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
@@ -751,6 +782,10 @@ struct usb_xpad {
 	const char *name;		/* name of the device */
 	struct work_struct work;	/* init/remove device from callback */
 	time64_t mode_btn_down_ts;
+	int quirks;
+	struct urb *ghl_urb;		/* URB for GHL Xbox One dongle magic data */
+	/* timer for periodic poke of Xbox One dongle with magic data */
+	struct timer_list ghl_poke_timer;
 };
 
 static int xpad_init_input(struct usb_xpad *xpad);
@@ -758,6 +793,63 @@ static void xpad_deinit_input(struct usb_xpad *xpad);
 static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
 static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
 
+/*
+ *	ghl_magic_poke_cb
+ *
+ *	Callback function that resets the timer for the next magic data poke
+ *	as required by the GHL Xbox One dongle.
+ */
+static void ghl_magic_poke_cb(struct urb *urb)
+{
+	struct usb_xpad *xpad = urb->context;
+
+	if (urb->status < 0)
+		pr_warn("URB transfer failed.\n");
+
+	mod_timer(&xpad->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL * HZ);
+}
+
+/*
+ *	ghl_magic_poke
+ *
+ *	Submits the magic_data URB as required by the GHL Xbox One dongle.
+ */
+static void ghl_magic_poke(struct timer_list *t)
+{
+	int ret;
+	struct usb_xpad *xpad = from_timer(xpad, t, ghl_poke_timer);
+
+	ret = usb_submit_urb(xpad->ghl_urb, GFP_ATOMIC);
+	if (ret < 0)
+		pr_warn("URB transfer failed.\n");
+}
+
+/*
+ *	ghl_init_urb
+ *
+ *	Prepares the interrupt URB for magic_data as required by the GHL Xbox One dongle.
+ */
+static int ghl_init_urb(struct usb_xpad *xpad, struct usb_device *usbdev,
+			const char ghl_magic_data[], u16 poke_size,
+			struct usb_endpoint_descriptor *ep_irq_out)
+{
+	u8 *databuf;
+	unsigned int pipe;
+
+	pipe = usb_sndintpipe(usbdev, ep_irq_out->bEndpointAddress);
+
+	databuf = devm_kzalloc(&xpad->udev->dev, poke_size, GFP_ATOMIC);
+	if (!databuf)
+		return -ENOMEM;
+
+	memcpy(databuf, ghl_magic_data, poke_size);
+
+	usb_fill_int_urb(xpad->ghl_urb, usbdev, pipe, databuf, poke_size,
+			 ghl_magic_poke_cb, xpad, ep_irq_out->bInterval);
+
+	return 0;
+}
+
 /*
  *	xpad_process_packet
  *
@@ -1006,6 +1098,7 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 {
 	struct input_dev *dev = xpad->dev;
 	bool do_sync = false;
+	int dpad_value;
 
 	/* the xbox button has its own special report */
 	if (data[0] == GIP_CMD_VIRTUAL_KEY) {
@@ -1152,6 +1245,50 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 			}
 		}
 
+		do_sync = true;
+	} else if (data[0] == 0X21) { /* The main valid packet type for GHL inputs */
+		/* Mapping chosen to be coherent with GHL dongles of other consoles:
+		 * PS2, WiiU & PS4.
+		 *
+		 * Refer to drivers/hid/hid-sony.c.
+		 */
+		/* The 6 fret buttons */
+		input_report_key(dev, BTN_A, data[4] & BIT(0));
+		input_report_key(dev, BTN_B, data[4] & BIT(1));
+		input_report_key(dev, BTN_X, data[4] & BIT(2));
+		input_report_key(dev, BTN_Y, data[4] & BIT(3));
+		input_report_key(dev, BTN_TL, data[4] & BIT(4));
+		input_report_key(dev, BTN_TR, data[4] & BIT(5));
+
+		/* D-pad */
+		dpad_value = data[6] & 0xF;
+		if (dpad_value > 7)
+			dpad_value = 8;
+
+		input_report_abs(dev, ABS_HAT0X, xpad_dpad_ghl[dpad_value].x);
+		input_report_abs(dev, ABS_HAT0Y, xpad_dpad_ghl[dpad_value].y);
+
+		/* Strum bar */
+		input_report_abs(dev, ABS_Y, ((data[8] - 0x80) << 9));
+
+		/* Tilt sensor */
+		input_report_abs(dev, ABS_Z, ((data[9] - 0x80) << 9));
+
+		/* Whammy bar */
+		input_report_abs(dev, ABS_RZ, ((data[10] - 0x80) << 9));
+
+		/* Power button */
+		input_report_key(dev, BTN_THUMBR, data[5] & BIT(4));
+
+		/* GHTV button */
+		input_report_key(dev, BTN_START, data[5] & BIT(2));
+
+		/* Hero Power button */
+		input_report_key(dev, BTN_MODE,	data[5] & BIT(0));
+
+		/* Pause button */
+		input_report_key(dev, BTN_THUMBL, data[5] & BIT(1));
+
 		do_sync = true;
 	}
 
@@ -1843,16 +1980,29 @@ static void xpad_set_up_abs(struct input_dev *input_dev, signed short abs)
 	switch (abs) {
 	case ABS_X:
 	case ABS_Y:
+		/* GHL Strum bar */
+		if (xpad->xtype == XTYPE_XBOXONE && xpad->quirks & QUIRK_GHL_XBOXONE)
+			input_set_abs_params(input_dev, abs, -32768, 32767, 0, 0);
+		break;
 	case ABS_RX:
 	case ABS_RY:	/* the two sticks */
 		input_set_abs_params(input_dev, abs, -32768, 32767, 16, 128);
 		break;
 	case ABS_Z:
+		/* GHL Tilt sensor */
+		if (xpad->xtype == XTYPE_XBOXONE && xpad->quirks & QUIRK_GHL_XBOXONE)
+			input_set_abs_params(input_dev, abs, -32768, 32767, 0, 0);
+		break;
 	case ABS_RZ:	/* the triggers (if mapped to axes) */
-		if (xpad->xtype == XTYPE_XBOXONE)
-			input_set_abs_params(input_dev, abs, 0, 1023, 0, 0);
-		else
+		if (xpad->xtype == XTYPE_XBOXONE) {
+			/* GHL Whammy bar */
+			if (xpad->quirks & QUIRK_GHL_XBOXONE)
+				input_set_abs_params(input_dev, abs, -32768, 32767, 0, 0);
+			else
+				input_set_abs_params(input_dev, abs, 0, 1023, 0, 0);
+		} else {
 			input_set_abs_params(input_dev, abs, 0, 255, 0, 0);
+		}
 		break;
 	case ABS_HAT0X:
 	case ABS_HAT0Y:	/* the d-pad (only if dpad is mapped to axes */
@@ -2028,6 +2178,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	xpad->mapping = xpad_device[i].mapping;
 	xpad->xtype = xpad_device[i].xtype;
 	xpad->name = xpad_device[i].name;
+	xpad->quirks = xpad_device[i].quirks;
 	xpad->packet_type = PKT_XB;
 	INIT_WORK(&xpad->work, xpad_presence_work);
 
@@ -2150,8 +2301,26 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		if (error)
 			goto err_deinit_output;
 	}
+
+	if (xpad->quirks & QUIRK_GHL_XBOXONE) {
+		xpad->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
+		if (!xpad->ghl_urb) {
+			error = -ENOMEM;
+			goto err_deinit_output;
+		}
+
+		error = ghl_init_urb(xpad, udev, ghl_xboxone_magic_data,
+				     ARRAY_SIZE(ghl_xboxone_magic_data), ep_irq_out);
+		if (error)
+			goto err_free_ghl_urb;
+
+		timer_setup(&xpad->ghl_poke_timer, ghl_magic_poke, 0);
+		mod_timer(&xpad->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL * HZ);
+	}
 	return 0;
 
+err_free_ghl_urb:
+	usb_free_urb(xpad->ghl_urb);
 err_deinit_output:
 	xpad_deinit_output(xpad);
 err_free_in_urb:
@@ -2181,6 +2350,12 @@ static void xpad_disconnect(struct usb_interface *intf)
 	xpad_deinit_output(xpad);
 
 	usb_free_urb(xpad->irq_in);
+
+	if (xpad->quirks & QUIRK_GHL_XBOXONE) {
+		usb_free_urb(xpad->ghl_urb);
+		del_timer_sync(&xpad->ghl_poke_timer);
+	}
+
 	usb_free_coherent(xpad->udev, XPAD_PKT_LEN,
 			xpad->idata, xpad->idata_dma);
 
-- 
2.39.0.windows.2


