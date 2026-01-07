Return-Path: <linux-input+bounces-16821-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9AACFDCE1
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 14:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B345430019D3
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 13:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EB8314D13;
	Wed,  7 Jan 2026 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njEvySHL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102192D3EC7
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 13:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790981; cv=none; b=ClOagICocIjQRZ0rXTFCbgj3GLEG/Xz4REL7wUPppiceOVWQMZpvHjg0yYuNh1K0IK0gGv+UsZGyiE/TuMTvmlTaRO9FdIknYfw5lrI3i0qCVAdGvTDXGIeiHJS7fXTV6w6QJ6kLaymFqat9SA3Lo5G2LAXcDVCaRzT4AiXIMpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790981; c=relaxed/simple;
	bh=5ZAhfKdfDTBzqyFKH6y+TaZLsAS6/Av4BN3nOh0twxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8QrYdAJ9OevhHgg4pirpJ2hsRsXEtmStVDi4bd9CGHm80qdtwFB/G5PaxTMCbWq5LyXXCyQMgDI6TJd1QyE8cUdjyU5T8tfcAC6e0hvcIIu9Xi38T8sgyxziprSDXQtW21iyqNUjZxOAcVtxXvRhRn6sB1M1dFuzv1/GXQbRLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njEvySHL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477632b0621so12591865e9.2
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 05:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767790978; x=1768395778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sujtGuZpqLdezt4J5mgFU5H6gB9yVmgCqH9wXLYa9Uk=;
        b=njEvySHLft7bOemnZsBQm8yd2SAEzUvwVLxatuC30m/VGV7lePdyHH9Y+iiK79m6ub
         PpIQyGJp0d+H1wb09GVn+ThfQMslhb8iRWMVFqsqDdaTLyHJjuv9YOSN5XFbMYHjPxEv
         EUzXVdxCsYaoSK5pNYGSqMvFO6twfSTgncbjLHHwqCorsBMnpSvvwVMwR2ZuJaKT6agS
         nounxB8x5Rod1ATcE620TWbOmuMusHKewqwEEr26SHphDHvnolaybMqCd+G2L8kvPPvd
         +DVodtKATMUJg5nros3MID50p3RxIALLvwElccnoEksJnWlAL6jMAgQAdhNWq+KKygj0
         OZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790978; x=1768395778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sujtGuZpqLdezt4J5mgFU5H6gB9yVmgCqH9wXLYa9Uk=;
        b=rxMPHSZnvjhrN9bYMFeWGnHH5kI2f+MtaCvpkmyLjZMBUGsSbXXLRcjMgdTLqXiXcW
         OWT7MZ2uJHY/uakVQ6TsqkAzJaHmE7cKQ0kq1fagwIytWuzKUY3BssNJm6J1eKjAyRWD
         fJ5QWo1xRmV3hq5SXe/+cxrh9OIkD+4kQE4nsBLcbLNMAjd+WeXuCehj4csLCCFLhtSb
         fhwSdeiOEV74GoQRNideKsReMnDhdLkWtwOQY0gHu71V5VxSl+vySv91vkMjH0OkmVVu
         iqjkcLWnwjPKRA/F9Cl3IW0i0Nlg+AkhEHtiPcz7lb3pttD01S82GKreWSkwAh/XoQOx
         mbkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5svK0F7jAGJkLH0DsZivS8fT4xkpEW31AFJJIUBDmakCOY3v9F8aQEV3iisiuxjcy5czkHTSALbgZUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+OCIPCKtP9dQwLJVE2FtLmcnt5Noanw2FjuvkE/TbkXZKO+mo
	Z0ihEpaZ0C4lDcZ4hNcgsRatsxJykpT0kVaIyLu1E5cBx7aRKG2HW2I7
X-Gm-Gg: AY/fxX475ioRqGz0txs+45HB6DgzKyfcd3XM+fSl+VNtANGnx22nVLobR6+Ydt8P2mL
	EXMUkpkoGUHM622D8vD5TpqklcYvS45kev/H/g9IulXL8itq/uzcLEQ2Gcgc49lnCNm2x3tOUU+
	5Qu13H0MuMuhp1IAWxGU8DKi8HyQm55+dsenWBomI0kDiJy4h+kQu9abH4nf5qOr26kzlL9VIIC
	+o11pPI0yXIOd8ymOw+YN6zwB7rNFpOqnCAk9T6k6zXbauQ+kdrbYB4IcBb0lNHjZKrobgAzA/E
	jaANHPld7+4/zvh2ybRGiValH+VlZPQEsqbTIWAwQsCrlchtrFoBqF9h0CzFfmCFWSWsxJYlf0k
	h5W18up6muw/pS3Q4fBJJaUF1cwX7OFud+ay1g0BmFu5MHtXdWPlyb9TgiMUnqrJlwdyKpsdAwF
	gjNRcFAoSsE/qAa+UpdlhOqr8=
X-Google-Smtp-Source: AGHT+IHnVoGtOQI0u+xm8Nwl1Ij02g76dw+H2Osp7YMbmsWpPp72XrybIdm4nfAVHiZzrmqBT1o9EQ==
X-Received: by 2002:a05:600c:348f:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-47d84b4113cmr27908605e9.34.1767790978244;
        Wed, 07 Jan 2026 05:02:58 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e180csm10065996f8f.10.2026.01.07.05.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:02:57 -0800 (PST)
Message-ID: <dac51737-cb8d-435b-8793-68c30049ee15@gmail.com>
Date: Wed, 7 Jan 2026 14:02:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] HID: asus: Filter spurious HID vendor codes on ROG
 laptops
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: superm1@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
 <20260107111945.48018-6-sunlightlinux@gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260107111945.48018-6-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/7/26 12:19, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
>
> On Asus ROG G14 and G15 laptops, several HID vendor usage codes (0xea,
> 0xec, 0x02, 0x8a, 0x9e) are sent during normal operation without a clear
> purpose, generating unwanted "Unmapped Asus vendor usagepage code"
> warnings in dmesg.
>
> Add definitions for these codes and filter them out in asus_raw_event()
> to prevent kernel log spam.
>
> Tested on Asus ROG G14/G15 series laptops.
>
> Change-Id: I3f3b3a1e1698c8689e4c57582635435bfeda5990
> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> ---
>  drivers/hid/hid-asus.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index eb14b9d13823b..06cd3d3b74af7 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -57,6 +57,13 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define ROG_ALLY_X_MIN_MCU 313
>  #define ROG_ALLY_MIN_MCU 319
>  
> +/* Spurious HID codes sent by QUIRK_ROG_NKEY_KEYBOARD devices */
> +#define ASUS_SPURIOUS_CODE_0XEA 0xea
> +#define ASUS_SPURIOUS_CODE_0XEC 0xec
> +#define ASUS_SPURIOUS_CODE_0X02 0x02
> +#define ASUS_SPURIOUS_CODE_0X8A 0x8a
> +#define ASUS_SPURIOUS_CODE_0X9E 0x9e
> +
I don't know what's the preferred way to call these, I am happy
with any way.
>  #define SUPPORT_KBD_BACKLIGHT BIT(0)
>  
>  #define MAX_TOUCH_MAJOR 8
> @@ -348,6 +355,21 @@ static int asus_raw_event(struct hid_device *hdev,
>  	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
>  		return -1;
>  	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		/*
> +		 * G14 and G15 send these codes on some keypresses with no
> +		 * discernable reason for doing so. Filter them out to avoid
> +		 * unmapped warning messages.
> +		 */
Pretty much all ASUS laptops do, not just G14 or G15, and it's not
only on keypresses.
> +		if (report->id == FEATURE_KBD_REPORT_ID) {
> +			if (data[1] == ASUS_SPURIOUS_CODE_0XEA ||
> +			    data[1] == ASUS_SPURIOUS_CODE_0XEC ||
> +			    data[1] == ASUS_SPURIOUS_CODE_0X02 ||
> +			    data[1] == ASUS_SPURIOUS_CODE_0X8A ||
> +			    data[1] == ASUS_SPURIOUS_CODE_0X9E) {
> +				return -1;
> +			}
> +		}
> +
>  		/*
>  		 * G713 and G733 send these codes on some keypresses, depending on
>  		 * the key pressed it can trigger a shutdown event if not caught.

