Return-Path: <linux-input+bounces-9858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F59A2D7C7
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 18:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C51A7165DDA
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 17:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3051F3BA8;
	Sat,  8 Feb 2025 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQMeB9Iv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712DB1F3B83;
	Sat,  8 Feb 2025 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036199; cv=none; b=VueE1RhWduFfkiqzLBZpb4VD5tXRk/fj/LjBVnmiJBeqVjocoyLX3qeURz44Kb4w0m3a0crbPuoLSnqrPyZ0NBDzWx8RC+VISi3Mv2/J/TO+DmNFzYTz2x6jf5ek/c9yt6MIZwafAX8hX0i+M96lmoBaGMjv1ZI1SY1gAda1kww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036199; c=relaxed/simple;
	bh=wJHdPFVGC+occ2U7UIpRUOC/DEmU7oK5Mm34Op+gOgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJZ1K0OjCmplz9F9SjL0B/cpUjNjjJFnqcGuUGntIk0LPKbtLzWp4Y7UCFashQ0QN9Xd+fYNrBKH46TBLE64vUk4vJFPpBVPXdEKypUYfuLumiSqTa6YWlfKg2thyydFr53sZ6scy83xgSFWV/+Ly10ioyk3YsTK8NPzF0hrjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQMeB9Iv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-545061c740aso21522e87.0;
        Sat, 08 Feb 2025 09:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739036195; x=1739640995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlkH5nMfzqVF8gs4xkGrN3BI5XHhQSrRo6ixfZ5yb9M=;
        b=CQMeB9IvriXg+9oFRzfanhn5Q7LQN7SouSoJhlRKgbfxxK+YJkOpMAwH58hoVXWyrV
         KSuYiJ5lnoGT1HJD284Ip9A4S8yo5UP3z7d35BaG0+s3Ll3SPTRSNHv7wJ306g8PVfkQ
         dQRjMxNe49NHqMq64YcPW27ytuN5PJCDB78ITBouJPQOfJRgRN5jONJGUsQIVwstn/Qu
         6s7SzbWQ/FFFKQ3BiSCDsZXn1AA9NU3qowEiQ8Th3nX9ARRvKJwiIVpRuMm89CdF7n9k
         uW7Xs1KUDeJt6U5HuHo5LbsFRwxMq8QjtGnyceJeyW86rCTw9Roq13xej7S1fu5Lm0Pd
         XLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739036195; x=1739640995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlkH5nMfzqVF8gs4xkGrN3BI5XHhQSrRo6ixfZ5yb9M=;
        b=P3n7utsa6JHoz7DKkt0mh3kckwfl44jeyANsG7+SwmAxiNxXEZ9r/tm3SEtNa8y96v
         ESQ77rcehZjcOMClonK4ZmTucBqKNaSYF3YXjA9S70FV0HdZHAlE5OLss5YPpikRvLHO
         VHWgXFwZ6CJYWv70MXsK8FCAfV8bj+R0psQ2+G1athtpbSS1FV7A2YOEfLcMLXgGXm+3
         FONypMXvpt6UOzDo510ut9cljOWkY2F4kJ90qSMDJxdjBgtqivdbiPccIA/7Oku+EC/b
         L6R2NR4uOM0ODSAoeVgTzf7Jzg/0kGbLujjc/Ekq4HLPMZoyM7pYt3CbIxKaQ7hGvYpD
         9TFg==
X-Forwarded-Encrypted: i=1; AJvYcCW9lTSdrQEL1iy5nk0ZbKojUqCRRw21nd9rPmtPI53hcPsxjQQL1naom5IMrQWMIMh7bbM/J0XCOd6+5A==@vger.kernel.org, AJvYcCWmx0Ong+4XUx5xUb/LDckBB3hh5cAfcp7H1UHuJvaiBFb6YMJGu9fCdYHrrHvg2UjciYpr2TRJOlmS@vger.kernel.org
X-Gm-Message-State: AOJu0YwzPR6M0RMuQnVEYzAX364f8bOfQiNcaZpjb4L3XplVfyVq7Gcb
	K+9Vs/j4DIP9MuZhiOmgWpmKqFPNpBB66PKYFtamF6sBiqOC53Q5/1YgBg==
X-Gm-Gg: ASbGncsXvkPapGafPa/t/8Oz+a2wbiDKM8Amc6no71tMJploPOVI0ZhU22whXT7g7Su
	zH4Zd14LBR25/EyLeVTIvwNsTFTC+KTdTLsqgd66A5o4OusOBv/ZbFJ2PYuD1UXL6rH1XQKvSN1
	XCSndCWQDZC2N3dyQOUZ+5AdQuMWLFmgF92YOhsAWMWnq+jkX0MbRv/R2dEeZ+t9xYxyA2MI0tZ
	68v+piib90UNjSs/V9QLk86k73Jyqp1D/jlx9UDijJamO2WYa4PliqSp7qoBXsLpitdPVCPUFaU
	yzfrjHH4yYvlDVFHVypvPMT72oYKKRa1aD8MEQPIUqRyQl6Lb2alehEBneN4qA==
X-Google-Smtp-Source: AGHT+IFijeM/0DacX9QB4pRuByHqnXgA7GzoztSYcM0PgME90zeEuiiXqrhjiVm+zcpWfXfiFXbw6Q==
X-Received: by 2002:a05:6512:3088:b0:542:98bb:5681 with SMTP id 2adb3069b0e04-54414ab57b6mr950161e87.4.1739036195363;
        Sat, 08 Feb 2025 09:36:35 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm774808e87.3.2025.02.08.09.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 09:36:34 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 3/3] HID: hid-universal-pidff: Add Asetek wheelbases support
Date: Sat,  8 Feb 2025 18:36:28 +0100
Message-ID: <20250208173628.5734-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com>
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

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-ids.h             | 6 ++++++
 drivers/hid/hid-universal-pidff.c | 4 ++++
 2 files changed, 10 insertions(+)

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
index 1b713b741d19..32f1c26f4cf4 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
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


