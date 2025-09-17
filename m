Return-Path: <linux-input+bounces-14779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E0FB80902
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 17:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74BDE7A463D
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 01:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429762192E1;
	Wed, 17 Sep 2025 01:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="uHFVRmhv"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0187C218827
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758072008; cv=none; b=gosnJOs6tInJ9uFW7+6ALr6uVpI4gVEIgZUKkF+n9BulBpxFIDa1Vi0bn6avCLoutMQsbZ1+3WcootmpGlAFEhkb4dFygYgWZ68xDrSccXmRKHN5l8ICPb2j7T7LZuQ9UsNI9Y5uQ6yHXNiggE05HRQ01wqGTfirw6cH8ZyoGLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758072008; c=relaxed/simple;
	bh=ipRiNKsEZ4t1FXqYLxI7XOCrN05g8Yq6eSLWqAHPfsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXCl7EOJVXzcaZIdtWwWjd7NmO0/IMDp4c0BYxAl4YQk1Sga1h7HbH6Y9EmdM3mv/D2/H6Gmw+edGQDx+3ehyczSDeX5S2nb6g7NdD2lKFcsCdj4n5czW8DC2mxVWuJ4xdbzZLSCr3+0Ct64MDTjCAqQTdItDdtUZucuRu+3p+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=uHFVRmhv; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1758071998; bh=ipRiNKsEZ4t1FXqYLxI7XOCrN05g8Yq6eSLWqAHPfsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uHFVRmhvwZmGPe9AHlvXg7rabIxbmOzW0sAcoEZGfEBasLCxJ9kcJLT/+cRfxJJwO
	 V67TQymTxAvyBp3/r7t8sQlJLUCvaGcE0mDcfxg39R0JOoJRWB+4Q+u2ixRd7E01Ny
	 ZxWx7gtJjAeWLiNJFNFylbT9pRQgcUUz8eDHq8imEMVuDms7/+Vx8rVIUE1eQqKMTv
	 o3iOB9W3TkVtbXKN3tUCnnM8PyGmwZV7zZu4C1T917w/bb3enFFoejNR/zplf5nVsS
	 UWniWG0fXUdlPHLJGnm548wNAaGzTdkKqnFdAppqqb5mwdeADRdTsEwsnOyOmwAuH7
	 349xotiyaHgCg==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 91420A161;
	Tue, 16 Sep 2025 18:19:58 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 2/5] Input: xpad - Remove Xbox One support
Date: Tue, 16 Sep 2025 18:19:31 -0700
Message-ID: <20250917011937.1649481-3-vi@endrift.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917011937.1649481-1-vi@endrift.com>
References: <20250917011937.1649481-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been superseded by xbox_gip. As the new driver is already at feature
parity, removing the fairly rough Xbox One support from xpad is safe and
will prevent any potential conflicts.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 Documentation/input/devices/xpad.rst |  17 +-
 drivers/input/joystick/xpad.c        | 634 +--------------------------
 2 files changed, 11 insertions(+), 640 deletions(-)

diff --git a/Documentation/input/devices/xpad.rst b/Documentation/input/devices/xpad.rst
index a480bc781565e..fd2afdd7b4059 100644
--- a/Documentation/input/devices/xpad.rst
+++ b/Documentation/input/devices/xpad.rst
@@ -2,19 +2,19 @@
 xpad - Linux USB driver for Xbox compatible controllers
 =======================================================
 
-This driver exposes all first-party and third-party Xbox compatible
-controllers. It has a long history and has enjoyed considerable usage
-as Windows' xinput library caused most PC games to focus on Xbox
-controller compatibility.
+This driver exposes all first-party and third-party Xbox and Xbox 360
+compatible controllers. It has a long history and has enjoyed considerable
+usage as Windows' xinput library caused most PC games to focus on Xbox
+controller compatibility. Xbox One/Series controller support has been
+superseded by the xbox_gip driver, which specializes in the Gaming Input
+Protocl that is introduced on the Xbox One.
 
 Due to backwards compatibility all buttons are reported as digital.
 This only affects Original Xbox controllers. All later controller models
 have only digital face buttons.
 
 Rumble is supported on some models of Xbox 360 controllers but not of
-Original Xbox controllers nor on Xbox One controllers. As of writing
-the Xbox One's rumble protocol has not been reverse-engineered but in
-the future could be supported.
+Original Xbox controllers.
 
 
 Notes
@@ -98,9 +98,6 @@ All generations of Xbox controllers speak USB over the wire.
 - Wireless Xbox 360 controllers require a 'Xbox 360 Wireless Gaming Receiver
   for Windows'
 - Wired Xbox 360 controllers use standard USB connectors.
-- Xbox One controllers can be wireless but speak Wi-Fi Direct and are not
-  yet supported.
-- Xbox One controllers can be wired and use standard Micro-USB connectors.
 
 
 
diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4c94297e17e66..0d9bd1dcb8c67 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -17,7 +17,6 @@
  *  - the iForce driver    drivers/char/joystick/iforce.c
  *  - the skeleton-driver  drivers/usb/usb-skeleton.c
  *  - Xbox 360 information http://www.free60.org/wiki/Gamepad
- *  - Xbox One information https://github.com/quantus/xbox-one-controller-protocol
  *
  * Thanks to:
  *  - ITO Takayuki for providing essential xpad information on his website
@@ -80,10 +79,6 @@
 #define MAP_DPAD_TO_BUTTONS		BIT(0)
 #define MAP_TRIGGERS_TO_BUTTONS		BIT(1)
 #define MAP_STICKS_TO_NULL		BIT(2)
-#define MAP_SHARE_BUTTON		BIT(3)
-#define MAP_PADDLES			BIT(4)
-#define MAP_PROFILE_BUTTON		BIT(5)
-#define MAP_SHARE_OFFSET		BIT(6)
 
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
@@ -91,8 +86,7 @@
 #define XTYPE_XBOX        0
 #define XTYPE_XBOX360     1
 #define XTYPE_XBOX360W    2
-#define XTYPE_XBOXONE     3
-#define XTYPE_UNKNOWN     4
+#define XTYPE_UNKNOWN     3
 
 /* Send power-off packet to xpad360w after holding the mode button for this many
  * seconds
@@ -137,16 +131,11 @@ static const struct xpad_device {
 	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
 	{ 0x03f0, 0x038D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wired */
 	{ 0x03f0, 0x048D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wireless */
-	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
-	{ 0x03f0, 0x07A0, "HyperX Clutch Gladiate RGB", 0, XTYPE_XBOXONE },
-	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", MAP_SHARE_BUTTON, XTYPE_XBOXONE },		/* v2 */
-	{ 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0, XTYPE_XBOXONE },
 	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
-	{ 0x044f, 0xd01e, "ThrustMaster, Inc. ESWAP X 2 ELDEN RING EDITION", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
 	{ 0x045e, 0x0285, "Microsoft X-Box pad (Japan)", 0, XTYPE_XBOX },
 	{ 0x045e, 0x0287, "Microsoft Xbox Controller S", 0, XTYPE_XBOX },
@@ -156,14 +145,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x028f, "Microsoft X-Box 360 pad v2", 0, XTYPE_XBOX360 },
 	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
 	{ 0x045e, 0x02a9, "Xbox 360 Wireless Receiver (Unofficial)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
-	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
-	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
-	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
-	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
-	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
-	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", MAP_PROFILE_BUTTON, XTYPE_XBOXONE },
-	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SHARE_BUTTON | MAP_SHARE_OFFSET, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
@@ -183,7 +165,6 @@ static const struct xpad_device {
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0201, "Saitek Adrenalin", 0, XTYPE_XBOX },
 	{ 0x06a3, 0xf51a, "Saitek P3600", 0, XTYPE_XBOX360 },
-	{ 0x0738, 0x4503, "Mad Catz Racing Wheel", 0, XTYPE_XBOXONE },
 	{ 0x0738, 0x4506, "Mad Catz 4506 Wireless Controller", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4516, "Mad Catz Control Pad", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4520, "Mad Catz Control Pad Pro", 0, XTYPE_XBOX },
@@ -205,7 +186,6 @@ static const struct xpad_device {
 	{ 0x0738, 0x4740, "Mad Catz Beat Pad", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0x4743, "Mad Catz Beat Pad Pro", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x0738, 0x4758, "Mad Catz Arcade Game Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0738, 0x4a01, "Mad Catz FightStick TE 2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0738, 0x6040, "Mad Catz Beat Pad Pro", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x0738, 0x9871, "Mad Catz Portable Drum", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xb726, "Mad Catz Xbox controller - MW2", 0, XTYPE_XBOX360 },
@@ -216,8 +196,6 @@ static const struct xpad_device {
 	{ 0x0738, 0xcb29, "Saitek Aviator Stick AV8R02", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
 	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
-	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
-	{ 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
 	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
@@ -240,34 +218,10 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x011f, "Rock Candy Gamepad Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0131, "PDP EA Sports Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0133, "Xbox 360 Wired Controller", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0139, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x013a, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x015d, "PDP Mirror's Edge Official Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0164, "PDP Battlefield One", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0165, "PDP Titanfall 2", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0201, "Pelican PL-3601 'TSZ' Wired Xbox 360 Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0213, "Afterglow Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x021f, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0246, "Rock Candy Gamepad for Xbox One 2015", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02a0, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02a1, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02a2, "PDP Wired Controller for Xbox One - Crimson Red", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02a4, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02a6, "PDP Wired Controller for Xbox One - Camo Series", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02a7, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02a8, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02ab, "PDP Controller for Xbox One", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02ad, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02b3, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02b8, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0301, "Logic3 Controller", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0346, "Rock Candy Gamepad for Xbox One 2016", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0401, "Logic3 Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0413, "Afterglow AX.1 Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0501, "PDP Xbox 360 Controller", 0, XTYPE_XBOX360 },
@@ -279,23 +233,13 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x000d, "Hori Fighting Stick EX2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x0f0d, 0x0016, "Hori Real Arcade Pro.EX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x0f0d, 0x001b, "Hori Real Arcade Pro VX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0f0d, 0x0063, "Hori Real Arcade Pro Hayabusa (USA) Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
-	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
-	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
-	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
-	{ 0x0f0d, 0x0152, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
-	{ 0x0f0d, 0x01b2, "HORI Taiko No Tatsujin Drum Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
 	{ 0x102c, 0xff0c, "Joytech Wireless Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
-	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
-	{ 0x10f5, 0x7008, "Turtle Beach Recon Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
-	{ 0x10f5, 0x7073, "Turtle Beach Stealth Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
 	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
@@ -308,9 +252,6 @@ static const struct xpad_device {
 	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
 	{ 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
 	{ 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
-	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
-	{ 0x1532, 0x0a29, "Razer Wolverine V2", 0, XTYPE_XBOXONE },
 	{ 0x15e4, 0x3f00, "Power A Mini Pro Elite", 0, XTYPE_XBOX360 },
 	{ 0x15e4, 0x3f0a, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
 	{ 0x15e4, 0x3f10, "Batarang Xbox 360 controller", 0, XTYPE_XBOX360 },
@@ -358,12 +299,7 @@ static const struct xpad_device {
 	{ 0x1bad, 0xfd00, "Razer Onza TE", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd01, "Razer Onza", 0, XTYPE_XBOX360 },
 	{ 0x1ee9, 0x1590, "ZOTAC Gaming Zone", 0, XTYPE_XBOX360 },
-	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
-	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
-	{ 0x20d6, 0x2064, "PowerA Wired Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
-	{ 0x20d6, 0x400b, "PowerA FUSION Pro 4 Wired Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
-	{ 0x20d6, 0x890b, "PowerA MOGA XP-Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x2345, 0xe00b, "Machenike G5 Pro Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
@@ -371,9 +307,6 @@ static const struct xpad_device {
 	{ 0x24c6, 0x530a, "Xbox 360 Pro EX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x531a, "PowerA Pro Ex", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5397, "FUS1ON Tournament Controller", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x541a, "PowerA Xbox One Mini Wired Controller", 0, XTYPE_XBOXONE },
-	{ 0x24c6, 0x542a, "Xbox ONE spectra", 0, XTYPE_XBOXONE },
-	{ 0x24c6, 0x543a, "PowerA Xbox One wired controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5500, "Hori XBOX 360 EX 2 with Turbo", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5501, "Hori Real Arcade Pro VX-SA", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5502, "Hori Fighting Stick VX Alt", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
@@ -382,29 +315,18 @@ static const struct xpad_device {
 	{ 0x24c6, 0x550d, "Hori GEM Xbox controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x550e, "Hori Real Arcade Pro V Kai 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
-	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
-	{ 0x24c6, 0x581a, "ThrustMaster XB1 Classic Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
-	{ 0x294b, 0x3303, "Snakebyte GAMEPAD BASE X", 0, XTYPE_XBOXONE },
-	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2993, 0x2001, "TECNO Pocket Go", 0, XTYPE_XBOX360 },
-	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
-	{ 0x2dc8, 0x200f, "8BitDo Ultimate 3-mode Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310b, "8BitDo Ultimate 2 Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x6001, "8BitDo SN30 Pro", 0, XTYPE_XBOX360 },
-	{ 0x2e24, 0x0423, "Hyperkin DuchesS Xbox One pad", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
-	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
-	{ 0x2e24, 0x1688, "Hyperkin X91 X-Box One pad", 0, XTYPE_XBOXONE },
-	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -412,15 +334,9 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
-	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
-	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
-	{ 0x3285, 0x0646, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
-	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
-	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
-	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
@@ -477,13 +393,6 @@ static const signed short xpad_abs_triggers[] = {
 	-1
 };
 
-/* used when the controller has extra paddle buttons */
-static const signed short xpad_btn_paddles[] = {
-	BTN_GRIPR, BTN_GRIPR2, /* paddle upper right, lower right */
-	BTN_GRIPL, BTN_GRIPL2, /* paddle upper left, lower left */
-	-1						/* terminating entry */
-};
-
 /*
  * Xbox 360 has a vendor-specific class, so we cannot match it with only
  * USB_INTERFACE_INFO (also specifically refused by USB subsystem), so we
@@ -500,47 +409,28 @@ static const signed short xpad_btn_paddles[] = {
 	{ XPAD_XBOX360_VENDOR_PROTOCOL((vend), 1) }, \
 	{ XPAD_XBOX360_VENDOR_PROTOCOL((vend), 129) }
 
-/* The Xbox One controller uses subclass 71 and protocol 208. */
-#define XPAD_XBOXONE_VENDOR_PROTOCOL(vend, pr) \
-	.match_flags = USB_DEVICE_ID_MATCH_VENDOR | USB_DEVICE_ID_MATCH_INT_INFO, \
-	.idVendor = (vend), \
-	.bInterfaceClass = USB_CLASS_VENDOR_SPEC, \
-	.bInterfaceSubClass = 71, \
-	.bInterfaceProtocol = (pr)
-#define XPAD_XBOXONE_VENDOR(vend) \
-	{ XPAD_XBOXONE_VENDOR_PROTOCOL((vend), 208) }
-
 static const struct usb_device_id xpad_table[] = {
 	/*
-	 * Please keep this list sorted by vendor ID. Note that there are 2
-	 * macros - XPAD_XBOX360_VENDOR and XPAD_XBOXONE_VENDOR.
+	 * Please keep this list sorted by vendor ID
 	 */
 	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
 	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
 	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
 	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
-	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
-	XPAD_XBOXONE_VENDOR(0x044f),		/* Thrustmaster Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
-	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
 	XPAD_XBOX360_VENDOR(0x0502),		/* Acer Inc. Xbox 360 style controllers */
 	XPAD_XBOX360_VENDOR(0x056e),		/* Elecom JC-U3613M */
 	XPAD_XBOX360_VENDOR(0x06a3),		/* Saitek P3600 */
 	XPAD_XBOX360_VENDOR(0x0738),		/* Mad Catz Xbox 360 controllers */
 	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
-	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
 	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz Gamepad */
-	XPAD_XBOXONE_VENDOR(0x0b05),		/* ASUS controllers */
 	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x0db0),		/* Micro Star International X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f Xbox 360 controllers */
-	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori controllers */
-	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori controllers */
 	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries controllers */
-	XPAD_XBOXONE_VENDOR(0x10f5),		/* Turtle Beach Controllers */
 	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
 	XPAD_XBOX360_VENDOR(0x11ff),		/* PXN V900 */
 	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
@@ -548,7 +438,6 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane Xbox 360 controllers */
 	XPAD_XBOX360_VENDOR(0x146b),		/* Bigben Interactive controllers */
 	XPAD_XBOX360_VENDOR(0x1532),		/* Razer Sabertooth */
-	XPAD_XBOXONE_VENDOR(0x1532),		/* Razer Wildcat */
 	XPAD_XBOX360_VENDOR(0x15e4),		/* Numark Xbox 360 controllers */
 	XPAD_XBOX360_VENDOR(0x162e),		/* Joytech Xbox 360 controllers */
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
@@ -558,188 +447,23 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
 	XPAD_XBOX360_VENDOR(0x1ee9),		/* ZOTAC Technology Limited */
 	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA controllers */
-	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOX360_VENDOR(0x2345),		/* Machenike Controllers */
 	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA controllers */
-	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA controllers */
 	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
-	XPAD_XBOXONE_VENDOR(0x294b),		/* Snakebyte */
 	XPAD_XBOX360_VENDOR(0x2993),		/* TECNO Mobile */
 	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
 	XPAD_XBOX360_VENDOR(0x2dc8),		/* 8BitDo Controllers */
-	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Controllers */
-	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Controllers */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
-	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
-	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
-	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
-	XPAD_XBOXONE_VENDOR(0x366c),		/* ByoWave controllers */
 	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
 	{ }
 };
 
 MODULE_DEVICE_TABLE(usb, xpad_table);
 
-struct xboxone_init_packet {
-	u16 idVendor;
-	u16 idProduct;
-	const u8 *data;
-	u8 len;
-};
-
-#define XBOXONE_INIT_PKT(_vid, _pid, _data)		\
-	{						\
-		.idVendor	= (_vid),		\
-		.idProduct	= (_pid),		\
-		.data		= (_data),		\
-		.len		= ARRAY_SIZE(_data),	\
-	}
-
-/*
- * starting with xbox one, the game input protocol is used
- * magic numbers are taken from
- * - https://github.com/xpadneo/gip-dissector/blob/main/src/gip-dissector.lua
- * - https://github.com/medusalix/xone/blob/master/bus/protocol.c
- */
-#define GIP_CMD_ACK      0x01
-#define GIP_CMD_ANNOUNCE 0x02
-#define GIP_CMD_IDENTIFY 0x04
-#define GIP_CMD_POWER    0x05
-#define GIP_CMD_AUTHENTICATE 0x06
-#define GIP_CMD_VIRTUAL_KEY  0x07
-#define GIP_CMD_RUMBLE   0x09
-#define GIP_CMD_LED      0x0a
-#define GIP_CMD_FIRMWARE 0x0c
-#define GIP_CMD_INPUT    0x20
-
-#define GIP_SEQ0 0x00
-
-#define GIP_OPT_ACK      0x10
-#define GIP_OPT_INTERNAL 0x20
-
-/*
- * length of the command payload encoded with
- * https://en.wikipedia.org/wiki/LEB128
- * which is a no-op for N < 128
- */
-#define GIP_PL_LEN(N) (N)
-
-/*
- * payload specific defines
- */
-#define GIP_PWR_ON 0x00
-#define GIP_LED_ON 0x01
-
-#define GIP_MOTOR_R  BIT(0)
-#define GIP_MOTOR_L  BIT(1)
-#define GIP_MOTOR_RT BIT(2)
-#define GIP_MOTOR_LT BIT(3)
-#define GIP_MOTOR_ALL (GIP_MOTOR_R | GIP_MOTOR_L | GIP_MOTOR_RT | GIP_MOTOR_LT)
-
-#define GIP_WIRED_INTF_DATA 0
-#define GIP_WIRED_INTF_AUDIO 1
-
-/*
- * This packet is required for all Xbox One pads with 2015
- * or later firmware installed (or present from the factory).
- */
-static const u8 xboxone_power_on[] = {
-	GIP_CMD_POWER, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(1), GIP_PWR_ON
-};
-
-/*
- * This packet is required for Xbox One S (0x045e:0x02ea)
- * and Xbox One Elite Series 2 (0x045e:0x0b00) pads to
- * initialize the controller that was previously used in
- * Bluetooth mode.
- */
-static const u8 xboxone_s_init[] = {
-	GIP_CMD_POWER, GIP_OPT_INTERNAL, GIP_SEQ0, 0x0f, 0x06
-};
-
-/*
- * This packet is required to get additional input data
- * from Xbox One Elite Series 2 (0x045e:0x0b00) pads.
- * We mostly do this right now to get paddle data
- */
-static const u8 extra_input_packet_init[] = {
-	0x4d, 0x10, 0x01, 0x02, 0x07, 0x00
-};
-
-/*
- * This packet is required for the Titanfall 2 Xbox One pads
- * (0x0e6f:0x0165) to finish initialization and for Hori pads
- * (0x0f0d:0x0067) to make the analog sticks work.
- */
-static const u8 xboxone_hori_ack_id[] = {
-	GIP_CMD_ACK, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(9),
-	0x00, GIP_CMD_IDENTIFY, GIP_OPT_INTERNAL, 0x3a, 0x00, 0x00, 0x00, 0x80, 0x00
-};
-
-/*
- * This packet is sent by default on Windows, and is required for some pads to
- * start sending input reports, including most (all?) of the PDP. These pads
- * include: (0x0e6f:0x02ab), (0x0e6f:0x02a4), (0x0e6f:0x02a6).
- */
-static const u8 xboxone_led_on[] = { GIP_CMD_LED, GIP_OPT_INTERNAL, GIP_SEQ0,
-GIP_PL_LEN(3), 0x00, GIP_LED_ON, 0x14 };
-
-/*
- * This packet is required for most (all?) of the PDP pads to start
- * sending input reports. These pads include: (0x0e6f:0x02ab),
- * (0x0e6f:0x02a4), (0x0e6f:0x02a6).
- */
-static const u8 xboxone_auth_done[] = {
-	GIP_CMD_AUTHENTICATE, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(2), 0x01, 0x00
-};
-
-/*
- * A specific rumble packet is required for some PowerA pads to start
- * sending input reports. One of those pads is (0x24c6:0x543a).
- */
-static const u8 xboxone_rumblebegin_init[] = {
-	GIP_CMD_RUMBLE, 0x00, GIP_SEQ0, GIP_PL_LEN(9),
-	0x00, GIP_MOTOR_ALL, 0x00, 0x00, 0x1D, 0x1D, 0xFF, 0x00, 0x00
-};
-
-/*
- * A rumble packet with zero FF intensity will immediately
- * terminate the rumbling required to init PowerA pads.
- * This should happen fast enough that the motors don't
- * spin up to enough speed to actually vibrate the gamepad.
- */
-static const u8 xboxone_rumbleend_init[] = {
-	GIP_CMD_RUMBLE, 0x00, GIP_SEQ0, GIP_PL_LEN(9),
-	0x00, GIP_MOTOR_ALL, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
-};
-
-/*
- * This specifies the selection of init packets that a gamepad
- * will be sent on init *and* the order in which they will be
- * sent. The correct sequence number will be added when the
- * packet is going to be sent.
- */
-static const struct xboxone_init_packet xboxone_init_packets[] = {
-	XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_ack_id),
-	XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_ack_id),
-	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_power_on),
-	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
-	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
-	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
-	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_led_on),
-	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_auth_done),
-	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
-	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
-	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
-	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumbleend_init),
-	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumbleend_init),
-	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumbleend_init),
-};
-
 struct xpad_output_packet {
 	u8 data[XPAD_PKT_LEN];
 	u8 len;
@@ -769,7 +493,6 @@ struct usb_xpad {
 	struct urb *irq_out;		/* urb for interrupt out report */
 	struct usb_anchor irq_out_anchor;
 	bool irq_out_active;		/* we must not use an active URB */
-	u8 odata_serial;		/* serial number for xbox one protocol */
 	unsigned char *odata;		/* output data */
 	dma_addr_t odata_dma;
 	spinlock_t odata_lock;
@@ -797,8 +520,6 @@ struct usb_xpad {
 
 static int xpad_init_input(struct usb_xpad *xpad);
 static void xpad_deinit_input(struct usb_xpad *xpad);
-static int xpad_start_input(struct usb_xpad *xpad);
-static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
 static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
 
 /*
@@ -1036,187 +757,6 @@ static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned cha
 	rcu_read_unlock();
 }
 
-/*
- *	xpadone_process_packet
- *
- *	Completes a request by converting the data into events for the
- *	input subsystem. This version is for the Xbox One controller.
- *
- *	The report format was gleaned from
- *	https://github.com/kylelemons/xbox/blob/master/xbox.go
- */
-static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *data, u32 len)
-{
-	struct input_dev *dev = xpad->dev;
-	bool do_sync = false;
-
-	/* the xbox button has its own special report */
-	if (data[0] == GIP_CMD_VIRTUAL_KEY) {
-		/*
-		 * The Xbox One S controller requires these reports to be
-		 * acked otherwise it continues sending them forever and
-		 * won't report further mode button events.
-		 */
-		if (data[1] == (GIP_OPT_ACK | GIP_OPT_INTERNAL))
-			xpadone_ack_mode_report(xpad, data[2]);
-
-		input_report_key(dev, BTN_MODE, data[4] & GENMASK(1, 0));
-		input_sync(dev);
-
-		do_sync = true;
-	} else if (data[0] == GIP_CMD_FIRMWARE) {
-		/* Some packet formats force us to use this separate to poll paddle inputs */
-		if (xpad->packet_type == PKT_XBE2_FW_5_11) {
-			/* Mute paddles if controller is in a custom profile slot
-			 * Checked by looking at the active profile slot to
-			 * verify it's the default slot
-			 */
-			if (data[19] != 0)
-				data[18] = 0;
-
-			/* Elite Series 2 split packet paddle bits */
-			input_report_key(dev, BTN_GRIPR, data[18] & BIT(0));
-			input_report_key(dev, BTN_GRIPR2, data[18] & BIT(1));
-			input_report_key(dev, BTN_GRIPL, data[18] & BIT(2));
-			input_report_key(dev, BTN_GRIPL2, data[18] & BIT(3));
-
-			do_sync = true;
-		}
-	} else if (data[0] == GIP_CMD_ANNOUNCE) {
-		int error;
-
-		if (xpad->delay_init && !xpad->delayed_init_done) {
-			xpad->delayed_init_done = true;
-			error = xpad_start_input(xpad);
-			if (error)
-				dev_warn(&xpad->dev->dev,
-					 "unable to start delayed input: %d\n",
-					 error);
-		}
-	} else if (data[0] == GIP_CMD_INPUT) { /* The main valid packet type for inputs */
-		/* menu/view buttons */
-		input_report_key(dev, BTN_START,  data[4] & BIT(2));
-		input_report_key(dev, BTN_SELECT, data[4] & BIT(3));
-		if (xpad->mapping & MAP_SHARE_BUTTON) {
-			if (xpad->mapping & MAP_SHARE_OFFSET)
-				input_report_key(dev, KEY_RECORD, data[len - 26] & BIT(0));
-			else
-				input_report_key(dev, KEY_RECORD, data[len - 18] & BIT(0));
-		}
-
-		/* buttons A,B,X,Y */
-		input_report_key(dev, BTN_A,	data[4] & BIT(4));
-		input_report_key(dev, BTN_B,	data[4] & BIT(5));
-		input_report_key(dev, BTN_X,	data[4] & BIT(6));
-		input_report_key(dev, BTN_Y,	data[4] & BIT(7));
-
-		/* digital pad */
-		if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
-			/* dpad as buttons (left, right, up, down) */
-			input_report_key(dev, BTN_DPAD_LEFT, data[5] & BIT(2));
-			input_report_key(dev, BTN_DPAD_RIGHT, data[5] & BIT(3));
-			input_report_key(dev, BTN_DPAD_UP, data[5] & BIT(0));
-			input_report_key(dev, BTN_DPAD_DOWN, data[5] & BIT(1));
-		} else {
-			input_report_abs(dev, ABS_HAT0X,
-					!!(data[5] & 0x08) - !!(data[5] & 0x04));
-			input_report_abs(dev, ABS_HAT0Y,
-					!!(data[5] & 0x02) - !!(data[5] & 0x01));
-		}
-
-		/* TL/TR */
-		input_report_key(dev, BTN_TL,	data[5] & BIT(4));
-		input_report_key(dev, BTN_TR,	data[5] & BIT(5));
-
-		/* stick press left/right */
-		input_report_key(dev, BTN_THUMBL, data[5] & BIT(6));
-		input_report_key(dev, BTN_THUMBR, data[5] & BIT(7));
-
-		if (!(xpad->mapping & MAP_STICKS_TO_NULL)) {
-			/* left stick */
-			input_report_abs(dev, ABS_X,
-					(__s16) le16_to_cpup((__le16 *)(data + 10)));
-			input_report_abs(dev, ABS_Y,
-					~(__s16) le16_to_cpup((__le16 *)(data + 12)));
-
-			/* right stick */
-			input_report_abs(dev, ABS_RX,
-					(__s16) le16_to_cpup((__le16 *)(data + 14)));
-			input_report_abs(dev, ABS_RY,
-					~(__s16) le16_to_cpup((__le16 *)(data + 16)));
-		}
-
-		/* triggers left/right */
-		if (xpad->mapping & MAP_TRIGGERS_TO_BUTTONS) {
-			input_report_key(dev, BTN_TL2,
-					(__u16) le16_to_cpup((__le16 *)(data + 6)));
-			input_report_key(dev, BTN_TR2,
-					(__u16) le16_to_cpup((__le16 *)(data + 8)));
-		} else {
-			input_report_abs(dev, ABS_Z,
-					(__u16) le16_to_cpup((__le16 *)(data + 6)));
-			input_report_abs(dev, ABS_RZ,
-					(__u16) le16_to_cpup((__le16 *)(data + 8)));
-		}
-
-		/* Profile button has a value of 0-3, so it is reported as an axis */
-		if (xpad->mapping & MAP_PROFILE_BUTTON)
-			input_report_abs(dev, ABS_PROFILE, data[34]);
-
-		/* paddle handling */
-		/* based on SDL's SDL_hidapi_xboxone.c */
-		if (xpad->mapping & MAP_PADDLES) {
-			if (xpad->packet_type == PKT_XBE1) {
-				/* Mute paddles if controller has a custom mapping applied.
-				 * Checked by comparing the current mapping
-				 * config against the factory mapping config
-				 */
-				if (memcmp(&data[4], &data[18], 2) != 0)
-					data[32] = 0;
-
-				/* OG Elite Series Controller paddle bits */
-				input_report_key(dev, BTN_GRIPR, data[32] & BIT(1));
-				input_report_key(dev, BTN_GRIPR2, data[32] & BIT(3));
-				input_report_key(dev, BTN_GRIPL, data[32] & BIT(0));
-				input_report_key(dev, BTN_GRIPL2, data[32] & BIT(2));
-			} else if (xpad->packet_type == PKT_XBE2_FW_OLD) {
-				/* Mute paddles if controller has a custom mapping applied.
-				 * Checked by comparing the current mapping
-				 * config against the factory mapping config
-				 */
-				if (data[19] != 0)
-					data[18] = 0;
-
-				/* Elite Series 2 4.x firmware paddle bits */
-				input_report_key(dev, BTN_GRIPR, data[18] & BIT(0));
-				input_report_key(dev, BTN_GRIPR2, data[18] & BIT(1));
-				input_report_key(dev, BTN_GRIPL, data[18] & BIT(2));
-				input_report_key(dev, BTN_GRIPL2, data[18] & BIT(3));
-			} else if (xpad->packet_type == PKT_XBE2_FW_5_EARLY) {
-				/* Mute paddles if controller has a custom mapping applied.
-				 * Checked by comparing the current mapping
-				 * config against the factory mapping config
-				 */
-				if (data[23] != 0)
-					data[22] = 0;
-
-				/* Elite Series 2 5.x firmware paddle bits
-				 * (before the packet was split)
-				 */
-				input_report_key(dev, BTN_GRIPR, data[22] & BIT(0));
-				input_report_key(dev, BTN_GRIPR2, data[22] & BIT(1));
-				input_report_key(dev, BTN_GRIPL, data[22] & BIT(2));
-				input_report_key(dev, BTN_GRIPL2, data[22] & BIT(3));
-			}
-		}
-
-		do_sync = true;
-	}
-
-	if (do_sync)
-		input_sync(dev);
-}
-
 static void xpad_irq_in(struct urb *urb)
 {
 	struct usb_xpad *xpad = urb->context;
@@ -1249,9 +789,6 @@ static void xpad_irq_in(struct urb *urb)
 	case XTYPE_XBOX360W:
 		xpad360w_process_packet(xpad, 0, xpad->idata);
 		break;
-	case XTYPE_XBOXONE:
-		xpadone_process_packet(xpad, 0, xpad->idata, urb->actual_length);
-		break;
 	default:
 		xpad_process_packet(xpad, 0, xpad->idata);
 	}
@@ -1263,56 +800,12 @@ static void xpad_irq_in(struct urb *urb)
 			__func__, retval);
 }
 
-/* Callers must hold xpad->odata_lock spinlock */
-static bool xpad_prepare_next_init_packet(struct usb_xpad *xpad)
-{
-	const struct xboxone_init_packet *init_packet;
-
-	if (xpad->xtype != XTYPE_XBOXONE)
-		return false;
-
-	/*
-	 * Some dongles will discard init packets if they're sent before the
-	 * controller connects. In these cases, we need to wait until we get
-	 * an announce packet from them to send the init packet sequence.
-	 */
-	if (xpad->delay_init && !xpad->delayed_init_done)
-		return false;
-
-	/* Perform initialization sequence for Xbox One pads that require it */
-	while (xpad->init_seq < ARRAY_SIZE(xboxone_init_packets)) {
-		init_packet = &xboxone_init_packets[xpad->init_seq++];
-
-		if (init_packet->idVendor != 0 &&
-		    init_packet->idVendor != xpad->dev->id.vendor)
-			continue;
-
-		if (init_packet->idProduct != 0 &&
-		    init_packet->idProduct != xpad->dev->id.product)
-			continue;
-
-		/* This packet applies to our device, so prepare to send it */
-		memcpy(xpad->odata, init_packet->data, init_packet->len);
-		xpad->irq_out->transfer_buffer_length = init_packet->len;
-
-		/* Update packet with current sequence number */
-		xpad->odata[2] = xpad->odata_serial++;
-		return true;
-	}
-
-	return false;
-}
-
 /* Callers must hold xpad->odata_lock spinlock */
 static bool xpad_prepare_next_out_packet(struct usb_xpad *xpad)
 {
 	struct xpad_output_packet *pkt, *packet = NULL;
 	int i;
 
-	/* We may have init packets to send before we can send user commands */
-	if (xpad_prepare_next_init_packet(xpad))
-		return true;
-
 	for (i = 0; i < XPAD_NUM_OUT_PACKETS; i++) {
 		if (++xpad->last_out_packet >= XPAD_NUM_OUT_PACKETS)
 			xpad->last_out_packet = 0;
@@ -1488,57 +981,6 @@ static int xpad_inquiry_pad_presence(struct usb_xpad *xpad)
 	return xpad_try_sending_next_out_packet(xpad);
 }
 
-static int xpad_start_xbox_one(struct usb_xpad *xpad)
-{
-	int error;
-
-	if (usb_ifnum_to_if(xpad->udev, GIP_WIRED_INTF_AUDIO)) {
-		/*
-		 * Explicitly disable the audio interface. This is needed
-		 * for some controllers, such as the PowerA Enhanced Wired
-		 * Controller for Series X|S (0x20d6:0x200e) to report the
-		 * guide button.
-		 */
-		error = usb_set_interface(xpad->udev,
-					  GIP_WIRED_INTF_AUDIO, 0);
-		if (error)
-			dev_warn(&xpad->dev->dev,
-				 "unable to disable audio interface: %d\n",
-				 error);
-	}
-
-	guard(spinlock_irqsave)(&xpad->odata_lock);
-
-	/*
-	 * Begin the init sequence by attempting to send a packet.
-	 * We will cycle through the init packet sequence before
-	 * sending any packets from the output ring.
-	 */
-	xpad->init_seq = 0;
-	return xpad_try_sending_next_out_packet(xpad);
-}
-
-static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num)
-{
-	struct xpad_output_packet *packet =
-			&xpad->out_packets[XPAD_OUT_CMD_IDX];
-	static const u8 mode_report_ack[] = {
-		GIP_CMD_ACK, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(9),
-		0x00, GIP_CMD_VIRTUAL_KEY, GIP_OPT_INTERNAL, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
-	};
-
-	guard(spinlock_irqsave)(&xpad->odata_lock);
-
-	packet->len = sizeof(mode_report_ack);
-	memcpy(packet->data, mode_report_ack, packet->len);
-	packet->data[2] = seq_num;
-	packet->pending = true;
-
-	/* Reset the sequence so we send out the ack now */
-	xpad->last_out_packet = -1;
-	xpad_try_sending_next_out_packet(xpad);
-}
-
 #ifdef CONFIG_JOYSTICK_XPAD_FF
 static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect *effect)
 {
@@ -1597,24 +1039,6 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
 		packet->pending = true;
 		break;
 
-	case XTYPE_XBOXONE:
-		packet->data[0] = GIP_CMD_RUMBLE; /* activate rumble */
-		packet->data[1] = 0x00;
-		packet->data[2] = xpad->odata_serial++;
-		packet->data[3] = GIP_PL_LEN(9);
-		packet->data[4] = 0x00;
-		packet->data[5] = GIP_MOTOR_ALL;
-		packet->data[6] = 0x00; /* left trigger */
-		packet->data[7] = 0x00; /* right trigger */
-		packet->data[8] = strong / 512;	/* left actuator */
-		packet->data[9] = weak / 512;	/* right actuator */
-		packet->data[10] = 0xFF; /* on period */
-		packet->data[11] = 0x00; /* off period */
-		packet->data[12] = 0xFF; /* repeat count */
-		packet->len = 13;
-		packet->pending = true;
-		break;
-
 	default:
 		dev_dbg(&xpad->dev->dev,
 			"%s - rumble command sent to unsupported xpad type: %d\n",
@@ -1793,13 +1217,6 @@ static int xpad_start_input(struct usb_xpad *xpad)
 	if (usb_submit_urb(xpad->irq_in, GFP_KERNEL))
 		return -EIO;
 
-	if (xpad->xtype == XTYPE_XBOXONE) {
-		error = xpad_start_xbox_one(xpad);
-		if (error) {
-			usb_kill_urb(xpad->irq_in);
-			return error;
-		}
-	}
 	if (xpad->xtype == XTYPE_XBOX360) {
 		/*
 		 * Some third-party controllers Xbox 360-style controllers
@@ -1905,8 +1322,6 @@ static void xpad_close(struct input_dev *dev)
 
 static void xpad_set_up_abs(struct input_dev *input_dev, signed short abs)
 {
-	struct usb_xpad *xpad = input_get_drvdata(input_dev);
-
 	switch (abs) {
 	case ABS_X:
 	case ABS_Y:
@@ -1916,18 +1331,12 @@ static void xpad_set_up_abs(struct input_dev *input_dev, signed short abs)
 		break;
 	case ABS_Z:
 	case ABS_RZ:	/* the triggers (if mapped to axes) */
-		if (xpad->xtype == XTYPE_XBOXONE)
-			input_set_abs_params(input_dev, abs, 0, 1023, 0, 0);
-		else
-			input_set_abs_params(input_dev, abs, 0, 255, 0, 0);
+		input_set_abs_params(input_dev, abs, 0, 255, 0, 0);
 		break;
 	case ABS_HAT0X:
 	case ABS_HAT0Y:	/* the d-pad (only if dpad is mapped to axes */
 		input_set_abs_params(input_dev, abs, -1, 1, 0, 0);
 		break;
-	case ABS_PROFILE: /* 4 value profile button (such as on XAC) */
-		input_set_abs_params(input_dev, abs, 0, 4, 0, 0);
-		break;
 	default:
 		input_set_abs_params(input_dev, abs, 0, 0, 0, 0);
 		break;
@@ -1982,12 +1391,9 @@ static int xpad_init_input(struct usb_xpad *xpad)
 		input_set_capability(input_dev, EV_KEY, xpad_common_btn[i]);
 
 	/* set up model-specific ones */
-	if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype == XTYPE_XBOX360W ||
-	    xpad->xtype == XTYPE_XBOXONE) {
+	if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype == XTYPE_XBOX360W) {
 		for (i = 0; xpad360_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
-		if (xpad->mapping & MAP_SHARE_BUTTON)
-			input_set_capability(input_dev, EV_KEY, KEY_RECORD);
 	} else {
 		for (i = 0; xpad_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
@@ -1999,12 +1405,6 @@ static int xpad_init_input(struct usb_xpad *xpad)
 					     xpad_btn_pad[i]);
 	}
 
-	/* set up paddles if the controller has them */
-	if (xpad->mapping & MAP_PADDLES) {
-		for (i = 0; xpad_btn_paddles[i] >= 0; i++)
-			input_set_capability(input_dev, EV_KEY, xpad_btn_paddles[i]);
-	}
-
 	/*
 	 * This should be a simple else block. However historically
 	 * xbox360w has mapped DPAD to buttons while xbox360 did not. This
@@ -2026,10 +1426,6 @@ static int xpad_init_input(struct usb_xpad *xpad)
 			xpad_set_up_abs(input_dev, xpad_abs_triggers[i]);
 	}
 
-	/* setup profile button as an axis with 4 possible values */
-	if (xpad->mapping & MAP_PROFILE_BUTTON)
-		xpad_set_up_abs(input_dev, ABS_PROFILE);
-
 	error = xpad_init_ff(xpad);
 	if (error)
 		goto err_free_input;
@@ -2105,8 +1501,6 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		if (intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC) {
 			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129)
 				xpad->xtype = XTYPE_XBOX360W;
-			else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208)
-				xpad->xtype = XTYPE_XBOXONE;
 			else
 				xpad->xtype = XTYPE_XBOX360;
 		} else {
@@ -2121,17 +1515,6 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 			xpad->mapping |= MAP_STICKS_TO_NULL;
 	}
 
-	if (xpad->xtype == XTYPE_XBOXONE &&
-	    intf->cur_altsetting->desc.bInterfaceNumber != GIP_WIRED_INTF_DATA) {
-		/*
-		 * The Xbox One controller lists three interfaces all with the
-		 * same interface class, subclass and protocol. Differentiate by
-		 * interface number.
-		 */
-		error = -ENODEV;
-		goto err_free_in_urb;
-	}
-
 	ep_irq_in = ep_irq_out = NULL;
 
 	for (i = 0; i < 2; i++) {
@@ -2306,15 +1689,6 @@ static int xpad_resume(struct usb_interface *intf)
 	if (input_device_enabled(input))
 		return xpad_start_input(xpad);
 
-	if (xpad->xtype == XTYPE_XBOXONE) {
-		/*
-		 * Even if there are no users, we'll send Xbox One pads
-		 * the startup sequence so they don't sit there and
-		 * blink until somebody opens the input device again.
-		 */
-		return xpad_start_xbox_one(xpad);
-	}
-
 	return 0;
 }
 
-- 
2.51.0


