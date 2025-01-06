Return-Path: <linux-input+bounces-8966-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8EA0321C
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7E518862BA
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A391E049F;
	Mon,  6 Jan 2025 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi6/+wbW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3841E00BF;
	Mon,  6 Jan 2025 21:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199352; cv=none; b=fyhCL2foeanJApNpBvuaH+rNoNcQrmWBBREI0gmAdkwU6x+kEbBqYGRTub22N9QhsK6vletAv8TI5WqFgdkZpAWkVL0sEObKoGYLFrD5Krupku+wGLs00aTqdwtGlKTV0ZYHwaWLHIP4pR7fIeDEp2yYsKgIfywUWW+rBAaAGMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199352; c=relaxed/simple;
	bh=lwoYk8NIAbQoRUBh6t/sze22q7+oy0VMCbNV9NT2mq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qcHxbw76DguUEHe681KSrWtsN8d5UtKfRFxLChQNA8Tf26f0vHWnCpRYyHdft0z+cyDSFf3r2FeCAFjHTTAk9qELuFeZZ5XEt6tMD/7iseHCRsGCy1zeLiU6WLdp6S0xRvmQHh5hEXe4lURN5njT3TJ6Sah817+5xqyo8vpFsX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi6/+wbW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3ea2a5a9fso2221302a12.2;
        Mon, 06 Jan 2025 13:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199349; x=1736804149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf7d4JsYQjCJgLMIFYUd+vOjPbH4G49qGUq3EtsexA0=;
        b=Qi6/+wbWSVG2sNwrnjAgj+/pBYthix3aBJRFAPfNmKqHC0IZ4RgjsJ3KHwgS//mXhZ
         pSh65rZTmU4ATrDgfxD3M6okAErAuHzOTMuxOBGDDDadzGjpG2TaNZ95UKmEbwwGUTsv
         XdyRpd/13r4mqJ15l2zjOJv373YPgHHtSMZX+SwUBejDF6pyfh9yybfewbEoX9OoWIJX
         gESw6+9cgz02DN8bo4PBTVWqUhsC2hzoEd+jB/wS6vPjZUWfZXR4G5RP/yDd1KuVVqf2
         Zz5+YyaWuzvADNJh1FDMFl5/s/gOXSX3YuBRN7HT9ulPHIdHHxMuEKc7jxL6MT8M5AgW
         3eDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199349; x=1736804149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jf7d4JsYQjCJgLMIFYUd+vOjPbH4G49qGUq3EtsexA0=;
        b=WVnpJkzCERhpY0QDSRJ2s2yBWqWOF8Hz7Qca8+trxP4UNY7UGs3zKvzmxQt+vDkA5d
         BpJfFI3bFHavHiVhluLBtUrpRrdAJcQyp3KVdcQhylXkNWaTn34D8y07yF0/b908FV06
         s52MhV/62gGPhiVl2qcm3m9oaivumydLdkmDh3BnDNV1sBg5Pq/u5qFgGcmZI+ZcuH+h
         NQsvdqtacbBs0GVI3VREp0X9kYflORfZbFkNlTwQJykkUuTF2gVYnjhaZqk53R3kvGsf
         y5bm+MjkPqCpcNe8+Sz4diovA1dkzXq3HjdzgJXiXYF37GktLra/2FLsN15KJ6zigp6Y
         d5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVXitfdXjx4gQR1Qz5JL4fJ7GU5OYd6pDWhWchmJN5apC8iRXXeM4TS4lKsmMT/M5PTiSwBAKzwbmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32L20gkF9YzQWDj/J67r4jjcs8iISy4eKud2n3PdIcfwurH/6
	XycpDEALqmowMZIqXu5kzc8qH1vGFb2i7fcV6NI3WXoNHkKp5BOE7NMZxNr/
X-Gm-Gg: ASbGncuv1hoY/axz+y2nPoXiIcMYNKF/+DwvgFSbbtz/JH/eMwoSD8MMrDo7FJrPaZ+
	t37tcFnqFrdBXEN/lP45nLvre1SyYbrbXBH36ag3Yk6cR6y91s4+dmdjYRNM6S/fXKexvwXRi0g
	7mYXNOtKULEpWVk+aJ323u22KMF6JU1Mg4S+KNRQGoryrZ2AnbIprujMYyZFR/2kVegzzX6OVDX
	/Gr3b+htPoNANxLJF/zyGUCcy9FgFhmyMryVfw/O5xNfnaxxz3yzI66gkt2zOsr8Gj6a1eLxzLY
	bFzX2ejYmLSDdDBYe5WFutF5RdE=
X-Google-Smtp-Source: AGHT+IE0xMmcVFLpaVFFxN8WlztBMD4MB/cWcBJNzcsucQgjxXJf+qnAr3XNmgUyu+QBUXtc64ECxQ==
X-Received: by 2002:a05:6402:268c:b0:5d0:ccce:34b7 with SMTP id 4fb4d7f45d1cf-5d81ddf8113mr19712137a12.6.1736199348468;
        Mon, 06 Jan 2025 13:35:48 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:47 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 04/10] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Mon,  6 Jan 2025 22:35:33 +0100
Message-ID: <20250106213539.77709-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
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


