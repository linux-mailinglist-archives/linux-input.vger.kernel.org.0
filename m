Return-Path: <linux-input+bounces-13776-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB5B194BD
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CBE31733C1
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA391E5B6F;
	Sun,  3 Aug 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlbL0ceG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E991E5B70
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244846; cv=none; b=VG+lOBqZMoTKFZOuSrfkCy7AHgVDLXL+BNGe/ozZ6I/ZjCBweYaHuZss559oRj1YZ94Z1Lg2mm3HfEDfLodt51nLd4P88en3CH79X7HsrEJ2mLTyhaMumYgCZ1embH4NL0LA7AMLUj9cTrI4M58aGB1rPGGR6WAsSpsiB0v3RNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244846; c=relaxed/simple;
	bh=WZyXH7O7c5xSsccy2+94n02PRrnZzKaaFmWXiLfYJ+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JE+pJvXV1eRwXljggMZIksNwoYYh/9K9wqiJPAzKxvJ82qTfwpvfy5R+px/Dtmyr40LkxweKyreji5XZg04WwFoNlmGzOdrTYEgiHL7tOrv+pAHow0ceXlp9wYtcm2jy2z9KUxAnH3SiCK4io+FcvfDUQjahKIV1bK5oyBqU4xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlbL0ceG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61539f6815fso650317a12.2
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244843; x=1754849643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9nhTAhfTPAN0ygyAz3zdJJO5x8MtWUqlNDQr0vSXJk=;
        b=YlbL0ceGKPB6wuf8PGxJdxMYcGd7/HzEjLitz5PCJz8tJnqmT2M8uR3d3H99IbeyPA
         Tfg8OQmUrMJmPUwk8/TYn/4Fw1rzBQlTy2BzFPEItFfFJzQv7beHdxBMIZSS8Kt3OJaZ
         Hu1CFD3ItPBJCPKWiL/y31SJeMyEKlzcKnHan0DQX2gswhcJRuJLCuviW4TEVSvfVKaV
         lGjy23NWf50zP5bu6/9ELP50WiWy27+tGO1bfykMOifqfiKl3vF2drR/jkIfGjfMaLB5
         zjGhU0don0s4xEgiM+vWo/3Ch+DPNwnfL4FEdJcDu6vieyMh4OBfN9jLCAZenGeaVMq2
         /4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244843; x=1754849643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9nhTAhfTPAN0ygyAz3zdJJO5x8MtWUqlNDQr0vSXJk=;
        b=Sq7+v+jZGwNGqUhveUNtVI9CUefAPlKzVB6Cp3ZT1rr16SrtuOPWi42Lofgm+xEC6J
         yPF5eC5R56pp7m3GalvxGzZrXe02/7aqaQjWUJYPRwcPLvM3KeepneiWHeP1a4oRv7hB
         u0h8L1rPDNZGMLBvdT+zvG6LBR7Jg842Eyba/cH/5Z6ZbUTO+/jIQkRRQIS5MooNyyh7
         s+Ia07Eas7SgceP2bnJ5r96vujesFL9wXIhdtKv/GTroPd4+57h5DxaaAC2WW6GkI0P2
         qfSX5G03b2zym0xNXLFF+cvq4uii/zCXfOfpIe3GVoCy7kdpledzPZBQ9I+9Wb+m4kNj
         t+vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtKxebAw0TE/7lZwSsmb8LbFDnL4D5qjIEDsGcrMh0cQVyisgzEG/isD3eiTb4J7re4dCJjwr5KmcwDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxivm9BPG4kX7AGJiG+TyV2peqaZE3AakT7NeP80sQ7JhjmDdRw
	AmJbtJJpwexiXip4Js4wtyavPbUGPVcsJCdIranCNBHNBuQn8BhPbIJOSL97wg==
X-Gm-Gg: ASbGncv3CF57pPnYdC39GBUGEO5z8n1WrkubDudTCJeSHy2kdyhmNTN92Wv8R08Vjrf
	QoaEX+S1HrZ6kDIIX8p/V7coWqX/Vri/CDL856mDoIgf1D8XeDjLbIp1fS0eC0gMVOWiPwheRij
	/sznkjI0uJwc/XA44bgvMn42oLCZKficw0HU0UPF22a7wE9YbqFwu+4I+LZn4ZGic7MgY1z6Nue
	3CwITNn/ZY497WL8xbb90f9TrjKwu/OSkMa4GZyZlj0U+nna0+n2FCNLZAufH0Z5u5pWIMkJ1XX
	xPVRRfd+RMIJ6m8eRH7rPoc9qwzZeCddyLYo6bSlqE9IF/izz1y92frq3WEAdxix0VY4LAQlLRp
	s9YA2IsG+grwurglUtHYmpqmnK3bG3+/K8yRCjLb/rOy01/mkcIsGn6lDhyYFAEf3CuD8Ejvpfm
	8=
X-Google-Smtp-Source: AGHT+IEB/+7V6wYPRiuDLguFljdqk4ixUR6ynSgEARy8pyihMgEfFejU8cB55Ii4YUtyt0UiBNsjBA==
X-Received: by 2002:a17:906:f59f:b0:ae4:1093:d41d with SMTP id a640c23a62f3a-af93fd68a02mr299437766b.0.1754244842301;
        Sun, 03 Aug 2025 11:14:02 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:01 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 06/17] HID: pidff: Better quirk assigment when searching for fields
Date: Sun,  3 Aug 2025 20:13:43 +0200
Message-ID: <20250803181354.60034-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
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


