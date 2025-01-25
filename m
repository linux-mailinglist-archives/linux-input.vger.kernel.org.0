Return-Path: <linux-input+bounces-9552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34EA1C57E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1BF31888247
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB642080E5;
	Sat, 25 Jan 2025 22:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Of9Xzjfo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D56B2080F4;
	Sat, 25 Jan 2025 22:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843955; cv=none; b=S+Dd8T/24kwBpj57pGo0HxzGkixu+AQYz9cybgA/rGc81Jtv/AlBkwIvzY8/jSJxXG8zFl7EfioPOBLOa46JSrGL0xwK+YinTXViauNT4vnFJmV/mvK5q/FVCjTjDRkGTKmQxss0snoTeWRix5sYRm0E7gyLmUIZ88VpompXIj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843955; c=relaxed/simple;
	bh=lokyW7mWWwsidFcyItEG80wDDtCDOSCH2VJ73wHzZow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzCRX/HKB+faBc+dZR2Nj0ivXzYl/AEcJbM4o+gUTjSyYRiYCVSlflNLGoG1KDiitrJD/fPpjPl6BACeZdB7OQGv17FqOEa/7VF+VLYxXqlKFxthdr+Gazucm9W7IhJGYYVYAygMJlB9gzBtsP08Rz1F8VLWPgPSFpchxGyVllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Of9Xzjfo; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab6915fed7bso13027666b.3;
        Sat, 25 Jan 2025 14:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843952; x=1738448752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFgZ4QIuflhn/jvNWM6BMtC4DnnhM2UgXT91NawIeEQ=;
        b=Of9XzjfoW32ao7uegv2R9MZdClzdr4zE+ooZfR3y0rzEHEkSZEuTG/Mt+H6L1JLZ0t
         dIFrgOMlRL1tAb9QWbWUuCM45sFxPNGbPpIXtb+43kr2QFHOofJADn/cmlTiOz1dqb2U
         o5lV2KrqSErkf5bGqt6G0NS11rKCO8AF8T6Wow9REPS9yjKRYuFNctzmi6uOfie3cwv9
         52F5rL9p8//HYtfoIKY2ZtNnCo8CWtIm2Og2UR5roKoOsmBdyZH+C0nA/L+BFhLgNCn3
         S94Vxsz5RRvpBmdoEbElU7s94G4OkfRdVkCSSggf5u8KmNwReyQC/Ci3m+cQhskSeqMj
         +WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843952; x=1738448752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFgZ4QIuflhn/jvNWM6BMtC4DnnhM2UgXT91NawIeEQ=;
        b=hsWhpWwF/2sN4sADvcDGt2WXu1Go6pshqSZ8b/ICuk3Zj+TxzQxral9NmmTJIqFfyL
         RcQ86Z+OOVDQZKIrTe98JgFKNO+2FrOytzH+evuv74ROnWp/V4ChihO0pFbuoSKo9tk7
         jY54TsHdI7SEnSYgDTsimJ8zASCbz12gEGJzlWfZuOII7qj/uYlfOULtHCeCl2vx05W4
         Unots91IxHhON2j22U4A5RrdeZuctVQxouBKKiZfmFlM0R2LCEdW6zTIY0kKdMUNnyPM
         Ts5Bq0JXdtNycHaPB5TbV5Z9z/NR5xTptpnRbs7qCsA8F1qzKHCHd5E9nt9JMvQmaxK3
         xdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV673PvXmBjivu6rrA0ZjARsT+Zvz+uLAKTxU8Baq2JCXASM0e+gT7pHuYmAcz364eBeK3cLjnoY+jg@vger.kernel.org, AJvYcCVJr1ric/yfeH63wdTNanWhb5fFH9uIzSj41Ds46z+xV5/FtuK08hAnXUEAhb+7cJKNdbCmNn1qHrAx+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZ+cjrFUTWGEvEZo+RC9hW61iZk7+Rj2wCGP/m9WoglPUzK4y
	3IEeRyh/o6nsKGUkGvB+ZrW9VIPXgALvANUQr4KZjbu71lcbusca
X-Gm-Gg: ASbGncvQ1CmlzmHrHiPD2uLE2EU01oQKOzVMjZD1C27UJl7hJmlyVSWXuL8SqoJqKRJ
	Puf3XolHcFJIzobhqBc1wW4SPK9LLSKgsxvhSH9VcBj5NcsOeMsAe0dTs3aguxjOJO8vrCiXBVQ
	Hm/BqZli7QbIo6ShQ4zatTEwegczKs/IefqATektbWxEmfNLLJc4WknpH3imU1fXjO1eQ2NTP6/
	WcW8LT17/97bqxqXcohWoWmDjmkiVa62HC7TabPaznSQKTmofF1IvGYpgbrz5VkwcRdHKNoSnEn
	Bh75rPmDsTiumJmxv4AftV4bbQT8qexrFpRh5WipHJso+c+49vc=
X-Google-Smtp-Source: AGHT+IGPt8ptDf2tFiE8DEJJUSz7emZz4RpNu4Cbl2YSY0eXnGAAuNjm3m8XAjmlfm8xb5KbXDkAZw==
X-Received: by 2002:a05:6402:1ec7:b0:5d0:8e70:cf86 with SMTP id 4fb4d7f45d1cf-5db7db19c6amr11982404a12.7.1737843951930;
        Sat, 25 Jan 2025 14:25:51 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:51 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 16/17] HID: pidff: Rescale period value to match device units
Date: Sat, 25 Jan 2025 23:25:29 +0100
Message-ID: <20250125222530.45944-17-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PID devices can use plethora of units for PERIODIC type effect period
while Linux Force Feedback API only supports miliseconds.

Read the exponent of the period field and scale period value accordingly.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 37 ++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 575f24610269..c8a60034d477 100644
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


