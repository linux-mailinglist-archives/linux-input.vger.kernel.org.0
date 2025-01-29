Return-Path: <linux-input+bounces-9621-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AB3A225CC
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CAA11672D4
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AE61E3DDE;
	Wed, 29 Jan 2025 21:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJ/YqQe0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74631E9B17;
	Wed, 29 Jan 2025 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186206; cv=none; b=uypIsSFW4Sszc/enml1dPyD67BPQV4HqREvEy5iJz3sW5Lzp0Z9T5hN2p4sT4bYIPwi0BEuTHfHsnDQZUSI5H186Jqb4SCUYYvpqoe+1z1/ruzKYPzHOkRdwHaFgzm4w0VOwlKGvm4MgUTPavGsF5sxLuNdwgDUbwxVj0EqqqJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186206; c=relaxed/simple;
	bh=iJ/1wezF7ezlL/JORpboMa8tBEduDl5uxy2LGcpk2yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T3WJOF+M/XYjrOEnDiGvGTlyUE4RQ3enVyxBx6WpsA7vh+sSUXwFP0ii4uZPM/YylZUXJwtd7IA+y9XwobbLL4qwXDStoGMp4bJvyHXqtmBHARV0RCoUU9zmvCiBcGVEmFXfs/pcyH9nY/ESEI/uk3tdoVnsQCLEI4FpRugVRhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJ/YqQe0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso16606e87.0;
        Wed, 29 Jan 2025 13:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186203; x=1738791003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOtQHUVFtBKAN6mbtmWXvgmP48h7Jzc9jnO/6z9uN/Q=;
        b=SJ/YqQe0VugtRJPQjnemi7mowGHDCh+7J8m7t0Q/2P85yJkaKtA5frO2HlAt5XCgSk
         12WACnhZ1owOfm01sd9sPb3UKsHxG+4IW2V1O+yKSjj6P0bMLtzjqIG7jNzB7j8+0GrY
         LPFXWuRIdHSqmJ5QK9sivPm4MzfePytR73rAL9ZNr15JuDKsS7SzEhyEUHUau0fpCn7P
         2ay1yY3FK1jeDWlGRpTUiMf7Qee8P1Jl5rYKlExaElGJaSdOSzdIoIfiRn6mUwInzUQS
         Zd/LyK6iIbmXp5gvHw4Rneer0c6Vagp57ZNDlNM9E/Y9/AU3X7FtWFMmz7n2+xHup3xc
         B7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186203; x=1738791003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOtQHUVFtBKAN6mbtmWXvgmP48h7Jzc9jnO/6z9uN/Q=;
        b=YQMIMkdZmSdRQtADT5iRPuVPXX3JrraRqqByT05n5ICeaZY/IUJ/ompdDJtXHWObUG
         cchf2m/VCd2+ifH+dKMw6L7SOPrloYIU/OJ03Qbzx6PnBuevS8PND6YdeZ7OYxW8cXA6
         gL2n4Zm0Sugf2rwNaSshN6X4+apuG72ZxMBFJ66ERBye9SBpn5VOuqpAnFIF7PM/VztG
         z9EdFMm6AsEa1MevBqt/5dMDIxLMGth25OZrEKFTp8MRKejpxCgNxFs16Q60he2npPbk
         TelgxU7PZdNIx9HyWXpDzGR7AKPov0ntbYMkpVDLyCG53PFyQFGRv3BzmrlX7dslnQni
         gkeg==
X-Forwarded-Encrypted: i=1; AJvYcCUB/FHga895HMZcB0zDNnLgBjnJPNM+reWpl5d4ubP2DCv0u0zHCOGc4YfhF0berjlJB9ged7EYy/rsgw==@vger.kernel.org, AJvYcCUG9XPasLNa+KDKBu/zwKw1Y0re4UizAUctXy0HZpuqE1fTCaPFWScDtiLcHSPX58uc3nBAi3iKZeaz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6fSw5Gs1xV+IQy90W4VLiteJc+nHrtrliJeA9NiG1xV8+cM31
	on54HiIF96wJRBdx1r8ahdg/F1f8KI8wOTyL8h11Tv9uAu5LpKSQUS9KC+At
X-Gm-Gg: ASbGnctGUi5n08bA9+YWGyO1htbkCcxXRrsPJyUGmS1j4GUg4ft5tx6BgQ99d4CjHyd
	2Fj6ywE6cB0ctAWJ00AKqFSmEwmY59BcnyKioqPlSo5S3DiavBHSAQUDMaLRW+1ZOJwxlXYCT90
	HAU47rsVkKfm6YVW4oGoB8GSbs+jUMVbgJLQvSpEm2zFbKlt4+8zOCWAFb+InBZy/ArO5r7M8TQ
	CrlTeGNIprxMUhT6Q0wgWMnxh/N5y/1c96mv+voeP436ugJIA2hqh3dh7yTxeijm4YOiqBOtsWX
	QR6L7sw5lacng8quUlsgUw4ioGzxRROf2s9pg6nhy+RMc6DfeU1jfK87irMDpA==
X-Google-Smtp-Source: AGHT+IEytPOx0OA8d/RHMGldoObD1kyIuIMh1MyzjHU3pO2evIpcKeADFulw3cpPqycmF4qb80FL9A==
X-Received: by 2002:a05:6512:1083:b0:540:356b:8ee6 with SMTP id 2adb3069b0e04-543e4c3170amr566690e87.9.1738186202762;
        Wed, 29 Jan 2025 13:30:02 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:30:02 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 16/21] HID: pidff: Rescale time values to match field units
Date: Wed, 29 Jan 2025 22:29:30 +0100
Message-ID: <20250129212935.780998-17-tomasz.pakula.oficjalny@gmail.com>
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

PID devices can use different exponents for time fields, while Linux
Force Feedback API only supports miliseconds.

Read the exponent of a given time field and scale its value accordingly.

Changes in v7:
- Rescale all time fields, not only period

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 69 ++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index fbb79179e02b..6fcced6348ec 100644
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
+			envelope->attack_length);
 
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


