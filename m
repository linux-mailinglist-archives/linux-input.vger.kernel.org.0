Return-Path: <linux-input+bounces-13993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F4B25468
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D4A79A68CF
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5C42FD7D6;
	Wed, 13 Aug 2025 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFTqEtnb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF162FD7D9
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115823; cv=none; b=RrplO32lNZxfOtoYxEN1lxGArVOIrb3p8P+5lRXcVtrDXppFzsUp4zypLKkur3rMUUJ2VtuIKloik0U659cPbBNnSiFRBbsJcGwzEWC6QTUnqTqH8C9r/xOK/eEXgSAhSMQVQmaYBhHULejsbJgrkDRt70mb/8JQ+5Ac71dKgTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115823; c=relaxed/simple;
	bh=I19PfO2UxPXkUmsFSm8/QBrCCRr8ThJ952QKIIi/t7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKe08V8BPcb9hHIluMiKjO/wpdql+qkzEalpO01EM7eo474AZhn7HVs6JRWd9PJBMSsWbTg58VDAXr4P8LTLqW9TbUZ0AeYrmKdJO79W+6vVFAjQbiSQIDKJMWEFBBf95A8yA++3VY4OEKJiPTW6gj4x+Zs+c92UITNB334XoVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFTqEtnb; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7a96309so3269166b.3
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115816; x=1755720616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw6YTYzP6TeXxjfrPLfYs/o7am5hq49RWRkk3XI3RPA=;
        b=dFTqEtnbV5mT0g/8y6tPqvUoNwiymvLkzVaqVPPN9a00V0NPOV5Carx108TcoQhmsf
         usQm+ArSm+SwxYterGBWM9aqNgvthVEqwhOUK+PhHyaTOCfmzJcLAWcPjrFoDLm0ga0C
         SNuLqZWu91On5I6Vq1TyHGRFDpjY6ndqB1Yqs36qy4qp/WfhVslEVeOHucKV1mrhNFvG
         gT1zCGU5ppX87MrcsM9lPfpLrzQ+Jn0GZbR/nSOUQE3goupwv5nDXThXm+cSu4mkAtIH
         ha4ZgAcIJRY792IVfesdim1e2kYo76/AbBE80LF+RlHnt2SYNhrOLR7eKTn1R+9xrF1k
         58Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115816; x=1755720616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw6YTYzP6TeXxjfrPLfYs/o7am5hq49RWRkk3XI3RPA=;
        b=lX+jGvf355xmJCBIUV9W6PoantPqOj6dYuIk9u5ezafXaPC2MNONk1YNwVvTDJXmVa
         PE7sCnqirrCiAOm5pCDXbEmlXSqOLuPfPxyWFiyux6x0DyjHBNhW6PrhSWi6Xbl2oBO2
         rF+jIze8UJfc2gV/gkuZB4E6HmohToeouCXUMv3cRHcnGkhGTQbfxS98dgF8ThRn058A
         f8dwJdDxGhp2mT8YZttrXWhc+EStkWP+b9MT0eZvz5NEvzOe5CPId0b40c2ZyWpQeM8q
         4R0yfmGje7+NZI1hOCK0ecJk9z5exNl4aprDns+5Bfzztcp5BKQDIVZMDQEutvBFtsvn
         Zq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrvTd1BwgUDq3/wpX3YRmuCMpfqzg3eNDJxiE4Dp+MqXVHKdTzvxlEnrf9W8gWO0vhjyt/8EWqukKF1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2bKJ4CnZFFmHm/OXZRtyqI4LktBTaAzogNj1PrhvVx4ZuEId+
	J1IOkUZaCXUwOY040a3imESKaJm5w+jcnQL/pN/pbRtQo7W5OAoWlPv7
X-Gm-Gg: ASbGncvisFeJnzB61SWLT0zgDl3lFHivvAv6MzGakxo+sH3pWfhwiRmOBgLM5DY9q+x
	Q+KqC75L8JRSJp/IGwdZJppS5VWLvvzn5Tl5Djvx6025KeydGffOPFrE7/ujmE8jLp4Yd51kocV
	3RhQKMYGwsTyRA4148qWeVC0et/1T72jh/GRS4qjjzwSu0BTTBy7Tf9SL61v1E9NhacWUAcnQzy
	d9rwcOCzLHT7Ah4CfIqTULeIkj6ihKltWKy/zljJTGgM/+4jG9XH5RBbjKqDCtr/z4SAFUokw8C
	utWdIJ2iFoAo09Z11B9Xu+aFQZ4Uh3ZFKw1lUwLyi2rw4cS67KbfpkQ2Fz8Lm/5bs3hIxokiKHM
	zfjE1hi5vqIYSyuSqdTxl5AsgfbcUBzNJRD+iKdKvWOqb/xw6e0iNmGyO+9TkXZ5C45NUNDpmkd
	s=
X-Google-Smtp-Source: AGHT+IHy+LivBmSmJ0mkJPcTluGZybVKs2llt+cJilEDJmiuJ6EFwdalXuGSk+WETlG6t0ouiZ8R6g==
X-Received: by 2002:a17:906:6a0f:b0:ae1:808:85ea with SMTP id a640c23a62f3a-afcb98e224emr17899266b.8.1755115816132;
        Wed, 13 Aug 2025 13:10:16 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:15 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 11/17] HID: pidff: Separate check for infinite duration
Date: Wed, 13 Aug 2025 22:09:59 +0200
Message-ID: <20250813201005.17819-12-tomasz.pakula.oficjalny@gmail.com>
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

It will be used in a few more places so this makes sure it will always
work the same.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 32d42792c95a..534fb28f6e55 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -242,6 +242,11 @@ static int pidff_is_effect_conditional(struct ff_effect *effect)
 	       effect->type == FF_FRICTION;
 }
 
+static int pidff_is_duration_infinite(u16 duration)
+{
+	return duration == FF_INFINITE || duration == PID_INFINITE;
+}
+
 /*
  * Get PID effect index from FF effect type.
  * Return 0 if invalid.
@@ -374,12 +379,8 @@ static void pidff_set_time(struct pidff_usage *usage, u16 time)
 
 static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
 {
-	/* Infinite value conversion from Linux API -> PID */
-	if (duration == FF_INFINITE)
-		duration = PID_INFINITE;
-
 	/* PID defines INFINITE as the max possible value for duration field */
-	if (duration == PID_INFINITE) {
+	if (pidff_is_duration_infinite(duration)) {
 		usage->value[0] = (1U << usage->field->report_size) - 1;
 		return;
 	}
-- 
2.50.1


