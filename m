Return-Path: <linux-input+bounces-9907-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B081A2F149
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C04618843D4
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 15:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E0B237A4D;
	Mon, 10 Feb 2025 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+4ZXQ1h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B918123644F;
	Mon, 10 Feb 2025 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200687; cv=none; b=W6aYHpRO2RSsXamGuQUZ7116KFx2+MoSAsT5Ly0y6HIH5/5nTTweO9yOrKlTq+1nJ9XUYEiUrYKiBrvxqN4DWUzaErsIqbkrZIetvnRwmSy/zccDG5+yjKLgqbs99LRf6b/f5wcPWNV56E7gYVlAM5/P1GGUAT8c5A90lNZqbXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200687; c=relaxed/simple;
	bh=nRxBurmjnHMw/vGUDVP2wxHK689v5mHBzLyMoF6QbWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HQXH4y8+ZzbIuwROaMf//SCdiqazC/5BCt5vjLZRmv4fg+Po77BqXimf+EoSq3UHvEOQUPhLJK5f2HXoZ/XE7LNpBlN6PPjJ/l8XA9DCNx0iTyacG/7of0TN7LRIOUbfoqvTMSU1EP/dZ2y6dFI9qqhcR4MdyzWWRn4BsD/s4Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+4ZXQ1h; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-308f3dbd305so592471fa.2;
        Mon, 10 Feb 2025 07:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200684; x=1739805484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho1EtQ9JOBrhdEuIqqTI0cLqNwBpcXX1NGZ9DVyoA84=;
        b=U+4ZXQ1hxkzZvavFKpt09V+g56X+lhBzLKdkmLTuX6KN1OEtIfQaX5KJhZQfgVOAUy
         FVjuRFT1+HMiQVgvJY3JiUCFyjFydAfGVt/rKH1a+1w3FJF06hoh21Pe6ROlxG3cE+SA
         tVwFb6TW6F3JJnnm8VkVHBcSsByeWSobTYAys0WR/+K3DJiCmuY4bqe3zuiCZPF7u0c5
         pUdbbC7ixag0oCUxy/GNeaExLzxUSAhywrjZD6xB/sKJQ1gsLy+kQiFQSLXwo0siOGhd
         +NBqoEeTWqN7ZpgbfGoy7asvnryHWUta8C2QGSoWHTFFO6nssUukKCRxQhTJacE5jTWi
         /PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200684; x=1739805484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ho1EtQ9JOBrhdEuIqqTI0cLqNwBpcXX1NGZ9DVyoA84=;
        b=ocOkSJ2x2MeDph5r6waKzrOBNKCWKndWXHTv6DL/68Z5oTpgLadJ2emx22c0t359RO
         xnzOsm20awlRfqCr2L/7lsmFoXIfvip5IhW2H7h1Ew0I3xvkZuu5LCknG50b3y/hsLhD
         EWY9mZkBD/TMhiyhaGDQPGeByVZEljxSoiG5yIjgdcQJKBZGAfX/SwZjZxoYaw8J88gq
         HMaOykK9cN6tqNcnftb4NTyWhGVTZFZZjDNBWx/ESHD9j13tOF3Fqv+0hCSdNKkpBjj0
         QNH8It7XS8vnsZDMiLkheFM1wAfvr/PWTpqpRX0O+9j0SWVdxn9sCp7/sGFb6HuPY3D8
         xOTg==
X-Forwarded-Encrypted: i=1; AJvYcCVMPFxBfzhQ4jyKq0YCn9Aqyx79zWxnfCu/Uw0B1WC50ai7sFAjnTOs9Zs0Ln6xCAWO0FN/eD9lH3hZiw==@vger.kernel.org, AJvYcCXDmGkT/ku5ql0//uJDsLFU5CCbY65mngy6N2zbDKAPrzoNNiQXK4ZPmhB7ZlTgmqzQ7HhNW1K4WOY4@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCPk4KDzZGOcFrjcr7YFoZz2WEti1GqZqMbMccf/hM9c/bwvr
	WPURC9KNCaMcQyAA1YHx+tfXyWrXgG+bgRr1Xk7ZW0psUFaLgECi
X-Gm-Gg: ASbGncvTY466qcqawHJyUxn5kWmTCzv2sN9RffaQbHK65yLb1j/HcAJZunBobdHmg1f
	UC4pcvByAOZlR4AsjGibToLcqP+KQ2rA0GdmAEmSWi2W+ejyjrnflD7suH39m38yL1yJ1u+JRK8
	55NRcZARLZ8W17D7MQsTyGI2G0LRxdlvOX2+NYXrn0DLak08un3o1UAelHnmXAlNbBe4ceceTAn
	dP6kTkwmYndf+jdfNUxThqGJz7u2NWn7WRYnbR5LHGhmVwGwDfDjcPZ2qk4ZWcbkLuB2u9EdpBM
	Du8VP99IRMGhyue5sRCPaX5yxlYQVhtJMs33lJuzoap1Gv4Cxo6Pico/zeN7gA==
X-Google-Smtp-Source: AGHT+IESjN9tf2UEjncowfb2iC8ZWGmrQrIN3tFDQ/5x1NSZpdcF+brb6I3JdEhP3xO7SVvHXCWJLQ==
X-Received: by 2002:a05:651c:198a:b0:308:f4cc:94fe with SMTP id 38308e7fff4ca-308f4cc9919mr2860831fa.7.1739200683536;
        Mon, 10 Feb 2025 07:18:03 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178201sm12090561fa.16.2025.02.10.07.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:18:03 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 4/6] HID: pidff: Comment and code style update
Date: Mon, 10 Feb 2025 16:17:52 +0100
Message-ID: <20250210151754.368530-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
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

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 57 +++++++++++++++-------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 503f643b59ca..fa9a98b7c28d 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -3,13 +3,9 @@
  *  Force feedback driver for USB HID PID compliant devices
  *
  *  Copyright (c) 2005, 2006 Anssi Hannula <anssi.hannula@gmail.com>
+ *  Upgraded 2025 by Makarenko Oleg and Tomasz Pakuła
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


