Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A718438926E
	for <lists+linux-input@lfdr.de>; Wed, 19 May 2021 17:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354726AbhESPVu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 11:21:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49401 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354570AbhESPVh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 11:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621437616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y93IWRhBwP44/lcgrro8LL6lNPSXFpHf2RCpb0mg+xA=;
        b=F23LTU3s/IN9fUIMne36q1ZyHXGh2UbOXvbVeqMa0SX/A7F1Ng99lzZhmW4LpcII7kwvJ4
        fNCypqZZyYd5ajf6opDXEMCix5C40gAj+cqIai+DLoSlwzkWD2cAP5GMP+lefPphIN+hvR
        vFWRIVu4M/LeaklfIdV75xV3+x/A3gM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-5T92W5VYOH2IeuRwTPKIVw-1; Wed, 19 May 2021 11:20:14 -0400
X-MC-Unique: 5T92W5VYOH2IeuRwTPKIVw-1
Received: by mail-ej1-f70.google.com with SMTP id la2-20020a170906ad82b02903d4bcc8de3bso3842836ejb.4
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 08:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y93IWRhBwP44/lcgrro8LL6lNPSXFpHf2RCpb0mg+xA=;
        b=mcsK3/iv0KaMEImb3sX44fi2T57vkoZ9F1t6CC0ICJkBlFUB+GY7kQKsLQFbSIAT1B
         w9Z4m7Of+GXPPLUhlPaEn9nYPsFnfUuWBiVEeCWf18+7zPCVVSRJk1NwuaQnetcyxW+L
         KvUaR4AJcx1y8WUiU2Y9GqzYRVnAbLLtDQmzw0yKIYdw0+qsgdA2lRHJIQtk+VOrd2K9
         WFZ1C20HFZW+jmJ2bzZrLY2hh37vxJBSP7uvOfpAougLgADxvp9d96+mt5Tyv0cSFw8+
         RQawLtPuNpczn3GE7UGL6BVjJp9t6Tz1YNlfGvI/rj/SrJ6QmyY+obDDqlX+XTTF1n96
         sS0w==
X-Gm-Message-State: AOAM531bWh5aIUuc4tDBw7rEhmWwC6GkIGL1z+QdVbTcqLR+dJrBzxlj
        B3Q1cOu4GB7W4ClMiDNOStvdYwRJASbJ5wLhDJWkNmTfFxsVTDOwudN4rwDiTC09d3ubmz2QM6C
        CbyuU6lZ7IdeTTo3UC/UuKLk=
X-Received: by 2002:a17:907:781a:: with SMTP id la26mr13172862ejc.435.1621437613767;
        Wed, 19 May 2021 08:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQdT9Vi79t817uASNBRH2GEzjjkHRfBbiYCHaGp6pd7vRMck5GNhzf70pambZQq4h8Mxy49g==
X-Received: by 2002:a17:907:781a:: with SMTP id la26mr13172847ejc.435.1621437613617;
        Wed, 19 May 2021 08:20:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bw26sm12834760ejb.119.2021.05.19.08.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 08:20:13 -0700 (PDT)
Subject: Re: [RFC v2 5/5] platform/x86: touchscreen_dmi: Add info for the
 Mediacom Winpad 7.0 W700 tablet
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Teava Radu <rateava@gmail.com>
References: <20210504185746.175461-1-hdegoede@redhat.com>
 <20210504185746.175461-6-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <387369c5-ea35-c7a8-c0e0-cd52e706e187@redhat.com>
Date:   Wed, 19 May 2021 17:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210504185746.175461-6-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/4/21 8:57 PM, Hans de Goede wrote:
> From: Teava Radu <rateava@gmail.com>
> 
> Add touchscreen info for the Mediacom Winpad 7.0 W700 tablet.
> Tested on 5.11 hirsute.
> Note: it's hw clone to Wintron surftab 7.
> 
> Signed-off-by: Teava Radu <rateava@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'm going to prepare an immutable branch for patches 1-4 of this series
(with patch 2 dropped since I haven't gotten any testing feedback for it).

Since this is an unrelated touchscreen quirk and I want to send it out in the
next pdx86-fixes pullreq for 5.13, I've added this to the pdx86 review-hans
and fixes branches now.

Regards,

Hans


> ---
>  drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index f63d2110e224..40c970908a99 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -1153,6 +1153,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BIOS_VERSION, "jumperx.T87.KFBNEEA"),
>  		},
>  	},
> +	{
> +		/* Mediacom WinPad 7.0 W700 (same hw as Wintron surftab 7") */
> +		.driver_data = (void *)&trekstor_surftab_wintron70_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "MEDIACOM"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "WinPad 7 W10 - WPW700"),
> +		},
> +	},
>  	{
>  		/* Mediacom Flexbook Edge 11 (same hw as TS Primebook C11) */
>  		.driver_data = (void *)&trekstor_primebook_c11_data,
> 

