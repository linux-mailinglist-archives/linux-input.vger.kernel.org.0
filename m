Return-Path: <linux-input+bounces-8915-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5420A01B9D
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A023A3058
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178F119DF5B;
	Sun,  5 Jan 2025 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWoCwgsP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23B1CDA15
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105894; cv=none; b=JmZ6eI7aAWPPdPGEtgkPWY8QAuZsN0n6FEMWpVV6yGFXGoJrK+UdLV8Mm+oLtinAf4jVfHpUPQwnwSY1UyPDjHg3FH2QbbcBcmwYzIGUnbYy4Qg8IDy4todHl5c0eNE4hwJJd2H3Up0mALUI3k3R0ck5gNCmm5svgqXXZgp+SuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105894; c=relaxed/simple;
	bh=1Ese8EMl34HOd+M629dtCkoZAKm9OfX8Wib/r97aCZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h746EhYVWGC4kD00guscBFU9Og9qC3ye8sJG1JTjsHgchS+AxRd//9qs61epFMePU8wu63Em6TJwhYpfMjmeI2Ip1csDs8vTlONOS1Tw/61c36+VaUtz/qwhbQ92OBLgGILcAexvrauSwmVpb4HyOhVmnWXEmxXLI+DKcFKjNGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWoCwgsP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so156615735e9.0
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105891; x=1736710691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iNoALGEjdQHmdTVB6T0aNRr90vJ37917pkhjH+wEmk=;
        b=FWoCwgsPTadTgBQT/PRZKNG6shImNVlQ4H1S4RCoe+f74zYc5iWc24i94giOQtKCNz
         ySHAlvTXFntrXUYLVFp9U3Lp0Um00NrlWY/2B7nPkxj4Li6TNIrolguWhX5Y+o3HyxwU
         UXg94mS/dk+q4sBmKODz6iJOJ6t7i8dEhogtVs3s2oMsoY4md3K631ukC0yidLyWkW36
         2gk0447iCaXpB6HGVoxmLj85URdhJFsf9eideFtnfzdKhbpham63F/fRyClQDCvJF2Ow
         egh8DYIoilIlBt68Avxfe1Njsr5rUH5tHpPHROyU7BzaQqKWKZ620hYWBns9tB8m12cS
         LZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105891; x=1736710691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iNoALGEjdQHmdTVB6T0aNRr90vJ37917pkhjH+wEmk=;
        b=dmQeS8Q5pFm/T4ijaTStvYk/EknRDkidwvLlpJx5DrA93UyfBHN64RKYi19A+fzoIh
         0ppHw7RUFOJ0mbR9H1gIPZYXdXBiy2Wn/r3C3LbODUQuXFc+4Ys/60pasfDtWzETmYhM
         9GOgpJlDDOAOj93SvIKdv7Nfe6i1mLYGrF0+ZtjHrx/vS7o2Os7/P6NzxhItTVdZyAR3
         oIwMUf53ST3aiEwPDMpxOeZ7Q0YkYnhQOmPHzNi6NospMJnLOgBwq1xngLKxdhiQM7Go
         rEJG26pS/TNsOakaMXU/jlEUD8YAHv2wmq/fSS7YJ0j5HYfiXkzL6KJ3cZp6ecktBKkf
         8u8g==
X-Gm-Message-State: AOJu0YzFE4EzGz2jYWPD7M6h1qhgJ2nK/a91Ba4c0KLP8Qiyx/VdqJye
	NRV3ouvxf6lxNQbFhnAJy8RZ4mcfvZPkFwoE7AadAWn0PvDLZlkm/WJRIJrUdkwF/g==
X-Gm-Gg: ASbGnctK88kAEflS1oz/zBtOIl1DRNX6zQ97p7jJveBudpP7RhbDCHurHcqFudtKUz1
	DKXgoyMg5Lqq//gs44gekhO+4Qb+jpuAq5WqB68EDZ62gv935N1mEJn2NYFAfGj9w7hByfXMYNG
	YgB25prebZesRXpym81NewInlxi/j2yfmULOgThKQdFWfOjVI+CTYr9jJZjKP9gKV3UlzVy+wzc
	Eb7HOig9DssfYSRo8EGeglFqNw5E8MIY3tMCPhFZvqsKQb+GmG6hVx90WzN18vZlMuA
X-Google-Smtp-Source: AGHT+IEkh8+1kLvIXo8g6BhlvGoqEFLFbZb8RyaKtxrv1R+c84wpTGjdhfC/7Gfy3GnU1LH4Q9HQnA==
X-Received: by 2002:a05:6000:2af:b0:386:3752:b28c with SMTP id ffacd0b85a97d-38a223f5c3bmr40497094f8f.41.1736105890696;
        Sun, 05 Jan 2025 11:38:10 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:10 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Thijs Reus <thijs.reus@trimplement.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 10/13] Input: xpad - added Turtle Beach Recon support
Date: Sun,  5 Jan 2025 20:37:47 +0100
Message-ID: <20250105193750.91460-11-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105193750.91460-1-rojtberg@gmail.com>
References: <20250105193750.91460-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thijs Reus <thijs.reus@trimplement.com>

from the diff from https://www.spinics.net/lists/linux-input/msg75512.html

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 1cd946b26451..237704b3fab5 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -176,6 +176,7 @@ static const struct xpad_device {
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0201, "Saitek Adrenalin", 0, XTYPE_XBOX },
 	{ 0x06a3, 0xf51a, "Saitek P3600", 0, XTYPE_XBOX360 },
+	{ 0x0738, 0x4503, "Mad Catz Racing Wheel", 0, XTYPE_XBOXONE },
 	{ 0x0738, 0x4506, "Mad Catz 4506 Wireless Controller", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4516, "Mad Catz Control Pad", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4520, "Mad Catz Control Pad Pro", 0, XTYPE_XBOX },
@@ -283,6 +284,7 @@ static const struct xpad_device {
 	{ 0x102c, 0xff0c, "Joytech Wireless Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
+	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
 	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
@@ -366,6 +368,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
+	{ 0x24c6, 0x581a, "ThrustMaster XB1 Classic Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
-- 
2.43.0


