Return-Path: <linux-input+bounces-9647-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D87A2489B
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C35F3A6D2D
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B453A18FDAB;
	Sat,  1 Feb 2025 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5Nzb5qX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD33189906;
	Sat,  1 Feb 2025 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409958; cv=none; b=Fnw2XzvkHZD9PU+OiMqX0zVfoYKVzPYSI21sQwkH4QQuqW6MaNusaSojpjK+g65r3mLOR7OI+0SNAUD3tAZCN7WkGpTgaGkLT+ITUE+a4reBQZgYVSUPywm0MjswjDZZCz9vZq5Vi+B1haXCHVGX/5W8wqgMnMuX6oLNNvgkrDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409958; c=relaxed/simple;
	bh=GQ3JpWD6lxEIaQRVWAAtfVtE94/PmGLpvqY0nJ/sBdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uvLRRnqzLWn9wuetEnn2dvIk6nouRWmXN41DN+fGBMSA5W2Vygh/biUF8sU0joERmgtEGXSpda4a0bQochiKLMpigt8k//89w9+3Ibkqw0FDcJXYMsZ14so/GlNJt6DEazb49OtlVlIaRw9q8hoYq5AhDZHBA90NnPL3QUoj1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5Nzb5qX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3cd8e59fdso495317a12.3;
        Sat, 01 Feb 2025 03:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409954; x=1739014754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SskOiPZbWJ15hO5k1Oe8mGYcXU3EStCinQJvQ3udzKM=;
        b=M5Nzb5qXvk45mxzSovhSTM7tAfngGMYjVC6/12k9++RlUqLX3HipQc4hkKMyOlo971
         3olbD9S6USwrXQjXwZ6fB9solEA2i5+IlxhhIcnz4fnf+Dkwv/x++YNsHqE0xLOAPx8o
         Xzg82FocpB4DZECbr7aNsu+LeICcCdYSmoGrthbKDTb71+IADgirpIzQSY7rEL53a2lv
         hKtfiU4SDuGnFm1/W/5QdtsAzaqj22+R8FQFBaayjIZgsXE5SPJz7SYOKk3krcPhLAjh
         DIunWGBkoqWmdvmhnFlFHbTY1Urv0Vxj+MbhXgUwUpSh7b0GaDDH0PeraEXrx9UE9llX
         FjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409954; x=1739014754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SskOiPZbWJ15hO5k1Oe8mGYcXU3EStCinQJvQ3udzKM=;
        b=Kd1qcm3hvbyxT45fEwwHBEyUFIYg7gWLNYvpiZwv8RhYgCLFWuJPeF4Om7HnB0/3WT
         5drtlDiuU7vcSGJK+PTrod5Uza4UKHBufLszj7XITpHJHsQ/1iIkgRndHkX/W4X1Ql17
         cdVavX3VfZiS71xgBho4YBrHqmLA2bZSv0STqNY6WpM79t92jkelEMZ8kTwb5mww1G+0
         7IVtKqNDc/z1/Y8v0XAR5nVu55dKRZiENK2agUmaJwP7SuZY3biG1N5S1CBVykilape2
         +QZqmFZVsgSldsUSrDR9uTlPstNhY5x8l8IjknvgtotkOwOXW+QFx3pjK8UZBE8ePYk/
         Qn2w==
X-Forwarded-Encrypted: i=1; AJvYcCUX/sJHE1PXeaOaTMxKQaV+ZF8AAliknSa2/UXmrbs4h8wdXnVitY7FleEfkRvOsSFTgSPokz68kwR3@vger.kernel.org, AJvYcCVz9tJVwOhcZBWUFiIZBPDURtU9fNls4U3wgRbqkHxjUbUNZrlsKrmHoh3q+dBmESOtlpiUL6h3puh8AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCAvNYJbjKLNdcrz/FpYWPTnSe+fv1kzyE79yjbDvx7B+wFY+
	NU4jha4i4lH6Dm33BqDsMMf/PQBdAj2vcMnWWffplW6TbSRtTcK8
X-Gm-Gg: ASbGnctC9K7XbouRbFQ9EbrNATOVohT/vntxtAybmpTDPUuj1MDpcBRz1pNpcYHSfUR
	SKzBVSvPK6YDLwahcqsr/Na1o0QmbU8TzRrYKBSEY7Yuve/OFUoc3qhKkfPbciGErc6N2YxUdLq
	JifCe7yfQZyUvCkJ98Zwa0SFzrJYIaiw7wsCShtQUEGKNK62Qpdq6n6XDO6pZITgpt/4n/9j9w5
	PqEX+ujB+R65G9IQdUBfeG/xyItaJ0c6lrwYLACIfnzsj+qh1r12OZrBtBsyMIuDK99pb+S9Lwt
	quHnGsKhBC4gaBg1VDM2P1g+Wd+ioybPaUJBH6GBgKJB8qAMSd7selCZNHmdDg==
X-Google-Smtp-Source: AGHT+IHAfpCrjARwVk+sIeSKHzXRNBRtKaZbfLFmHfKNIYOb0vIYJSMiXSinq1RuzI+HXPJfIhIJVg==
X-Received: by 2002:a05:6402:6ce:b0:5dc:7374:2613 with SMTP id 4fb4d7f45d1cf-5dc737426b2mr3100183a12.1.1738409954186;
        Sat, 01 Feb 2025 03:39:14 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:13 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 05/22] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Sat,  1 Feb 2025 12:38:49 +0100
Message-ID: <20250201113906.769162-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some devices with only one axis are missing PARAMETER_BLOCK_OFFSET field
for conditional effects. They can only have one axis, so we're limiting
the max_axis when setting the report for those effects.

Automatic detection ensures compatibility even if such device won't be
explicitly defined in the kernel.

Fixes initialization of VRS DirectForce PRO and possibly other devices.

Changes in v6:
- Fixed NULL pointer dereference. When PBO is missing, make sure not
  to set it anyway

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 47 +++++++++++++++++++++-------------
 include/linux/hid.h            |  1 +
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index e2e431dec936..89a1b6a55c1b 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -404,13 +404,19 @@ static int pidff_needs_set_periodic(struct ff_effect *effect,
 static void pidff_set_condition_report(struct pidff_device *pidff,
 				       struct ff_effect *effect)
 {
-	int i;
+	int i, max_axis;
+
+	/* Devices missing Parameter Block Offset can only have one axis */
+	max_axis = pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO ? 1 : 2;
 
 	pidff->set_condition[PID_EFFECT_BLOCK_INDEX].value[0] =
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 
-	for (i = 0; i < 2; i++) {
-		pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
+	for (i = 0; i < max_axis; i++) {
+		/* Omit Parameter Block Offset if missing */
+		if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO))
+			pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
+
 		pidff_set_signed(&pidff->set_condition[PID_CP_OFFSET],
 				 effect->u.condition[i].center);
 		pidff_set_signed(&pidff->set_condition[PID_POS_COEFFICIENT],
@@ -822,6 +828,11 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			pr_debug("Setting MISSING_DELAY quirk\n");
 			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
 		}
+		else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
+			pr_debug("PBO field not found, but that's OK\n");
+			pr_debug("Setting MISSING_PBO quirk\n");
+			return_value |= HID_PIDFF_QUIRK_MISSING_PBO;
+		}
 		else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
@@ -1101,7 +1112,6 @@ static int pidff_find_effects(struct pidff_device *pidff,
  */
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
-	int envelope_ok = 0;
 	int status = 0;
 
 	/* Save info about the device not having the DELAY ffb field. */
@@ -1132,13 +1142,10 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 		return -ENODEV;
 	}
 
-	if (!PIDFF_FIND_FIELDS(set_envelope, PID_SET_ENVELOPE, 1))
-		envelope_ok = 1;
-
 	if (pidff_find_special_fields(pidff) || pidff_find_effects(pidff, dev))
 		return -ENODEV;
 
-	if (!envelope_ok) {
+	if (PIDFF_FIND_FIELDS(set_envelope, PID_SET_ENVELOPE, 1)) {
 		if (test_and_clear_bit(FF_CONSTANT, dev->ffbit))
 			hid_warn(pidff->hid,
 				 "has constant effect but no envelope\n");
@@ -1163,16 +1170,20 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 		clear_bit(FF_RAMP, dev->ffbit);
 	}
 
-	if ((test_bit(FF_SPRING, dev->ffbit) ||
-	     test_bit(FF_DAMPER, dev->ffbit) ||
-	     test_bit(FF_FRICTION, dev->ffbit) ||
-	     test_bit(FF_INERTIA, dev->ffbit)) &&
-	    PIDFF_FIND_FIELDS(set_condition, PID_SET_CONDITION, 1)) {
-		hid_warn(pidff->hid, "unknown condition effect layout\n");
-		clear_bit(FF_SPRING, dev->ffbit);
-		clear_bit(FF_DAMPER, dev->ffbit);
-		clear_bit(FF_FRICTION, dev->ffbit);
-		clear_bit(FF_INERTIA, dev->ffbit);
+	if (test_bit(FF_SPRING, dev->ffbit) ||
+	    test_bit(FF_DAMPER, dev->ffbit) ||
+	    test_bit(FF_FRICTION, dev->ffbit) ||
+	    test_bit(FF_INERTIA, dev->ffbit)) {
+		status = PIDFF_FIND_FIELDS(set_condition, PID_SET_CONDITION, 1);
+
+		if (status < 0) {
+			hid_warn(pidff->hid, "unknown condition effect layout\n");
+			clear_bit(FF_SPRING, dev->ffbit);
+			clear_bit(FF_DAMPER, dev->ffbit);
+			clear_bit(FF_FRICTION, dev->ffbit);
+			clear_bit(FF_INERTIA, dev->ffbit);
+		}
+		pidff->quirks |= status;
 	}
 
 	if (test_bit(FF_PERIODIC, dev->ffbit) &&
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 94ad5a510639..29f0a91f505f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1229,6 +1229,7 @@ int hid_pidff_init(struct hid_device *hid);
 
 /* HID PIDFF quirks */
 #define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


