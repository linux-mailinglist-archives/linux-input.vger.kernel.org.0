Return-Path: <linux-input+bounces-4071-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085F8FAEF2
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 11:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFAD21F25E10
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 09:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415D650A93;
	Tue,  4 Jun 2024 09:35:31 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1250C823BC
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717493731; cv=none; b=o2gwcIu9LKBZ/RVzY8GZCF6Tc3940ATtcxBif/QoyBW1CICEpeGH5PCqkt16evkXa+G0V6aNpuPW8Sdwtb4r2vNrfxiRHZrsSnvcq8U4S60McCzMYgEDqfCcwNjxSza26Tg+3F/fgWbw5RvICnH7V8xm5imze5BeaIUpcNfF6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717493731; c=relaxed/simple;
	bh=SCj4rxQRFJ+yZBbvTTWFs+ED/w7RQDpozfAdlb/XPCc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=kPuH8QHTSnVLFp6/YGjEhmcnT9AxQeal0SVFE1TZNi3soJDr36gIR8x/cqGfK01Srre/DKj/Pb26MgBtErDz9TQS2jr4H3wOGAX5NRqYwr+9KTY7R9dcr8vce00xo743hCne4Dz4WoFPogzCM6rd9LE5yKcAlJL04F24uebzyq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42135a45e2aso24597855e9.3
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 02:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717493726; x=1718098526;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCj4rxQRFJ+yZBbvTTWFs+ED/w7RQDpozfAdlb/XPCc=;
        b=Z1dfr0DS6QVz2nbQlQLsqgqaAHmThzrlDhlAcs+CFNB/bHjjBkxl2CpsgRsQPGGbhg
         wKwPL/jSBvsJZoWggI0A/u7qr662289eTl/hyhw7E+S9v6unIHPtJ6baCROzrKYep8Ff
         2k4fJAemJf+YqS/RurUeUoOqc8kn2Z3zl0qpMcVUBUOK+fOY7PK1Ig5My9khXa3O6rbM
         wWte87x/jmCLDPhwuLmedq6G1GO8/o++MHERIBghTiGw6kDN+2T1HYFMf23vnRZqKw12
         2yoSTaDnInI/QYr0yLy+rsbNEdoL0SOGC85aNInb0FUS+tsjjlDVrQQDLss5moP+1fkP
         q53A==
X-Gm-Message-State: AOJu0YznWVrD5xotFe/Ph2mkGyacN6omWJAUHxZPbtdGPG4e7+lEKBCS
	KiB/FNmrA8GaPqiXKDmoHEmf09xy7HaCqVy5cI6ezRkGDKfF1vBTseeI8A==
X-Google-Smtp-Source: AGHT+IFFNZVCCvIgYS5orhzLZl26tPURRtEbcsjDfch5JpLNaC0ht3cqAKWIPEQ45gsaxl5bfO4Skg==
X-Received: by 2002:a7b:c011:0:b0:421:1d5:c0a3 with SMTP id 5b1f17b1804b1-4212e0a52cemr105286185e9.28.1717493725675;
        Tue, 04 Jun 2024 02:35:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:b6c:d900:a254:51af:8350:d755? (2a01cb080b6cd900a25451af8350d755.ipv6.abo.wanadoo.fr. [2a01:cb08:b6c:d900:a254:51af:8350:d755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212709d336sm176975885e9.37.2024.06.04.02.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 02:35:25 -0700 (PDT)
Message-ID: <e60d4a8b-f6e1-42f0-bcd2-1279cddb62c6@ontake.dev>
Date: Tue, 4 Jun 2024 11:35:24 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Louis Dalibard <ontake@ontake.dev>
Subject: [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and 4116 on
 ASUS Zenbook 14 OLED (2023) and ASUS Zenbook Pro 14 OLED (2023)
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The touchscreen reports a battery status of 0% and jumps to 1% when a stylus is used. The device ID was added and the battery ignore quirk was enabled for it. Signed-off-by: Louis Dalibard --- drivers/hid/hid-ids.h | 2 ++ drivers/hid/hid-input.c | 4 ++++ 2 files changed, 6 insertions(+) diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h index 61d2a21affa2..72d56ee7ce1b 100644 --- a/drivers/hid/hid-ids.h +++ b/drivers/hid/hid-ids.h @@ -423,6 +423,8 @@ #define I2C_DEVICE_ID_HP_SPECTRE_X360_13_AW0020NG 0x29DF #define I2C_DEVICE_ID_ASUS_TP420IA_TOUCHSCREEN 0x2BC8 #define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82 +#define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C +#define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116 #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN 0x2544 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN 0x2706 #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN 0x261A diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c index e03d300d2bac..0d21590e2d2c
100644 --- a/drivers/hid/hid-input.c +++ b/drivers/hid/hid-input.c @@ -377,6 +377,10 @@ static const struct hid_device_id hid_battery_quirks[] = { HID_BATTERY_QUIRK_IGNORE }, { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN), HID_BATTERY_QUIRK_IGNORE }, + { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN), + HID_BATTERY_QUIRK_IGNORE }, + { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN), + HID_BATTERY_QUIRK_IGNORE }, { HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN), HID_BATTERY_QUIRK_IGNORE }, { HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN), -- 2.45.1

