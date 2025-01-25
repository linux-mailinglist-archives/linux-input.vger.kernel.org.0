Return-Path: <linux-input+bounces-9548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26BA1C576
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A7591888176
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1271A207A0F;
	Sat, 25 Jan 2025 22:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvbMkS2R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFF207A23;
	Sat, 25 Jan 2025 22:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843951; cv=none; b=DtbvIrXTCnbo9SMLM3Fyc0utl1npEYI3UZR5DDf+5MDUuLgdqGWnJUO48fJPwag1WWhVHtJ2R6wv9etDLyM6xyYqn5oR7G2t7mdsSbsEZo6kJt/68A9FeT0PjBJtyBpGPiuexngiNBMr8OuOtM0Hta+adhiySXNDMGv/9BF3Uzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843951; c=relaxed/simple;
	bh=ZaZAk1C2xIJCkzjhRvpDAUxa7JWqiqQUSb6ApMEF6n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s1s3OhO3NNUImJzcMzoGqIhgxfv65zBGRvj97IWNREiARqj7Hmii0Na79hKIYy2M5qA+8lKyiMUGF2OFufkmdfCQ7kpLKpbg31bPLbPIw/TK1xMaIulBp2YOS2o1i1x2kjtgpQpRwZhXxfOKaLdCR9Pwh3FRC8F9ACxy1I2CIvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvbMkS2R; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab69712eaffso8521566b.3;
        Sat, 25 Jan 2025 14:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843947; x=1738448747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T39P56OhkmFQzv19vK4YQ7IqiF3JTzwVZZZdGJECCxI=;
        b=DvbMkS2RtSorz8mtU8/va+wJRxUS7UsJJib93/72dS2nas1MTraefTFW+vqt5T+Sfn
         CvX4pGCyYsZLJ9m7kkPsGCz6FiFuOjf7qpNKKrecvDf7140fEzieOzsB8HUtGiNvXOHM
         Iwe3slCp5swmtaa4m+jS19cvI9aWf779bPSZ3aRkQceCrrx0B0KnNBF3iVVhiSXmDk3I
         iIo3aLKCbGcLEvoTYyO4bqhupOaSW+DmSXtOs2zLH/TACjmYSwWmBMpzFVlE/a+Ob9jQ
         mq/axRCKv34j602BRIodXZb1CDYKULEKjf7xpei0aauvXWlbgbCLKLw0l8a/3sSTG6zD
         +XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843947; x=1738448747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T39P56OhkmFQzv19vK4YQ7IqiF3JTzwVZZZdGJECCxI=;
        b=jWkaQZXTYCG7Vp8i5Vet+F7WHxLpf3krG8Akl54ct2ujIfBvMMtULMLgb99kUBeG+k
         Z03Q/orWM6Ex3sfL0h/PuzKZkCI9ugugZWnjtO/5nDHuxuFDTjxOIi8P/K5r5WrFE8P3
         zrZ01HG/4ovn9SE6woc2rklT8j7GTBrXgTJcEgVGap7CDguk2ez1CJAGu57tOQRx8MhW
         ATEp7pypUpMt0yoi2m8ClD0ltZrE8hWRA31rsoewNmfL5+n4EiZufRxrj8giWsKn8Msg
         M1Tw/pGZqv62L6zBOumXJQY3tpqvUzmb4CRtgtACr7J+DaMZqc7Ha1pytTy+9uD+N7R5
         wb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYm/uK8gpphb3opceujWABI21z5/Qt1PZZvYyMnkpfa6o70zWcD0iD8hRmKqBKcNB85Vz4yv/s85JAOg==@vger.kernel.org, AJvYcCW3FG/03VNBsDJhU3ip5QyZ4pqAD3ifhvVr6e9Ql40IlzsXjPcNMvEzG6ZQKjXO2BWDMysN14GhBQjy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcf55Xg+jOvNzYOygKtPPNTWcMva3jqjq8JRFTVNMT4UP8Q92o
	C+Mzy841dLG1t/fTYR5VXu9Dkac6hpNtb4ukgGg2VgVQ6kYR4BYh
X-Gm-Gg: ASbGncvA3WW321YcFuJw5c9DDQ/yuA7aFJmH8rqC81keYCAkIefE7zPsFEvysqnYTY0
	S40tYH98ifTubE4OmTdnq5Jz3moC5/InMuHT6T9jW/ok/rgO2iRZEONsT+9JA/9iW0icjlhk/I0
	EmClOe1TtSbPA6ZfQ+llDj3/v66zWIaq8RqZxhjVz+7UWSlMRehZ05Ay3Dm8IfDFkFPXU82ThPV
	Iwi6zPTCqN9B/5E973CnsZWWHDiZfTEZam+5xGapSpsYITxtuI3p1Q/Q9kYs3hhsoAa4QfVHXfG
	Ts0x5hL2jGoHpaUXg0GGh6MSIoWOdyU85mARJdqg0kbFVD77Wro=
X-Google-Smtp-Source: AGHT+IH8VYcTj1pf2OBwdw+KZKoDrj2QiaBQVOAzaX2BuK7bCTlwyUB4k8UPxuhaeba9ee9PwfRIjA==
X-Received: by 2002:a17:907:3e0d:b0:aac:619:6411 with SMTP id a640c23a62f3a-ab65167653cmr618345466b.11.1737843947411;
        Sat, 25 Jan 2025 14:25:47 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:47 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 12/17] HID: pidff: Add PERIODIC_SINE_ONLY quirk
Date: Sat, 25 Jan 2025 23:25:25 +0100
Message-ID: <20250125222530.45944-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some devices only support SINE periodic effect although they advertise
support for all PERIODIC effect in their HID descriptor. Some just do
nothing when trying to play such an effect (upload goes fine), some express
undefined behavior like turning to one side.

This quirk forces all the periodic effects to be uploaded as SINE. This is
acceptable as all these effects are similar in nature and are mostly used as
rumble. SINE is the most popular with others seldom used (especially SAW_UP
and SAW_DOWN).

Fixes periodic effects for PXN and LITE STAR wheels

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-universal-pidff.c | 15 ++++++++++-----
 drivers/hid/usbhid/hid-pidff.c    |  3 +++
 include/linux/hid.h               |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 55aad2e4ac1b..7ef5ab9146b1 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -168,11 +168,16 @@ static const struct hid_device_id universal_pidff_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_JOYSTICK), },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_RUDDER), },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_WHEEL) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V10) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_LITE_STAR_GT987_FF) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V10),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_LITE_STAR_GT987_FF),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index c125f029b6d6..e6224e797dc6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -651,6 +651,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 				return -EINVAL;
 			}
 
+			if (pidff->quirks & HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY)
+				type_id = PID_SINE;
+
 			error = pidff_request_effect_upload(pidff,
 					pidff->type_id[type_id]);
 			if (error)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 856bed149246..c6beb01ab00c 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1234,6 +1234,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
 #define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
+#define HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY	BIT(4)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


