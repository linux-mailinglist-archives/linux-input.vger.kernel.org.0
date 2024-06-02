Return-Path: <linux-input+bounces-4026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D88D7683
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 17:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A92FE2813F9
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 15:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9603EA7B;
	Sun,  2 Jun 2024 15:14:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D321DDEE
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717341242; cv=none; b=rVHGbWQyKIpfxED/64LBMAQjUy8kYkw7UFs3LSFpeTqktRGapNOAFzM1bGdFOp0VCy+xKQIhHj460TJiV+AqKUxUaXbTgnDt631hy9xeNVnqaomvpnRmg1rHeDvoZxl9V9xUvwL9LKg5RANMbOAs/mN8JG42Ainee+X9UxAH2fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717341242; c=relaxed/simple;
	bh=CYIXfWPxbrpBFzCs7iCGTS+uYfIzJbpsWV+CGA3k3ZM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=FMnHV5ha/OjmQz8L1GWvySugf4CjdCL91SLq0nWoLa7ZCcu8LEJXf4r95Kj6AojaGSujc/ROZeh28S1wSwhJy65sgNFRkF5hGsk35Fe2HX6aL8fCQQ8YVGk6S4zLWPwgLrQItIDhSa70pBuNUIky0TsE44hWDGTI0t7HrZKhrVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35dc0472b7eso3105169f8f.2
        for <linux-input@vger.kernel.org>; Sun, 02 Jun 2024 08:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717341238; x=1717946038;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pDTs5n0RlYFY/bdkXJAFsJ4FRiknVVcnhiaujlOnNuM=;
        b=B44EMjt4FUsXG+5Uq33Lj6zEgD/jvndNRebArQ2U7gWh5EjEV8Ddyq9CHvLLtKmEyB
         NlfMXi3TVGOYF3alzCDSIhQLAHfMHDD4NYQwRWHQHw51kwA1k3WCnWq9CtTmoGzKzZ1W
         3sfupX5azfvaem2a8AYgKQOh/XtmU0sPby/LH7jRqD0rph80SKsoLhfUhuIybpy7crZM
         hsrxd8xkz9DalM9biN5+v7Ti/gfv0E9NIvhjE3331s2t+DULgdeqbtduU2hOL9tEwBns
         T0G5vmjQdUTLAG1t3G3lNE7ukIvFQ4oaVYLfKgp5ffmCUJce3JVXxl7Lhyt2K1DnfE1C
         2d1w==
X-Gm-Message-State: AOJu0YwkTbymyyu7OWsDTmQhO/1lY1us4ujtCjx4dgPCKZ/gVv84yo37
	k3suy4MAz81OKpgNcx1a0thTyurXer8YkWhiKvtvCK+y07jjkwZ99pxYI9mVWbE=
X-Google-Smtp-Source: AGHT+IHvOztoR2r/cK8imG2blmCrwDfbmeW7pA9mkBVtysufp+cpIqI3RNtgoc7O/L8dTvI5pcFwtg==
X-Received: by 2002:adf:a1cc:0:b0:351:dea5:f808 with SMTP id ffacd0b85a97d-35e0f2762e5mr4911321f8f.26.1717341237610;
        Sun, 02 Jun 2024 08:13:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:b4a:1b00:27a9:133d:633d:5bc9? (2a01cb080b4a1b0027a9133d633d5bc9.ipv6.abo.wanadoo.fr. [2a01:cb08:b4a:1b00:27a9:133d:633d:5bc9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd063012asm6438917f8f.75.2024.06.02.08.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 08:13:57 -0700 (PDT)
Message-ID: <04cff4e6-4c6b-424b-8f27-32e439eabf06@ontake.dev>
Date: Sun, 2 Jun 2024 17:13:56 +0200
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
From: Louis Dalibard <ontake@ontake.dev>
Subject: [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and 4116 on
 ASUS Zenbook 14 OLED (2023) and ASUS Zenbook Pro 14 OLED (2023)
Content-Type: text/plain; charset=UTF-8; format=flowed
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
+ { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 
I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN),
+  HID_BATTERY_QUIRK_IGNORE },
+ { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 
I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN),
+  HID_BATTERY_QUIRK_IGNORE },
   { HID_USB_DEVICE(USB_VENDOR_ID_ELAN, 
USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
    HID_BATTERY_QUIRK_IGNORE },
   { HID_USB_DEVICE(USB_VENDOR_ID_ELAN, 
USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
-- 
2.45.1


