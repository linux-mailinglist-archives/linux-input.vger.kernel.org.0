Return-Path: <linux-input+bounces-8898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E071EA01B85
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D68C3A3347
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3521D47BC;
	Sun,  5 Jan 2025 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7Hi01Xs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D11CEE86;
	Sun,  5 Jan 2025 19:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105800; cv=none; b=rlf9PSVMK6Nhm7RtP0s31T1w3mQc1m4rAUE1TNcG6jDjp/O1ssXRGQTPA0R5wwMiVXGqUN9p2KUJDFzDFqILRfVztbeq0QcYaL1FPY8Zv0eDCQSxNrCUrJodhcn+3I2POaUFEBye8zLu5A77x2U006h/4L3WvQ6CAereXzphd7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105800; c=relaxed/simple;
	bh=lwoYk8NIAbQoRUBh6t/sze22q7+oy0VMCbNV9NT2mq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jGxjDpHFybsV1PlM/uZGXbSOZM35WOXGYeAcjrS/4uiAReaemIRedGgcOBSen5cdeXV0huQgtfXt9PFD0gkHvyzAWSPV8CFcouBwBz/LMaGZekdj/185AbRcxxrpkF82VZdfccYUgTaWkcqqRBrZJWDsvwmLADj88yBw9Vx3ssI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7Hi01Xs; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3003ae21db4so13449561fa.1;
        Sun, 05 Jan 2025 11:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105797; x=1736710597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf7d4JsYQjCJgLMIFYUd+vOjPbH4G49qGUq3EtsexA0=;
        b=P7Hi01Xsc1G6e9lPAJYhafuZwZw9fcMgtltxHkt17WY719+soLzRTtsSpyA50lCfAi
         KOAXWRsSIS4jEdInufDXckLGWIfNy9DkoMc5xyBZaA8waeqzPqsLZAPjgUZzleZIX4UD
         VDW4Y423p9XMXUiLhwp0QxetGxupxUxQC4EpDMp6Uw4Fubc55vrp4jxCaRoc5R8NPYsN
         aasAucK40lTp5NaTCUtUyVaw5Ch64INlX7gs3LQ4oFgR98HAoEw/fYaVpecKGT1Btvdz
         fOuZO/Yc0LvYxgeZ/r2DmL/TdeD6KQFnuvqibeGjDNtG/geZOIP6SmSSKOqOfeQCh2lU
         idTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105797; x=1736710597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jf7d4JsYQjCJgLMIFYUd+vOjPbH4G49qGUq3EtsexA0=;
        b=kQL0C0X+6vToLO55OPZc0C3moLee7qSDV0gbRTgu6KWrQh1Y/di7mJIPb1Nsar9f6h
         TpG5AozJ2bCO+5VSNvZByREs/QS20/3HrCDfbJZcGa/T0Ory/BEKX3d5ozA+lInbtrl9
         oeBXkjmbEnbEMg0T1lagbZO6VIH8Mjki94694uVyFJOfz0UmwaDzajF0ae0IgzeP90gn
         GD8ftb/jb4mA4sRcYiS5/El6K+KTmuIy+Njwv2kQHF2gIyo/mvE6DXI3VTixjyL90ETs
         XlKDi6wzqlCOD9HwvpJYGqSbTyPSj2t7KYz94jDkGL1+sIceC+D4q3M2jHK8JQHDZr3g
         rEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY3qhHqSB3RY2XXOlameWSXAekNNDD6KOwXKetStrGrRZn2qOVP6sAjFFpKKbEZlDjjln0RvNkJ+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Ua7Sy7NQW5ZXSaLsJUDRz6+stCYgzy2Tyg3DoC4eMCHrUTs8
	4scdCxnwIqcDIeZLrR2zm31sMLz+8jc7+lQypvzMRYPHQ5thl3PAfgGmtZ+7
X-Gm-Gg: ASbGncuaaemwJNHXwR6yKTAJvsqC7CZU5uzvOA4s1L+5DgBgER7RtOoADTKEgqsgI4B
	xHdLNUv3Q6GO4PUhg61ZdVos5T6N6Kkm3oYUL7CYBpctBc83Q/ytZUrCzIia22WtULecD9jJgcH
	miZL/okCSVhdEU9pRNdGlMU6jO2MQssyuUKfPkpYg9ix44P+NoUV02JG+jw7pKyFXRAUn1guZHW
	zHKR+XduYxv0MlZA6QLScucYQFp9Au7Z5zTufFz0Mq9yfWDahmrHzTy6HhiYcAUELJsnkgx+Ku9
	bDi724lCnmqPKFDQguaqPtROW0c=
X-Google-Smtp-Source: AGHT+IHxEuTPBkibtivuSfJdbrbqbD5ZWpTA1uQ8iUCrEXqugCWZDP2pmlcNk7lrzkZWIBS53qykJQ==
X-Received: by 2002:a05:651c:1547:b0:300:33b1:f0df with SMTP id 38308e7fff4ca-30468547fbbmr62947151fa.4.1736105796895;
        Sun, 05 Jan 2025 11:36:36 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:36 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 04/10] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Sun,  5 Jan 2025 20:36:22 +0100
Message-ID: <20250105193628.296350-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
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
2.47.1


