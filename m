Return-Path: <linux-input+bounces-4072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 878748FAF04
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 11:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 268F2B21986
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 09:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019BD15E97;
	Tue,  4 Jun 2024 09:39:00 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D61448E4
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717493939; cv=none; b=OLynR2PUZveJZStBwBUK4CE21RK9B3sPXAo95W93EPWPDK4bLpY+ohmFLjbfLgWw/qbt8M+09BCUSy68nsaMJUTB/idoKTgnNhgO8XNLanRq9k/AMEkL02xGQYls+Xr1EAM+1Cihc2Udb6Z8PPrUaozbw5vombu9lDKJl+kjTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717493939; c=relaxed/simple;
	bh=SCj4rxQRFJ+yZBbvTTWFs+ED/w7RQDpozfAdlb/XPCc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=fkKQ/8oMvLSLtnjYgPZFhbd0eR7y+kE8PeIaETUVvTRJI3of8Cbqwin8b5tPl1AJ9S8+L4xM19nYV8+GKvZLSB7HiV5b0+5mWN2WlP+KaTe+XqkakvWD7Rj3Bs6X4TGworrAvg7yijjxwQw0x18mk0ueJJphNnaPKIqOJ3DPqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ontake.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354be94c874so4385496f8f.3
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 02:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717493935; x=1718098735;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCj4rxQRFJ+yZBbvTTWFs+ED/w7RQDpozfAdlb/XPCc=;
        b=om8K2d+vRsn+8wEE3oE5h8HudZZpgYe+VyLsDUc/EqRri6pd5jvMcKucNVPM/CG23H
         jeaSbmOl60a+ODC8YMoGac+02mMC7DIjIFVYR3MX/sYHZLekLuGnLEa3DShexPrLyLVV
         bMXf455vmUJLppHMHJyVznbzvJObrEYb5K3bLakbcM0O0unQFu5yKLgmjlfPs5rpZ7rP
         2iPDWhVUY+XfQ4uiobVEcKBrwKRoQpQmGhbgE01vE0bRlwZoYw8OLHOk2JxLXqvbCe8B
         CDirA54L7cFY+QtwOA4T3SGG6tinZqXwK86LfrPEU2uwzcVTU4fhuFXDthMdwl7uaAHi
         AqXA==
X-Gm-Message-State: AOJu0YzxEVYUHIPQGXfgW4wgrfgz6JE6JZPWIQTSyXa/pPIAhoKfoNyO
	KN5VA7GgQr+RjrWUmNeNI8EdbggU76ngtI26jOIz2f1gWilvOW8q1P+vnA==
X-Google-Smtp-Source: AGHT+IHsejuoda9rmjJJ1Q1X1zGdRuA4lmNwHsF3eze/Tj9MKfpy4QXZ9AqzsqK/kBPMNWnhzrh51g==
X-Received: by 2002:a5d:5229:0:b0:34d:95f:c46 with SMTP id ffacd0b85a97d-35e0f32d5c4mr8877062f8f.59.1717493934991;
        Tue, 04 Jun 2024 02:38:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:b6c:d900:a254:51af:8350:d755? (2a01cb080b6cd900a25451af8350d755.ipv6.abo.wanadoo.fr. [2a01:cb08:b6c:d900:a254:51af:8350:d755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04da29csm10994658f8f.55.2024.06.04.02.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 02:38:54 -0700 (PDT)
Message-ID: <30a4a4f6-4e1b-4b37-a9f1-98ed1de634d1@ontake.dev>
Date: Tue, 4 Jun 2024 11:38:54 +0200
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

