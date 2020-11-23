Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E9A2C0C80
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 14:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgKWNzh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 08:55:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46555 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729939AbgKWNzh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 08:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606139736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9wbzgkT/RaCCbseF/D02neXKbDwiU9qVIhS7u8PK1qE=;
        b=JRrwNew14fm30jX4s3m38BmSsvb2w4HP8FMpSnQ/zNDl/0o4EmDU2Q3JTn4GJA72MOJp9K
        FCzcPSCFCuFxgSi3poTyFphJxa6ZWHHUMXJajyDqlCuN/DATTjejgir5kpWo+Nv/hLCZeN
        L2qRPWoUM7JoxXRaY98UXT+YgcR0g8k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-o2TWyIFYN4i215i9mteZLA-1; Mon, 23 Nov 2020 08:55:34 -0500
X-MC-Unique: o2TWyIFYN4i215i9mteZLA-1
Received: by mail-ej1-f70.google.com with SMTP id 2so5699533ejv.4
        for <linux-input@vger.kernel.org>; Mon, 23 Nov 2020 05:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9wbzgkT/RaCCbseF/D02neXKbDwiU9qVIhS7u8PK1qE=;
        b=HyOb0dyRgLnAK+Vde4s3T0j9auceBMeBbwPakJpPjnFeoSVUXVIKbMaXCT/Gb4t+Cq
         TDCNf/Mlrm2X+ULuSaflgRYXvdQSs7kQIFqw5h6M7Z0InWHaqg+qAfXJ0EkVnH8nodFt
         Eyz584GTUtj5BXXA5EDhKp47UJgEUtXlzo2z4Jaj7pr+oUhKBwtzJf5KI+JPqHi+h1qR
         HxCqCAS/ddx2vAAMQ9ou6aaVNcMpGro0NvUqyPcjRvIJoVI221W/7Zx82BYaIdqio8Oc
         6+WRxDDH1bcBI4Jq+3m1mop6I0cQSQDL5moqh2v9gcNxi1USLO5aCSqkHxG0A6aebq6J
         u7Ow==
X-Gm-Message-State: AOAM531Zn61thduHXPTMuHl0qrPeI63x+8UVjZSt1QbpWwCLI0Q+f+2b
        jI7FYvbZd72LkARq0ITUKFZMpq4fiq1AYmFlqJ3DIbD4c+nIHJ0JC5mjWieDdwMT2KYdzWL3V9O
        BYdysBMNjnf3oY0Dip/g10FfUeGtvR+uxk4okD9eBub8tN3hVNr8t4X3jqs2GilmqKa8q7Rqf58
        U=
X-Received: by 2002:aa7:d54b:: with SMTP id u11mr48703136edr.341.1606139732444;
        Mon, 23 Nov 2020 05:55:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxxuthoP/VmxvtZ863/L01TfPNcXyNpvZjwTg2q14dQKWLJBDJvoXawbr8FCd0Fi+R/012tQ==
X-Received: by 2002:aa7:d54b:: with SMTP id u11mr48703118edr.341.1606139732224;
        Mon, 23 Nov 2020 05:55:32 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id ba7sm4304172edb.55.2020.11.23.05.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 05:55:31 -0800 (PST)
Subject: Re: [PATCH] Input: i8042 - fix error return code in i8042_setup_aux()
To:     Luo Meng <luomeng12@huawei.com>, dmitry.torokhov@gmail.com,
        gustavoars@kernel.org, rajatja@google.com,
        linux-input@vger.kernel.org
References: <20201123133420.4071187-1-luomeng12@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d8684d52-f165-9e29-bd1e-020ac162958e@redhat.com>
Date:   Mon, 23 Nov 2020 14:55:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123133420.4071187-1-luomeng12@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/23/20 2:34 PM, Luo Meng wrote:
> Fix to return a negative error code from the error handling case
> instead of 0 in function i8042_setup_aux(), as done elsewhere in this
> function.
> 
> Fixes: f81134163fc7 ("Input: i8042 - use platform_driver_probe")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Luo Meng <luomeng12@huawei.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/input/serio/i8042.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index 944cbb519c6d..abae23af0791 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -1471,7 +1471,8 @@ static int __init i8042_setup_aux(void)
>  	if (error)
>  		goto err_free_ports;
>  
> -	if (aux_enable())
> +	error = aux_enable();
> +	if (error)
>  		goto err_free_irq;
>  
>  	i8042_aux_irq_registered = true;
> 

