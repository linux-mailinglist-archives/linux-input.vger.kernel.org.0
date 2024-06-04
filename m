Return-Path: <linux-input+bounces-4069-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B28FAE9E
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 11:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734762879E0
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 09:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FA81411F2;
	Tue,  4 Jun 2024 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbS/Eotw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB1C137936
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717492883; cv=none; b=LMmhtwQrGx0I+CfsHFMpqEIkWdMSr+hqzpEgTe2sga4EVVLXzPkqvc88AUwjTrJVcJ661OegQj7mqgS2sXhFmTXLCTvvRrOLWzBgO5uT/N0BK5d/Ee9zLWDegaPOYKCT4wpJA/dJPuPxuXstXVKaHoumi8yMxz26F8ETQAe9lWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717492883; c=relaxed/simple;
	bh=HX4zGkBeKIcf+mrNBaCuVyEc9l8576nDGuUYJkIopsY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=b4tYzNi4encjt8ELl2nkSw69OZ4taWbIq4Tr3jIw6IJ429GaZXFf9Ir0vF/zU47WaSGlpHa8oyZMUBjFf2N0cyIPDkJM1B9EwnGWqOQ6SFz92ErSzDly9Pygd5sZlW1frSTGZ/pRtVeE3bUIjT7lPRRf1da/EmjJeehShs0Ox8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbS/Eotw; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaa80cb573so38024231fa.1
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717492879; x=1718097679; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N/O0s1scqxBdid4yL2WdEHaVBelN/s5PWPWv44J/Ak=;
        b=SbS/EotwdCooSuoKFckQ6gqFHovb68xzOdt8F0NTVZKTTIcS06goc3OzqQFrMQbEyD
         uzH+fCCQT5i+ZUwW1SE99Hl1/77t2C2wrgeXgLqpdzEdweDDNwL4EINj8jbygluLUAWr
         cDmx75jrAXajYFVGx61MOGRJDS0ctu4v1xueN0UoGgzTuy7TgNozetfFWH14/pgNDnIo
         crRsK337U/2ImbUAdVoNoiJUyeaKHJR8vHNOUBheQImtd0uZcntrQkiKZzapuLjRMNHS
         6OGkrLB64+FQURKI3iNz43upqRpqAHiVDTH6TA/bUJRQpRjJkRiu5mJyyh00gacofowc
         f/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717492879; x=1718097679;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8N/O0s1scqxBdid4yL2WdEHaVBelN/s5PWPWv44J/Ak=;
        b=nlvp9ARXtRKIMvs/bcE0Rdz45W1p/22E8ZbuGMHLhAjg1TitzHsWK7U1UuILwIjMnZ
         RQ3HzsaABIn0aa0N9yNz5XSlT3NYjIVBApJ3w9Aos73HiSoPuZhjwolQyRV2/VyskXxV
         ZKoCp38tKTiiV92RPnVrdkr7iAWPcbmGNI/wPwtkrrOFmpsCHAWiNXWgF94ZzH3I3laU
         x+Ahc5b8bMdNBbbNMUD5NayveT+3iwS2lCRejuuWYGA5nkd4av/TV4FERvIdCAKL4i8m
         P1aMVXTXzk2svlgH6wO1OnDPLww20mUMBORQRQ9jQBGtj3DgNfvXq3P5zfTP8PHtdp+F
         3pgA==
X-Gm-Message-State: AOJu0YyrJAdqgNV2E0yTsWN2+6AQgre5SXDRww5KixncXxf0DAQ12eVZ
	lLbC4A9Y+Za4Q6u8spkCzX05ynacsoMyAtYxCjMAmw02aF7YgrTy28+NyA==
X-Google-Smtp-Source: AGHT+IHBvJbeRspgFJ0b8KINAlZvOWn5MnEUEjcSMf0/KWJe65cTvsxqgOuwcF2GvJleUC6mllihoQ==
X-Received: by 2002:a2e:9ac2:0:b0:2d8:b2e:7bf3 with SMTP id 38308e7fff4ca-2ea94f58e4fmr68696821fa.0.1717492878411;
        Tue, 04 Jun 2024 02:21:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:b6c:d900:a254:51af:8350:d755? (2a01cb080b6cd900a25451af8350d755.ipv6.abo.wanadoo.fr. [2a01:cb08:b6c:d900:a254:51af:8350:d755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a4cc0sm145783415e9.30.2024.06.04.02.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 02:21:17 -0700 (PDT)
Message-ID: <75245e3b-72ca-4a62-a88d-36b7c9976181@gmail.com>
Date: Tue, 4 Jun 2024 11:21:17 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org
From: Louis Dalibard <louis.dalibard@gmail.com>
Subject: [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and 4116 on
 ASUS Zenbook 14 OLED (2023) and ASUS Zenbook Pro 14 OLED (2023)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The touchscreen reports a battery status of 0% and jumps to 1% when a
stylus is used.
The device ID was added and the battery ignore quirk was enabled for it.

Signed-off-by: Louis Dalibard <ontake@ontake.dev>
---
  drivers/hid/hid-ids.h   | 2 ++
  drivers/hid/hid-input.c | 4 ++++
  2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 61d2a21affa2..72d56ee7ce1b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -423,6 +423,8 @@
  #define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG  0x29DF
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
+  HID_BATTERY_QUIRK_IGNORE },
+ { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN),
+  HID_BATTERY_QUIRK_IGNORE },
   { HID_USB_DEVICE(USB_VENDOR_ID_ELAN,
USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
    HID_BATTERY_QUIRK_IGNORE },
   { HID_USB_DEVICE(USB_VENDOR_ID_ELAN,
USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
-- 
2.45.1


