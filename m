Return-Path: <linux-input+bounces-13994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E2B25467
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 405BB5C084C
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C832FD7AB;
	Wed, 13 Aug 2025 20:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1YV0Ag9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D43C28FFD2
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115824; cv=none; b=peHTUcSb2m+UEbiXa/a7NM/0Wmsqd5nIQMcW3oOehAfTXH8w4Zp+IbnRvdpMP1hqtj2lfHnwGYnuo8lq838ta6/r+NPRgClQ+SZ2xVOh2+LgPgqm1bERkwi4J6ygBdfAGVdAVAHve3EWbOvLdmT8Qed6yui/6B/hOjjhI0TIdys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115824; c=relaxed/simple;
	bh=bMgwiiNLyRTPGgZvPsbMRGCiA+Op+h24JxUTGG3gxgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJti62jyRH1n2gwP+JoV6q4x9o88C75zBpQYOLqE0/b8Rk2yRd4PExTZrbqAQcxa4SE+7zSHPzY0VPdJhwAvQF3XbldnFRS4cavuBzppUszHrjNQjqbxFLsZA3YoB1vdZkM7E0gpExRq/ipVkZhWYyLYZBDKZ8T0m9BcRZQqzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1YV0Ag9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a01426so3221966b.2
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115820; x=1755720620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlKq1vVrMp+ea6ZNvvVgPvDYo89pz2+9NkIjrdarmTI=;
        b=L1YV0Ag9dIrUTLilz8GibTj21If19qJ5ASoV7v1LJpq6XZOjD0OXj2gCj1WIz3i7Fa
         Gosjft7ne5tKCNyBBlrdRl1FHn/BPIGfw3xJADJkcNOA3HT48GDbaneOLl4nfCyfIyht
         zqbO2vtV9Y9JIBULwsKPlx76TMbrAlBK3NK6AATSmFR5RVPYFaY/BEUq8tSIJmezGtTe
         Y0P1MnkW1P5/r88Gmf/U9a0E7UriZBKmmcmRyf3uFhx+bGsdeEbOpVC3RgqZfaEeSFak
         UVST9pfBZte4zO0d6Moqe7n90pIvfDVJPEkY/TRVTu9bDro1MiWMnVeEnVRcOLu26ost
         mRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115820; x=1755720620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlKq1vVrMp+ea6ZNvvVgPvDYo89pz2+9NkIjrdarmTI=;
        b=bHqRK9d6Vvs8JpRPXpjNfKoTfpjt8dmgU+XZD6nDlxyc12EVvHCbY1+CUDCDCtyTGx
         qxLRHdA6T0zYEiJkWSqDGOlMiicoBJ4PwCVOl3IY2MyogaUu4EzMAiols8qL3uxnQSPI
         RvhJbxLcyqzpTie3tM/f15sxBnhCU8v8JWpZb7JlAt137EV4td8Yn5q+RU8d2BQrgoqy
         kY9xpChgmFJQ/JWj6aaLAqdw5dTDGe/i+5CeR13MYCCdEWQgGAvVT5GW96UzySpBSzNe
         yQFSHQQ3ycxs38k1CUYjlZYMcdcJ2cgNnj5WBU6LY7R+Qdur7d4zdJ4o+H1qCcxCwtCU
         U37Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE9nTTz+iI58mKvuB2nmmBSHhHAo7W9ebr8K0uuz6mvWRahBTbht2YElACoFCY2daqor0fewlkcwq09A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlcL8U8QO6JuVkhtaa48LGMur6rNnYQQAbFI7WqqEf0fv+TBrh
	AVcWhWkXLJJsCM8weC5AZ7U1KMgidSxonkPCfDXr4l4R4nifFXcHNHBByNfPyw==
X-Gm-Gg: ASbGnctCR5M4xLhL6pDh8mW9/YcI+8tXOv3AZAR5VLSmeUgk/4eqia3wXyKnWLvfYAb
	RvJwjaSpdrDHQu+5M5INEMuQOTQjPfXO9b1nmmmcDMh1kGsEyu2692QXY0UzfCRjvGM3fTPGlWB
	DExx1cixdyMRzlajD/dbvRAY0uzv9TeqW2DEX5DEN8DwomXY7bxzx26QcUxbr4oKsbQUk9+Q0/h
	WeEaI84fUmnRsXfWEYeaCCI0PWkmrSkkJNTr/x6mWMaHGK9iSQk/1xJsIz6jd8uoCsJqB+jOX5W
	C1xqq+DFklXNj9cf/Lb325QD6vN1qfFwa1BAPsUH7KkXyRWANlo0ebdFtP9qwSsb+T13PIOYwlo
	MxJTV2lE0Hfqu6LN88jLY0UKiv9DRj5OE2wG0xBMjcf0c9mR4dIhKgLyClERaL7hO1V8fxm1fqJ
	A=
X-Google-Smtp-Source: AGHT+IH1RK2T5Ax7+86WGh2h3/pgQd9TiBX5E6u80/Zr9nywGKDVssfA8ljrueOvP3pn6oQjwPQ7Eg==
X-Received: by 2002:a17:907:6e8f:b0:adb:5985:5b58 with SMTP id a640c23a62f3a-afca4d33180mr175946166b.1.1755115820266;
        Wed, 13 Aug 2025 13:10:20 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:19 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 15/17] HID: pidff: clang-format pass
Date: Wed, 13 Aug 2025 22:10:03 +0200
Message-ID: <20250813201005.17819-16-tomasz.pakula.oficjalny@gmail.com>
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

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 55 ++++++++++++++++------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 7f4c1186a44d..50a8924edfcc 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -9,12 +9,11 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include "hid-pidff.h"
+#include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
-#include <linux/hid.h>
-#include <linux/minmax.h>
-
 
 #define	PID_EFFECTS_MAX		64
 #define	PID_INFINITE		U16_MAX
@@ -321,7 +320,7 @@ static s32 pidff_clamp(s32 i, struct hid_field *field)
 static int pidff_rescale(int i, int max, struct hid_field *field)
 {
 	return i * (field->logical_maximum - field->logical_minimum) / max +
-		field->logical_minimum;
+	       field->logical_minimum;
 }
 
 /*
@@ -367,18 +366,18 @@ static void pidff_set_signed(struct pidff_usage *usage, s16 value)
 	else {
 		if (value < 0)
 			usage->value[0] =
-			    pidff_rescale(-value, -S16_MIN, usage->field);
+				pidff_rescale(-value, -S16_MIN, usage->field);
 		else
 			usage->value[0] =
-			    pidff_rescale(value, S16_MAX, usage->field);
+				pidff_rescale(value, S16_MAX, usage->field);
 	}
 	pr_debug("calculated from %d to %d\n", value, usage->value[0]);
 }
 
 static void pidff_set_time(struct pidff_usage *usage, u16 time)
 {
-	usage->value[0] = pidff_clamp(
-		pidff_rescale_time(time, usage->field), usage->field);
+	usage->value[0] = pidff_clamp(pidff_rescale_time(time, usage->field),
+				      usage->field);
 }
 
 static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
@@ -516,11 +515,11 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->create_new_effect_type->value[0];
 
 	pidff_set_duration(&pidff->set_effect[PID_DURATION],
-		effect->replay.length);
+			   effect->replay.length);
 
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff_set_time(&pidff->set_effect[PID_TRIGGER_REPEAT_INT],
-			effect->trigger.interval);
+		       effect->trigger.interval);
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 
@@ -529,10 +528,10 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
 		pidff_set_time(&pidff->set_effect[PID_START_DELAY],
-				effect->replay.delay);
+			       effect->replay.delay);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -562,10 +561,10 @@ static void pidff_set_periodic_report(struct pidff_device *pidff,
 			 effect->u.periodic.offset);
 	pidff_set(&pidff->set_periodic[PID_PHASE], effect->u.periodic.phase);
 	pidff_set_time(&pidff->set_periodic[PID_PERIOD],
-			effect->u.periodic.period);
+		       effect->u.periodic.period);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_PERIODIC],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -612,7 +611,7 @@ static void pidff_set_condition_report(struct pidff_device *pidff,
 		pidff_set(&pidff->set_condition[PID_DEAD_BAND],
 			  effect->u.condition[i].deadband);
 		hid_hw_request(pidff->hid, pidff->reports[PID_SET_CONDITION],
-				HID_REQ_SET_REPORT);
+			       HID_REQ_SET_REPORT);
 	}
 }
 
@@ -675,7 +674,7 @@ static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
 
 	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
 	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -761,21 +760,19 @@ static void pidff_fetch_pool(struct pidff_device *pidff)
  */
 static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 {
-	int j;
-
 	pidff->create_new_effect_type->value[0] = efnum;
 	hid_hw_request(pidff->hid, pidff->reports[PID_CREATE_NEW_EFFECT],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 	hid_dbg(pidff->hid, "create_new_effect sent, type: %d\n", efnum);
 
 	pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] = 0;
 	pidff->block_load_status->value[0] = 0;
 	hid_hw_wait(pidff->hid);
 
-	for (j = 0; j < 60; j++) {
+	for (int i = 0; i < 60; i++) {
 		hid_dbg(pidff->hid, "pid_block_load requested\n");
 		hid_hw_request(pidff->hid, pidff->reports[PID_BLOCK_LOAD],
-				HID_REQ_GET_REPORT);
+			       HID_REQ_GET_REPORT);
 		hid_hw_wait(pidff->hid);
 		if (pidff->block_load_status->value[0] ==
 		    pidff->status_id[PID_BLOCK_LOAD_SUCCESS]) {
@@ -857,8 +854,8 @@ static int pidff_erase_effect(struct input_dev *dev, int effect_id)
 	struct pidff_device *pidff = dev->ff->private;
 	int pid_id = pidff->pid_id[effect_id];
 
-	hid_dbg(pidff->hid, "starting to erase %d/%d\n",
-		effect_id, pidff->pid_id[effect_id]);
+	hid_dbg(pidff->hid, "starting to erase %d/%d\n", effect_id,
+		pidff->pid_id[effect_id]);
 
 	/*
 	 * Wait for the queue to clear. We do not want
@@ -978,7 +975,7 @@ static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
 		pidff->set_effect[PID_START_DELAY].value[0] = 0;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
-			HID_REQ_SET_REPORT);
+		       HID_REQ_SET_REPORT);
 }
 
 /*
@@ -1269,7 +1266,7 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 
 	if (PIDFF_FIND_SPECIAL_KEYS(status_id, block_load_status,
 				    block_load_status) !=
-			ARRAY_SIZE(pidff_block_load_status)) {
+	    ARRAY_SIZE(pidff_block_load_status)) {
 		hid_err(pidff->hid,
 			"block load status identifiers not found\n");
 		return -1;
@@ -1277,7 +1274,7 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 
 	if (PIDFF_FIND_SPECIAL_KEYS(operation_id, effect_operation_status,
 				    effect_operation_status) !=
-			ARRAY_SIZE(pidff_effect_operation_status)) {
+	    ARRAY_SIZE(pidff_effect_operation_status)) {
 		hid_err(pidff->hid, "effect operation identifiers not found\n");
 		return -1;
 	}
@@ -1482,8 +1479,8 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 {
 	struct pidff_device *pidff;
-	struct hid_input *hidinput = list_entry(hid->inputs.next,
-						struct hid_input, list);
+	struct hid_input *hidinput =
+		list_entry(hid->inputs.next, struct hid_input, list);
 	struct input_dev *dev = hidinput->input;
 	struct ff_device *ff;
 	int max_effects;
@@ -1570,7 +1567,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 
 	return 0;
 
- fail:
+fail:
 	hid_device_io_stop(hid);
 
 	kfree(pidff);
-- 
2.50.1


