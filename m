Return-Path: <linux-input+bounces-9017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50805A04A3C
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5320F18852DA
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914F21F63E3;
	Tue,  7 Jan 2025 19:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK9VzndE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56B1D63EB
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278126; cv=none; b=Lh1HEVCPXpFEvLMKJ/wolY1kHQtytNGTnnd4+GrVlvsKz1hobgXG/UUrFXXottA3HlSHw0yy1Bv0KlvOdpXo18O75pl6VedbWPAwum3V+h+F+4Cb55Vkb241FYOtMhTe7ToHOUA7N0Sbbf1iw4Smajy+yGQWwK2sPR6I6V0z7e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278126; c=relaxed/simple;
	bh=QtLVcEyEsDTdUeNe0xMWkZe5VynFOWHIivPgPp5rQPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kL7YnqY05CtuBsXL9MHxYMN3AnRaqQvn+8k8pLIGDxi4iyOvu6kv1CBC27uItfXcp1yy4J1BvbUHsEeA2qBR5u0oCI8PdLgmJQsQklGaYH5Nphe/EMd1YouqyxwPkc3GYdV49RFuk3yNGSBImNKmRYk7AeKzbjROc8d5AzZMxRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK9VzndE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso114425235e9.1
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278123; x=1736882923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnTdpy58kek0Kgc8hmiqUo+eyrQVN7WK+txrCy18XFo=;
        b=cK9VzndEPJleaL8obPclQmPVFqheOAZYMDOoLZ7H0wJThNn7Ecls56zqb7LVPUGMwZ
         kzlVsYi1fNZR55QI5ZXGGPnvwjXT7HHH/ggbL8E35OAzC8PQyxxCyp9j2j/o6nY7uF73
         1yNpzxtwff3Eb49d8LtQb9FVNOSERA76XjoWoFCvH1PdGtJ8Wgc2kXHGqgAUfdzAq0/8
         fp6u4W2/KV/MBgMh/o1sW0fkXq/NT+EXqo/yLvC1zujCeWUZTQNmWJLbEBDAsu0ysdCr
         LaEHk/cGtpzrhsiSdfLZHkOQtY8hdIsXEZ+ETH/oDm3szU85abZHWcrRKCUIIT8P1lR/
         F1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278123; x=1736882923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnTdpy58kek0Kgc8hmiqUo+eyrQVN7WK+txrCy18XFo=;
        b=ZAcsX23NBwl9HzVxMKmYtv8sXAte33GDr3RWkdeXwHHRfLr54lkhwnCT0MgqLqxBmV
         1PW96aMX4kdM6SdazwNPYmoLPu0G7IdWOjMYbne0BXKwVB5sycvMR2cG6n3KypohQP/3
         xK9l1dvtLj6rPKCAd0KMHbsIZarf/NpoLhvENt5KrolNkO+AhcnDo8KBy3L6+gASxFMb
         yda95d2mjv7kJ/wE9olyd2/OnBSMhgEYKU37aLm5Pq0gstWvysOu/GCuI4Pll+vbDk56
         RHTdi91yda8+xCo5WlP+K5YnMn4oIqxh2BhvmnopNPzIdUYNeUjxAMyfUi2D6Tip6zut
         EB8A==
X-Gm-Message-State: AOJu0Yxe1vtWyHzSGZITT1IJa0Udgg8K6QR0gbRQm00H9CJ4OqTh4uIQ
	a0v5J8Cp0+wBGkbomArjc7qSobNzrVJdKRqGo1YX5R1LyLwZ3AZutEyNf6AL4jHdQA==
X-Gm-Gg: ASbGnctCyzmMSQ9PHOYEALbtKajBRyZjeXMVEXfaYsmzZ2ZSV9VPHtbJm3MSXc5tnNu
	xiM8A58rlGRsyxuZmndqyp+9arkuGjnvrDzF8R2ZWuT+9pa/iXPXpxeY8wYrBniBDn1kBf671Cr
	l03NHPCqvErc6zcjpycsdcc/SzhcCoZyDXkaq2OkbzdqUMmQkEje2cquYYeekYaOmfAXSYGVKKV
	UsIPT2NX6VJ8H/8T0mg/5VDrcTSaNVwbY2ESXGHSd22+Svja3EYkRgEeqzSMtrRKoOt
X-Google-Smtp-Source: AGHT+IGnK2D1/Q0dcHvB9CPsk9bcNOmM00HmnXsGNdNKo5Ba0JyUGt8RvEyRnDgBCwtUo/ZzKEa1BQ==
X-Received: by 2002:a05:6000:4913:b0:385:f1f2:13ee with SMTP id ffacd0b85a97d-38a223f71bamr52024607f8f.46.1736278123020;
        Tue, 07 Jan 2025 11:28:43 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:42 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 11/11] Input: xpad - add unofficial Xbox 360 wireless receiver clone
Date: Tue,  7 Jan 2025 20:28:30 +0100
Message-ID: <20250107192830.414709-12-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nilton Perim Neto <niltonperimneto@gmail.com>

Although it mimics the Microsoft's VendorID, it is in fact a clone.
Taking into account that the original Microsoft Receiver is not being
manufactured anymore, this drive can solve dpad issues encontered by
those who still use the original 360 Wireless controller
but are using a receiver clone.

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 647c788ec5d1..b0780dfc558b 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -151,6 +151,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x028e, "Microsoft X-Box 360 pad", 0, XTYPE_XBOX360 },
 	{ 0x045e, 0x028f, "Microsoft X-Box 360 pad v2", 0, XTYPE_XBOX360 },
 	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x02a9, "Xbox 360 Wireless Receiver (Unofficial)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
 	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
-- 
2.43.0


