Return-Path: <linux-input+bounces-8717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B352A9FA2C8
	for <lists+linux-input@lfdr.de>; Sat, 21 Dec 2024 23:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1831188C453
	for <lists+linux-input@lfdr.de>; Sat, 21 Dec 2024 22:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F501D54E9;
	Sat, 21 Dec 2024 22:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLsbvoQu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18602189BBB
	for <linux-input@vger.kernel.org>; Sat, 21 Dec 2024 22:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734821000; cv=none; b=ppomZDLmtEvUKOpJS+2Jina0zU7JV5FCHySXK691yZrjN+ngc7GS7vTsr99Yi1gxjt45tBDTGI57niZDiSF/bh14TUcFKpRgB17z8dktDyGIqRt/oWuPeR4djyP4m8HF/cC5P/xCm3Z15etykoSTSwfcakPdK7nHxHGiGm+LETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734821000; c=relaxed/simple;
	bh=rK44EJL5EK/yv+vauLNf6ALOlQz3TvMmgqqH4qmLrFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVsKSiu79c+rmWZMrEixlKn+VEWvpyni2gt0ERMVkauj8GtL96RiGRNjxp64btOhswTy536kbR1Xw5R0v890KVX1cNRHexCCSsxviMHCLiPgLmaK/bm115Pp/v7XtCF2RNWpNHR5lDS3jLuGTSOsOc34BJm8TFBdwNL0NbSKdI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLsbvoQu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so406315a91.3
        for <linux-input@vger.kernel.org>; Sat, 21 Dec 2024 14:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734820998; x=1735425798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiMkI9VZG78hAfcOh5qzLaV+4RD9ESBQc8+/2lIis6w=;
        b=fLsbvoQun4EsFedzIewx/SfcvX2Lji+MLmJwBJRqNLSGVZ3G+G3BhbHp98xth8M6A+
         b6qaZrpE0bo5QbXj9oR3sxpoghXiWkpFYILEXf7+HQ3pUX/Tz5K+5tRQ61Gdx8Un5HPW
         Xomgn9u99f0mmscArK/4hyja8ezT9VDspsAeVcV7BLhULncw8WiuAm7+W71ESb2gTx3T
         V4fHDhGsC8vegiikjuBgrsq2Ktq86efrVAg6xeFNMwT7ZofKzYXIhf+0e50JTT9rWWzO
         rJYMVA2ARTRbzk5CaV+ulf8YBQtAZDCKIxja0VzPfhokasMXWTH19XIooYo0WxhbTr29
         h7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734820998; x=1735425798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiMkI9VZG78hAfcOh5qzLaV+4RD9ESBQc8+/2lIis6w=;
        b=CjjNq+vdOSY19qn7WXYEgEvMuTB8Jf+/LEvKHK5VyMWsM//RcAtNWXqlfglMEAGz1t
         6LmA/3GC2n/GCc+Y7mlPWGLuzfzCvNXIV6vmx+AxxrV9nkVPfVbXS1o0IZCnHllud3AP
         rZu4wb+KuHZW7WQTKsumdURezWGBi/sbj42iw9W30DCylVFXBJSPsuyKYYk5gcpj7q2G
         iB75lbkdN+yfQMlHgOIDxnt7mK5eyYXvn0jWVM0CddjY1vo0OxfIzhWWARwoAdocAjet
         wwlOgPn53tcTNr6MNjPa7WElRiL5DQ0PjW2AMLckBlFcTubagWtJNs2ZfzMLpIL5IpFi
         KJmA==
X-Gm-Message-State: AOJu0Yzy45We4bCCWDOeO2RQcMXjgR9jFfCO2+MtXXHyg5EjttyqfsKN
	/L/nQaKvgaJzWJKgwit3shq+eqJijzPMxB4aQpER76FMgONPDdD2N+i7gNvNgck=
X-Gm-Gg: ASbGncvFXbOCFqIlwJBBADoDyfPusP0lYiUzoLElvN5DOMHYgf3ofrX+zqO1BZpzNtj
	uVPOkdm3oh+ew6v0mibdZlSqL+EBaSl8lF++hARMgJlaimlC9Cu2EZwfBK61V1dvmAWat7YezIY
	DtkRL1HIGOw2ImAekYDHv8GgAeEarRrujIAwdx3drAvXi66AJX5LJYVd2PQaHs0gigZV/GaF+iQ
	0q9V1y/6Bh0FSoaWxgHy8l76RM8SoFqw6UGMRoAyl+Bt9Jej+hzwYMxlQ/MhJ2C1N/jOyufMV+G
	EbYdf1SIqcRMO3E=
X-Google-Smtp-Source: AGHT+IGovVcoJP5JWV1oL5/7l7kTjvXxNt7NLEU7bZTNfeHk2X+yW0cgSXfSkHIWf36L6A6j2Zv4Bg==
X-Received: by 2002:a17:90b:3bcb:b0:2ee:6db1:21dc with SMTP id 98e67ed59e1d1-2f452de8c1bmr4729053a91.1.1734820997997;
        Sat, 21 Dec 2024 14:43:17 -0800 (PST)
Received: from localhost.localdomain ([189.5.175.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62e385sm7458923a91.22.2024.12.21.14.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:43:17 -0800 (PST)
From: niltonperimneto@gmail.com
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>
Subject: [PATCH] Input: xpad - added unofficial Xbox 360 wireless receiver clone.
Date: Sat, 21 Dec 2024 19:41:56 -0300
Message-ID: <20241221224304.29031-1-niltonperimneto@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nilton Perim Neto <niltonperimneto@gmail.com>

I've added the DeviceID of a very popular Xbox 360 Wireless Receiver

Although it mimics the Microsoft's VendorID, it is in fact a clone. Taking into account that the original Microsoft Receiver is not being manufactured anymore, this drive can solve dpad issues encontered by those who still use the original 360 Wireless controller but are using a receiver clone.

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ff9bc87f2f70..fcc5600fe542 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -155,6 +155,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x02a9, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W }, 	/* unofficial */
 	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
 	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", MAP_PROFILE_BUTTON, XTYPE_XBOXONE },
 	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
-- 
2.47.1


