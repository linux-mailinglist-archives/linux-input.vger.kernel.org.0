Return-Path: <linux-input+bounces-9617-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25012A225C3
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 885D1188724B
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B3B1E3DFD;
	Wed, 29 Jan 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo9mLp12"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62AC1E7C2B;
	Wed, 29 Jan 2025 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186200; cv=none; b=pq/gyXHf/mLPPLCdGNwNHDIDLqBnHzi74gAUZcYBQuyhK23szcy3REinAtk/+7QC6dbyeWboF8ezgT8f4vedB0VUQFmRtoOLetS1QwB4zVbpHDM3EbJJPuaTeBfY7RGXPAFHFJqS7VUjL3qjnFcjfZhCpn5vi31utm0FGwmeMPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186200; c=relaxed/simple;
	bh=9Q25NIzuPD0ig/N8J2u5lpFKU0G93VvMuwTQCo0E/uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GipRkDp5VZaSTa6yDRNZyGF5ifzTlceXeRhtxrrCNI9Vy7w57HoDdfhfKc5NzC9ji9QW2gRPfbriWowsTBNHdmk2bV6MJaC3dbLcviUCQKFTUEYGzTA+AYYUT73CFesa3Dqd0ZQKfaHGL4o0WY7Q7ylQRbUd1vajoIRB0V0ygb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo9mLp12; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e384d00f4so17551e87.1;
        Wed, 29 Jan 2025 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186197; x=1738790997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81cdqFwXczLSBH4WMbPAIDCAYZcX/FsbCRIZWhq2ojs=;
        b=Bo9mLp127j8qpvvqFht9wPwYAWSoS2zO7EbEGTi+748OrbIKsCZLyRK8pGou9hL6FK
         ku/SN00/B72OJyj9dvMj/vvSRgltNeiISBSmMwYC/w4BzY5Zwkx8mUrfDeRu/+HBLpD5
         BVRmmK/iT+Drp7QuD7NKhHL1/dt4Rq7o0QQe/6i8U7a1LWURC2MbzG6bOriaKf3Q4oF/
         DfywG3JBXsyJfSuYm8TP4bApINb5khH85QbvueNSEAKsIXmYKGAI8A8s8EedefMKwoxZ
         iuyl7xLOwm9HIN0/IrGGDCkiP1iTplny5KN5osmSz7zSGcrHGCjXfda6ZuSnabVnO/tI
         wO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186197; x=1738790997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81cdqFwXczLSBH4WMbPAIDCAYZcX/FsbCRIZWhq2ojs=;
        b=NNXQ+Hc46Uf3lCbn6fdTqNCwWFpK27G8QVVE6avFXywOOL6qrUeZVo9EOpS7/ZeWMI
         9252Z2HbLsoUPl0iTEMPkw2a5Ut0S4SJub9H4nFAXiLNL2xs4Z4EcDKI9I2VpITgES6T
         eUX8LZzjDcVSBntc4SYkRrRRDoySzIxurp2xqFmXsmoBvLqRIhC4QxK9PlSZgBJEoDF2
         eJHALyUfkaqCmphkDk2NRO/KjzNs5/dVKX2CG0jOiiyvsqwDu89+AghOjaQqdE+iZpYX
         /4Q5KFgoZjPM626P3n8lVhXonRUWuIy6SQuRGrwiScudMUArWMb4U/X8GBi/B92YCxF6
         j41A==
X-Forwarded-Encrypted: i=1; AJvYcCUr6Jyum5KKivCY8+iRkzlqrIkbHrhfDK6blMj9t5Zvkr4wH3abLJI2hiKnhRpCCSvLSq2BYhJIUtrF@vger.kernel.org, AJvYcCVG18EMNIaE4RGNHBjm5WP5PvtxpTqpx6HmIDL7uUdKYifbd4/2Gh/apbjLmTFmoNuqaEExPUjJ9Z8DSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwirU8/GK2jcAghQt7rydC8PeWVL44F2w7Lh8O65LP1H71VdEDc
	tgnEhEl0xXHo+5bemkanxH9zyR8Mz7QHaKaNmraFTRpwd/GaeOt2OhI9p/Mr
X-Gm-Gg: ASbGncvydQa0mbYHWt9+VOcjcoczbAAw6RVvEilq6tlok54fXYlTeg2g+J9+qq3whU8
	I6HhnNgnNo3ELEfm0MP8Bt8IZJarV/KkilGzXWzq6lGDzP/QgClJQwhSBH4gatpiHVShhnk+Gv3
	iOsZUp5+viw2KkEu+9YYDZAwalW8/cHE/FGJeFzz67CmHjEi354z9uCUWUWTRrPnZCyg47FMEfS
	IRUqJK0W8cPJK5ElKdtbRxjZKRS7Jk6Lt/2R7G2WX8PLdJwiBg2GGoGWN0c7VvVf7OkkeQ+nRv6
	gOfF7YtpukcbzgDcy90+mEJTUNEGaGGKRTeJCLYc9quZRdnvkkrbDIWBiajA9A==
X-Google-Smtp-Source: AGHT+IEOqeBiEIfnqBDNO1KQ8OUDD+kvqLUFwCYvH57T7FWC15WOi9uo4YAarmGQMwrTDI8rh5ooCA==
X-Received: by 2002:a05:6512:128e:b0:540:2339:376e with SMTP id 2adb3069b0e04-543e4c2e9bamr614779e87.8.1738186196668;
        Wed, 29 Jan 2025 13:29:56 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:56 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 12/21] HID: pidff: Add PERIODIC_SINE_ONLY quirk
Date: Wed, 29 Jan 2025 22:29:26 +0100
Message-ID: <20250129212935.780998-13-tomasz.pakula.oficjalny@gmail.com>
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
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
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


