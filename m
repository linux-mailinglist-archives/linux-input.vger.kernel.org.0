Return-Path: <linux-input+bounces-9186-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C40BA0B76B
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF5A77A1FA4
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2779B234962;
	Mon, 13 Jan 2025 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXPYvudV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A198231CA4;
	Mon, 13 Jan 2025 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772574; cv=none; b=LMmHg5k7xrEEDzJHyEgWcqp7h/2fhl5laZbjHHFiCOXTHjmYwqrAqyix6eLeKAanddi7X2L5Ie5/piomUoKxljQiuA71CPtFzpxrNTovQ2a+p/qlIpukvg/9/F183T36Txjgiib+cAgZVN+a+VEAJ72loYBS/i5jZM5zWonSn54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772574; c=relaxed/simple;
	bh=+d0HyMNOkMms/+4S3y7y1zKcr7KT2SdwpQQHRu+KIa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbd5N7Jf0buI0IRsDvFcE9Fe4i18Cc77IWusTaVv646FN3Qp/X0PJ6hhu47mZk692RSzrSh/NUSBHNH6WiGtnUw/cViPxOJBxZl3zguh47Ra6EGDGbpMpZf8c/LN2sfGYG4gC6m5H/u5LY4/wrO8Br8ZkBcRAlmxH06N5/08w6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXPYvudV; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30167f66717so2493891fa.2;
        Mon, 13 Jan 2025 04:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772570; x=1737377370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVDn/ZwrDtBQBWFoygwf2iIYwvUq1iC1Us9noUk0/hs=;
        b=cXPYvudVipuf2STufdhAULOwXwmeMO6XXaD+F15O6zdY/LsQOkIFT6jYJwc5T97wIn
         wGm77avcl3IzaQQUU2dIhH6iFCWk2ipqIbJsRLV3KIY6LJf5IlRTSLKsj0RGwLhSpmWk
         e9HROQc2G73jI6LtFdaLbKwkeXqTK3PTDShAoRJD008BtO5KcEjb9QOH1nWnALZgIpuV
         T6fZ6T8jwXI2FfW3AU+4uUtWRS3+9OzyWvyn7oeDBC5w/xeJ45LaBveVZpUg1Iut4uyj
         uxO0LFJ3Ofr97vloPqOmb1bBYoh+cgSjTHU1jtK5kBfvonWOTFqcU/DoPrXrAnBFWJQp
         g2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772570; x=1737377370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVDn/ZwrDtBQBWFoygwf2iIYwvUq1iC1Us9noUk0/hs=;
        b=dJJ/eyzb7keLP7vLxk1XOwSLeBtcUiGzomWo/cJ/9cqnQWoUBa7Cp184CWy0F+O7qQ
         Nf69CqF1/Yt5X64uajlD5NKXBuLbTbiQL2n+KoHavk6GpHs1pzctB0/e6WH2oKlXBmpx
         zQA8W5N0uu1+LWQKKGYyl/MGvz3A8SxZkue/iOWoy9Gs1zxbByaibHCjOdTDEVpHIX6x
         tdUhht4JKD2vBclWTyNIMTm30qjBoZ/zb/DpVM0tMQJAc7sHrSVIvLfFEGttVtk6/frz
         YgdVhtUW3NO6SV1JxSb9GKbErzdrKBDI9DBLCs4eYP+TADXPKW9sL3q38aBjYWu6sxsD
         dK9w==
X-Forwarded-Encrypted: i=1; AJvYcCW3eQdHr23X4Mq69sgqY2ABJBCIWGGiBGmABC5DnbiqHRtZhZdGiChKs4VJoqTN07C/YfrdcEubAGXv@vger.kernel.org, AJvYcCWo0Zeji/gc5Wx6/3pnF+P+uJUrEkgoNSkkrhN5lnT11erB1cn3zqpXnxasBzzOPGKjyg3iMB3H4RFuKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFmLnQO13alp8VEGI2ZKDm7nndklEPhbLOcLvd75WeW1vWbqP
	219RK+Qc47A3hier9V7vaVVAdtRiay+akMtpAQUlYbKMWsBnNFvEQlgD/E54
X-Gm-Gg: ASbGncseh/GYsedHFpQr5wMpbL96h5r8yyTMWTz8/1m+peW/YzCqGSagzHmxmxjJpmy
	7jCiX+k4PWAh8wasXejNyxFQm0W82CWu3MFAoy/GzyjUqPJP9cA9n7FfTT2+Mi8CycFlnlJEOip
	ywDAa0SToLNs4S/+UiWf5gqn/lvM0v/rkOydjzTesiRsbmMxKOIQY2cqIBV88RhR/TREHH4YjwW
	H6X70ToBoSDtJ+hLMjqMAkFm72ZtAaTb0Q4bI9bRaq3k98vclu5g2ZlCxEGZkOebgdOId6urG27
	B41JrUPokjkW0qRJxv496zWCqos=
X-Google-Smtp-Source: AGHT+IEe3KYLwI5AcMsLKpiz+B9j/Zy1FZpvNCRe7DrMLW4zHeMF+P7TY8XVEbDZvRC1pFKyPDeGWQ==
X-Received: by 2002:a2e:b8c8:0:b0:302:1c90:58e0 with SMTP id 38308e7fff4ca-305f45446e7mr24810411fa.1.1736772570018;
        Mon, 13 Jan 2025 04:49:30 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:29 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 04/11] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Mon, 13 Jan 2025 13:49:16 +0100
Message-ID: <20250113124923.234060-5-tomasz.pakula.oficjalny@gmail.com>
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

A lot of devices do not include this field, and it's seldom used in force
feedback implementations. I tested about three dozen applications and
none of them make use of the delay.

This fixes initialization of a lot of PID wheels like Cammus, VRS, FFBeast

This change has no effect on fully compliant devices

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 33 ++++++++++++++++++++++++++++-----
 include/linux/hid.h            |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 7af7744e3cf2..28f42f30e2b3 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -184,6 +184,8 @@ struct pidff_device {
 	int operation_id[sizeof(pidff_effect_operation_status)];
 
 	int pid_id[PID_EFFECTS_MAX];
+
+	u32 quirks;
 };
 
 /*
@@ -355,7 +357,10 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->effect_direction->value[0] =
 		pidff_rescale(effect->direction, 0xffff,
 				pidff->effect_direction);
-	pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
+
+	// Omit setting delay field if it's missing
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -778,7 +783,10 @@ static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] = 0;
 	pidff_set(&pidff->set_effect[PID_GAIN], magnitude);
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->set_effect[PID_START_DELAY].value[0] = 0;
+
+	// Omit setting delay field if it's missing
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = 0;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -801,6 +809,7 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
 	int i, j, k, found;
+	int return_value = 0;
 
 	for (k = 0; k < count; k++) {
 		found = 0;
@@ -825,12 +834,17 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
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
@@ -1105,11 +1119,19 @@ static int pidff_find_effects(struct pidff_device *pidff,
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
 	int envelope_ok = 0;
+	int status = 0;
 
-	if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
+	// Save info about the device not having the DELAY ffb field.
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
@@ -1353,6 +1375,7 @@ int hid_pidff_init(struct hid_device *hid)
 	ff->playback = pidff_playback;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
+	hid_dbg(dev, "Active quirks mask: %x", pidff->quirks);
 
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
2.48.0


