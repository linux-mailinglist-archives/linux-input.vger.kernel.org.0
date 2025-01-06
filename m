Return-Path: <linux-input+bounces-8971-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EFFA03226
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E3273A5AA2
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04AE1E1023;
	Mon,  6 Jan 2025 21:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sw+dJv8b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B31E00A7;
	Mon,  6 Jan 2025 21:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199357; cv=none; b=UOs/7pe1scvc6w9VSlyAgrzR0J7AptCOejfRqi0494eCp0iYnAAcC4nLCsBdtkDQQ+H2AApPUwvMUu/CI1dmhP0O3NeiG9k0z+GpJWsd7b+Sf6U6niqmJuaIBtKjQokvgsY9dMfmyh1sc71ZfRl6Orv6mo8l0JXuy+3ladaXUv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199357; c=relaxed/simple;
	bh=b+zfvgwJH2RorKAcLzDD+FZq/xIErAzyO4/KBsNmong=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+t3zY8LR0L8Wznt0N9YQQ9y7M0MH51/jLLPk8z7tpYXcOMkEYexmO/cwmEcq/Nk4RjOT7bYdVE/7BF7pXdRH6ZxSPhmh8/J7p1yf3q3rzuDV3o9Kpn9gvBb8pHE9vlg4QLRPSkBvulsaIgq1b+Ntc2KQf1JM1acyqeKm+fUVX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sw+dJv8b; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d0bf4ec53fso3098710a12.0;
        Mon, 06 Jan 2025 13:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199354; x=1736804154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIWbvhwfyoOTXpZRGFAZUIU+5fdfCWd5LhGB3garQ30=;
        b=Sw+dJv8bIND7AoxFPwLs2BgmmEEeP/jWBfcvDrrHHy0msjVGn1bBsRv23dGoBbilEg
         l/d0qFwecpLQSphJUBkDNDn917yatOdTUrn8USA+has3NGX7wHRlw5lq98Q8iAYZzCB8
         rLJ94BwWfVSzrBs6N4Se5/vJ70mJjOA49AFi6kGrqmzn3jiodsswkl0tIR8tbwkUhLcs
         q9yV0KhayzNyEwEYxU0JnZhURfGhjnkD1E75LWCdlc/KJPT99d5PAQ8l1ZX1rRyNxT9f
         gMLdsDNiv8gaDl3Z2XbstTW0EaVNVPnUFZFbKSl71IHI9+g7nfyZqNq4kNzGRYePsY+S
         zw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199354; x=1736804154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIWbvhwfyoOTXpZRGFAZUIU+5fdfCWd5LhGB3garQ30=;
        b=pHeiSWdESh73EPjyJuxeBO24Uxk6RX8Yb949Iml837cOSw3F9wpKT5amtTDOy+GzBz
         MpqGBvhfgfmDSz7lwdqxjfYhq2olX+43HZaH/W1gvvb9l24f1qGH/Kv998QX7fcEmG/D
         RVo+pTf/3J4yoiV72icmGmLHCVR78DcZWZnNsHhsiC3kMRIBpjHb280aLQuPFQqz+PHM
         q+xoGL475KFJAJtv8VbgJvRoa77+f714JNbD9zp83o85JsDDuvWQibDVHJ4aVR8I7qfU
         Au3Md++cd/XwWQZwt3c23eT8v2F73qVjGrncnQrovOu/DOrZbYtRGY7a/yqJD/EC8JIC
         bSbg==
X-Forwarded-Encrypted: i=1; AJvYcCVAzoC5lVQzPEOQ/sB6qlhoXXjbmEgVvDebYmQ6KsuJmw7+Hq3vt78qwl7qc9Eu8wbdiDRSNpNHUgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwshAcsM5nj8YJdFhcdzETroG74z7ZB0z2jqMKIzCcrjgBmhgms
	KTEXHmU2tsIKa7ICU4aw59BH7s6KuyRAwHD9nNr2jiz78x2mZXTuMceysmI0
X-Gm-Gg: ASbGncvnBTATmVTcQ+K+RcEssUJ6xEBwWGyUN73Y+6jmBymcRAI7gwFOuS87re6feci
	T/k74oDF+8wcBlINQVFvRS2q8vsun1lodXVsJkqSHEadIjj74DpZ9zbEK6GkosGHU9HGUz5cwOC
	gDbgJvBp7z3BW63snRwhCtISy25/YDSX8lp+ZxBt74a1xyoMOlIXxi35sTx/JYFQbfBrDCb2fuU
	4FlGbPQA4GSGS+675D+XNquFZVRpgjvbEyLUBY7S3Tig8iKWTcbY6q3gmSH1gdE9v1Cui7zzJmx
	aQCWRBOtbLrxocWRA2ZHA+D7YaA=
X-Google-Smtp-Source: AGHT+IEbm8CI6PSn1fYSqMr+ze0pUcK/B9DMBbMLgLF8TZL26BppdCyYLbZrMq5B/4KZeBWh0QsArw==
X-Received: by 2002:a05:6402:524b:b0:5d3:d747:6496 with SMTP id 4fb4d7f45d1cf-5d81de2dcccmr19597530a12.10.1736199354351;
        Mon, 06 Jan 2025 13:35:54 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:53 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 09/10] HID: pidff: Stop all effects before enabling actuators
Date: Mon,  6 Jan 2025 22:35:38 +0100
Message-ID: <20250106213539.77709-10-tomasz.pakula.oficjalny@gmail.com>
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
2.47.1


