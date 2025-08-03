Return-Path: <linux-input+bounces-13786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D788FB194C7
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6991B1893D1C
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B32A1E500C;
	Sun,  3 Aug 2025 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4daCckd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D471E7C08
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244854; cv=none; b=bCVBYcXlbXWe4Sml7jjyqZ8RdBAFAkWAIJgyCD1fwIsT4k4ryjaL9KG+Rdr6ZfjvNPQ8BnC0Pf/wm9u0vDvMGRYX0QUw1UNd04lxP3cC1GkxZ2Ie9+igkXB3vXR8RjoQgSroS5wWkBhFivagCRmbczqHBH083X7iP0E6/DV4824=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244854; c=relaxed/simple;
	bh=gYU417btB+3yOaOwXGvLJFp3YrNBMJ31+euKDTz4E5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/M259N+c+/2xOM20/oLnACU7PBuOebejzz825k+Zi70WecFXl+ns/+7DDmNTHtuj7ewCRfPaiKaKx9e0AtGlEL/rRAg9092nnKn2sw/HFemwlXbR3bdKcZ8jbsiS52+lpjwUgPu6yKJojD8cnjNfVXrUlcuIwGCGkWbDWJO9/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4daCckd; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af935b052d9so44332666b.0
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244851; x=1754849651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCQPebNN1ATD0iA6vhgfbm0vq3KC6DnzoKcLSjumm+8=;
        b=I4daCckdirXOieL/P/yoqIT3ZBAtkhUkeycvXVRzK+Q3Mo8FMNpMg0ohO6KXbXQdjF
         rpJ61tu4txdNiWHxvIyZx2Jk0O/F+7SGf5s/CyynHpzPokzuYljoP8Mg6Czya4InDUa/
         GlIeRXg39nHZJ0QdbCTLiz5mMDiawaR4lI++LZG9D8u0/pBaMkZg/pQJhEU/Rb8mzJ0h
         QD7/mLMasOGgBIFal9ArI7XG1RH8ZibIP/fFbfiOZk5MdMpfmathxYDaug1BWY5KFh/O
         nPYXTwxMNSoT3POIi7HsjB9OyFe7Xhvu1XF7qrMn1gtuwArt4HcNBL2oLxpQYXPkfjtS
         BLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244851; x=1754849651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCQPebNN1ATD0iA6vhgfbm0vq3KC6DnzoKcLSjumm+8=;
        b=iLdVdD2qxhUDngwSIJyQztWpFWkQwE5Z/vfIm5xFbB+oNFZJ+cUfWJpapRmoPJ1Ret
         sMS1meNj20DItdvlx+0JanldzY9t5j0eggLJs8/6ieWAx9zRlyUT9AvcSPIs2NszcQgx
         4/3SfRMH1IzJWBG+qFkeRQr/gr5gC52ieJIddzvc4PE3KFEd0D48+TCELOi/NS9iqck2
         Dkhs5NTHAE0yPnOnw6ipg04uzCYirNg/I8dDDEWCmvusyQOsh6IQoPnZOcArAPwT12aY
         yj3VVZL+owllW+Vxu25g8pueu7vXMAeBHbvokCYfSUgbtW4ZHlZmGa81qa6V2uBzz+hi
         0fGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx94T+6sTTMvxEd3N/i4XgdcT7bKdmZkOKwkrRnXqgAU28fc/RNNoM45HPdvPgw256gjt8YQhdkdku/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDsbYAkWArfXByMFHj4/D8OgfBWQAG6qNiO94kI7Hfx2JxvcQV
	/EhRnR39ExdB240q7ZaFcxByBKoyS4OShv82m409P/t7THRYksl71QMDPPXGGQ==
X-Gm-Gg: ASbGncvq22mXY+Dzrw66sdfUxgEsqyykBW8ewnpf088IM2scycgF3KcG5IU3M/M3txW
	2lasUnWfsp3xhb5dIwGrrY53uqW7FaskK/4+XcN9CjGxN4tuITg7O8EjJmVfGhiovW+rdJe0VgL
	EafRFknFxFud1i047HYfhGM11FwQ/DXpBfY70PC0Utc5jqokU+6hkA+RfHnxr+CBvNC7py3Ufdh
	MZ4nLOAHk1b9XHTFa/SkAmiCBlKodF/u1cukIvccbn1pHfE0CvmNlhEPFkuQ/Pj7Kogs1pq17Ar
	ypzvtrbxlwTsoZdAODpIHAUDlHQuo75428E1nsTB3poMt3ZgVUgNoIF6c+KjcLqPQjA3WARmq0B
	UO1pXt1a26I78cljuPRzE9MiIRvv8YtjajBOBKgDqeFzvnoayIuwgodQ0dpz7wovSe/6s3mp+Fm
	s=
X-Google-Smtp-Source: AGHT+IHBjJy7j7OkqGPsVHpjkUbZtuNAz8QsRsE7aqw4gO+ez8XbeVr+N+iiD3mDihgULGQB+jFXwg==
X-Received: by 2002:a17:907:9813:b0:ad8:8189:2563 with SMTP id a640c23a62f3a-af940241db7mr301670866b.12.1754244850837;
        Sun, 03 Aug 2025 11:14:10 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:10 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 16/17] HID: universal-pidff: clang-format pass
Date: Sun,  3 Aug 2025 20:13:53 +0200
Message-ID: <20250803181354.60034-17-tomasz.pakula.oficjalny@gmail.com>
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


