Return-Path: <linux-input+bounces-13771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A1EB194B8
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF969173386
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F0E19D8A3;
	Sun,  3 Aug 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb44DeAG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E71D5CEA
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244841; cv=none; b=iEIdcLlwHUcHFX1k0zUWzoPBMS8MbX8C/95FsqMsINaxN83WnAKxPOQ47SOBNY+J+P5E+dsipfxhpVu5z859f0ZT7P0H9Kd2+AXFJX0wr74IQD4KqjNkYLFzPnPs5TvNdhPJMjhgskm/2JN+rLkgFIbczR46Dzkfn48WmjQ6rhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244841; c=relaxed/simple;
	bh=WQdmBIDWDwjwU+p3Cyn5FP24KWSW/IDoo7k3kTfrDac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jNYmgJHxMAJhpN8l0i3gAy3/SKGfrq/JqUTis3NovUsZLMYFvxw3ytXLjfVeQ78hHudmgJZqVObRN/I9xtyNahVUjriJm96Q4LtX2bS/8WV4HEJeuRtZGY8G5bdZB4JUMor4dMaNi2UI17c842pG3t5KKTV+vQeH2FVOB4cw5Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jb44DeAG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af940717331so38917066b.1
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244838; x=1754849638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xQNBJpLo+ENTfbN0SB+vJ104e+ysv9gTzT8Xztb8OA=;
        b=jb44DeAG9XpvpVS/KJUkt09D3x52Ef3DqkwmIOhY0JTyqzBTKn1C8OqNDFNXg2G7Sg
         4R1Ys93+/CE0ZubKzi1nc33OhSpV5Wy6jUzTtfBKPNvxGx8Nr5b4n241aR1AkHUue25M
         vTFW4Bua1D02PO30v6fZ3iS4iMPTj+ZWnjKU4iSn5wNBLUe7iWxt9rGeIYxBrhWhn+Ps
         4IHKMWASbiUkTrZ8nWeP4p/p0bnAVg9N4jOEJY5V6IgSk06N7rctlxKKIw2oe+C7hJ1t
         HXr3pYjFe/LCgeLT9YyfObL38PCqtYgAAN6MFAS0M16hhAJ35kdZr7sSQ94P4m8h1tdy
         kc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244838; x=1754849638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xQNBJpLo+ENTfbN0SB+vJ104e+ysv9gTzT8Xztb8OA=;
        b=wBShHa2xwUV2EdqgknK4QWOsLPpVpx7Qv6rr2HgAmOgTDkDgxyhsC8RausAdpzlLmK
         PJFclO0rSKyjPTaRg3C4qtvCXY2s6Im3wqZRGofwhCDDLU5KBi3Cn/7IPj2Dx65XOuIb
         bKWDRJrxD421EuwPjyRNvIyreQVkQrZ/KSJNVo8xebWff0li3qZnESMaLvr8fe1ak3r5
         GdE2KnwIu8rYnB7JffjtXKgRnGKb+ZDsYBq+Wop6orWTg5l+b6GAnCC64huwOEXovGhZ
         PFesgJWuPXP6re87d6OMOPgkXpEKM+bU7g6wgi7sLqWVpHojQ69gUMtsM7nW1CdhVsL1
         MwbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK5AxvO4Xoe0u1xXZsEvkP7Lft5OD6/Kq9/uZ5VIBVdkgyUhXq/KwBY1oN4ZVQFbuRj+tOdnE4ZV4Emg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ch7JFQWIdawysFDt2b+ztBr3nT3FNolTl984uihFPnIqYuQb
	5kCXGjcrix35o53/utx7h4Mg7UKdR+D5zNYQftcDtHBLbcLHjWK4lMAQ
X-Gm-Gg: ASbGncuTart9ve7W7lm2RYoR7dBHVRYR2M05ERoBjakjRKhBGi6nmlgf3lZTtbTYZdB
	iVo5IUeZ8AyxdWpJ9f+Cg8xaExBsdejzGaLiU0U+tXzJg2PqVAtGBr4I8aTQUp6biMPnGjm9U2Z
	bBGvThGWkGSJ3K3j919rqw+hgVVmMUvkfnEsndetWTV/nqdjVDG22+8RIhA5GfOxsFIo46qnl1E
	4bPk3ivOco4OdWoxmrOXkhAOAcCF4FxGGrOoZXBBbp+duzU78kMz48/OVxaS1B14c7YXJhBZp1t
	B8IT4Boh9e/HjYkunQqE/RmRtKHq0fLRWYariO4kyp6M87S/WRFHfBPvJfd4NaZ9yPoibIvw/NO
	CmpnEPiUreOcGR60bN+7C9dUsTaQ57nD8XXy5wiEZmOfaX+YKo2fW2Es+6eN5PJuZVSIt55c7Mx
	w=
X-Google-Smtp-Source: AGHT+IFTeRZXeNNJ4jx36HECCIEvLNrdSliHcsAyyhFaF1mNqRSgNadSFqVNW/r5Qp5cFaq8HVlDIA==
X-Received: by 2002:a17:906:40d:b0:af9:6666:4acb with SMTP id a640c23a62f3a-af966665879mr63039666b.10.1754244837720;
        Sun, 03 Aug 2025 11:13:57 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:13:57 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 01/17] HID: pidff: Use direction fix only for conditional effects
Date: Sun,  3 Aug 2025 20:13:38 +0200
Message-ID: <20250803181354.60034-2-tomasz.pakula.oficjalny@gmail.com>
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

The already fixed bug in SDL only affected conditional effects. This
should fix FFB in Forza Horizion 4/5 on Moza Devices as Forza Horizon
flips the constant force direction instead of using negative magnitude
values.

Changing the direction in the effect directly in pidff_upload_effect()
would affect it's value in further operations like comparing to the old
effect and/or just reading the effect values in the user application.

This, in turn, would lead to constant PID_SET_EFFECT spam as the effect
direction would constantly not match the value that's set by the
application.

This way, it's still transparent to any software/API.

Only affects conditional effects now so it's better for it to explicitly
state that in the name. If any HW ever needs fixed direction for other
effects, we'll add more quirks.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/hid-universal-pidff.c | 20 ++++++++++----------
 drivers/hid/usbhid/hid-pidff.c    | 28 +++++++++++++++++++++++-----
 drivers/hid/usbhid/hid-pidff.h    |  2 +-
 3 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 554a6559aeb7..70fce0f88e82 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -144,25 +144,25 @@ static int universal_pidff_input_configured(struct hid_device *hdev,
 
 static const struct hid_device_id universal_pidff_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C5) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C12) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_VRS, USB_DEVICE_ID_VRS_DFP),
diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 614a20b62023..c6b4f61e535d 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -205,6 +205,14 @@ struct pidff_device {
 	u8 effect_count;
 };
 
+static int pidff_is_effect_conditional(struct ff_effect *effect)
+{
+	return effect->type == FF_SPRING  ||
+	       effect->type == FF_DAMPER  ||
+	       effect->type == FF_INERTIA ||
+	       effect->type == FF_FRICTION;
+}
+
 /*
  * Clamp value for a given field
  */
@@ -294,6 +302,20 @@ static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
 	pidff_set_time(usage, duration);
 }
 
+static void pidff_set_effect_direction(struct pidff_device *pidff,
+				       struct ff_effect *effect)
+{
+	u16 direction = effect->direction;
+
+	/* Use fixed direction if needed */
+	if (pidff->quirks & HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION &&
+	    pidff_is_effect_conditional(effect))
+		direction = PIDFF_FIXED_WHEEL_DIRECTION;
+
+	pidff->effect_direction->value[0] =
+		pidff_rescale(direction, U16_MAX, pidff->effect_direction);
+}
+
 /*
  * Send envelope report to the device
  */
@@ -395,11 +417,7 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
 
-	/* Use fixed direction if needed */
-	pidff->effect_direction->value[0] = pidff_rescale(
-		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
-		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
-		U16_MAX, pidff->effect_direction);
+	pidff_set_effect_direction(pidff, effect);
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/drivers/hid/usbhid/hid-pidff.h b/drivers/hid/usbhid/hid-pidff.h
index a53a8b436baa..f321f675e131 100644
--- a/drivers/hid/usbhid/hid-pidff.h
+++ b/drivers/hid/usbhid/hid-pidff.h
@@ -16,7 +16,7 @@
 #define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
 
 /* Use fixed 0x4000 direction during SET_EFFECT report upload */
-#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
+#define HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION	BIT(3)
 
 /* Force all periodic effects to be uploaded as SINE */
 #define HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY	BIT(4)
-- 
2.50.1


