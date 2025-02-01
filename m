Return-Path: <linux-input+bounces-9663-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 641ACA248BB
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0150164FB8
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0846F1ADC8D;
	Sat,  1 Feb 2025 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/0gXXGb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8711B5EB5;
	Sat,  1 Feb 2025 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409977; cv=none; b=ExJ+Zepfc6pyGDntGSV6vPMtIq4R3s1vxjVMjqR0hcaysFtwIgw+E5I/yVJG60oVXtiM+JEPVdG6K5PJdEylte9sa/wj6ZKpQeDB8WpxNs6SavJYvMnGjgd9wWJprtJEHIulKSpLkBe2hxy9qbAgXSLb4vOoZE9TNPXFM0fvXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409977; c=relaxed/simple;
	bh=jxI7+sL1z0nRc81bF8M/k+iyuwuBbkHvE5ruUynGjPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bbqe+tzaS9UDLqgB+JahBhnnKZvk8mZ52Tp/T4l4oxF9xx1lt/XTHATfINYPhkXmdKv3qzuTeyZ4F8e8VhQeED1Lmn1qxfgfuUgiTaEpGBwNyw+HMHem849PiY86R6kxzLg8mfFfqC1wQUpRd2FCAv5ZpxzZN2WKLItdWMvDtQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/0gXXGb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dbf5fb2c39so468943a12.2;
        Sat, 01 Feb 2025 03:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409974; x=1739014774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkyGAw6tUtCsf39r3rsE7AYFmi/exsjVFsy6CepgpTo=;
        b=W/0gXXGbM23jxRspuoB23LL6lx6b1boTmvrveqD8FiiJI9hlkI2A6SnsVbqp1OqCPs
         j0TbPfXMp1OVmnN4MQO8ohVdkVo0ibRtaAq/Y7BiUi5iVGhVITVEF2JN5DgKeC0pKPCj
         odus1ciIf5+O/idoSGYhYA6UCFInp1fVrFtp/y8pWIJ1tVCtTCm75yUrAgT7q5u+2yaF
         25x+B/Ee37iHvne7FbiGh5MwcJ/4RNcfvO3GM406JgBFjMSbma+YjDWesoi7DsBBcn1K
         ejHGKuXXaBAekH85gspnYYT5R9uPcTHpo65Urujzfmefvq+TCJcCYF+4RFtZH22xXm/A
         xgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409974; x=1739014774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkyGAw6tUtCsf39r3rsE7AYFmi/exsjVFsy6CepgpTo=;
        b=na+jVXAGB7wNTai6LnCoScUsPHlxVFjfswKOR9lvrmBF73toRbTUl/aA8aFxfXETZ0
         tA4ReE0uulTKpzD+bfFtuKbUbvY90RFfeOHI/KXjVS5BsCo6/zMyt9AXbwEk5okY4d+T
         GpVYXn5cgkzP+5QFfUGCdARMuWc+uF0WdfnNM0bWL78FEzzJ+nlP+6KUNzwHVj1iIS2a
         Nvp8mpIPcFy2LqFCEb5UvaE8uswsmN5tv4PZ9mBivq66YBFhneUQ8sNge7w7uZpdnRtZ
         54aXnrvJkEaiVe//RbFjv1P0WjagP7sEqUwJnlqnLwj/1ceLRTtyrw6XUuP6i+N96t01
         J09g==
X-Forwarded-Encrypted: i=1; AJvYcCV2ktDXogy01/1PYk2vD2GfUkuxYn3B0as6OvW8a5VP7E8XKYXptKj0k1UTGU4k2gVCzg89JbXlnADz@vger.kernel.org, AJvYcCWXNVd3jEpMtX/hRcPljs++Bb+MGqxyYnt1i0/uiQ6iObvZRKusmhFVnnA7+D2bHwrs5+F/L7X960ImWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc8sywep7z2xoRosR02XpdM06MyHzNZEAAoPwPiG9wE3/iDpGG
	8VBYrzmelx2NSlMHnfeBb2QPXW+fXbjcOVlOto1aO+x7bZc6YJAb
X-Gm-Gg: ASbGncu5EJq/DVJyE0oTyD41HruP4TyD3Z4Ry6LTLs9VnyI6Vb/w4n1XajFHN5gswOj
	QIexkGekVj/AQEXF981e6FXx/jcVFQdDwZpOAHaG/IPt99XV8tNP9KCg07l29XxVukun1lEV52d
	MzsUnODa0QxPubyVJ55AkhANoas1Owi+GPhwXJOxe8vZfadHwRSYW+E96E2m3LJlKl7TyFyeKSv
	+XE+ADmqssJpzOIthDyHZxAbeUzrWx6JeGSqezHtzV3wWANZtkyufCFruhR3jW9kh6ou3FqM1YW
	0WzpeI+KgxSGk8f0qY6hIQNNXkU6s5GQNWcg60HGSZMZP7lUZR+cT8YcpJhmOA==
X-Google-Smtp-Source: AGHT+IGC7NZdQ5FCwhhoiLce541Jh+GqOLp4NZVx47LeKCmnkAVKWnTtlu+ciCYcRGlPtVYpsyHr5A==
X-Received: by 2002:a05:6402:42d6:b0:5d0:8e70:cf86 with SMTP id 4fb4d7f45d1cf-5dc5f01a03dmr6074722a12.7.1738409974310;
        Sat, 01 Feb 2025 03:39:34 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 21/22] HID: pidff: Use macros instead of hardcoded min/max values for shorts
Date: Sat,  1 Feb 2025 12:39:05 +0100
Message-ID: <20250201113906.769162-22-tomasz.pakula.oficjalny@gmail.com>
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

Makes it obvious these magic values ARE in fact derived from min and
max values for s16 and u16

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 8083eb7684e5..b21e844f5f3a 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -21,7 +21,7 @@
 
 
 #define	PID_EFFECTS_MAX		64
-#define	PID_INFINITE		0xffff
+#define	PID_INFINITE		U16_MAX
 
 /* Linux Force Feedback API uses miliseconds as time unit */
 #define FF_TIME_EXPONENT	-3
@@ -226,12 +226,12 @@ static int pidff_rescale(int i, int max, struct hid_field *field)
 }
 
 /*
- * Scale a signed value in range -0x8000..0x7fff for the given field
+ * Scale a signed value in range S16_MIN..S16_MAX for the given field
  */
 static int pidff_rescale_signed(int i, struct hid_field *field)
 {
-	if (i > 0) return i * field->logical_maximum / 0x7fff;
-	if (i < 0) return i * field->logical_minimum / -0x8000;
+	if (i > 0) return i * field->logical_maximum / S16_MAX;
+	if (i < 0) return i * field->logical_minimum / S16_MIN;
 	return 0;
 }
 
@@ -255,7 +255,7 @@ static u32 pidff_rescale_time(u16 time, struct hid_field *field)
 
 static void pidff_set(struct pidff_usage *usage, u16 value)
 {
-	usage->value[0] = pidff_rescale(value, 0xffff, usage->field);
+	usage->value[0] = pidff_rescale(value, U16_MAX, usage->field);
 	pr_debug("calculated from %d to %d\n", value, usage->value[0]);
 }
 
@@ -266,10 +266,10 @@ static void pidff_set_signed(struct pidff_usage *usage, s16 value)
 	else {
 		if (value < 0)
 			usage->value[0] =
-			    pidff_rescale(-value, 0x8000, usage->field);
+			    pidff_rescale(-value, -S16_MIN, usage->field);
 		else
 			usage->value[0] =
-			    pidff_rescale(value, 0x7fff, usage->field);
+			    pidff_rescale(value, S16_MAX, usage->field);
 	}
 	pr_debug("calculated from %d to %d\n", value, usage->value[0]);
 }
@@ -306,11 +306,11 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 
 	pidff->set_envelope[PID_ATTACK_LEVEL].value[0] =
 	    pidff_rescale(envelope->attack_level >
-			  0x7fff ? 0x7fff : envelope->attack_level, 0x7fff,
+			  S16_MAX ? S16_MAX : envelope->attack_level, S16_MAX,
 			  pidff->set_envelope[PID_ATTACK_LEVEL].field);
 	pidff->set_envelope[PID_FADE_LEVEL].value[0] =
 	    pidff_rescale(envelope->fade_level >
-			  0x7fff ? 0x7fff : envelope->fade_level, 0x7fff,
+			  S16_MAX ? S16_MAX : envelope->fade_level, S16_MAX,
 			  pidff->set_envelope[PID_FADE_LEVEL].field);
 
 	pidff_set_time(&pidff->set_envelope[PID_ATTACK_TIME],
@@ -399,7 +399,7 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->effect_direction->value[0] = pidff_rescale(
 		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
 		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
-		0xffff, pidff->effect_direction);
+		U16_MAX, pidff->effect_direction);
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
@@ -1366,7 +1366,7 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 
 	if (pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0] ==
 	    pidff->block_load[PID_EFFECT_BLOCK_INDEX].field->logical_minimum + 1) {
-		pidff_autocenter(pidff, 0xffff);
+		pidff_autocenter(pidff, U16_MAX);
 		set_bit(FF_AUTOCENTER, dev->ffbit);
 	} else {
 		hid_notice(pidff->hid,
@@ -1424,7 +1424,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	pidff_set_gain_report(pidff, 0xffff);
+	pidff_set_gain_report(pidff, U16_MAX);
 	error = pidff_check_autocenter(pidff, dev);
 	if (error)
 		goto fail;
-- 
2.48.1


