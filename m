Return-Path: <linux-input+bounces-9516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483BA1C363
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DB797A2829
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F2A208978;
	Sat, 25 Jan 2025 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqYJxIx2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1F51E505;
	Sat, 25 Jan 2025 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809691; cv=none; b=tveLNUmB2BVQWdzW4gTtAoBiM2HKg15jno7I6qM8fFBZTHQNQi6VGGHMgKOiq7cwOdvBBDLhy3djop1S30piVPYA9amMyI1Qla+yYgYmNKqlveYaoWdC/TAMEs7exfZfEkQZMHZbFYY3dgpppKMWQxmY8Xav+8IQrwb/R/vs+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809691; c=relaxed/simple;
	bh=wrRItE2ic9yO01lxSjZ9vLP2VpN3f7PJWhO595t/Rq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B3KsWxUGQaPzil9yzzzjBPtQGNKRAqIPK3Amzp08gH9F5DKSSD12NZAmZnggvbqoZ64CdA9zJq5TY3+UkU4VeaIHPuvz5/M3192rgAzZq+lJ89Eqsu1yiwCCDdZTjYknDW0A+fHJSw1u1628Mx7dh4mgxIVcixgKvLwzEdg+IQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqYJxIx2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso299312e87.0;
        Sat, 25 Jan 2025 04:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809687; x=1738414487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiBNwqEUd/4ZH7tEeMX6WGp4FpHjqtvRbtcFv1yfMq4=;
        b=WqYJxIx2H+lXeKyBVhNQ5goMkXym37LlJHQfSF7jC7A9T/CYyfD6SDsDk7iCG/ady9
         SyOIRJCqWvskQu+UERy7/F55//QOveqrSMnw1pVuoQN4aOfuRH5sKpjuC+4qM4vo3p/b
         wZZQB5BQg3zNth9pLaYic3mIt45GfmBuzsZbTLobPhOB1TsfH9nSMg/zhLk9JbvsmMle
         GkVvmNnmuYnEfiFE2pW7LW416DHcm2pJYcajbyM9KXVcpCvTufaI3lTCEIXAX7yqNJIc
         rLBkLKKZDr3pB+yLhy/7T3XLzj0mDc37XK5yYt/gAfpV5ojnIY1u4NOQ+ZID4y4qOsEF
         ISAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809687; x=1738414487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiBNwqEUd/4ZH7tEeMX6WGp4FpHjqtvRbtcFv1yfMq4=;
        b=DKDEe9b0F1ZDIZkhCl+3jUbK4q1M6szSa2A8fLZj5FJYLKcVPLTS/OmaBfTsY9BioS
         rZ0Va/qrr5u6LAHhDfapYl1PU4yW/p4emwKsbkPZaPVpmFQXjLVlb6GgWFU22grnsruX
         UXsDlSrDzYNFEiklEEpKWaI1zSuYKPkgFU2z54UcF6RpB6B+Fu/4//ql0x6y6pRfWgwC
         g0QAbalkdsEuPAwZGqpz6vsC+CUdoZVCm6T4MgncvVK1hqRHJG2HNOE3/9rCNryocjMp
         85eWBuOdQR4ywLUP8YZFK9UpyAyTObhm/biHGDyTITiNf6HKukoiQKRmjgFNZzpjPMEa
         g6ig==
X-Forwarded-Encrypted: i=1; AJvYcCVMRczdCWvS5Mktw0qm4n3qGk6Mh/wSGm9BwpLBnQJCz7ipTSxa3iqHge5ra27qHK9c4Z8/Hdo/dBNijg==@vger.kernel.org, AJvYcCWIsjSF8IRyLDPxU3V9tEYA13B7smYQAimawAn3jdGKjr7dodOEmy+RTFbnsLeZ2PWlk5PewOUQSfke@vger.kernel.org
X-Gm-Message-State: AOJu0Yy92yowp+tyky7NLVWY8V9qgXf7q+tv4YF3o2j+UNg84vzfwC0Q
	eikEhnD1ah8Umb+PHmp26GEN8jq8lAuENxL+XT6/IlFPqG5Xx6AA
X-Gm-Gg: ASbGncu93vAifu929scQoWXqWbsGNWlge3/KBBVQsOhAOmEHvMO61Gxrgm1RUbESDf1
	Xq//P6DFxzuvoE7EdMQheq2PRt4GKMyZgTTQOdOivDasEFAB/NW6HOHjx5KquFMM5VLvDkNTKSL
	AHC9CI54F5CtirDLVyWViyJCbBveOd3yj+UIkNDuEuK2hIQmn+INsBo3QV2DH+sohTaz0hYlcE4
	o6e4G9mfbroa+UBl85lqaI7FPHYtXNQwzNFkpaWnK9p0+qJK2tF8hwQ60Sjp0lOSklu0zbXymK0
	q3QgQNLoyNSpDnk1AHeAwERNEEbaa6pAwgxZLUQmG8lKxCZPzs0=
X-Google-Smtp-Source: AGHT+IE3kKnSlD7WZ7EN+SZDMu5u7vKGxudVawtnuBJYVktNrW9GJCCRPHrGKd1cHNtoXvCgLaB2+Q==
X-Received: by 2002:a2e:bc24:0:b0:302:1c90:58e0 with SMTP id 38308e7fff4ca-3072ca51eeemr44493171fa.1.1737809687241;
        Sat, 25 Jan 2025 04:54:47 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:46 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 02/17] HID: pidff: Do not send effect envelope if it's empty
Date: Sat, 25 Jan 2025 13:54:24 +0100
Message-ID: <20250125125439.1428460-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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

Changes in v6:
- Simplify the checks to make them clearer
- Fix possible null pointer dereference while calling
  pidff_needs_set_envelope

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 42 +++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 5fe4422bb5ba..a01c1b2ab2f4 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -262,10 +262,22 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
-	return envelope->attack_level != old->attack_level ||
-	       envelope->fade_level != old->fade_level ||
+	bool needs_new_envelope;
+	needs_new_envelope = envelope->attack_level  != 0 ||
+			     envelope->fade_level    != 0 ||
+			     envelope->attack_length != 0 ||
+			     envelope->fade_length   != 0;
+
+	if (!needs_new_envelope)
+		return false;
+
+	if (!old)
+		return needs_new_envelope;
+
+	return envelope->attack_level  != old->attack_level  ||
+	       envelope->fade_level    != old->fade_level    ||
 	       envelope->attack_length != old->attack_length ||
-	       envelope->fade_length != old->fade_length;
+	       envelope->fade_length   != old->fade_length;
 }
 
 /*
@@ -580,11 +592,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_constant(effect, old))
 			pidff_set_constant_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.constant.envelope,
-					&old->u.constant.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.constant.envelope);
+		if (pidff_needs_set_envelope(&effect->u.constant.envelope,
+					old ? &old->u.constant.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.constant.envelope);
 		break;
 
 	case FF_PERIODIC:
@@ -619,11 +629,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_periodic(effect, old))
 			pidff_set_periodic_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.periodic.envelope,
-					&old->u.periodic.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.periodic.envelope);
+		if (pidff_needs_set_envelope(&effect->u.periodic.envelope,
+					old ? &old->u.periodic.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.periodic.envelope);
 		break;
 
 	case FF_RAMP:
@@ -637,11 +645,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_ramp(effect, old))
 			pidff_set_ramp_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.ramp.envelope,
-					&old->u.ramp.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.ramp.envelope);
+		if (pidff_needs_set_envelope(&effect->u.ramp.envelope,
+					old ? &old->u.ramp.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.ramp.envelope);
 		break;
 
 	case FF_SPRING:
-- 
2.48.1


