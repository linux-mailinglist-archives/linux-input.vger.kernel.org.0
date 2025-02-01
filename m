Return-Path: <linux-input+bounces-9658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D09A248B1
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D81516560A
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7829186294;
	Sat,  1 Feb 2025 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcKjIkze"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5C017BB21;
	Sat,  1 Feb 2025 11:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409971; cv=none; b=BFOiyPMKosFLinVqYXPoJ0kBJTi+GxZU3MECWoEESzK6RJMR5ZpYtQub67FZx6fK9T7ZNShXTOTGa21nDOT7tOTNLw/LmEJrL/8Ll2OeXY3IH0teAB1QL7X/qMZxANuS4F4EcnjY5VgWsKKV5r3ks93xpGUF2/2CxnQ+zo+ER6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409971; c=relaxed/simple;
	bh=0JMbTx8MAqSGVKeP9iqMMmXIma+2uK0+3JYnnBu33uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JAoNHBnJ9ZPSU4jF0NL++ndvlhUXydkOaLAsBkYjnL/asZ6cwgG1Zr3VCDQledHWxJEUvLl3gvr0mqVRcGKad+Ek80F8KPDTnj3+LAoP9RrLvcLWdWpgvMMcx1VUMbYJZOSYClyLvA9dPYpGo/RbxbTUkKFdwdyUMxWq6ajy4ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcKjIkze; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5da0c79ff85so500465a12.1;
        Sat, 01 Feb 2025 03:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409968; x=1739014768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYTYlboOCdijF7WUXPOBpFB7tWhjMZyCMYi3dE6csS8=;
        b=VcKjIkze08lwDL3qqsnV7xLsOm9f6Oa227Q2UO0HBvp15/gcfPNnQcsgAG1XjnDfuM
         rP3rv06/F5vsX+B7nEby1O/AitD3Np4RmP5Ai4Z3yA14SBq+QYaCsgpOh/uH9ypEn0g4
         InB/BRqvMUoNWtzVdqHyXOPx5g0cAHwVWJOwrcoX+TWq8OF8fs/lA/wN0qUAPexbW7dR
         GL8CvYjeoZyXyAN+HC1Esc76u9kzFH4UoWmZv81w2mCaGXHitDS1/p4bIb0GRDcfQoSc
         iXGWprG4XA1kVcVRvuUjgSDjuXsAdoPNiK2oJmxapaUM9RZKMI6pIxS2QK82DIrvrVoo
         m3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409968; x=1739014768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYTYlboOCdijF7WUXPOBpFB7tWhjMZyCMYi3dE6csS8=;
        b=fYz8xoytVMQEOJisX6V7YIzwIPueme/uTc6SDamgJohaDMQ8SofNC2ku8aHNqXz5WC
         VUbe45E1gNDbT7qIKomuPC8/YpLbpiYh3ta7uJnMcaV4J35i4LU06qDDm6Ntkpi94u85
         NI6DoIkbkQj6Roafd+DSDf1mAeI+VN2kmq4DmMQ3pSedkBK8ig4qJSI300ZMRaWKTxdd
         CscdMdPeZX+T4k+IgzoYXcjWrm3K8ub2me9ds1fgwsXbzjihT8Q1DmZnOdkMJZcHYEnI
         W0Og4GOTfzqVa6wRBk90qY6OzijD0/RPNXYM49QXerJBYbSoaPkrESNVrPdm+or++GIv
         K36A==
X-Forwarded-Encrypted: i=1; AJvYcCUbLjJjJsrmMZKQJi7SzWWimWGiZH9roiA+zXrxW/hE/ZyPaKAnV0n87dqXTjsW1mtgwpAQKWbJHzwz@vger.kernel.org, AJvYcCWAXsvQfdcn+5Kr4ETr7XEuM7C3vh/RtqxH4WFbMQsxDU64xosZbrUVcNmPC2P6knZ87JpYlhOm79Y1Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhbl3bKRCSyy+qx7t/WQO+uwk13YGlbUmle7oyrL44fH0F7nk
	hoxhLftsGTIlU9XpkkwBj+Y6T+L7B7Dj7zCstWvlynMOMGdJnXOg
X-Gm-Gg: ASbGnctaBx4NC9tW8CYm5jLdBGjeKaVyw0zVfKTSRIED1fuBYnMS7iukKxYPIAQyPVG
	iLrmp5R59pwgK5favI6zDfz8bivYARKLv+NgrxksXVEi/DV8smqlq2t0jvuQAl3zC4TNZcw4bSO
	ZGRA/uc7kMUsE7OEXRs8FBedYlryiZnJJKLlBPJm3YDKp/u8aAop1/6uC5qKY5U5jcS2EMRuNUc
	nQ4fmDl5GtXV+rxY6YUpnbCQRqI4ClYbn9DBR2FX1z0pyc3+arIQGFlAlibKKzOik9TE9s/B9Pw
	bTbiC/VMR+qiEnXDngj7zPBGbvnE0cjWPeASsY/IzqBz5HpipSCWrDilo6UbYA==
X-Google-Smtp-Source: AGHT+IEuoOURL9oB44181r4d55F3SNYmGC2Q7Hw06xGWB66yfNu11ItCvu37ZZ6PbucEn9lZ12jvFw==
X-Received: by 2002:a05:6402:51c8:b0:5dc:8845:6a00 with SMTP id 4fb4d7f45d1cf-5dc88456b7dmr1998321a12.8.1738409967882;
        Sat, 01 Feb 2025 03:39:27 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:27 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 16/22] HID: pidff: Rescale time values to match field units
Date: Sat,  1 Feb 2025 12:39:00 +0100
Message-ID: <20250201113906.769162-17-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PID devices can use different exponents for time fields, while Linux
Force Feedback API only supports miliseconds.

Read the exponent of a given time field and scale its value accordingly.

Changes in v7:
- Rescale all time fields, not only period

changes in v9:
- Properly assign fade_lenght, not attack_length to PID_FADE_TIME

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 69 ++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index fbb79179e02b..8a2a4bed2632 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -22,6 +22,9 @@
 #define	PID_EFFECTS_MAX		64
 #define	PID_INFINITE		0xffff
 
+/* Linux Force Feedback API uses miliseconds as time unit */
+#define FF_TIME_EXPONENT	-3
+
 /* Report usage table used to put reports into an array */
 
 #define PID_SET_EFFECT		0
@@ -231,6 +234,24 @@ static int pidff_rescale_signed(int i, struct hid_field *field)
 	    field->logical_minimum / -0x8000;
 }
 
+/*
+ * Scale time value from Linux default (ms) to field units
+ */
+static u32 pidff_rescale_time(u16 time, struct hid_field *field)
+{
+	u32 scaled_time = time;
+	int exponent = field->unit_exponent;
+	pr_debug("time field exponent: %d\n", exponent);
+
+	for (;exponent < FF_TIME_EXPONENT; exponent++)
+		scaled_time *= 10;
+	for (;exponent > FF_TIME_EXPONENT; exponent--)
+		scaled_time /= 10;
+
+	pr_debug("time calculated from %d to %d\n", time, scaled_time);
+	return scaled_time;
+}
+
 static void pidff_set(struct pidff_usage *usage, u16 value)
 {
 	usage->value[0] = pidff_rescale(value, 0xffff, usage->field);
@@ -252,6 +273,27 @@ static void pidff_set_signed(struct pidff_usage *usage, s16 value)
 	pr_debug("calculated from %d to %d\n", value, usage->value[0]);
 }
 
+static void pidff_set_time(struct pidff_usage *usage, u16 time)
+{
+	u32 modified_time = pidff_rescale_time(time, usage->field);
+	usage->value[0] = pidff_clamp(modified_time, usage->field);
+}
+
+static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
+{
+	/* Convert infinite length from Linux API (0)
+	   to PID standard (NULL) if needed */
+	if (duration == 0)
+		duration = PID_INFINITE;
+
+	if (duration == PID_INFINITE) {
+		usage->value[0] = PID_INFINITE;
+		return;
+	}
+
+	pidff_set_time(usage, duration);
+}
+
 /*
  * Send envelope report to the device
  */
@@ -270,8 +312,10 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 			  0x7fff ? 0x7fff : envelope->fade_level, 0x7fff,
 			  pidff->set_envelope[PID_FADE_LEVEL].field);
 
-	pidff->set_envelope[PID_ATTACK_TIME].value[0] = envelope->attack_length;
-	pidff->set_envelope[PID_FADE_TIME].value[0] = envelope->fade_length;
+	pidff_set_time(&pidff->set_envelope[PID_ATTACK_TIME],
+			envelope->attack_length);
+	pidff_set_time(&pidff->set_envelope[PID_FADE_TIME],
+			envelope->fade_length);
 
 	hid_dbg(pidff->hid, "attack %u => %d\n",
 		envelope->attack_level,
@@ -340,14 +384,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
 
-	/* Convert infinite length from Linux API (0)
-	   to PID standard (NULL) if needed */
-	pidff->set_effect[PID_DURATION].value[0] =
-		effect->replay.length == 0 ? PID_INFINITE : effect->replay.length;
+	pidff_set_duration(&pidff->set_effect[PID_DURATION],
+		effect->replay.length);
 
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
-	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
-		effect->trigger.interval;
+	pidff_set_time(&pidff->set_effect[PID_TRIGGER_REPEAT_INT],
+			effect->trigger.interval);
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
@@ -360,7 +402,8 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
-		pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
+		pidff_set_time(&pidff->set_effect[PID_START_DELAY],
+				effect->replay.delay);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -392,15 +435,11 @@ static void pidff_set_periodic_report(struct pidff_device *pidff,
 	pidff_set_signed(&pidff->set_periodic[PID_OFFSET],
 			 effect->u.periodic.offset);
 	pidff_set(&pidff->set_periodic[PID_PHASE], effect->u.periodic.phase);
-
-	/* Clamp period to ensure the device can play the effect */
-	pidff->set_periodic[PID_PERIOD].value[0] =
-		pidff_clamp(effect->u.periodic.period,
-			pidff->set_periodic[PID_PERIOD].field);
+	pidff_set_time(&pidff->set_periodic[PID_PERIOD],
+			effect->u.periodic.period);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_PERIODIC],
 			HID_REQ_SET_REPORT);
-
 }
 
 /*
-- 
2.48.1


