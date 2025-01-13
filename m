Return-Path: <linux-input+bounces-9187-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F165A0B76D
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14DB3A467B
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7433023499F;
	Mon, 13 Jan 2025 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOOUFN/U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BFF233D90;
	Mon, 13 Jan 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772575; cv=none; b=PknFZGkDs6Ov5cfDxghfJoNH1NKTIrCDAlgXdUDktG60dHstF3G8P84D3xEREVA1zpDBj92fng8CpmTwaZ4RiSHP3jnKQFceTeV0wYo+7gmFGu/cg9z437z0O/9eac39Je3LIWopsrmUv2BMu5uD1wSY5PRBfWhH2qe4qeypbSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772575; c=relaxed/simple;
	bh=Ot+y3KAsKJiQTHl+yJ5iu8oBxm8Q1YEO2CdizgQfEQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZmQT01YrYYJ/6A86Lnp0PXmXNT3BzRhDJmhlQP3//V+62OnJiwZZWU8qCaIitKcPnCUj4XV/hmBG1sv8vbY0Cdss9YHX8io6IX5cfu0JmHyMHHcitNPr+2CxyO3sch/2tveVM0ig2+h1QPvePGGAHXCPsNssp1qKbtVpEU9EKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOOUFN/U; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54019dfd6f1so503642e87.0;
        Mon, 13 Jan 2025 04:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772571; x=1737377371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krUoUcBu6WwcLldC7P4K+sSvUl9VNjkZj8hK1ckmfVQ=;
        b=QOOUFN/ULuir3NiNyhaNK4LA8osUgzULbF0egcENF+iLYvzhwQ3Pe9yUBtQNEBmFFl
         MMM+ysZyFk0wVxvsyY9dRSm3PtyPVkWGK4N/goBbQRZtCsNuVx7ybsAODwcQQXZitiUG
         IjXm10yIVlkf4EFwNQOzYENEQqlbQCWTecrdO96uc0gzkyK2JhiWTxxbWsuP+Bn/LZhZ
         VBl8wSG0/72pCi/bwDWD0LVfClpQ7rSQsO7DBAaOETg56sWSm7DKnIKT2dF/B+A6P4H6
         EAgMaGCvhF2IW8NPkO+BYybsXWHLFLJchUC2B4LYin21ha2n7oUgZ7eOkFpaaXkFuzyc
         aNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772571; x=1737377371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krUoUcBu6WwcLldC7P4K+sSvUl9VNjkZj8hK1ckmfVQ=;
        b=UJFFwoZhqOy2EmaNrwbt1DizEDRVcyKNMmHh5mF6GRb4bVrfV74b2FjCjrH0gZ6A5V
         m+/oUac25A3wg5xKOiJHaiBKCek4yyTAEJG1GLrTWx8ojPah7cJrLtgOOv3jiaBNCu+K
         ozho13Yhn8Yo600Qfby0X2ANjvPUj67neymcYEEWLCMAOoMnr4wbMCQ3kiBUg3HknTjP
         uCAwplHgW0ya+x3YQh7Sh/4w6v2uarrxVD2dGko9sdb1kg37wUARuYmBOteSI7BG/Tzy
         QhHOpDESa6U5G/2CkTGHgUGiM7B9UtYk8kuM7edjseqsjdfuu95oybAA+8/3h9KcIA3V
         l7EA==
X-Forwarded-Encrypted: i=1; AJvYcCUwPhv2OVuyqDSFj3yeFKUbASs0QTQsETDaELxEkLOVjPhElVNERH73wQbbaGl5EOYaUlPFv+jn33H9@vger.kernel.org, AJvYcCXivc6tCVnsRiyimUDonWsfy7fo7sfxzhKjGdS5YxgjTQu1DmRHj5rGBNZMO0stBOYO73Nbq2MYJTXYRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6XoJ2wL6XhHbDrus13tLOTcLHiljWM86SUGPrYOCUoL9hwo9
	bUnXoA7oIuiCy6vyY69Mltkl9fT+Od82jVQgF6OUyVwu/80E2VMt
X-Gm-Gg: ASbGncsxgS7WOxs4Snvjnlx/VFlGTRLEoh5v2eaOpEIhr9sXfa0jyjjNJsWnVMdBS55
	/VV9JDspgIdI5+zsa28VO68ZzOSmSTaJCuOJA0w7b0rXGDJSe+fGYS2YlTTj5M/xUxOiuXOV6Oo
	vbviXzLFOcH9YjEEKWhlQRuMbeNUHZqzY9enDmMjmM8cPS/D0QHmQdIChjfZpiZWx4J+1SkvtJv
	5NMxQw9omTU/wLqGIFxyN3JMq6QmVLxp0Fb8bBmr874wcMRSkygsuuz8FLscwBKT6Yszi/psw7D
	uVNjMTC3THpvvj/obStQsU+Zrdg=
X-Google-Smtp-Source: AGHT+IHxJkO7EO/2VDGR9wppmTw5M6zyH7tElw1ncOX7yJW+0ZiubtK5/7WoMdS4gABuSdUfOF2LzQ==
X-Received: by 2002:a2e:bea5:0:b0:300:29ed:b7c1 with SMTP id 38308e7fff4ca-305f45db428mr26137911fa.7.1736772571163;
        Mon, 13 Jan 2025 04:49:31 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:30 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 05/11] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Mon, 13 Jan 2025 13:49:17 +0100
Message-ID: <20250113124923.234060-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
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
2.48.0


