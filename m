Return-Path: <linux-input+bounces-9609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A26A225B3
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A4F1886FEC
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3874B1E32DB;
	Wed, 29 Jan 2025 21:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwOS+/x+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C8D1E379B;
	Wed, 29 Jan 2025 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186190; cv=none; b=VDm5BNeCp0NqT6U+5mLjyTtrGl0YN+3ejCwMH4AItQiFLftrLT0VKbzaKGQajjL+E9rPM5HKmHarA2q4ELAA/DIOJQjIBWP4WkUs2ewSG6kNRM3XLVrbMx9gJN8Wak81T2Es6qyN+GgwWBDWjDfHFqicUQmnDQprrlBe7SMtRNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186190; c=relaxed/simple;
	bh=TBPKbPylZYsYYumVpVwp03Rwoyh/GKQoQdEU8jDnJ+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVbuqvjaF+xpzikiLrko1L6ISsT5iQG1/urYhpFOhCbLtp6sJEJTTDBrxsVBCqL1bncSAuESrDYl84YqZHeyNdgbH/aDr98Y1Yq3+A6OLESfY1mMIA3IACte1FEzRjYqo032OpMDCRlZoaC9oCBVAFoFo4Rica3r3X6aO0N4RmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwOS+/x+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5426a29c81dso16266e87.2;
        Wed, 29 Jan 2025 13:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186186; x=1738790986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duHwhIto8jRwjl8oTveORRgHP/ZO7W7YuX3JE7ysk5g=;
        b=cwOS+/x+iWdxBKHeskEdxWSWV81LnZyxPfjFGxfxUA16vFMGd7ADDVbi9oPhJXX1ze
         f5QD1I9yPeNweqa1TerzImx7ErRA0/6UXb+LIRUvNOq0pkNYUDRRyqawqnkOM+z0H4UD
         F8Vn/NsGHkF8BZv5AnvAHeWwxpmzCRGA/Z6pAMxoGrBoABfgbWRiZc+lO2HYC1F7B3jP
         C22vpkZlburoL0N9YXlPInXh/t+aITLq8KaqdzxnOGQRoo9tqHu4SqGpGbrvwu8DuhIW
         7EF+G03EG4uHeE6mtV4Bqco/dU6xgDiW+JkEGEnlXyNZSEiW17ImGxuOFlxocvwBRqGK
         hRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186186; x=1738790986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duHwhIto8jRwjl8oTveORRgHP/ZO7W7YuX3JE7ysk5g=;
        b=GCWzUiNc2LugJsneHo6ZJ6R69A2DpgxgR+qk4MVk/Htwu4JrGx90zVvYw+rDdTJ/zs
         hdukLjNMRsrxb9qsrf1Y8sFCm4LInwDrIedlWfoiheQeXJJu/0UOpjL4LeTsnrr7BPZg
         DVQv6/DuH6UwL56a+RDbI9grOSKfaOHzessyZpreaGyCRmknHzCxW3+yhCzqfR+tpvWy
         S/x+zpWHty8xGA+gF5UU/KcbHKeoEH0VE0fkZegeKKnTJDWxmbvRQQ579gDlNCe8qOvN
         WS9baBoZ1tXc//V9hnrfGoSUPYfXH5PU55vVznP1fdA4crT2BZdeaowfkhJGaIDJp6Rb
         7ACw==
X-Forwarded-Encrypted: i=1; AJvYcCWtmC/iHvV8ijY7Xt5LsX6tjv5CpbGgICoTDujakAri9voA5sfYBSR6P4uzadvSlE67PxKX8CviP5R+@vger.kernel.org, AJvYcCXB9dpEjrL0Pdzyewf0sKk8Q535YAFca1yhXVD24oJSNy/SKXJQryvUnWcif833ocxDT9Cc4ZEBHRLmnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR4P0sYLyRQDgzUPhzMor7rO/rrHJEVbUjQe17+FM2Ct5qR822
	/X7Je8bRsXowGZYfv4GhcGA6Zk3DZiLE0+1A7qO4BaR3EJuStroVWmMD2MyD
X-Gm-Gg: ASbGncuHNcbfbd8fGz7m8CaBy3usLgCLn9kbTdNuQR/ApxH0iDwTwKL1KYB9nlrsbMU
	M+H7VxDlZq0J7W7NKIhtUGctRbqASQkBOcEIeHOh3C1b1GLaolVGlhw3/x4UnKkwPkakrF/vXNe
	L3xkGxyATnf+SW9tqgCv67uiUfXXVrj+qGEtAU1e28zop5+B1yH5O5jdYnVTuzq7O75Ce0GMzsw
	p8kLYZSiLV5p3QRu+5UfJ12nETF6JSeqmphHdd/Qp3inemX7iGWb4ftAu+4mRjNPzDMwgh67NaH
	HzSuq62guZJIFtdAtKryPi3SZ9jgeTT3Z03LnkJMUsRDh0xuP+CNkY4RS0EqlSRUrd9kZziC
X-Google-Smtp-Source: AGHT+IHWyzW+LitplVnXgeIIWVQtwyPcPmEUY4nEdYl6FjiSdqtUt21tTL850GPlX0mKToT5KM6dAg==
X-Received: by 2002:a05:6512:1084:b0:540:3579:e4ed with SMTP id 2adb3069b0e04-543e4c3c099mr599319e87.11.1738186186009;
        Wed, 29 Jan 2025 13:29:46 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:45 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 04/21] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Wed, 29 Jan 2025 22:29:18 +0100
Message-ID: <20250129212935.780998-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A lot of devices do not include this field, and it's seldom used in force
feedback implementations. I tested about three dozen applications and
none of them make use of the delay.

This fixes initialization of a lot of PID wheels like Cammus, VRS, FFBeast

This change has no effect on fully compliant devices

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 33 ++++++++++++++++++++++++++++-----
 include/linux/hid.h            |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 488e6a6a14a6..e2e431dec936 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -184,6 +184,8 @@ struct pidff_device {
 	int operation_id[sizeof(pidff_effect_operation_status)];
 
 	int pid_id[PID_EFFECTS_MAX];
+
+	u32 quirks;
 };
 
 /*
@@ -338,7 +340,10 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->effect_direction->value[0] =
 		pidff_rescale(effect->direction, 0xffff,
 				pidff->effect_direction);
-	pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
+
+	/* Omit setting delay field if it's missing */
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -761,7 +766,10 @@ static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] = 0;
 	pidff_set(&pidff->set_effect[PID_GAIN], magnitude);
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->set_effect[PID_START_DELAY].value[0] = 0;
+
+	/* Omit setting delay field if it's missing */
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = 0;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -784,6 +792,7 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
 	int i, j, k, found;
+	int return_value = 0;
 
 	for (k = 0; k < count; k++) {
 		found = 0;
@@ -808,12 +817,17 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			if (found)
 				break;
 		}
-		if (!found && strict) {
+		if (!found && table[k] == pidff_set_effect[PID_START_DELAY]) {
+			pr_debug("Delay field not found, but that's OK\n");
+			pr_debug("Setting MISSING_DELAY quirk\n");
+			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
+		}
+		else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
 		}
 	}
-	return 0;
+	return return_value;
 }
 
 /*
@@ -1088,11 +1102,19 @@ static int pidff_find_effects(struct pidff_device *pidff,
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
 	int envelope_ok = 0;
+	int status = 0;
 
-	if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
+	/* Save info about the device not having the DELAY ffb field. */
+	status = PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1);
+	if (status == -1) {
 		hid_err(pidff->hid, "unknown set_effect report layout\n");
 		return -ENODEV;
 	}
+	pidff->quirks |= status;
+
+	if (status & HID_PIDFF_QUIRK_MISSING_DELAY)
+		hid_dbg(pidff->hid, "Adding MISSING_DELAY quirk\n");
+
 
 	PIDFF_FIND_FIELDS(block_load, PID_BLOCK_LOAD, 0);
 	if (!pidff->block_load[PID_EFFECT_BLOCK_INDEX].value) {
@@ -1336,6 +1358,7 @@ int hid_pidff_init(struct hid_device *hid)
 	ff->playback = pidff_playback;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
+	hid_dbg(dev, "Active quirks mask: 0x%x\n", pidff->quirks);
 
 	hid_device_io_stop(hid);
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index d11e9c9a5f15..94ad5a510639 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1227,6 +1227,9 @@ int hid_pidff_init(struct hid_device *hid);
 #define hid_pidff_init NULL
 #endif
 
+/* HID PIDFF quirks */
+#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
+
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
 #define hid_err(hid, fmt, ...)				\
-- 
2.48.1


