Return-Path: <linux-input+bounces-11347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09DA7537A
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 00:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7443E188AA02
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 23:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3661EB5FF;
	Fri, 28 Mar 2025 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="tk3r37sl"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EDB1D61B7
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206045; cv=none; b=cNj7pmfnK24n18NiYIM+X2Jc+LoD0ZStQkkVK2HQyC8uEvOGzFoYdGT8DPahUEitjnTFgzKsMqSXXH6dX+jrTJjQX9WZtYbkG00TgQog5bhkQ1lWxgtjV0qZ8gh3kpKQwaUC6v880nKdt2VoiI64PlTJL1ht+kZg0mBP3pXAqQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206045; c=relaxed/simple;
	bh=3GUmSWxLg5VfmAeN8E3iXr/6q8PA5bpVynVVy40S9Go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xin8VcS5iwPBegLZlC4EjyXY3VL+G8aEr5IMq3Olx9gMmTkESBJUWJkv7G8m4pqtDHCFCduO252cx1NRRh/CJMU3C9foA6qtuYY//ZLvMXtOgbj5pYhQ+jN/C4BiVBcsBqRYivJSUTtYVxQ6cYBWEHk772G40yEwLI7FENFBvrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=tk3r37sl; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1743205447; bh=3GUmSWxLg5VfmAeN8E3iXr/6q8PA5bpVynVVy40S9Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tk3r37sl4sWGoivZaVwkCLFSuJffjy3wXkLRuxO6mb21isduACEQOyoVQ/fNiSH+x
	 d8iNjkrAARpzG7jUAjANP/5ZVRLqtsByQm+LSDgb/eJYYmL4R36VQziwHJi8/IvrHH
	 PZ4amB67nBSszn8xxqiLKv1Q++rqslH6sI+GP1LJSzfLEv+VUdXb163BRJ9QKFMK97
	 DhEoseFBGxyn4iHQ9X2bE4ptfT5KDayU9NpS+iyn4+jFIh4VRJtljzhhd/C31coBWM
	 tOGGVHr11zcA5MmqTAepj0rMEECi1KMXHTql6MWXgMoRMWsxUa3/+9KhI441Qo+7Z4
	 GGaNsVat6YuhA==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 8DDF6A05D;
	Fri, 28 Mar 2025 16:44:07 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/5] Input: xpad - Fix Share button on Xbox One controllers
Date: Fri, 28 Mar 2025 16:43:37 -0700
Message-ID: <20250328234345.989761-2-vi@endrift.com>
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

The Share button, if present, is always one of two offsets from the end of the
file, depending on the presence of a specific interface. As we lack parsing for
the identify packet we can't automatically determine the presence of that
interface, but we can hardcode which of these offsets is correct for a given
controller.

More controllers are probably fixable by adding the MAP_SHARE_BUTTON in the
future, but for now I only added the ones that I have the ability to test
directly.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 41b7c7c991cd..d5c6f593474f 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -77,12 +77,13 @@
  * xbox d-pads should map to buttons, as is required for DDR pads
  * but we map them to axes when possible to simplify things
  */
-#define MAP_DPAD_TO_BUTTONS		(1 << 0)
-#define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
-#define MAP_STICKS_TO_NULL		(1 << 2)
-#define MAP_SELECT_BUTTON		(1 << 3)
-#define MAP_PADDLES			(1 << 4)
-#define MAP_PROFILE_BUTTON		(1 << 5)
+#define MAP_DPAD_TO_BUTTONS		BIT(0)
+#define MAP_TRIGGERS_TO_BUTTONS		BIT(1)
+#define MAP_STICKS_TO_NULL		BIT(2)
+#define MAP_SHARE_BUTTON		BIT(3)
+#define MAP_PADDLES			BIT(4)
+#define MAP_PROFILE_BUTTON		BIT(5)
+#define MAP_SHARE_OFFSET		BIT(6)
 
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
@@ -135,7 +136,7 @@ static const struct xpad_device {
 	{ 0x03f0, 0x048D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wireless */
 	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
 	{ 0x03f0, 0x07A0, "HyperX Clutch Gladiate RGB", 0, XTYPE_XBOXONE },
-	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },		/* v2 */
+	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", MAP_SHARE_BUTTON, XTYPE_XBOXONE },		/* v2 */
 	{ 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0, XTYPE_XBOXONE },
 	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
@@ -159,7 +160,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
 	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
 	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", MAP_PROFILE_BUTTON, XTYPE_XBOXONE },
-	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
+	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SHARE_BUTTON | MAP_SHARE_OFFSET, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
@@ -211,7 +212,7 @@ static const struct xpad_device {
 	{ 0x0738, 0xcb29, "Saitek Aviator Stick AV8R02", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
 	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
-	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
+	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
 	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
@@ -390,7 +391,7 @@ static const struct xpad_device {
 	{ 0x2dc8, 0x6001, "8BitDo SN30 Pro", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x2e24, 0x1688, "Hyperkin X91 X-Box One pad", 0, XTYPE_XBOXONE },
-	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
+	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -1027,7 +1028,7 @@ static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned cha
  *	The report format was gleaned from
  *	https://github.com/kylelemons/xbox/blob/master/xbox.go
  */
-static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *data)
+static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *data, u32 len)
 {
 	struct input_dev *dev = xpad->dev;
 	bool do_sync = false;
@@ -1068,8 +1069,12 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 		/* menu/view buttons */
 		input_report_key(dev, BTN_START,  data[4] & BIT(2));
 		input_report_key(dev, BTN_SELECT, data[4] & BIT(3));
-		if (xpad->mapping & MAP_SELECT_BUTTON)
-			input_report_key(dev, KEY_RECORD, data[22] & BIT(0));
+		if (xpad->mapping & MAP_SHARE_BUTTON) {
+			if (xpad->mapping & MAP_SHARE_OFFSET)
+				input_report_key(dev, KEY_RECORD, data[len - 26] & BIT(0));
+			else
+				input_report_key(dev, KEY_RECORD, data[len - 18] & BIT(0));
+		}
 
 		/* buttons A,B,X,Y */
 		input_report_key(dev, BTN_A,	data[4] & BIT(4));
@@ -1217,7 +1222,7 @@ static void xpad_irq_in(struct urb *urb)
 		xpad360w_process_packet(xpad, 0, xpad->idata);
 		break;
 	case XTYPE_XBOXONE:
-		xpadone_process_packet(xpad, 0, xpad->idata);
+		xpadone_process_packet(xpad, 0, xpad->idata, urb->actual_length);
 		break;
 	default:
 		xpad_process_packet(xpad, 0, xpad->idata);
@@ -1944,7 +1949,7 @@ static int xpad_init_input(struct usb_xpad *xpad)
 	    xpad->xtype == XTYPE_XBOXONE) {
 		for (i = 0; xpad360_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
-		if (xpad->mapping & MAP_SELECT_BUTTON)
+		if (xpad->mapping & MAP_SHARE_BUTTON)
 			input_set_capability(input_dev, EV_KEY, KEY_RECORD);
 	} else {
 		for (i = 0; xpad_btn[i] >= 0; i++)
-- 
2.48.1


