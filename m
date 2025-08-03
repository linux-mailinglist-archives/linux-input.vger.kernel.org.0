Return-Path: <linux-input+bounces-13784-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC42B194C5
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77FCE1893D09
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B5619D8A3;
	Sun,  3 Aug 2025 18:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9v3c5Ox"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06391D5CEA
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244852; cv=none; b=auqMaHRXK47jedetjKkgRCKgUwx3vxnk5LdO1/tq4lhqYm7JuXuw9a1v/jIbadogJm6w21fe+aie9DEpzJoIisiapg+6WOS4Tuc7ovGvBWXizCr4SsjUvV7KFqQF1P2QnJ/KUaxruFpm/D0ckeyQ3sjvs5Vas8HGqLsDJoK9ao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244852; c=relaxed/simple;
	bh=rU9k2cbLvaGzMK4eLVj8A4SzzERpSzfUoqQRBKijbAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TN4+++FDNmgzUVNeRDNnamxHlB4PtT3BFzvup6/bFCXtMfE+pVt2EyRimd6xmkQB8poNzo3qST1+YqoZ/LizqW8FGvrxfjttQSe2rMsjEcWw6ITyRq8sEGXELgs36VioGqqu0SkkchlPhzC5D0doFaGnTTXbjdjYonCR2RH2kd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9v3c5Ox; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6155fbff3caso569746a12.3
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244849; x=1754849649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2Vyrn/KvMDB1g9QfNbk/GaamvRlEBmKpmknXqNvjEc=;
        b=j9v3c5OxgE3atbOe9Pgd3bd1daW56l87LAlaDK1hcvwPunXHodlj9fsToW4aShodic
         NIKbjAIEou6L9Fu+XV+oiBZ/hGURFPjONvucLsWNJZl/w1+Our6ywN91+oHYpuxfD2by
         2g6oOoNvAAoeiO+0jmAG5NuBKSVZRAWTsuOf3ruCr82OVnGOM1qgQBhO4zTRAnwZK5eJ
         nGfAqpUgVT2CzcyB8DUzMXRQ3otCP+6Zwob31XzfDdvUaVJU878X1CCJK/crj6NAFySi
         /ZBuB22OjtMIEVNVdRNfufQ4pp+ErsaRBuu2mojr+ngY9QAZSunzkVqucwiBuSBDg6JF
         t+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244849; x=1754849649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2Vyrn/KvMDB1g9QfNbk/GaamvRlEBmKpmknXqNvjEc=;
        b=lWBGm4B+x6TAS2S3kDnY0UnZrtvejlW/j2Nv9Qjenlyp9XtwPKv3zBquKEqfJ6XV1S
         kinocXdAv+wffRFvhgFfgV7i8o0PHs6VzYRAav3925nKYJdnq2dgfvLwieucV0ZHzCOa
         /jUl9SnbMOM10N6vTsXf6eZqJryqcYpYRem5xb4JmQ3r78i0x3QRbgkQCNll0iIqPlyh
         DtkEfpzEsg6gvariFx5PMvL9lfCY7UUrA2me+4nrUbhE2c9s04iAcG1RmeDDBPtCwReO
         3JcazZs4XNPHK5fGMxrwetdkk71siBWddpa0BxRmBZwpumyFy95Isc131cUM9K2hyot+
         3eDg==
X-Forwarded-Encrypted: i=1; AJvYcCVFvKlodjZ8P68rVlTPekt3TH57IBPVJFhbc2h43cyobArGEADeLdiPOyaeANp7uQJrEroupCviiGOiDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZwUGF2v9wiobrSbH8hStVZEflYsjIBy03e7989rkmWS/IU+R
	cnboSlv2IRe8o0XlZlqC5DYbA50AZ2I2hKHQRTB52xLKGwYQrrBAodTK
X-Gm-Gg: ASbGncuWm+CS+kxmfPMIbelg6aSOxqRvg25/tteCsQoGBGBbDyod+TTyeGPjyW17RrF
	e1tikdYseU5XKq/D3F2TZLsKe8xDAWXHjmhCHLUzQ/ghuACrBkpLGkMoore6k1OH6fRntEO8hRy
	KD1H5qB+5e+MZ5E54Xo2niljkU2zORjkCqz6JBPKtZHw5ZtW7u6buw+r398i79+Kk0T6L3gB4Y/
	OYp6HbwNO9b+G5XJPL7ppsL3QPq3OM6rle52eKDzZ+QsRUZnLgMWMqWiXjmaqo5DSS7xYS6M+2O
	r6FWfHPfqtEcvq3CzWLuNkOCka+bvBfc1H9u4+abQXA2tiOyf1g+Qp19nzJI3Qh3hxWxqASOczJ
	NKTPLNpHH6aCygbq4ArKyKpY07bBKbRtjjr1YVvfYY5dTFojQJvsVSCxU7DybN/PaCleFPbLvs7
	U=
X-Google-Smtp-Source: AGHT+IFGnphuMAv+nllE4HmM9R1yhHrzcBPWW7L27EQ++t/4kL/X8PLjpelyaJQRIwuFHjpscWOSfw==
X-Received: by 2002:a17:907:9691:b0:af9:3116:e10d with SMTP id a640c23a62f3a-af9402225c4mr310749066b.11.1754244849038;
        Sun, 03 Aug 2025 11:14:09 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:08 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 14/17] HID: pidff: Define all cardinal directions
Date: Sun,  3 Aug 2025 20:13:51 +0200
Message-ID: <20250803181354.60034-15-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Will be used by ff-effect based autocentering

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index ebebac5c4384..7f4c1186a44d 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -148,8 +148,12 @@ static const u8 pidff_block_load_status[] = { 0x8c, 0x8d, 0x8e };
 #define PID_EFFECT_STOP		1
 static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 
-/* Polar direction 90 degrees (East) */
-#define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
+#define PID_DIRECTION_NORTH	0x0000
+#define PID_DIRECTION_EAST	0x4000
+#define PID_DIRECTION_SOUTH	0x8000
+#define PID_DIRECTION_WEST	0xc000
+
+#define PIDFF_FIXED_WHEEL_DIRECTION	PID_DIRECTION_EAST
 
 /* AXES_ENABLE and DIRECTION axes */
 enum pid_axes {
-- 
2.50.1


