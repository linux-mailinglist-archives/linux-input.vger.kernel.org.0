Return-Path: <linux-input+bounces-13785-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B270B194C6
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E159173429
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BF61DF98D;
	Sun,  3 Aug 2025 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdvfzQNt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020241E500C
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244853; cv=none; b=QdD/XXVuOhPTiAeJJPP6fPCdaWRWa5NtSpBhtdQfF2NAomg6BXrKzu5q3mOUpVtZhZRWhMUi05EoM3ZJmcznwNeHHFZvFBOCLeztOyobLNLJc0aSx5QpXaIwX61EwECNZBu1BjK41S3WeEvTFj42e8vTq7r2tdNmGcRSouXj6vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244853; c=relaxed/simple;
	bh=bMgwiiNLyRTPGgZvPsbMRGCiA+Op+h24JxUTGG3gxgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QVoh+Wy624NEd9Dw2lh0Bpi3CK2ilWrxI+JM625XYtfjyq1Ho1ZL69er/31K6ATUssflRcK3sv460sMZeQFsj3Z6+ZeGUglZRg2g4BNics5RENwWqVuNFW423LFqK+Tmj9axw2PxThDDA/UrUVXlUZo4Bm2bCwqox8BtXtRtIBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdvfzQNt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61539f6815fso650329a12.2
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244850; x=1754849650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlKq1vVrMp+ea6ZNvvVgPvDYo89pz2+9NkIjrdarmTI=;
        b=IdvfzQNth+cMcv0TfPH1mBw2SCcqHicBFLy+5EB3V8as8OFwNz9gSso1NMoF8SLnWu
         ve/qE0iXbLDBq/5d276H3KXLG1OM620lcEp3Z40T093h3Q8C4G8O8QzVewtUlk3bV+aN
         RMAuWOZswjUzdAjQyHbEISooov0k05EnGrSotDCGfM/Mtw3llCT3x/T0LnSOEExzqXUe
         H6oDIe+dVPO/EZUC0qWeMEUhoJJrJenM2OBGawaPVp+GHYHgKPo/gIHdpWSDrVhu46Cp
         V5GVkr27uWqtFNuwK1C+JilXPD9mvKcP0ra/qWZ0BrASty/Zy8ZdPUpB3MxZ8VcfNARw
         Mskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244850; x=1754849650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlKq1vVrMp+ea6ZNvvVgPvDYo89pz2+9NkIjrdarmTI=;
        b=UwzcknoHfaI+A62NoGOM+HHNWz+S77l8eHt/AKuHqyEuqDCm67lgDq4UM4iMzMryQv
         btxVVnqayOq9O6PWNMsmWz3yMNa6LJabMlGoYUl1+cZu6F4ZHnRLlGhmrnlrQpqFPzx4
         yJUOpdWUgIvU0T0RzG7eCtuxXOY6Ibmr2S/Utychw05c3wlDuxKYUuW8jH+MGrBpJIHA
         BeGvZAZFd9NrEQKQXkFKI2KCtYw45r/krRP619W5PblT+KkoogUna44ByQiJ+fuJv5HF
         5SEEbyuJ8EVCXz1TGqfeOXfassTV8MEZBA6YJ6qtFtwAkYa/GFH7GCxK8hggmA9c7GFC
         ZD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP/I1X3tm2nHjAcBIfst455XHgRuK9nGSk9zHq+s17bUSMpMxaVh7fhspZ5k9m5WlOAU86gIe/ep7vxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo+C8TOZBSlh79m1yEqyBoIRFJIGkNhQpTFmygnr2o6zY0VoiT
	1Np2bWN8lYhCHGdW8FConswMNnlxsxxxTO2hcpF0lHdNgZIWPniGUXq1DLBEpQ==
X-Gm-Gg: ASbGncs2jOgZh6RGFj/wJSD12wZI89KVKeelGUJe6j3thWuShPBFn8EiTQN87kTosPf
	NP09YF2e2JDqB4npSXV8ixbHbFEpfe+LGbQEJpoqBw4o5017JWp3rZcTF1rJicW3q9lN79QH1R4
	SiW1tlCjnAlfBNiyasK4SeD2+1wAiDAc87/p7/10KKWrI4L1Tt3C7ry1spRe47VZvGFZM8M4vwG
	CpuOqRPFgdJToQ9X0L5LzIFxJwXclFFMjrPQxV6Rfb6JjCBEXMIW1LEsYGB6OSEy8y+cSpVzFq/
	nwp3TLb597TO89IZHPwVcejAApLoAwVGSH7rkkQo15lNeZo4P/VadQR4v596yJncqZs5gtXprBz
	fNab2WGD1n7tJtZcMzjbTdggv++PxeiTEwSoK3NbcGLfUo3Y562rA9ulJpnZ6bTM95J0LIOjbS2
	g=
X-Google-Smtp-Source: AGHT+IHZuQWUGuFgzi9bLxSZVpQ8rFhIcdBxZ5yaEGq+9r+WkxSMSFtDBRTWhlXwmF8U3w3a0KxW8A==
X-Received: by 2002:a17:907:9691:b0:af9:3116:e10d with SMTP id a640c23a62f3a-af9402225c4mr310750266b.11.1754244850082;
        Sun, 03 Aug 2025 11:14:10 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:09 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 15/17] HID: pidff: clang-format pass
Date: Sun,  3 Aug 2025 20:13:52 +0200
Message-ID: <20250803181354.60034-16-tomasz.pakula.oficjalny@gmail.com>
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


