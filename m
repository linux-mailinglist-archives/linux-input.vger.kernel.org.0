Return-Path: <linux-input+bounces-9654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB52A248A9
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 542233A8537
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9714D1A0BD7;
	Sat,  1 Feb 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYevY0jg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19131A4F0A;
	Sat,  1 Feb 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409966; cv=none; b=qaYrGxHeYcXTVW1RpwC9arUf4zHtwxCwhDml3OFKEqUHN3CwDA6xLQU2m3oiRXrsPmoOynQAuRFiD/25KeGALvl70hbWVuq7IVK5kRhptFntnZMw7PPaF6UuIQCOLWTs+QCbGv/RXF96esUlaMVx6agKnRuTN1r32qfR7IekIJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409966; c=relaxed/simple;
	bh=8n2ijgu0lJdc/S8UqYY3kQNAGwdA7IE2ECei8RRfJnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CFwwtL1nZg5axbxwkOWuuGSy/IEq8/n162reAEm3qd0XkCc24lpO1Q8Y52It5O2oPR97/I8y8xjijtLCWUlVz4PgVS033yQG3c+cTJr4F7/L5eCgH0y5VQeUd35PfqX6UHZw7FpWnKar+O9AEaKfN3a8u+v9EWkETgwgw5iG9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYevY0jg; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so435382a12.1;
        Sat, 01 Feb 2025 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409963; x=1739014763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2Z67RRzMMPveRgarwir0G5V0TGDQoDLTBNY2xeRHsI=;
        b=IYevY0jgs7d1e8Kp1aZcc/o+aLSvDBEZ5ws3TGzv28rSxCNbUczb//D/VxDeIoI18m
         k86u9awOp4FS6YsMeNHCEeAXvx6q1622k8QbwIzP42wx2+T+D9lXVmxlYwXTQN6RikeO
         VXAeb7meFVj/mjy8HeV5a6w4AMQXvB7GXE1iX2RQsAH2CAlQz5/eaYGwiWkTfgx8T7zW
         PbBsGSWMjwvGeRovCic0m1+AhEWORoYArAHjsZFNAmbvp7udS6SrH6RrjNXLQnqbXgSf
         I5/7bcbQsbuX2TlNejAonglGraDx2KRCSQZUvRMr7h/VmSSvMk3sU5vC6bYk8eMtTU65
         fwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409963; x=1739014763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2Z67RRzMMPveRgarwir0G5V0TGDQoDLTBNY2xeRHsI=;
        b=llOeGWs84ETHWhFNm+UGnZeWJUzqf2mQJebd2gARd4fpAvo5upMaZDmo1i7SQUGroV
         BXTnlLIjSH+K372pM6NYX/fAXeM0xHe2wihN6FIlCJcxyMTpfsutzg/WrEZvddNdaz3s
         T+wl+VzaNYUx7iu5lm8zVoRHR5+iRLOMb+eyI1e/Y+kWc3DW2OXTdA79lc6cemktYpw5
         0ui20Xaa1fu30XBAoTm3NL/9gNbtnkzwNrAhLV2LNSJvmvyk8lRfJYOXNJnvrB0mcEKR
         7503FGhDJr+o6VlHRCej+m7xNsdj4Wx4VMRRcIbDvepVbXLH9xaTwiFpdUtmZQqMYUIq
         5awA==
X-Forwarded-Encrypted: i=1; AJvYcCUfSd/+z666URI2gbtz5Slk9lhwsBuMwMG1mjIvzWTaszhdKOkI2v7Qq7R8xQnkK2JCIjjV/T0N4AuH@vger.kernel.org, AJvYcCVl33grZhmufp26EXGiwUsZ8j8F38HBQ5yS1bVd+flQz1IHN+s2sbKQPnOn5gBhcBv5RFhLLJdrfgUrew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFSvgLLhUL4Y8MVlvHdpqbQqvt7zqKt+w3f2UpYPcawpnpyxx
	zYInSXNrIFlwYrMdf0ObvINtaEnX8XXhCS+hcoj4gVAN7+G4kiWc
X-Gm-Gg: ASbGncs+zn6rYCw/MVoThnIem0CTj6aDVu1bVgbP/BoSjMOdVnYAXDq3sYrANTtsl1k
	BTCyoL6KOyGPFrg3+CbBnx5oxSjt/ctJjNyYJFa4wBAZgb6uZ6E9ZBEVSv0/I8fCok8Ejhhk2Zw
	hk9IxQl5vYOGzQ9/XOhPWGJdKcA9keVUMPVYQCRIAKCVO/F61C5Uu7TlOIUVMIp2gDQQrLm+CnH
	Q3OIlA4DtAQzG/hQB6BSk4mTth6ODHPksFs0avPPTOaulvH83khTIVvUTTyxcdvz7upitWsQgsk
	5tZrGFKsB7OCdhDPyW/oM2xFmaoG9tHEaUARMhocLueWjs2CC+Hpk7Wl27ptBA==
X-Google-Smtp-Source: AGHT+IFzhk1FGyzImJNfG2S9R2Hvf/i+naqIB5r7QstTKKHnbvq+xu3kQiezsurQa+g00sBRg0Y0mQ==
X-Received: by 2002:a05:6402:234b:b0:5d3:d4cf:feba with SMTP id 4fb4d7f45d1cf-5dc5effcc18mr5547431a12.7.1738409962914;
        Sat, 01 Feb 2025 03:39:22 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:22 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 12/22] HID: pidff: Add PERIODIC_SINE_ONLY quirk
Date: Sat,  1 Feb 2025 12:38:56 +0100
Message-ID: <20250201113906.769162-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
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
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
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


