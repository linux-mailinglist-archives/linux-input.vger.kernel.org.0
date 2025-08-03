Return-Path: <linux-input+bounces-13778-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718CDB194BF
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D4353B62FE
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C801E25ED;
	Sun,  3 Aug 2025 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qk1QViRc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965641DF742
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244847; cv=none; b=oRv9YHdNjyazD5W2YHwj1TwzRae9BwvqN58Ws76vIdykUOgCSk6PzQVfG+Tw1QZfNPpvMmVEVD6N7wals1gKLjfxxkSQ9LHEhxreBoKWZMs4o+FxqSqZbVLNIK8Z9LqCOvNeXf3hF2njpixNsROnyq8G4DSZfem2E5Tx0R9NMOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244847; c=relaxed/simple;
	bh=IaE1dmo1YNSArpI23hT/zFdb3vAwYLY5fZGfbkLLkl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIvbeKmDBg9IpccNqbGWk1isOrXamnIqg6f7mypO3gWIIY4BBEDKGT/yKTmhjkkGzI4BLpsZivhCcBP8ULS1Tg7Gr27pZP35GA2GOiHNVajMGtMFvOxEQL/7mr8zUcqcSO0XsyxxEJNkJsti3P6PvQZsJoxCKCch+3Kn0fKPbh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk1QViRc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-af935b052d9so44331666b.0
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244844; x=1754849644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUEzdyLXxouEVX/82qJW1stzkgcrAZxhsgDh1/Iofe4=;
        b=Qk1QViRc9DoDR5lxYKo5ND3ng4Q5Mral1mcY5RLTuHg6CMq926OLHs9Rh8SitaGBZw
         LKGi42E0aK1hM1SYxHss2ofxYj0tCOrM4fPF210zMF2aKd5IsAIa5n0DHMr0k2VtPsHO
         mCPa+JjtNyU1UH8NiiV8Vyn9Yv2PoKX6gOtRyAE4ES4kAzgXlqDGjIpJHDzOHc4E8Ek/
         m5jJx/1djinGMzt0WyDBsQNPWXKvjjz1lW9r+CzTZUImY8AWm2QS2LZ9z3Bu2aMlVJOg
         sEWo3ZZGUPyz79yEj3T2DQU8IVI+tsR7PSnPqg9gh1ltwdJWJKEMZv7ZJov3U5R+F4yu
         A8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244844; x=1754849644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUEzdyLXxouEVX/82qJW1stzkgcrAZxhsgDh1/Iofe4=;
        b=rxVDLBkVzJEErxaIrvVhXWq1nS36VJtGbOuGhYcQpAi/ux8rOdQpkHCA8wGr1mehiC
         DNgE9T/JAGCX0G7rrBVx0niTxk6WdmzbQpREU+5IatQgJbQ+ieBXqx3afWdMHuGXtEoM
         RH+aERw7SW8tGsoksiq6thIgTekkOuwpxnj5YprS/NANLiSxRObAV/V2KSLeFWLd84/E
         Bzpzt5l0ljFmi76702kJRCxfO3IEV3X+4UljQHvClbN0d+UqKwFE4zWjp5S+yiXZ+OK2
         OG3MEXTXMGrove+sBZr/cLJ/OCiVLb2FXQ15tOkY7YA5wx6d1upKSV1T9XxmFFOgqw3j
         AcSA==
X-Forwarded-Encrypted: i=1; AJvYcCUo3ZqIBMQmcdWCe1z8pWLZKhFYtm+rgO0tJgoqinztj8tsFQcL3PYg3gnP8hVDZ6nlNnA+tX+PMN+wQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5qCCP+kyRTQDKmeRK0kVikWOlXDHTFDFV/xa6dIkG2IKuavZ
	ObOZ9T7JhImIa2oGP9TS9Z4v/M+IcC906RCe2F4LMnG9nfDnkPjuJW/CuxDTRg==
X-Gm-Gg: ASbGnctoD/B+tXsw0CxkuMwpPtAYRjOBt/15A+K58OxOj0MvVefxmTEzj0ou4FMGmJn
	PRPDVOINID3VWO7SjiNRKiUva0zuTkHTSvDIukRipb0AgO4mZhBGKfUEzA7p2N6kCXPg/YVWhpo
	0H0aReXwD3Nu7qnxyhjtoZdIroNT2soUgyf1ibR5vVRQ0B+SsTeEeD3FvV3wbswhdQ3MYYJE3Zi
	WecnzjzXwqsKOLoVHP/gp82heWnKwJ0Glll6ttAJNYOf7TAlfzXPGEl3Bbq4myAUjNaM5VnD/Lm
	gchlWCpjeUCh+y7A/gkp6RNzSexMl2vgeazYYmG619qKjCUZDFB9l93aUZmc9dcGrnX8YOtzdPS
	GKz/LTfmwEg3GXffmf56ylnaE62XFjnP3IbNq8YX3JukRH+viSzDJ+fdQEqEeaP0UogTgkCX4hC
	k=
X-Google-Smtp-Source: AGHT+IGQFYksWCe/lDb8kocfRKVuzO/I+akaKMQbdpiuNmsJCQBmcFC8J66+WU5zJJiw7yIHIv/QSQ==
X-Received: by 2002:a17:907:c27:b0:ae0:cd6e:5d0 with SMTP id a640c23a62f3a-af940243f69mr311535666b.11.1754244843762;
        Sun, 03 Aug 2025 11:14:03 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:03 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 08/17] HID: pidff: Add support for AXES_ENABLE field
Date: Sun,  3 Aug 2025 20:13:45 +0200
Message-ID: <20250803181354.60034-9-tomasz.pakula.oficjalny@gmail.com>
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

AXES_ENABLE can be used in place of DIRECTION_ENABLE to indicate, which
FFB-enabled axes will be affected by a given effect. EFFECT_DIRECTION
enables all and uses the first direction only while AXES_ENABLE is a
bitmask and bit indexes are the same as the defined GD usages in the
EFFECT_DIRECTION array. Each axis can have it's own direction in this
case.

Search for AXES_ENABLE, set AXES_ENABLE for all axes if DIRECTION_ENABLE
is not used.

Search for specific axes in the direction array. Save their indexes. This
let us know what axes are actually available on the device and which bit
in the AXES_ENABLE field corresponds to which axis.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 91 ++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 2e8eac944be0..0f49d2836e9e 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -51,6 +51,7 @@ static const u8 pidff_reports[] = {
 
 /* PID special fields */
 #define PID_EFFECT_TYPE			0x25
+#define PID_AXES_ENABLE			0x55
 #define PID_DIRECTION			0x57
 #define PID_EFFECT_OPERATION_ARRAY	0x78
 #define PID_BLOCK_LOAD_STATUS		0x8b
@@ -150,6 +151,31 @@ static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 /* Polar direction 90 degrees (East) */
 #define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
 
+/* AXES_ENABLE and DIRECTION axes */
+enum pid_axes {
+	PID_AXIS_X,
+	PID_AXIS_Y,
+	PID_AXIS_Z,
+	PID_AXIS_RX,
+	PID_AXIS_RY,
+	PID_AXIS_RZ,
+	PID_AXIS_SLIDER,
+	PID_AXIS_DIAL,
+	PID_AXIS_WHEEL,
+	PID_AXES_COUNT,
+};
+static const u8 pidff_direction_axis[] = {
+	HID_USAGE & HID_GD_X,
+	HID_USAGE & HID_GD_Y,
+	HID_USAGE & HID_GD_Z,
+	HID_USAGE & HID_GD_RX,
+	HID_USAGE & HID_GD_RY,
+	HID_USAGE & HID_GD_RZ,
+	HID_USAGE & HID_GD_SLIDER,
+	HID_USAGE & HID_GD_DIAL,
+	HID_USAGE & HID_GD_WHEEL,
+};
+
 struct pidff_usage {
 	struct hid_field *field;
 	s32 *value;
@@ -184,6 +210,7 @@ struct pidff_device {
 	/* Special fields in set_effect */
 	struct hid_field *set_effect_type;
 	struct hid_field *effect_direction;
+	struct hid_field *axes_enable;
 
 	/* Special field in device_control */
 	struct hid_field *device_control;
@@ -198,11 +225,13 @@ struct pidff_device {
 	int type_id[ARRAY_SIZE(pidff_effect_types)];
 	int status_id[ARRAY_SIZE(pidff_block_load_status)];
 	int operation_id[ARRAY_SIZE(pidff_effect_operation_status)];
+	int direction_axis_id[ARRAY_SIZE(pidff_direction_axis)];
 
 	int pid_id[PID_EFFECTS_MAX];
 
 	u32 quirks;
 	u8 effect_count;
+	u8 axis_count;
 };
 
 static int pidff_is_effect_conditional(struct ff_effect *effect)
@@ -306,14 +335,37 @@ static void pidff_set_effect_direction(struct pidff_device *pidff,
 				       struct ff_effect *effect)
 {
 	u16 direction = effect->direction;
+	int direction_enable = 1;
 
 	/* Use fixed direction if needed */
 	if (pidff->quirks & HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION &&
 	    pidff_is_effect_conditional(effect))
 		direction = PIDFF_FIXED_WHEEL_DIRECTION;
 
+	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = direction_enable;
 	pidff->effect_direction->value[0] =
 		pidff_rescale(direction, U16_MAX, pidff->effect_direction);
+
+	if (direction_enable)
+		return;
+
+	/*
+	 * For use with improved FFB API
+	 * We want to read the selected axes and their direction from the effect
+	 * struct and only enable those. For now, enable all axes.
+	 *
+	 */
+	for (int i = 0; i < PID_AXES_COUNT; i++) {
+		/* HID index starts with 1 */
+		int index = pidff->direction_axis_id[i] - 1;
+
+		if (index < 0)
+			continue;
+
+		pidff->axes_enable->value[index] = 1;
+		pidff->effect_direction->value[index] = pidff_rescale(
+			direction, U16_MAX, pidff->effect_direction);
+	}
 }
 
 /*
@@ -411,7 +463,6 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 			effect->trigger.interval);
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
-	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
 
 	pidff_set_effect_direction(pidff, effect);
 
@@ -1122,12 +1173,13 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
  * Fill a pidff->*_id struct table
  */
 static int pidff_find_special_keys(int *keys, struct hid_field *fld,
-				   const u8 *usagetable, int count)
+				   const u8 *usagetable, int count,
+				   unsigned int usage_page)
 {
 	int found = 0;
 
 	for (int i = 0; i < count; i++) {
-		keys[i] = pidff_find_usage(fld, HID_UP_PID | usagetable[i]) + 1;
+		keys[i] = pidff_find_usage(fld, usage_page | usagetable[i]) + 1;
 		if (keys[i])
 			found++;
 	}
@@ -1136,7 +1188,11 @@ static int pidff_find_special_keys(int *keys, struct hid_field *fld,
 
 #define PIDFF_FIND_SPECIAL_KEYS(keys, field, name) \
 	pidff_find_special_keys(pidff->keys, pidff->field, pidff_ ## name, \
-		ARRAY_SIZE(pidff_ ## name))
+		ARRAY_SIZE(pidff_ ## name), HID_UP_PID)
+
+#define PIDFF_FIND_GENERAL_DESKTOP(keys, field, name) \
+	pidff_find_special_keys(pidff->keys, pidff->field, pidff_ ## name, \
+		ARRAY_SIZE(pidff_ ## name), HID_UP_GENDESK)
 
 /*
  * Find and check the special fields
@@ -1151,6 +1207,9 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 	pidff->set_effect_type =
 		pidff_find_special_field(pidff->reports[PID_SET_EFFECT],
 					 PID_EFFECT_TYPE, 1);
+	pidff->axes_enable =
+		pidff_find_special_field(pidff->reports[PID_SET_EFFECT],
+					 PID_AXES_ENABLE, 0);
 	pidff->effect_direction =
 		pidff_find_special_field(pidff->reports[PID_SET_EFFECT],
 					 PID_DIRECTION, 0);
@@ -1216,6 +1275,30 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 		return -1;
 	}
 
+	if (!pidff->axes_enable)
+		hid_info(pidff->hid, "axes enable field not found!\n");
+	else
+		hid_dbg(pidff->hid, "axes enable report count: %u\n",
+			pidff->axes_enable->report_count);
+
+	uint found = PIDFF_FIND_GENERAL_DESKTOP(direction_axis_id, axes_enable,
+						direction_axis);
+
+	pidff->axis_count = found;
+	hid_dbg(pidff->hid, "found direction axes: %u", found);
+
+	for (int i = 0; i < sizeof(pidff_direction_axis); i++) {
+		if (!pidff->direction_axis_id[i])
+			continue;
+
+		hid_dbg(pidff->hid, "axis %d, usage: 0x%04x, index: %d", i + 1,
+			pidff_direction_axis[i], pidff->direction_axis_id[i]);
+	}
+
+	if (pidff->axes_enable && found != pidff->axes_enable->report_count)
+		hid_warn(pidff->hid, "axes_enable: %u != direction axes: %u",
+			 pidff->axes_enable->report_count, found);
+
 	return 0;
 }
 
-- 
2.50.1


