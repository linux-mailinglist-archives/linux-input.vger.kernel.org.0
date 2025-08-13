Return-Path: <linux-input+bounces-13981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18179B25455
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653D61C855FE
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9E82FD7CF;
	Wed, 13 Aug 2025 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTALqIKK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B02FD7BF
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115812; cv=none; b=aDcoGc3vVnIDV/c8PCl8wxopXvmI5lG6t6bTe4ru2mNeItuYDW62iA0IyTFAi2tlex7TnrjxJdpRDiXU7K3kg85HSFD0BYig7hhfdDhrSnoy2v1Fkfcj6KdnvXyDnuet+6IDcoCoact2cP8J9Sq15cB5WNUpbh7sToTcsg03rgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115812; c=relaxed/simple;
	bh=fSeXuCNLn50zEFEYr+dX7zcSXr9kE/0zvHaTMnnz4p8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZxOKAYlvm1TaQ2W7n/ICi3CkKsibR2NFkz4XYoJzDPjfKt+kSF3WVePSv2McmeUBeY+zzbmSRapJoMh4UlCZ8HYNh0CqDR7r1Nj9KaVNGa4pVAUucqjmygX+9MjEaTu9SCEJp+vAbIwd6svdUy8A5iE5/93ln0utXbGYOmb3n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTALqIKK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb78d5e13so3236866b.1
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115809; x=1755720609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtOrb7V+J7PqCFzhJp4YD9Mip/hvCyAShGIDPm0hP+A=;
        b=XTALqIKKtGRccvFlw13PVaIMRiUmhx8m4DlrgYz357rUwzF4Bg5e2P+m2EV+SiVbEI
         ueMsUI21RwZD3a46jDNaAT+hVh1NGkd/8N99T0h9fJj77e+L9X3Xppltg3f1p9zZvKvf
         1V4+fjhDGIzFzPGqwMBooG+rAoVbgphLYIcJ3OK5T6qT5E/x2chwsqfS3AiTdYGs//YY
         /ktGN5mvsWzOIuBXMLu0i4x1HfG4awBneeFOvt4BO/zJnIIyLYM1uojxNHfedmTOCiUQ
         a7OmErN7evNN3rNSnzvKkEoXPo/X4YYfFWvZu3t7PeyRWph9/Rx0mmrqQL4sE6X+Brj5
         YGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115809; x=1755720609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtOrb7V+J7PqCFzhJp4YD9Mip/hvCyAShGIDPm0hP+A=;
        b=bbe+xOm8nWgsOuLz5nl/qZcafIKQb8hklZoLoMEKYFF4RbtgRceO9tJ64A1gjHlA3Z
         1WfKsAMEExKq7EFag3wXh5iS3KGJneY1JC7dccPqPHn7eeoG1BhcYzQzPUMbj26RlYJg
         1KLkyYNrEw44kjiL9OURhjGxuMY+mOiZvhZFX8u2Ssk8Mk49XQYcYXYBnlAp0hUsLbAc
         y6EV3Bg3k5DptxP5Mg3+rXEjmWeqs3dt65Yr6yNHGU3VxZIA3eIDDhPtDDo9V8CQ2trL
         klqX7JsCAxVMXdkXzpFmVkBhEhePm+bHHusWGCzN3HhgnP4JiLEiEIt6ULxBJFyv2F69
         Z29g==
X-Forwarded-Encrypted: i=1; AJvYcCXYs/GLAb176h45vGJbWg5p/vaW7p/bnuBUbI+AGMuoJl82ZBs6nrO53pn6Zqu5vFCdicqqak2wmoI7Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHoqyz+SOhh9VQ4KreQbJ5/nsRzRm10SXeRETIb9bndmzGU8zR
	kl1bedMMKIkbkC2QYAL26M/ouW+S+kTu3vJ2Hmbdn/PmI1a6KlcLL75kpg1rUw==
X-Gm-Gg: ASbGncusGa73X411oXtkRegR77SjwsYQ93pLzsidGG99gGeJD0XGFJ7H6ZFb58gCBJ5
	dZ0PNX96WFFTPQhf9fX6pTza7F9hUTachLh1Uw1aA57EhfdLY8IGYpH9q8zxEq8KjB5OGIu04zw
	vCaO8H25Ht/keEO5JeE1WY+p9ivbT4gLpAoZgm8YrD5tTIoXzK0AgKuHyYJFB3HJ0sLaTRmscjf
	PGAimpxEB1k+jLRypJGzNXwA15kODx00Rw5QT11gtzvUaAVlUBBKzegXuAC2AR5uCmLxBjutbgx
	a4p0+DJkxlgm73mabruD8JCIBsOXlSRP4qoHCZeFazzAEgz0tIxS99VbB//7lU67IzVtNoLv7uC
	d1VqQnpVoesjMGZ7FxnR0jovUdJhEP2tn7npfLZZ2uGW+YFCFPP2t/yAS5RstJcf195v1kALQkG
	M=
X-Google-Smtp-Source: AGHT+IF00FGqsp2HtG4kG2iWqEi2H1lDPJ3tsfyREC8koiZ5bIXFsbNT6Z2kyS6tO6i7q+i1lPcMEg==
X-Received: by 2002:a17:906:c145:b0:af9:3d0a:f383 with SMTP id a640c23a62f3a-afca4d61532mr187394666b.6.1755115808503;
        Wed, 13 Aug 2025 13:10:08 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:08 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 02/17] HID: pidff: Remove unhelpful pidff_set_actuators helper
Date: Wed, 13 Aug 2025 22:09:50 +0200
Message-ID: <20250813201005.17819-3-tomasz.pakula.oficjalny@gmail.com>
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

Abstracts away too little of the functionality and replaces a nice,
defined value with a magic bool. There's no actual need for it.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/usbhid/hid-pidff.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index c6b4f61e535d..3cf844f7ad4a 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -605,16 +605,6 @@ static void pidff_set_device_control(struct pidff_device *pidff, int field)
 	hid_hw_wait(pidff->hid);
 }
 
-/*
- * Modify actuators state
- */
-static void pidff_set_actuators(struct pidff_device *pidff, bool enable)
-{
-	hid_dbg(pidff->hid, "%s actuators\n", enable ? "Enable" : "Disable");
-	pidff_set_device_control(pidff,
-		enable ? PID_ENABLE_ACTUATORS : PID_DISABLE_ACTUATORS);
-}
-
 /*
  * Reset the device, stop all effects, enable actuators
  */
@@ -626,7 +616,7 @@ static void pidff_reset(struct pidff_device *pidff)
 	pidff->effect_count = 0;
 
 	pidff_set_device_control(pidff, PID_STOP_ALL_EFFECTS);
-	pidff_set_actuators(pidff, 1);
+	pidff_set_device_control(pidff, PID_ENABLE_ACTUATORS);
 }
 
 /*
-- 
2.50.1


