Return-Path: <linux-input+bounces-13780-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6802B194C1
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D7AD3B6647
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFF01DE896;
	Sun,  3 Aug 2025 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goBuf8AE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CB01E1DFC
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244849; cv=none; b=fq9ozymWOHiWhN+D5dY1N8+YKvF3y+oLQCjrH3BIVpKO2Gg57Mx3xipsZCLbC34mOqD8FBVGLjlvIymRYSacuxRJDKbeS9YFC/44NQ/eGELPIB0o6+T1OI+NzBFEZrPlpn1+aeqgbeWgwLLWIRkGUF4ihoG5aF7ZWlWQzZ7JVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244849; c=relaxed/simple;
	bh=iEefw58dTjOLDc9LmVjly6bYNwWVitEkzAsmOoqEf8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BtJDwhjXHzoM7WMGMDn9pANA8MjIF5RCQGk4TO788pjGwh0q/PsxSDWl7FXSp4quketcPIrVNwMx77sSM3DUzbOaCcI2aHTnAa5RCU+B+ItpGVJ8vmvDJfFi3F+ilQTeW3GnKTS95OA2FcE0DNkVCd03Uo3GsbWK6QnxepFSo5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goBuf8AE; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6158745f51dso589455a12.0
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244846; x=1754849646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1nUT+E5jGxyff1Y6y8RNJPxDE6Ojaw5b70nEDGUEi8=;
        b=goBuf8AED7cDSu3gc6lid6PAjpw9CcniyiXPg2eWqCdDIDayv0ZgGfgjHGJ9omXPE4
         B/HqehbOliNA4eJSSTcSwM9jt+R2BO8pjgGGUHGBPf6/F2ErRxIbEQ8v4VfXFs0SIaL+
         CVMBS67PZwAXbsvwgJ/hFm9BhOcGOpjwdHEtdvhbbHH3GM/or9ThV1HrRZNHoZCN1Mwq
         dpVp5H0dmitOIg4v7ycg9oKpbrA1se1FMPenIY8PIHvWtZyvF3Jq7yg0XlGuOaXPMl5W
         qarirZQ9o+fupJQzyrr/+Qq8F8tkJa+Y1Xegu/AYCk8+oGpzuox/8NzOSoz4yc+u/K+Z
         CE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244846; x=1754849646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1nUT+E5jGxyff1Y6y8RNJPxDE6Ojaw5b70nEDGUEi8=;
        b=Xlf4lDyR/F5/dNOSqEafCPsGe6aBswIULGCDiAtMqWhochJgkAhgwhPpMbtK7pw+lv
         infXE8x8ImZCwAoR8X3YJe5/+cX9KB7vB0kuZ1o8NgcZId1utl5zjl2atERroqGtr3MK
         sw4KWu7zfmOWGUD/GeLbfFZywXip7zOhKoBVeu8yE83bIEAiZHRZUysPz4/JgAIcGn1a
         QnRUdmUYAIn4BbyMZ0nlrwYBszXEmz52tfij6RhNbEXWGKFc24cDPX+yHgUEFidHt8Q2
         6S9j0UEFGEDFx9hR11qTzxwhxkx8zkLFnjCkCNAEye9to1hwqAMtocF9bsf8vsBtzGDb
         2rFg==
X-Forwarded-Encrypted: i=1; AJvYcCV783z8EI1puuTdyiJVZ9TzXB3VjSDvKEv0iQqJxnLsJWDYybJ4xoPvcG+DNkKectMIqO2yPpnXVGhxKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3JxrUPW0EYKp0ry69k4MRpA+05SHWQZ+u146Sj3/mVgGbzab9
	TaQ9Il+At8ahEZdC2YZMWfMk6WlissWZt+v6IfGMbXaFAWQNGTx3J2m9
X-Gm-Gg: ASbGncvvwfXKK7nYCes90/dhOsL1l9/LeZM4NoPAGueq851HUyiLIiez+yMOjjyg8CF
	BCkhd1oRerc7jTpo04ZOOGxbcmE7Hsj+nsKmA6gfRe+SFcS7g/+DNKoahasMJ8JnKPWVTHkZZQO
	itf/ML5ALEF0reC3V46xqjbOV218bMm0CeGyq3uNbiQ7d7GlKm1CM6JMSPnkgoEgOM2ucQc5ZbE
	+fWCBbAS/KO8ZrBhpWAmzVN9Ucx2CU0EzCfK1S2S9ByBOnf9yr4Zsp/3vsdtud+J4mgqFISwrI2
	e94PPHaVdKdhFbLnKy9ufXkGzL5LH1PHNyzOacYEXArPa/kg+dYZCmhEv0ORRJjS6mKRARcWr+U
	QEQYUe80DBtEaYjLQ3r5Tg9t5FeThvtRtdpV9F1kG9u8Y3xWM3M4OzzVLjgvUQJh3pZy7O6tGon
	gKFo1B6oFjOQ==
X-Google-Smtp-Source: AGHT+IH2zCM+s8keBbQevHNczbSOaT+1AeuzPLo2cvOV8ESFayTiNDci5NOD1PKL6JMvGaspHeofiw==
X-Received: by 2002:a17:907:2da5:b0:ae0:c276:d90e with SMTP id a640c23a62f3a-af940006e0emr286989366b.4.1754244845441;
        Sun, 03 Aug 2025 11:14:05 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:04 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 10/17] HID: pidff: Rework pidff_upload_effect
Date: Sun,  3 Aug 2025 20:13:47 +0200
Message-ID: <20250803181354.60034-11-tomasz.pakula.oficjalny@gmail.com>
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

One of the more complicated functions. Expunge some of the logic to
separate functions (FF -> PID id conversion)

Add a macro for envelope check to make it more readable in the upload
function.

All this made it possible to to expunge common code from the big switch
statement and reduce the overall function size considerably. Now it can
fit on one screen.

Move the effect_cout logic from report functions to upload/erase
functions.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 243 ++++++++++++++++-----------------
 1 file changed, 115 insertions(+), 128 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 689419b20bf0..32d42792c95a 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -142,7 +142,7 @@ static const u8 pidff_effect_types[] = {
 #define PID_BLOCK_LOAD_SUCCESS	0
 #define PID_BLOCK_LOAD_FULL	1
 #define PID_BLOCK_LOAD_ERROR	2
-static const u8 pidff_block_load_status[] = { 0x8c, 0x8d, 0x8e};
+static const u8 pidff_block_load_status[] = { 0x8c, 0x8d, 0x8e };
 
 #define PID_EFFECT_START	0
 #define PID_EFFECT_STOP		1
@@ -242,6 +242,62 @@ static int pidff_is_effect_conditional(struct ff_effect *effect)
 	       effect->type == FF_FRICTION;
 }
 
+/*
+ * Get PID effect index from FF effect type.
+ * Return 0 if invalid.
+ */
+static int pidff_effect_ff_to_pid(struct ff_effect *effect)
+{
+	switch (effect->type) {
+	case FF_CONSTANT:
+		return PID_CONSTANT;
+	case FF_RAMP:
+		return PID_RAMP;
+	case FF_SPRING:
+		return PID_SPRING;
+	case FF_DAMPER:
+		return PID_DAMPER;
+	case FF_INERTIA:
+		return PID_INERTIA;
+	case FF_FRICTION:
+		return PID_FRICTION;
+	case FF_PERIODIC:
+		switch (effect->u.periodic.waveform) {
+		case FF_SQUARE:
+			return PID_SQUARE;
+		case FF_TRIANGLE:
+			return PID_TRIANGLE;
+		case FF_SINE:
+			return PID_SINE;
+		case FF_SAW_UP:
+			return PID_SAW_UP;
+		case FF_SAW_DOWN:
+			return PID_SAW_DOWN;
+		}
+	}
+	pr_err("invalid effect type\n");
+	return -EINVAL;
+}
+
+/*
+ * Get effect id in the device descriptor.
+ * Return 0 if invalid.
+ */
+static int pidff_get_effect_type_id(struct pidff_device *pidff,
+				    struct ff_effect *effect)
+{
+	int id = pidff_effect_ff_to_pid(effect);
+
+	if (id < 0)
+		return 0;
+
+	if (effect->type == FF_PERIODIC &&
+	    pidff->quirks & HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY)
+		id = PID_SINE;
+
+	return pidff->type_id[id];
+}
+
 /*
  * Clamp value for a given field
  */
@@ -387,12 +443,12 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 			pidff->set_envelope[PID_FADE_LEVEL].field);
 
 	pidff_set_time(&pidff->set_envelope[PID_ATTACK_TIME],
-			envelope->attack_length);
+		       envelope->attack_length);
 	pidff_set_time(&pidff->set_envelope[PID_FADE_TIME],
-			envelope->fade_length);
+		       envelope->fade_length);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_ENVELOPE],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -401,7 +457,7 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
-	bool needs_new_envelope;
+	int needs_new_envelope;
 
 	needs_new_envelope = envelope->attack_level  != 0 ||
 			     envelope->fade_level    != 0 ||
@@ -409,8 +465,7 @@ static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 			     envelope->fade_length   != 0;
 
 	if (!needs_new_envelope)
-		return false;
-
+		return 0;
 	if (!old)
 		return needs_new_envelope;
 
@@ -423,8 +478,8 @@ static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 /*
  * Send constant force report to the device
  */
-static void pidff_set_constant_force_report(struct pidff_device *pidff,
-					    struct ff_effect *effect)
+static void pidff_set_constant_report(struct pidff_device *pidff,
+				      struct ff_effect *effect)
 {
 	pidff->set_constant[PID_EFFECT_BLOCK_INDEX].value[0] =
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
@@ -432,7 +487,7 @@ static void pidff_set_constant_force_report(struct pidff_device *pidff,
 			 effect->u.constant.level);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_CONSTANT],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -583,8 +638,8 @@ static int pidff_needs_set_condition(struct ff_effect *effect,
 /*
  * Send ramp force report to the device
  */
-static void pidff_set_ramp_force_report(struct pidff_device *pidff,
-					struct ff_effect *effect)
+static void pidff_set_ramp_report(struct pidff_device *pidff,
+				  struct ff_effect *effect)
 {
 	pidff->set_ramp[PID_EFFECT_BLOCK_INDEX].value[0] =
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
@@ -593,7 +648,7 @@ static void pidff_set_ramp_force_report(struct pidff_device *pidff,
 	pidff_set_signed(&pidff->set_ramp[PID_RAMP_END],
 			 effect->u.ramp.end_level);
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_RAMP],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -703,9 +758,6 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 {
 	int j;
 
-	if (!pidff->effect_count)
-		pidff_reset(pidff);
-
 	pidff->create_new_effect_type->value[0] = efnum;
 	hid_hw_request(pidff->hid, pidff->reports[PID_CREATE_NEW_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -725,8 +777,6 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 			hid_dbg(pidff->hid, "device reported free memory: %d bytes\n",
 				 pidff->block_load[PID_RAM_POOL_AVAILABLE].value ?
 				 pidff->block_load[PID_RAM_POOL_AVAILABLE].value[0] : -1);
-
-			pidff->effect_count++;
 			return 0;
 		}
 		if (pidff->block_load_status->value[0] ==
@@ -767,7 +817,7 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 	}
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_EFFECT_OPERATION],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -791,10 +841,7 @@ static void pidff_erase_pid(struct pidff_device *pidff, int pid_id)
 {
 	pidff->block_free[PID_EFFECT_BLOCK_INDEX].value[0] = pid_id;
 	hid_hw_request(pidff->hid, pidff->reports[PID_BLOCK_FREE],
-			HID_REQ_SET_REPORT);
-
-	if (pidff->effect_count > 0)
-		pidff->effect_count--;
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -816,139 +863,79 @@ static int pidff_erase_effect(struct input_dev *dev, int effect_id)
 	pidff_playback_pid(pidff, pid_id, 0);
 	pidff_erase_pid(pidff, pid_id);
 
+	if (pidff->effect_count > 0)
+		pidff->effect_count--;
+
+	hid_dbg(pidff->hid, "current effect count: %d", pidff->effect_count);
 	return 0;
 }
 
+#define PIDFF_SET_REPORT_IF_NEEDED(type, effect, old) \
+	({ if (!old || pidff_needs_set_## type(effect, old)) \
+		pidff_set_ ##type## _report(pidff, effect); })
+
+#define PIDFF_SET_ENVELOPE_IF_NEEDED(type, effect, old) \
+	({ if (pidff_needs_set_envelope(&effect->u.type.envelope, \
+	       old ? &old->u.type.envelope : NULL)) \
+		pidff_set_envelope_report(pidff, &effect->u.type.envelope); })
+
 /*
  * Effect upload handler
  */
-static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
+static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *new,
 			       struct ff_effect *old)
 {
 	struct pidff_device *pidff = dev->ff->private;
-	int type_id;
-	int error;
+	const int type_id = pidff_get_effect_type_id(pidff, new);
 
-	pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] = 0;
-	if (old) {
-		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] =
-			pidff->pid_id[effect->id];
+	if (!type_id) {
+		hid_err(pidff->hid, "effect type not supported\n");
+		return -EINVAL;
 	}
 
-	switch (effect->type) {
+	if (!pidff->effect_count)
+		pidff_reset(pidff);
+
+	if (!old) {
+		int error = pidff_request_effect_upload(pidff, type_id);
+
+		if (error)
+			return error;
+
+		pidff->effect_count++;
+		hid_dbg(pidff->hid, "current effect count: %d", pidff->effect_count);
+		pidff->pid_id[new->id] =
+			pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
+	}
+
+	pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] =
+		pidff->pid_id[new->id];
+
+	PIDFF_SET_REPORT_IF_NEEDED(effect, new, old);
+	switch (new->type) {
 	case FF_CONSTANT:
-		if (!old) {
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_CONSTANT]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_constant(effect, old))
-			pidff_set_constant_force_report(pidff, effect);
-		if (pidff_needs_set_envelope(&effect->u.constant.envelope,
-					old ? &old->u.constant.envelope : NULL))
-			pidff_set_envelope_report(pidff, &effect->u.constant.envelope);
+		PIDFF_SET_REPORT_IF_NEEDED(constant, new, old);
+		PIDFF_SET_ENVELOPE_IF_NEEDED(constant, new, old);
 		break;
 
 	case FF_PERIODIC:
-		if (!old) {
-			switch (effect->u.periodic.waveform) {
-			case FF_SQUARE:
-				type_id = PID_SQUARE;
-				break;
-			case FF_TRIANGLE:
-				type_id = PID_TRIANGLE;
-				break;
-			case FF_SINE:
-				type_id = PID_SINE;
-				break;
-			case FF_SAW_UP:
-				type_id = PID_SAW_UP;
-				break;
-			case FF_SAW_DOWN:
-				type_id = PID_SAW_DOWN;
-				break;
-			default:
-				hid_err(pidff->hid, "invalid waveform\n");
-				return -EINVAL;
-			}
-
-			if (pidff->quirks & HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY)
-				type_id = PID_SINE;
-
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[type_id]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_periodic(effect, old))
-			pidff_set_periodic_report(pidff, effect);
-		if (pidff_needs_set_envelope(&effect->u.periodic.envelope,
-					old ? &old->u.periodic.envelope : NULL))
-			pidff_set_envelope_report(pidff, &effect->u.periodic.envelope);
+		PIDFF_SET_REPORT_IF_NEEDED(periodic, new, old);
+		PIDFF_SET_ENVELOPE_IF_NEEDED(periodic, new, old);
 		break;
 
 	case FF_RAMP:
-		if (!old) {
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[PID_RAMP]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_ramp(effect, old))
-			pidff_set_ramp_force_report(pidff, effect);
-		if (pidff_needs_set_envelope(&effect->u.ramp.envelope,
-					old ? &old->u.ramp.envelope : NULL))
-			pidff_set_envelope_report(pidff, &effect->u.ramp.envelope);
+		PIDFF_SET_REPORT_IF_NEEDED(ramp, new, old);
+		PIDFF_SET_ENVELOPE_IF_NEEDED(ramp, new, old);
 		break;
 
 	case FF_SPRING:
 	case FF_DAMPER:
 	case FF_INERTIA:
 	case FF_FRICTION:
-		if (!old) {
-			switch (effect->type) {
-			case FF_SPRING:
-				type_id = PID_SPRING;
-				break;
-			case FF_DAMPER:
-				type_id = PID_DAMPER;
-				break;
-			case FF_INERTIA:
-				type_id = PID_INERTIA;
-				break;
-			case FF_FRICTION:
-				type_id = PID_FRICTION;
-				break;
-			}
-			error = pidff_request_effect_upload(pidff,
-					pidff->type_id[type_id]);
-			if (error)
-				return error;
-		}
-		if (!old || pidff_needs_set_effect(effect, old))
-			pidff_set_effect_report(pidff, effect);
-		if (!old || pidff_needs_set_condition(effect, old))
-			pidff_set_condition_report(pidff, effect);
+		PIDFF_SET_REPORT_IF_NEEDED(condition, new, old);
 		break;
-
-	default:
-		hid_err(pidff->hid, "invalid type\n");
-		return -EINVAL;
 	}
-
-	if (!old)
-		pidff->pid_id[effect->id] =
-		    pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
-
 	hid_dbg(pidff->hid, "uploaded\n");
-
 	return 0;
 }
 
-- 
2.50.1


