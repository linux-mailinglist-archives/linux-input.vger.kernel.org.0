Return-Path: <linux-input+bounces-9386-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4132BA161F2
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A80216496B
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA78E1DEFF1;
	Sun, 19 Jan 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nB/0g5F5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBEB1DEFD8;
	Sun, 19 Jan 2025 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292449; cv=none; b=MuT4E3ltRRIvtX1I0F5i3b+Zs1oUq+E0LGUEkLCxBXX90DHHtsCOUqkpfGqUUwM0KOOlSfNJMDD6sqb1dCqrnrNSmju80OYJ4XSJv5+UuE9lUuBYpeCOyPZbBGBtKAH/jH1c/D7di3VTFScpNoWrNEiRY0m/NBWNoocc6fdWxS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292449; c=relaxed/simple;
	bh=d7geDuANMQE2cpSBpz5nYXaht95cBAlASu6QKliEqf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SyES5BIqjQDix90KJfN1Pr6Ev5Prix+iGPiYy7smYrfoAvS8QqjDBG2k5ZMJ5dwDzcbPbUHZ4V4BMFvkixX9s3StVXmldaH+k92hxMEHn8QmelocobMrJ91R9a2X/rOeHBXL6i+/1WJaZB2VPOy8nNTmp4WEOus/4+4NUsh2Mhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nB/0g5F5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3da226a2aso649844a12.0;
        Sun, 19 Jan 2025 05:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292446; x=1737897246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44UOE+PBo4WycrOHHhjEW68JP7Cxd1EJOMJ/d6eUVsA=;
        b=nB/0g5F5sU3GuaIfA+JQAcy/Uev1hQfaxFsJAkpNTddLFWc8IQq3J79quLmZ4jNtKU
         FmD+Hx4oSJ9h3FLGgVjfWcJ8AJHz6DZwaoW6kxaL5RFoXxU03NZ0Ix8Qx7wjQmY6YDsn
         puGat6kzMOmSYn0H+zF5ZHddwmTXb3yySCqiMtPRenkIJdz0cY7qaA4JZwgc2mWISv/d
         8gi2qLUgmWwM7Kup3MKPbkZwAMT+E5URO7qnOED1vL73tyTundgIvI1le78xEyiPFR5O
         dqsrqi948toNcOfUQSBKF5/4QDCFNU96fDRrvoSRpdDedFfq5ct+s1zsJhc3B0SZqFMP
         FHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292446; x=1737897246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44UOE+PBo4WycrOHHhjEW68JP7Cxd1EJOMJ/d6eUVsA=;
        b=FOssjs94z4zMjnMEeeOoeBuXXM8aBcNwGoeznj/vk3WAAc1wS+Mv4yZmojkW8p1KYa
         BeKt7P8DWaoB8IoKAm8Pw/3JH+CM3ZEl6xZIogd4Hhnat0dDWtZUneOgwNaWv5OH0L8X
         ytohXEOHNIUJxOwKm8WnAT/30hdZFE/niQ1DvUgxzFicW6I3N3tB5VpNueMq4vR2DTQS
         1duyui/noTC1elaK81GaggWAMT2xk13vUZ/HnRUuSD9iHBc6uv3ojoZTrY1FAexx0XYA
         E0UHl4/ymNzJGaglRnEtBXEem9PRL7x36Q58PA/QcFPXaTNxKTn3gOQGvamfR3CYc+xj
         ZNMA==
X-Forwarded-Encrypted: i=1; AJvYcCUgUX9NAR0Z9bSrVy36SzU3Cvwjth3EIvESdKSjhkrGxHhbFkj8IAllJTZWRD5plx/Lwjr7mo0dh/VD@vger.kernel.org, AJvYcCVh2cWMO67aJxgplgqJtvktQcPvEps8Vm1g7wWIpn8B25SIbHm7iybwxmfG+NMgwCtPXdeWF5O3EgAqVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdfr48SA6EhmkWSe3+5OpAj3HGOw7dmG6opsTuo88A/rlbuWxe
	+cUphdIPrCRoG/TzGH+Uk46Oh5W3EM6PorTjeVwkvaTwoZmCo0P7K42dXpLF
X-Gm-Gg: ASbGncv86vhzKnw+zmODY2ipCFVU+zxEwku02T87COAFk/1QrpstjNdiaHmwPdIM96W
	4FZ5iHHZ7W5v3XgxTD5p9o354JkSwzAP6pjQjIRducwVPqMs9gRNLNFvKY8wWYanmkIMBQE+uCD
	KUv76fUGN33J2vPDQK/dqriAvKR8fYb0Vtwr917/VISwjPULQ3Rn3/QMQltH/amJlZzAfMSoLt8
	44eXHrQZY9Uc7xeJhwYXE97lg0RpjmlVSzWqPqo4iXzEEDUAlh2E0mZHt3hN5B06AmKYN/XWJTq
	IfZ5OJuFz0SgqGxKrAz54mZJrA36GdPCI2s0C7VA
X-Google-Smtp-Source: AGHT+IGAq4xErmmp5ifHFlgN565RHTq4aRI8sJpkmtZtzTpW/He8YUiv8WzdCsSR408wdphI+1ycAQ==
X-Received: by 2002:a17:907:1c1a:b0:a9a:8216:2f4d with SMTP id a640c23a62f3a-ab38b1d4b80mr309774066b.3.1737292445875;
        Sun, 19 Jan 2025 05:14:05 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:04 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 04/12] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Sun, 19 Jan 2025 14:12:55 +0100
Message-ID: <20250119131356.1006582-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
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
2.48.1


