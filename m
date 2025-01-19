Return-Path: <linux-input+bounces-9390-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74622A161FC
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACB0B7A2BD7
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0072B1DF732;
	Sun, 19 Jan 2025 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWUWT5kU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B91DEFE6;
	Sun, 19 Jan 2025 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292454; cv=none; b=nqCgDsQDVZlNrPPzUrobl1jkQ3wVZwslaLwnGzu53/IJj0LwZjkknn759WwmZxNMDQwhSAegV7pDAICi3+i9ZGJ7ZE0TW9+Vsjq6i1EyjeO4vF8yJMnvb72aqqzCt9+UKDXtF45+xRhGk7cnIuBh8ZbW1sR8ZLQVC7hNQMgVJQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292454; c=relaxed/simple;
	bh=U4XSO6HItdH3Y3O7RBAUoXbyGVlgQEw0plNllelDQLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fg05ylbRQu2gtEXLCF8tIvUOPztbmg6VrrHVs1+bH89e/ruAIY8DxcG/JVu4bvFbtSf4tYZFPLfZpYqV17yDwRfGTRuS43kJrmDEeYSYr0RFgbm5bfjZFs/V1CqvjLdGlPq9+Kg9RXN3OlSSiOEpMT1GYYdlQNsjjK9U/AZyNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWUWT5kU; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa676e4f36cso54112866b.2;
        Sun, 19 Jan 2025 05:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292451; x=1737897251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iwy5DXoHYpEPu+oArSeioLqlrlfN3CCAJZ+CyGwF6oc=;
        b=MWUWT5kUnZWdRFzHsnwOaVzLSnXmgZ4uJbKROUnD2gcEVKoA+HPcCQOTxcyllK69tT
         au7AMxFVhTJ/Ce0fKkt3Yw+kstacJwctPUe0T1dudchpNGnQP1HSFdYUL9cxecVGFl6V
         YAaBVf3awvEUk4gDl1tkaiekAlgrhH6AYtgZMgKCYsZIJX3LtJfjw3N1dXLsdy8ZYGxB
         HoITDBfYKMWwgXTJrZYVodpbAG9fo4CCXpNzwjCukyrg/oHqneEfVNaTMpI1Ypu3B2CZ
         RYBanLNjep+gq9Lcc+3hDkMcD/fARD6qUR/BL8ArInlErILWtlBTWdxDxN5tBX2kM5nv
         FBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292451; x=1737897251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwy5DXoHYpEPu+oArSeioLqlrlfN3CCAJZ+CyGwF6oc=;
        b=CIWqabyO8P11sn5YZDi7XYKrUWExspzTqF4t854aR3krXsNc4iKSgeQv6NqbUXXg8l
         ZSrUMXEI4UfuPZLGcGuT4w8rTfWuj0YtYvz16RA5JcyyKTkrB2rCvIzYxHdAx6AelS1h
         WCGUzdi1+p7XtOLwVThTccF0NqP7MmIB05g1TX/ISsVJRwa2JQ/hM175HAutMUjh7qKE
         CG3B6BHH/BZD1RoIQwY6sYwskes4ca12g07MuWnMz+RrIvN5n1whAGsp7PfA/iRODCYo
         UFpyGqw+aWj8XdQB3Hnj6Xu/J4zByw8sgALb3zLvMWDC2YoX460MFNzVqMPpFAdNVXT5
         EMJg==
X-Forwarded-Encrypted: i=1; AJvYcCVNQ3VY97MS6yDswIQQHNi+JWiVoIrf6XxUJeQ9gqqj47MXLRaWtcwrjdaCBPNbHjzp9AZFQiTCsvJl9g==@vger.kernel.org, AJvYcCW1IVUQKaCmNOSDR2Ee74wiLgIJGajergJxGHGATZwfdj8cqLcYi2rcxoZhVWIAQzD0FdZUW3lgedzj@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPDoHc4UC3Rrt27LSBUHhbygYi+sQswv5VZCiAsw9hBvb/IGd
	H5RjJUrzQCLEoMgD0PnFgGreZa8lYQPWBPPMU+4Y95N4Q4J3bO+A
X-Gm-Gg: ASbGncsMiDJKJymcHFehGPmrbjZ5s2sZDNbWRuxbF20h0G1lMvH/y5V3I6FXep8XZ3E
	uvPLH86oBxRx42qhLCrPxzsCYccv3i6gSjAzMlnr7riTRj9tfdp5K2jQzD6WncxShMaf3HnMSnD
	fm4YGdAk8O92W4mWLBAnB6sCSLSqMp1lPtg2qbqJcmOGHwRNuRY5rgi0g6oTF3jXkozHcPZD09g
	c25vAsKmlcJo14lgd8aBSWhfFt5PCujPT22qZAz1lSOKYPE2SR7JLZFhvjd46LAxkCtSHXERIOY
	QBS2B7Y/HFGuW6MiDGUYOhRrDd7UBGKCn8WitNZg
X-Google-Smtp-Source: AGHT+IFxMANnRPEC8EbAW/IxoIi+sV9QMKsjmaDKba+dfq8F5Yi/p5lfojXZX48u07DjU5UaVsM4XQ==
X-Received: by 2002:a17:906:d553:b0:aab:fcbb:da37 with SMTP id a640c23a62f3a-ab38b49928emr307379066b.11.1737292451247;
        Sun, 19 Jan 2025 05:14:11 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:10 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 08/12] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Sun, 19 Jan 2025 14:12:59 +0100
Message-ID: <20250119131356.1006582-9-tomasz.pakula.oficjalny@gmail.com>
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

Most steering wheels simply ignore DIRECTION field, but some try to be
compliant with the PID standard and use it in force calculations. Games
often ignore setting this field properly and/or there can be issues with
dinput8 -> SDL -> Linux API translation, and this value can be incorrect.
This can lead to partial/complete loss of Force Feedback or even
unexpected force reversal.

Sadly, this quirk can't be detected automatically without sending out
effects that would move an axis.

This fixes FFB on Moza Racing devices and others where effect direction
is not simply ignored.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 12 +++++++++---
 include/linux/hid.h            |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 5a328860685b..6b4c4ecf4943 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -136,6 +136,9 @@ static const u8 pidff_block_load_status[] = { 0x8c, 0x8d };
 #define PID_EFFECT_STOP		1
 static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 
+/* Polar direction 90 degrees (North) */
+#define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
+
 struct pidff_usage {
 	struct hid_field *field;
 	s32 *value;
@@ -354,9 +357,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->effect_direction->value[0] =
-		pidff_rescale(effect->direction, 0xffff,
-				pidff->effect_direction);
+
+	// Use fixed direction if needed
+	pidff->effect_direction->value[0] = pidff_rescale(
+		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
+		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
+		0xffff, pidff->effect_direction);
 
 	// Omit setting delay field if it's missing
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 93233c5b75a6..5237f9040950 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1233,6 +1233,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL	BIT(2)
+#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


