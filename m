Return-Path: <linux-input+bounces-12548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4BAAC30C3
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 19:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68C0189C934
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 17:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DD11F09A8;
	Sat, 24 May 2025 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDm//bAL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2FE1B043E;
	Sat, 24 May 2025 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108852; cv=none; b=JXdzv8zkVLqyPlhFicv6Ld9mW155UzgtE+MLnj1PqScHG67M8URq8pX5N+QVl6AWxLs2g2kQ+/7iWg2vTN4Wwjj3rTO6/YOhWlIaUz0vQkk6vgtze5IraccKD5IiPoi4eLP5lxtZRGtHCXJHHKAPFg+80eHkqa5S4FNNjw6hgJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108852; c=relaxed/simple;
	bh=q7smeA6/r4PWEKs067Q26OKyLMJglVnlffBS/cN5+Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cn/GRYqTMEHpuuIokN1zXIwV+kBV+XizjkYD4XSZO0qKVHeEwSZqBLa8aKwaxPhLQyn5+az65RK/n3/684AWDbWGvKfJNk0qI5w803XFtMZCtV6MVVizf/Jz2UaeA1/dl4LPizvyNemtH/yrvGiQIMctRMBdZcTdhML1XkMz2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDm//bAL; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60169001e0cso133337a12.2;
        Sat, 24 May 2025 10:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748108849; x=1748713649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j76gckhvXinrW9VV0Ck2UDRzltEJE3k9ikLRQ/KXetA=;
        b=HDm//bALwl/Io0gJVgQ6Olw/4SKUY7W7+z19JWGgBhLLv1hSSE8MBI4OwP2o81NgZ8
         eRv7mAnj6k7TgZnV6ii1deDSnUxYDBUBXU5cPP/va9SMedJMLvz5cJDyIT7jwV8f4tfl
         sZTJwz59Aw+kXfEyWOW2rTB4tK+pHQQGKaZ8UUQptUa7ckqlHSF5VcQxX7Z3XFXABmwo
         n91UC/ySIekyd0sFv5qlNoDOz1wU9KFP56ZcUjhHR9bwM6Rp5IeKluKMF84vxdUIlkE9
         k3kFGbKFJHNoMCL0N7VaB4OUieDbtF6JL3B26/t+cveAAPMMMH/hWk2LNM7iuv6USXgd
         l7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108849; x=1748713649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j76gckhvXinrW9VV0Ck2UDRzltEJE3k9ikLRQ/KXetA=;
        b=QVaVE0Qc7Upwr8zCmpe0LTBIFWr3rRrdo/3lnXlHeauHhgU6H+H3yqIHY5XUsHpXIj
         Y65/ZVV3moq1e7ney0vTTtS7+hl9UYBPPtZHcCebo4V6nYrdFelcC4Nr76OGmObr3OuZ
         8ILTV55KyMWSXdUjZ+tg3eD7tFXoq/SJY/UAyNylFtxc4W1etXHTk9amhFgXFdT2/Aup
         Geg2dSxASGGuysH5xgKhVRkjZfkSBhMAUnDjo6tHtgD9Et2txE7ouwdcrbRCgavAAuJ/
         yt2HythJIynKxwBicnP1IVc8aKb7rj4F42Zn0vCjo8FqB2XmpCa5UY+lbRJOSoU1Vx3T
         JPPg==
X-Forwarded-Encrypted: i=1; AJvYcCUjv3n587kiG08HF+BEc5eaPrN3Sa/H99BR+KiYMCaBKsXwf0VLZxvgifRyO1QPd0Z4kmGnIxtTbWNZ@vger.kernel.org, AJvYcCWsnI6CRPa+0Icfb/olthNOADZnsZYeMJw8ELapvUzo4mTL0N/uCVT4eNt54W621vcDHEtjz02/bhdDig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbXZsWPsVd4KrJV0Z1vMm9w2fS2hbY1LyaS1oJwTH8417Y+Pft
	z//DnAbBqzinEkfYRdfrodrRwYxFy0hqbrKV560j8GnrZCFk3s2tLftjhzzU9A==
X-Gm-Gg: ASbGncuwOAHHW6RToOe1O95ahcUIdxTbq+n7OU4VBlrfoQ5+3KpJv0gNAE/wzHmEz8E
	CfKmpJok0mA/G1WP+6BBeWH+SlFfYdOwLKdAXv+gpqZN8+KLwU/DU9qbzbIeUc8xtPvDH7QJGPt
	OUHDfHEwzFclENgoPoskk+qhAwLXna9IB7BYpv/RZtaOg3XW+BkebK31eCmoKUiIHtYjitXZjnQ
	P2tasPbetOH4X+yIbEtRP+bdegVELs73xBc1k5xEmCljHx7BLIafk97m0E6JKEZNuoiTnPP72S7
	r+EKo0prirptfKm46IQaVOoGpIWNltmYMrsBTXO4tR2qWALaxXPNGYB4h/hRIlr89knse1bBuhe
	9
X-Google-Smtp-Source: AGHT+IErSeHhiprcbAvBQsuCOBz0UT/SEe4afsi/ZIa8YSoKGwJ8yaF0qqcIgcbRr9fQCancPO9xhw==
X-Received: by 2002:a05:6402:34d6:b0:5f8:e24b:c8c1 with SMTP id 4fb4d7f45d1cf-602da4fd0c3mr1040224a12.9.1748108848962;
        Sat, 24 May 2025 10:47:28 -0700 (PDT)
Received: from laptok.lan ([89.64.31.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f11a0e0fsm1138789a12.13.2025.05.24.10.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:47:28 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 02/11] HID: hid-ids.h: Fix LITE_STAR_GT987 device id define
Date: Sat, 24 May 2025 19:47:15 +0200
Message-ID: <20250524174724.1379440-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250524174724.1379440-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The name was missing "ID" part

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-ids.h             | 2 +-
 drivers/hid/hid-universal-pidff.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 1062731315a2..5c75c09c5780 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -841,7 +841,7 @@
 #define USB_DEVICE_ID_PXN_V12		0x1212
 #define USB_DEVICE_ID_PXN_V12_LITE	0x1112
 #define USB_DEVICE_ID_PXN_V12_LITE_2	0x1211
-#define USB_DEVICE_LITE_STAR_GT987_FF	0x2141
+#define USB_DEVICE_ID_LITE_STAR_GT987	0x2141
 
 #define USB_VENDOR_ID_LOGITECH		0x046d
 #define USB_DEVICE_ID_LOGITECH_Z_10_SPK	0x0a07
diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index dad6c5a6e2df..554a6559aeb7 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -178,7 +178,7 @@ static const struct hid_device_id universal_pidff_devices[] = {
 		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_PXN_V12_LITE_2),
 		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_LITE_STAR_GT987_FF),
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_ID_LITE_STAR_GT987),
 		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_INVICTA) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_FORTE) },
-- 
2.49.0


