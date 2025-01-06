Return-Path: <linux-input+bounces-8977-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A30A032F2
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A77A73A47BC
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17ED01DF977;
	Mon,  6 Jan 2025 22:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6tnglqT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC21CEAD3
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204101; cv=none; b=B9ag6q36pmZ4coNoe+fcOVHBwyn3EDTgdtFzp0Y2wyYc/sfLGSdRbRScdsdotJdLVR1QNqrGkQCEqMbZlcvT40zZVx+IF40NM+1qSA7IBXQJblVNtwORmoWylcYDBIkOlEMg5BmiWAEGFlC/R5B0ew2G8fA2U4q+d1XLjHbmlt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204101; c=relaxed/simple;
	bh=uozL2USESf+B/Z84pPPJth+FbEJBTQZ5cxJHxuAtZZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5BBGTXleEiqdaJWjIly7MecCRtP6j4uGo/fVfFMaxHoHZx4XolHSEMCKV77XQJ9rdk2hDzDDxJjbCzAPpW3gt4naTD6aalVGUutWQcM1lTh1SkAZt0LU2ROoqTbDh4nefWAMqMtgjq5oNS3UMVZTB4asMYntAs5wSNW7uugdUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6tnglqT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso7573997f8f.0
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204097; x=1736808897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJEVHoYq0oHbBnN1JJio3INM1OYeWr87Ja/3m8tuF4g=;
        b=F6tnglqTmLEcS0y1ySY/HNRYQwK38EjadRd4kCmHmn3cWsylEaQj6a5culC3KYzYkQ
         Z/n6yxgi52+057EVJQZHt6y1cvW+3/izAXOwZAscUlnneiNuERfDeGlSVogXhTqXFJHZ
         q+TgKktZjmtWwLI2biqHERfqCdnkJu8dPUoty/iFikT9ofZGkuhIx/J35U1DBd5YEYlW
         Q0p/0FOgVi8dyo7g4p7d3s6DPhGwVi8ncW3TuFwruaMjFIlAJpZss7+65X52Q73uNwWF
         MQyUflo23LrhSXmqPnhMi1VGnu1JceMPMCgD5Eu86bhWu8hWKn0me/mplAxO93zN2Y2n
         NQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204097; x=1736808897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJEVHoYq0oHbBnN1JJio3INM1OYeWr87Ja/3m8tuF4g=;
        b=ZKISYyjc63j1sCldw8bUjKWNVbZRUgiwuwGLxjMKrdUjBiLJseKFXCYW5VjUZsi+TJ
         Avgd3j75vCxNdG3hW3SSII0GgxiK1faHWtNOZizDNaeON+biUkpFj55eOEwjG5d1SEGi
         y+au02cwEov8akIR4luD7GZv8d0ZGPp1AKLkDpDUe/8btY8tKnqGaq37MyGVsilscz63
         NdSudrK/4JHwDRube7KIxdkZSKDJr+hDDtJ7KCk0G7pUq/FNyjcEaB6lKss9H7e3ZeBc
         h00qr0//ne56JaWKeOgX09LQJrmBBFf3vpfeiUeP0TvYfVDJVDnuxtjYAdeQnqtXP6oW
         180A==
X-Gm-Message-State: AOJu0Yw3djOxKmmVLz9w7ucaw6WP9rGGe+W0IsglEJDZhqU9Wl6Lxais
	qvjl7LwK3MF076LKPe1ni/LGY2Li4gcSVPNfAD2CqktVgRumf3UmxARGSsJYHsQ/nw==
X-Gm-Gg: ASbGncuJiMKSmOb4B49f9bEMnWskzJ28TH5JwCr6M0jgfdfGROfx+lltn+bHOC2ZuTm
	VEsn42/LDqlGA7uT8At+X8zTl6nykNyNIP5VfoKsHfjqiE0eHKSkZl0x6+r7exaNNpTR+WDFrop
	Bqj8cPxOsXfoszE1PhpS4mtndcpEUIGUlxjDLDE4Rwf/R2gbQWDVlM3KDS2l3K1jw5xpMkHrzko
	KSqOUMGWI5g+YLARA/GXpPA2as9ukAaRvDi0Mo/8wOTg+AaWtvMmFrUI2IDeDc+aEkh
X-Google-Smtp-Source: AGHT+IGr6OMV0XSJcovnYIcbS+AJzGs1IvKOUvhB/nx8wlx0FTp69dUJVdL2yQErSjXJ4UGdmCw8lA==
X-Received: by 2002:a05:6000:1acc:b0:385:e0ea:d4ef with SMTP id ffacd0b85a97d-38a224091dfmr49412430f8f.58.1736204097393;
        Mon, 06 Jan 2025 14:54:57 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:54:56 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 04/10] Input: xpad - add multiple supported devices
Date: Mon,  6 Jan 2025 23:54:31 +0100
Message-ID: <20250106225437.211312-5-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106225437.211312-1-rojtberg@gmail.com>
References: <20250106225437.211312-1-rojtberg@gmail.com>
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
 drivers/input/joystick/xpad.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7985b7a5cf0e..b2716b49d3b6 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -275,6 +275,8 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x0152, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
@@ -374,6 +376,7 @@ static const struct xpad_device {
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
@@ -384,9 +387,12 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
 };
@@ -535,6 +541,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
 	{ }
 };
 
@@ -687,7 +694,9 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
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


