Return-Path: <linux-input+bounces-9519-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 411DBA1C368
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9A543A614E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FB52080E5;
	Sat, 25 Jan 2025 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHTl0F2o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BA51FC7C3;
	Sat, 25 Jan 2025 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809695; cv=none; b=Ki8Uv+yY1xXXHlhiCEinshPewZcvHTDzlsFv2/5PThYxU6ZbqklCEJSJwfXc7q8Gs1MUMRoCkxk4NgtiH7zx1hRNSldrmxhn+pU7/RNpx2expgmf8eYyByXnBp0c01s++FesLvYE24i1ipJU7PrrncPYZX6wxBiXwyDhIgFovek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809695; c=relaxed/simple;
	bh=8GmzhpaMxYiy8UkJ/MzDUSAv38faldGoZ9y5VIJO0dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAb7UcdBVnWIFvNK/X6WIIlfBWnQug8LVaBtZra6AJUbJx2VM7aQnHjWMIfaCurt/4sMHBNN/fGQvH3jGyaTsxTxSbtjkrxjEqfyXY0ncAQotuImcDykv1HzXv4+ruzwtNkGrPtoCCPpnGrLQafJs0oLHQVPmZeuPEvp5OVpsE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHTl0F2o; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30600722804so1776201fa.1;
        Sat, 25 Jan 2025 04:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809692; x=1738414492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxiAHTud/zEPLuazvDKVn1LXHelcgSwsXbJXagSiwyo=;
        b=DHTl0F2o2Bc+d+XPQIC6cHeDvw6f9baccyI8eFumXKa08IznoHOuxYJaXzSaCmMU//
         yFJtgmLjBtoZQzBSRIBZSYldhRMygDwSddzayz5GBo7TYmyVWrARdpVOwVTqLkRGi0Go
         abGRHFAkgxy7GutlM6UeZZk1NsBc2nT/yZcSQQmg5rW/2/LQGCOe9B+TbfKCY3l+mp5j
         WoYV7+xMTsSvq0yATgyQSNm923pbGknepAkn8HXSdooxWY0szE48dcVFMwLQkrdqVEtJ
         +jZOTSxqAbM/znQrzz4KNfRTFbG1N2ov6d9C65V+hbn/WDpJ2a2a6CKfn2IJ5AUeEf3i
         OreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809692; x=1738414492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxiAHTud/zEPLuazvDKVn1LXHelcgSwsXbJXagSiwyo=;
        b=SLR7M9CmXMM9LkRZsT4uC6oVaskXSsfNgoIWVxEL7YQRjr7q9b8IE2rE0ynw2siRT5
         hmdfvM71aI/MS/cRuH/JF9wn2qhEF9Tss7qMfs3g+bLisJWRn2cqXg/YEFt4ZVq9UfDJ
         6bg/6ulGenVYLIAh4+dOYX+n+Ip3ZXJnYB8mLiqmBDaWWibQ7Ll2zjVK5BcJDobSLWKd
         HlxO09msqdeDyJjDBFDO0tnyYoZ48lk+09deDX3TqLveSYkkfCwUQtorIfyW9zoe+fl/
         KgBIBrOksH/ffeDizSnrZdeeOK8SkY0N0LjjG7z1l0ymDUkJa28rhemZxVhUWYUtiDom
         O1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUeUqn6h8uK+Az6vi3w9fH8MB8+4+hYjrkp7uWnkbkk3MSXqDBf8PWO0vJbzYRUsyeprUYlk3NRMboeeQ==@vger.kernel.org, AJvYcCV77XqnapeGgBm+/OjVsYNm/BzQVJWMeGiQQ1908AOEUosCLM7nClqdT4BM8zWoHzD5lhJVVHta3Mbx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Qv8LpTqF+xvhZrVc1ROakN9y7zToondgjLWz+8K2GyP2lRgm
	E8ZYr4i2unIz5vyKWTPp6atTPab8Wsz/ypYUJmRViz8wWD4kAcDE1z9a1CsW
X-Gm-Gg: ASbGncuVwMq1pyxI5Cb+IPbPd6WRo5G0fgtRUe64ViGGR7A4jks0imqErughNcgOvHE
	kCSuJb/onG/ll8LUVHLq3WyFnBaYEVo4HR+1E6Txe0T0Wt/me5OYhDX90ETTgSOUDS+WxWusAco
	n/oJOxm6EiPbbY2cZfSuPaw3Eh+kestrVMhnL6rKutd4chdQAwgRRVeaFUVjg6FF2/d9kHNREjd
	c86o2oNVFyDZFqEJCcjE4VgmkOnuLNjDAg92igpdTCj1RL/UpNqvc4av/pMiYRGtOGvhKVLL+/x
	7XazJHLjPOuDw+7qHJEpnujkufnsu0I69/CgUZXzqtZK/uYeT8w=
X-Google-Smtp-Source: AGHT+IFDMjLzpqsLULEA2I8aGeIAkRtX+gD/L2/oWpf+RpFXRcmScgy+FXACV5aE3CjHtbiGopPqXw==
X-Received: by 2002:a05:651c:210b:b0:300:38ff:f8e1 with SMTP id 38308e7fff4ca-307586ed47dmr20095031fa.2.1737809691822;
        Sat, 25 Jan 2025 04:54:51 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:51 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 05/17] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Sat, 25 Jan 2025 13:54:27 +0100
Message-ID: <20250125125439.1428460-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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


