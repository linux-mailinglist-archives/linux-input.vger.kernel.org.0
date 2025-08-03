Return-Path: <linux-input+bounces-13777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2691EB194BE
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4194A17338A
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52901E5B70;
	Sun,  3 Aug 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQRxTJFS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27C11E834E
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244846; cv=none; b=B680a37K9htvvJwC8xjj8Qn8JRfGx3s4GbEoBo8BlTnssQJW4uZYb2qjZEJa4Iy8dE2oQGQ1xNX4btjaeoRylLov9hR89JV3fJJOuqLoJXduugopaWfR6TDodqjDnZ8/cN399zsc7chiJAsW0pUqaiTB5LcdG7kg8E+QaD2R/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244846; c=relaxed/simple;
	bh=9FRkRFrntsFgTpmlaWobH6nu618gWz4oQYu5bGLhq7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0OXXwIjds9Fr2lfRxrGt7bwo/QC/rHNj0g2O/kpArw3Mgp9kMabuXlvzscSYNXKbe3PbaDXbAiOIfi7tD8Yo1a/kBysT/pLLon1UnVcN9Oa8rtu2vnUIqQbfk/t311cfN5wPydlmzYuR4M7UfIpz0dddwN6hf/C6aeDrFKwMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQRxTJFS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-af95a5989a2so20034166b.3
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244843; x=1754849643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueNnz6wqU1fa/5IYdvzZE7p28Twhf4FYHGbRklbLJeI=;
        b=iQRxTJFSWQTLm4930I886Eddol6GoZU8kdYYRpVzKAP3+g188Kk2hrLFSyIEXRBFxw
         pMa4njTzFBJQYi4xX1Uk4YH/ZletbS9jDMPY6h7jOvo9/jSYpDKTgFOYAKZ0AfkiA4Kg
         iVK/nprXcW1fHYdcDrNyMJxpkqA4x/ZGb3DNKWqyaDoM9TUtKSAC8yTDw5YDlOng8WqR
         wg1XEzcOiZfboFiZPzEPCe3o1iaIrPjEqFz439sXS62Bdx7FW9iHC8Cd+5USCV9BtJpC
         RWpaFfGpKYVt/XaNzIifPsLLRyS8C8o63ZORNTsFg1bwwWpHKFUGmaCDUSMWYqgWCUvU
         LqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244843; x=1754849643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueNnz6wqU1fa/5IYdvzZE7p28Twhf4FYHGbRklbLJeI=;
        b=W96ol8Rm1m1XPx96DMVoZnjDrjPZ+FjLQr30MkcQ0Hp4BKUTNBxfXLLKiz8QcrtW5F
         LR5Jygkn9nBJQsToVphzJHGCbyO/i5NiHKyys+PXw1KIzXApieHim+m/K0/LfproSzYN
         j8Fnu+/NxlXpWaYkRD8wHink6uh5NHeeA5Mc5c1uRiVtPnaVOdAO2xBf9sL/S3Sy6v4Z
         2F4YfzgV7rWMVtampiHokYPeeUupDbC4ly88UiNZh5F8zNcXpMMljGfMOR5HNEnqUv7j
         zR8/zdG4wKLwbjNEOD5b5fVmGRRM/dDpn44SVIBUQmvxc++cuE4qoEhrge4a/bZ1MQDS
         etGA==
X-Forwarded-Encrypted: i=1; AJvYcCUbAv63Ic2K69JWcTMqANaPrV6eU+rrUb+QeHjGTrFoclsQu3gNqtdb6TnbkrDO/4vFbos/js95nFcqsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhrp6oEhZA1ltyEY0e64BXzsUqdlgGrkWfAShHPHlonfvpd/Wc
	UqZo7cimOCEXjIEkXpNGojAlT4DrI0T1k2AFChbw6RgHEqoBFPHtA7Os
X-Gm-Gg: ASbGncuOWluIQSaBlkOnNjB/tmXNVIhyLWhEgtebPZB6AEGvcDbB8tSCnKe2cpXlZ/4
	wIZE5nyKx3NU8FlNvanKBcj0JQXkrRAoDxBNKHCpUqhSh6NccK442axwK1XwY25yeQ4df6vZ9nX
	Dg4BGh7gjZBbR9jKbYQImsfrgkSekpCgIo+O0Fu/9+snWaDdxSlkTjunsJjeYyiOEhh47LN0ZpN
	aMqMaF7GZomnWIIxIBr+0bsemv4edxpbsgXbrUUtKwOOIUX2RsxmiuyRBSTrDtsi6fFO9XOzuZQ
	DoZ8ZldG0hYgal0twNtd+dm6DPb7rVoIzkeRoggVgTunUI1bUXOkzOEXTkPHEdwmZlBbJN91ptK
	wBpbLDOMOR0QmcE/tsMsv/S2sjptiq6sYNgqIMK0iSfRy9Fn2UjKJ/t2X9DRWTKmECxwKXxkVQS
	w=
X-Google-Smtp-Source: AGHT+IFx1R/84/EuV5ZZWrxF/IKwd8avHK9zzN5gLEEjW/98HbBxshDmBvCfwEidQJ/YLaOGp3iAEA==
X-Received: by 2002:a17:907:94d0:b0:ae9:8d93:5d3c with SMTP id a640c23a62f3a-af9401f713dmr284939166b.9.1754244843029;
        Sun, 03 Aug 2025 11:14:03 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:02 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 07/17] HID: pidff: Simplify HID field/usage searching logic
Date: Sun,  3 Aug 2025 20:13:44 +0200
Message-ID: <20250803181354.60034-8-tomasz.pakula.oficjalny@gmail.com>
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


