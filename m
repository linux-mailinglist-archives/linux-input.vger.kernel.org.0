Return-Path: <linux-input+bounces-13414-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A66AFC184
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 05:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 010177AD918
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 03:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBF11EB36;
	Tue,  8 Jul 2025 03:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZcIZAw9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299A1101FF
	for <linux-input@vger.kernel.org>; Tue,  8 Jul 2025 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751945597; cv=none; b=m4jT/ztRfGBuSP2JsguZaIYO5pZxlXSXF2GGN+V8LsgHPzStM/j68XXu0DOtUmX3TWgsbBb/YgqvH3+UdpYl01sSp4GavmX5CCgBr/H/ZeKBazzRTM5asSPgvD4jnxlq9+r1jo2q5WC2OHMmpwNi/kjpihO2s2ul4KSjd/LidKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751945597; c=relaxed/simple;
	bh=C9HHjrwKIAnlPkxrqZ5s8ltcCWIZJ8103B9zGlUMF0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bd62Thj/iJI/P/qdhBBOsramR1fwE6l1P4bhDY6cpwGZyxDznQiw6H9EhBSVTvcrv5FIxrFLZ9nqdUa/wGGUyvRb15SNZ+Q/RxObUOW90+xHFsH6MHktj6cf9CK0nZtK1V1AVskK7JhrtTJ+7QYMM5fofDcaw7L2Qv+N+zS3q1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZcIZAw9; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fb57fe217fso10993616d6.1
        for <linux-input@vger.kernel.org>; Mon, 07 Jul 2025 20:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751945595; x=1752550395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifey4pC1L+D7DXGkQJgJNH//81ncYowkKMJCVz45IfE=;
        b=QZcIZAw9Cfh4ENS8vHfWrKcwoarpluX12o6vjbX6aEbuAGueHfSGbGbae4rXqVzQVp
         oVR1vx0TajUwesXDJsykmP2Kp1e8ry8WPTEM5heJVvYHS9Rxwk99u1Fx/kbVZO61hjr+
         nvx+v1uH+4OCTBq2BRffT5NFhemYEb/jNT5+5n56jkW8oYMmJ621nLknbbiWG6BFJCnM
         qH6uBb1HmsyM3JvgdgDyM8NOZqU1KUWC2Ajrxm45nh6O5WxrBosKgkNTkR7lM71tHrJV
         JnaMGYpOcyVt/MK87qY5Swa6lNin6qVxArrENqYgs2T8fXKZOoAVdrY/BOk/XQJoSNiB
         Tc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751945595; x=1752550395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifey4pC1L+D7DXGkQJgJNH//81ncYowkKMJCVz45IfE=;
        b=XqBwijirFkbZZPLpzmJQeuzPeL7P9IIdIKDAtRoyK7hYYYRdV8g7DbEvNSq2z2vDrO
         p+1jeu4u4QmCbFWpI17xJxNhf4rU2lWq1T3gIEvcXwrJ+0xxmnR9XIngKM426/72ElFA
         UXSZaNSCPA/6rGtTF/vuWdgIDftVz+D3M0aniLzp4UdNJV5PZfKJq9OGMjRQN7OAoqdd
         kAdjhWCW+Dn8ah5URuYekomKa1r0z1ZRGvq40XdsJIbNZp7RgFQyklC+DgJEQrFgtAzA
         1d1KwiTWHHe4MFcvP2UW49aXobbf+YFbZQwlsNZCjzvfoNgy+sL9J7Q3zZ5LL3W8AT2g
         oxng==
X-Forwarded-Encrypted: i=1; AJvYcCWa8ZNpeV1aLJqh6BpZM57m8zAyUxYe4ewemMvdDnUTQuJblvTr/j42dGMS+G52lm594IN+CK8kxDACfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGAq28fmtrTF1IlKFacQZnHA37/8vERYwP/LpOcJfve7TsS9E
	0w2V6IkWzKcO/cuZAwXqeKLQGQJM7hHtjDA/IMtypSRF0thHBOUSzQ4J
X-Gm-Gg: ASbGncsw0rd6ipklmquf23c5Nee4v9ul5alvUcvZ5dORJrKRDXyQyfppQ/yQAdRDqT0
	oAs67PpFGSd28I7J9wWCYHxtXwRgG1qd1nBmZv20lNKXnMThfxCihXk43XM95iVC/J3UudesUGw
	r5cEcLnWis7WxM0js714DDQ2wdw3/7liIGSaRhlx3T0MQVjItNLqcnYloeYr/Hg045MSEtlbKG0
	xYFsNUOvuLq72d8aUcdWgIdYa11C0H3CMenfeFAFExAmr8q1kVsUwEyOrHbsTiYkjc53YuSnv//
	lDERihm9DrZWolp5DtSuUgOitEYw8l3p1ZIkfv0SoRpITl5lk7WqQRL9GzJwOqA=
X-Google-Smtp-Source: AGHT+IHxd+NOOAm7ImlgleVmBu0/uSxafnzJd417VGSHfkg6S25ELH6jx3RjIXm85zg6qfgs2AWlLA==
X-Received: by 2002:a05:620a:2606:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7d5ddc9c00fmr625787585a.12.1751945594985;
        Mon, 07 Jul 2025 20:33:14 -0700 (PDT)
Received: from PERIM ([2804:3d90:ffcd:c190:6461:404f:bff3:13])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm704693585a.59.2025.07.07.20.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 20:33:14 -0700 (PDT)
From: Nilton Perim Neto <niltonperimneto@gmail.com>
To: vi@endrift.com
Cc: dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org,
	linux-input@vger.kernel.org,
	niltonperimneto@gmail.com
Subject: [PATCH] Changed Acer NGR200 to XTYPE_XBOX360 fixed the table because
Date: Tue,  8 Jul 2025 00:31:27 -0300
Message-ID: <20250708033126.26216-2-niltonperimneto@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <92a568ca-e08f-423a-9de0-3f5b2946e721@endrift.com>
References: <92a568ca-e08f-423a-9de0-3f5b2946e721@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You're correct Vicki
I wrote the wrong xtype in the device tree,
But now it is fine.

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7746530da030..bad4c3608775 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -177,6 +177,7 @@ static const struct xpad_device {
 	{ 0x05fd, 0x107a, "InterAct 'PowerPad Pro' X-Box pad (Germany)", 0, XTYPE_XBOX },
 	{ 0x05fe, 0x3030, "Chic Controller", 0, XTYPE_XBOX },
 	{ 0x05fe, 0x3031, "Chic Controller", 0, XTYPE_XBOX },
+	{ 0x0502, 0x1305, "Acer NGR200", 0, XTYPE_XBOX360 },
 	{ 0x062a, 0x0020, "Logic3 Xbox GamePad", 0, XTYPE_XBOX },
 	{ 0x062a, 0x0033, "Competition Pro Steering Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
-- 
2.50.0


