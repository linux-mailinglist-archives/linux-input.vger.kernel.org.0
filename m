Return-Path: <linux-input+bounces-8902-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3010A01B8D
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8095C16013C
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA941D5AA0;
	Sun,  5 Jan 2025 19:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRQR9EzW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EA51D5172;
	Sun,  5 Jan 2025 19:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105805; cv=none; b=aF8LLFM0JNk5UGvnUyl5tUqv19GWX1xAw+dK8GI27X3Y8oU3JdnoDzYlo6vhqibILUfV9kpwe3PjoyUVY2ER1RSl0vhIOkN8nXrENSCyz/ps9w92NQGlqet0W0VCBVd+Z0ueLSgn0Jq8fSRhQoa6kSYzu1Pv3CdxvSVheL0HC3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105805; c=relaxed/simple;
	bh=wInCUfzKfgycExALsayqK3naLt6eLNwTG2gebglTTow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYHGMOsQU2E/gNtwGkE1uZS0YdI0KbHrAiaRsgOkA3K67HMLdgo0Wl5JAZnj00laTwyd7tdxPHMwrK+tqz4AwanwoEyfR1CIO8pFHPwH9G0UsplheLvyzQENlqYG8BGemZfptIoZD7gXh7cWCKmneAd91t5DSPKS897nRj/+sJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRQR9EzW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5402ec870b4so2100224e87.2;
        Sun, 05 Jan 2025 11:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105802; x=1736710602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quUUSX+k9WiW9LhDC88PMv/7wFZpf0XxRnFApYOjSAE=;
        b=jRQR9EzWXzmN55L8JRxo4giQxWA/8ZmoAuC6M4SjBpX24R6wKSuvD7BS/Bm9rdD57z
         Tuh3AhkiXQ445109yJoSSV44LekoS0ivZmCXCz9zbOU1RCWnKYsUllb1+8U9ngvbaQSO
         BWQBB4fTvWvBvq+cwduZ7JT+B/Js5TevB3Wy59fp2zbKCv0uF6Io6OvqPBReAHq6MDrU
         kLp4gdYu/Tua0mkPpvu8quhIyjoDEFAZAh2LF9gXY79QvTYmOknKrZKoKbs8WwkE64W9
         pIX4j+t6kwcvzXteYmMS7ti7GwCcwv5HvjX1gW2dQ6wd6UVQVXqvbKReJ8iw3Zz4DBsp
         NOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105802; x=1736710602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quUUSX+k9WiW9LhDC88PMv/7wFZpf0XxRnFApYOjSAE=;
        b=QAqbptAZXjDm5LhqiELS6o8FP6WrwxudvEs3kFAUDbaXyt4jCg8Pvsbk05tjYCJ7q1
         0UunSFHMn1S+JpbAn0wDlhNAAIBF6stwN0oOWCho1ZxgoDzWpLcUEJFZniteA72qbL/T
         IpxkYr7udunIg0KppVnINMOfYyf4Y6YjJDxwPo8gwEuCmQd8Lq0nXGQRQmTWwpHyHpCi
         sgHf+h4h8YphXn618pMkY9HDRp49WGa6+pxnxDJkyA4Awc36U/Aa6dMAlKwJJNRNs7Kf
         Q1UPfBGCRw25uWTAux9hUe5q0xreVvw82K+XohDz13h6yxk2tU3Ac82JrP9CWIo/nkhm
         7kjw==
X-Forwarded-Encrypted: i=1; AJvYcCVD/RFb2u+e8b9eINCE5nwldumYp9iLf3Af6SrQHUxYbpC5CGJSEX2KZ81ebHZMb6fC1XhwhoXrwXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZz2nFdfP6q02XPUBCtyVb8y4Vfp/tYT3ahgWkMFDEuJ/x6Xh
	luVmPM8fZo/pKvBbYeeNLLbVwNmA4SAE1Bb24t82a5Y3UdAKCu3rrDZOzw==
X-Gm-Gg: ASbGncuHlnhCeVqqvZGxJNy3UrhYWlH1pfKQ10uanlb92pWbtC1VYviFYPBFgRcM41z
	mcwfWo3/HrPEdcg3i/QgSIg7JxlOtxpNe+Tc91mNRM5jPm9oiqYr9Y8fA8GtMtkcejTkYzKYWe/
	dYGgJmTppK7UNz58MBI5w5gAy+tJ4wRn6c+yb8Gey8YaJCwCBzKriJFituBHAwPcrP/qy3OzY9d
	CRZqlY9kZbIYEYHgEXFf0EXSnbbopjb6/ns5Qiete8NaEVyiENPzjgwDbO95J5WqC27k52CGdcP
	MpoPPpdLcB2VcA9uRu8Uax4QiVs=
X-Google-Smtp-Source: AGHT+IF8/pKZFiofGc2vdnroI6kU1uA6M17Tp2EBXvBzzSiVQ9qjT284LMqugB0yUPj9RZoEi3JpUA==
X-Received: by 2002:a05:651c:1a0c:b0:300:956:ccc9 with SMTP id 38308e7fff4ca-3046854bd51mr68762781fa.6.1736105801705;
        Sun, 05 Jan 2025 11:36:41 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:41 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 08/10] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Sun,  5 Jan 2025 20:36:26 +0100
Message-ID: <20250105193628.296350-9-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
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
2.47.1


