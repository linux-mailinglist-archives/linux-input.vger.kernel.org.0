Return-Path: <linux-input+bounces-13809-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502EAB1A43F
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 16:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D905162333
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 14:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB37B274B57;
	Mon,  4 Aug 2025 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JJyaFl1+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0AF2749DA
	for <linux-input@vger.kernel.org>; Mon,  4 Aug 2025 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316692; cv=none; b=eRkHjpHMwjD9h9bbZ+j8nx3eb8SD1TW1buAr6z3aSyvP30U/7q0iEj1ti4Va9NoaudAONXjOT+1YKXbrWF2uuezCJmLblcXmtnro9VH+rhBgRtYPBYzLGywECp0TKqG2v0UmcGWVzvtYkIUtSIe9opu5peuVXfqcd6zC32eUdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316692; c=relaxed/simple;
	bh=6v1MDR/WeMRI65XnJPJkUWNJ4hrJ+LCwOhgu42qcMno=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r28ZqMV6FubYRuCHYeV6ALOHbMa4r1hXbXuDtN3WqbM5KEg5G9xsXjhd4+wxOVYo3gfnWMcp0OahEVcLCoN4ysaCNSCP/V8JnQg8kcReaPE4JTLSkEAmoyI6l3UuuYT0nxPpvHAVH4QYl5B56g/94psX3nQNmwt9+oOxpUYaGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JJyaFl1+; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-8818b1512c2so57297939f.2
        for <linux-input@vger.kernel.org>; Mon, 04 Aug 2025 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316689; x=1754921489; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7/dNH3FeYrRLFNsE8lPl3SAjeZ5ud/QO8Uhx48+1mZI=;
        b=JJyaFl1+Mo+E5n927qWPuosXKPmHvJc5zvY+4/FrHI0fSDxHoYSp1szHFLUXcFz9Sp
         HWwdidEJeR7YrgUC++XPnubPlqcpHEuoAU8HKimAk7g+ivF4PfLl03OKvNX6KuBUAAKr
         cv8hVifv/R6nVw+vcCmRmaOk15cq0umVF/xs/htwF1aal5V/3vQMaJFyacLd1cL2+O11
         OjUiXTIX+3xNzIzulTTyA7h49aodFQgLtk24kjLADT3KNSa0mHSPC88ynP035E1l+xm+
         R4dJmFuGk3XQRGvac0o8+PpGRL7EzvMCT9/cbxE2a+BiX9B8Z0/6CSre7tksBI5KZrVS
         4NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316689; x=1754921489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/dNH3FeYrRLFNsE8lPl3SAjeZ5ud/QO8Uhx48+1mZI=;
        b=H+fR3PN36jSuFpvGkI3XRxgW7jxE0CQDGqnQrphe8EiFZvoasqW8fb62dgMQHUwLzB
         UNAy/NuUzLZtQ88Nab/Jm/DyCgmnQXJCnDI1ldWNz/URkxQCm5kUqEoH3joeJ6rn0v/e
         fdCfQY0kyf6BLSp7w6tJYxCsEi+m05jyeMP9cGWnT2x5vk0qlpjETZq2zYgTroeSWjfC
         fSXW3x+M+fZ+QHE+YK66GOhuPt+iib7dgqisKhw98UUwEO9HlCF9u4jafBpwybrCrSQ9
         Y4vtMgIBWoJifUGasNmyW6U0arJKMmNdhegNUaFRLoYZUHr5WBDHMPGGkpbKL7EIzt+2
         hv5w==
X-Gm-Message-State: AOJu0YxzrndW4Z/LZusx5FttBR70X33oQOz2jFonUDSs0agLbkmToImF
	P4tTf6ArEWw1Z7GWwjNCb6Ihv9D9Ae76QIRnB5kyjJL0XNWDULRsH3LtsO/ZtGGnj0h47kMBPB0
	iW9++hzRxxA==
X-Google-Smtp-Source: AGHT+IE8yJlfGzFt7kta7CCrdssICXTjwzesMzB/FE3Qthy/07S1VLf94JQvmiEXmGBs2sypLXnXQz80YiR6
X-Received: from ilbbm16.prod.google.com ([2002:a05:6e02:3310:b0:3e4:c74:f9f2])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:3007:b0:3e3:d149:8bea
 with SMTP id e9e14a558f8ab-3e4162bc7e9mr164931645ab.1.1754316689640; Mon, 04
 Aug 2025 07:11:29 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:25 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-10-138ca980261d@google.com>
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
index 760dd1d70583489c07e199943ebba361d347bfa4..e83363cad6febb5d3fcd786b76e05bc16a7e4e94 100644
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
 	if (effect->u.hid.hid_usage >= (HID_HP_VENDORWAVEFORMMIN & HID_USAGE) &&
@@ -225,6 +260,16 @@ static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *eff
 	fill_effect_buf(haptic, &effect->u.hid, &haptic->effect[effect->id],
 			ordinal);
 
+	if (effect->u.hid.hid_usage == (HID_HP_WAVEFORMPRESS & HID_USAGE) ||
+			effect->u.hid.hid_usage == (HID_HP_WAVEFORMRELEASE & HID_USAGE))
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
 
 	if (effect.u.hid.hid_usage == (HID_HP_WAVEFORMRELEASE & HID_USAGE)) {
 		ordinal = haptic->release_ordinal;
-		if (!ordinal)
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
-		else
-			effect.u.hid.hid_usage = HID_HP_WAVEFORMRELEASE &
-				HID_USAGE;
+			if (haptic->mode == HID_HAPTIC_MODE_HOST)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		} else {
+			effect.u.hid.hid_usage = HID_HP_WAVEFORMRELEASE & HID_USAGE;
+		}
 		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
 				ordinal);
 	} else if (effect.u.hid.hid_usage == (HID_HP_WAVEFORMPRESS & HID_USAGE)) {
 		ordinal = haptic->press_ordinal;
-		if (!ordinal)
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
+			if (haptic->mode == HID_HAPTIC_MODE_HOST)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		}
 		else
-			effect.u.hid.hid_usage = HID_HP_WAVEFORMPRESS &
-				HID_USAGE;
+			effect.u.hid.hid_usage = HID_HP_WAVEFORMPRESS & HID_USAGE;
+
 		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
 				ordinal);
 	}
@@ -392,6 +443,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMSTOP] =
 		HID_HP_WAVEFORMSTOP & HID_USAGE;
 
+	mutex_init(&haptic->auto_trigger_mutex);
 	for (r = 0; r < haptic->auto_trigger_report->maxfield; r++)
 		parse_auto_trigger_field(haptic, haptic->auto_trigger_report->field[r]);
 

-- 
2.50.1.565.gc32cd1483b-goog


