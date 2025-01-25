Return-Path: <linux-input+bounces-9522-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF689A1C36E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA021889ADA
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076AE209678;
	Sat, 25 Jan 2025 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXVly/yX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32518209684;
	Sat, 25 Jan 2025 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809699; cv=none; b=MN3Zqwb/M/Q9rTzYSzK7IyD1HRruY5Fpg1aR5yuNaPG4lZfzch9Dakn/ARmYEsLS5yRpkB77rVc5Mt4ew/qZmQZyoIQPdnmiplOGWyfuolL3ZTwyIxYiAlUpzBSs6OrTEjELJWNof1a8ycPKrLmnBxbdbS+fPdqE7sL2zpNezVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809699; c=relaxed/simple;
	bh=sfJp+cEStH0iOHMy+L5yy3UCQpbG3St448sBy3TIeoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ls9tMMW1yUdT2HO+YISaYTF0raKTAXJc68cOOVIzkVXjbWV3Lnac/LkBHDc5VO12Dk0qSXE738KgKL/6rCNUqMberyGsfLwTAebVtxUId0d/MRu+IROlAFIFcuUwztZOKpc7vG3okkW2bUcT4PWaQQ3+qgwzPD1EGKV5hlGvzhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXVly/yX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5426f715afeso413037e87.3;
        Sat, 25 Jan 2025 04:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809696; x=1738414496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7ipsiTl1dRTYPh+Rs2vHcEMW70oojF4sOlian54NsU=;
        b=lXVly/yXixqg8MMST6qWTQmyXXvtu62Pma9lIH7nYyZu1Z3mzL+0Tpk9RH5llEx7by
         CBkKNyEyhPZdYWMlwZpmPnS24JglMSOAg134kXtoQGYqcPlrH+Ghuf3DwQuNSRs0qnTr
         hMRqMqYPTw6MtBWQHpUtTCfM7+uojPk1p/+TGvlgXl6up+jCTiyL3LbqfO9S8SnXy7DU
         o82fR0iJTOxQMpMkkVn6zv7aJor8GUsPFKL/fTpHomhn1/jZijbwWFdm1EiylYAcv+a8
         R4LUUjiwag9pfbIEQwZfkgoz4l5/Lst1EfHEqcKgOeib1ClbLGQvMLcIMvMCIekQ1095
         EPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809696; x=1738414496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7ipsiTl1dRTYPh+Rs2vHcEMW70oojF4sOlian54NsU=;
        b=JVyYn+EZ7dlNkBH0jFQ4NEs7aB0nNfHJL1dXONzp2ZxUlLCi1pIhyFsfXbdH1WezRK
         5dPRBn0kIfyPUfGTveUmRPuHA9e2vJHMnb5vaQZM1SGTHvkmItRqI6kjA8ziEsh1ZG4G
         g4j8AiUGkPUcf9tn5fxVZpolrxhX58yiunr7+Rs56tGzst2wf+rhyVzJg5Q65HIFSCg9
         Y2gmAGzXkF+vmceAGdqC7b00O6/734ovw/er4i2rdPrGENS5OhfGdw87YrNC4BqBvIoq
         pyzB81ZvPpbfRjkW6O2FZzOmer4Ok8MNb623tXtAoqLPcSQaF+qteTqg0Ob3MPWl6XE1
         Odkw==
X-Forwarded-Encrypted: i=1; AJvYcCUGPImYw7sq5Uu1HHMmIoXan95ZnVYbmklA04fSYUy/GsI3MmyL/5M0jkvdyFMh7b5CjobH7rcnsvRyuQ==@vger.kernel.org, AJvYcCUShtvH9I9C0uM+0nIFH1MKwZBw+NzoYjJhLhQzvCQSiXFARfPd4YNQg9Y4PLCX7SLCktyZ2+hPln2Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Aube29MZsyasQ3gnGbJYIVf4iS2h7r6jVHTuVlwvKVTLZL9z
	J/tVzkSZ23MghzXsn0oIqecwjAxCjmV9T7IUDBeU6N9chCqqN2cd
X-Gm-Gg: ASbGncsi87IuOjeKaD8oLMPF/3LIXdz94wWo8go9svUmcM+walW1fjILXpNfz6+WueY
	nU4Mwz9a6nEiQBYOAaanl0WkDky+y/y6qMb+sUJ9p2zylJnUiS53HwTH1sX8wEoMCDVh77Rxqgi
	LWhPSsEDuB75qGNSyAGznKDMZyG+ikdkL9NRyTMPKa3kqwjJd2U/kyuLYg5Y521Rp8bQRxUwCab
	bHNjfv7sNFWjrWrFiPuyaBKPb971MCjLhjnMQKNDKCgz89NqBs+eUfEZE7gN/nre6nZo0o93vdG
	jgwDR5jfg5c27vwwhJIYO8HyqlyiU3KWtK9ogZPB7aM7DE4AVto=
X-Google-Smtp-Source: AGHT+IGCPSjNbHzFwI737UjJn+03f6FiqFKdr7fAZh7bUFtKbUUGhxrJbp0O41zwMiiKn6cm62aOLA==
X-Received: by 2002:a2e:be9c:0:b0:302:27c6:fc98 with SMTP id 38308e7fff4ca-3072ca8c496mr37123141fa.4.1737809696185;
        Sat, 25 Jan 2025 04:54:56 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:55 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 08/17] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Sat, 25 Jan 2025 13:54:30 +0100
Message-ID: <20250125125439.1428460-9-tomasz.pakula.oficjalny@gmail.com>
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
index 298a971c63fd..9e03dfb2b1e7 100644
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
@@ -337,9 +340,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->effect_direction->value[0] =
-		pidff_rescale(effect->direction, 0xffff,
-				pidff->effect_direction);
+
+	/* Use fixed direction if needed */
+	pidff->effect_direction->value[0] = pidff_rescale(
+		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
+		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
+		0xffff, pidff->effect_direction);
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/include/linux/hid.h b/include/linux/hid.h
index e6e9081d7dac..856bed149246 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1233,6 +1233,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
+#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


