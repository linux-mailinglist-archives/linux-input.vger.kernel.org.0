Return-Path: <linux-input+bounces-11757-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03883A88FEC
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 01:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AC85189A4A3
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 23:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3B61F542B;
	Mon, 14 Apr 2025 23:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdXmbu9N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60991F4C8E;
	Mon, 14 Apr 2025 23:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672109; cv=none; b=HHoY3+fQ5TKL3sB2MpUzP5QOY1mqoZ9vMIhGidKG5sCZJbHYAZquTwYrhIIl53kZFi5/mhnrkfxJG02J4v5/Yl648jljsX0cZdA68waDwwumSuQTJL8ZJ2XWdf/dgkA6V6iLOTIUtEtwoSOnEn3TL0qshgp/dN+6lWiaRQ/NmQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672109; c=relaxed/simple;
	bh=hvtca5FhLzHgfMkfQiUQfWaDr+EJk1l+YUczTyqqp2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ioYGDeO5EAYXHozrSDihYPPZv23GINen15JfjR52V68tQpJ+tAFPtHV4+OcYPfBmM2pdeULuva95kZgQ2TiMmGFw5xtjLpZPnZVb+VqxOBhn0IV1v+dNcLfZ0JLgEQzgkhz8oguqgKT0AmILWhlQ9khJLh10ULbBST/JssnEQS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdXmbu9N; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2c7a367d9so96609066b.3;
        Mon, 14 Apr 2025 16:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744672105; x=1745276905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEE6SX9EoTH1J1AGbX+gSLqDqp/jZqKyczZ4TnYEcvg=;
        b=YdXmbu9NAxmr51aEWDGOqi6YPnHUap8sMmierkj4BFXcD6n6XewZ54JjpTraW16dwH
         a4g8jaNxOYuBKW+fCTw/wHWsrP8R2x7mxY87zPU/H4avziZ42AspLBm70BgF8ynxfM0J
         42OwyRkxPeVK/KdTwRkABCpdAnWdLvl3+8IoLjKaV3G7uuZvJZn1fHzyVHUFbK2QUyhV
         pJZt6CyMRL7n5EJLOvA/fbcQKc27JNRhvwFh5XHKXfmrv2YRisoiiq7xea9iux/uRMad
         mGlDJcTsaadmy9nOCnm98qBbZHHGb1hVCT+pazrkyfbwN1TQz/eKWouwI36xaBJx/NkR
         UScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672105; x=1745276905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEE6SX9EoTH1J1AGbX+gSLqDqp/jZqKyczZ4TnYEcvg=;
        b=v1LIp4DT5+mr44wWYw6DAc57P6iHltZKEnQpGQYSp0boFO3xO4Na8nPjbGRICwrTlr
         BqoGKJ2ycI99+jvmWjEW31GIR0ynR1FSacZ9RzBs6tWEy5XBkeASeHhGJa1+KfHnjF5s
         L58l8JyVZ3EbYQDFMn+IQVGMsVyCBXQWUN3DFdUWYyWWGhpTFBayaPVK8NUTWk9XRpl/
         bUBWSTvIo4T2Pjv26YkN037MwZAEHHGALM62qKH9yw+VbJnLqGSRluWkEsXniVRomS0P
         ncxJDYvZZ8uSHzwur0PfatfbQjsW/DAjs6e04rtC8dZC/dhxVMXQUhpjC1lQpESZ7S6R
         aGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb0E5TaBJvrOK7jzjq90pO1x32Po2TtElxcSy0lnQM/YgM8vclPTx0Lukv5UpvXyFkw/JvGUp2WdrlKg==@vger.kernel.org, AJvYcCXu+jQSJr35MWMt1NqhFHLrmPFHdMonDNMrqpFyVRPiAZuDRopR6QrIvl1ZDzgRhUAetkk3fkk4a6ZP@vger.kernel.org
X-Gm-Message-State: AOJu0YyuAPOmBZROvhjt2CGS7wss0zVkVD5BLNVV/DtDBPiLj4IgMfKT
	SMkkQyoChGZ2vd1r4N/DdSiw5EdH7R0mZcNbN41SVzMtRX8sWINS
X-Gm-Gg: ASbGnctTj2a8Toy7ZrfUtDn5OaDultNEUJRInuMo9f4FYAWKfZQVJjrDL21rVj3ny5X
	gQouLPJ1aqyZsEu78kL5occRlSB99NDvbyWYAiTYQtZb5S9ZMwcuZ4XvNOHDy7YU2OvEzIEleNS
	eJ85AXX7QAihnvQiPWIQ7zdkz0aozC+Xua188eUIW3lFEpOoosKS7RVIc7Z4YCrL9vdgaz2d12x
	dNCCH+NAfrVtAXEtqAv5bvuLyzkpgO9JYqAudkYeWURkptbGUBgZ2fqXECPmidQ2qmaaGDSrv2f
	rhJh/p2ISYZARY/B6MhwyPpjqOe6e/RhyapAkh3oDXG2W9jN22ePxCEjjxp96x8UOqAvertxrn6
	K3eZ1NKYe8/E=
X-Google-Smtp-Source: AGHT+IGqAY/gwcOyMUYjSxmZZpcQ7/hqow022rAcPRGQn+R5jPvOuwIgcNaBKjPKFmcaJiw71zNvYA==
X-Received: by 2002:a17:907:9f13:b0:ac7:2aa0:309b with SMTP id a640c23a62f3a-acad3430ed5mr413176966b.1.1744672104832;
        Mon, 14 Apr 2025 16:08:24 -0700 (PDT)
Received: from laptok.lan (89-64-31-184.dynamic.chello.pl. [89.64.31.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3e08sm1001328166b.14.2025.04.14.16.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:08:24 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND 2/2] HID: pidff: Fix checkpatch errors and warnings
Date: Tue, 15 Apr 2025 01:08:18 +0200
Message-ID: <20250414230818.957678-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414230818.957678-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250414230818.957678-1-tomasz.pakula.oficjalny@gmail.com>
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
 drivers/hid/usbhid/hid-pidff.c | 129 ++++++++++++++-------------------
 drivers/hid/usbhid/hid-pidff.h |   3 +-
 2 files changed, 58 insertions(+), 74 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 8dfd2c554a27..844fc4d84be5 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -210,9 +210,7 @@ struct pidff_device {
  */
 static s32 pidff_clamp(s32 i, struct hid_field *field)
 {
-	s32 clamped = clamp(i, field->logical_minimum, field->logical_maximum);
-	pr_debug("clamped from %d to %d", i, clamped);
-	return clamped;
+	return clamp(i, field->logical_minimum, field->logical_maximum);
 }
 
 /*
@@ -229,8 +227,10 @@ static int pidff_rescale(int i, int max, struct hid_field *field)
  */
 static int pidff_rescale_signed(int i, struct hid_field *field)
 {
-	if (i > 0) return i * field->logical_maximum / S16_MAX;
-	if (i < 0) return i * field->logical_minimum / S16_MIN;
+	if (i > 0)
+		return i * field->logical_maximum / S16_MAX;
+	if (i < 0)
+		return i * field->logical_minimum / S16_MIN;
 	return 0;
 }
 
@@ -241,11 +241,12 @@ static u32 pidff_rescale_time(u16 time, struct hid_field *field)
 {
 	u32 scaled_time = time;
 	int exponent = field->unit_exponent;
+
 	pr_debug("time field exponent: %d\n", exponent);
 
-	for (;exponent < FF_TIME_EXPONENT; exponent++)
+	for (; exponent < FF_TIME_EXPONENT; exponent++)
 		scaled_time *= 10;
-	for (;exponent > FF_TIME_EXPONENT; exponent--)
+	for (; exponent > FF_TIME_EXPONENT; exponent--)
 		scaled_time /= 10;
 
 	pr_debug("time calculated from %d to %d\n", time, scaled_time);
@@ -265,18 +266,18 @@ static void pidff_set_signed(struct pidff_usage *usage, s16 value)
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
-	u32 modified_time = pidff_rescale_time(time, usage->field);
-	usage->value[0] = pidff_clamp(modified_time, usage->field);
+	usage->value[0] = pidff_clamp(pidff_rescale_time(time, usage->field),
+				      usage->field);
 }
 
 static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
@@ -332,6 +333,7 @@ static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
 	bool needs_new_envelope;
+
 	needs_new_envelope = envelope->attack_level  != 0 ||
 			     envelope->fade_level    != 0 ||
 			     envelope->attack_length != 0 ||
@@ -460,15 +462,13 @@ static int pidff_needs_set_periodic(struct ff_effect *effect,
 static void pidff_set_condition_report(struct pidff_device *pidff,
 				       struct ff_effect *effect)
 {
-	int i, max_axis;
-
 	/* Devices missing Parameter Block Offset can only have one axis */
-	max_axis = pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO ? 1 : 2;
+	int max_axis = pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO ? 1 : 2;
 
 	pidff->set_condition[PID_EFFECT_BLOCK_INDEX].value[0] =
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 
-	for (i = 0; i < max_axis; i++) {
+	for (int i = 0; i < max_axis; i++) {
 		/* Omit Parameter Block Offset if missing */
 		if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO))
 			pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
@@ -496,10 +496,9 @@ static void pidff_set_condition_report(struct pidff_device *pidff,
 static int pidff_needs_set_condition(struct ff_effect *effect,
 				     struct ff_effect *old)
 {
-	int i;
 	int ret = 0;
 
-	for (i = 0; i < 2; i++) {
+	for (int i = 0; i < 2; i++) {
 		struct ff_condition_effect *cond = &effect->u.condition[i];
 		struct ff_condition_effect *old_cond = &old->u.condition[i];
 
@@ -557,7 +556,6 @@ static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
  */
 static void pidff_set_device_control(struct pidff_device *pidff, int field)
 {
-	int i, index;
 	int field_index = pidff->control_id[field];
 
 	if (field_index < 1)
@@ -568,8 +566,9 @@ static void pidff_set_device_control(struct pidff_device *pidff, int field)
 		hid_dbg(pidff->hid, "DEVICE_CONTROL is a bitmask\n");
 
 		/* Clear current bitmask */
-		for(i = 0; i < sizeof(pidff_device_control); i++) {
-			index = pidff->control_id[i];
+		for (int i = 0; i < sizeof(pidff_device_control); i++) {
+			int index = pidff->control_id[i];
+
 			if (index < 1)
 				continue;
 
@@ -615,11 +614,10 @@ static void pidff_reset(struct pidff_device *pidff)
  */
 static void pidff_fetch_pool(struct pidff_device *pidff)
 {
-	int i;
 	struct hid_device *hid = pidff->hid;
 
 	/* Repeat if PID_SIMULTANEOUS_MAX < 2 to make sure it's correct */
-	for(i = 0; i < 20; i++) {
+	for (int i = 0; i < 20; i++) {
 		hid_hw_request(hid, pidff->reports[PID_POOL], HID_REQ_GET_REPORT);
 		hid_hw_wait(hid);
 
@@ -643,8 +641,6 @@ static void pidff_fetch_pool(struct pidff_device *pidff)
  */
 static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 {
-	int j;
-
 	if (!pidff->effect_count)
 		pidff_reset(pidff);
 
@@ -657,11 +653,12 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 	pidff->block_load_status->value[0] = 0;
 	hid_hw_wait(pidff->hid);
 
-	for (j = 0; j < 60; j++) {
+	for (int i = 0; i < 60; i++) {
 		hid_dbg(pidff->hid, "pid_block_load requested\n");
 		hid_hw_request(pidff->hid, pidff->reports[PID_BLOCK_LOAD],
 				HID_REQ_GET_REPORT);
 		hid_hw_wait(pidff->hid);
+
 		if (pidff->block_load_status->value[0] ==
 		    pidff->status_id[PID_BLOCK_LOAD_SUCCESS]) {
 			hid_dbg(pidff->hid, "device reported free memory: %d bytes\n",
@@ -715,6 +712,7 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct pidff_device *pidff = dev->ff->private;
+
 	pidff_playback_pid(pidff, pidff->pid_id[effect_id], value);
 	return 0;
 }
@@ -741,8 +739,7 @@ static int pidff_erase_effect(struct input_dev *dev, int effect_id)
 	struct pidff_device *pidff = dev->ff->private;
 	int pid_id = pidff->pid_id[effect_id];
 
-	hid_dbg(pidff->hid, "starting to erase %d/%d\n",
-		effect_id, pidff->pid_id[effect_id]);
+	hid_dbg(pidff->hid, "starting to erase %d/%d\n", effect_id, pid_id);
 
 	/*
 	 * Wait for the queue to clear. We do not want
@@ -762,8 +759,7 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			       struct ff_effect *old)
 {
 	struct pidff_device *pidff = dev->ff->private;
-	int type_id;
-	int error;
+	int error, type_id;
 
 	pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] = 0;
 	if (old) {
@@ -849,7 +845,7 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 	case FF_INERTIA:
 	case FF_FRICTION:
 		if (!old) {
-			switch(effect->type) {
+			switch (effect->type) {
 			case FF_SPRING:
 				type_id = PID_SPRING;
 				break;
@@ -939,23 +935,23 @@ static void pidff_set_autocenter(struct input_dev *dev, u16 magnitude)
 static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
+	int return_value = 0;
+
 	if (!report) {
-		pr_debug("pidff_find_fields, null report\n");
+		pr_debug("%s, null report\n", __func__);
 		return -1;
 	}
 
-	int i, j, k, found;
-	int return_value = 0;
+	for (int k = 0; k < count; k++) {
+		int found = 0;
 
-	for (k = 0; k < count; k++) {
-		found = 0;
-		for (i = 0; i < report->maxfield; i++) {
+		for (int i = 0; i < report->maxfield; i++) {
 			if (report->field[i]->maxusage !=
 			    report->field[i]->report_count) {
 				pr_debug("maxusage and report_count do not match, skipping\n");
 				continue;
 			}
-			for (j = 0; j < report->field[i]->maxusage; j++) {
+			for (int j = 0; j < report->field[i]->maxusage; j++) {
 				if (report->field[i]->usage[j].hid ==
 				    (HID_UP_PID | table[k])) {
 					pr_debug("found %d at %d->%d\n",
@@ -974,13 +970,11 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			pr_debug("Delay field not found, but that's OK\n");
 			pr_debug("Setting MISSING_DELAY quirk\n");
 			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
-		}
-		else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
+		} else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
 			pr_debug("PBO field not found, but that's OK\n");
 			pr_debug("Setting MISSING_PBO quirk\n");
 			return_value |= HID_PIDFF_QUIRK_MISSING_PBO;
-		}
-		else if (!found && strict) {
+		} else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
 		}
@@ -993,9 +987,7 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
  */
 static int pidff_check_usage(int usage)
 {
-	int i;
-
-	for (i = 0; i < sizeof(pidff_reports); i++)
+	for (int i = 0; i < sizeof(pidff_reports); i++)
 		if (usage == (HID_UP_PID | pidff_reports[i]))
 			return i;
 
@@ -1010,13 +1002,14 @@ static void pidff_find_reports(struct hid_device *hid, int report_type,
 			       struct pidff_device *pidff)
 {
 	struct hid_report *report;
-	int i, ret;
 
 	list_for_each_entry(report,
 			    &hid->report_enum[report_type].report_list, list) {
 		if (report->maxfield < 1)
 			continue;
-		ret = pidff_check_usage(report->field[0]->logical);
+
+		int ret = pidff_check_usage(report->field[0]->logical);
+
 		if (ret != -1) {
 			hid_dbg(hid, "found usage 0x%02x from field->logical\n",
 				pidff_reports[ret]);
@@ -1031,7 +1024,8 @@ static void pidff_find_reports(struct hid_device *hid, int report_type,
 		 * implementation hides this fact, so we have to dig it up
 		 * ourselves
 		 */
-		i = report->field[0]->usage[0].collection_index;
+		int i = report->field[0]->usage[0].collection_index;
+
 		if (i <= 0 ||
 		    hid->collection[i - 1].type != HID_COLLECTION_LOGICAL)
 			continue;
@@ -1050,9 +1044,7 @@ static void pidff_find_reports(struct hid_device *hid, int report_type,
  */
 static int pidff_reports_ok(struct pidff_device *pidff)
 {
-	int i;
-
-	for (i = 0; i <= PID_REQUIRED_REPORTS; i++) {
+	for (int i = 0; i <= PID_REQUIRED_REPORTS; i++) {
 		if (!pidff->reports[i]) {
 			hid_dbg(pidff->hid, "%d missing\n", i);
 			return 0;
@@ -1069,22 +1061,19 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
 						  int usage, int enforce_min)
 {
 	if (!report) {
-		pr_debug("pidff_find_special_field, null report\n");
+		pr_debug("%s, null report\n", __func__);
 		return NULL;
 	}
 
-	int i;
-
-	for (i = 0; i < report->maxfield; i++) {
+	for (int i = 0; i < report->maxfield; i++) {
 		if (report->field[i]->logical == (HID_UP_PID | usage) &&
 		    report->field[i]->report_count > 0) {
 			if (!enforce_min ||
 			    report->field[i]->logical_minimum == 1)
 				return report->field[i];
-			else {
-				pr_err("logical_minimum is not 1 as it should be\n");
-				return NULL;
-			}
+
+			pr_err("logical_minimum is not 1 as it should be\n");
+			return NULL;
 		}
 	}
 	return NULL;
@@ -1096,12 +1085,10 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
 static int pidff_find_special_keys(int *keys, struct hid_field *fld,
 				   const u8 *usagetable, int count)
 {
-
-	int i, j;
 	int found = 0;
 
-	for (i = 0; i < count; i++) {
-		for (j = 0; j < fld->maxusage; j++) {
+	for (int i = 0; i < count; i++) {
+		for (int j = 0; j < fld->maxusage; j++) {
 			if (fld->usage[j].hid == (HID_UP_PID | usagetable[i])) {
 				keys[i] = j + 1;
 				found++;
@@ -1203,10 +1190,9 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 static int pidff_find_effects(struct pidff_device *pidff,
 			      struct input_dev *dev)
 {
-	int i;
-
-	for (i = 0; i < sizeof(pidff_effect_types); i++) {
+	for (int i = 0; i < sizeof(pidff_effect_types); i++) {
 		int pidff_type = pidff->type_id[i];
+
 		if (pidff->set_effect_type->usage[pidff_type].hid !=
 		    pidff->create_new_effect_type->usage[pidff_type].hid) {
 			hid_err(pidff->hid,
@@ -1355,8 +1341,6 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 static int pidff_check_autocenter(struct pidff_device *pidff,
 				  struct input_dev *dev)
 {
-	int error;
-
 	/*
 	 * Let's find out if autocenter modification is supported
 	 * Specification doesn't specify anything, so we request an
@@ -1364,8 +1348,8 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 	 * effect id was one above the minimum, then we assume the first
 	 * effect id is a built-in spring type effect used for autocenter
 	 */
+	int error = pidff_request_effect_upload(pidff, 1);
 
-	error = pidff_request_effect_upload(pidff, 1);
 	if (error) {
 		hid_err(pidff->hid, "upload request failed\n");
 		return error;
@@ -1395,8 +1379,6 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	struct hid_input *hidinput = list_entry(hid->inputs.next,
 						struct hid_input, list);
 	struct input_dev *dev = hidinput->input;
-	struct ff_device *ff;
-	int max_effects;
 	int error;
 
 	hid_dbg(hid, "starting pid init\n");
@@ -1436,12 +1418,12 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	max_effects =
+	int max_effects =
 	    pidff->block_load[PID_EFFECT_BLOCK_INDEX].field->logical_maximum -
 	    pidff->block_load[PID_EFFECT_BLOCK_INDEX].field->logical_minimum +
 	    1;
-	hid_dbg(hid, "max effects is %d\n", max_effects);
 
+	hid_dbg(hid, "max effects is %d\n", max_effects);
 	if (max_effects > PID_EFFECTS_MAX)
 		max_effects = PID_EFFECTS_MAX;
 
@@ -1465,7 +1447,8 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	ff = dev->ff;
+	struct ff_device *ff = dev->ff;
+
 	ff->private = pidff;
 	ff->upload = pidff_upload_effect;
 	ff->erase = pidff_erase_effect;
diff --git a/drivers/hid/usbhid/hid-pidff.h b/drivers/hid/usbhid/hid-pidff.h
index dda571e0a5bd..bfb97cb84f18 100644
--- a/drivers/hid/usbhid/hid-pidff.h
+++ b/drivers/hid/usbhid/hid-pidff.h
@@ -10,7 +10,8 @@
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 
 /* Missing Paramter block offset (0x23). Skip it during SET_CONDITION
-   report upload */
+ * report upload
+ */
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 
 /* Initialise device control field even if logical_minimum != 1 */
-- 
2.49.0


