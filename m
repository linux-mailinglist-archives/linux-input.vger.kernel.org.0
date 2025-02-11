Return-Path: <linux-input+bounces-9960-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73568A30E71
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D0471679BB
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C91250BF5;
	Tue, 11 Feb 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeZeXkwV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C295A250C03;
	Tue, 11 Feb 2025 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284526; cv=none; b=pV9jf6bNPstwLofbA0DCfK7guY9txawmUvH790QhB1Ohn+FrwNhx54Bi+P1jwwbUS2tSul5e6yuIYpEVVGU7qS020tkq8f9ggfs5vY/EMDYFZEE2kXBYp+/Ex5tG82JvzUl3i2gnmfkYFTO4Y74cFAHgo8x3IfvbmbLYR6htmZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284526; c=relaxed/simple;
	bh=M9WPL+4kweCWgWjygIKmUoc1um6eqqxRR5AeEaAqTc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y1Ftb1nTQCx45y/24FgubOXVmNULWof29sRIIwQ66FDCWIif/8zkQv/KhwrmfaQns5b6w2KNCRBY+uuRJ+iLQemh+9OhG4a70X47fxfrODs7OEEG4/eAebF0SPu+eT8V/FklMXGqPh1aQk9dDkc6BUWhFh2Dhen5CvyNmlSgqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeZeXkwV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-307e4ac2eb5so3950571fa.2;
        Tue, 11 Feb 2025 06:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739284523; x=1739889323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKCqqk95xHc52Uxa1Lo1nVI5gf0jsVsMcqbVtjY5cOI=;
        b=VeZeXkwVpvUtNKwD/bdoBuoeiNtEWJ73e9GdTku5rawPdT6hGzc8tyXdqfEaaGyEzF
         jpEVQ4vLcQrKLU3LGq2YkHoeopdMwb2EW8EVf3wSTFDZQoCRxCdk1RgzknDi+y/A1T7F
         ZxDa3jjQ8alXXzaVB8xhUjkgjp19riztM8LmmaRokKDv+3HnsWEQGNYQkzK9xkcwdQdK
         Qb911cAVL9cckQCKtA2PtJmUXMMhxrtNII5rQIOoq9QAXY0nazBqbA62nhHv3BL/FnI0
         IPLtFsjjD6zczg8w3wJXC17VzZpjyfHt1h3RUahx7lz20KZaUjMug4TdU3Tzeod5REt+
         PpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284523; x=1739889323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKCqqk95xHc52Uxa1Lo1nVI5gf0jsVsMcqbVtjY5cOI=;
        b=TLPThVng3rgYv8gUnGGZbYTK4cJ+uI8yO4bEKQnmc1gzu0c4ePjekQauhMabCJgZc1
         hkGqgmQT9puInEffO/U8kSuvshVGBU9eqv8oGnFdgktEtXJzDCIVka8TvYsOBcXt05bz
         N/TxYhX/pto9gVDYVMAGhXXIZwYH5wgM18qJQgnM5PxwBE1/DwsLzYSciioqa4Q7M7X2
         qyHNxyGiSZTTfgXzb3cHCAV7Oeg/lmzWDURMgowz9UAbf6Q1eZz25LkxHFXTbAjJZhOm
         YTYT6JRPSiEjm2JwZtrt/NKaOqL+ULqo8uCE0SdDSsiRYSpNUYutMOoCtU64Gt8dK2/w
         c2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiQVFt3cNVGARlfHIJti35tVzuo58F/4tJU1n10eRWZXHjgddb6/zlqsHbpTc9Q63uP7iA37m3VgiRzw==@vger.kernel.org, AJvYcCXa30Guijd17YRP+LmNwtbu3VifMSZXRAiWZDSCs9YV+jwUJLf5usfhboDh/IqIKdEx9QolADbJ71HP@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMGHnf7uscqNEQvUAZqsEAvWOATJeDplKirRpnXOB7n7mWZxQ
	hQONv0JgoMD6Ez39a0cX4oNJKVx4wHDksIkefD2Ct9uVIbqZpVW+Hw/SAKdq
X-Gm-Gg: ASbGncuvJK8GQAvO/FjymbpY4R9dz5kGs078Gfvwd6doCo2ZxkcXTb/uC7Egpqn/BNt
	f7OPfmrBdZrW26/54RjEadX+Q68MAlR0iUikz+c70TJH6sfg8vQ/zmg7JiPa+M7q0aDqC7VhSsd
	ZuH/jM8l7fYa8Y7yhBcCxsVAOynejGgfXXLM4N21xmnZ0Qp9+akmRnv9bnlCj5c250q5kxp9hzN
	tGGfu79o+z8C47JBYA/rV89IaJWMjBTRV164dEzN0QdKM4Gnv/5Wf4kMeFivVsdmEDr05bJ5NIQ
	x0KAY/Rhefs3A7pD5lGVkLkCQQKr61Yz1dbOZW6Ci/mQG9olUhvHQMLEygADpg==
X-Google-Smtp-Source: AGHT+IE3oQH8niAPreLtPjMpq9e9pcp5fjXC09dFFTz6Xk/POjcSvz0J2qP29sZYVkazN/pKrNeBOw==
X-Received: by 2002:a05:651c:2104:b0:308:f0c9:c4ce with SMTP id 38308e7fff4ca-308fbe168aemr3733051fa.2.1739284522508;
        Tue, 11 Feb 2025 06:35:22 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ee4173edsm6132191fa.0.2025.02.11.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:35:21 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 4/6] HID: pidff: Comment and code style update
Date: Tue, 11 Feb 2025 15:35:10 +0100
Message-ID: <20250211143512.720818-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update comments to fully conform to the Linux comment styling.
Define Linux infinite effect duration (0) as FF_INFINITE

Chanage Oleg's name order

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 57 +++++++++++++++-------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 503f643b59ca..e2508a4d754d 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -3,13 +3,9 @@
  *  Force feedback driver for USB HID PID compliant devices
  *
  *  Copyright (c) 2005, 2006 Anssi Hannula <anssi.hannula@gmail.com>
+ *  Upgraded 2025 by Oleg Makarenko and Tomasz Pakuła
  */
 
-/*
- */
-
-/* #define DEBUG */
-
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include "hid-pidff.h"
@@ -25,9 +21,9 @@
 
 /* Linux Force Feedback API uses miliseconds as time unit */
 #define FF_TIME_EXPONENT	-3
+#define FF_INFINITE		0
 
 /* Report usage table used to put reports into an array */
-
 #define PID_SET_EFFECT		0
 #define PID_EFFECT_OPERATION	1
 #define PID_DEVICE_GAIN		2
@@ -48,12 +44,12 @@ static const u8 pidff_reports[] = {
 	0x21, 0x77, 0x7d, 0x7f, 0x89, 0x90, 0x96, 0xab,
 	0x5a, 0x5f, 0x6e, 0x73, 0x74
 };
-
-/* device_control is really 0x95, but 0x96 specified as it is the usage of
-the only field in that report */
+/*
+ * device_control is really 0x95, but 0x96 specified
+ * as it is the usage of the only field in that report.
+ */
 
 /* PID special fields */
-
 #define PID_EFFECT_TYPE			0x25
 #define PID_DIRECTION			0x57
 #define PID_EFFECT_OPERATION_ARRAY	0x78
@@ -61,7 +57,6 @@ the only field in that report */
 #define PID_DEVICE_CONTROL_ARRAY	0x96
 
 /* Value usage tables used to put fields and values into arrays */
-
 #define PID_EFFECT_BLOCK_INDEX	0
 
 #define PID_DURATION		1
@@ -119,7 +114,6 @@ static const u8 pidff_device_gain[] = { 0x7e };
 static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 
 /* Special field key tables used to put special field keys into arrays */
-
 #define PID_ENABLE_ACTUATORS	0
 #define PID_DISABLE_ACTUATORS	1
 #define PID_STOP_ALL_EFFECTS	2
@@ -176,8 +170,10 @@ struct pidff_device {
 	struct pidff_usage effect_operation[sizeof(pidff_effect_operation)];
 	struct pidff_usage block_free[sizeof(pidff_block_free)];
 
-	/* Special field is a field that is not composed of
-	   usage<->value pairs that pidff_usage values are */
+	/*
+	 * Special field is a field that is not composed of
+	 * usage<->value pairs that pidff_usage values are
+	 */
 
 	/* Special field in create_new_effect */
 	struct hid_field *create_new_effect_type;
@@ -222,7 +218,7 @@ static s32 pidff_clamp(s32 i, struct hid_field *field)
 static int pidff_rescale(int i, int max, struct hid_field *field)
 {
 	return i * (field->logical_maximum - field->logical_minimum) / max +
-	    field->logical_minimum;
+		field->logical_minimum;
 }
 
 /*
@@ -282,9 +278,8 @@ static void pidff_set_time(struct pidff_usage *usage, u16 time)
 
 static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
 {
-	/* Convert infinite length from Linux API (0)
-	   to PID standard (NULL) if needed */
-	if (duration == 0)
+	/* Infinite value conversion from Linux API -> PID */
+	if (duration == FF_INFINITE)
 		duration = PID_INFINITE;
 
 	if (duration == PID_INFINITE) {
@@ -302,16 +297,16 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 				      struct ff_envelope *envelope)
 {
 	pidff->set_envelope[PID_EFFECT_BLOCK_INDEX].value[0] =
-	    pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
+		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 
 	pidff->set_envelope[PID_ATTACK_LEVEL].value[0] =
-	    pidff_rescale(envelope->attack_level >
-			  S16_MAX ? S16_MAX : envelope->attack_level, S16_MAX,
-			  pidff->set_envelope[PID_ATTACK_LEVEL].field);
+		pidff_rescale(envelope->attack_level >
+			S16_MAX ? S16_MAX : envelope->attack_level, S16_MAX,
+			pidff->set_envelope[PID_ATTACK_LEVEL].field);
 	pidff->set_envelope[PID_FADE_LEVEL].value[0] =
-	    pidff_rescale(envelope->fade_level >
-			  S16_MAX ? S16_MAX : envelope->fade_level, S16_MAX,
-			  pidff->set_envelope[PID_FADE_LEVEL].field);
+		pidff_rescale(envelope->fade_level >
+			S16_MAX ? S16_MAX : envelope->fade_level, S16_MAX,
+			pidff->set_envelope[PID_FADE_LEVEL].field);
 
 	pidff_set_time(&pidff->set_envelope[PID_ATTACK_TIME],
 			envelope->attack_length);
@@ -702,9 +697,7 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct pidff_device *pidff = dev->ff->private;
-
 	pidff_playback_pid(pidff, pidff->pid_id[effect_id], value);
-
 	return 0;
 }
 
@@ -732,8 +725,11 @@ static int pidff_erase_effect(struct input_dev *dev, int effect_id)
 
 	hid_dbg(pidff->hid, "starting to erase %d/%d\n",
 		effect_id, pidff->pid_id[effect_id]);
-	/* Wait for the queue to clear. We do not want a full fifo to
-	   prevent the effect removal. */
+
+	/*
+	 * Wait for the queue to clear. We do not want
+	 * a full fifo to prevent the effect removal.
+	 */
 	hid_hw_wait(pidff->hid);
 	pidff_playback_pid(pidff, pid_id, 0);
 	pidff_erase_pid(pidff, pid_id);
@@ -1239,7 +1235,6 @@ static int pidff_find_effects(struct pidff_device *pidff,
 		set_bit(FF_FRICTION, dev->ffbit);
 
 	return 0;
-
 }
 
 #define PIDFF_FIND_FIELDS(name, report, strict) \
@@ -1370,12 +1365,10 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 		hid_notice(pidff->hid,
 			   "device has unknown autocenter control method\n");
 	}
-
 	pidff_erase_pid(pidff,
 			pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0]);
 
 	return 0;
-
 }
 
 /*
-- 
2.48.1


