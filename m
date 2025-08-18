Return-Path: <linux-input+bounces-14097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37394B2AB55
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBE9F5A6EEA
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 14:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08176322DA5;
	Mon, 18 Aug 2025 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xmXgomrJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAA3322C7D
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527351; cv=none; b=sGSU6r8GP1WsGAn8Q7qPpNMJrZh/ZhSoiLcBhrGZC5MK9LnIqTinEt2DljjWINU/AdMqxjJrxUGT8cSKMeHdUL1naRLN523eMQEMoDXOyqIegmJs2WUMh95VkEMqgxgoRMWS2mqwGNeUZMq/iE6G7lnkUxFQYuzoCorYA0wu9bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527351; c=relaxed/simple;
	bh=EzJdaMtvWN8urpUikh8Q4GZb6HxTthrpcmrUKVjniQw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yfv3PBJO31MaAy5p9FATJ+BdsfBzwRcysJtVgVmQ2kjlKAA5eJ75qgwbsxLplynGmd6KS3oE3v5TxYhYKYr+ll3FEPKvVxU8BPwFNT45AhWIAa9wqQaCaDmOFtdFfCU8iKHnjMl02U130pSClvsRgh0SAubFQ8vk+w4LfBmiKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xmXgomrJ; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3e5758168ffso41831865ab.2
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527349; x=1756132149; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXZVcgVQ+g42oJnrkZEqV6Ovv0XvfsNhZapIq9gDRSY=;
        b=xmXgomrJOfYebnTGzYvuYYgVly8cNxwJOsaFYdqCKsimViCSqalWrZRxY2h+YqL56s
         RhS++C4XWlY+XKhzIq5TqcmPfXMSlhNnjuoCHcxt/6Fx8zbxX6dgbTUDb8mpZf2dHPdM
         d1i61Rmz1ah90EOlQ0nQ/79TNjmhN+YI4fJoBwDASiWLHbXuza9mkasgEhKBSfLdEwpL
         DSzVBWI3d8x9MnoX93MKvbdeuYDVV7O73OyY5c6aOPv5JL/rAZq3RmQeWRibt0vHK8gL
         b/2Qv5FZC520NtFB2ScOGyjCh9YQ7CWprSMfAkHEblh8fq56+67furfodkwIjmDKX1ZV
         CraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527349; x=1756132149;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXZVcgVQ+g42oJnrkZEqV6Ovv0XvfsNhZapIq9gDRSY=;
        b=JdACZpf34KV5kfkjSTm2etHaoeGTS+zSH+zuRM394ziM5DnFBgEsCDiUEtlcY9oK75
         YcHNNhMBSDLzhCipsLBbOP2hLfU4gqyK0i4vG3dXkgnETCmRWVT0k2/u85IROh6LeiDl
         VxTAI14gpPQN/UwAOAQiqlsbxO9Oz5nmG1DHUyaCtFVNwXBe2hlQkmmPv1Nl/Pv3oSc5
         bFgeT8lroeG+ZuZ6DrJ0xKkuqKshpDf3dBlWyAi6AgO0B6iHlYasZlMljAF2sfQHCrUI
         wogednfRwdE5Hm1lrlhECtIt5rAoz22D461lO8Svp69HBsIafOS5rBiWyGUJvY9gvje9
         ecAw==
X-Gm-Message-State: AOJu0YyxOlhfMLr30qKHmjZQSdz2LQqRp+wIftir58rPxAxiP62RiT0H
	coU9//IDWLUIWKAeptoJB4pUUHmLFZlgRdN88st+iuoGNqJD5Izb7Iik03ruOmRQ2diXiPDQtx0
	vYDsQjMOq3g==
X-Google-Smtp-Source: AGHT+IERQLDHL1rvPQ/kzY3xQlBsZ9A5yJyKXeDv4afvAsJ2FJMmdxwbnVaibbx2bSVgs951jmpuwDTgQ6b9
X-Received: from jay8.prod.google.com ([2002:a05:6638:c2d8:b0:4f6:9195:b4a3])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1a4d:b0:3e5:7282:4a94
 with SMTP id e9e14a558f8ab-3e583928632mr203922345ab.23.1755527349380; Mon, 18
 Aug 2025 07:29:09 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:10 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-10-ca2546e319d5@google.com>
Subject: [PATCH v2 10/11] HID: haptic: add hid_haptic_switch_mode
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Function hid_haptic_switch_mode() can be used to switch between
device-controlled mode and host-controlled mode. Uploading a
WAVEFORMPRESS or WAVEFORMRELEASE effect triggers host-controlled mode if
the device is in device-controlled mode.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-haptic.c | 66 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index c02af820051c22d1c899db84496c5a44b868fe49..aa090684c1f23b61a1ac4e9e7e523b31a8166a21 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -5,6 +5,7 @@
  *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
  */
 
+#include <linux/input/mt.h>
 #include <linux/module.h>
 
 #include "hid-haptic.h"
@@ -197,12 +198,46 @@ static void fill_effect_buf(struct hid_haptic_device *haptic,
 	mutex_unlock(&haptic->manual_trigger_mutex);
 }
 
+static void switch_mode(struct hid_device *hdev, struct hid_haptic_device *haptic,
+			int mode)
+{
+	struct hid_report *rep = haptic->auto_trigger_report;
+	struct hid_field *field;
+	s32 value;
+	int i, j;
+
+	if (mode == HID_HAPTIC_MODE_HOST)
+		value = HID_HAPTIC_ORDINAL_WAVEFORMSTOP;
+	else
+		value = haptic->default_auto_trigger;
+
+	mutex_lock(&haptic->auto_trigger_mutex);
+	for (i = 0; i < rep->maxfield; i++) {
+		field = rep->field[i];
+		/* Ignore if report count is out of bounds. */
+		if (field->report_count < 1)
+			continue;
+
+		for (j = 0; j < field->maxusage; j++) {
+			if (field->usage[j].hid == HID_HP_AUTOTRIGGER)
+				field->value[j] = value;
+		}
+	}
+
+	/* send the report */
+	hid_hw_request(hdev, rep, HID_REQ_SET_REPORT);
+	mutex_unlock(&haptic->auto_trigger_mutex);
+	haptic->mode = mode;
+}
+
 static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 				    struct ff_effect *old)
 {
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_device *ff = dev->ff;
 	struct hid_haptic_device *haptic = ff->private;
 	int i, ordinal = 0;
+	bool switch_modes = false;
 
 	/* If vendor range, check vendor id and page */
 	if (effect->u.haptic.hid_usage >= (HID_HP_VENDORWAVEFORMMIN & HID_USAGE) &&
@@ -225,6 +260,16 @@ static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *eff
 	fill_effect_buf(haptic, &effect->u.haptic, &haptic->effect[effect->id],
 			ordinal);
 
+	if (effect->u.haptic.hid_usage == (HID_HP_WAVEFORMPRESS & HID_USAGE) ||
+			effect->u.haptic.hid_usage == (HID_HP_WAVEFORMRELEASE & HID_USAGE))
+		switch_modes = true;
+
+	/* If device is in autonomous mode, and the uploaded effect signals userspace
+	 * wants control of the device, change modes
+	 */
+	if (switch_modes && haptic->mode == HID_HAPTIC_MODE_DEVICE)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_HOST);
+
 	return 0;
 }
 
@@ -290,6 +335,7 @@ static void effect_set_default(struct ff_effect *effect)
 static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 {
 	struct hid_haptic_device *haptic = dev->ff->private;
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_effect effect;
 	int ordinal;
 
@@ -297,20 +343,25 @@ static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 
 	if (effect.u.haptic.hid_usage == (HID_HP_WAVEFORMRELEASE & HID_USAGE)) {
 		ordinal = haptic->release_ordinal;
-		if (!ordinal)
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
-		else
-			effect.u.haptic.hid_usage = HID_HP_WAVEFORMRELEASE &
-				HID_USAGE;
+			if (haptic->mode == HID_HAPTIC_MODE_HOST)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		} else
+			effect.u.haptic.hid_usage = HID_HP_WAVEFORMRELEASE & HID_USAGE;
+
 		fill_effect_buf(haptic, &effect.u.haptic, &haptic->effect[effect_id],
 				ordinal);
 	} else if (effect.u.haptic.hid_usage == (HID_HP_WAVEFORMPRESS & HID_USAGE)) {
 		ordinal = haptic->press_ordinal;
-		if (!ordinal)
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
+			if (haptic->mode == HID_HAPTIC_MODE_HOST)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		}
 		else
-			effect.u.haptic.hid_usage = HID_HP_WAVEFORMPRESS &
-				HID_USAGE;
+			effect.u.haptic.hid_usage = HID_HP_WAVEFORMPRESS & HID_USAGE;
+
 		fill_effect_buf(haptic, &effect.u.haptic, &haptic->effect[effect_id],
 				ordinal);
 	}
@@ -392,6 +443,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMSTOP] =
 		HID_HP_WAVEFORMSTOP & HID_USAGE;
 
+	mutex_init(&haptic->auto_trigger_mutex);
 	for (r = 0; r < haptic->auto_trigger_report->maxfield; r++)
 		parse_auto_trigger_field(haptic, haptic->auto_trigger_report->field[r]);
 

-- 
2.51.0.rc1.163.g2494970778-goog


