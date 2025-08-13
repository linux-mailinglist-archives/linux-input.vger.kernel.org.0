Return-Path: <linux-input+bounces-13995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C29B2545B
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 160531C84F7E
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5F72FD7C7;
	Wed, 13 Aug 2025 20:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6Ux8o66"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DB52FD7CD
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115824; cv=none; b=eK1e5Scw6QCIeopotkAlf8cLFhHOdDi7fgNVEkgdnnkZJTwv1vFYNs3XtkitKsF573D+DWXzG3fQYwV7QzoQ36leQO8uLNFZba3Dk6z/ErCbvrT/75PXJZt3U8QFNI2/E3TWTgwNV5a9IW+fj39vZ5qCAo1uHYsDCSEvjTgb/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115824; c=relaxed/simple;
	bh=gYU417btB+3yOaOwXGvLJFp3YrNBMJ31+euKDTz4E5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVGpxjuyZvBe/oW6KSiJMRuuNEsCD90ZDMz3bcY88B4CNMuFOugVbUZDMUb6spU/9HgL0aNNlIMMNc8NrZ5dMn5claClKpsBe+0u/kpBj1cNG6esTNChMfG1slReOCWcRzbkrwqNddtaqgCiwMARf8/rX8XBq00Jey0k6Dba2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6Ux8o66; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb79fb221so3183066b.2
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115821; x=1755720621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCQPebNN1ATD0iA6vhgfbm0vq3KC6DnzoKcLSjumm+8=;
        b=O6Ux8o66VIjidT4kMlt4kPAbIvAWupgQmT9I59p3tSZVtOQkU0oTxccjiDwKKQ2RaJ
         f5eII8D7TVG2MN3O74uRIQ04wcySBWkxtEvgAYhH9dlEEOvqPvMXrl8+uruPVdbxFpR8
         d6EN3mUH9q8HRV9iUU0F34DiMCuDuYFgqdqCgdHmhBeo5RcUeN4WWkfTAkOAwm8Jedv8
         txTUCF+FDbH9Htn1n5UZZu5cufGM/Rd80rcOwVsIwes9NzFgkZSrbgdyJZQm1OWwgsSZ
         5/4244G6U6EgDcn+Kk6cCzw51nXdaMs8MFVo1Fa04XKJ7QOAkfc/PfI6P70obIf1RmI0
         Di1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115821; x=1755720621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCQPebNN1ATD0iA6vhgfbm0vq3KC6DnzoKcLSjumm+8=;
        b=sbMKU34xxQExvcABcyoyqCSCnG/7/ijWTaOG8AtOC+BKe7K579HPG95m68q/J+5QFk
         W3C2L6OtcVWdjPYaTwJF7M0LeL9COA/Mw6ti9BlES+Jc4l0+7CSZTpQHGBv67ISPn/qQ
         lFC1zJQyiqLY99UjS5EkVf/TwoIlul/sJgw37hALA4SUA74fnVU5dWDafXBuQSoxRjD0
         Gf72rTBLtgNx/gc777T/FbXQ7HHmcKYnZvHLh/+R6UPVkjodYyEurpGN0cLDYOWV/psU
         On74aZoNZhaZj11gqs7SZ9m60C/ZTzPVfG4sdy4kZXtqsX5RXdPColZ7P7vjKRwdhJxC
         sG+w==
X-Forwarded-Encrypted: i=1; AJvYcCU/OUZezEmJvJP43PFUWps95wXfso6MFVMH6BEXAQnRW+NxaoS1kXZZJDk6kRzJKgan/q1lJRD/DI1mmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl2ohJX/2xgKTaW/iGeKfjk+VugM8tTpiIj6HhOGxrx7Ctpi9f
	+mRsNyAlCb7qO1OhHRt1SGrfI2FFcxmWrmhK4t29TLdcYXYQUNmdEClq
X-Gm-Gg: ASbGncsBuNTv/Yd9fedRW69KbBvLH3gDNK8ralrlJaSsZjUQhuRdQHmiQGlJne6AQDV
	VgLD7tkxmXMx4G13DI5HBZUm72UJWMgfTOa8WNlx4zi1xS0yE1E0Z8KdJk75Q7F4L7MaKAKvRVN
	zsxHkhh1KZglK8pMPH/2Wcr09p99OPB9DI0xYwt/fePnJAS5z/dDKiuAhUr2B+Jd5tgnDFKvbvs
	hP8Okej8XnmbXfX1bU1YWziJ6GPegZ/9LYRHq840o9RDYTPwOziQQJAOqi1X3ApE1jh7nku0+7r
	kYAo9aA4lZqyhTQAEzjCXaXR9B44CW2+F2BXo34Xs/UMCaLHLlYhyLaROASo8yY2fQtrjAbga3p
	7NYmES0DVXGU2NeHcvXffJEDlfGgpI2xGHkKOo6kLiclHEbHQOIofdikaPRI3Cofje4o/uF6BfG
	k=
X-Google-Smtp-Source: AGHT+IG9dDD++gZWaqxzy6X4HednBUxLgWF4JxcVlbO/B/0Aco9hkVjyLjlnk0AEGHHyxRw/vRtIJg==
X-Received: by 2002:a17:907:d88:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-afcb98e24d8mr21019166b.9.1755115821056;
        Wed, 13 Aug 2025 13:10:21 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:20 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 16/17] HID: universal-pidff: clang-format pass
Date: Wed, 13 Aug 2025 22:10:04 +0200
Message-ID: <20250813201005.17819-17-tomasz.pakula.oficjalny@gmail.com>
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

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-universal-pidff.c | 57 ++++++++++++++++---------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 70fce0f88e82..549dac555d40 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -8,12 +8,12 @@
  * Copyright (c) 2024, 2025 Tomasz Pakuła
  */
 
+#include "hid-ids.h"
+#include "usbhid/hid-pidff.h"
 #include <linux/device.h>
 #include <linux/hid.h>
-#include <linux/module.h>
 #include <linux/input-event-codes.h>
-#include "hid-ids.h"
-#include "usbhid/hid-pidff.h"
+#include <linux/module.h>
 
 #define JOY_RANGE (BTN_DEAD - BTN_JOYSTICK + 1)
 
@@ -21,8 +21,10 @@
  * Map buttons manually to extend the default joystick button limit
  */
 static int universal_pidff_input_mapping(struct hid_device *hdev,
-	struct hid_input *hi, struct hid_field *field, struct hid_usage *usage,
-	unsigned long **bit, int *max)
+					 struct hid_input *hi,
+					 struct hid_field *field,
+					 struct hid_usage *usage,
+					 unsigned long **bit, int *max)
 {
 	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_BUTTON)
 		return 0;
@@ -126,65 +128,64 @@ static int universal_pidff_input_configured(struct hid_device *hdev,
 		if (!test_bit(axis, input->absbit))
 			continue;
 
-		input_set_abs_params(input, axis,
-			input->absinfo[axis].minimum,
-			input->absinfo[axis].maximum,
-			axis == ABS_X ? 0 : 8, 0);
+		input_set_abs_params(input, axis, input->absinfo[axis].minimum,
+				     input->absinfo[axis].maximum,
+				     axis == ABS_X ? 0 : 8, 0);
 	}
 
 	/* Remove fuzz and deadzone from the second joystick axis */
 	if (hdev->vendor == USB_VENDOR_ID_FFBEAST &&
 	    hdev->product == USB_DEVICE_ID_FFBEAST_JOYSTICK)
 		input_set_abs_params(input, ABS_Y,
-			input->absinfo[ABS_Y].minimum,
-			input->absinfo[ABS_Y].maximum, 0, 0);
+				     input->absinfo[ABS_Y].minimum,
+				     input->absinfo[ABS_Y].maximum, 0, 0);
 
 	return 0;
 }
 
 static const struct hid_device_id universal_pidff_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
+	  .driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C5) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C12) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_VRS, USB_DEVICE_ID_VRS_DFP),
-		.driver_data = HID_PIDFF_QUIRK_PERMISSIVE_CONTROL },
+	  .driver_data = HID_PIDFF_QUIRK_PERMISSIVE_CONTROL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_JOYSTICK), },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_RUDDER), },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_WHEEL) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V10),
-		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	  .driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12),
-		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	  .driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE),
-		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	  .driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2),
-		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	  .driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_LITE_STAR_GT987),
-		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	  .driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_INVICTA) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_FORTE) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_LA_PRIMA) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_TONY_KANAAN) },
-	{ }
+	{}
 };
 MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
 
-- 
2.50.1


