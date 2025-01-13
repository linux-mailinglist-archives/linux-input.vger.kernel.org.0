Return-Path: <linux-input+bounces-9191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69559A0B775
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7399D1642CD
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BDD2397A9;
	Mon, 13 Jan 2025 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXFheBlW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614522F172;
	Mon, 13 Jan 2025 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772580; cv=none; b=lvAZ8hk5S4YDAqneoVlVCmWLN8hUUphC1bSlcpxcgDY3sEc5ae9rH1IavMdHaZOqyjINdYDXnSgEen8yepRhW0hB9vu+0At8ZfAJrlV8eJ2YYs3gLugkm8RzRYFBwmuKPGfw0346TCpfFxIK/i5SNZz4f86P+mJU1JvF0VwLS14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772580; c=relaxed/simple;
	bh=DTD8npC2tT5CKjvqy3NpxhPsQ+q3o3IVUsvsbOeN+rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQvIxN5j0/EUA68HfXy92gDOUvp0+LkIIgJ2gTLNiZg/XAQzc0BZxkWK8yFj0uzoNQnwgzUMWRqNZc1wAhfv4WgIBEfAP+LlGdp5I3K/XgPwk/BaAT1XBvk8Cg7V7LhtAo0lLV9koBMnfH+BK7A/xoSiNy3b1pauY+SJ4flLTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXFheBlW; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3023fcface6so1556501fa.3;
        Mon, 13 Jan 2025 04:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772577; x=1737377377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6G/EW/lJLx8t/n629o9TjBmdmTTqR53NzQNGoY0G0w=;
        b=HXFheBlWeh7lYNi27MLnTBEufCOD76xoaEKZYDlPY3Bt+Ena5j1rV88mmKDBOiyEwq
         rqL8oRExTdi+NxSUxp8mf3aj9Me0p+BMedyd2O5bdHxRbmdXr9W7EhiEvJAkiFphk7Ni
         FY/4VyGu4EL6Co0jtoDVwAKJOE7cQyoqCTHz+O41x2Bt2t8DsHZvjncopoMj3GRYKGeA
         qBNmlUmHsD90kY33f/IRtM3c8oWnLrgj+hirFGPgWu2n+hwIxk6QrMOeCqF96azv5j4T
         5dwDpGeKch/WndLgIJslBygVnbUHMOunANb9AZyUdwId2HF4spJjpEBDoynS1QvJuRHj
         nS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772577; x=1737377377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6G/EW/lJLx8t/n629o9TjBmdmTTqR53NzQNGoY0G0w=;
        b=cvZLUCIKADH4VIuoCGLvS03hStx18aNmtq17bODaQEu15G/SyvWEc4vBWSVNZ8z2oO
         Nrc3NdRgicLbgxyAh/+9DUxwtSNjZldQkgjnhQ3o4JBahg77fwi7ruJa1T0lT0U6aDqK
         oIbRua/hUfdmCIeuVykjsS68fNsaBlZW1juEjcZ3o7zTun6YEg5xmktErYCrSvtO8nXf
         Vz/Fe6qH80faNS1etw9KrCbMlVULNTRjKywoTnjtiCisHSnw8FJSSdxe8MF6fULR6Oj3
         mkH7abOF8H/cQrSDqYee04Bp6HwA6IPEIZcCTUgMEntPtk1ITdywXxJRxEqEFKRSoJAn
         o7ew==
X-Forwarded-Encrypted: i=1; AJvYcCV0xitJZ8O3u3yMc9yZyKLuVtIsHb2K77I8JwynLasIL4ytEk2xoBzy6s5gjrdvAY8d0OLgty/isnnEuQ==@vger.kernel.org, AJvYcCWFG9myjBJXXLXdTQWxWO8ZU4VXPtK6iisxMqxOI7uezGio2SFX7SrZA7Nta+fgienAD1ONP7hZpyj1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PvC4QN3R7/HU3ztSM3K3+08Z7bQ7k2ZTBWKJEARPPTucNEtF
	pdPAry18vv0cIFjRdMaDA3mBtAcOkW5XEdy0KnPV6BadN+Y2j/Fu
X-Gm-Gg: ASbGncu+BLJmSFLTh01uVapeFdiTGgTANF1s3dpgJgqLHI4YagHf0CIPbiyOs2T5DB1
	hry/IkKjRtME30XUkHXrsMoHSAFCqz0o00Z9RbIY2hSGSDAaQlHuODXY2A+DauZeAF/q9uLUzy1
	q8akkndC0gj9h4k3sr6fgz9MwT9FnausmuXjYSOHt0W0M29O0EcA7lK+wWWp+u938GU1O8/darB
	JOFO1UVKCHf+6+pF2tKmWnipxrMb8X+vQWLEbg9nl5r5ma8qRvTTESbHCifqX+vBBERHK3AuaeU
	92zhqMo83m+KDaAbQBul43sbOLQ=
X-Google-Smtp-Source: AGHT+IFIMEkSvqj6oZUEqc7d4TtjmbM+Jr0BTlxRP2P+OJeFcgH7J56BnnfoLzj0XBdiHOcybgE+AA==
X-Received: by 2002:a2e:a99d:0:b0:300:38ff:f8ce with SMTP id 38308e7fff4ca-305f453a40cmr23660371fa.2.1736772576431;
        Mon, 13 Jan 2025 04:49:36 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:35 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 09/11] HID: pidff: Stop all effects before enabling actuators
Date: Mon, 13 Jan 2025 13:49:21 +0100
Message-ID: <20250113124923.234060-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some PID compliant devices automatically play effects after boot (i.e.
autocenter spring) that prevent the rendering of other effects since
it is done outside the kernel driver.

This makes sure all the effects currently played are stopped after
resetting the device.
It brings compatibility to the Brunner CLS-P joystick and others

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 6b4c4ecf4943..25ae80f68507 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -109,8 +109,9 @@ static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 /* Special field key tables used to put special field keys into arrays */
 
 #define PID_ENABLE_ACTUATORS	0
-#define PID_RESET		1
-static const u8 pidff_device_control[] = { 0x97, 0x9a };
+#define PID_STOP_ALL_EFFECTS	1
+#define PID_RESET		2
+static const u8 pidff_device_control[] = { 0x97, 0x99, 0x9a };
 
 #define PID_CONSTANT	0
 #define PID_RAMP	1
@@ -1240,6 +1241,10 @@ static void pidff_reset(struct pidff_device *pidff)
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
 	hid_hw_wait(hid);
 
+	pidff->device_control->value[0] = pidff->control_id[PID_STOP_ALL_EFFECTS];
+	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
+	hid_hw_wait(hid);
+
 	pidff->device_control->value[0] =
 		pidff->control_id[PID_ENABLE_ACTUATORS];
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-- 
2.48.0


