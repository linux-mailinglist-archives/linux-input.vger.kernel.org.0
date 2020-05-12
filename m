Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EF91CFFAF
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 22:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729029AbgELUo1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 16:44:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34437 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725950AbgELUo1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 16:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589316266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JWD5Dd3qdnd3hR0WoRTP9cJneb70+5LZUFK7dC5hbdk=;
        b=I3PIfKfBYJV1Mp+mh2vZD1oq8jiSM+7hxGkzosDHN17qAJAw28HSLw/of6w15hqj+gfkSN
        +mOJyjLrxiqefHkSm+73usD9DnstHqyefwb41LbTj4mF71TrP/gex7x+UP8vasKJksSrwR
        1QpzHMyhoEfykuBo73/IzG4K1w8FogI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-9GB0dlxANIyTbnRjSPM1aw-1; Tue, 12 May 2020 16:44:24 -0400
X-MC-Unique: 9GB0dlxANIyTbnRjSPM1aw-1
Received: by mail-wm1-f71.google.com with SMTP id g10so3573024wme.0
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 13:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JWD5Dd3qdnd3hR0WoRTP9cJneb70+5LZUFK7dC5hbdk=;
        b=cCqAcXvHt6Rtlup3IneVXiSizAvxFo2lEmobIhffQ9UFUc0dZ2bf/sHfQNG4peurht
         oId6p6N3iuB11IjzbfxNdpODy8XeD0zO8gBDxeYv6G+4IVLol5Pn1TLWSdxWEuFf6RFv
         YWMLAulW3vvS8waZM9qEFGxX68VYfPgkem74clJH8i5Wq5tNKubtJigfQwOrbWpmohDw
         jl7pnIL+KsSZDVVjYg9YAXURAxi4EHUaLxCRYKVFXo7VN5V5dMu9CAU/Ex5tXpKnPFxg
         +1yoxaHE/3K944EhX/tRWj/ehTMj0TB6Fr+zF8a5EwKAuXNhWqUdI1R2nzPu5CUcFZKD
         NHLw==
X-Gm-Message-State: AGi0PuZYDWrzcau885eYCm2B+5DmNYzcmvGWWaTl3460Gh1et1WEKnTB
        ePUQRcVsdGzNgrTCjm7uY5htAa1A+rjwVd4i1dY53qz8wq6aojN1aoNGpkgOG+nNzbHazEsoCvo
        2zd5BFUnds4scdc2U4K4OVbQ=
X-Received: by 2002:a7b:c253:: with SMTP id b19mr18692131wmj.110.1589316263214;
        Tue, 12 May 2020 13:44:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypLwik42iK8SvRPpjsRnKaBPvW26zAqILZ1Qo1F56XTIXKAVuSXkOjKmVqcugNiWhHKZ2KxiqQ==
X-Received: by 2002:a7b:c253:: with SMTP id b19mr18692056wmj.110.1589316262043;
        Tue, 12 May 2020 13:44:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id w10sm25328869wrg.52.2020.05.12.13.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2020 13:44:21 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Yourbook C11B
To:     =?UTF-8?Q?Bernhard_=c3=9cbelacker?= <bernhardu@mailbox.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Otmar Meier <otmarjun.meier@nexgo.de>
References: <20200512204009.4751-1-bernhardu@mailbox.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
Date:   Tue, 12 May 2020 22:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200512204009.4751-1-bernhardu@mailbox.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/12/20 10:40 PM, Bernhard Übelacker wrote:
> Add touchscreen info for the Trekstor Yourbook C11B. It seems to
> use the same touchscreen as the Primebook C11, so we only add a new DMI
> match.
> 
> Cc: Otmar Meier <otmarjun.meier@nexgo.de>
> Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
> Signed-off-by: Bernhard Übelacker <bernhardu@mailbox.org>

Thank you, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 6ec8923dec1a..d87315892458 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -1106,6 +1106,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>   			DMI_MATCH(DMI_BIOS_VERSION, "TREK.G.WI71C.JGBMRBA05"),
>   		},
>   	},
> +	{
> +		/* Trekstor Yourbook C11B (same touchscreen as the Primebook C11) */
> +		.driver_data = (void *)&trekstor_primebook_c11_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "YOURBOOK C11B"),
> +		},
> +	},
>   	{
>   		/* Yours Y8W81, same case and touchscreen as Chuwi Vi8 */
>   		.driver_data = (void *)&chuwi_vi8_data,
> 

