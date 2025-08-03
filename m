Return-Path: <linux-input+bounces-13774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED3B194BB
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2A73B66F7
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144391E1DEC;
	Sun,  3 Aug 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpfD3xJm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657B1D5CEA
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244844; cv=none; b=UcmiAnxih4SrZVi51cJMh3pN873/g8ofkhg7ippYYAN1Lxjjm/4GGiLTAQvRcRmoyr95uAZykPW96LMEqyjMOG483x1xkCSKkKCH8uLkBB4piXaq1tOUV+cEOklKvVzjlTdVW9AHEu4eUHMedtJmaShRQFkEZfXpIrqsotw8sk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244844; c=relaxed/simple;
	bh=vuUavZl0vbWVh/mPW0jISsAmuw6gGigXpvYheuWjaig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K4Z8M24MCsMkXX4rUbfeyex/EGDFWatKiBRJX1Be9mCOmruHP44HKG1K+T13EPgtwcOU4QIw5D6RkEILPDevlZ8f4NlezU3536KR0xE6MHOK5TqMX8AAMm9AxPWRLDOz0q6+dvWxN1+m9MMAJ+ilmp1GTrttrHMa/rYIGgVjzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpfD3xJm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61531c16c85so517098a12.2
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244840; x=1754849640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0iLZIBE8fka/VsTAXWlOuxU5HgIVgCM7rgjwi1M45I=;
        b=cpfD3xJm9/zcPpQX7FnL4fUy6+Ue+cMppHF/O0pQZ1Yyz4kH9wx4CKf0SHh9MYuUJM
         brvg86iKk5yWxBCIjpXavN9fkNXMbGZDTDn3u96y3z21j13PWM5s/oyBaMDpeXIZzcve
         faPwbFmCf71UvIuzpqlCahgg0RE3N2ejC775bCZtSLSFDDlI3ivDsbyhfs/19cpGaEaj
         e2RV2z9pja8iPj3XbEHtSjZ7rApdFaZzrsd/b1E7Y87o9INnPjiH4BVbqi9AEw+TnlaP
         xySxUojhJGOx186nq6yXVnbCVj/zmdoeVb/JhrICt/y3yUUvf0rP51hfuJmpAjxWyK9D
         LX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244840; x=1754849640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0iLZIBE8fka/VsTAXWlOuxU5HgIVgCM7rgjwi1M45I=;
        b=kqPNSnJdeebtKgBa42eIqczRQDA6d39tZbX2QDtGqUIY+uUByg0S4sV5wXLf3EHj+Y
         eOJchP783bTtzkg0HCUk6asaP5nZ4MbtwzmD+fGEFFg/DbVWih2O39qQHLITKvAii/m5
         jOpaecZ9eu9HzN3gMWENIRJo22Dx6jfaz+HID9HodWKJytdOx/Rdhlxo+ffzXUQmQ2Oi
         unAzEtvrOFX59yHxzjTUkalHJlDXsB1WVx3VPTaWdxGrmEv+e5y8/jQ7iMsuKbWObgTe
         gQHNwCoTPt8FgujUycylydF6TSgAf1VHgN2aoZlcxRcRNDS1RSAf7m0IvX+3ADrLAuaB
         MRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+WNVSClh1Kn6Jb6tLiQPPzPv1W9NA8l0z86UlFGPiXe+9CmDtPKRTSxO96CLjuFMfQxLCoL5qRrhkKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEoGaGDsClALYsnRdUbvkyLR8oQJA9LVgmxEtXZxJ1gzKOquGl
	GbHdn4sfO29ZWcLqtwDeNljrkNrVJzM2McytY0uSUnAY9FKJ+zKLb7As
X-Gm-Gg: ASbGncvDT7Oi3KCVLTEJP4OBbVCcTJUNT6os2ODs5zEFNUUYwn5RzO6PTL8gFgCxvsi
	2Zo0e7g2sBlzW76IFX4ApEzsJY7niaMRAyqYF6BD2LT9kw6d4Q8REvelcnR0CRBXSpnKsN7694l
	0m2XDNxIEm5o6WlyaYArS9X43IWEB7uw8FBlOZj5trKS0jPiV+scjpc6xIa+P64ylu98OoTVaqC
	ObuEUYBuR35sARUnIMlRnSz3EbdF5h0hN0P2kkaAH8K9BsuOTjoTBQ/A4ASRRskGzIiV/4UwLRe
	aZyG7PiWGzPXFbOyeV1Pc2HPbo3nmaiFOFhBS1B5UrDEaaeu+105gU+KdcdZ4a6wHEeVKKdOe9w
	RZzs3zIwcIgXuMeGOusBSXMyZs5ejA2a0ZhBlhqtARPR82Soc531uUeVvcy3DmcsySNV++yTCQD
	80sSmW+OZBeg==
X-Google-Smtp-Source: AGHT+IEwAej4e2K8tTpM1XMb78mZtUB3Gjj8x1nUEst5HzkujQ3tK0AMUW3AUvVG5Gl6TwqsxOoI0Q==
X-Received: by 2002:a17:906:7955:b0:ad8:9fa3:8dd9 with SMTP id a640c23a62f3a-af940187868mr255305766b.13.1754244840179;
        Sun, 03 Aug 2025 11:14:00 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:13:59 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 04/17] HID: pidff: Use ARRAY_SIZE macro instead of sizeof
Date: Sun,  3 Aug 2025 20:13:41 +0200
Message-ID: <20250803181354.60034-5-tomasz.pakula.oficjalny@gmail.com>
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

Could lead to issues when arrays won't be 8 bit fields

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/usbhid/hid-pidff.c | 46 +++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 75fc6dbe435c..2f9fbe4c52d7 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -158,20 +158,20 @@ struct pidff_usage {
 struct pidff_device {
 	struct hid_device *hid;
 
-	struct hid_report *reports[sizeof(pidff_reports)];
+	struct hid_report *reports[ARRAY_SIZE(pidff_reports)];
 
-	struct pidff_usage set_effect[sizeof(pidff_set_effect)];
-	struct pidff_usage set_envelope[sizeof(pidff_set_envelope)];
-	struct pidff_usage set_condition[sizeof(pidff_set_condition)];
-	struct pidff_usage set_periodic[sizeof(pidff_set_periodic)];
-	struct pidff_usage set_constant[sizeof(pidff_set_constant)];
-	struct pidff_usage set_ramp[sizeof(pidff_set_ramp)];
+	struct pidff_usage set_effect[ARRAY_SIZE(pidff_set_effect)];
+	struct pidff_usage set_envelope[ARRAY_SIZE(pidff_set_envelope)];
+	struct pidff_usage set_condition[ARRAY_SIZE(pidff_set_condition)];
+	struct pidff_usage set_periodic[ARRAY_SIZE(pidff_set_periodic)];
+	struct pidff_usage set_constant[ARRAY_SIZE(pidff_set_constant)];
+	struct pidff_usage set_ramp[ARRAY_SIZE(pidff_set_ramp)];
 
-	struct pidff_usage device_gain[sizeof(pidff_device_gain)];
-	struct pidff_usage block_load[sizeof(pidff_block_load)];
-	struct pidff_usage pool[sizeof(pidff_pool)];
-	struct pidff_usage effect_operation[sizeof(pidff_effect_operation)];
-	struct pidff_usage block_free[sizeof(pidff_block_free)];
+	struct pidff_usage device_gain[ARRAY_SIZE(pidff_device_gain)];
+	struct pidff_usage block_load[ARRAY_SIZE(pidff_block_load)];
+	struct pidff_usage pool[ARRAY_SIZE(pidff_pool)];
+	struct pidff_usage effect_operation[ARRAY_SIZE(pidff_effect_operation)];
+	struct pidff_usage block_free[ARRAY_SIZE(pidff_block_free)];
 
 	/*
 	 * Special field is a field that is not composed of
@@ -194,10 +194,10 @@ struct pidff_device {
 	/* Special field in effect_operation */
 	struct hid_field *effect_operation_status;
 
-	int control_id[sizeof(pidff_device_control)];
-	int type_id[sizeof(pidff_effect_types)];
-	int status_id[sizeof(pidff_block_load_status)];
-	int operation_id[sizeof(pidff_effect_operation_status)];
+	int control_id[ARRAY_SIZE(pidff_device_control)];
+	int type_id[ARRAY_SIZE(pidff_effect_types)];
+	int status_id[ARRAY_SIZE(pidff_block_load_status)];
+	int operation_id[ARRAY_SIZE(pidff_effect_operation_status)];
 
 	int pid_id[PID_EFFECTS_MAX];
 
@@ -583,7 +583,7 @@ static void pidff_set_device_control(struct pidff_device *pidff, int field)
 		hid_dbg(pidff->hid, "DEVICE_CONTROL is a bitmask\n");
 
 		/* Clear current bitmask */
-		for (i = 0; i < sizeof(pidff_device_control); i++) {
+		for (i = 0; i < ARRAY_SIZE(pidff_device_control); i++) {
 			index = pidff->control_id[i];
 			if (index < 1)
 				continue;
@@ -999,7 +999,7 @@ static int pidff_check_usage(int usage)
 {
 	int i;
 
-	for (i = 0; i < sizeof(pidff_reports); i++)
+	for (i = 0; i < ARRAY_SIZE(pidff_reports); i++)
 		if (usage == (HID_UP_PID | pidff_reports[i]))
 			return i;
 
@@ -1117,7 +1117,7 @@ static int pidff_find_special_keys(int *keys, struct hid_field *fld,
 
 #define PIDFF_FIND_SPECIAL_KEYS(keys, field, name) \
 	pidff_find_special_keys(pidff->keys, pidff->field, pidff_ ## name, \
-		sizeof(pidff_ ## name))
+		ARRAY_SIZE(pidff_ ## name))
 
 /*
  * Find and check the special fields
@@ -1184,7 +1184,7 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 
 	if (PIDFF_FIND_SPECIAL_KEYS(status_id, block_load_status,
 				    block_load_status) !=
-			sizeof(pidff_block_load_status)) {
+			ARRAY_SIZE(pidff_block_load_status)) {
 		hid_err(pidff->hid,
 			"block load status identifiers not found\n");
 		return -1;
@@ -1192,7 +1192,7 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 
 	if (PIDFF_FIND_SPECIAL_KEYS(operation_id, effect_operation_status,
 				    effect_operation_status) !=
-			sizeof(pidff_effect_operation_status)) {
+			ARRAY_SIZE(pidff_effect_operation_status)) {
 		hid_err(pidff->hid, "effect operation identifiers not found\n");
 		return -1;
 	}
@@ -1208,7 +1208,7 @@ static int pidff_find_effects(struct pidff_device *pidff,
 {
 	int i;
 
-	for (i = 0; i < sizeof(pidff_effect_types); i++) {
+	for (i = 0; i < ARRAY_SIZE(pidff_effect_types); i++) {
 		int pidff_type = pidff->type_id[i];
 
 		if (pidff->set_effect_type->usage[pidff_type].hid !=
@@ -1258,7 +1258,7 @@ static int pidff_find_effects(struct pidff_device *pidff,
 #define PIDFF_FIND_FIELDS(name, report, strict) \
 	pidff_find_fields(pidff->name, pidff_ ## name, \
 		pidff->reports[report], \
-		sizeof(pidff_ ## name), strict)
+		ARRAY_SIZE(pidff_ ## name), strict)
 
 /*
  * Fill and check the pidff_usages
-- 
2.50.1


