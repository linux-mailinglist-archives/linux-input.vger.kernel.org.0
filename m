Return-Path: <linux-input+bounces-11348-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 902EBA7537C
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 00:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 349C01707DE
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 23:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECD01D61B7;
	Fri, 28 Mar 2025 23:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="hUSfKKaP"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F371DC9A3
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206046; cv=none; b=Tw04Qt6gsV2H0qQTPSU38vlsqBKT+wclX6TNI5ttvPFlPGbTfiOB7cbWgEx+ycCml77CxLVs5XjJPexJgEI7xWeYmzhb3GV+CcWnWe6HG3CGY6EwYri7XjOPrXechJfRoAn9YWUqd6wzFVYdiOu5GURNx9UDOsOFsWS7g2aUW3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206046; c=relaxed/simple;
	bh=bN2VfuLw8QbEl/XZrSk+T5o86NxSmZ/FucrVjJ45iZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeLXZTcwaNij+E0UluexzE/gkX+jxxLcG+XGcb17vKdO+BBHts4Ko2pgj0aw2jO/1Si/jYVIkTLDQU4pjpjgm4ar6kXXsBLw/G8zwSvj7DN8P6sSKQq00shFaHt5wdpECxotHtC4qbdUUKVeT9aD9xdKgbG5GfHSIvqR0yPzebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=hUSfKKaP; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1743205448; bh=bN2VfuLw8QbEl/XZrSk+T5o86NxSmZ/FucrVjJ45iZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hUSfKKaPlVRkPXuOv2UBNzQpXUOUbHagyEv4DXMKeW1IfaP6/GHyDIsCjPlHKTzDr
	 z6bLEIgV/yYIEZfnMv2aBCQ9vt4YzFzJPw9jNajmAGVK/fhsztmndpxSPxZOLYYL4v
	 /gi+S/FupDwGVEYDTUi8AUA1WHIblfKWjTG9Njwg4EI180P09qBFLsKopXW9hzP7y0
	 WE4Kysx7ImjsYos7IZYenpwprac0+A0sBX44MsxHwHOdM9I84vhaakbBT2TWTZqH7Z
	 v+40TNpmI4GyRMxDaHvsKb85Zzz9F1AeTxcvo1ueYeKqvxrDFRghBCarpAs6aWB5GW
	 XEi2mteg7CCQg==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id E3BFDA071;
	Fri, 28 Mar 2025 16:44:07 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 3/5] Input: xpad - Allow delaying init packets
Date: Fri, 28 Mar 2025 16:43:38 -0700
Message-ID: <20250328234345.989761-3-vi@endrift.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328234345.989761-1-vi@endrift.com>
References: <20250328234345.989761-1-vi@endrift.com>
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
 drivers/input/joystick/xpad.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d5c6f593474f..e6a46cde16be 100644
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
@@ -407,6 +410,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
+	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
@@ -590,6 +594,7 @@ struct xboxone_init_packet {
  * - https://github.com/medusalix/xone/blob/master/bus/protocol.c
  */
 #define GIP_CMD_ACK      0x01
+#define GIP_CMD_ANNOUNCE 0x02
 #define GIP_CMD_IDENTIFY 0x04
 #define GIP_CMD_POWER    0x05
 #define GIP_CMD_AUTHENTICATE 0x06
@@ -777,10 +782,13 @@ struct usb_xpad {
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
 
@@ -1065,6 +1073,17 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 
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
@@ -1243,6 +1262,14 @@ static bool xpad_prepare_next_init_packet(struct usb_xpad *xpad)
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
@@ -2058,6 +2085,9 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	xpad->mapping = xpad_device[i].mapping;
 	xpad->xtype = xpad_device[i].xtype;
 	xpad->name = xpad_device[i].name;
+	if (xpad_device[i].flags & FLAG_DELAY_INIT)
+		xpad->delay_init = true;
+
 	xpad->packet_type = PKT_XB;
 	INIT_WORK(&xpad->work, xpad_presence_work);
 
@@ -2257,6 +2287,7 @@ static int xpad_resume(struct usb_interface *intf)
 	struct usb_xpad *xpad = usb_get_intfdata(intf);
 	struct input_dev *input = xpad->dev;
 
+	xpad->delayed_init_done = false;
 	if (xpad->xtype == XTYPE_XBOX360W)
 		return xpad360w_start_input(xpad);
 
-- 
2.48.1


