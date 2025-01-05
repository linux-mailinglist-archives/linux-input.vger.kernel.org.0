Return-Path: <linux-input+bounces-8899-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA36A01B87
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91B6C1883167
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE8B1CEE86;
	Sun,  5 Jan 2025 19:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiF1oeOS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAB81D435F;
	Sun,  5 Jan 2025 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105802; cv=none; b=MJpF2nSLLNsDpb+QjmgxLOOmSD36ORRwzRbv4bMeV/fFqiaqgQZOOopUNowauDiAy7E6bAHU4CTGVOg8limNHuAGKYaujHSm22b9UjlHHcHKlRzXTIWzHMKB9LO3IS79Ik82lQcapwAynwtyNmzd+IYTCvyr6OK5IEc9dJZKhKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105802; c=relaxed/simple;
	bh=Y01bZZyEKBS4Wp/QSV8+diqsxBe4MEehIrGd35l+14c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okikpSn6VaTvWg9gHh9wWfuoOXw+7iNnVI/Ad6YqGMjZk1wy7FxafB6duMx6HvDMuO/g4sbIAIGQ0qRZN/Rer9+cLafxjcm+VdeBNxQs6wiFDkJCNwQhsu2jI/PYSIlWPeSaTZBQn4CSQ6vYFLY7NcHigSxZsrJQhr+kA6M8jxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiF1oeOS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-542678284e3so422972e87.1;
        Sun, 05 Jan 2025 11:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105798; x=1736710598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMzq8PvIJV+z6yV01GtbnkWq1T0M+f9X2iY5dtwH21c=;
        b=iiF1oeOSyVXVvzB6PtFOgv3Xm9Wa9qy/3FjKkhBpviZ8LnNV3RPVDtUTjdm56RDGyS
         5tC1Ans+yHZ6Lo4v53ZJ583C98iWmbOFXGaAVqckFEDQuxD3Kkdv/uROS2HxZYgV52RT
         +Dt+09TufRskoOi5WHGd9G9cyEZYkQYy4jcstyxlmmU2okMZxQi9yLXiRVCht5jSyLCG
         nmBzqsH3AayYMoa6oKHNpSt4FAr/yn7W5VJB+G/0KnYSfAlBkHXxzcPlR3i6RaX/lj70
         h1oG90voUkTjRUW6JV+ZLRris9eziewN5XLZg4DBTbtdoA1Nmc73IdEKS/rgNz4enR94
         Q1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105798; x=1736710598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMzq8PvIJV+z6yV01GtbnkWq1T0M+f9X2iY5dtwH21c=;
        b=kycLDmn6p1jWmesif7ev6G0hMznqcuVHo/uAj4KMFnOWbpXIW1UPoTgcxNY337K5X7
         roz6PCGC9MvugtRGAQ3triWbS+8urwt1D0Z86EKEWemAQQUfma955+yd5oH6XgHFo1iT
         NTp9AKko6l+xb1VKy576Cvj4GB0QF0WvB1SGBpPRw30PnZ52ljd+rsIsz7RkOM/HwFH3
         kOpGwrxh0c9yWfl/L6SeH7Csagt3IoMaOnp5I4gK5MJZFWWeFPoSsSUVVQYd3sh2BjHr
         DtE5WPFe4zXknv2ZJ1NeYtWeOovAidkbcPqQbgNgAwLqcj4Dv7joYnH7trn7EJOAtwV9
         2KkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHsE5K5/gx3g2r3FVTLIQEdNvARVkdWqQdRInMH2XQIJMqxG7VPZ+2wpZrhMXQ31R7C07uFNjBe2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tq/c7tj56i3ovTeArx/iehORar5pHB/nv9/yk72qpuxSw1qJ
	OO+hA0YRWx86zWj+Dzo863PUBEzpHrTe/tcQ6M4mj0jes4xo/snHl42g0CIe
X-Gm-Gg: ASbGncuoqGZ7T4VRw9cnKzxsygjEzfuRBhDBle8jDXOGe5L/mkwODJg38XyEK9s8Deg
	MLi5ZLFyllowBk/wYJIRntU2ouSIyCoeIa4ERRVYhoQ936USChOtZFVNRV0VMhTx3sxoXVAewTa
	Ym804Veu8j8zcBsh8phT+hO4UwFvo4J2sVrYzXfP1As5Ig7zqdWWSH31LSwKgNkbCqbdj3YhB+l
	IaLuy/m6NRYadcc/DHDUQbpranRXY8rJtpsv2VLZ00IoONdVLRZ2QzJmugT7E4s+WhDfmtedLXg
	eKiBpJ6gUz6Iji1pfUuu89nDOmE=
X-Google-Smtp-Source: AGHT+IFCBWtMn9YmBwXz2FwsNFhQ+uR0ERJM+fwTLmt2pWLDLBdaACQv3NsBijpU5e0Nt7GZOLWBzw==
X-Received: by 2002:a2e:bd05:0:b0:305:d86a:4f1e with SMTP id 38308e7fff4ca-305d86a5175mr4472321fa.9.1736105798361;
        Sun, 05 Jan 2025 11:36:38 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:37 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 05/10] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Sun,  5 Jan 2025 20:36:23 +0100
Message-ID: <20250105193628.296350-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
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
2.47.1


