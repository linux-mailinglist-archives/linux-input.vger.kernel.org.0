Return-Path: <linux-input+bounces-13988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D572B25466
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8362F9A6CA5
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09321A9F9D;
	Wed, 13 Aug 2025 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBkmiDi8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950D2FD7D9
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115818; cv=none; b=ItS0JrIMchDTStm0uCHTa2MUKTxv813uSZEpqowY8Q61Xc6XthhK/+jestWkCC5eBDlqKhenQANbMMlRE8jYf5z0tcmrV782dq0s8dRq/yK1jy1JD1R3IQN4Q15OA2wSSOtYfjR1Lg4sTGjMVY0Z06ll8n4QTPTMqhebznwOCRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115818; c=relaxed/simple;
	bh=iEefw58dTjOLDc9LmVjly6bYNwWVitEkzAsmOoqEf8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBs4thWCkDp24Y/RZiUKf1OxfsX02L7fXJWRscrg2xU5Cd1kudvjTWfaf678j+uwDvaJ2tPD4W8I5XQfRHcGcT4F2WcGGysn5b14fjtsspBZIe5qDKdFTwbAzX3+4pzozi8rzbXWxIdN9FULcURICYvklsD/8+X72lSX85HTcr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBkmiDi8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7322aa0so3047166b.0
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115815; x=1755720615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1nUT+E5jGxyff1Y6y8RNJPxDE6Ojaw5b70nEDGUEi8=;
        b=CBkmiDi8R9XXqhLRypvzJeJ6nzP2eE2vzH7/XKPAYRBvZy+a1zGTqXJenfSEdpLC7b
         FjxQy+Qbqa3dbdCeTOrH1yhT9jW7hNcdh02vRQ5o7gkh7OXPLzWRtJzpHS7r7lh7DyJL
         dU1eCg0JSWGKLcTNbgicTgt1kAe0tJSUKE26FSYEymx2Xq9YvtQkpYNTou8HG7Sw7l3J
         +9i60YcLc2FbvEB0NwFpwNA8krA41+BPuJvN04LAVC1RnKw2WJpFFEVkpPcq23eQurJs
         xkvbLhNTogtToVhbt5tpRQvGKuf/ByzoKh1TS4dnu4evEOdzyR6l1r1mVvcRvDs8+/zU
         uG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115815; x=1755720615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1nUT+E5jGxyff1Y6y8RNJPxDE6Ojaw5b70nEDGUEi8=;
        b=CfDrH0RaKCxtfgJu246ZqDhFA4K08Ev2XGyc5b6QOxFG/zyA+Wq5ge2djAGuxgiGkg
         oO3c+0YW6KSsuA+lr78XxtDa/WGfqF6Jfcw03k/kgQO+HlnHzj3A9l/zBlAzU31rQHX7
         5B9PpDcEhuAavuywnEqtdcI6bRe+Y+EVwKpGuL1nSl9jvuMaykrBpaJMWdTgqcZxoWbo
         IwqlLp18LuwaTaqwYHHkwiEw3K9lhESdFTu5gMU+zUKCX3mGEJxt73ovQpwzDGBze5zH
         KZBqfv9DHge0Ge1LVYjgmtSgrcn0Su46/udxYa46xFbThAddmbezaQ8mjYiTecQFSKm4
         D7ug==
X-Forwarded-Encrypted: i=1; AJvYcCXnUnN1nQK7vInZsedF42rID3AnpHQ4AbhYRXgsoRmbCREHa4nGOemYW9uN/+RdXT04sJD1WEB0Tb+aLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7CTjaLxZ1qRwjY2EBBKqbsnDI9sfQK/1cG6ghgTbi6jXNqxhm
	jeeSlCOuKJajvbeYRXICzn64nqJsIEQIA4OQ4Log/bESphGxV93G3qpR/OaclA==
X-Gm-Gg: ASbGnctAip4JLq2uSTtApNNe+yGcZwUvWu3kHCL+27itc5uq8u2MoWTMR49U6rblvpC
	g/WAGa7yi8CJA/GTXMkmflrp+nbAtg3gAvosThNj5fq94ye7DLNl5jldtY+/iZB+Zu1BlNeml96
	/tEPt4J3863WHkaIY4ROIxslZ/Ricjy7cEnwTwF+qTL/AUbk9ue1WjVnd8KEPYZVFXwbfprbvLB
	wYxNytYLvGAJkw17OTMJSkzoyQOWEEaKmfKPbR3kr53CaStKjA4Nbvee3BegDWgqpspxA4hZwm3
	Dzid8+bslBmnMxd5WvaULsh5gsnikwiyC8OxFn5Ykx1UNdLrZTz8P1xMwtdDS5yoV/rYBX5Gctz
	di4dHftnMoTxxZJ5jY5qWeg9+EQ7rju8WeHmhrL2M9GrtYmrtuezYSRBczFaBTLbjNaluG06cpv
	c=
X-Google-Smtp-Source: AGHT+IErFgAolNvLBLTTIBRP1Lpx79yeOXU2tvqagLYvoMQ20D8h+ZCUdZ/pMV6ggblN8zDpa5/LQQ==
X-Received: by 2002:a17:907:9494:b0:ae6:dab3:7037 with SMTP id a640c23a62f3a-afca4e63912mr173103766b.8.1755115815042;
        Wed, 13 Aug 2025 13:10:15 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:14 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 10/17] HID: pidff: Rework pidff_upload_effect
Date: Wed, 13 Aug 2025 22:09:58 +0200
Message-ID: <20250813201005.17819-11-tomasz.pakula.oficjalny@gmail.com>
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


