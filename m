Return-Path: <linux-input+bounces-9626-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB996A225D9
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0682D3A2060
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FE11EB9F6;
	Wed, 29 Jan 2025 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbYh+2FQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0358F1E8837;
	Wed, 29 Jan 2025 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186213; cv=none; b=ltMbTTvTkRcdkgMGgyG47YOEUYZWruOsdMwICoG6frgb2f26pQMmfcxz2WQTrJj+PN5shlLiwmR2CwllixShDJTrTqavjSObrFTb4YwmRJpv56/BTbJTaFUiLbqVmpS8xJkKXePxRzyAah9+HIGkps7tjHZt5UHT0ToZuCL+Weo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186213; c=relaxed/simple;
	bh=KYoulX0+pP4wf+LAn9laV9dVI2wRk7dBV0OdGBJcfRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbZjVezhAyal6tRmYpjbavwjdSQ8ItsSPVfsOQmrqXaKj3zR+VUx5fbwTKpG2rrSAEfxRRdNU8B8vn/OCzQeP9TETcpv2AMZ7PRnEq72NmGqKxjAgvhEvFPaqhfnjdwqXZu3LYKbwVU37KtMJBCmmvh+W9l6KhRcUZdVlgJy8ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbYh+2FQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543e070cda6so14369e87.0;
        Wed, 29 Jan 2025 13:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186210; x=1738791010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mihAfDvNPJNPt4/37fGLK1NIIAZsOCg7/uXaTRSIRs=;
        b=EbYh+2FQOn/LJF2uAl96ykjUBPL40gbIEaBmNI26xKN+7IEDwhGga/sSN1Y3UKtXi2
         QgqaH/tkwtdPxsP8K7pLbZd/O8Nj0PYqnNIMXU4tUfwHVLHGn7mn87k79Aoj9GFEWhGo
         SaJBxri3fzMB5QE0Uhf+v7+gULEa/hTtFVlbCV91gDgvz6sEfHJsS+GvgwZQSPHy84z/
         CIGSzEhKGXBccsJEfsM0WE3cuh9ky3/c1/ZXIl3z8skRPzqlnIlh7MN08ULwmhMKKJVt
         vI6nZTtTdDfaAnPc9VyNMg9osMkeNhGux/WjnuJETAnMCgrqoyAeBMl33yUArQDJ1mhJ
         G4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186210; x=1738791010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mihAfDvNPJNPt4/37fGLK1NIIAZsOCg7/uXaTRSIRs=;
        b=kJ1JVz29elVxIwm/TOwTlr4mhNIysa/EXGH6NqaGwM2zuQD83MJanNdykIItzsZajG
         4qGMh0SCG4E7H9sl4fShqusJEC/NMxFvYphjntS8N5+WLmnYHn6EgjFQooCNmM5xupwA
         dTZ4ow3WHRp0u1klZ2e+n2GqLOdYU2D0EZk0/6Zy/jBGM/SKH/BMLX+wnhISJiu79pKi
         g3XSx0r6Dze47d5uSiOSn5Dp7DKzzQfvzgRlQmnW5Z5TkcVWIVPFN4iA/a+FkdyYue/P
         4lOGi+O5vbjt3pW5EAVNUbtZ/GFiW/LHihZSLbydozFUj9AkM1KIF1GEru52mpaY/xFu
         7A4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+nPbZWnIKRw1sPX3y30f99M1Uv8fq0OYMTxPuC5Uj7u5MLGOCJBGBPh6yknn7ed36DjX1LJm/WR65fQ==@vger.kernel.org, AJvYcCVQYdzWRQ92uIwq59sFosJUcTOmhADjIoJ2YvX6F3QJbvPYogF5AzbxHBAShMuiqtJ/XKTvlThzbo50@vger.kernel.org
X-Gm-Message-State: AOJu0YxL+WbEVa8WD+CwKKGzOoG/o+9LfIJV3H3WjIQiOCX2T+0U6wfX
	7T2vOc17AVqvgqovet+SYEaHyEwgX7W/wJYvnt898J7QL6gGplEgCDvN7u+t
X-Gm-Gg: ASbGnctfp+/93zT15LM1M2ar9PGd9eXw3NOLuc8IiUVs04SseSbMJ4rJjV+UEkdUBu8
	oLMBO1QzYTAhCoTwjSoqDamIeRCyWmJ4jcmYicKGW5H48qk8aD9jZLx4MVOLLi5J6eBbwWQkb9l
	L5DQOsVZbMnW1x4sIV+cMB8poKNS2VuN5PpzLuubjbB/FyKAK5SaH2vmiAEiN0ISEhsxZkzlNhJ
	qhgNOw0PqQmNxv1XyElBugXkS26M/Trt4CVLBXR7LH6pqvoELgSo1dubcvjeCo/8iWGT2n0x6OG
	UBu3qZ+RAmaOacP2fMxX3xJAwA2Y4nEbLJoqJNMzErzBEolxsnm0zNSCfH5ZvQ==
X-Google-Smtp-Source: AGHT+IE50LiBQHPUWZ2irtGbuI2jGpfNWcVYLFchhttIOzUZsQwW82oGOJA2BKQ8Elp+hqnwxpHVdw==
X-Received: by 2002:a05:6512:3041:b0:542:2990:6e9a with SMTP id 2adb3069b0e04-543ea824592mr67958e87.12.1738186209789;
        Wed, 29 Jan 2025 13:30:09 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:30:09 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 21/21] HID: pidff: Use macros instead of hardcoded min/max values for shorts
Date: Wed, 29 Jan 2025 22:29:35 +0100
Message-ID: <20250129212935.780998-22-tomasz.pakula.oficjalny@gmail.com>
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

Makes it obvious these magic values ARE in fact derived from min and
max values for s16 and u16

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index f478859682ad..a223557de099 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -21,7 +21,7 @@
 
 
 #define	PID_EFFECTS_MAX		64
-#define	PID_INFINITE		0xffff
+#define	PID_INFINITE		U16_MAX
 
 /* Linux Force Feedback API uses miliseconds as time unit */
 #define FF_TIME_EXPONENT	-3
@@ -226,12 +226,12 @@ static int pidff_rescale(int i, int max, struct hid_field *field)
 }
 
 /*
- * Scale a signed value in range -0x8000..0x7fff for the given field
+ * Scale a signed value in range S16_MIN..S16_MAX for the given field
  */
 static int pidff_rescale_signed(int i, struct hid_field *field)
 {
-	if (i > 0) return i * field->logical_maximum / 0x7fff;
-	if (i < 0) return i * field->logical_minimum / -0x8000;
+	if (i > 0) return i * field->logical_maximum / S16_MAX;
+	if (i < 0) return i * field->logical_minimum / S16_MIN;
 	return 0;
 }
 
@@ -255,7 +255,7 @@ static u32 pidff_rescale_time(u16 time, struct hid_field *field)
 
 static void pidff_set(struct pidff_usage *usage, u16 value)
 {
-	usage->value[0] = pidff_rescale(value, 0xffff, usage->field);
+	usage->value[0] = pidff_rescale(value, U16_MAX, usage->field);
 	pr_debug("calculated from %d to %d\n", value, usage->value[0]);
 }
 
@@ -266,10 +266,10 @@ static void pidff_set_signed(struct pidff_usage *usage, s16 value)
 	else {
 		if (value < 0)
 			usage->value[0] =
-			    pidff_rescale(-value, 0x8000, usage->field);
+			    pidff_rescale(-value, -S16_MIN, usage->field);
 		else
 			usage->value[0] =
-			    pidff_rescale(value, 0x7fff, usage->field);
+			    pidff_rescale(value, S16_MAX, usage->field);
 	}
 	pr_debug("calculated from %d to %d\n", value, usage->value[0]);
 }
@@ -306,11 +306,11 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 
 	pidff->set_envelope[PID_ATTACK_LEVEL].value[0] =
 	    pidff_rescale(envelope->attack_level >
-			  0x7fff ? 0x7fff : envelope->attack_level, 0x7fff,
+			  S16_MAX ? S16_MAX : envelope->attack_level, S16_MAX,
 			  pidff->set_envelope[PID_ATTACK_LEVEL].field);
 	pidff->set_envelope[PID_FADE_LEVEL].value[0] =
 	    pidff_rescale(envelope->fade_level >
-			  0x7fff ? 0x7fff : envelope->fade_level, 0x7fff,
+			  S16_MAX ? S16_MAX : envelope->fade_level, S16_MAX,
 			  pidff->set_envelope[PID_FADE_LEVEL].field);
 
 	pidff_set_time(&pidff->set_envelope[PID_ATTACK_TIME],
@@ -399,7 +399,7 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->effect_direction->value[0] = pidff_rescale(
 		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
 		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
-		0xffff, pidff->effect_direction);
+		U16_MAX, pidff->effect_direction);
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
@@ -1366,7 +1366,7 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 
 	if (pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] ==
 	    pidff->block_load[PID_EFFECT_BLOCK_INDEX].field->logical_minimum + 1) {
-		pidff_autocenter(pidff, 0xffff);
+		pidff_autocenter(pidff, U16_MAX);
 		set_bit(FF_AUTOCENTER, dev->ffbit);
 	} else {
 		hid_notice(pidff->hid,
@@ -1424,7 +1424,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	pidff_set_gain_report(pidff, 0xffff);
+	pidff_set_gain_report(pidff, U16_MAX);
 	error = pidff_check_autocenter(pidff, dev);
 	if (error)
 		goto fail;
-- 
2.48.1


