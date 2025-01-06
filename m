Return-Path: <linux-input+bounces-8983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C55CA032F8
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A0FA1626AA
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4521CEAD3;
	Mon,  6 Jan 2025 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxC7Bw1C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F4C1DFD96
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204106; cv=none; b=X1rxRzYGWLjqmeWLkvT26rFVGCviaKxBDybXhAPqhyfg66sjd1vgJyIl8/IE2pFjHR19eiCDMI+3ovXbYzJgTqcv+rZsAf0WEiPlUiAk2/IyjJ0AGYaPZ9GmxkZmvbXeTds1FpCrreKhT+e4begQ3hRE4XfcRKE1dmywDGLUhz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204106; c=relaxed/simple;
	bh=CRZoYS5SVEiEl5TohnNzSsQFQ4XMr8JkxTi4Ivw7Mmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wmtk8ZPuYviWxKszjz7Fi7PnI690vQo/m4KuKX1uiaAeyPfbEFcn2BonwKClU/iPlRfahrqya7xZZikzov1Qr+MPQyZtXLx+jKuGFxbmBqE8dEKtSBcy3/ZsjQF2Z9kU4acSZ5AYrpGhprUsZp69e+89BMv3E0RFqIjxc2IVKOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxC7Bw1C; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38a34e8410bso4935149f8f.2
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204104; x=1736808904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UXmPax1YzmPLVEHa8OA9ymjXXu7OOQuDyzgJIPA1eg=;
        b=HxC7Bw1C4THtMybyrzKHwv6uyDAboMwxSEn4mU2mVeQPGwJuXYEzpuBMVKrZV3BrHH
         KnTdqJbnR61IEXYGMyyMhIbJquDGeq89gbuppgt7+sLifAGazBjt3mVwN2srLEj0i94K
         gJsAKfQlgqDpW1yr2//lwcLhsIXTV5yETbopdaReznrIipnhIFre3Zp3ojj6Xs79aE49
         HP0y4YhRZ67+Dxm78iGoqNahL76VvPxLuWx2jwnfVWD6sWniyUuDOWH4RKaeNSJkiLpG
         5etxcBaYyqVsJGYxCoMjsuDGCw+4GZllb+qyOiWmEDO2d71eMJrsni4ESM3H3Y1sMVZJ
         Isbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204104; x=1736808904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UXmPax1YzmPLVEHa8OA9ymjXXu7OOQuDyzgJIPA1eg=;
        b=gTelGh4xvE66Rcb6uBDXI5JRA50zw5XnKDeLh437ERaxb3HLvPFKSzxh6VzvfnjsJ8
         NTFaBih1/K2gPtNmywwk2aOtlUI1eCa2hygc38Hy4d3nB/g5xaF8gfJqB/vi16xjdtoO
         UwiowqUJCuy0vsS83xZKJixLv0zWQswbA3xyQzxgR98os/gqEW6vKDHADoPMZ6gg7D/p
         vPsSLHcSisdjc7yuAdnidWOqxxexLsKZ3ffm0f5OJc9xaC+ikl8LYM+mqo7rdhLxUcyv
         cctU69Of6atZckIcX67GmZrpeyq41+aCZGIheJWPFN+QGhz1gqBPPiXSw9KBfHppzwOG
         wyiA==
X-Gm-Message-State: AOJu0YzPMmbLVtm5JwlUeHomQGOZdMl133E9kyYINXSkcgwsoa16PDgv
	8euG4077+sgPLKoz4aZM1BPWrSx3FUxq5NQcote3M5miqYwGRnq1umW59L0NAJ0ibg==
X-Gm-Gg: ASbGnctVVvcdHALEghQ1UYCZdiEFpS6izLG+3ra2/TvTzZ7+bgAWRwC9TX9Vmn2WZxZ
	e/mvIkW0nkuCDh+pyd5oqyFfXy/FyQsJ56Ko4flFBpnK5FUKA1g726VfYgNnLfChmz0sguIKYs2
	rOfkvYuIoR7C15mDVU/yMevH/YLwV8J2EEFi9LoUeZuzvCgGwN9/n3QpOvHXSh5E6rdnFNMl/qH
	3dtuHEygRp12o0urR+WI1/2WEEvI7Qj7yGwUYEVqQDs/FQCMZZ3rqZPiA4klWRfmIGo
X-Google-Smtp-Source: AGHT+IGYD5tlMNn98dZv9JHmN1j3/16u1dYaevXZ7yGWmvBz1xZB+cY2rLd7Yfsg5iJO5oPIvUxH0Q==
X-Received: by 2002:a05:6000:402b:b0:385:e8aa:2a4e with SMTP id ffacd0b85a97d-38a22200858mr49315529f8f.31.1736204103638;
        Mon, 06 Jan 2025 14:55:03 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:55:03 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 10/10] Input: xpad - added unofficial Xbox 360 wireless receiver clone
Date: Mon,  6 Jan 2025 23:54:37 +0100
Message-ID: <20250106225437.211312-11-rojtberg@gmail.com>
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

From: Nilton Perim Neto <niltonperimneto@gmail.com>

I've added the DeviceID of a very popular Xbox 360 Wireless Receiver.

Although it mimics the Microsoft's VendorID, it is in fact a clone. Taking into account that the original Microsoft Receiver is not being manufactured anymore, this drive can solve dpad issues encontered by those who still use the original 360 Wireless controller but are using a receiver clone.

Signed-off-by: Nilton Perim Neto niltonperimneto@gmail.com
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 647c788ec5d1..ab4cf8201c58 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -151,6 +151,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x028e, "Microsoft X-Box 360 pad", 0, XTYPE_XBOX360 },
 	{ 0x045e, 0x028f, "Microsoft X-Box 360 pad v2", 0, XTYPE_XBOX360 },
 	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x02a9, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W }, 	/* unofficial */
 	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
-- 
2.43.0


