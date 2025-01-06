Return-Path: <linux-input+bounces-8964-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DFCA03217
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29DF93A4ECD
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2717E1E0B96;
	Mon,  6 Jan 2025 21:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlLzrLyG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4271E0B72;
	Mon,  6 Jan 2025 21:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199350; cv=none; b=PVvUbZCsraikzmTMRDGDbpdCGn/9DHEb1tApzWHX9xUFc0JxqoG7owCF0GdoIjNrbnrLbtAGWx3XfXs3ApZYDktHBObg4MI7iPFWZ727fsvR0uEMdbw0WA2/Wb7Td/7y/y6EOdHhhAxMlc91XfUqiaYxPb7w9V7lss7pZLVrPUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199350; c=relaxed/simple;
	bh=tWq+ZnBjlOupEjtG5PBxOjtcCachtKjWc1EONIVj4X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=awggVdDEbUYIZIIGIVyYsPRgoIc+8LQ/XQVP91jNqoxw/Rg1RNjqqDmnmTrZ/cVVWGu988szAJ79Sl8d0/ZFtml6K7gJqTZ/ws/lSRgalHxtA0348Hu3aoydzDPSvu21/wD/ZdSfWM7tmmoMDiPQXWqfMPhkqEKFnrn9SLXjVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlLzrLyG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d0ac3be718so3279925a12.1;
        Mon, 06 Jan 2025 13:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199346; x=1736804146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aG6QxwL2dLzIzlkegu/7XX/7ENaDG1aCgGKgLUZHrA=;
        b=jlLzrLyGfssYgj5YHObPUWpgCndmwnhtSz4eonMRTU9+EH9kDD3B+GjcWKjwXAzOI6
         /ykeALujEHf21VbReE2hLZ1b9pLGwIhOtlWDllWtJjfTU1qbgYKe8FMoETppj9AJnffZ
         dfcQjAqIglH8mkYz1KPZcmsg0xy0d+O5WVEBth0g74LEbvdH7vM15kMMfe7HM1+iYPq9
         FPZNtuwshO9s+y5cHkHHF1Kwx+JLmkjTH4FEzwyPmZFvesn1vg9PagVQ7dB2cViD/nz7
         UC6NA7ZOHoQa/+S//OxvOfQonzByvHqpRbJSTo9xJgIW/iDd0xg91KSgEqVOOegqBDvn
         1Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199346; x=1736804146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aG6QxwL2dLzIzlkegu/7XX/7ENaDG1aCgGKgLUZHrA=;
        b=QO0xbrt+Adu78mLXwk1FvcESRFRSSs2RGbp2yyoLZYskJ27M5e0Zq06XiM8HviENB+
         ORH+RhnrioFZ+kYRTu+4Lvf7j5GIJuubM3pmsbwxViLwbw7lMoPAsS0eIFMEdsUQGwL4
         LAjdhGjnvWRCVZW293Fs1KOihyaGS73bT1jQotIqQ33iKJHMoBTN2YdDn1OZUjpXeRMv
         txuUnTSGwKK2oMvtzHbWR/LZXjsIaWtXZWSmzF7DZvM6Q9kcumz5E9l+oJf8e/ky8rrM
         7VVdY/vAOIiVYvpmCLd0AOv9CVyyo+rAGz11fe2C7TL6ANDlEee/kxowOzuigq2MPivZ
         GaoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiTbyzj4/90MXLveOL749BDizihSduXAOfi1czHKXLZpyXLS11wz/czsurSGWOOL7TEZmTl+Y6Ttk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvDDQIrUP9Bk1pO7oCjv3t+o9jVrtPCgDdvQjxNMRm5QkSrqtC
	ShbeWv1p56zFEBPAZVVWxM8gR/QDdul3lVjBX/qKaTg2UeEJlem4tS+cBO7a
X-Gm-Gg: ASbGncv350ur/Uom6FoABlNyMd6fXhKFz6Y2UotehDq9I3eLrhx9UWvL+w+kLwYt25G
	BKEjiTs6t26hX5VFbEBkYtTwI/i9teiw9U9/Lm5PZCV+gR6K1dEiN8N7+DJfDzeoPaO9MyF5V+q
	gmDVFqC+4hSwi9onNwgBiCABkQGQyrGCVtV9si3MXfIwBPnsV2VAWox2QwcZrArAibC1FZdK0cP
	I85WKuEo6BH0kd4aHZ/d8c6FsmNaE8k0oLfg80UUqKOEx3tDsQEUcsxy5PpegU0AH5MRrys7j73
	0wGqDa6JxqX0BDC1xEGJOU/KbUI=
X-Google-Smtp-Source: AGHT+IGk84mkLY+gDCWva3727Y8Weq773UelfPge2HEn5EREpCwHdkyn3P82x/mw0iQjY3F/djz/aQ==
X-Received: by 2002:a05:6402:5109:b0:5d0:bd3b:b9a9 with SMTP id 4fb4d7f45d1cf-5d81de1c38cmr21554449a12.8.1736199346071;
        Mon, 06 Jan 2025 13:35:46 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:45 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 02/10] HID: pidff: Do not send effect envelope if it's empty
Date: Mon,  6 Jan 2025 22:35:31 +0100
Message-ID: <20250106213539.77709-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
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


