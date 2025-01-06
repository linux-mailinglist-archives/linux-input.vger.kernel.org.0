Return-Path: <linux-input+bounces-8967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9065AA0321E
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75E7C1628BD
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAB91E00BF;
	Mon,  6 Jan 2025 21:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHX7MPhL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92671D47A2;
	Mon,  6 Jan 2025 21:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199353; cv=none; b=WnUvkeGyTRjlfQZ4QDo6Zqhk1ptLbRjo5pFQIY4/h2RJ8JliLqwdsBj2U9G15VB71pHJilV4OCD3yA8AaxiOPdt34UUWSvr10CNf8r61fdEGtzq1Q3ka7G0HfzPPw8HUIJ0jL9VfTemY2XSgH/N3oxhV1XhpWafkrt98JOlzZLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199353; c=relaxed/simple;
	bh=Y01bZZyEKBS4Wp/QSV8+diqsxBe4MEehIrGd35l+14c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=deVzeGkF0YGgroFuogrWhmqpOXllVHBe+9qP9CNejCV4gRpwJLKJyO0CjyiPc42UYtlzEAL5459mQRccMbq1iqL4BW8ZJFW9ZZZ3+fnK44orADuq2fRPQ+MOunwwlgJl+rqnQlJEErZ/eIzUWY8Kk4273q4b2vbLR0WNiRHZpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHX7MPhL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so3451071a12.3;
        Mon, 06 Jan 2025 13:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199350; x=1736804150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMzq8PvIJV+z6yV01GtbnkWq1T0M+f9X2iY5dtwH21c=;
        b=dHX7MPhL6riV4tNF1NtTMmsK0X2jhQ+XYbLk9sRWVNG6/P45GvvTL+p119sSjBamaA
         piqrA1+1ANc7kHWyspyWcsWUAvXkAL0xs+jaxIdXYbyo6VOGgCUxXlwrO260fgr5lAGG
         1j//uh/RLl8ga6xo1RK62GryF5GEPq2/81VxP9NytPwrKKyBW8JcFC06lZFFUQ1cZabB
         7K94WsjVl8XRCO53llwBaqFh6wxiX7pghdiE/ca52YNupuFo5wPC3LzBh/3iH0PohQZr
         zKR+M4g2qYTwvVJ0wZG0Teg26IAiUYaCrE1sdKM1Tbq9lT8jQcazDAkLpKsVDejQoeMv
         /1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199350; x=1736804150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMzq8PvIJV+z6yV01GtbnkWq1T0M+f9X2iY5dtwH21c=;
        b=vgEjeS2SLTO49vmg95slPVSxC+S357lUechxkJL5bxgN1LWCNH9mO4/1KNck7ox6xd
         zFB7zw39LtOMsRs3I51PAwVtyv5szUNZZU++dRR9a7tvEL/clcN3w4TR8mj2PzY62aq5
         A8NSgICVv0A3B0C0BCEvvMA8lb9mCn1V1bF8B2GIc6e7rWxA4IYG/Su70OMpFDbUWSZI
         wfrEvQuz0AJO9pwwwPVmBvG5mKkMoLfA00so30SdzGc6Xp4f5WSNMlojJW08vuqQiVOZ
         q2+IRJ8uqZIh9qtplHQ93IBRLX0LiGnj64ZK7OeAHAez7mYTy5G8oVLwJkcZVmVuiJKX
         yltQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRLCWUy4n2x3+QV1prU77vUd96/ioR3GqHxESOk24MH3S03GISweD/K7qNJoi8cpEEvGLPVLJ0zAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYLfZ6MoDyjD5iTBh4Hz4bGGgesdE/jhtiZLqpdfBZB5hnT8M
	i8+H4ooTSsbEsPFpuFxBXYY0Md3rC1NGMiQrpjbbH0hXGfeD+avHzDz6Ubac
X-Gm-Gg: ASbGnctRi+key0ngAHw5nGbQZY6SuV0HM5KhjdWIVCx8F03XmYwN23X66u65slUnS9B
	Zf3U+oJrV7EOsJGMDpTIsy+3ytjK3ED187deFf6CDcxUrMLzIKPAbyDaf/mVgPvHNLKgrOXWh8R
	qKf3IJdMKDsltTO6BabX9ZmgjJrRS8QqBWgd2sSRT3JjuK/WxpgYtCyB6O/CkVttt0gIaxVn7YT
	Mc/UJLQLGIQPkAB7L35D4UXtP6gYUDaGZDEk/M51wRbAN3K3IIPa8vEbeXaxoyKj3NohUn5H4wY
	qSLgJBwzwwr7u6sNKrBJ8rxjib4=
X-Google-Smtp-Source: AGHT+IGRWGu9lEj+TyUq1EHaVU1NUY201j+6/c3czWD4kUx/2wfUYrdW0AHgCtGORO+sOV7YbKWIAA==
X-Received: by 2002:a05:6402:254f:b0:5d3:efcf:f163 with SMTP id 4fb4d7f45d1cf-5d81de38c3amr17957152a12.11.1736199349881;
        Mon, 06 Jan 2025 13:35:49 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:48 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 05/10] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Mon,  6 Jan 2025 22:35:34 +0100
Message-ID: <20250106213539.77709-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
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


