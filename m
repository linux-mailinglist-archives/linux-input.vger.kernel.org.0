Return-Path: <linux-input+bounces-13985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5791AB25458
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF7C91C856F3
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888BD2FD7C5;
	Wed, 13 Aug 2025 20:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsU8goc5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A723D2FD7D4
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115815; cv=none; b=uUFq/LFanKo1JfxHYlfc5UPnZP494DMBM/G1zy9QrKFmlSK/8EmcpnT3r6UEJZl/ZwHb6yF++S8QICwdbIXU9S58lGEy/qZLAbTYKj+Yz+XVeYZWDeMl6BHW63xbxQdhcMk4aNaJ3uVFHZjgXXDNKNayP5wGcawazfjK42aIigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115815; c=relaxed/simple;
	bh=WZyXH7O7c5xSsccy2+94n02PRrnZzKaaFmWXiLfYJ+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WIrFDr7jNbfT0HIUP35l6bfxTxkdjvPAVdYzXxPW9IDFhdVRhKWTgDVC8GQJWLVpOl3G2bM0xTSE8oRL3cDCaTgfkI89UgqW5mJk5nx2yBpbq6K2pbpdvYLFQJ+TKl9odnCC6Z8aa86HOrrL55OsTXKW42e5slbl4Ale5BScgNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsU8goc5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb72b3a1bso3846466b.0
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115812; x=1755720612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9nhTAhfTPAN0ygyAz3zdJJO5x8MtWUqlNDQr0vSXJk=;
        b=bsU8goc5u3+HpyS+nc9Bh4dOXzGJ1sZzzURalf+gA7A0pE4ez2GFfXnMMusq7eEW6U
         ttzsucRQHCdmX3EewjbZWd5rkwgP5se+55fNqJ9WhgmB/iCweQUQxjmTGOUDEP9vJAc9
         TM+Bl0+O6xFk8rE0cw6r8aaru+jMSTW6qD0hYC4t8fC+JREIznfAC6IXH/VKT4nKoyaC
         4VJNV+OeIMNQ8Zu5RwgHvxbI4QzaH3TNONHWf0g242EtYTfICQKJXWSN+q+vCW3/CTr5
         oXegmoIygx67BgddGaIEGSEeJdZ2pkbdQsfRKH/glNOhfB/Bi/neuN11fnnvcfsrJBbY
         71Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115812; x=1755720612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9nhTAhfTPAN0ygyAz3zdJJO5x8MtWUqlNDQr0vSXJk=;
        b=HgHZQTub+Y02dvTxJGpq0m6a21eR1nhvmng1kYCbsADBwjKT55izEcS8eaK041IdX4
         MLhmDHUIgvHkLd7HBEQ/Lc6Fm6Sn1w1ho8YllNaCGvdGsibjyvK6QZ+omIBx1ATFjWSR
         fjgXnOla9GFxwpUjox+HuGS6ba3tRjtfrS1SLWtoq4T619ywyO1xpXI8Q2FXRlD4hFA6
         tbrGRJ3Z+H92pzwDUWHlpAeINpPFxCowWnJkoP5MCiHMHI+eX0SmkoZqwmdylPu7wvMY
         q0cDy+aqexzotMri9tcWLHOrdLP2/bvIl9rjDFILAPP6KIX/fzogXFARPfrVTqGEcsao
         FIjw==
X-Forwarded-Encrypted: i=1; AJvYcCX4/i5a+kQRC8OvN2cpfa3y4huxKpnbBUrzZnzyx58oNRd8uTEdfDdyiCoJ3otdWqWj9vu3nlCupUTPyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPSWtG/vABHFOZmpeLP6X/3tbtA52TSkr0LORAqc1xIHSZAau
	pLBkz5cuNI+KlNpc3jDFVa0fGNOdf9mYR7X+/ux1926fLzKelPIHqKlz
X-Gm-Gg: ASbGncvch4km6p8Yq0AfhBL2hvrJ76mbQzcJZwBgk94W9yjcyGr8H3KyS9fa7Wbzj0T
	QkIPIwQDsU+sSiDwI4DuwKCEGpMGfjG+bu06eBr/sfiFVmwUVTBWjSmoOnJP90Gkk/SEgQjtgxl
	SN0cLc6lpROHklECslmcDM12rPgae94MHSkdAnQUfnqXyN0caRlWYWNKWjYfeyVv5Vf1zFXJEap
	/pC8+XWpKKsWTSFobZvXIm5fYesoBkRMfej9ZJI5ZdDhLW+MDg8EIVn0zEuPlMJy6E53gGs5Lgd
	1IP0iQ+6zIrTgMwZM+ByGh7ulr8BknlZHeJKItQd3IlcU645GVcVETDGbpXanvZxU68BpRxNEZQ
	9wDkP8zyZ2cj3qr16zKXkiYviomNSylyrXRxz9d2AUqWy4MwAAi5uA8HjBSZ2KIDT0xJbYoh1bP
	w=
X-Google-Smtp-Source: AGHT+IFIaxS8OJjs9S6MKVjGKw7LFN7XPV8DDpt349SROgbe+AFdl5CcvENMaQnSgIGBeslAZxlEFA==
X-Received: by 2002:a17:907:7245:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-afcb99de9edmr15727766b.11.1755115811764;
        Wed, 13 Aug 2025 13:10:11 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:11 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 06/17] HID: pidff: Better quirk assigment when searching for fields
Date: Wed, 13 Aug 2025 22:09:54 +0200
Message-ID: <20250813201005.17819-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Assign quirks directly when they're discovered. Way easier to understand
without relying on return values.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 59 +++++++++++-----------------------
 1 file changed, 18 insertions(+), 41 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index cff79e76c211..c88442a087f1 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -943,7 +943,8 @@ static void pidff_set_autocenter(struct input_dev *dev, u16 magnitude)
  * Find fields from a report and fill a pidff_usage
  */
 static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
-			     struct hid_report *report, int count, int strict)
+			     struct hid_report *report, int count, int strict,
+			     u32 *quirks)
 {
 	if (!report) {
 		pr_debug("%s, null report\n", __func__);
@@ -951,7 +952,6 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 	}
 
 	int i, j, k, found;
-	int return_value = 0;
 
 	for (k = 0; k < count; k++) {
 		found = 0;
@@ -979,17 +979,17 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 		if (!found && table[k] == pidff_set_effect[PID_START_DELAY]) {
 			pr_debug("Delay field not found, but that's OK\n");
 			pr_debug("Setting MISSING_DELAY quirk\n");
-			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
+			*quirks |= HID_PIDFF_QUIRK_MISSING_DELAY;
 		} else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
 			pr_debug("PBO field not found, but that's OK\n");
 			pr_debug("Setting MISSING_PBO quirk\n");
-			return_value |= HID_PIDFF_QUIRK_MISSING_PBO;
+			*quirks |= HID_PIDFF_QUIRK_MISSING_PBO;
 		} else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
 		}
 	}
-	return return_value;
+	return 0;
 }
 
 /*
@@ -1258,26 +1258,17 @@ static int pidff_find_effects(struct pidff_device *pidff,
 #define PIDFF_FIND_FIELDS(name, report, strict) \
 	pidff_find_fields(pidff->name, pidff_ ## name, \
 		pidff->reports[report], \
-		ARRAY_SIZE(pidff_ ## name), strict)
+		ARRAY_SIZE(pidff_ ## name), strict, &pidff->quirks)
 
 /*
  * Fill and check the pidff_usages
  */
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
-	int status = 0;
-
-	/* Save info about the device not having the DELAY ffb field. */
-	status = PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1);
-	if (status == -1) {
+	if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
 		hid_err(pidff->hid, "unknown set_effect report layout\n");
 		return -ENODEV;
 	}
-	pidff->quirks |= status;
-
-	if (status & HID_PIDFF_QUIRK_MISSING_DELAY)
-		hid_dbg(pidff->hid, "Adding MISSING_DELAY quirk\n");
-
 
 	PIDFF_FIND_FIELDS(block_load, PID_BLOCK_LOAD, 0);
 	if (!pidff->block_load[PID_EFFECT_BLOCK_INDEX].value) {
@@ -1311,39 +1302,25 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 				 "has periodic effect but no envelope\n");
 	}
 
-	if (test_bit(FF_CONSTANT, dev->ffbit) &&
-	    PIDFF_FIND_FIELDS(set_constant, PID_SET_CONSTANT, 1)) {
+	if (PIDFF_FIND_FIELDS(set_constant, PID_SET_CONSTANT, 1) &&
+	    test_and_clear_bit(FF_CONSTANT, dev->ffbit))
 		hid_warn(pidff->hid, "unknown constant effect layout\n");
-		clear_bit(FF_CONSTANT, dev->ffbit);
-	}
 
-	if (test_bit(FF_RAMP, dev->ffbit) &&
-	    PIDFF_FIND_FIELDS(set_ramp, PID_SET_RAMP, 1)) {
+	if (PIDFF_FIND_FIELDS(set_ramp, PID_SET_RAMP, 1) &&
+	    test_and_clear_bit(FF_RAMP, dev->ffbit))
 		hid_warn(pidff->hid, "unknown ramp effect layout\n");
-		clear_bit(FF_RAMP, dev->ffbit);
-	}
-
-	if (test_bit(FF_SPRING, dev->ffbit) ||
-	    test_bit(FF_DAMPER, dev->ffbit) ||
-	    test_bit(FF_FRICTION, dev->ffbit) ||
-	    test_bit(FF_INERTIA, dev->ffbit)) {
-		status = PIDFF_FIND_FIELDS(set_condition, PID_SET_CONDITION, 1);
 
-		if (status < 0) {
+	if (PIDFF_FIND_FIELDS(set_condition, PID_SET_CONDITION, 1)) {
+		if (test_and_clear_bit(FF_SPRING, dev->ffbit)   ||
+		    test_and_clear_bit(FF_DAMPER, dev->ffbit)   ||
+		    test_and_clear_bit(FF_FRICTION, dev->ffbit) ||
+		    test_and_clear_bit(FF_INERTIA, dev->ffbit))
 			hid_warn(pidff->hid, "unknown condition effect layout\n");
-			clear_bit(FF_SPRING, dev->ffbit);
-			clear_bit(FF_DAMPER, dev->ffbit);
-			clear_bit(FF_FRICTION, dev->ffbit);
-			clear_bit(FF_INERTIA, dev->ffbit);
-		}
-		pidff->quirks |= status;
 	}
 
-	if (test_bit(FF_PERIODIC, dev->ffbit) &&
-	    PIDFF_FIND_FIELDS(set_periodic, PID_SET_PERIODIC, 1)) {
+	if (PIDFF_FIND_FIELDS(set_periodic, PID_SET_PERIODIC, 1) &&
+	    test_and_clear_bit(FF_PERIODIC, dev->ffbit))
 		hid_warn(pidff->hid, "unknown periodic effect layout\n");
-		clear_bit(FF_PERIODIC, dev->ffbit);
-	}
 
 	PIDFF_FIND_FIELDS(pool, PID_POOL, 0);
 
-- 
2.50.1


