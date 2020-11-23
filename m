Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721CB2C01A7
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 09:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgKWIqs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 03:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59075 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726977AbgKWIqs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 03:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606121206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0EgyJjhX29A+wOUcHgkoovIGjjiENqeDg1JmKe2gpgE=;
        b=cYjiSWwGzEU1FNihmtkEyoIJc0Ck+RjhizFlvPrYCQ5g2DlEBxmsM+bvEeEEBGp2KwC/e5
        nGKp5Hw4qhlR4P4zj6k0DqC4ztBW5jAZ7sMCrxiz0eka3Kjtx1yI4i6NPzSWws6ZeqSsyp
        Ohy+feLko+xDtvV6D9klGBmGOVKM0tA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-RGeY-ydXO3uufDMVjxEfpQ-1; Mon, 23 Nov 2020 03:46:44 -0500
X-MC-Unique: RGeY-ydXO3uufDMVjxEfpQ-1
Received: by mail-ej1-f71.google.com with SMTP id gr9so5390354ejb.19
        for <linux-input@vger.kernel.org>; Mon, 23 Nov 2020 00:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0EgyJjhX29A+wOUcHgkoovIGjjiENqeDg1JmKe2gpgE=;
        b=gjBv75LxfiowxRJSHyHz0jzCDfSDZrIkuqX64Df6CkysLiXnywSS6VILRxGK0ZJIr2
         07wSIZoGU4Mph9m3XdeQ8KC4yfRN3w6OKl/Le6uG7h0GwPcWhGxUUIBSbU+r0HC+uXFa
         eg2a1Ds4LRZ7Fi0sUVHvU1FrIIZG6t4iRGO60zpE4Yoly1xTNT8HarocgdNPOVrq5u1h
         buIdL1Zn3SqPXYy2RnVglbySSV3cNyviR3lOenONJQ2YojxgzTTlLRUYiqOSXgP+aIgx
         qv+H0ieEkGesJHuU500+t2Ne3AE27jnmTPx2P26CFZJEu2xGnRq2E9moUis9Aiv4Wi7f
         qBrQ==
X-Gm-Message-State: AOAM532btlGy1DyMESYXCtWWnvNhml8wwv0M/n2AO7S6E7cbAgELVrye
        c4h+zc3gR31T7UVCus+ywpzhkka/MfGdw0BzfRJbVJbOunE6xZj2II7hlUMpLyKffQm3r/ujsen
        KEZvVskqmqttg/44OSsZoqcE=
X-Received: by 2002:a05:6402:3076:: with SMTP id bs22mr11962045edb.267.1606121203076;
        Mon, 23 Nov 2020 00:46:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxArviIzq7Y2VUTP/v0eMdhI8XczZlTvXdk7SSJlx1EK9GwksDj+tt0vm8gqre0iudxZE2tfQ==
X-Received: by 2002:a05:6402:3076:: with SMTP id bs22mr11962038edb.267.1606121202934;
        Mon, 23 Nov 2020 00:46:42 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id b15sm4545719ejz.114.2020.11.23.00.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 00:46:42 -0800 (PST)
Subject: Re: [PATCH] Input: soc_button_array - add missing include
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20201123061508.GA1009828@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <017e8b75-4913-ca62-db1d-6c137edf650a@redhat.com>
Date:   Mon, 23 Nov 2020 09:46:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123061508.GA1009828@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/23/20 7:15 AM, Dmitry Torokhov wrote:
> This fixes the following build errors:
> 
>   CC [M]  drivers/input/misc/soc_button_array.o
> drivers/input/misc/soc_button_array.c:156:4: error: implicit declaration of function 'irq_set_irq_type' [-Werror,-Wimplicit-function-declaration]
>                         irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
>                         ^
> drivers/input/misc/soc_button_array.c:156:26: error: use of undeclared identifier 'IRQ_TYPE_LEVEL_LOW'
>                         irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
>                                               ^
> 2 errors generated.
> 
> Fixes: 78a5b53e9fb4 ("Input: soc_button_array - work around DSDTs which modify the irqflags")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/input/misc/soc_button_array.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
> index cae1a3fae83a..d14a65683c5e 100644
> --- a/drivers/input/misc/soc_button_array.c
> +++ b/drivers/input/misc/soc_button_array.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/input.h>
>  #include <linux/init.h>
> +#include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
> 

