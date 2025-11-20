Return-Path: <linux-input+bounces-16256-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11061C7486F
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 15:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AC344348E46
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 14:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7BE33FE2B;
	Thu, 20 Nov 2025 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSum62jL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050833711A
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648530; cv=none; b=eMgrDMiknSwAhKu0Sds8gbpuPsaQcrtX1UY1wqC9OOmb7bWvePy/6HTzi1VbO1kItU8CmRbS6S/ZINkFsrApaI4dfZajeO+C7GQElbatUtK+s6ac6lTi1kEyfLSqIn98xZfN48MvKq0DSgqfuPtURP70XNLxAzfragvYqpMUBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648530; c=relaxed/simple;
	bh=YRVeBBMj7ef056SPY/EQlwP1RflC2jv6harh/WizL7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq1Ye6mh5mXo7cskeAzK7jjHNcYB55+eYIN7XKNLeZN0J/+og5UVYZHcq3MzoIzVwBP9xDKj/5BktiJLCLxd3sl/7+ZSPQUBUWe2kv2yFnuIxw1Njn7jE9cdnvG7i6g2MeVjWGc3Rq4pT6GZ0NvJlTGaWI3xcFVylaB+5Lt5MBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSum62jL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so6389155e9.1
        for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763648527; x=1764253327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6r7fI0WPBuZgy0AO/PTqbLex+cwYpycr4cGAYLGeSOY=;
        b=TSum62jLfRoXkVxdIFpH/dAQgLcP1sbfH3+aSELBdZp5S77VxaH/8oszxlzS+WfKId
         5LM/18KSZtZ2KUymcItaOC+pzr1unYOia+buBTv12VLtlPfts6KwSqEcxB5ZNHIL0x2V
         rh4aT0+SiYzJLSkfXXD1HcNFCj2HkK7nkBRBjhuyrG9iT/rXsbli2mn6D3cNZhmrMxzJ
         7n/DvYt0rSPjEWTZtdeuSae4rGbZmyTMgjl2hAVWTlHxdvpN8ryPP81QSUNC38fuR0bL
         Q/95oFsG49RtfmxlsaTP/1Y15xo4x9dgbgPzUoEUWNSa6yMpxBCHV82Z2+//1kO5vxYJ
         sykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648527; x=1764253327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6r7fI0WPBuZgy0AO/PTqbLex+cwYpycr4cGAYLGeSOY=;
        b=dz6Y6uVj+NzpvJLoi+n9D53j0lsk6V1qBDFwdADBigGb+Ohq6y0xmObYb9xVoSQfEJ
         ZrOA8kUD+e/R4+YuhsLXRqi9dZw7APsVntjHtGDnIkfTwMnZoXXlMwg0SLQ0T/fs7P/0
         jSFq21IrW5I8X04ycr2Hxl6CvMdJIlnaquHKCBEM0Tr+rr1GPpmkVoVPtynVI98jWJQs
         lSRXN+Z/pqr5zVTqmHgj7QJqqFMKknPWpCvxDKQzAxxkp1zXdfgbSA8B/qp7MeVuRZbM
         iKdTEBSCCKyiiItNzWgqAoLcCHMcL3YA/0bKCe/WI9fDNCsEodVExID2X9me5YPiXpB6
         h+Zg==
X-Forwarded-Encrypted: i=1; AJvYcCU4B8F2yaW7OcG3J2oHGxE1Ifpv4VN4C4BxCb7CaoUWCUOKY432Jf+VaGBOoaTMQ5cEzdSb2jxwP3rCOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvwttQS10L7lU92bNE9D6t9CFRLXWPigxFbfdYTc2azoG0INqz
	P46IMBDliZPsVTdMya1ua16BdKesmecAfav9JxC7XHCWi/Phgf9qSrqN
X-Gm-Gg: ASbGncuUoVW+0KR+KKidEmND4iVQ8hmIUl5AHutjqip7kqTcBdQwUunDtsSmtAuyKcM
	zFVRwQh1BFwKgM++nAknwO55Rr7YJZttzaxiDJwNj+YlU4Eg5VFzb1JaL2i91ZSirKkHm2Odi4w
	h9NUcE+C+jGmVRa3n+Lh3kifa3srVT6eY1e9mPvAoC+df8IrINT6tWdaU+Im+qsDnC0JsS3nhBu
	4mXcr3GY5Qa2W7g+EdQ/PDe/itsjhDb80VcmWby3beC0nGfM1OOTh/KTossZcFAnuNa88cOwdNh
	0wD6Bv6rQAkKJxr+FJ9CQztOkMBTuqx/hfNw5HTvfJslpecu6twQuZ5/N/SYFJ21DeTMjgCRq3K
	hjO9k0qB26BLs1rJwHj0si4H/pUXDrFTWJw9YsYzBQt73M45JuHaP0Ij9EW8v+7ahWXjPLd8LVd
	SnQWAan7rZckApPrzIaMDoJXYnaevoLF357w==
X-Google-Smtp-Source: AGHT+IG5vqkGiu0GvlQgoxCMGD0CADTUMG278xB+EOd9IXf28tm4i8blPZUxFfIazh/0hI0Gyggy9w==
X-Received: by 2002:a05:600c:1f86:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-477b8c935d2mr39449735e9.35.1763648527306;
        Thu, 20 Nov 2025 06:22:07 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm5944605f8f.2.2025.11.20.06.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:22:06 -0800 (PST)
Message-ID: <7f10404f-de61-4284-b70a-5f0c839896d1@gmail.com>
Date: Thu, 20 Nov 2025 15:22:06 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/11] HID: asus: add support for the asus-wmi
 brightness handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-12-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251120094617.11672-12-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/20/25 10:46, Antheas Kapenekakis wrote:
> If the asus-wmi brightness handler is available, send the
> keyboard brightness events to it instead of passing them
> to userspace. If it is not, fall back to sending them to it.
>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Tested-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 6a355c174f29..ff5aaebc38e3 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -324,6 +324,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  			 usage->hid & HID_USAGE);
>  	}
>  
> +	if (usage->type == EV_KEY && value) {
> +		switch (usage->code) {
> +		case KEY_KBDILLUMUP:
> +			return !asus_hid_event(ASUS_EV_BRTUP);
> +		case KEY_KBDILLUMDOWN:
> +			return !asus_hid_event(ASUS_EV_BRTDOWN);
> +		case KEY_KBDILLUMTOGGLE:
> +			return !asus_hid_event(ASUS_EV_BRTTOGGLE);
> +		}
> +	}
> +
>  	return 0;
>  }
>  
Reviewed-by: Denis Benato <benato.denis96@gmail.com>

