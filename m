Return-Path: <linux-input+bounces-9952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21454A30D99
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDB0B3A3515
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A1524E4B9;
	Tue, 11 Feb 2025 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4g0L0EJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5E2441A1;
	Tue, 11 Feb 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282588; cv=none; b=aRK8JpPcjbzfR7eLmo1oFwPHMp3NzpP8kiub9Q2NRMu8UtB6ngat2wkp/3DbR8ezZ9suDJXP+uLgyEYXF6izEoM5hckYOVZPw8F/RSkiWy1h5SUK8MPWlVCC9vU6A+j+dlhkEpJ3sD3/qVdZG+0AQ50WVkMswpt8dT+5SDHWg6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282588; c=relaxed/simple;
	bh=63N2CLR+q6W1xHPej8KWz2+AOl28NpDYsKe9GLcAMvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdoKd5Fu34GC2Ne44jjbV0FmcbTojulY7nD48CZoLVYpwJY+/2JHXZHgP/S3mpdkzhJOv7M2sEDVHMTpQ+FHKRb2RuhlRr5yGvSXp9xNxafnu8bOmqedtm4cs3wOuUykAkrNTcJQZXoUVdEM5wyFwq87sTCOpRKmK2WRnFH/hD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4g0L0EJ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5440ff3314aso705670e87.1;
        Tue, 11 Feb 2025 06:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739282584; x=1739887384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kdkw8SKc2jEdMzydhzBcIQXPPdM4NJNLnID5/f9u6lI=;
        b=N4g0L0EJdGDrJ9lnmWvg5ukvE5Eq2E4TZi/8J6qD88oZpAgPMJOwq9n4U/c8SXRKVl
         1aA6kuDuPCqixko1hT5Mn9EsDLtlAPhVMtkh1ihCMTjSvTV0UuvvgkiuwLzuYvzIA3KO
         TbXJM4JvJTo6Ctsaq2Ys12CPC/bq7mIwoGyUjba6Xpy5HR6C+zj6p1/h7vzHO+5AUGqi
         NBkVqk+AxYUm+PRV/vDNQZq2mkLtsirjuIFJKqXzqSRc/MH3Iqbc78Gin896zBGucoSe
         p6Vt4swzEUGfsNEXD0LTIdDeiuLKPPBrBd6JoDaj6f4ae7gzlJns7muosnC7VhkPwwYg
         SyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282584; x=1739887384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kdkw8SKc2jEdMzydhzBcIQXPPdM4NJNLnID5/f9u6lI=;
        b=qgQ2NDg+JfC/Mw21O0EPBugPnDP1bUwkqPblrcsPXfDwXRXN7ZVDgjKkQSVBYaf5z4
         RZQELBzUuaAL8s0GM0U20pYy4tg2AnvHq9f+i7739LuXJoXWUzvs6Cs5mwwiSfpS/baV
         OzSNtlfmdkY+yGLDphxrOXXECDzdEP9m8F6wzgt8v0Qpyaz7GbjpgcviPIVKBnwN6vMr
         5PPNNAKEBXQgo0gHHyM9+I3HTj2Amtj0osyqIjpPhMYVJElqKp3HVjfgOEBHO7TMQDZs
         4o9XXF44WQE58FbT9aWa9xONccJchScQ0izmVw8tRs7cdi563p518ks0cYX56lUcmUm/
         O4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVR136w4AxBwvlxL5guJglSfOkEoqQ1M7/f3oq2BpOWgnhitkjwqjfNLNaIP+G1nUkypjcop4iPHnuc@vger.kernel.org, AJvYcCX9AOxCQjbfUPS8YrmTz/62n0OVf01PHiwctL8nnfHuq1RUEIeYL+qxdPIFHt44L8JXENpuXNC9dl2m2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWh3+5axTSHZEfUS41mSlyP4WTNLv9DlXeb+T2XYHfgNZK/UDV
	q8iVrybDUIDcnOFksvPC82vho4SMgUZXV6avhjSWDcK1nk4E4dWK0pQUkx7V
X-Gm-Gg: ASbGnctdeG1pepiCQZRS/nPdVMgdeg8NbfNHCVp/yPYRxDst96WGgYpJKUG4ctzhJ/s
	T2Q2K0UU11hRBE00Dbk6PTI80up5UxAOwCjfBN6BCSRbLTsP9OrjOOCz5O4H6tEw3439r2Ly/ou
	P1zLmgUJTPlvhCGsKgc4jmZ5Ehd15ayTPDOqxa6TMKXBCAW79Bq2MFgikAcuQNU+dmU3LW2grqL
	jM0GebXgCwX1iqVonqGJ7oRgwDu+SBYjAqnH/txhmk1NpS2vroCUmyohl1ZdAHvZw0VvuDkAy/p
	sLH7s5M0gzOpacJan907bWzkKRA5Z/Sdjvgj2bVmXVUqWKLWCwDC3UEAwJFwzg==
X-Google-Smtp-Source: AGHT+IHH8gH4G6sKyI0ElizdtDU74O3PAcuWsz7olTLvRZO8nglM+XSs4e2xuPCqL20jKFhQQWsu1A==
X-Received: by 2002:ac2:57c2:0:b0:545:fa6:3590 with SMTP id 2adb3069b0e04-54513ad2d75mr237292e87.1.1739282584055;
        Tue, 11 Feb 2025 06:03:04 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545014af0d0sm1118721e87.184.2025.02.11.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:03:02 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 3/6] HID: hid-universal-pidff: Add Asetek wheelbases support
Date: Tue, 11 Feb 2025 15:02:49 +0100
Message-ID: <20250211140252.702104-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
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

v3:
- Chanage Oleg's name order

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-ids.h             |  6 ++++++
 drivers/hid/hid-universal-pidff.c | 10 +++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

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
index 1b713b741d19..5b89ec7b5c26 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -4,7 +4,7 @@
  * hid-pidff wrapper for PID-enabled devices
  * Handles device reports, quirks and extends usable button range
  *
- * Copyright (c) 2024, 2025 Makarenko Oleg
+ * Copyright (c) 2024, 2025 Oleg Makarenko
  * Copyright (c) 2024, 2025 Tomasz Pakuła
  */
 
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
@@ -194,5 +198,5 @@ module_hid_driver(universal_pidff);
 
 MODULE_DESCRIPTION("Universal driver for USB PID Force Feedback devices");
 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Makarenko Oleg <oleg@makarenk.ooo>");
+MODULE_AUTHOR("Oleg Makarenko <oleg@makarenk.ooo>");
 MODULE_AUTHOR("Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>");
-- 
2.48.1


