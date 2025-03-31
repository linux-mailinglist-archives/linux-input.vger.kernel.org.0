Return-Path: <linux-input+bounces-11379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA42A762A9
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 10:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A14CA3AADAD
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 08:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D761D95A3;
	Mon, 31 Mar 2025 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmRYZoxH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4201D86FF;
	Mon, 31 Mar 2025 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410698; cv=none; b=SXc0uAsOZD0YyZftQiMV0DP/PVq4rQBFuNlnVKLAk3cKEX2XVDkbjPNQxk2djAMlJVRcpgpQz/1KLtac+YsSjRGRs7VdOY3lo6SZjCAxpuM8it/Cgij993cOoPY6IPC/dERi9CfUs94va57872AHO3P4e60Y3lP8cp0IsmAwnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410698; c=relaxed/simple;
	bh=OLLiX5x1e5Uc1eb8gyRnb0bOoEdy5ZsuIWXHO17VfDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eyc0MbhBbbqxWaU6nAoogkl6ArKEgkihEjBbclCSMrYum+purb1zt0CFNNx1istDrfXeZuNK9NpckhFZNj3RJ8efsvLgPG/aIz3INjpYf7opt7fmgPROZmxeliuhmWxbxVFcE87HUrbVmSJ274eVRJF8cEioIaOpyCaWaqEXCt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmRYZoxH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e78378051aso701977a12.3;
        Mon, 31 Mar 2025 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743410694; x=1744015494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NuSa0K6sxZPwjPVTKEC0EGeFkw8R7BvHGg3zH3U9h0=;
        b=YmRYZoxHk6wi2gAI/Gncq3+30yZdKEEaPbVVNT2KobIUgT+VsElHviBD+trR4qH3AH
         NoyJEE1WG80mkBVH4M2sklZv4MdHLGTqKXfocdRrkDN/hnZ6KwltlNZPh9qE0dCZoHfP
         TF/OTYAewaw7frYIl+DktUiCvGqTfrezj9Uqb5P8zjHRs1FCBuSutcCGdmxKf42gCsN4
         FA7gnEdRaSLn/bCoqRFD3mxmOTCW069AWcwhVEQa5fDDx+vaNrl/5lFhEq58TWP0el89
         e6GqjuOdcSjuGm+PcE1PFBPJjHzdjYVY1GmB/iDnhHP/Vg24nojCaTLNOTMNtysYtyAC
         P6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410694; x=1744015494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NuSa0K6sxZPwjPVTKEC0EGeFkw8R7BvHGg3zH3U9h0=;
        b=MUd8hoan2r8O+3aKzszpHIgpZwnn5ajTbSA2N/N78fksDDQ8e8phDjdm3R3v3HFSMo
         lXv1Jh4ol63ldjh3MWRT0Iu9qMscjhy6QiN1Y2Gfq1gsoDDnTB7ruqVOHBim2nxTI76Z
         tY1iiBvebucn/6fJTeAsUvlfpFWN5hD+AFYvQAIVw+9lKpOfF5LdJ6EqhEl1IKjqjYkA
         u2jgLYYv75NujjDTbKYEl9F5xlDGtMjsX4lArgY9syzCgj103i2X3nmEJLyVnt1c4GJW
         JXz37XY/zFv3PXJXZdqEOH6DySxyfGuic6LxFiFMuq8W6jVkJ42er7nERUfvfgg/wYTF
         +Ysg==
X-Forwarded-Encrypted: i=1; AJvYcCUDSwlatoURZK8hjhbHRvziMeIa7g6rYpTfsrrF9Vdp0yY/Do3MTUc6IIXJSL19fpwGihDt+citOg1D2w==@vger.kernel.org, AJvYcCV5MDs0dKe5bKjUMjKGuXamho4YOwjsdSeyCHn5uoi5o31KzK5v9grUmGZFOTXC5T42nHIg06BUlUy+@vger.kernel.org
X-Gm-Message-State: AOJu0YySgGjAIxer6l9elpetqpBcTOtZekY3Vroo9FtrpQStmHqj1jA/
	Jn2b2z3HtRNOogvaSV4PeHl/0NYEU+RQ6gyE0ED4BvQKHvOS9D7OnF+shw==
X-Gm-Gg: ASbGncu68WGd/cnipawnetI5/bqO7Z7AxQWuI74UjjNhDzeGLEx1z7vznrlfuxfHINt
	VymH8EI93a2vARI0DRI6GowoMIMjsuwCJHRZiMGW1NQfC8AU0FNccgljFSwTlPINuQ3uNV2HJ/f
	tirYaGVKJIRpWy4BZJLaoF/no4kmCfB7Mnx3ITHkFIe9beaFhz2gYCMiPoDWy4/zl5zbZR/bJ98
	BcPk++uNA6Ft+JEHS3WILixf19m0REtlRyG5wmN0B81vNidgq9eGBn1zM9l4AshkihyZopbLGo3
	LXRAfg/tXVhJR1NvMnt8tGZUbLMYPEB1zC08bzfDu2EHI3IGJY3VUgjjoaywc9FSO2M/lM6SCCp
	5E/ikQ/iSK6ay4wCtcKDMovSu+w==
X-Google-Smtp-Source: AGHT+IHDUHDkbML30e3T8uX2uqGphkeeg5ZRRh9r3TAZhbTZouQ2nHeI/NH9wR+pXrU177M9CdhMvQ==
X-Received: by 2002:a05:6402:2312:b0:5ee:497:4ab6 with SMTP id 4fb4d7f45d1cf-5ee04974b2emr1787476a12.11.1743410694232;
        Mon, 31 Mar 2025 01:44:54 -0700 (PDT)
Received: from laptok.lan (89-64-31-184.dynamic.chello.pl. [89.64.31.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e05d8sm5236216a12.74.2025.03.31.01.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:44:53 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] HID: pidff: Fix checkpatch errors and warnings
Date: Mon, 31 Mar 2025 10:44:49 +0200
Message-ID: <20250331084449.61082-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331084449.61082-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250331084449.61082-1-tomasz.pakula.oficjalny@gmail.com>
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
 drivers/hid/usbhid/hid-pidff.c | 46 +++++++++++++++++-----------------
 drivers/hid/usbhid/hid-pidff.h |  3 ++-
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 8dfd2c554a27..f3f828c7cba5 100644
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
@@ -275,8 +276,8 @@ static void pidff_set_signed(struct pidff_usage *usage, s16 value)
 
 static void pidff_set_time(struct pidff_usage *usage, u16 time)
 {
-	u32 modified_time = pidff_rescale_time(time, usage->field);
-	usage->value[0] = pidff_clamp(modified_time, usage->field);
+	usage->value[0] = pidff_clamp(
+		pidff_rescale_time(time, usage->field), usage->field);
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
@@ -339,7 +341,6 @@ static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 
 	if (!needs_new_envelope)
 		return false;
-
 	if (!old)
 		return needs_new_envelope;
 
@@ -568,7 +569,7 @@ static void pidff_set_device_control(struct pidff_device *pidff, int field)
 		hid_dbg(pidff->hid, "DEVICE_CONTROL is a bitmask\n");
 
 		/* Clear current bitmask */
-		for(i = 0; i < sizeof(pidff_device_control); i++) {
+		for (i = 0; i < sizeof(pidff_device_control); i++) {
 			index = pidff->control_id[i];
 			if (index < 1)
 				continue;
@@ -619,7 +620,7 @@ static void pidff_fetch_pool(struct pidff_device *pidff)
 	struct hid_device *hid = pidff->hid;
 
 	/* Repeat if PID_SIMULTANEOUS_MAX < 2 to make sure it's correct */
-	for(i = 0; i < 20; i++) {
+	for (i = 0; i < 20; i++) {
 		hid_hw_request(hid, pidff->reports[PID_POOL], HID_REQ_GET_REPORT);
 		hid_hw_wait(hid);
 
@@ -715,6 +716,7 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct pidff_device *pidff = dev->ff->private;
+
 	pidff_playback_pid(pidff, pidff->pid_id[effect_id], value);
 	return 0;
 }
@@ -849,7 +851,7 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 	case FF_INERTIA:
 	case FF_FRICTION:
 		if (!old) {
-			switch(effect->type) {
+			switch (effect->type) {
 			case FF_SPRING:
 				type_id = PID_SPRING;
 				break;
@@ -940,7 +942,7 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
 	if (!report) {
-		pr_debug("pidff_find_fields, null report\n");
+		pr_debug("%s, null report\n", __func__);
 		return -1;
 	}
 
@@ -974,13 +976,11 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
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
@@ -1069,7 +1069,7 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
 						  int usage, int enforce_min)
 {
 	if (!report) {
-		pr_debug("pidff_find_special_field, null report\n");
+		pr_debug("%s, null report\n", __func__);
 		return NULL;
 	}
 
@@ -1081,10 +1081,9 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
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
@@ -1207,6 +1206,7 @@ static int pidff_find_effects(struct pidff_device *pidff,
 
 	for (i = 0; i < sizeof(pidff_effect_types); i++) {
 		int pidff_type = pidff->type_id[i];
+
 		if (pidff->set_effect_type->usage[pidff_type].hid !=
 		    pidff->create_new_effect_type->usage[pidff_type].hid) {
 			hid_err(pidff->hid,
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


