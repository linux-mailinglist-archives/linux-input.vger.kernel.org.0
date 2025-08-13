Return-Path: <linux-input+bounces-13982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC4B25462
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CACF59A5FA4
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F072FD7AB;
	Wed, 13 Aug 2025 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGMsRyXu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CC62FD7CB
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115813; cv=none; b=onu6IVhClYRuxb2blFt4H94pZLfZVT85qdAYvc3UXW9NKCb7hQ0HaM/5ks5QK+tK4nmylSYtwiuJ4uyRL4532sBLHTtY10RuE5pmQ+84JNWR0kp+gpCzavvySAeIJuCGrqMetULs1Y3nWH+zYX3lg5xrfD97CSZ1vX+tnR9vtZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115813; c=relaxed/simple;
	bh=jH0Z6t9ZYwhbNAIJgYIoERd0od8FUXhwYrC2uuJIAWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OYqtV57ptETXugPEdyhbgEWdn189Pt2/Jt63wz3LbSCJhJNLFLTZ0GE3loA/5nHkUMwxdmAgdzHQG4ilfnfUbBPVpTE/0CqTkcsUWJqJl/bM9K/i5hvWFN87YAHSa/9D1ULcpcYRkZz1PTYDpbfoyXSA2qDVHaES66JyS7nEBAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGMsRyXu; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb736dc8cso3523566b.0
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115809; x=1755720609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JR421k4N/Se6xvjWYnB7MxBNfyK6tBYMQ/WsUDTfwCM=;
        b=WGMsRyXuCQyK3bBz7OZDqffkvIk/Abe/GceqiCPiBwSyXWvq7ZJ60D79bLBTRcQvRU
         FbHHUcMK5ogqw0wbGtjZ15hDyHPdhO7A54zWW9Mvyt2rWYdhjkDWs1BYWIpXUcO15hNL
         VnLs/7mloxNxPmUN5NpV/eueEaU1RLA9XON9h3lE5DOfCkZwGxVr4jdKKmHgvEMPaa5N
         Dpnl0U8WDlUmgMWZIF6ALRn1BqTOl0m/2NJWQ75OGgxhpFKF9FWKgi+KaFZM5r8W+d3x
         vaaUQECdNttZ3JYSU8E16hjzqCLrDv7hrLnPYwT5sQwravjT3UMXquQ+f4Ogpg/y+bq5
         9o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115809; x=1755720609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JR421k4N/Se6xvjWYnB7MxBNfyK6tBYMQ/WsUDTfwCM=;
        b=aqLsNK5rovGZJxR4F1XwRJcMZ2tY7UY9WGyeJ11Glb1fXS06K+OWIGQTQInPC6uCem
         fVyyxcxCGe1bCkl4T5Cn/ml/i/L76ySrjnTnITsQOexh+sOS1/vYOqfUuM8gvElsFApE
         ZiZXJmnke9+xzw+HbOL5tzmoR4F/WvdVSRy/VBzdDEcG1JzKlmbSZCz9aLxZKkeZL+f7
         BIFILJXoRJlCi3CB1bSenC9f8uPRwTCTNQVH6INu2Xwzx4elF7FfWmcvhdYg1fpYDQn5
         vkY7tWYNwsxh7eSPduMS3PoT5gnUuv3TLXqiDZ1ib5iEUU6rQvzJDq7HrScyH660cwMR
         BOFA==
X-Forwarded-Encrypted: i=1; AJvYcCWIh0mYPf8uTBeQTKxFMloimjV4b7JhDQcY7sHd82B4GjHSQnbuSZ7tMjlirClCrzljVBI+UbXWvX3MHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypXyMHwhZPrssEMzVKzkTEzJTi3uNfpUqge+B2hyB2SuDzeY+A
	uI3yBeFfiwsd+ASNLGdhfEtsATMdElRQ3Kl6Pdo9AvpzTKXSJXqsGNFNX+LYiA==
X-Gm-Gg: ASbGnctYkw7WBJY5TVHO//ExcCF7nnMTPXRxKbv42ThUGFNbDu5YjyY3nPM6R9XRV0Q
	x4zrXFHwbXtL6M3ww6zcTVNi7s/t0dhsXaetIWjzLaxQbtF3d8YxgB2W0yjmjq+NOGTWaj/atM0
	TQKvR+nQzfTQbATwB2dO6npEp+rwnHlHjnz5j+oVQV1arDcaWYlPOq87EY9HJ2iONoONT9X5kv3
	/W4tx3LyU+7+s4teNj+dOGqs54CPcSSx60ULTGZn4udjvo0OIIec9/BKWhEMqMZdmOIQ+p0d8kG
	GAB+x3PxDrk9RhdHEBmpXFoNGmnESQr/KnZ1FZLhGeP33JRttfDscKav5edrmsDPOwe/LDn7U2z
	uG0+hijthnPt4mGljwPjHr82cTmHvYP6Ch3y8xC64cTSNso9UrIS0LOgH8XciFMJsb//jV5P0lS
	M=
X-Google-Smtp-Source: AGHT+IHr0OK2yoGmYzPBtpDY20/RmKzWkqAox5DTyT1Ymp/OHR8kWQAhJOh5NTqS9OC8fM02BDjc6w==
X-Received: by 2002:a17:907:1c08:b0:af9:6666:4acb with SMTP id a640c23a62f3a-afcb98d5019mr18127666b.10.1755115809199;
        Wed, 13 Aug 2025 13:10:09 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:08 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 03/17] HID: pidff: Remove unneeded debug
Date: Wed, 13 Aug 2025 22:09:51 +0200
Message-ID: <20250813201005.17819-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All the envelope settings work correctly and even if we wanted to debug
something about the envelope report, we would not only need the attack
level but it's length and fade properties to have a full image.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3cf844f7ad4a..75fc6dbe435c 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -339,10 +339,6 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 	pidff_set_time(&pidff->set_envelope[PID_FADE_TIME],
 			envelope->fade_length);
 
-	hid_dbg(pidff->hid, "attack %u => %d\n",
-		envelope->attack_level,
-		pidff->set_envelope[PID_ATTACK_LEVEL].value[0]);
-
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_ENVELOPE],
 			HID_REQ_SET_REPORT);
 }
-- 
2.50.1


