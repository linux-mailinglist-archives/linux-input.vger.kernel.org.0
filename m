Return-Path: <linux-input+bounces-9530-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFBA1C37C
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D084C1889B5E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09545209F51;
	Sat, 25 Jan 2025 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiVMmkwJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A30A208988;
	Sat, 25 Jan 2025 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809719; cv=none; b=mIA0ScE/iLrAc0hfJvkOU5IMdt9Kd/ZWydoibmNTipjai0Ua76xFCFNDcVUo0/SYoc8EPGyJEzP2MHb1J0CtXM0oLbei9fU09TS9FZCa5kyABSLhEblVNDohzQGm/7vDB4FnqF2mwDO60+hV+XiWIy5OhiPgHiBfHRO2HME3U04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809719; c=relaxed/simple;
	bh=M+MxB3qVQrAgmeCpTjvIljYDA6fCHx9U8AlzZrJ08kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWo6D0JFxnR4nzHUBgJo3RfuJnzuC2JSPfRRqsAb0J8N9K199YUWfFe/+7lilkRFMJ8uL4FEOMiZBH2gB0Q2L0z4MBfRzuUm6TcI4gpzMI3LA+1TtDy0u3LfcIpPwJfHKKasn1uokUgY93VAkLT3n3FHL3EpvwpZRp34d12jvAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiVMmkwJ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3021ab1f26cso2006841fa.0;
        Sat, 25 Jan 2025 04:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809715; x=1738414515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+r2Q6DSnwHv5omJtGfuLWqdgG8O2MQmmJqll2lu7xA=;
        b=LiVMmkwJr3mpKvSRW42VCVpYyolHPeivR1SCHgR84djkdHGCjiDBO5Vfg+LCna5YFZ
         8aisKoLg5QX+pmbQM3KuDC8WgKLE0l00VQ4c6SZLzqem6Yx8DeQLglZY384aYOkpoT+T
         4glcn0MQ1dCoQ5UlgMfJbAjUGqakwPp/pvhO2dIVwrw7R2fETlPuBqyS5O3OcGv061KA
         ObqFqqdfOwGKOjNvPsdRsQBaKAD+CpOa4YcKyU2K91QknvwyPZrGc1WK4OTSWKLzD1oi
         ZhRnvgu9INQYsQfS5CByCppm5Y13VbLbvHkKVG+1L26kN1WpQTzfpbkuN8+Th3nLCieJ
         YRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809715; x=1738414515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+r2Q6DSnwHv5omJtGfuLWqdgG8O2MQmmJqll2lu7xA=;
        b=BcMqKLsfn6WRAXxRVS64i+ubgZTuA7kiJRtZUHygniSsS8O2bhfM517Vs9gpy8zg/H
         Hsr98c7OBoxCxsskuthIONcv1rQAHFUz1V3pguo8yl2Mzxl5btQsxqixluTLWxZxDk11
         FDGUO9ezaIlz9a+Ct3YNXwEu+BT43rAgahwV4ldXgWEoUUMRcVig5JL8JV6QMAxcs/Pd
         7ofFkk/tmUht3eZs88v0CTDkuWvV6YypcpmyPHrPFYXSQVQC24viNi95H7qiBUHFh4rz
         MkAlrPIRr84i0EkFqb9IWkdlk/9dCXZpnuHfxPT5khsywYEtzbJdD4+aj8Wd8W5d4koo
         kH0w==
X-Forwarded-Encrypted: i=1; AJvYcCWPNzO7n26spMoYyu+qX5N5/E/1WWANL3BrYBZBkk4rF1qPDApGnH7ndE6bKXdtMZtxJViWdh9RN2/Qow==@vger.kernel.org, AJvYcCXshGxBkCm/yBrjYx5+JmMvtAMvCjSljUOGtzOe9XG9I7sb1qyITrXrrZuuCGiSQaZvL1OpwjPw3egc@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVe4K43aUH3yj+q8vJ7AHJn9X/bF3itfaMA2VAB/Bgw8LXjyb
	Khy9PGeWuRAx398U+WT43alEu04xXsPog5rQzpnEAFA9UdW7QOz+
X-Gm-Gg: ASbGncsr/CabAlX7QmdJENmQwKuUVM7zdz9vs9Pw2M0DluUBd+44cUHpYPvx6T280gP
	cdC9EFw1cu+MhStZRuY0HQXmBFellWl/QV1a85VRcICd3Uu97tP8s6aFaLK6xCSrwVHjIFU8Y5K
	Yln+7pjlrQuRXPi+taP7sbOZ/QPNScBESku9VnGkxrYiHcBwawKTJfPGKkyOQEhDxJVbuLLqtUt
	MxhPMmK/CGjq7Qb5qnhbHhs9ENoMQEXitO96+jdFvTlVitNhWfjqxC3lIWnXAViEOXwXrNVFqkb
	dtPz4pCd+LlBDDWFM9E9XeqP8dpUDDX0c+CJQaXsmaUUHDPXKec=
X-Google-Smtp-Source: AGHT+IEtIg8/kWAmHihsS8YLxHAJmOQLrTPWA2wIPIlxwyt6gwqfml7EzfpiHwWzOfsyOyV974Pt/A==
X-Received: by 2002:a2e:b8c7:0:b0:302:40ee:4c33 with SMTP id 38308e7fff4ca-3072ca6a302mr40729471fa.4.1737809715143;
        Sat, 25 Jan 2025 04:55:15 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:55:14 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 16/17] HID: pidff: Rescale period value to match device units
Date: Sat, 25 Jan 2025 13:54:38 +0100
Message-ID: <20250125125439.1428460-17-tomasz.pakula.oficjalny@gmail.com>
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

PID devices can use plethore of units for PERIODIC type effect period
while Linux Force Feedback API only supports miliseconds.

Read the exponent of the period field and scale period value accordingly.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 37 ++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index c5bd4ca71e93..5ada097c967a 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -22,6 +22,9 @@
 #define	PID_EFFECTS_MAX		64
 #define	PID_INFINITE		0xffff
 
+/* Linux Force Feedback API only supports miliseconds as period unit */
+#define FF_PERIOD_EXPONENT	-3
+
 /* Report usage table used to put reports into an array */
 
 #define PID_SET_EFFECT		0
@@ -231,6 +234,24 @@ static int pidff_rescale_signed(int i, struct hid_field *field)
 	    field->logical_minimum / -0x8000;
 }
 
+/*
+ * Scale period value to device's units from Linux default (ms)
+ */
+static s32 pidff_rescale_period(u16 period, struct hid_field *field)
+{
+	s32 scaled_period = period;
+	int exponent = field->unit_exponent;
+	pr_debug("period exponent: %d\n", exponent);
+
+	for (;exponent < FF_PERIOD_EXPONENT; exponent++)
+		scaled_period *= 10;
+	for (;exponent > FF_PERIOD_EXPONENT; exponent--)
+		scaled_period /= 10;
+
+	pr_debug("period calculated from %d to %d\n", period, scaled_period);
+	return scaled_period;
+}
+
 static void pidff_set(struct pidff_usage *usage, u16 value)
 {
 	usage->value[0] = pidff_rescale(value, 0xffff, usage->field);
@@ -252,6 +273,14 @@ static void pidff_set_signed(struct pidff_usage *usage, s16 value)
 	pr_debug("calculated from %d to %d\n", value, usage->value[0]);
 }
 
+static void pidff_set_period(struct pidff_usage *usage, u16 period)
+{
+	s32 modified_period;
+	modified_period = pidff_rescale_period(period, usage->field);
+	modified_period = pidff_clamp(modified_period, usage->field);
+	usage->value[0] = modified_period;
+}
+
 /*
  * Send envelope report to the device
  */
@@ -392,15 +421,11 @@ static void pidff_set_periodic_report(struct pidff_device *pidff,
 	pidff_set_signed(&pidff->set_periodic[PID_OFFSET],
 			 effect->u.periodic.offset);
 	pidff_set(&pidff->set_periodic[PID_PHASE], effect->u.periodic.phase);
-
-	/* Clamp period to ensure the device can play the effect */
-	pidff->set_periodic[PID_PERIOD].value[0] =
-		pidff_clamp(effect->u.periodic.period,
-			pidff->set_periodic[PID_PERIOD].field);
+	pidff_set_period(&pidff->set_periodic[PID_PERIOD],
+			 effect->u.periodic.period);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_PERIODIC],
 			HID_REQ_SET_REPORT);
-
 }
 
 /*
-- 
2.48.1


