Return-Path: <linux-input+bounces-13986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0DB25461
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 528ED5C03C9
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4195C2FD7D4;
	Wed, 13 Aug 2025 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcPlpCnU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637672FD7D9
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115816; cv=none; b=U4DrMlA+r0Cp5yRV1G4TVNlBKU5wSJ1awnMaj2Yf5Uu1VX4hJBR4DLvt45reFmgbSBOsWtTsmB8/GXWjCy6Vk8Auj1gQ4suz3wzclt3BnQmQZG/Kbt8a3wPhRKYidgoFh0doHqzQ4/o3tFb+RUEH3WXsYTKxfaeBA8cFIL9qtAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115816; c=relaxed/simple;
	bh=9FRkRFrntsFgTpmlaWobH6nu618gWz4oQYu5bGLhq7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GobHJKKkEjye4UstgXkc7xeCEkMXpcXAzZ3bWWGPU/P+JqjQKJnuFUwvZB3TtfX01bdGnkkGvBQN/y6l3UKlqQkqxK5ONqxyJICe1EY5n2/PImA5POhOls/WLy3jBFIKerRXxXEDb3tT9cGwf6no+9wj1pofb1VGIy2ZLj8LsqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcPlpCnU; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7a96309so3267566b.3
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115813; x=1755720613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueNnz6wqU1fa/5IYdvzZE7p28Twhf4FYHGbRklbLJeI=;
        b=lcPlpCnUfxal8CS7VWGQXjMabbO3TkBE+5C34U7E48UKSFHmwJ8kMm3gajxtYaop5o
         N/9JUT0REhnOfihvW8XboQgY1Ylr1JWhhuEKDlr4CUqI0tL8n96dWTvWApWohmFu4811
         QAn2l4huaRLTbdXspNKcWS2FEYLvit+Tqq6nw3csdEPtRRxBhyCxjeFENjA1Kmks6AJR
         wNypzOFbLyvL1J9/ytnBH+gSQCnHne46kCytaiiAxt/Eew8h2zvuGD77Yf98cUewYvqA
         GK9i2JzR+0BwsEJhsIIq5kaszXf3zU/LUPZUZhfa7sAlD4A4IiDN88TqJBlatsSGO+hH
         1fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115813; x=1755720613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueNnz6wqU1fa/5IYdvzZE7p28Twhf4FYHGbRklbLJeI=;
        b=KQ4Ha+r3L+nvkEThSvxuzwhbSuM+i+dMZv4FdlMEEP3hpU+S43T1MocSuHi2VWVhEx
         9ekREQ3KHyVS7lqzn6kzkpqWYLfDauEH60Eh3KLvEY32RfwLWYIR1Tts74tz9BpfzlEX
         CONPU/1o6xSwlY8Ipeja+P8+rpwktIE6BfI5yJuLHlKEPHPiao3Ijph3PpOfc8Cvbodz
         z5tqeRhJP+pgPa3UrMyMv/qtrbx2wC9YDMsgcD1yb4XJlb8apRsFOYzBhV9IeKmnCU21
         aMTDNGpo0Y9qc0f7NXQZx+XRi1N9XphqX8wyzUylI7tAHlbl/BH8b2guX4SXHLWfS+3V
         VDUg==
X-Forwarded-Encrypted: i=1; AJvYcCWits1TJl2uOEVFP5ZCNWPWS8BfkyTZZDRTieiH0I8bdPsCwbE7wqnLk3hoa6QC90wIeXW/nc5i22Pi0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNGiqOgn6tXTeEKhyWJdQf5p6U1vT/gjoAHPJuvfIXIY4sjtFw
	JDMYqgrArUYUX0Vtzwa7zIKm7JKm9D6A6u5bRX2AkqZOHgUEElfxEjvwPJ2UoQ==
X-Gm-Gg: ASbGncu6ZkDEYsoZVLCBdp6SZy/nkjjUEpvDAZfv314Ty4Jg6imd5QyHdOr6SN9L9eh
	0HnAmddR9RWdVkp/ve2YNpRuD+Ri7jECfefqpE7tBNWpUoRYfjBseYWyojr4g4//7gJUJ8u2lKT
	1tPIGuTSrgl97y4o+OWSP44CxcSCm+imwVfX6crGCedoLc1HKcjRVpG6pMrsxYgaIJO+XoFPeoq
	yHtjG77JwkfR65kAM/O5oPtoNN5r+3S1QU97Ehidyy8gulBtSWKPBitiZDZxmGN3+6g6vZyacle
	vPA0CuGFSnCEQV9whc6Fmc/rgYWFHxJLXvpOvSqnK9+T8HpmB5I0beEzZbvQcsOHd1XKWju7iNC
	DGnH+XKkZJr9ydySsoi6BYs7VaVTLXPcvqQqlbRNP4R2NN98GXH6mEcxjSk6/hdPzFxXAiRLJjZ
	FM16ne0Gq43A==
X-Google-Smtp-Source: AGHT+IESaY+9D7evctkedo02whwnr6q2uvg3um5Abxzbn+1TmWvN4yZYkGSN+S5p5cVygGln8Xi1Fw==
X-Received: by 2002:a17:907:2d0b:b0:ae3:5118:96b3 with SMTP id a640c23a62f3a-afcb97d001fmr18624366b.3.1755115812537;
        Wed, 13 Aug 2025 13:10:12 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:12 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 07/17] HID: pidff: Simplify HID field/usage searching logic
Date: Wed, 13 Aug 2025 22:09:55 +0200
Message-ID: <20250813201005.17819-8-tomasz.pakula.oficjalny@gmail.com>
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

Some deduplication and splitting into separate functions. This is now
way easier to comprehend and parse mentally.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 105 +++++++++++++++++++--------------
 1 file changed, 62 insertions(+), 43 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index c88442a087f1..2e8eac944be0 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -939,6 +939,43 @@ static void pidff_set_autocenter(struct input_dev *dev, u16 magnitude)
 	pidff_autocenter(dev->ff->private, magnitude);
 }
 
+/*
+ * Find specific usage in a given hid_field
+ */
+static int pidff_find_usage(struct hid_field *fld, unsigned int usage_code)
+{
+	for (int i = 0; i < fld->maxusage; i++) {
+		if (fld->usage[i].hid == usage_code)
+			return i;
+	}
+	return -1;
+}
+
+/*
+ * Find hid_field with a specific usage. Return the usage index as well
+ */
+static int pidff_find_field_with_usage(int *usage_index,
+				       struct hid_report *report,
+				       unsigned int usage_code)
+{
+	for (int i = 0; i < report->maxfield; i++) {
+		struct hid_field *fld = report->field[i];
+
+		if (fld->maxusage != fld->report_count) {
+			pr_debug("maxusage and report_count do not match, skipping\n");
+			continue;
+		}
+
+		int index = pidff_find_usage(fld, usage_code);
+
+		if (index >= 0) {
+			*usage_index = index;
+			return i;
+		}
+	}
+	return -1;
+}
+
 /*
  * Find fields from a report and fill a pidff_usage
  */
@@ -946,46 +983,38 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict,
 			     u32 *quirks)
 {
+	const u8 block_offset = pidff_set_condition[PID_PARAM_BLOCK_OFFSET];
+	const u8 delay = pidff_set_effect[PID_START_DELAY];
+
 	if (!report) {
 		pr_debug("%s, null report\n", __func__);
 		return -1;
 	}
 
-	int i, j, k, found;
+	for (int i = 0; i < count; i++) {
+		int index;
+		int found = pidff_find_field_with_usage(&index, report,
+							HID_UP_PID | table[i]);
 
-	for (k = 0; k < count; k++) {
-		found = 0;
-		for (i = 0; i < report->maxfield; i++) {
-			if (report->field[i]->maxusage !=
-			    report->field[i]->report_count) {
-				pr_debug("maxusage and report_count do not match, skipping\n");
-				continue;
-			}
-			for (j = 0; j < report->field[i]->maxusage; j++) {
-				if (report->field[i]->usage[j].hid ==
-				    (HID_UP_PID | table[k])) {
-					pr_debug("found %d at %d->%d\n",
-						 k, i, j);
-					usage[k].field = report->field[i];
-					usage[k].value =
-						&report->field[i]->value[j];
-					found = 1;
-					break;
-				}
-			}
-			if (found)
-				break;
+		if (found >= 0) {
+			pr_debug("found %d at %d->%d\n", i, found, index);
+			usage[i].field = report->field[found];
+			usage[i].value = &report->field[found]->value[index];
+			continue;
 		}
-		if (!found && table[k] == pidff_set_effect[PID_START_DELAY]) {
+
+		if (table[i] == delay) {
 			pr_debug("Delay field not found, but that's OK\n");
 			pr_debug("Setting MISSING_DELAY quirk\n");
 			*quirks |= HID_PIDFF_QUIRK_MISSING_DELAY;
-		} else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
+
+		} else if (table[i] == block_offset) {
 			pr_debug("PBO field not found, but that's OK\n");
 			pr_debug("Setting MISSING_PBO quirk\n");
 			*quirks |= HID_PIDFF_QUIRK_MISSING_PBO;
-		} else if (!found && strict) {
-			pr_debug("failed to locate %d\n", k);
+
+		} else if (strict) {
+			pr_debug("failed to locate %d\n", i);
 			return -1;
 		}
 	}
@@ -1054,9 +1083,7 @@ static void pidff_find_reports(struct hid_device *hid, int report_type,
  */
 static int pidff_reports_ok(struct pidff_device *pidff)
 {
-	int i;
-
-	for (i = 0; i < PID_REQUIRED_REPORTS; i++) {
+	for (int i = 0; i < PID_REQUIRED_REPORTS; i++) {
 		if (!pidff->reports[i]) {
 			hid_dbg(pidff->hid, "%d missing\n", i);
 			return 0;
@@ -1077,9 +1104,7 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
 		return NULL;
 	}
 
-	int i;
-
-	for (i = 0; i < report->maxfield; i++) {
+	for (int i = 0; i < report->maxfield; i++) {
 		if (report->field[i]->logical == (HID_UP_PID | usage) &&
 		    report->field[i]->report_count > 0) {
 			if (!enforce_min ||
@@ -1099,18 +1124,12 @@ static struct hid_field *pidff_find_special_field(struct hid_report *report,
 static int pidff_find_special_keys(int *keys, struct hid_field *fld,
 				   const u8 *usagetable, int count)
 {
-
-	int i, j;
 	int found = 0;
 
-	for (i = 0; i < count; i++) {
-		for (j = 0; j < fld->maxusage; j++) {
-			if (fld->usage[j].hid == (HID_UP_PID | usagetable[i])) {
-				keys[i] = j + 1;
-				found++;
-				break;
-			}
-		}
+	for (int i = 0; i < count; i++) {
+		keys[i] = pidff_find_usage(fld, HID_UP_PID | usagetable[i]) + 1;
+		if (keys[i])
+			found++;
 	}
 	return found;
 }
-- 
2.50.1


