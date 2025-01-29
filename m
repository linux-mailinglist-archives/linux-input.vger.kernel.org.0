Return-Path: <linux-input+bounces-9610-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C1A225B5
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062743A2411
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D9A1E378C;
	Wed, 29 Jan 2025 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIF+aFrF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09B81E2843;
	Wed, 29 Jan 2025 21:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186191; cv=none; b=Xm8LbtV48WbLVWJ6vs2eD10SuRrihTJqTFjK4xa/t+3rwS12Zry8V3FdJ4hC5EeAJPBT36WeJctcJ0PghrtUoAmTJ2OTJGbpBsFfSpUh2ec3U1i4Vn8EW3qg3OAQ6rjTSJay1RhScc/31mc6c3IXzCAc3npz1sMIGvTUv0J/YtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186191; c=relaxed/simple;
	bh=DoUO+7K/jRRnR59LL7WsIieZR84dJSGaQNmf2dLlAl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZemTtj6T+pNthT8eastqsLbF/qTVAr92IR77GSqJPWmVdXKSrt1CYMt+jUKBkjSKoSj4KeNUoyI7PaEjeoSyP9VAkrBtQUzim6MhHzGs5OfSWqE2/hdCukD9ZudVlHos2J2dc5t8fmf1eJOf6HlTkSCO3mA44eYQG1+r2WYd6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIF+aFrF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso16567e87.0;
        Wed, 29 Jan 2025 13:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186188; x=1738790988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfnhpAmMLmN3ff0F4IaY7GBjLHMJ6om/M0H6/2z9b9A=;
        b=PIF+aFrFrtnD51bZ5ORCxOerhH+Cty/zUfrFy2ATvsYJk+E4QDi7FL885MTqylRnYN
         4vxgkT7/2pDP4Qr0PdcCQDDDN2bV3l7JUrelt9Aw9hjgDU3Ic7YjuGS4lrPHjhjleARt
         oyyeAQSrfYs0fZU4wEoMLR+iMgbDyfX4ARFTUThM+tGmafiUohhhXqe4xr4ilt+83C40
         x3HBIiP4c74426vLd3Ccq4KOuqTs1ZQptRAGoNJCw6PIHOLcy3JywF8/BE9JkzwD4Kwb
         nbngB1nZxvNgeY6KEYdc+VWn4/U7qdu0rLyNRLXVSMoGKlHjvmv+LuuaJ74IPWtTJqq5
         EI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186188; x=1738790988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfnhpAmMLmN3ff0F4IaY7GBjLHMJ6om/M0H6/2z9b9A=;
        b=YchJb90SYfUShVBq0sC6HDvsPlKErC3Qox78ioDK/dFpqNRCQcPDlE+TtV8BqKDY5B
         PNVPSSVaZFWrCGDMnyb4gS4npPka9lNZVb77NyvK0TDBwC6e8m3yHRK5d4nlv0TaEekT
         tkAv+8TfRFX7An/IMVx9MW2gzfbZSRA3XorndQY63wm34E+k3+eRBkHlbknZ2VBD4h4t
         bnn5E6DaExHhfHg3rdBQ/6av7e+Oq+6dPG5p6vJfKNb4FNvCxu3uLxeWMtt3zL8pyreE
         vTpidbhlFViLH4Pk7md4EPNIf+B8CTRre8MoVkIGPSYDBRKqwZw5IqsNo/ONdrM+YrJx
         R/FA==
X-Forwarded-Encrypted: i=1; AJvYcCUK9JG+roo8sBDslta1beNJ452R3zoQ+pwWiiK6QcczqI7E1w4g0ql6TB2bQ4Fhug4yA4O/LspXMtCAqw==@vger.kernel.org, AJvYcCXuJnS74JuRIKbFFI/tnYPBo6cmTT95O+ddo4cAp1lhlGKRqPQxZ0PFsolj/xqPrKB0qrFE2BEZh7Ck@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4/ERBI4INFvvz8kFfZCdK1R/TNogQg6KLKVAIkQ9Hdl9zNHHB
	ApoO7O8oAxLOG4YmEa8LDpwJG1OGc9bhhb3b8cJkL4BfAhNLRjnT
X-Gm-Gg: ASbGnctjvB/SlawCqr6Yug5YMt//keX00xRuqKiZ7St8MiOWn6ns6KcZy7m1Wtt57vw
	pKZ9qdLLnhC1FMBQTyHlU09AO8nPpydv31eHWJWb0XqX/SYtHXNHpSnXFfM6/uk20AAK5EMbGix
	udUv7kUjZPc5Um+Jr4Ge7D0FzRjNnkwUaTiZfWwPahZWvfr6hF5v1SA5OiCvCiZr273XfHT0M2r
	g/sN3S16ZEeVEWFiprRiifiT+gQtKWOpRW+7BDqfnlabbwqywAoTchh57qeKxcOiRQfTHLElW4n
	fDuZWtl61AslMeusBHr3f9XaxIwkrPZLAmGVZbBvnVyH+HBXXMdi3d9SCYeT5w==
X-Google-Smtp-Source: AGHT+IFzs2lawNXCrxjb7H0cv08bZhZl4wFeZmyohRDy02BIvvCU0hma7etvVRkBlHpVRmx1Bxl2ZA==
X-Received: by 2002:a05:6512:2389:b0:53e:398c:bf97 with SMTP id 2adb3069b0e04-543e4be9c11mr539043e87.6.1738186187445;
        Wed, 29 Jan 2025 13:29:47 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:46 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 05/21] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Wed, 29 Jan 2025 22:29:19 +0100
Message-ID: <20250129212935.780998-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
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
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
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


