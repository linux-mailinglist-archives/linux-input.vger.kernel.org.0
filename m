Return-Path: <linux-input+bounces-2763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC01895167
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 13:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BEFF1F24BFB
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 11:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B42360DFB;
	Tue,  2 Apr 2024 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LpBg3Ag5"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFEF604BB
	for <linux-input@vger.kernel.org>; Tue,  2 Apr 2024 11:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712055979; cv=none; b=bA8DN5oo13MmVhJxSaPXTXp46tZVgzHGAsA3tvSYnbJ+FfCbz76yB3V8QwM2ROfql0JOnDwy0pQImnkZ1JOUfXxGPA3nai5FQs3DCDOznj/YwQP5YlABuicqHFYqijAN4s6KQfuJhW5Hs+yJN9EN1JR47iLh+l73Im9d0ISWGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712055979; c=relaxed/simple;
	bh=AOE6FoMHxMVDpB6F8itjur/lrm5+16g1tUAHfVKMngk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDMZQ0LBaRPsfZLFwTa057mabeTKbHlNAPUTYWODwF3Q+lrezSGAkoqU1r2eBVn/MkG8F2XJ3+fPKXpoGF6FWTfmr+EfFWGTCD5IlVdgY78JZHAnmPAa4O48VOhEZsIynRrxuUfH479eU5U/rlKHs+0b4wXOuOqVndCwBvl0uXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LpBg3Ag5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712055976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiHt7DLNLtDx/yJIjLjIAtXPfQ/QLtKuV2p5gHMfyAo=;
	b=LpBg3Ag5Qt4e8XfGopNJvf/1eqT4o7NBUfOv+X5MFs4Ft+XTF1SyIphP0Iq+fIWrtg18Uc
	vJcFlOxWjSIAiTdHh4gi18hAIJfrymwaqEKAzwAUiCpamTDlhCHUrXNgmGZkpAo3I8YXJH
	fAH3U2Rct+WupDm2nANjCWS/aO2HXFQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-wlujEEkQOKCIvoKkunSx_A-1; Tue, 02 Apr 2024 07:06:14 -0400
X-MC-Unique: wlujEEkQOKCIvoKkunSx_A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-56c1b105949so3605507a12.3
        for <linux-input@vger.kernel.org>; Tue, 02 Apr 2024 04:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712055973; x=1712660773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiHt7DLNLtDx/yJIjLjIAtXPfQ/QLtKuV2p5gHMfyAo=;
        b=fRPFa8VK9Zruk2Pc+CqMAEJlOGzmKghxKV3dW4xHh6SJ6mmAq4n4YMJbQUK1F9ZhSm
         KIO+Soq5kk4raH7SoXHyg+LWoPNyKBnxg2+g4t4xLMq7pvxbcMAvMKiy9XNdTEdulvkR
         c/6ZP+S0qtiBIzoPSa0Fs9X5rd9+09ztf4Jv5AtiwisVqwIV/e+RgHprQ+0BB3HFLsqj
         RlTPOQiLF6GwYhIiTpw7JGcsWpfPQXCm3oTLnvhvZeO1sSVdFHJNWZXDlKa16KdA+rJI
         DqSbiPhflehILBOSicuzUO/aYPeL53/gxYR2hgODEmrVhvOrXB1iu+ksorOyhPhl4wBr
         REig==
X-Forwarded-Encrypted: i=1; AJvYcCXXc8fGTrcPAQ6WmlwrCi7qqLEwpS4VYJnCDqzbEjkEbDd/Kwf78XxdGQRQm38+7GDYTdJbZgBLTKNQm6Rabzjj94nXKiDO0T0bdWo=
X-Gm-Message-State: AOJu0Yzm2Q8BIS138tf73MUm1RnY2wj5vdLvqbZGCMMUFRkN0zJu9Mb/
	dzcx9FUFf07TmIyGdXqvxCqOR95UXJ2NvI8pnWU057414f5pwcwS1jhiMDU+CSVqC/D4aX1O88V
	98lkPDjDFzJwktscZsLedXnDthOTIf+LqTtzNH2WT6mq6tdDjgPPMI8s4OMGq
X-Received: by 2002:a50:c31e:0:b0:56d:c873:8dab with SMTP id a30-20020a50c31e000000b0056dc8738dabmr4701771edb.17.1712055973682;
        Tue, 02 Apr 2024 04:06:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2zPC+ltgPSaTQ+mfprKQZdPfDG+hreQd85aTN9vUKkXtar1vAeFy00ZcV3pckjQN1UfJ5aQ==
X-Received: by 2002:a50:c31e:0:b0:56d:c873:8dab with SMTP id a30-20020a50c31e000000b0056dc8738dabmr4701756edb.17.1712055973330;
        Tue, 02 Apr 2024 04:06:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b0056bf7f92346sm6765040edx.50.2024.04.02.04.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 04:06:12 -0700 (PDT)
Message-ID: <391c60a4-b86f-48e4-ba64-abdcb79d71ef@redhat.com>
Date: Tue, 2 Apr 2024 13:06:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: i2c-hid: Revert to await reset ACK before reading
 report descriptor
Content-Language: en-US, nl
To: Kenny Levinsen <kl@kl.wtf>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240331182440.14477-1-kl@kl.wtf>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240331182440.14477-1-kl@kl.wtf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kenny,

Sorry for causing this regression and thank you for your fix.

One small remark comment below. In the hope of getting this merged
soon I'll prepare a v3 addressing this myself (keeping you as the author).

On 3/31/24 8:24 PM, Kenny Levinsen wrote:
> In af93a167eda9, i2c_hid_parse was changed to continue with reading the
> report descriptor before waiting for reset to be acknowledged.
> 
> This has lead to two regressions:
> 
> 1. We fail to handle reset acknowledgement if it happens while reading
>    the report descriptor. The transfer sets I2C_HID_READ_PENDING, which
>    causes the IRQ handler to return without doing anything.
> 
>    This affects both a Wacom touchscreen and a Sensel touchpad.
> 
> 2. On a Sensel touchpad, reading the report descriptor this quickly
>    after reset results in all zeroes or partial zeroes.
> 
> The issues were observed on the Lenovo Thinkpad Z16 Gen 2.
> 
> The change in question was made based on a Microsoft article[0] stating
> that Windows 8 *may* read the report descriptor in parallel with
> awaiting reset acknowledgement, intended as a slight reset performance
> optimization. Perhaps they only do this if reset is not completing
> quickly enough for their tastes?
> 
> As the code is not currently ready to read registers in parallel with a
> pending reset acknowledgement, and as reading quickly breaks the report
> descriptor on the Sensel touchpad, revert to waiting for reset
> acknowledgement before proceeding to read the report descriptor.
> 
> [0]: https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/plug-and-play-support-and-power-management
> 
> Fixes: af93a167eda9 ("HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the report-descriptor")
> Signed-off-by: Kenny Levinsen <kl@kl.wtf>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 2df1ab3c31cc..72d2bccf5621 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -735,9 +735,12 @@ static int i2c_hid_parse(struct hid_device *hid)
>  	mutex_lock(&ihid->reset_lock);
>  	do {
>  		ret = i2c_hid_start_hwreset(ihid);
> -		if (ret)
> +		if (ret == 0)
> +			ret = i2c_hid_finish_hwreset(ihid);
> +		else
>  			msleep(1000);
>  	} while (tries-- > 0 && ret);
> +	mutex_unlock(&ihid->reset_lock);
>  
>  	if (ret)
>  		goto abort_reset;

The abort_reset label here and in other places now is no longer
necessary. i2c_hid_start_hwreset() (on error) and i2c_hid_finish_hwreset()
(regardless of error or not) always clear I2C_HID_RESET_PENDING.

And we only do "goto abort_reset;" here and in 2 other places
below in a "if (ret) {}" branch, and abort_reset itself is:

abort_reset:
        clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
        if (ret)
                goto out;

Since the reset loop now always exits with I2C_HID_RESET_PENDING
cleared, the clear_bit() is not necessary after your changes and
ret != 0 is always true when doing goto abort_reset so
"goto abort_reset" can be replaced with "goto out" or if there is
nothing to cleanup with a simple "return ret".

As mentioned above I'll post a v3 with this addressed myself,
so that we can hopefully get the fix upstream soonest.

Regards,

Hans









> @@ -767,16 +770,8 @@ static int i2c_hid_parse(struct hid_device *hid)
>  		}
>  	}
>  
> -	/*
> -	 * Windows directly reads the report-descriptor after sending reset
> -	 * and then waits for resets completion afterwards. Some touchpads
> -	 * actually wait for the report-descriptor to be read before signalling
> -	 * reset completion.
> -	 */
> -	ret = i2c_hid_finish_hwreset(ihid);
>  abort_reset:
>  	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> -	mutex_unlock(&ihid->reset_lock);
>  	if (ret)
>  		goto out;
>  


