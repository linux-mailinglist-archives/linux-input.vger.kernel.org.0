Return-Path: <linux-input+bounces-13983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAEB25456
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 660C21C85222
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DCF2FD7D5;
	Wed, 13 Aug 2025 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHIib5JH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B522FD7C6
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115813; cv=none; b=HKSQpdVEVoUhzUWOJkNDT4KI8GA6e8/ZmiDs0k8kiFVeGVty66CmZVq67Bzg9d9njMe1R4ceJf9tyv7Ax+CHLcNh6YAg+U8jIvlXcoDxXTi8OJTZxO2FdL8YITIK8WcwJUS2ntLhVJfkmgOT+5k5dXhuyuP5APP/6dW1ScK9uzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115813; c=relaxed/simple;
	bh=vuUavZl0vbWVh/mPW0jISsAmuw6gGigXpvYheuWjaig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ErJZ5T2M/OcfZ9bLwAFedC3pEF+AGIgNbq9j0Gjd1die5d/5ZyQJY7ZSuBPhaTmLV1Bpg82a+UOFu8QN8jKrOLAvrV5v+uZdKuCKcW45dxkDxtsfw7oRy1fhxoOqg/JGmUqMVFH4eCRGcx7zVM2NoFIIlM9hUnPvO9nsKdHxGiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHIib5JH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb74bef86so3468166b.1
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115810; x=1755720610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0iLZIBE8fka/VsTAXWlOuxU5HgIVgCM7rgjwi1M45I=;
        b=JHIib5JH+GCeyedFXzIMumv3gzS656sKE2LiPwOsxermt1J/t2FOJQR2ng12smQBsZ
         LtiKj0hz5a5tEuGhcfmBmvkw4iTI/j4wFdRVKDi7QyHBgf77xeuv1cyFTBoVPskXBkSi
         z+PsCrt9VYnhxlvjrehL4+rR4GRhSc1vYtPoMtR2yT1uJTUdIGpyMZ35FItHhRJPw/tz
         d323afaOuRi8BhQzwI/Ftf+nxcIhcXw8zWveRRr1MDmuOGvK7bV3+ei+DlQVXoEpafJZ
         m0Wrs2hoLc2nO+8CneG65mvjwuE65B7nqDfpdlMcT391eGBsO4MJtlhqRabIPbQuNUJW
         f7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115810; x=1755720610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0iLZIBE8fka/VsTAXWlOuxU5HgIVgCM7rgjwi1M45I=;
        b=TSeJTsKPxnyTghiR6UvqL/4mvxzaA3JIlMhzITmF/b4tfxbKo9bq0N1kYm9TRtUW9H
         4m5E2PryqNHKe7Iz57xweQVY5GhHdKi4ZraBD3ETCYKnsl6SKQaMeDTubRY36znQ+bNs
         0DtqrU3kuWQMrM5pBIDr0fCQyiPSdn1pZ4DHmDKbrSl3M8fbiQSEzq+/8YVr5sWPPYgP
         uGblSUeVutxcum+oShCVNF/FInJxI6UXpxpFcCRARHA5FKzK8onXJoCK0jEL2f0JfXp7
         4n8P+j27+4hcdY8zqroGxxPbIXIWFKW2cCvyJFGzuT+N5k7ObV4WQU6cjuRTaYNs8iua
         mZSw==
X-Forwarded-Encrypted: i=1; AJvYcCU/eDceH5OIZv5djudAk8caEN5pNYILhvkFoAYXmvwDl84ylyIgU2Sq2Hnc3VH4+V+loqPXHRqwF/tgwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfRBri1+r9qDsjIC5Ywvb4FBGXAGysB1DfAU6pqZqAGPeBIsy9
	j9Wdt1MK7ZJYS+YS+AhIwyi6S2rZrPoVOrrNgJiNIxjaHI+qpC1dRMrm
X-Gm-Gg: ASbGncsZzgdxfuVliLDAU0sxRDNwI0tKcgzWusQhmQbYjExv3NJqKVdL3Ftz4j5Scto
	kvMKgX3EcG38IPitYaHSTOmDK41+CDxuLuOJEVxnxRWK1UILLgXYyHA7xL/s6XKtEiMM1nhs/WI
	Ln9qzIvipTq1nD58XWpO8jxtRaAYBqe5FCyE+Dq1uGxHPzt6dUZkKaQaccVuxh3ADi4lDM8jQ8A
	uiC/wp7rK2pSOKr7Kbj5PEwULDg9Sr7M7+eHyfCth3zx/i3KJEccXKFaHopiuGqM5V8mtelicPw
	iBJ5hUNSGTkRCIHinZp2oyFmHDvx0X/fmYlaom4/QJTT7zmpE/kIUsDQ3lBYFc3zAyXFbHr35x5
	ZwtF3zlmPhImrimRoqj+AwmuYubUY1G3QabXHHHyMe8rs/R6CPh1j3YM2Ng1ehZHTglaZPbFkgd
	s=
X-Google-Smtp-Source: AGHT+IHAx7IJrxyxNYjKIP8hd0m1l3xhl7bbVe+6pq/o9yhZSQCS2xFE75j9qxn0HnXlernS3j5ucw==
X-Received: by 2002:a17:907:6d07:b0:ad8:8e05:e5e9 with SMTP id a640c23a62f3a-afcb981f393mr18780666b.2.1755115809907;
        Wed, 13 Aug 2025 13:10:09 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:09 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 04/17] HID: pidff: Use ARRAY_SIZE macro instead of sizeof
Date: Wed, 13 Aug 2025 22:09:52 +0200
Message-ID: <20250813201005.17819-5-tomasz.pakula.oficjalny@gmail.com>
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


