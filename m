Return-Path: <linux-input+bounces-8968-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2017A0321F
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D647B162758
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51E91E0DE8;
	Mon,  6 Jan 2025 21:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSrNdLak"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D61E0DCE;
	Mon,  6 Jan 2025 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199354; cv=none; b=GxZvTvBrdroXAb/trskKiTHXv8gK3CNBGyHrsiyjp04+k7fhfiidwBW1sWIED7nLv3b77QoTwIk/mEVM+K8tPFg9+fjUprItzfnvJpmAcK+Qo1mo0lXCR1qr+qG5qLq6ZkC3/WY27bWFXWBm/JnkOTL1tlDeHmGaeVZZN4Z5rmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199354; c=relaxed/simple;
	bh=pLph4SWz6y3xXJ9APCg1zZVx3sH1RCXAHG2RypKhgUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YMLkEOFxYY5hM3h6y+PSgi1+YaieEP/P+3r4/wA1X4njIyq7Fk6gz/X3WHbfcmePz8IphfUdIsS5L1lsOqGWkbG3/8aSQVCvIkm1X+tOmcEVZJ1fQXQWcDU0y9DBbtIb3Z2dALXIdIn3YFM5wot0aiqNld70nRYH2miOeA/sWio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSrNdLak; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d8753e9e1fso2282055a12.1;
        Mon, 06 Jan 2025 13:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199351; x=1736804151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epp0wzlEdYadJ3qjQFjrGTOyGLfNXGUa8Cy33VmBBEQ=;
        b=TSrNdLakupYK/EBB11dRrwQDqNPBOx6CwzVJtqaASKC/K8t9/4zhhjI6ov1r4R5ZQr
         AyX0kM1bLdLDOSiTuk/zp6JnWlzCURI6SBTzCqmVtyl3be6SpxcYV5W2y2VBwG3/VkeG
         kAt0zj/BJoKraWwNZP0I7i+D33hFaFFe3uUkTHNR5FvF15zmQDlauFIwMBjRKTNS619v
         /zhdAPAfE4lNxBp85VGNe0UzfJP8CmZ8VvZNd08F2KJb48r0IXK+w498BSo7NDWX1Avd
         sbyWS2lqK/nyUaNYrI8lJZBfCBixY4gvSU3VKjDRETBiHpRjUxA+eGth7edExeeShka8
         CHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199351; x=1736804151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Epp0wzlEdYadJ3qjQFjrGTOyGLfNXGUa8Cy33VmBBEQ=;
        b=A/EBqbT9S8+fc+wwqTynusb9ijWIgTL7rRDFGDw5B486dkMkrhrjsnI7IkLwJHwj7y
         W/PYMvoXBj1ds36XKc4YgSzmYIzaK+URSzPa1riOU6k/OMGSt9G9dp2H/ZFoRv8KcvHx
         177zn6LpT0WEEJPfOL5hYoDFyNhT0KiacC5dqSy5A8KrwrOdkhrrHYXpJ1Qmsz7mULRe
         HQKw44lraC5U3XLSaFBS8WeNSZi7AY1kkeEd4Wv9MXgjdTf8N4fz+r/0C36CFojI5AAZ
         UHdv0rVMEG9xe01sMoTtdc8ZQKDUmf+Vnl0Zyt9Oi0ecHvFVymXG9tt9byuCejBNDjvj
         2ZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaYoqpMPPLmH7W1gqXIOYckcwQHKB+GQbpHV62fqt2u40udzENof44u9+3NZjQW34iYXGTMLLTDXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/1YlWQ0pEi5gw28PtjejKF5bDH+0re+fAQpayQCSXvBPM3nL
	Q8772qrnqMK3Tq7zzHjFwUVq8mhb17bvYuRjLcob/zqbwQBzYNCa5fbwQ707
X-Gm-Gg: ASbGncs6dMctLBbekXrlkNCnRHkLu7NdnxcjBQLzM8bL2jQ3uL+xUjfXwYA2Xrm9RX9
	WMgc0vRbyPyZVTDi1I2Jp1GyOlGcqEyYIONhY/4uwiyEUf7d3zmjBrXi0wSvJhVKuHReztf7PaY
	nnlHnJhglY02vYHPjPKWWwIrSRhjLBybJsVfLLaM3KhAMAjzC4XWQme6679e9kgwJhxDZymy82y
	T1MzZQDCPL7Tg15EDfC9HdJJMt6894Teb09W4CEK7agHOSGjrBjbqby/fHswvR8D6CTcF34BquB
	6n+jNBcvWWoJrISp3Ikxtv8txHs=
X-Google-Smtp-Source: AGHT+IFufXx+0W4p70WmQnlU7EfZXvOTo21+xcRSm7VsVMrLONAFqD/XFvHiIUel1pGZP8qErzDY+Q==
X-Received: by 2002:a05:6402:4403:b0:5d0:b7c5:c40b with SMTP id 4fb4d7f45d1cf-5d81dd66e01mr20558882a12.1.1736199350946;
        Mon, 06 Jan 2025 13:35:50 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:50 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 06/10] HID: pidff: Add MISSING_DEVICE_CONTROL quirk
Date: Mon,  6 Jan 2025 22:35:35 +0100
Message-ID: <20250106213539.77709-7-tomasz.pakula.oficjalny@gmail.com>
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


