Return-Path: <linux-input+bounces-1557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30384310A
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 00:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53CF91C209FF
	for <lists+linux-input@lfdr.de>; Tue, 30 Jan 2024 23:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240E47EF1F;
	Tue, 30 Jan 2024 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eUlHjAae"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A77EEF0
	for <linux-input@vger.kernel.org>; Tue, 30 Jan 2024 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706656751; cv=none; b=A7clKDk+RxGUcqbMMRzDfZRo6Q8dw7DTo43Pk3nquCw8KiyRHHWLUdLbahTjjQTqy6rNW03T45jHdJ0EWhkEjgQXS8BaEMxY5i2yfA4+cqjKNe06nXmEXAe8HEK/OMtFgII77oqOl0Qs60X182dAWXoHrjfpXuhRF7YjmWDu22c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706656751; c=relaxed/simple;
	bh=Ne2zymPGwgNLZ0fzTsCHLLHHtmVdegrwUkI1VwreITE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YHF2u05H2kbroHcmmumovEVrdy7TvQD1M+e7Pj1kYlKKn838cYjakLGtCSlklFRsqNkZbuQznsQYJH0SUHNm6MPku96T9VzFvxIeMZqqU0z+aYqtK799rCrequqwsTLyAtsIWFnGM8ocVzYfYyrw8S1AJpEjQMjiaPKkN8nG9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=appsforartists-gmr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eUlHjAae; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=appsforartists-gmr.bounces.google.com
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6dd65194396so307894b3a.0
        for <linux-input@vger.kernel.org>; Tue, 30 Jan 2024 15:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706656749; x=1707261549; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZHtWLch8osUf7MuEnzR3SfbD3ic98HmCKlCawxZtIo=;
        b=eUlHjAaeEBtIFR9nvF84wrbDWAubQFTi31gGs0RkbpMXaZrpn9HRUnQL5eS49iPjdu
         EsdtJbG39sFzVkeeWo9JPBxvBoavZf/EoFebtlpEcY+axxf7hM8z42cOPM79NhG+ugJD
         ol9psMQGHatd5TMXQBi1QfV+chc8Y4FXBPk+CJQnQuyMnb4n1hVXk++NLzU7kohElMri
         pwx116sO5SynQwNAJyNH5HV4M8yqf4p9sMM6f/NYthUEUbHIEwpTQr0V+y2nh4mkGfMX
         UQHB/4Ed+8OJSOq293Nt+o2xculEdIH5uGEU/fVm/1brvDJetf/rDixFycM/UH28Ujl1
         B2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706656749; x=1707261549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZHtWLch8osUf7MuEnzR3SfbD3ic98HmCKlCawxZtIo=;
        b=B4MZeWKAQSOTDvLjz+N0S8E7ueAES2mbOE9oHIPuEns7h8AQrSAFV+Er29PAl3J4Kc
         OOqkPgF30/kZH72RNU2hWW9nhkGjqfuMeGC470PbB7ckjDLCyWIqlnn7JEjjXMAQbBms
         kJ2KiruFgiEwKvMYg6Xqj9fkjHIX2CZTnagihUU/cwK3iNGbbY0hvsOtWe3B3drEUFce
         9BUC1jkqfXU9/WQ34il7KGVeui96K525CwnjaatqMbdiY06L9b8956VtByQW6ekjFUgQ
         09ZsAzGE8DP9WZJDBxSqAOyOIhpWYqLtK+Trmf1i9m8YP6KCLfAXjk+1XmgehCN0Anz/
         ahzA==
X-Gm-Message-State: AOJu0Yxb6wQBaHE5zU9Soc0nhREWZEhKT5uKSZowZgx0vrjLdVhs3IhX
	MurrkrJVuwk54wEEHj+soAz5gTuEe79aN/q/+FfFlmX5WVQpqil8wXNTbpsFClaw8csZ+hMqwL/
	CwkjM+t6pMIzB9noNiGM7B3melQ==
X-Google-Smtp-Source: AGHT+IHtZT1kC3UUcmYNw2JPqG5HMaXcBB4Q0lXZDdBLkQmSTDLHyDwKshMTqz2mJkunN3phkuL0+B5wXSbWjjTX+gE=
X-Received: by 2002:aa7:9ec8:0:b0:6de:1b47:8887 with SMTP id
 r8-20020aa79ec8000000b006de1b478887mr120189pfq.1.1706656748602; Tue, 30 Jan
 2024 15:19:08 -0800 (PST)
Date: Tue, 30 Jan 2024 23:19:03 +0000
In-Reply-To: <Zbl49VAMZx2qrz-p@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <Zbl49VAMZx2qrz-p@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240130231903.293265-1-appsforartists@google.com>
Subject: [PATCH] Input: xpad - sort xpad_device by vendor and product ID
From: Brenton Simpson <appsforartists@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Cameron Gutman <aicommander@gmail.com>, Erica Taylor <rickytaylor26@gmail.com>, 
	Ismael Ferreras Morezuelas <swyterzone@gmail.com>, Jonathan Frederick <doublej472@gmail.com>, 
	Matthias Benkmann <matthias.benkmann@gmail.com>, Matthias Berndt <matthias_berndt@gmx.de>, nate@yocom.org, 
	Sam Lantinga <slouken@libsdl.org>, Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, trivial@kernel.org, 
	Brenton Simpson <appsforartists@google.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Brenton Simpson <appsforartists@google.com>
---
 drivers/input/joystick/xpad.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7c4b2a5cc1b5..c67f3d65192d 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -127,6 +127,7 @@ static const struct xpad_device {
 	u8 mapping;
 	u8 xtype;
 } xpad_device[] = {
+	/* Please keep this list sorted by vendor and product ID. */
 	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
@@ -147,9 +148,9 @@ static const struct xpad_device {
 	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
-	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
 	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", MAP_PROFILE_BUTTON, XTYPE_XBOXONE },
 	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
@@ -335,7 +336,6 @@ static const struct xpad_device {
 	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
-	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5303, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
@@ -350,9 +350,9 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5502, "Hori Fighting Stick VX Alt", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5503, "Hori Fighting Edge", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5506, "Hori SOULCALIBUR V Stick", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x550d, "Hori GEM Xbox controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x550e, "Hori Real Arcade Pro V Kai 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
@@ -363,6 +363,7 @@ static const struct xpad_device {
 	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -460,6 +461,9 @@ static const signed short xpad_btn_paddles[] = {
 	{ XPAD_XBOXONE_VENDOR_PROTOCOL((vend), 208) }
 
 static const struct usb_device_id xpad_table[] = {
+	/* Please keep this list sorted by vendor ID.  Because the lines use different
+	 * macros, you may need to sort it by hand.
+	 */
 	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
 	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
 	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
-- 
2.43.0.429.g432eaa2c6b-goog


