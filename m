Return-Path: <linux-input+bounces-4073-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E68FAF54
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 11:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 622F51C203B1
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 09:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5881B14372F;
	Tue,  4 Jun 2024 09:57:50 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A39763A5
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717495070; cv=none; b=sgYQqIjHdQwvqd7NUYSbBlfuwUd0/Kfo+PQV2Hgu8zfQ7FYlBiYL8+u1JohiO4uipSltoj0O1CZ4ix0i5PfkUKSjQoPtsJKMSUoO617PcPIcFqM6KGHwtwLDBv+rezYyrIyg9hGoJJRgQasVCkiVqBRMPvfrl/vp7tbeRwjbL+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717495070; c=relaxed/simple;
	bh=QVHxEpr0WQ94Cald7rpZEKG+280vBGJxTVyGdS/dlFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JoBEUYY5bcpXRU+lnw/2E/ngO9Rkb8yhMHsLHOe4etMmWXRn3bMLV6OA0xYii1oF02LOzmC4Q8jjnmKxYr4VWBICV3g2CGTrs8n6IyoMXFHuAYZaKJCZMlelFLF14ETqXHvmw6ixCC88erbh1Lpc8hBRrqEmB3zrjWtT5gIzhDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so60571011fa.2
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 02:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717495065; x=1718099865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TF/BCZILBUFHNUU4I2tKZHNtRu2x3ZjcJUu5t32H3io=;
        b=JZ22OSw9FT0Mbbg/ZoARHGAzYcDDr47tqq6rKw0ivAMStoT/1WFyYe5zw6+j2K60kp
         kAw6eDo4kaIEpGA2CPEgCHUZW1Db8w2ZdYiIXOPtfNORviHIHxBKALezfhoTZpDlt1xb
         LAfh9StTw6InXWO9dVKhSOWQ+zvcKToGT5MxLUPRDqNJAD8CbGOXPR2xVSHUno+5z0Qk
         Tjn5Hindzcb7TM6Q1+lFXsRWi0bVToyGuKl1mw8Ho4psNd/fnb8V1SOnSEs8gm0JJdlO
         7M3U8thhpeJG84XqjyQrESi0AC/Rc+ZQYfrttZvLaXCYQzpfkwkjHNzAx2n4tGT0gYBo
         hKRg==
X-Gm-Message-State: AOJu0Yybmg6CsOTSoIQ0JfBb7H6SZHHJoN3da3WD7yFs5u/Md8JkMNhr
	H7/Z9hlixvKi2KTcpgLbMlaDyo6zOQBhbCAO5TJvOUeSBP8XYVrHVHcwYKpz
X-Google-Smtp-Source: AGHT+IEOsCX47XO3v728bYyE2GqMQJqlDP8PmM7vblbP7yg38cngGZcjudO7r4/updM3DJb0Eb5uwg==
X-Received: by 2002:a05:651c:1423:b0:2ea:83fb:3e1f with SMTP id 38308e7fff4ca-2ea951e0982mr66316661fa.37.1717495064909;
        Tue, 04 Jun 2024 02:57:44 -0700 (PDT)
Received: from yuki-p.localnet (2a01cb080b6cd900a25451af8350d755.ipv6.abo.wanadoo.fr. [2a01:cb08:b6c:d900:a254:51af:8350:d755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a758csm146691165e9.36.2024.06.04.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:57:44 -0700 (PDT)
From: Louis Dalibard <ontake@ontake.dev>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org
Subject:
 [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and 4116 on ASUS
 Zenbook 14 OLED (2023) and ASUS Zenbook Pro 14 OLED (2023)
Date: Tue, 04 Jun 2024 11:57:44 +0200
Message-ID: <2747286.mvXUDI8C0e@yuki-p>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The touchscreen reports a battery status of 0% and jumps to 1% when a 
stylus is used.
The device ID was added and the battery ignore quirk was enabled for it.

Signed-off-by: Louis Dalibard <ontake@ontake.dev>
---
  drivers/hid/hid-ids.h   | 2 ++
  drivers/hid/hid-input.c | 4 ++++
  2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 61d2a21affa2..72d56ee7ce1b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -423,6 +423,8 @@
  #define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG  0x29DF
  #define I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN 0x2BC8
  #define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82
+#define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C
+#define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116
  #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN 0x2544
  #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN 0x2706
  #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN 0x261A
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e03d300d2bac..0d21590e2d2c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -377,6 +377,10 @@ static const struct hid_device_id 
hid_battery_quirks[] = {
    HID_BATTERY_QUIRK_IGNORE },
   { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 
I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN),
    HID_BATTERY_QUIRK_IGNORE },
+ { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN),
+  HID_BATTERY_QUIRK_IGNORE },
+ { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN),
+  HID_BATTERY_QUIRK_IGNORE },
   { HID_USB_DEVICE(USB_VENDOR_ID_ELAN, 
USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
    HID_BATTERY_QUIRK_IGNORE },
   { HID_USB_DEVICE(USB_VENDOR_ID_ELAN, 
USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
-- 
2.45.1




