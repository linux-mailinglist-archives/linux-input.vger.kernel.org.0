Return-Path: <linux-input+bounces-11346-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EFEA7537B
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 00:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC1A77A6B6D
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 23:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978DA1E5202;
	Fri, 28 Mar 2025 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="AML42ikm"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F8A1DE88C
	for <linux-input@vger.kernel.org>; Fri, 28 Mar 2025 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206045; cv=none; b=li6weC6PhztSCZWhfJWw7656ElK08STGZH/LSa9UOsF/gq21l2WIeFdEG2I0f5f/2iA+JchmSMfi+b+TZNg9XTh0ERzrE73JQL/ADCMAPfRGk/ZAFUHYYg471XJS1DsFYkSphcY+fCy21VGAtS4Cu3azbJ4AXHMEtIsscCOtIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206045; c=relaxed/simple;
	bh=UFsKKqgPTzuZ45syqfKD6kE+gA06gK9UNjVO2OLFB1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9JzL1Sy14weXIgU5Mi26ndlhq1v+NWJVbTmHArP1Rwv9Jfn5+0U6YG7KUH/IFkWJEa7zg3CLRsNXrxglUugNVxF0bElQAoGoQoK2ua99+QpPTjir/Aohg79ZRbMk7W+JVqFzybBLtXx5jE9kJGs7uujyZxdPK6aprBgc/dPies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=AML42ikm; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1743205448; bh=UFsKKqgPTzuZ45syqfKD6kE+gA06gK9UNjVO2OLFB1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AML42ikmUEhAhCIde9au6j4jWmtAyHuAH78Btx/bJO6+8799hfFSCrQxCxmERaYM1
	 S/syea5CGM96BgMO6IUKm6foE/OXLGsE0JwlhXpuNFQMM2tJyDwzbKhm3SyrNlTXCg
	 1roHcL9e6pLBn/2ehVGAWRAdxeVjOoUayzRTfqH+BK8foq2xt6yxPEekL9aldgXLzp
	 ntGHIrRPcjBbA6B1N2tt/c/iGZEblYvPf0CZrQwAZW7wWjCX/QYUtKHnRDx5Bj9Shd
	 AnNJIP9fvLf3K1NXQ7CRRzgBeSYvd3rw4N7vhMpm7TrvYHB3fYHyPvrkVhtBsUM5zp
	 pdmVKNCAz8ePA==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 4518BA090;
	Fri, 28 Mar 2025 16:44:08 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 4/5] Input: xpad - Add support for several more controllers
Date: Fri, 28 Mar 2025 16:43:39 -0700
Message-ID: <20250328234345.989761-4-vi@endrift.com>
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

This adds support for several new controllers, all of which include Share buttons:

- ByoWave Proteus controller
- HORI Drum controller
- PowerA Fusion Pro 4
- 8BitDo Ultimate 3-mode Controller
- Hyperkin DuchesS Xbox One controller
- PowerA MOGA XP-Ultra controller

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index e6a46cde16be..0714d145e600 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -285,6 +285,7 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x0152, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x01b2, "HORI Taiko No Tatsujin Drum Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
@@ -357,6 +358,8 @@ static const struct xpad_device {
 	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x20d6, 0x400b, "PowerA FUSION Pro 4 Wired Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
+	{ 0x20d6, 0x890b, "PowerA MOGA XP-Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x2345, 0xe00b, "Machenike G5 Pro Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
@@ -388,10 +391,12 @@ static const struct xpad_device {
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2993, 0x2001, "TECNO Pocket Go", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
+	{ 0x2dc8, 0x200f, "8BitDo Ultimate 3-mode Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x6001, "8BitDo SN30 Pro", 0, XTYPE_XBOX360 },
+	{ 0x2e24, 0x0423, "Hyperkin DuchesS Xbox One pad", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x2e24, 0x1688, "Hyperkin X91 X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
@@ -410,7 +415,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
-	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
+	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
@@ -566,6 +571,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOXONE_VENDOR(0x366c),		/* ByoWave controllers */
 	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
 	{ }
 };
@@ -720,8 +726,10 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
+	XBOXONE_INIT_PKT(0x0f0d, 0x01b2, xboxone_pdp_led_on),
 	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_led_on),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
+	XBOXONE_INIT_PKT(0x0f0d, 0x01b2, xboxone_pdp_auth),
 	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_auth),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
-- 
2.48.1


