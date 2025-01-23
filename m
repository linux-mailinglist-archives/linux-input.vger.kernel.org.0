Return-Path: <linux-input+bounces-9499-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ED7A1A944
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 18:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ED3316743D
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 17:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9DE14A4E1;
	Thu, 23 Jan 2025 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiEoCVee"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E25149C57
	for <linux-input@vger.kernel.org>; Thu, 23 Jan 2025 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654852; cv=none; b=Sd1XXMjbwGJtWcGJOT4Cnt5UTG26MDBWlLa1hlLr6Edp8aRnwrhtCkFJi30/+9gD6v7wBWK2Hbj95hNtLoLM+eWpNqGZLs2ma1Tq7mmD4F2FW05D5tjlUvggJQV1P5955ZrPNERS8qXcPsdO6Zx5FFoLQddNwjs4UTxQ4zbQ2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654852; c=relaxed/simple;
	bh=J0Yk52HfcUvob2ny+mg459Ly2O0eplyVN5QOHFWjAZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dR7ZNeYqeMwrGclCA2lcgR4CIOqaPiCbiiqSY+kXU5VurLXPwVIRGFjsqce79NyO8292vcmUEN4oO8/kcN33J+1NcK/pzFGESDypYJ7YjRhKXinQM7kpqevufwdi3uBsZ2hFGbpbpzFxcLOjHij01DndeZYUuCCIHSX9/9b1XiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiEoCVee; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43635796b48so8625805e9.0
        for <linux-input@vger.kernel.org>; Thu, 23 Jan 2025 09:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737654848; x=1738259648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5jzqbpMkH8MYnywZD8RW4GP1Ng0Ns26br/G3xxq27Q=;
        b=QiEoCVeeSartE1gSr8DW+0rmQ5Xif58ixIu8ZCpW+L3RShknJL0x0SF+0gOk5rR5fw
         Brq0zfF+DfXLNZM2zOcUuU8U90iJRf+9gX0eAh41zP1qMQCYfdFXGO3wTXOH1wyfeZyw
         5LpkerYA8uJUd3lx6/HP6qcLo27gW6yIaFrj4t04PfwkFd08nsQ6DECJndqva4vJaF+q
         DW1yf3Zfszc3MzfzwC6VkAcJvcCKKO5RX+waOViBgNfEz4AT+28sSmTd/5INXGF57WDw
         HvrBjLFqpPiKILF9EnDCn6f9xgbSS8zuVC2MFKFJQBuaEFyw9RvDzFEiwM8onKteS9S0
         Ud4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737654848; x=1738259648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5jzqbpMkH8MYnywZD8RW4GP1Ng0Ns26br/G3xxq27Q=;
        b=V8AZkZ1smKr6swTdRgGXkKiHVjQCK14IczAzuQKup5W3VVKJVEfUCwdRCshVtc4Vtd
         aQX3tdZT3XALqyYtsyt0YoOfymKOEKiundXr+zaWsS0X2Vd/kBexhfx9asSkEHlzw4TZ
         NOvS9VbAGXeCv78YkfziK3rEEI8NN4hT5fqBgjtUumVZgSrrGX55LurcMr+/rhdkqIgT
         bBZa1MpQwI6BVAPQ2LXnfmAMEa7RcN+wcXsHwJIO6HkSJ1nOl6o744xHYChr/maxlV47
         wN9WsyKRHNQ0RVV62igPoC7ktVJw4YdvgOZw7BRH3EjPILPZKdVCFUbNiMe/xxa1x92y
         0yNQ==
X-Gm-Message-State: AOJu0YyLmyfMntnNg0FIgrcCVfBnWOANx8LKG5bEQz5kTmDT59wzmkre
	tlzq84TmXhmbGkfzFwzogwQFXwz3LG+C9LySg0s1v9VVpCdcE/Z/m1D6/enz
X-Gm-Gg: ASbGncshhzPXXjm9msm2ltd2QN5ybpPJXVOWO9ko/W3OVoscfwU3d+yaeVcIwM7ePkR
	EdYa8qYdCwGX4adyMh/GCscA+7PTM9el/KXz9gCH5j8t+tIpIqhZ4MNvhT6Pg50hoDnlI2pgY+Q
	vrimGQC0UhHP4BEpfPe2tJX+xMyJeo4L6C6OrBDYH8dZIyHOm0MN+m+urvuEp91MBsJUn4TpPuG
	ZEGM1qk4hzpKj6DUKC9+J5+rENJCXa5H8OB1gWV1ic2DVhFGbt6CPHDmkK84enl/HPDUmOmSjpf
	99CH8ANwtGL9s6Ma
X-Google-Smtp-Source: AGHT+IEYk1hx4JpT4RTg6Y2eBGoMFcmhSOlhFV9Xf1GWzB2sEE72e1jl4iSHd+/V6mnbeQOdymZapw==
X-Received: by 2002:a05:600c:6a8a:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-438bd0611f5mr2510635e9.6.1737654848044;
        Thu, 23 Jan 2025 09:54:08 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48f:5500:17a0:6125:948d:aeb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31d99ffsm69567575e9.29.2025.01.23.09.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 09:54:07 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH] Input: xpad - add multiple supported devices
Date: Thu, 23 Jan 2025 18:54:04 +0100
Message-ID: <20250123175404.23254-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Rojtberg <rojtberg@gmail.com>

This is based on multiple commits at https://github.com/paroj/xpad
that had bouncing email addresses and were not signed off.

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index b434a465bf72..0399fbf33835 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -140,6 +140,7 @@ static const struct xpad_device {
 	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
+	{ 0x044f, 0xd01e, "ThrustMaster, Inc. ESWAP X 2 ELDEN RING EDITION", 0, XTYPE_XBOXONE },
 	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
 	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
@@ -177,6 +178,7 @@ static const struct xpad_device {
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0201, "Saitek Adrenalin", 0, XTYPE_XBOX },
 	{ 0x06a3, 0xf51a, "Saitek P3600", 0, XTYPE_XBOX360 },
+	{ 0x0738, 0x4503, "Mad Catz Racing Wheel", 0, XTYPE_XBOXONE },
 	{ 0x0738, 0x4506, "Mad Catz 4506 Wireless Controller", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4516, "Mad Catz Control Pad", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4520, "Mad Catz Control Pad Pro", 0, XTYPE_XBOX },
@@ -238,6 +240,7 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x015d, "PDP Mirror's Edge Official Wired Controller for Xbox One", XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
@@ -276,12 +279,15 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x0152, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
 	{ 0x102c, 0xff0c, "Joytech Wireless Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
+	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
 	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
@@ -366,6 +372,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
+	{ 0x24c6, 0x581a, "ThrustMaster XB1 Classic Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
@@ -376,8 +383,10 @@ static const struct xpad_device {
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
+	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -385,9 +394,14 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
+	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
 };
@@ -486,6 +500,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
+	XPAD_XBOXONE_VENDOR(0x044f),		/* Thrustmaster Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
 	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
@@ -532,10 +547,13 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
+	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
+	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
 	{ }
 };
 
@@ -688,7 +706,9 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
+	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_led_on),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
+	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_auth),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
-- 
2.43.0


