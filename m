Return-Path: <linux-input+bounces-13526-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 490DFB042F8
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B16F1A62EB6
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5062263F30;
	Mon, 14 Jul 2025 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V/hjgysu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541126159D
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 15:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505791; cv=none; b=qLCYwJXKF/sS88dRcBjx/dox1hNUZZo2KZpGjo0v6meFv2Zaq9fnfDF1wQnv1BQp2mWwhPxaPI0cunkUHwbQ2e8DU/nj4DzF2LHYjxuHzmLQreQpL2zHAv0ZPpDN/C8NfkE89P5fhluz1yMgzZ5HHUBlIcDbovPfFemRC8KHxb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505791; c=relaxed/simple;
	bh=5k4hOmm5FsRqTINdSqHY+MKywj3slz9dJzmfWE/9h3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oDUUSM9diz2Sb0mrlLfiL963uBXua4o4vDlT+9y2DAQCkyW7aoql+4BG18xcSUse/KWK2ZY88UOtQySiteM4FWeYIio9D0WffXWSsFjbEIOTiXxt6TnFSCBNA1I3h0trNzZ/3MlF9l87lMRtGbP5QcWJVfJMJcTUsMQco05XwGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V/hjgysu; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-86cf306fc68so755168239f.3
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505788; x=1753110588; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fJOIFm+8Lh6RSd39ar/6t/YbVeNymW5Iv03T46CT4Yw=;
        b=V/hjgysuLAfD6hx8bS2dPeJmOu4nUOMObvq447LObOR+Li1BU+nWUiX4AG+qWVh5rP
         fQEtp/48gSewqasmw4Nmc4ehYWkGbmTW/aFi1exFwL4oZd7zRQgyQN4LPfuZcpBxauMk
         I2S2NXBxUHb6hgnQyE6zBVj6IErEi/NNr9mynubrUYHiHDIzXCWZCQjPuCThiOyRlqBm
         V+b1zR2KTIlsvs/FTxvati8FdLmqfre9ZGsVY6a6szPF9hp0e8xwYsfIAjjRkJtdyGCW
         hUEBhbtb0oEBoktP9Qu1bhbCXKpet75srmN+yPwwbcBmzI5Tjl6ZcvxCI7xuFLeCkBeT
         8TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505788; x=1753110588;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJOIFm+8Lh6RSd39ar/6t/YbVeNymW5Iv03T46CT4Yw=;
        b=PRwBfwgtSfK2f3Xs7mOdNqZ8tpvHNVnpNc2yN1IvhnmtTSEqgapTLW0/wDK9ySZ2nZ
         hXdB+dj1oTP2MT3nkgDA2RNOPCxUEhcJ6d0onmAqpDb0A5k8bW12PTaSwfsDU9fDuWEf
         cyKLW31bmcwbIGtYLk41zoDH466PJWeFnrtX7eqP2VtHZG4z/83zySef9NrPUy0qkPLn
         Xmk9wzcBkMpg8hjgLL8WIAi6V9MKLl2mW2a5H+xGFpNQnNQp1LtSx2YqY02ZTF0+g0+S
         hxq0KN+L0guf+1RbBLBBGi3yyBn+jAcKUa+7F/u1Ey7N/hYa8XVWmiiGrweljW9V20Nf
         eLJg==
X-Gm-Message-State: AOJu0YzQJQ8k2+Tf4x2Dxl/RyXLRKYsk6lWinCh6JNtigvXvVPCOT0gJ
	Io38uJhY8AOP3k9JyFQ7DLKwRvKP6+fVx4xJc/aAigpBdVcdwmJARtGipD7zHrfEo+6wO4gal+I
	Al9hJAy1dFQ==
X-Google-Smtp-Source: AGHT+IEmubYECGBWdfe0DU+VaAT0zPkTkvt6Zg9ztBCJhb69BYC8pSS9D9DRVzRcXnXRT57XcoW6QDr+BH4R
X-Received: from iovt22.prod.google.com ([2002:a05:6602:1416:b0:86c:fede:130b])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:7408:b0:876:8790:6ac8
 with SMTP id ca18e2360f4ac-87977f5f085mr1286207339f.1.1752505788704; Mon, 14
 Jul 2025 08:09:48 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:43 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-10-71c7c05748c9@google.com>
Subject: [PATCH 10/11] HID: haptic: add hid_haptic_switch_mode
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
2.50.0.727.gbf7dc18ff4-goog


