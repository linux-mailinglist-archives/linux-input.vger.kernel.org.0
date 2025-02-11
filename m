Return-Path: <linux-input+bounces-9953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2561A30D9B
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D935188A450
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AA424C698;
	Tue, 11 Feb 2025 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFELzzVa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED3224CECB;
	Tue, 11 Feb 2025 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282589; cv=none; b=ohTc9OAeNtAjXdUMF8SJeO9wC+pN5S+gDFtRv700vBIVrV1zlvKo92XpL+eONsF+eqe+xnzAg9T9jU+uB+/r1eQbSebfw74juL0RUYwdBuJ3AobMFuj5snQ/yXErO4FF47Emzp/IDojOzXUJAdueBSWH1HxBT09v75MChnBnrok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282589; c=relaxed/simple;
	bh=M9WPL+4kweCWgWjygIKmUoc1um6eqqxRR5AeEaAqTc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YigWfi8tIDXUZ6oSzRgzG57yKNT+wi5TUQVIoXW+8mZaaQkmplya4YmI40M6/KXdnJledaXZRFHr4HgcuvPdOjG55CtwF7WY45prwZTDdHRE+q7170OF1qWNs1mn2cwQ8KwCQ8baVWAZkOFVkdIyHmoAWokGsRKP0nPd4MlKZRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFELzzVa; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54500ad66a6so488731e87.2;
        Tue, 11 Feb 2025 06:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739282586; x=1739887386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKCqqk95xHc52Uxa1Lo1nVI5gf0jsVsMcqbVtjY5cOI=;
        b=UFELzzVaN3IOKhC76bFjvnz5NjASzWXNxe1O+b1ZsT5SzXXEXRNBVRyhHFiCdD+g8L
         8OhyrR7sTB6wZ0kkujyR72m9eCRU/7hRO9WlrQkhBYgIu8+cthdDWkLvT0LxwfUSTjUe
         KaheZDV003fa26CJDXxeXz5rQFW8PIyUKWNFaTBSCGRT6hBqardgbzOXn6yJL6oniRDI
         PvzlaRNTOpQxoLgV1Dqrq08kvPbq2cDf+23G+Pwj4fStzId2PeoeiBqqnXgVfauuYged
         rKid/J2od0cU3ZwodiPIOzNvO7MSu8mAB32AO89rDSni1WNvPLDy9K9Y9OAG5gpMVeEQ
         0Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282586; x=1739887386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKCqqk95xHc52Uxa1Lo1nVI5gf0jsVsMcqbVtjY5cOI=;
        b=jY7gNKSyAs9K/mcwzdut+++GQ37+jRbMz1cLhL5DO/9DuVJOMCI5mXO78pHSl72/f1
         9h4wikja6P+v4WaR4phDugmIhDIMnFXlPm9UtNYB/7qCpBe4jZfGd4edQ62sDttMTbM5
         b2uFq0CpZ5CyEdYGZZ4/Bz+mx0BNMbvfOi45zk0UpCJ4HpD9DZQkXbm+9sT/WYEu9Nsi
         Y//6wIdpEeS5iv/SWHx3g9Ze3VsbKmqcaqcH6NW0XBCS76L9SUFJOjz+tYy+WkEcybUj
         2ZZUOPpG31vDrUo2x2KKLT3/QM3unE54Adm/P0UDQel7hmg/+UDIJ18L/I0FPtkmpmCp
         +jkA==
X-Forwarded-Encrypted: i=1; AJvYcCUyD9Bv2AUGofo9w9nVvGtFyxBApMvwzbgGI3lnK39bDeRnxrnEPjEVrVFuNB59xQCLsKf0JaRiefldqQ==@vger.kernel.org, AJvYcCX2uyK2QSl/Ca0luKYsnYY8QLQaCUU6DbH+kL5l88BZnJ0fGBSDC17FdpOe/+hfcGJe4zF8V0ZF6YFK@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxqyWrH1v7c9wTuSiqCICa3qpOfzVvuJVjCreUsT7/25WvFTX
	Jqp9kEPgLpIAX5zcVG1MQPM7m+NqN4ybDsgXiR6IMXYjeAihAET7wp+FdehT
X-Gm-Gg: ASbGncuE6Lw0BT9TAvmsEDHOUcykol3blVExgy+0fNXm5drClISgOd0x4i6cASsrw6y
	m6Ap0tHtnPXBlBD68jW3xHyxHseOqU+bbahlYLLDZ2IVaK39krecjof411PgaXB9nioz49WB37G
	e/AgTFvNtBR6WtdbLkPW9ER5Uu5PMUS8rOfdZI/WodS6sJ72taZlmfx9tgonnadOHlBPM+KjZtA
	iJWRJ8GILCMlRqOD0XWr2o4T3o5KnYPrnpzL0QqBv4VUER0yKj8fior7xn7/dEprMIJ3ELf9Kac
	XZGsg49MhpJpPmd5yn7M/WfUTyYpnewCned4isqSHzbM9s/bkRG87QGnWW8Qrw==
X-Google-Smtp-Source: AGHT+IHdCwDL85Br2dEHipAgPQz8thvJhxpwPHgl80tQ7iQPP0je9N++sloiHPJq15WQGfczfpVEAw==
X-Received: by 2002:a05:6512:344a:b0:545:d54:2eb4 with SMTP id 2adb3069b0e04-54513b38d26mr238140e87.8.1739282585589;
        Tue, 11 Feb 2025 06:03:05 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545014af0d0sm1118721e87.184.2025.02.11.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:03:04 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 4/6] HID: pidff: Comment and code style update
Date: Tue, 11 Feb 2025 15:02:50 +0100
Message-ID: <20250211140252.702104-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
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


