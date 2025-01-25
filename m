Return-Path: <linux-input+bounces-9538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7B1A1C562
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52EB018881E4
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590A62066FF;
	Sat, 25 Jan 2025 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQiQM+MD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C22066E9;
	Sat, 25 Jan 2025 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843939; cv=none; b=IhASwHZ1SAta/GNvg82ydybqpQfeVWLeo9wHhPKMBPkQ1zkwT6u3NCUI1Bv7cZNB/ZeFA9NcjFIF5ndNAzPm3QQDOIlbKstYaPXjw1Y9r55a6ShujPLY/xhKeEJ2gzv3VtB+dbh7KW6GrPIs0z3h49sv+jUpVo9v2ENNqONnlmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843939; c=relaxed/simple;
	bh=wrRItE2ic9yO01lxSjZ9vLP2VpN3f7PJWhO595t/Rq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FLwkThMhK8dRKKsiyzlP8qDlhhQCK52HgS6roifkFiArCbacaVPMlkuzGco07KpHzYP2Y4DEiulfYDd6Mkx1onGqGiM6B0zygHKgV/SKH5KtIy7urJz2olXoysucOPFUH5kgHksJRZMU13UDWhQ4Fy70RO0H4uRISDryxzoFYVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQiQM+MD; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so643450a12.1;
        Sat, 25 Jan 2025 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843936; x=1738448736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiBNwqEUd/4ZH7tEeMX6WGp4FpHjqtvRbtcFv1yfMq4=;
        b=RQiQM+MDa9b3h7WdE6M78wrWEGcWyNiEi+x4gK/9KRTwRTXCafohdoltVJcMwtCVDr
         mj/S6ZStuSP3jkrzaE0426m1Ii4KHE3CHLhmv1l3RInzWX587y/nhX9pJxG5xssZwxCk
         bkzx6QSHgUe0Bp7GeNP5FO3cBYwawbM0nvBEWVlmnb80FMxsroAyMH8b6f2owKyaWNrw
         TQ/5mJ3T4pW7OqVSt6X734iPa/RHTz3V7+ofu9UiYnpg7+bRKoSZRRHjcRnCXjyjIigR
         30N4RC2xJTZdDrILbwxi8d14l/31M4vPgE9fcMjNWu2lEa+MCl3bRn64QHzGegkLDvny
         2LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843936; x=1738448736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiBNwqEUd/4ZH7tEeMX6WGp4FpHjqtvRbtcFv1yfMq4=;
        b=h1bPlIlyQ/QY3/d7SrkBnh0ap+L3cgOzy+I/Q1Eb1zQa479AhTmC48L17elQ3L1Myg
         I2k9WZH0gJuLWTegIj/O6ZUXwIDF0Z4r7UqeJNqAC60sbb32sjINqJBkkOARWLu7tb9Y
         BoTph/rnZ5CDfhQSoiOoy/PxZOiAbXWa0EqFei1oReakXX/tZqxGzBovDU7u1uYlQ4Jl
         F6hF5jkIWXsOfhAN8FyhFu8VGRh46oRSxzm3IC36NxZF6JV8TvHMBiHlKp5a79LTTzdM
         ZZVNruzEcyhf4rp66P8BYW3+KVGHTulsHWNzGZWjSI0ZzwedzqTen6JUdssO6eCZ/9XK
         KggA==
X-Forwarded-Encrypted: i=1; AJvYcCUOd90TtjWqvncjmtMxVN8kaC2+GWoDX84E7j+LscXfXFcJvgZynZdLfHOa0d5z18L99Z03S3nNuXlyEA==@vger.kernel.org, AJvYcCW6LTLRxib0F0B3KVcteOhTmRwc8s1hp9uA5suFDR7j9LwXPTeAe8WXo9GZzBoHHJXcuQVbtDgr2Ygn@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxZynuak1grAskmZu0+oyiABOgEU/NIBMMnv3FhFxLKuTeNSl
	aqzrsWwJO/PpQBU8J0788g76MM52y5QIqV2NNixaz1Z2ANymJ9V+
X-Gm-Gg: ASbGncskB/BYMuf3tiAxuroXppeeqRQcgT0OurV23bgqlz407Y2HiVzjI4HVcwN5jjJ
	d3RUPP6OGrlll6MGXPA6GBKqLY9if3zKzQCBJqHE81CJbiTwkXKql9lDrMGRbs7jLW/GhSjKcg/
	O8u6Y5JqFR9+zYnC3c1KE4LbM8lN5WrqEq/mgRTHIGn+Rm6WfTd10YHoqlR4UEqPQEMPizbgbTN
	kZbzwEqV8/n10BZQkhwP3QqgGrwoHbTxKtAhKZ7drR0/NJfoQL1njADqDvHO53P3zq+PT83eJ3g
	EfqWm20U1F+U6cxbs5IgYvoppzQLJ/cOgrQ9Q6nnGFNwFStvk8w=
X-Google-Smtp-Source: AGHT+IGbgp5PaceqqgDL0Xm39RKogaVaECKfIPRcR+1Qk3qfNQBsExTa6MbrNzrbPR2Ev8dbJHrBtw==
X-Received: by 2002:a17:906:528d:b0:ab6:5558:474a with SMTP id a640c23a62f3a-ab655584a5fmr504208666b.8.1737843935429;
        Sat, 25 Jan 2025 14:25:35 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:34 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 02/17] HID: pidff: Do not send effect envelope if it's empty
Date: Sat, 25 Jan 2025 23:25:15 +0100
Message-ID: <20250125222530.45944-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
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


