Return-Path: <linux-input+bounces-9906-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2401A2F14B
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5B73A8A11
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 15:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D7023AE87;
	Mon, 10 Feb 2025 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5wyZbNe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026F8237A4D;
	Mon, 10 Feb 2025 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200685; cv=none; b=NUphkhDwlXAcgO4FSfE5rcGdUE3IN6tSE1l4QFLfXH9vSRdXdz4lJ5KE3amkB3qA9f+CyKVk5hmEM8YKFHMB8/xRaqpPn1uRweRBXNlVtxDoV5c3jqmSWbPe0VLo8mO2H4d88PinSbDxmauHL+jDUb67MOui33oML+CzAAp5ymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200685; c=relaxed/simple;
	bh=/2y14Ruxtxo9MUCrsytA3GtR+RAG31etzZVJXvFwi+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZM/veQ9Sv/KnhGLZTz8/sEM58uacFYeoz7MR3yG8GaszNPZGmwmCeo5UB15LVpFOW9+ggELuk2/Y3OPoME2An+Z697H7Qvi6CMHINLN3X0r7JJIqY4BaOAmRWwOnOOKMi6b8eIbu4D/swjkyWQclSffWv8GPjiL4HgEGOYvc4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5wyZbNe; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5450f0b0a4fso111707e87.3;
        Mon, 10 Feb 2025 07:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200682; x=1739805482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYA8Tb2sEo6J/5zZutdE08BWxw6HJFr40vcYgZhFRPw=;
        b=M5wyZbNebw7qkprVOCPW7Dj3yA243Cdw0rWgQiGi50JE7EggdYwLZenQn23dcHfLty
         XPv3uhd0JMAF5AHS8Dp+Utvj/A2Z5jALmFBPDAEhBM+TjgYpw0HbmtulDxM69esZ1uN1
         vCRp29K8myMG4TtY8H2vBN3bIe1xOrMk3Uz0Aeh3EQoXUTUd/ipWPfXz3F7wpRCXMVWn
         eS8pMSUKBJrm/npIDZfNZeZCxOCJuPn8eJCDU/3Ra9lFxslNVXnhLiQA6xSDC1T592st
         45/nL5ict7lGA+I15uStAxcfPT0SyUKeWz4JN5bnBpLhYgBhriJOy4JDWk3gAMUesfkv
         vZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200682; x=1739805482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYA8Tb2sEo6J/5zZutdE08BWxw6HJFr40vcYgZhFRPw=;
        b=PmU6zc68ZrUmnsuOYLDM38EAxhap2tk43mTPP61EoSna/O3IWRPdgpv2IcOGFS483w
         qRMD+rWQ0tElSzbTdVU0vvioJJL6qYQDS+pXdc1kkIBqsjq2ei3C7m423ImWUOp31Pm8
         ZySgyMoxzqouNRMFS/2gMKp5HjiL1wIyBm5vkmuRLrwTvei18nwgfCfaBWTkpKMnRek8
         aIWUFfXtfrBQG2Su+nbUqV1msgwXFY+eeQx2+XcNf9vGtPDm4+Z0GcU0U3iOi00YZCuu
         T1Dq8APdcsv4vRJthFnA/qO3TyBVxQLH/ro8Z07CYW3PjzZnvMS1qPbQceq7UpR6tdO1
         WHxw==
X-Forwarded-Encrypted: i=1; AJvYcCWMcZrsFioQtYzuKpQ654JL/y8PiAADwurxXSQ4s+N0fUBy6rcG8/H4Y8qloaR8wD+XJw9y/lh8voAl@vger.kernel.org, AJvYcCXrCFTrUNM1hq+3H2nfUefW5zzN29YrAXVC1aBvntWAbiQIB3RQANKsEkcroSdwh4ZlhnzT6DijY4nV9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMH76FEcecU9BWw6tKA15ZEH83L4Wdn58olF3EDcLb54WN1UF
	1hz38Xd8aF1c88U7fcaSNr7O2QaKpX9LNB/x8LpE/oqaN86/wH4a
X-Gm-Gg: ASbGncvJUSwN1d0BsiQBkeTzQFqIrN2q6ER+2hN4huJR2/sxLrlKSzLYuxnOzgXRF+l
	i46C5uKijGD6HLXSQXfKT9gkiPm7/obVqQeGokiNPaRZLKHsmA/xtpAcGTj/XGHyKTPcqiKPluR
	TZXaBzaoULXjYw2SPzm15iutp+X2iP1fwJahAPB8A9NQZGqOslmxJMMTPc5KPXcMfNQwB0pv/ZN
	5iF/lyjR7NZyWomH+xEAP55oIp5NEq1rAIEHkh5DYDx4zXxXzYRe1F4L85TZry0SwoFIFo8yaBS
	yl3ntd5B9yYiKnkPu5iAgSZJztC+wJFjnb03CvKUd2apcj2pQPO3m/iv8jYIJA==
X-Google-Smtp-Source: AGHT+IFJqfxieTOO+SkQ8CW7HPaAqeM7ofR8HtgLCGUsRZ31Kuw6BzawfN1Cly52imV7yrLgyERYzA==
X-Received: by 2002:a05:651c:1503:b0:300:c10:7c33 with SMTP id 38308e7fff4ca-307e5a88818mr22115591fa.7.1739200681896;
        Mon, 10 Feb 2025 07:18:01 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178201sm12090561fa.16.2025.02.10.07.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:18:01 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/6] HID: hid-universal-pidff: Add Asetek wheelbases support
Date: Mon, 10 Feb 2025 16:17:51 +0100
Message-ID: <20250210151754.368530-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds Asetek vendor id and product ids for:
- Invicta
- Forte
- La Prima
- Tony Kanaan

v2:
- Misc spelling fix in driver loaded info

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-ids.h             | 6 ++++++
 drivers/hid/hid-universal-pidff.c | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index dbac05649e9d..860adabbc625 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -189,6 +189,12 @@
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
 
+#define USB_VENDOR_ID_ASETEK			0x2433
+#define USB_DEVICE_ID_ASETEK_INVICTA		0xf300
+#define USB_DEVICE_ID_ASETEK_FORTE		0xf301
+#define USB_DEVICE_ID_ASETEK_LA_PRIMA		0xf303
+#define USB_DEVICE_ID_ASETEK_TONY_KANAAN	0xf306
+
 #define USB_VENDOR_ID_ASUS		0x0486
 #define USB_DEVICE_ID_ASUS_T91MT	0x0185
 #define USB_DEVICE_ID_ASUSTEK_MULTITOUCH_YFO	0x0186
diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 1b713b741d19..69e8edd99682 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -104,7 +104,7 @@ static int universal_pidff_probe(struct hid_device *hdev,
 		goto err;
 	}
 
-	hid_info(hdev, "Universal pidff driver loaded sucesfully!");
+	hid_info(hdev, "Universal pidff driver loaded sucessfully!");
 
 	return 0;
 err:
@@ -179,6 +179,10 @@ static const struct hid_device_id universal_pidff_devices[] = {
 		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_LITE_STAR_GT987_FF),
 		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_INVICTA) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_FORTE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_LA_PRIMA) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_TONY_KANAAN) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
-- 
2.48.1


