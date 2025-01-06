Return-Path: <linux-input+bounces-8970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC26A03224
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B01D3A5579
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47C31E0E0C;
	Mon,  6 Jan 2025 21:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQlftDEE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DB1E0DEB;
	Mon,  6 Jan 2025 21:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199356; cv=none; b=hV1OuA2/FSUIWA3tkLmvqJ0gza+KLHfoFt0UJdFbfDuWHP2pYIYEOtp1RXTIMJkW4CiRHMV8zpq+i2yzOAiDcLVMLXyLgCmlizOSe7mUunAutMQK68fSs1/nxPWiedutcOFsS0fcTD1InZB5K2D34okvW108PdEJuBwRUSY9aMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199356; c=relaxed/simple;
	bh=wInCUfzKfgycExALsayqK3naLt6eLNwTG2gebglTTow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3K+i1EYFpf9FyC165A6BC3UtWJC2b/bWulZTgiXeL596WMPsfX7cF/igS0dOvPYxPAJ/TvH4YlJmF1QwmkPt4th2PLj113mMujYi3C1W94M6sykuWpo1lOyxhG59GX6RGPTH5ARgRNX3exic4i0akOZ5ydb5+G1+245guLsxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQlftDEE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d8753e9e1fso2282062a12.1;
        Mon, 06 Jan 2025 13:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199353; x=1736804153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quUUSX+k9WiW9LhDC88PMv/7wFZpf0XxRnFApYOjSAE=;
        b=PQlftDEEk1Ebj2VSw90ZHW2dCnXM3ljo9m4sJcptVym0/HTTWxYoZPOgxNsTueuG2Q
         Rw3W9kW9BkLIR5wSlcqX5veXBC5/XiwRRceGSE9sPiwhHoczQ8pvNUWqFBrrgOzFoJlL
         e7SCljMV5mqocexPMyFzpUPUyPKHat0UhtO3wWDhcOaJEUHRSTvzez9Cj/hQMgfSGUMA
         5qcS8IrIbg0G7omkpC4bcpxrkJ1Esi8VJklX9jusM5arz+gfyYTKJiyLr7/be21mAmFI
         FfU3t9kKOnuOGIgwpnttv3Eau+74H/7m7S1JKS3srTYp1RIM4hPEhLlKOB8AEa5vu3uy
         tUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199353; x=1736804153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quUUSX+k9WiW9LhDC88PMv/7wFZpf0XxRnFApYOjSAE=;
        b=AVwOxSJivc1oUs53Tun9bCDq7eNVKCTX0229h1ve/mbEml74BmVJlkgx0m5TbqUOkk
         Ze0yUhQhEMmDHVT5KJB1CTw1JtKO33nYht8D41KMzjxlRU6ycsWj3Jj44TMcojNFgN5T
         1Yls/ldkOa59bcyw8i2EoT3So1sEOk4Yhi0YKNFl7MHEs9h8CRohynj4N1B17wDcDy8S
         0gSx0/nsoKMGgKh2HSjB6YPvmD1QOReh9JHz+U1ejyr58K+ucHIvzOq9g/FOw38uqO+H
         Z7Gs8eTBaP/oGaHXjRhKMlxxEHAN4UeCHrJ3gUR5fLyY0DET/hWn2QfCfMQLQBw2yEY4
         HeUw==
X-Forwarded-Encrypted: i=1; AJvYcCWkSl0tGLM7TdylEtIY3IJW0Sw8Nu5/UhhRWYPiycfyxTfQm4GvZxx7ryEBZEwtvpzOF0J//WBC6Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEe7Lf8F0bLCnpmE9ilRx+jbr2AHs2/tgC8TdvEsmS1UOoiIul
	E0uYzN0XEq65HWGFacPznuvYgILaUjFrFWCA1InLFkk+XHuitOxy2muuwRcU
X-Gm-Gg: ASbGncu2qBTFZPAusiuaL3waYKa4wdvy6eTDM0NkotHneL8OlqjQ6zQ/Y/rHIg75odd
	T2idLLvVCyfy9csgxWZZE+Zg0Jeji184dlMxM+vxXO80+eGMhBwnjNGtN+IconSz8/cNoydPkGW
	+Pz0B1yO2M4dchTQ91xRVqjsE1IBOn1twzyG5r8i0D0nHJM/W3mVdNy+O82bPyJxRTKtacw8t/1
	yixZzoaug2AOgsWmG8SpNntDP+DEUce5OPDy8/5mKIEfgzj2fi07WfRCdmHT7LAUSq1lOywJ/aI
	IUqABR6dIPFv+WTO5Qb+pXltTYw=
X-Google-Smtp-Source: AGHT+IFKjQ82BxtjNRZvEvZ14vKBPh5m5qoQTgiMcDT/kmQKDehZ7OhGUe2LXN4v5yMnucD4F6GZnA==
X-Received: by 2002:a05:6402:524b:b0:5d3:d747:6496 with SMTP id 4fb4d7f45d1cf-5d81de2dcccmr19597513a12.10.1736199353267;
        Mon, 06 Jan 2025 13:35:53 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:52 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 08/10] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Mon,  6 Jan 2025 22:35:37 +0100
Message-ID: <20250106213539.77709-9-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
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


