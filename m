Return-Path: <linux-input+bounces-9526-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8906A1C379
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B99697A4632
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0BE20897E;
	Sat, 25 Jan 2025 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHoo0cVA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D0209F32;
	Sat, 25 Jan 2025 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809705; cv=none; b=SbGJ9gymr40syx4/Y649YSJRaPYFKZfS7xleVOnYEpGiiL1Xa79PMbcL4QVlywnDSIQRDjP2Ln7htm8jCtPRe3QGl0BlW1JZRtZsU2er3djZ64WeXYvcY/nAp/XcCr5L8mx6UN3mtSSyeQNs7DPdY4MHa+58YyWh4rUx7Jg7TRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809705; c=relaxed/simple;
	bh=ZaZAk1C2xIJCkzjhRvpDAUxa7JWqiqQUSb6ApMEF6n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=avC9HAN/wfKOVvWFGoN5pW9iDBFpn5NVViQWlEHl2VyJLf8AfSl4E64gURzNCsLo/rp1ye5ulwQ4SiYN+5F96UuG+YygZa2lhNKFmF5lQwCuHaevrOsDLR2tDK3K06ags/MJV0WzdSV7VuSdSlikdny6P0O6BlyC9yQT43hXZsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHoo0cVA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54019dfd772so413301e87.0;
        Sat, 25 Jan 2025 04:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809702; x=1738414502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T39P56OhkmFQzv19vK4YQ7IqiF3JTzwVZZZdGJECCxI=;
        b=QHoo0cVAEAo3QXIpOI4FgoD4BVLpfQSHIcY78nwQ1Q3dtuEopdEWqNSVEx9Sf/rDjl
         7VZuM2BQrZaifJBC6KVydKWj5L2um2eknQS/4wwjytaoVgRc7qIl2ndvCVMWX3zMEeFq
         5OxIW4Xmuq8bL19FJy9XlENg8fp1EfiWWD+Mla9ZX3pPxRiu8Xzz/CqQPC1lF2GL2oho
         j7oHpNJLkIEcqhx5r52V7gRBYZxmWHtEbQfSZYE8XA8YkHoGcvIlvMPHfH6JYywvowhP
         A3KVA8O/vqQtfCYvIbge51+uCb3U8n1XiiAZVU/FjyGUx9R6ZF8fjiEZBxMo098xfnDe
         E5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809702; x=1738414502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T39P56OhkmFQzv19vK4YQ7IqiF3JTzwVZZZdGJECCxI=;
        b=uCN3whVKCAv8jSIHdTWPWJkSqoQIMMgoqP+F5GtercQCb81AcYAijtnSAXQCZ6EHcD
         tr5CBt0OpP84IeL0oYitxA9OPHj1uJ/SVfBtRNFQXLkgaeo3w0GV75pzmvlXpWT934x4
         M7rLTl2nQWCL3SM/I4iqKVq1Q14ON/5/FtqzPMdxKW3G9wZJagLB3glBHx7/JRSfBlYF
         UmPxZFhOyQQlD88Nz5xtoj2itMcZLZeDue9VXJJHYkRdFzfA2zL9asCAO8IdAMMwRo5m
         42Ry9bEENWe7dE8eKGmUCcJA4f4MpQ1rUQOTZM+FaPAjSIoMphM9HGTG8OY4eFXu1l+k
         RNQw==
X-Forwarded-Encrypted: i=1; AJvYcCUPTa2+LXmN4V/AJBS+4LI+wIoN33pPz49w51ZPsQeH4taeBqE50QOSMeTBcCrIRzWIW4/6V5K5bp6X@vger.kernel.org, AJvYcCUpUg8ZDIad/Jp2lWnAnIJBei3zC6R/ZXx+by/6iYW0kyFgAxT6a/kM6NOxymB4sZNR/95W2XfUW8Eqgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXsTnBavxTXNAjXwKjrpvqund2557Tm9Em+rm1+pDwdK6WihH
	RDzNKIvEnEHI8WXBf4BWLimjEDgOmpMwkH+aowx0BnehkQGE5YN2JcyHpSOz
X-Gm-Gg: ASbGncsbC6iTRLV1oASY7td0jDQVcJBXwU0SikeYDwEDSoxIeP/gJy1+aVSoQVClMmL
	JTC9zgZWhoBmHpxxGEko91UIhDxKMeqb/7w5hcwetdrNn6c6wt0IskyvdeqCXaBbMeZp6e+P8sJ
	6nE4uG3Bl0yliNOPIsaF/dbhlC889mJRuOTaeFZegA6HYkKWOaSjgZQ6Gxj22GTJ0CBW1ZeQtO+
	6ArE9gpAvqNkXQQ8A5wvOVG1JWLh3EkiGpH38xTOaJIL3AUKijG3mUuWIPEn4MJf5bA3DWXC8dF
	g09/w0tZVRU/PfjhEes6W4BRB3L4uz8hD9br/CP87If6B/+tYS8=
X-Google-Smtp-Source: AGHT+IEgkhOD2Xx3fZ1qTdMkIWEJq6Q4wt1N9nNomMHOampjkDBHk8pJqFHCQU++cYQLdfHj8qoJ9A==
X-Received: by 2002:a05:651c:541:b0:302:17e7:e17f with SMTP id 38308e7fff4ca-3072ca50a6emr44313211fa.1.1737809701694;
        Sat, 25 Jan 2025 04:55:01 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:55:01 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 12/17] HID: pidff: Add PERIODIC_SINE_ONLY quirk
Date: Sat, 25 Jan 2025 13:54:34 +0100
Message-ID: <20250125125439.1428460-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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


