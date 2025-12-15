Return-Path: <linux-input+bounces-16568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77442CBD35A
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 367493032AB9
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 09:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0860C314D2C;
	Mon, 15 Dec 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy8jFwWd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD9329E6F
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791516; cv=none; b=k8pdr0iognfQZUcrs8sW7/vKvcBl87qK4dD5aC2YZmN0dosLVqz8krvroRkF8NbnDTNP8Wxd7utGUVgyjku3gJVDpTD2+tgDFnLxv2qLbR3jMqPjHmJBVHHcjPutTa9Gn1Moh9M6do/9tuE+8iDpXhqbwzNtf9fBUuU9gZOOdSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791516; c=relaxed/simple;
	bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXykZr2iM/VPzcg/CI2yJhNbLHsZ2Llu9jcQhUJr8t0yazdyX+WJckxnDbtOJazIEmTO6BvyA4cjgMJAzy6/f4eaP1mTIFcA9i83BLGMMYotHB75QCVbfGGB+uBdgFfuqMPvHmiNJEzq1U+P1eRVGGR1RsbGM/F0SQRAsH19xEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy8jFwWd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2984dfae0acso68236675ad.0
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791514; x=1766396314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=Gy8jFwWdyq01jOa0Q0ynLuujy0EuGZlIlHRAIGA4IjNavpV6M4Z2HxeRwZP48HyrHN
         PGKQoXOpAPpyCUFpawZTnsxSSgi4VZ3AC710mJUNN+yA1Jtb8hJ1YSrEipnT467pYBqb
         dqI4HgWloWGOD8fPxlt4RtJx0jrWvBvx0itxg4ysmbFEXtRm8zHPNNxB3dRyCM3Xfswu
         ZCdY2fALE8oxTPzoUjKBfDBUd848jRK1YaCpoJfrnQeZn5xsbuhQH7ILUBIHMcomwf8V
         QWrIVSX4CVoxQesKL6rwuMAND9oAbgakExzi0mM5Zdq3TEQco2ZJIrV9wyazqBd5F0qL
         o+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791514; x=1766396314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=w+lqFSXQiYdel0i9Yf80lygTvepcC3fRg9rEnXfuyvmpCkYkVYTg7maoac/BaTyyF1
         MYVOsUJc+P+F4Ab2O1PxBRXyqnkHjPVvGrmTe2mpY2xcueTLGYmM6NT+vtipddz9uRFI
         MzDa6++x0aYoDF2DGd9WP1BwubsfA1RFQbfg8Ury1aiyfNSY8EO/hmfU06mprGtyIxFB
         uRsROqGSC20efNF6Z9lBCwEXxBJ2ngAbqEtCw23ZQwMY/MmN6WbfzMianEpenrfAVvMa
         rqi4yLO+8N5pNIp5GkvjngKBRT24W29PWs6IO01jEAWnsB2TXiyNRloJI9P01mva5aE3
         EMtA==
X-Forwarded-Encrypted: i=1; AJvYcCXHdBNIZ0hYbLnqyxbn/J3MbqQloL138mMGBAOhwPck49Ru4ckP/ylBwJ1oN6rJJ2Py/5RNuBh8v1+LUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz847kPOfEv24Kk4vuibWUQkn0PQ0xS7lI78S6ZNxEDgUdEPjxn
	ITYRGpk30SMGQnYr4kW4wmigkfD3lRaxqLdhsdxWbPkONBw6oSQnBMXJ
X-Gm-Gg: AY/fxX6JEMD+OZIGuqx0aqDrlpzQyn8McU3as6c4a09twyBiWnQaR40ziV8UOBnUwdN
	fpR4tBpm0N4rFSs+xlaPXeW6A7yHkZPXlNTQ1cpNgclQ3hBcKD5dUaOhbiVvA2zpVyTsUjA+yIz
	rDNF04dlNLLmdw/f5lNBDY+x+jiIoIfbtN3kws4xBKSJkEAqJkZDD2v2kEEjLDlJ0nyHAC+W5I4
	79Xa0HXF9ZOr9D+Pq6vQtWdsc6R/bflBjQagUg9lI0gu+55wD405Lj1XPAEotKurUf71jRZJjCR
	1OdhUX81msNhYwxJKbsogQqS2w9iIDZnLEEZtem6Mqvp2b3jmSS7ZrHAYXWp1g6FaXykmiDikQ2
	mqFLOo2bZ7yE7p6HUVvIxRonEsxwZf5wFjMnF7Y+yZqgqhY3p79hyq3xJYabLiLExPG6w6O6kxx
	1/RmyShDwDPHqc22M3M7Iza9LXGEGmo35d5QSdAsBh89CSJKJyhAGyCqaYkhw9R2TlBqj3QDghV
	1aZ1htoqTVRaeBA/JSVrDuP0gUWOXpqPGVmlormYcDZZOMBVAxd0ZspzOQK/JbdBn/nZgVtcVUu
	OCwG3XtWtez0ardvksK4OfuHOh6FPPkpEKRfoVEA2Ex/530ySwY=
X-Google-Smtp-Source: AGHT+IHCWcOyM5Z8EFFrTYBLBI/0yDbLna48TS9+7DgDOr+UeDJqde5BU1SxSQK1fSOkyBfxFjFufQ==
X-Received: by 2002:a17:902:c40f:b0:298:6a9b:238b with SMTP id d9443c01a7336-29f23d12fd6mr91903265ad.51.1765791514107;
        Mon, 15 Dec 2025 01:38:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:33 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:46 +1000
Subject: [PATCH v6 2/7] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-2-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215nvvLy0yve6ff3amrhrC/MEs/XVOlOearId3L73z
 ZXPa/xqOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFMtVcHIcO7jXJNT6ydzK7gs3uBz8fN7s5dxvHcn5/gV9zZPuPmj+Q0jw5UGyV0
 R228vqDuoltO+7rvPRi+Wc5+OZAcpMMaal/3s5AEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5..9099a7a22f1f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.52.0


