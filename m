Return-Path: <linux-input+bounces-9613-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846BA225BB
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 731C81672B8
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FC81E5705;
	Wed, 29 Jan 2025 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeD1grfJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5A11E5020;
	Wed, 29 Jan 2025 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186195; cv=none; b=qN8R9INtHV8EHaPqnbvnr1JkeB4PNOrLYvDU/xvKPH814EprZIx2mvw2KUTgSFgGl2q15ijGaCg9TU3eKwOjrfGvIooimhKq0b+dhsPDJPBju62zVvK6DHPdNhB69PgPPBicdO52zQkHPv2K68GWyNdNAjZFksDLpMVvQwViVP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186195; c=relaxed/simple;
	bh=pYTAXNODkP6Yob1RvogJD4zChtrr/2cpl+9O0i9/5OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E9PPfM61yOBYgu8W/xsTnNzr5xjE1GMESeSsq1uJcoFPohdDCG4UNwv/7NXhasZ5qjEt3xw2WNh/Itt/NoKJCtPEkbyvhsMEHjld0W5Pg8Ph3WsZXwVDC2s7C48qdfnVuG8LgSEnMTtxOpVS8Tu87AytXChJ+nEaphorGs0YoE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeD1grfJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5402ec870b4so11378e87.2;
        Wed, 29 Jan 2025 13:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186192; x=1738790992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFg2JOqecCladPQNQJTKLQ/Khyip6uEwSMoUfQW5Wyc=;
        b=WeD1grfJ0YT8W2u98+989LhJyP2npfZ7wLGGUC2wZF+bojjGYamZg6Ur51pcRyBlaF
         R10e/EQO88fFEacVfe/Wx/VN2H+Olw2hh82FW4BeVob8rHUSdWkqrAn+YkpIn/wD8Tu+
         r2AlKOqbEXATFbdyt/ALj2JQF9S63+EVKhDqPTY3zwC6NiUJgr4dZ42lxMZYk55ao7rD
         ydMRHXzTPqcER/SAmzUX5kwyxXz194afF0Ms5rfCn8EhXoNztXnerxBFvf6DGEhG1JT6
         f4e+FytT+XQM/bFqOJGkq/aXqJPOv/DkXkhqY3x02WbHeFhpMEtiZnE9KrA2apejPdwl
         GIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186192; x=1738790992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFg2JOqecCladPQNQJTKLQ/Khyip6uEwSMoUfQW5Wyc=;
        b=A2dCOhCo66gu3j7Od60PYH0RB0ZgIRh32Xud1lJSum+TMQYMVcqnOD6CzaEF6W21oA
         tXYk3bZYa/DpgPr1lSklxZ0clhuFhvBj5iKfbZtgVsOWDgxxA6ywVzEgFgWeXfg42ay5
         71xe4US1xschjSnWj4hXhP6xkY3qHmNEFdmvT4jvUEoZljs6JhItA6jwK2jalFcdDE51
         x7fQvka9msvIyLqialiDI0uyxxLyio6PSQIDAehRDHoVIMqPjJgHQk65pNH4Q6jouwkD
         6G5SH+BWDSqB5mOnyWCJuO3n09SJ6EEKFCoA4EkFK+4jpqDcgnYfdz0TuTzQp+luPPpG
         iedg==
X-Forwarded-Encrypted: i=1; AJvYcCUIGLEAfdNGSO5W69/iGJa+CwCnBDdySm/c4Fr6nsIFePXy2RW6Wyfw0T9k14aP6JJcDB/tMaTSPxHXww==@vger.kernel.org, AJvYcCVdqQ+x20otU8YBsVvStqZvAWadJpu8c19I2VMcbp9cb85XePzj/AgcXRJwhRRhute/oAAIwX2FeQBO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2GSmm0wtZgeOxewsVlM6PZUoe2pve7r5qi58+Ji5tjWXSft9F
	PpsXL8lG2Yz2U4tbIlYJUZp/6y365KKlXU8KnUyE0MeFSAmYeMpE
X-Gm-Gg: ASbGncsi4JojSmka/feUhARrP7HQbymXa7DrzpCSlcJ3PeVP8q9mAwyDynlGIyGtqkU
	NrLopkNYMOG87zrV5yhpIwJFtp+yJrb+dsGe/yilsAdgsYoMzrO1MyXazTBO8ZY2EH57RqKUcwR
	ueRdcmQliR9IwO4/RGCtrmVqyXRicuE09I0ooiDawjD8wq84dyikNFFgW2PXs/GKrVwjiMI5j+d
	qabqJhEMwqQeY28CVe4J6iHhEGiyVt6RdajCvMX4Q0SAS7D6B3OJcR/kUuE209TB9EUnPeS3CKB
	Gaer6WQ2a7q9pWlTsC4RIknp6oQr3Iv9nAGfXDwuGSAYiVHroQalTCnKfKl0bQ==
X-Google-Smtp-Source: AGHT+IFiFV4Q3hkCzpBATq/1QMdmSSHFHuBefVyza7QqRwEJ3YaDy9z8od7Gdbfd0YaTkMyYsgHNGw==
X-Received: by 2002:a05:6512:2314:b0:543:baac:e9f5 with SMTP id 2adb3069b0e04-543ea3f86d4mr115508e87.5.1738186191422;
        Wed, 29 Jan 2025 13:29:51 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:50 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 08/21] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Wed, 29 Jan 2025 22:29:22 +0100
Message-ID: <20250129212935.780998-9-tomasz.pakula.oficjalny@gmail.com>
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

Most steering wheels simply ignore DIRECTION field, but some try to be
compliant with the PID standard and use it in force calculations. Games
often ignore setting this field properly and/or there can be issues with
dinput8 -> wine -> SDL -> Linux API translation, and this value can be
incorrect. This can lead to partial/complete loss of Force Feedback or
even unexpected force reversal.

Sadly, this quirk can't be detected automatically without sending out
effects that would move an axis.

This fixes FFB on Moza Racing devices and others where effect direction
is not simply ignored.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
---
 drivers/hid/usbhid/hid-pidff.c | 12 +++++++++---
 include/linux/hid.h            |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 298a971c63fd..9e03dfb2b1e7 100644
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
@@ -337,9 +340,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->effect_direction->value[0] =
-		pidff_rescale(effect->direction, 0xffff,
-				pidff->effect_direction);
+
+	/* Use fixed direction if needed */
+	pidff->effect_direction->value[0] = pidff_rescale(
+		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
+		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
+		0xffff, pidff->effect_direction);
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/include/linux/hid.h b/include/linux/hid.h
index e6e9081d7dac..856bed149246 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1233,6 +1233,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
+#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


