Return-Path: <linux-input+bounces-8900-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4473A01B89
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AFB018836D7
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DEF1D435F;
	Sun,  5 Jan 2025 19:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G93yPhz+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1E1D5143;
	Sun,  5 Jan 2025 19:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105803; cv=none; b=MI/5uE+/YxT8KV+qAIsfnhof2zOIuTyZQuI1RhSnkKpVu2FuokZQpH0zOmlQA4nCA4FnmPCdRE8sBWRAvg0mnM8zDG86IQRjFOyLlRB1QOtRpucL7E27f6O6wGu9ohH6aCTuVSfB2Cm2ZwuV1phv1hSb6LN5IX0ksPe/uVV+SDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105803; c=relaxed/simple;
	bh=pLph4SWz6y3xXJ9APCg1zZVx3sH1RCXAHG2RypKhgUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gudc4HnEz3th1NxftM093pqUjc6QrM4RbhPf0Wod5vv6TjPofl2l5g+JwyXk1l7Rrd0GUlklbFQI892DO2+jIqeSYchAiIaiI4osOE8M9M1FJR3m01T+E32PG//LPkTR/OfCeX09jlNNwzFULIqsW6yTyc3K8ah/xAWnrrGyXhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G93yPhz+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30223aa0b9bso12044611fa.0;
        Sun, 05 Jan 2025 11:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105800; x=1736710600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epp0wzlEdYadJ3qjQFjrGTOyGLfNXGUa8Cy33VmBBEQ=;
        b=G93yPhz+YQelE1bGYkhBErtM/20d5nnb9qIawpNJDrZjfk3duWTd5TeL5BXS+af23W
         HL9Di6tt7kAGLxpsHt4F6xz3Vfy6D5cy9OtgyT3r9HV8tMVk/L1QlRDtzNH1q5CUQOQF
         By2xlqUPq28EF/rwop1cbiJK0LtniJzRixj/aP3nCP8PMA9anSJWZDAKK0W+TyBz9Pjk
         wJPicvbKjt8KzYCmTje1CHt0ATTF16j4x/BtPb4WMITuu64+A1UavH4TsZMNfpDpjBt7
         a3xy2Q99gbpg1R69GYC6sVsFtx//7pbLXcFJq3KeyZ+fArbYBQr7J4HMDQWLZtAcM0Qi
         GIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105800; x=1736710600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Epp0wzlEdYadJ3qjQFjrGTOyGLfNXGUa8Cy33VmBBEQ=;
        b=KcKc8KsDIkB0bem8K0nxxyBlPpvfAc/24NWuH/HgHalyrJ4O7/rL3U1cYBqdqJGWg5
         CPdCNhUmj4UCOuYtD/4LNg1hjUIOXsGOW3AC8r0w/kKOqL5Ej1wdOJVTauUS+FfRPC1Q
         MWWOv5D8Sysaw/QrAVoNhlTnabfREFYmzkzcuVMBA+wUOrZUyVeFu4CSTv1G3UkuO2xx
         jno+avzwObCD/30IRVjjFebZZsab5Ro/S7A6qy1S/rxjZjGWO27KVsS3AOy6Wtqe7SEp
         R3bou7Swo5jtRuUefI6Puk/pmDYHYsiJ1kAuxioyrZC7ZeoetrwTalVAOxLthx6jD3uG
         GsFw==
X-Forwarded-Encrypted: i=1; AJvYcCVFqQamLxEFf4g2ttP7ImiVhqoHEN022S13iFRZCjdbiNMA5h1ATrZ9kZNSKuhhOo8U/1F03+j8d8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5R3ujS1QlxJ4zMlspzz2hCS9/dktSyD66s895Y/8nKGqnfUir
	FtMjy3u4eE+Q/nMddOWDpLfvrG/1bx2bA+FShrunMvTIbBcDJjb5YJ2YXNZ5
X-Gm-Gg: ASbGncvaLbyg1RZoWsYjTqAOqB3Lt7TvRx/CDh5adQj0DaCyb0GF+x5S2tmGDalN2eo
	SutDC+iHBPxW8xeTSMp6JvK7xjjFMW7UvNFzYkR4Ay5AJ6BgWzqEczWqwFGx14O4Hvac3bkWf0k
	X507buMf3wVn603/Um18MBonyiIjvtfhJ54QNZMBWtj3Swj4/l8piFKNmp48ijA5mVmu6SADjuk
	xdX7GDcXy59JEQi/K1Hw4e9dptCnttW2lNOQk26QfSv0h/7kq8WpoSfpog6tfLwN/a2poKPn9BD
	sqhgjZeCFvQctOyHclEwssFdCRU=
X-Google-Smtp-Source: AGHT+IGD9KpkqSN1Cp4Da2f8ejRcbtC6YOufLls8NuM/J2cJUAvb6OxnAUg0KZzLfLMn2ETtOf+sLw==
X-Received: by 2002:a2e:be9c:0:b0:300:1f12:bbc4 with SMTP id 38308e7fff4ca-30468670294mr61070941fa.12.1736105799551;
        Sun, 05 Jan 2025 11:36:39 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:38 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 06/10] HID: pidff: Add MISSING_DEVICE_CONTROL quirk
Date: Sun,  5 Jan 2025 20:36:24 +0100
Message-ID: <20250105193628.296350-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With this quirk, a PID device isn't required to have
the PID_DEVICE_CONTROL field available.

Some devices like VRS Direct Force Pro do not implement PID_DEVICE_CONTROL
in their descriptors while still having the necessary control fields like
PID_ENABLE_ACTUATORS or PID_RESET.

Fixes initialization of VRS Direct Force Pro

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 include/linux/hid.h            | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index d792a07b5a5d..53b16a4e54a6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1000,7 +1000,8 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 0x57, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-					 0x96, 1);
+			0x96, pidff->quirks & HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL ? 0 : 1);
+
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
 					 0x8b, 1);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 29f0a91f505f..2af9db0296d1 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1228,8 +1228,9 @@ int hid_pidff_init(struct hid_device *hid);
 #endif
 
 /* HID PIDFF quirks */
-#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
-#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL	BIT(2)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.47.1


