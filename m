Return-Path: <linux-input+bounces-12349-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CA0AB5FBF
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 01:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E081189A92C
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 23:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9601EFFBE;
	Tue, 13 May 2025 23:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="yWAdL5d3"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79019D880
	for <linux-input@vger.kernel.org>; Tue, 13 May 2025 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177401; cv=none; b=kAl7JJ4qhf91SSiiRIgBuTXA08LAgZPbbZRYogM+7LoSKI4EdvW8i8HWVwVBEoXCT+FOXCSMSr+UMugNxgVZaLdvp0EaHxSRNe9zQKNjpZNFQAU2L+CefeZge2W7PmlUZK4Ctv/VYO74nYwdF8RGQ/2hUpwFnZ6bpPBWMymcfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177401; c=relaxed/simple;
	bh=jiBKD/yYhafYKFdfw2XKU6wDPv3z2TR6UFUd+l1gwBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ej3/F9XN7+BeZ6QyPD33dqIAhYQEOc+dYSf2zFSyMikAZy6fpuuGU95Vq3cFQtYlm3tiT8oO63sVeWzHKKxyXRi6pa9ad8FdLDSoT1roRz/0xkTKH/ZTYiCHodNRgENdYD/0rbUrsLbULVGpJNupM9RVqbW+XoU2dRMw6OUi3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=yWAdL5d3; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1747176915; bh=jiBKD/yYhafYKFdfw2XKU6wDPv3z2TR6UFUd+l1gwBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yWAdL5d3lni+1BaVZvRTkCNkWm8nhPX5dbn8y2N++CQm9mPrsBDAISnjhxI8ih7Uy
	 gAwzYM9UxZk+amXs5S1BJpjO0OF1mqYIKLODSX7ZGwUiSq/8PtV5OKqTbSEef8XiVJ
	 BezGwUORjxDVjxgbwllSxiKtwiiOEXIOdbX+yoCX5Qv5mTi7iHjq/UPmcbB/eBmQ5M
	 unPMTny+9KBp4YYyU1UV6hWuY9d9ljHrkL/RnoO5MJDnsOX+zgGtjES6yNZ/Y/RVMB
	 3azxtYKED2CEKLzrFQv87QTjVazeynbXc7wToXQgW3CYMgCMaU6DpVW2nbicKPI1Dc
	 IOeAREImDTlPw==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 7A041A071;
	Tue, 13 May 2025 15:55:15 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/4] Input: xpad - Allow delaying init packets
Date: Tue, 13 May 2025 15:53:59 -0700
Message-ID: <20250513225411.2718072-2-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513225411.2718072-1-vi@endrift.com>
References: <20250513225411.2718072-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Xbox One controllers will only start processing the init packets after
sending the GIP announce packet. While most controllers send this packet
immediately, others will delay for some time, e.g. if a dongle needs to connect
to an actual controller first. In those cases, we want to delay until we
receive the announce packet before sending the init sequence.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 57a5ff3d1992..3eaf79cbe262 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -105,6 +105,8 @@
 #define PKT_XBE2_FW_5_EARLY 3
 #define PKT_XBE2_FW_5_11    4
 
+#define FLAG_DELAY_INIT BIT(0)
+
 static bool dpad_to_buttons;
 module_param(dpad_to_buttons, bool, S_IRUGO);
 MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes for unknown pads");
@@ -127,6 +129,7 @@ static const struct xpad_device {
 	char *name;
 	u8 mapping;
 	u8 xtype;
+	u8 flags;
 } xpad_device[] = {
 	/* Please keep this list sorted by vendor and product ID. */
 	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
@@ -596,6 +599,7 @@ struct xboxone_init_packet {
  * - https://github.com/medusalix/xone/blob/master/bus/protocol.c
  */
 #define GIP_CMD_ACK      0x01
+#define GIP_CMD_ANNOUNCE 0x02
 #define GIP_CMD_IDENTIFY 0x04
 #define GIP_CMD_POWER    0x05
 #define GIP_CMD_AUTHENTICATE 0x06
@@ -785,10 +789,13 @@ struct usb_xpad {
 	const char *name;		/* name of the device */
 	struct work_struct work;	/* init/remove device from callback */
 	time64_t mode_btn_down_ts;
+	bool delay_init;		/* init packets should be delayed */
+	bool delayed_init_done;
 };
 
 static int xpad_init_input(struct usb_xpad *xpad);
 static void xpad_deinit_input(struct usb_xpad *xpad);
+static int xpad_start_input(struct usb_xpad *xpad);
 static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
 static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
 
@@ -1073,6 +1080,17 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 
 			do_sync = true;
 		}
+	} else if (data[0] == GIP_CMD_ANNOUNCE) {
+		int error;
+
+		if (xpad->delay_init && !xpad->delayed_init_done) {
+			xpad->delayed_init_done = true;
+			error = xpad_start_input(xpad);
+			if (error)
+				dev_warn(&xpad->dev->dev,
+					 "unable to start delayed input: %d\n",
+					 error);
+		}
 	} else if (data[0] == GIP_CMD_INPUT) { /* The main valid packet type for inputs */
 		/* menu/view buttons */
 		input_report_key(dev, BTN_START,  data[4] & BIT(2));
@@ -1251,6 +1269,14 @@ static bool xpad_prepare_next_init_packet(struct usb_xpad *xpad)
 	if (xpad->xtype != XTYPE_XBOXONE)
 		return false;
 
+	/*
+	 * Some dongles will discard init packets if they're sent before the
+	 * controller connects. In these cases, we need to wait until we get
+	 * an announce packet from them to send the init packet sequence.
+	 */
+	if (xpad->delay_init && !xpad->delayed_init_done)
+		return false;
+
 	/* Perform initialization sequence for Xbox One pads that require it */
 	while (xpad->init_seq < ARRAY_SIZE(xboxone_init_packets)) {
 		init_packet = &xboxone_init_packets[xpad->init_seq++];
@@ -2066,6 +2092,9 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	xpad->mapping = xpad_device[i].mapping;
 	xpad->xtype = xpad_device[i].xtype;
 	xpad->name = xpad_device[i].name;
+	if (xpad_device[i].flags & FLAG_DELAY_INIT)
+		xpad->delay_init = true;
+
 	xpad->packet_type = PKT_XB;
 	INIT_WORK(&xpad->work, xpad_presence_work);
 
@@ -2265,6 +2294,7 @@ static int xpad_resume(struct usb_interface *intf)
 	struct usb_xpad *xpad = usb_get_intfdata(intf);
 	struct input_dev *input = xpad->dev;
 
+	xpad->delayed_init_done = false;
 	if (xpad->xtype == XTYPE_XBOX360W)
 		return xpad360w_start_input(xpad);
 
-- 
2.49.0


