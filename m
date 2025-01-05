Return-Path: <linux-input+bounces-8910-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFDDA01B98
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA05E1883138
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE51B5ECB;
	Sun,  5 Jan 2025 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti/Xbuy7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F011C9B6C
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105889; cv=none; b=Qr4NKhv5gdAmriu4+6QFXuzfUPJhDm5kkl0VN9CrMv+V1l+FIq96dFPg75n6gUDP4hhc3Js+9rxSnt7Ii7ym0tr8TdmEvV53Pf8u2kZRRHob1V2iaYwVm2hGSY9IzMeemf1/cF9mw9C3Ocu2I0lhb9fZLV9sPQznvl5eMT5kLW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105889; c=relaxed/simple;
	bh=u44cl91ItuO4BqcXhsgSVigas9B82NemgMt8R/+t94Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEV3NPEcx1s3GTsWSkW70TdTA1zWohj1cOzYrIiK29zByayUk0K/NiD7xwl8aPdub8XyFfEGoEELr2qNkHpWUqckG7wclSsLHmcqMJUv35TPPYHLqImceFmSftBlmTR+GcCdVDafwwMQ96vcSaDt3cl/9lcVEhp5KzukKeIX8KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti/Xbuy7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3863703258fso8586602f8f.1
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105886; x=1736710686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIqeHbi1WOMjiUoHKxoroqy2hM7PulynqJCGOyUqYRo=;
        b=Ti/Xbuy722lLv6/LlqLBTz7SFgm8dctbwDbv68lWm3PbFomEXexsIF+gCmo+EOQ2it
         Ot4LxxU+MmoRq6h/h6deL18dgCLOFymU2D8AB06Nj32O9yekrxv9V3iAoZwMDGPiuQPt
         +6nwiVXuJFC6tXnsxT+0tc0TqXA3Urq+gHhCo9tOdrrhgdLsGRY0mjSbxIpCvatF8HYN
         bKkdEgWToFI8hbemBYRZFCL9kHMM1aGL/P9NFwaHukD1yx7k2bEvUSICdQw2LpsyuuoL
         +qxOl21xJ5g/1UKR/xyHz8Mqs5MNfcZxBhQjqjKS9bXOB57dgvHJMxUhLJK/b/dbUgK7
         JLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105886; x=1736710686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIqeHbi1WOMjiUoHKxoroqy2hM7PulynqJCGOyUqYRo=;
        b=JhmxuRKBfftWcdVCSYEeJ5JmnYK2m2O7HIKnyeV6zD+4fkShP2+25u0K5yFtEvOW8h
         gG3+NS9WngMWvwMchKBKRUaJlIvaiV2eh9S/RK4bn9Zj6UUqkkn22rM11BNBxFLgobS0
         2cySkTAOcrb7+5TXG5lZRIT5J4AglS0KuLffasY6W3fetLhAwOICfr+vvhpeX7bLisAJ
         zR1aeU1vKFcjJ3ynwYVkIPElg7GoT79CsZ9mKk255+ptW+KoqFuaPEfErJX6eP7oLozs
         Jmlm16JQ9O6cH1EOtwzjN5Nj8YR4rMBy67LC9ECpJBYDl4Z+T5E/Fnq9su8snkDuyd8R
         N6Ag==
X-Gm-Message-State: AOJu0YyYB45Vulv3bNzjvp5r37DaTDnR6U7mKQpvi7AvBkbVLQeOjN7Y
	J4quodr72/L8VG/kUdnKAuze6irM/g0HJo5za1Cyey1D6pCTfCf9/F4kPlebh6MKyw==
X-Gm-Gg: ASbGncss78zbGTElkO4KXrYViU9dDTOBzJKrKR6TBcnLDxRpCPNANuoCdKi/P7HD8Pv
	954V5Cj8ic0+Oh8LCY4s21sujKyQDN2J7ajQ2NdD4ot3hwHCkbkqcoAY1TgazazWCaf9jMwPRQE
	Pszk/q2oulLIWpJP6jcz9amvoIqWr0mHVInCpjDx+g81kGV9U10Rb4il9wipZJreBuGyyxh0b39
	vAeBpjGr+Ks1y8DB1qF5iuCZrUb2/aJyf59nX6ULHVkYAVxGA/SRyu4yFB4TedXP/yf
X-Google-Smtp-Source: AGHT+IHrQA/4/bPSuean2WRlZiHelrE0yFdopvLtmZJnHATiCd2JKU0vvGFvjSNqx8p0lG90w8ae1w==
X-Received: by 2002:a05:6000:1785:b0:386:3c93:70ff with SMTP id ffacd0b85a97d-38a1a1fdd35mr50504586f8f.8.1736105886474;
        Sun, 05 Jan 2025 11:38:06 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:05 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: =?UTF-8?q?Tobias=20G=C3=B6rgens?= <tobias@localhost.localdomain>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 05/13] Input: xpad - add Black Shark Green Ghost controller support
Date: Sun,  5 Jan 2025 20:37:42 +0100
Message-ID: <20250105193750.91460-6-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105193750.91460-1-rojtberg@gmail.com>
References: <20250105193750.91460-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tobias Görgens <tobias@localhost.localdomain>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index a7666a21704d..9d9f73fabe9f 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -388,6 +388,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
 };
@@ -536,6 +537,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
 	{ }
 };
 
-- 
2.43.0


