Return-Path: <linux-input+bounces-9387-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5FBA161F5
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC24B3A536E
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA801DF269;
	Sun, 19 Jan 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7j16T2L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A711DED77;
	Sun, 19 Jan 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292450; cv=none; b=AIgHpONICIZsk5gXcKhScy02MoyYoPGm59K3G2KzzFja5kJXz7udUBGeUrFxH0/bsBq+Cbc+/zzSKyQPcnwuw7Q3K2dzIkpFhbbyCkfUi/XZd27FruvhWA5WKJNpeX4WFiFkSIbacuJeCGwGiIMC7vrhUv6qXBg9FNV88FHWVNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292450; c=relaxed/simple;
	bh=f+YNJKvymOAQY/YbO81rkVu3Eq5JnmaLmGDoKgXnrlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RlwspAynIr6Zw4E+Va3JYtRA0/UZmdhhk002MqWPppDOM9dONPUPzHW9BFJm4grYBi9UjeAb6s4NsQEgKTzwcM9Q/MTeaBegE66lv+iS/xwvUx+AahuKf97k3GkSmZQIK9taf0FhQIY2Hcdf7q9vikc9FTvCZ3ojcmlVzFsVpfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7j16T2L; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5db67d1bf0bso628025a12.0;
        Sun, 19 Jan 2025 05:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292448; x=1737897248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQAq8vRZlQfX30KmqHs7KQdjhtqm3WAvW25rBYVEIic=;
        b=M7j16T2LMb9W4U5trnbXHFiR9/cVM8TmuXCCGCB8GIhtTqikdm0mVuuNpav9zYJbPM
         oxdSRgJk92R1PuGjHp/K8TwAeDdz+8bwrHhXoj4M/FUFHNQI5TyFaNK1ER0mgaeojBo2
         7btVN38l8dEw2Rk03y7Fr8RDosWu2c97Uai0l8u98t+b69eqZU9uAZdgUKIMXL9VCQ4q
         5cFOQFEEh5mJmlrBi5DhngdirzWCfBNF0OL2JLiWwRAvBUObcJJnhMUwuAK1yhbYLkUi
         EgAODiae2I9dAWjGJSMntGKm1ONYmChwVsH7AOzY0xy7ToILfojy90kkpsupI+AuNkbF
         bnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292448; x=1737897248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQAq8vRZlQfX30KmqHs7KQdjhtqm3WAvW25rBYVEIic=;
        b=Pp5VM5RDmGhkrDdzgQw1kqYTkdL0+AfIjitzeR3MbVKTuwG4ZhOgK50imGLnJ9bb0d
         /lU1ohcKGZSRhvvvsckkRgn+ZGXvrBcn0cLgxy+2VNyHWAFnVYylK+pxGCZq2ej0u9a1
         jwfbpPebi3y0THAYVnuX/PmUUBFzzkGIL6hzxVfHlT7xt7HcunZL2avvTWE2PE8I9KNF
         HSrng8K8WW4rznkX6S5GJ8wMSlhc397nFwy5HYhnfAxqRF5dUmQKINqto/tNTSRgvSiO
         Hy19UHhtBgHoKUiU0IpWucFwSFfUMYrMPmRbMwNQ1lE2m/9Hrt5MWyGSP2YvpsfNkDOg
         5QGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmycgrxX5EfLwIpbQvrtfIpsJLYaXUgaf5NRMS9CMasvw2mqP82uYHhxJEnZng9mZhR1sIn8G9/e98@vger.kernel.org, AJvYcCVlrEc3rLGDxdQMl7DyXetk3V4nh5dmgXuYTHN0Sx4noplpZJS3/tajE/KNWOHzW8qisK4/nsOONYtI7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJ2VBdnzzwamJm77yU7jF83kL0sRMJB2cpUg35pnW7ZW1x7j2
	M/rE2H19L9rspVx9ZSIFvGD4UZZt0wD2AthNSkJ6WLGw6wb1PshZQwCJcy/A
X-Gm-Gg: ASbGncs5H0H0Ld9EsMVMkQBrLTHYAXyjbFLsAjCFhhw8qpc09M+uKRXquieUX61ZugN
	NK5lEIweDWNTm5C46VpKlp/CHKTEdsQ+IFbYNYy8X7kg+mk77SYZgBQhrax5tWuUBu9+rQNNt+c
	U0b8uQXh9VJoMwcmtJ7X0IjrcrAbfLY7V/5I4f5eEPCsHhRxignxZEFylhtrSO6tmfIpDBkGnNP
	C9zK8JUe/tFcv7V2RRMjw2JJoftdPZHWFqk1vxC8BFykiOzjn65EXbrDj1sTkMW8hK99u94RZrK
	Tlb0hjbRg1D3oPIxEC0TMZUux1Vb4yz2NRx2xt4c
X-Google-Smtp-Source: AGHT+IEL7FjufhVzApXcJ8MDy5tKrNjRIoTh5zU/VOQ0ARdnJz6S+vnl0XOCFv/jI1r/LCC8EO1Dnw==
X-Received: by 2002:a17:907:3f29:b0:ab3:7812:b3c2 with SMTP id a640c23a62f3a-ab38b1b471emr353429066b.2.1737292447346;
        Sun, 19 Jan 2025 05:14:07 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:06 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 05/12] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Sun, 19 Jan 2025 14:12:56 +0100
Message-ID: <20250119131356.1006582-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
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

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 46 +++++++++++++++++++++-------------
 include/linux/hid.h            |  1 +
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 28f42f30e2b3..d792a07b5a5d 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -421,12 +421,19 @@ static int pidff_needs_set_periodic(struct ff_effect *effect,
 static void pidff_set_condition_report(struct pidff_device *pidff,
 				       struct ff_effect *effect)
 {
-	int i;
+	unsigned char i;
+
+	// Devices missing Parameter Block Offset can only have one axis
+	unsigned char max_axis = pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO ? 1 : 2;
 
 	pidff->set_condition[PID_EFFECT_BLOCK_INDEX].value[0] =
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < max_axis; i++) {
+		// Omit Parameter Block Offset if missing
+		if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO))
+			pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
+
 		pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
 		pidff_set_signed(&pidff->set_condition[PID_CP_OFFSET],
 				 effect->u.condition[i].center);
@@ -839,6 +846,11 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
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
@@ -1118,7 +1130,6 @@ static int pidff_find_effects(struct pidff_device *pidff,
  */
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
-	int envelope_ok = 0;
 	int status = 0;
 
 	// Save info about the device not having the DELAY ffb field.
@@ -1149,13 +1160,10 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
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
@@ -1180,16 +1188,20 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
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


