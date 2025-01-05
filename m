Return-Path: <linux-input+bounces-8896-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D05A01B81
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 967703A32B2
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F611CDFAC;
	Sun,  5 Jan 2025 19:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2bHDC/y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA93180A80;
	Sun,  5 Jan 2025 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105798; cv=none; b=VPf6q30UhKrniXXZRCfyyDMNN3wUCgG2lfjR4rg7EIcUlIiioPuNg4N76/L3mG4Li9JRAAxAxwfMg1JxXJ8Hmzdmd1s5W3vbIvXLgmlS7ssYAflJcQiHIq5RN9Dz5RDE1UDUlomaTp/3PlTAO+M3blN1rdPe0mlochI3LMT1Xw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105798; c=relaxed/simple;
	bh=tWq+ZnBjlOupEjtG5PBxOjtcCachtKjWc1EONIVj4X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lGqlf9YC1wRwbWPUEXbtH547xDcLugjRSeNrHfu6e8TR4YZHqAXZNX3hUKiJtDz4VgcOH2+tDo/R/SRrz/Bllc4YIV5oirlXw8BTQRH0R4+ZXC+Pp88UZgl5PBntM39rUrzWgOyM7Tr04vGbHhGdBXTF4dUVz3xrfoQmSXokg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2bHDC/y; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-303548a9332so15436991fa.1;
        Sun, 05 Jan 2025 11:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105794; x=1736710594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aG6QxwL2dLzIzlkegu/7XX/7ENaDG1aCgGKgLUZHrA=;
        b=G2bHDC/y8LHJp34CoBTYY2Zy/pGd/N96ePBG/nnzzZ3D751Y10SDKuYYi6nfFB3QKM
         ak6D0bmMwS7lH82pr8NY9uBhtkq0NK8q9IT8Vzm9HUrA8bfeoycPzjIdv/YWJVfITcyr
         mMxLj/wX8yyXSuOnRsmsYWiO99wsTnnNb9QMZYXBs8hcXXqmVBFiiNkdYeaqQop2iv8L
         j1uF4bUr0QYxNf3alaqtuiLkkcCbbn42+1qFzMQbRd23Ozc367iLRzZ6GeRV/cvznSaQ
         CFD2zZ3P8P/gfNcskMyk32vt1drQzqIgw4Eth04ArwqZABJcyrYbn7EddLDyq/PwiWUo
         H+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105794; x=1736710594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aG6QxwL2dLzIzlkegu/7XX/7ENaDG1aCgGKgLUZHrA=;
        b=HHxWgNGrPaIWSuZSMoyWjVO8KBN4hMv+YkySHuJZvPe5UfCuP5DVwtqlq/lTnoxX+V
         S0VVF8aJNft/bG2kjyilhLSc+LkgxqCrTxze2O/ydkrBqPyLFZM3MOvAMhbFpgFGlU/0
         ra1Z1ToPjZTkvZScyC3RRVQsGJ2erqyrEGL5JtDJKUc75HIFO2TLRRQ3/bNVvDdsfhIo
         164ntLksPA8PXsbY/V4Nr4JthyAtWMfLHeyS3QoknzB5rPPMdcOPxSVEdwlFikigXg93
         N2HrwNijuKe8t/2ipjzKeOUTL6/31hNj0y8C/P7eWeoK487YV6XGdRq/SQ2S2cl35iD5
         dgVg==
X-Forwarded-Encrypted: i=1; AJvYcCX05d12vxDN+PmYggQuAh4TYzN122HGyyfI3eSeeh2ODfDkr88uZ5eBEdQphp2A2lBXvk2P/zT8mIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Q6GVE+ZTBYJpFJOP1Gls3gq2ebwP3YCbRREaB4DrDzlxt3PJ
	t4y/ZQt85Egu+ISxMJI5tHEyUEczpxvPXea2+V9abe46vVl5UCcHiB5+lM4y
X-Gm-Gg: ASbGnctgRTIWJ+9Lf02WVmylv/sO+Fw+seDGoN/7RazQ+yj9J6NazgX1CBfeQVuoUyp
	C5pyaFCjeXsRi6tHmEjjW+510hINm8DRT+4KmZWKr64flfhBMyDMBTQ7PRgeKBBGgAfimnhrfCg
	aqrUG9r+t8qjHC99HQmcaV8797x1+PQ8tdLme5m2S66ZW1zSK5pwG26jam7EX61tlQGU52Tcr/H
	XpNYOVXUaOClzCwJzCj/TeJZeu+jd9XyTf4vLE0wZIRjv+ezDwPGmYOsDvgtbBTQQScaMnPCA/p
	qK8kOQ846+FzR5/DVIKEEmJPc7E=
X-Google-Smtp-Source: AGHT+IFOjjlWnbAvHn8/xNJOE19fw2nIvWBz0hstmvPllYcB6ubheoVe4ifJ5zQv8zsuH/YaRdCbAQ==
X-Received: by 2002:a05:651c:1503:b0:300:17a3:7ae1 with SMTP id 38308e7fff4ca-304685b958cmr71224071fa.9.1736105794139;
        Sun, 05 Jan 2025 11:36:34 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 02/10] HID: pidff: Do not send effect envelope if it's empty
Date: Sun,  5 Jan 2025 20:36:20 +0100
Message-ID: <20250105193628.296350-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Envelope struct is always initialized, but the envelope itself is
optional as described in USB PID Device class definition 1.0.

5.1.1.1 Type Specific Block Offsets
...
4) Effects that do not use Condition Blocks use 1 Parameter Block and
an *optional* Envelope Block.

Sending out "empty" envelope breaks force feedback on some devices with
games that use SINE effect + offset to emulate constant force effect, as
well as generally breaking Constant/Periodic effects. One of the affected
brands is Moza Racing.

This change prevents the envelope from being sent if it contains all
0 values while keeping the old behavior of only sending it, if it differs
from the old one.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 39 ++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3899d72a0b02..cf8163d92ea4 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -261,10 +261,19 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
-	return envelope->attack_level != old->attack_level ||
-	       envelope->fade_level != old->fade_level ||
+	bool needs_new_envelope;
+	needs_new_envelope = envelope->attack_level  != 0 ||
+		             envelope->fade_level    != 0 ||
+		             envelope->attack_length != 0 ||
+		             envelope->fade_length   != 0;
+
+	if (!needs_new_envelope || !old)
+		return needs_new_envelope;
+
+	return envelope->attack_level  != old->attack_level  ||
+	       envelope->fade_level    != old->fade_level    ||
 	       envelope->attack_length != old->attack_length ||
-	       envelope->fade_length != old->fade_length;
+	       envelope->fade_length   != old->fade_length;
 }
 
 /*
@@ -579,11 +588,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_constant(effect, old))
 			pidff_set_constant_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.constant.envelope,
-					&old->u.constant.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.constant.envelope);
+		if (pidff_needs_set_envelope(&effect->u.constant.envelope,
+					     &old->u.constant.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.constant.envelope);
 		break;
 
 	case FF_PERIODIC:
@@ -618,11 +625,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_periodic(effect, old))
 			pidff_set_periodic_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.periodic.envelope,
-					&old->u.periodic.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.periodic.envelope);
+		if (pidff_needs_set_envelope(&effect->u.periodic.envelope,
+					     &old->u.periodic.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.periodic.envelope);
 		break;
 
 	case FF_RAMP:
@@ -636,11 +641,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_ramp(effect, old))
 			pidff_set_ramp_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.ramp.envelope,
-					&old->u.ramp.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.ramp.envelope);
+		if (pidff_needs_set_envelope(&effect->u.ramp.envelope,
+					     &old->u.ramp.envelope))
+			pidff_set_envelope_report(pidff, &effect->u.ramp.envelope);
 		break;
 
 	case FF_SPRING:
-- 
2.47.1


