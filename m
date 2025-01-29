Return-Path: <linux-input+bounces-9622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A6A225CE
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E8EA1672CF
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728961E47AE;
	Wed, 29 Jan 2025 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7lUwKYr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD081E4106;
	Wed, 29 Jan 2025 21:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186208; cv=none; b=Db2T1LOR7dCAo+Fn1ie6Xg4QGixx6HSRQEvetbxwqWagBtbjCPgc1+NeF/tbdqpFKi2MppeSAOVDBMI+H9mUNgGpZT8y0OLdufYWM1n08D/1x73T3K5iZ6M6CaUAgy7s6t+t3OINGRxqNkBQ43pYMHp94skjnVm0cZr8OW7Tr+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186208; c=relaxed/simple;
	bh=IULvgMh6Gm8M/CBBPKWDj1B7faBtRJpOAACroJbbql0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipGd8pCTRSbvKRfPPj61IRoZA0KEed0YhIUIgYmhTH6ObaWzawVj0eOnxvn1IIRze5lY+jDxmIuQMSe7XehhneghbnJJxDCkTX7exsiKi17wfQo4X8lccCCZIfFevhep2VakvUVCaM/1nNpxQ7+gtJXq2U9sfGpthTFBkk8r9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7lUwKYr; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5402ec870b4so11413e87.2;
        Wed, 29 Jan 2025 13:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186204; x=1738791004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfhlFcKIFUrmRUtlao8lSniPT3M/TUqDE9OlBqCjDY4=;
        b=X7lUwKYrOp768RC943xptintLy78O/iNtwMZ/9DkbbLhF83krlEbPgwqo7470kekWB
         tchhahP8/Ym8nkpi1Mr96tkC44EiacNN1ilnyYlmojvEAketQCpZcuvaYMHylaHQMowb
         V8BwdZaskR2f1EafYINr61UsNz9vsWczYQfpH9mELJqzhNRRBx4k8jBeRC+U1Xrzt+pL
         dsEtKCjSlfsCqhFhVvjKE6jb8xC2qSvR9lDQh3I04SNJDoBgrNNkSRFMUDHa6U9ot7XU
         L/aIvbmQbUMJUaWp+3uKLl31xtiFMezv3T2mJFXB9pQvmsP8Nvu/qNnbtiBKTLZmcK7g
         w4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186204; x=1738791004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfhlFcKIFUrmRUtlao8lSniPT3M/TUqDE9OlBqCjDY4=;
        b=H+kjaVy0JSuu//UREjNXmI1GcNZuyBnaCgQ4SoaDKrx5+24KXzEFRyIHe/tQL5mE7d
         c2c/F+L2JyZbmdZdqSXFsMP9ep8Wobz0FE0vNPUm8nqF8hpboPsltvi/p/U2DCEhqIV7
         ZIwDD6YbqHSpWXXqcq2JJsTD46DK97ZtRmJZYqK64p2+Zuu1mb3/Dm3i979gvkjepKCJ
         7wUxQTlZlI5ragKHQfilEGcr4JCxYYA+SH2is1mUHadHh3w0A0plv3trGXrg66qroDn4
         PU/EhcssNKHMhrhCgGSRJmn12xpZxZqrhMUazLmWjvoJorGqfQ+NXYoxxEhnCUVv3AH8
         xMlw==
X-Forwarded-Encrypted: i=1; AJvYcCUIZQtV/3VA7pUSSJ8uX0pVx2dWHcDLPqlf1HIOSc/mXatoeQ+/ebvHC3qQ2UuiJCu+V64ofQ4br98B@vger.kernel.org, AJvYcCVJMf+nxHBJWQ875gGMkFDYVJwD0h9XsQA4W70su7WDbVxxKgjPyJ4/3NvZjMli5aIMMzzJPy0lyjAYTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc41QIITGmKK7yxPpswWs7mBtBRjbSy8d8u59bHyTX/qulH1HH
	liuX+lz5STM8XKhbhNkGfibkJGqisWw8twmktSqgHlhwPDYWehgJ
X-Gm-Gg: ASbGncuWMiNCyoLs/QNPqx8dkV4nNpWVq/qhIyhvU7AiwXlGE2hZWY0r0BWmRwukNTj
	2zs7LsYSBpmvg+3lSbMp0qRc8ntdz4w6tXRxgv0e++00c/qc8KruIqt25iw2ILG+g9u+QUdsTOV
	KcPDOPN1qDzS1LPtpEJ9eYnrP9TVqXtCDgqPMScyFHVjHG9Nzss1KDbNxwiYkHDuupYvuekpeYN
	WTWOkpmxvqITEOYtj0fLUKtjvnFR5Q9j1Ew4oO9RMf0KdjDNQjHCCvkRKj9C920zlJGglY22Mu7
	w19HBs1E5fPedp3FaLHed8ndv7vGLG3DnxNFM1QU1Zu7WGGdwkUFRp3bFFT/SraMcYUCJXnj
X-Google-Smtp-Source: AGHT+IELECGkCkpU2yn3QycQh6oTwX8hO07ubbe+IaJSV1TCOj5amb1UhBTxmaE7+QGNrBVq2ztwkA==
X-Received: by 2002:a05:6512:3f09:b0:542:1b97:b1d3 with SMTP id 2adb3069b0e04-543ea3d96d8mr79013e87.3.1738186204337;
        Wed, 29 Jan 2025 13:30:04 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:30:03 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 17/21] HID: pidff: Factor out code for setting gain
Date: Wed, 29 Jan 2025 22:29:31 +0100
Message-ID: <20250129212935.780998-18-tomasz.pakula.oficjalny@gmail.com>
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

Makes it possible to easily set gain from inside hid-pidff.c

Changes in v7:
- Check if device gain field exists before setting device gain

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 6fcced6348ec..c518fcdeb6e8 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -539,6 +539,19 @@ static int pidff_needs_set_ramp(struct ff_effect *effect, struct ff_effect *old)
 	       effect->u.ramp.end_level != old->u.ramp.end_level;
 }
 
+/*
+ * Set device gain
+ */
+static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
+{
+	if (!pidff->device_gain[PID_DEVICE_GAIN_FIELD].field)
+		return;
+
+	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
+	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
+			HID_REQ_SET_REPORT);
+}
+
 /*
  * Clear device control report
  */
@@ -865,11 +878,7 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
  */
 static void pidff_set_gain(struct input_dev *dev, u16 gain)
 {
-	struct pidff_device *pidff = dev->ff->private;
-
-	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
-	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
-			HID_REQ_SET_REPORT);
+	pidff_set_gain_report(dev->ff->private, gain);
 }
 
 static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
@@ -1404,12 +1413,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	if (test_bit(FF_GAIN, dev->ffbit)) {
-		pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], 0xffff);
-		hid_hw_request(hid, pidff->reports[PID_DEVICE_GAIN],
-				     HID_REQ_SET_REPORT);
-	}
-
+	pidff_set_gain_report(pidff, 0xffff);
 	error = pidff_check_autocenter(pidff, dev);
 	if (error)
 		goto fail;
-- 
2.48.1


