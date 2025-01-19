Return-Path: <linux-input+bounces-9394-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC3A16203
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B2A13A53A0
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3401DF748;
	Sun, 19 Jan 2025 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUjg8cLu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8131DEFFE;
	Sun, 19 Jan 2025 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292459; cv=none; b=KM80tOjr9NLN1cNJG6SmwjEcBPpOJtooJ5JFkVoeef1QynIYazm+q5DojBnz0V3wumRQc9bEelEtdaUqKvqq4Ou2W/P8BpcHd+zTGz2LvH+BoJX+Uob3wEL1UBCh+EReB0WtQDzdsySBUe25BjIe82Kv946y8BkT3w0ffWCIxTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292459; c=relaxed/simple;
	bh=baKIhE3EwBlffiv4Dx06TQfFD02Ta/s4Hjza4/+CU5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8L77Bi7PVqDZ2ZI4paWTUhXah1BC6fYFhxJ3NDMwK3zci6uFP1NXVJRgzb2vsJyvBrSK0MJYZffy4NssoLu1aoJxbSzFcTbttwqBHQaP5DbcqOe5bim3WW12ST8NjS1QMEHMk+XkesxmJVs1rYjoItmSJOn1uoaHkq5SKS/+QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUjg8cLu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa69599b4b0so56165766b.3;
        Sun, 19 Jan 2025 05:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292456; x=1737897256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxPuw0e1s36n/dMAKXeCayCcn+ITRVITseAsXfLW/bc=;
        b=OUjg8cLu0fU7XnPSm7a1g3sqeeV/mEWdDF0FVnOZ70SDtq1ZgcahbOJxr2qGFn6dTw
         aYgb6bNlxzwrzIs81H8BcW4Tc7x9yK/+jWbb583bTxiXvHwc5GK7f/V5WgV5lSXbFNoq
         zwf/gVcRowNOP5ajRsYNeWLvq/w2Cn8+6EBjchoJbKfPM2gCAgDRFrVf5hJQ+i0iJbDG
         OJAWQS3BomH5CRp1Hr0D6uzg9VUq8I5Mu1FRLJvijG0EJJVqCbU1JYCb1OZLA00Z4D3T
         fXeFsYM5D3hM9sgxPmyRKAT4PEgY0UoUnOpdwZbECJ2acasWEAQuY84CYYhVhuYueuUC
         //8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292456; x=1737897256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxPuw0e1s36n/dMAKXeCayCcn+ITRVITseAsXfLW/bc=;
        b=EKEOiix6j24pJxgFWpjT/sB+R/C4tY0oS1wSx2bLr4R7fq4GhxtA8UZ/AZMrPMuK3w
         iZqA1SCUKhMMl2nbqZJxSKZwgzX1B8HAXYG1Km/7DDvpgWEBFm7C2D3t+4Qoio0Mufd2
         X9ronrQLrXTApDhUrJzeTMdh6QN/7mMgXr7S3pvHFco6Gvx83y++9kOEWoUncSgUjbnp
         AwwjcACI1Pd9oZSUIuMbzZKJLyeTVH8QJda6wBNfaETGgUvJk6TfSKa8ZPD95gChOn2S
         +Mm4QbOop24cET8D6i/KfxL2hA7k4Qt9utd3KetCT44e3ItDYI3POcdMAat6lBuyvTlv
         fRTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVktDIX8PfLZxP9eqTs+evYvgISKRL04UMmp8cezOLiE61ASQQ4+oCurc/7cUiqnGCuyr4QekWaESDwVQ==@vger.kernel.org, AJvYcCX/kXTs7y2qEwSwEHk9j3084heNuCng15eMliFaVqFDrAxCk4I+BlmhDVPglQPk6lbeseu31DpCnTU+@vger.kernel.org
X-Gm-Message-State: AOJu0YzXZnqQb94//16UMBz9Ct9io3PvFFs5AEGgyO/REAFk7eZEzVtQ
	eMT6iTevYucewusK2F+IwFlHqFsQpYxgUZAbml+CTh3nVwmgbnnE
X-Gm-Gg: ASbGncuozoGlgCGOgIbZQXH4dIf2enzmcmehJWaJ7mHBzB2iop+YPsDnbtC78oi3DQ4
	D+6PdC6SC/rEe3KKpRIgK7TxaGQ/jzq1Si9mUZoD0OJigP3TdkW9pLRlKa4F2p4HvdeFfRhWbRO
	CiA0oP4khYEB0jANFysVI7UNxl+XokgiqYi+9HTso+OUDNkzRgtvDIC+cLp9PbGoBwOZGrlMRK9
	9YgidabzHe68MHeO1Or6tU3u5q0+ylu5Bw7tLCDGQZyTDGuTDtPuMPi1xgNmZYvLaggOeHJI5OR
	7Ht9Ve7Z1tJxKh/ZeVXJvB2JM3iBoh6HLie0W5q+
X-Google-Smtp-Source: AGHT+IGO2yZVSbp6iVAMIJlriJ2AKiGMQ29nynehDDzivNli5ihEXXyyXWHh0FVbv5Ver1iz6qVkYQ==
X-Received: by 2002:a17:907:2d0e:b0:ab3:8a8a:7fff with SMTP id a640c23a62f3a-ab38b2998b5mr342269366b.6.1737292456056;
        Sun, 19 Jan 2025 05:14:16 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:15 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 12/12] HID: pidff: Add PERIODIC_SINE_ONLY quirk
Date: Sun, 19 Jan 2025 14:13:03 +0100
Message-ID: <20250119131356.1006582-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
---
 drivers/hid/hid-universal-pidff.c | 9 ++++++---
 drivers/hid/usbhid/hid-pidff.c    | 3 +++
 include/linux/hid.h               | 1 +
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 0f81df9a019b..c0f890e21521 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -165,9 +165,12 @@ static const struct hid_device_id universal_pidff_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_JOYSTICK), },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_RUDDER), },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FFBEAST, USB_DEVICE_ID_FFBEAST_WHEEL) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2),
+		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 25ae80f68507..8c4eda67bdb0 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -669,6 +669,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 				return -EINVAL;
 			}
 
+			if (pidff->quirks & HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY)
+				type_id = PID_SINE;
+
 			error = pidff_request_effect_upload(pidff,
 					pidff->type_id[type_id]);
 			if (error)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 5237f9040950..fbc1b6e46e0a 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1234,6 +1234,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL	BIT(2)
 #define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
+#define HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY	BIT(4)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


