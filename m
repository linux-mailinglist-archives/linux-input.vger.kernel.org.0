Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F4B2538A6
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 21:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgHZT5v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 15:57:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59257 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726952AbgHZT5t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 15:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598471867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DXuqJrwfbCwnI98H5NI02hcjDkuIvuf4O5Gqzi6vDmc=;
        b=jP9a2yJk3Uw/8D9N8dAtq3J4xaaKaPop2eZpx+1faaYP2Z1vKiewGfsItApYPiMyvGX3eQ
        uQV+8eGLzi2IJiAV+QdUyj76Y8uSxg1IC2+THODYFCNvSU8uVSO99NjGlBEt9y2EPZXRxP
        Ip6yRZIZrgG1ao/bJRYeSawGmKG1fIA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-3fFgK-15MjmgZ20T7YAQfg-1; Wed, 26 Aug 2020 15:57:46 -0400
X-MC-Unique: 3fFgK-15MjmgZ20T7YAQfg-1
Received: by mail-ej1-f71.google.com with SMTP id fy10so1478717ejb.9
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 12:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DXuqJrwfbCwnI98H5NI02hcjDkuIvuf4O5Gqzi6vDmc=;
        b=FuFJlGFsHa+ux6umzOTiCzs8NScRq9UbEY98xo0/XDZ+qNkHRMgEp6H5wZZY8yTIFP
         /VovcPdiq6QXQE/G47nB3MwR0NywQQHFYkhk58R89h0RpzgTy0G+DHnWto/sKC5EtpXz
         2vTclVz52MeN8G8dCCQlX4xG0WtFADEpFdr0oz7XlJQR+lGsrIuiL3DES80Z+Qro8DUI
         GWX5I5QPh5NQQcsT7W1IM1Y4BmM8AjZODNtzKL4MxaSl2kNyvfcw0IYHM9cEFwtXzE1o
         /uBnVyUWWbxrCabCPY5KXg4br0mcyEU9buVzijSVnb9cOno80OjkYl2qjMBb32NuWA4j
         UZxg==
X-Gm-Message-State: AOAM531+3Qp1InBJQRxfDt92nntPOoTonfGw+DGiYS6IXlk1IXWVhCj6
        Suhi2ijZDhUlmmlr4vyseC+MZqcqZ46gxo6CWmeVpXXWzpl+23JPhkijNGPhDW7r4c64IknM0NX
        wI9yngRWcFa8E8y48qfc4KIU=
X-Received: by 2002:a17:906:c146:: with SMTP id dp6mr14384793ejc.38.1598471864818;
        Wed, 26 Aug 2020 12:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymm84HHrEaEJR60+VZu48mdqNVVXAmjgsvlGr83z6u0tjMLua+wnc0FDeay9ZxJELtATkZ8g==
X-Received: by 2002:a17:906:c146:: with SMTP id dp6mr14384775ejc.38.1598471864635;
        Wed, 26 Aug 2020 12:57:44 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id qk7sm3204480ejb.17.2020.08.26.12.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 12:57:43 -0700 (PDT)
Subject: Re: [PATCH 01/24] Input: bcm-keypad - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20200826181706.11098-1-krzk@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <858aaca7-5648-83a0-6cb4-213c62fee4a6@redhat.com>
Date:   Wed, 26 Aug 2020 21:57:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826181706.11098-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

As someone who has added the if (error != -EPROBE_DEFER) dev_err()
pattern in way too many places myself, I'm quite happy to see this
new (I presume?) helper and this nice cleanup series.

The entire series looks good to me, and you can add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To the entire series.

Regards,

Hans



On 8/26/20 8:16 PM, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/input/keyboard/bcm-keypad.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
> index 2b771c3a5578..1bf71e7c9e0d 100644
> --- a/drivers/input/keyboard/bcm-keypad.c
> +++ b/drivers/input/keyboard/bcm-keypad.c
> @@ -379,11 +379,9 @@ static int bcm_kp_probe(struct platform_device *pdev)
>   	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
>   	if (IS_ERR(kp->clk)) {
>   		error = PTR_ERR(kp->clk);
> -		if (error != -ENOENT) {
> -			if (error != -EPROBE_DEFER)
> -				dev_err(&pdev->dev, "Failed to get clock\n");
> -			return error;
> -		}
> +		if (error != -ENOENT)
> +			return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
> +
>   		dev_dbg(&pdev->dev,
>   			"No clock specified. Assuming it's enabled\n");
>   		kp->clk = NULL;
> 

