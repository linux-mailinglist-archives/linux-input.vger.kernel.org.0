Return-Path: <linux-input+bounces-9607-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1EA225AE
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B9C91887059
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD9D1E3DEB;
	Wed, 29 Jan 2025 21:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmLGrngS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF541E379B;
	Wed, 29 Jan 2025 21:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186187; cv=none; b=FcBGwbbTSM0o0QQs8R8lYXQepCYd/kKph08C0kevKbsAlxFBHvJmulyVrftsHakRZiB3aEb/1hNkBSatSEdXya+cScqhMdd+Gwa908vhgafxvW78MtulUKmS4hh5Mi4pFxr+O/fKvg6VchLslQVmH1t3rm1SpziJCa/ilNVU7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186187; c=relaxed/simple;
	bh=PvtOoVWhOvVoB7EdYAAxlUuxG61semvfPr/QFothM/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xka7joZUbHRsRZ/xT1R/dvHHJmqCzQph8NZP49l6kNtqJOVi/F+D5C5TxhNko/v3NNwKGeU71ZAUk0nxeSQOAP7ojQv5cvyd8+vbw1QgknmkojZWX/GdiZvqVkjDE2VIKoCFGWhhal/skdet4CBi9w71L2P0Kq+d2YRYb85heuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmLGrngS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5426f48e501so18024e87.2;
        Wed, 29 Jan 2025 13:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186183; x=1738790983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQfJ49zNeFmYfkDuLKuSoElLRAh+aRQWxnmxtES8afw=;
        b=nmLGrngSPvaagENvVwcfKg8HZeIdeQ0RS6+HcQwqhDAK9q6HbfoIqcHAdZDLYts7u3
         Q5+U8KQqWzxBqQjE0Potr/88k9RIPCTFxt8SvQUgcwzRYmIvUC0se4nm2pG8z7oq9OV0
         LRg3Atl7IIv6RL2S/vIsvdxwxHdQwecreAV8JGatRN/U9S6mo03KoL61GpP/ApLy2zuL
         MkimsDd2wC+VmD6gwE6ZkMHXVC2tpQAMFNLuYZjzbU/iyWW9sgJxv78SPf76c4qDyj0L
         1LVx6XNTf6hsL9Bs+C0SHUkaajWpG/Jl7tjhaZw+tPlx1UmxARmOy9YKhCM7ghOqNafu
         bYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186183; x=1738790983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQfJ49zNeFmYfkDuLKuSoElLRAh+aRQWxnmxtES8afw=;
        b=rQqJevxayAnt51iDUV54Tp1iqfOVBSd4SxfO/QCskjLlNrA2z12lu6RiRzHN4mnxVD
         yCqJyyRdkfFyTUZ5T7YF+D6+cBWCjbcSBYKEiNLgxrhbdm+XvSDoeY4uTFuMAFutIx8d
         liE6US4GGhw7jatm8uEF/Se6CdYBVofmhlUChpyMRCuNIHyX5hXOiu1wNP3C4+Gc6Dcj
         W0gKMqLsfPLzh+2dN3MFuXwOuLdPXJYWTrwkg/D9fnJ3gSzY3rWR9CNpWox1+7LXHtDX
         Kbn2wSn7W0Hp/rpsyJbKGFHblKuA1mmkdqHQXO6R09Tm7xCFbggkw+wFmQY/g5w2CQfj
         3AKg==
X-Forwarded-Encrypted: i=1; AJvYcCU+tMAmZf0oKLZW7pBnRceP7Z+po7s1tgYahuB+XKtmU+/oGUppGvUYrKJtpsixhPIQW56gVucl+k28dQ==@vger.kernel.org, AJvYcCWZ/E0T1MHA/DV72ceBmQB/+bsOxxL8oyVEksbGCH19fWvIbggUeXqzXDiRB+aLNiiey0pHDHBUw0c1@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3WwQemNkeC1XNMlzgZ4suBIhIDDJ4PCgR3AwqgfPx1XBieMN
	9VjHg5DQi9W4szU/gVFHlOXMH52GMu4lCeazsbHVC4pzoqs2kB9L
X-Gm-Gg: ASbGncteU3D7sO65TSGhvqI6uMsSYgo0rP/AhXhhPVys3g0PO/RAi4d+rD7kWBeAmYS
	1/Xm0rigvtRDLRqu9jvYXa2XUVaTdkSYWvJiulDmakt+8E8cWQIDZdLLlOGuUCyfAFVSAITbixk
	l9Vr/OK5zcti3hNr/QRoH74ErL6xXa5UT+h9nFe0OrKwsTxQ6anFmh97g3YV9dfMpN0R0rQMFdI
	jL3o7SzzzcmOA1MR0JaErM7FjgxHWFEHeHZMQuX+cSVjOaKtcBA3ZdK4cUzvsiW+cqCg3G4qNUY
	OJMKiJYyM6whot3ZEvLRdVXmS8f0CGB7faUDzptmZGOfTq9MABUZkj+qH5PtvQ==
X-Google-Smtp-Source: AGHT+IFvhUAJPtVG2qCsgN1VXNVgDoHezEBC0yZk4KNUuz3PNlzeo71rAvnGXTYASa5SlzI8x4njMQ==
X-Received: by 2002:a05:6512:4023:b0:542:297e:94e with SMTP id 2adb3069b0e04-543e4ba63b1mr622089e87.0.1738186183049;
        Wed, 29 Jan 2025 13:29:43 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:42 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 02/21] HID: pidff: Do not send effect envelope if it's empty
Date: Wed, 29 Jan 2025 22:29:16 +0100
Message-ID: <20250129212935.780998-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
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
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
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


