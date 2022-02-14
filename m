Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA6F4B5DF8
	for <lists+linux-input@lfdr.de>; Mon, 14 Feb 2022 23:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbiBNW5B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 17:57:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbiBNW5B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 17:57:01 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5D3184E55
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 14:56:52 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso726058pjt.4
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 14:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WxyH4tUCY88KP70FGvZFs5AOYDiGI1bk+dSXRWZ6Azo=;
        b=GvWBE+6Vu64tEQ1KZVvFQsTMjK3gSOzQA8gTVOEhLCGdVVsTSYDfu31q/qprhjVQSS
         ujv+Dpq2O61nvC35vCkELIUjszxWhM5kGX0SHR344H8sQkcNrcHbuKMelDVyqzgzUJKH
         qjY95Ez4oCMezW90xnUPs0MmVXDjdeb72XeiBneQvkPYRU412XS2iNMmBt1s8I4fIikw
         yNGU1M6y6kQSbSgQluT3Y/ATTHDtSJPpK4idS9HRpjLhtns5CyWy2ya6yICqQ/h+EtnH
         gFTvJW4w1l/mMNXxqxKG6nf1Qk7aopW05ssYAniZlY0cmMNM5A8H9sLuL9Aj8R7UJC0s
         8Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WxyH4tUCY88KP70FGvZFs5AOYDiGI1bk+dSXRWZ6Azo=;
        b=iT4E+0zuUpxnHH9DyiFcjDqKs1Yp0gvSCEO9Urg5z3IKWHIigMpOfIG+yJ8A35Tq5+
         Nunt0k5jmDzI8nx4IpQvooUCaLtSdLMbDKINch5AFNlnhje7JNhGItsnq0AV3Uvi77bT
         3PwgHht5hAtOSvatQqW3ADQzZmV0k+1pZL8m5V7t+q4pLVUtYCsD4kyv4eBw01qnxQx7
         /mwmbuGrYZUXX469UU60ylk4uViZh7dVZmv8lJXhq63gVFkPshiZnxfc1gfJJaQqKN/8
         kfLuNCNdQ4wS3ptNvErQEdBigS9KI9fJWBzb8roBgpwDnmPir2vL4BCkqpXIHxhUp4+o
         cvcQ==
X-Gm-Message-State: AOAM532AIObdUygm/lITUR4Zt78YxFFdoV/+tH3DW1K69Q3A+5FBbazv
        n55KlTxxo0j9ptC5IyEUbEgDmyWkp6c=
X-Google-Smtp-Source: ABdhPJxqbWPoqY/rFgYAWJBXCtH0bWIWtRzjs6Ozoa+pZ7j2NP5KYCEYnaFFv8VCSn/jeP7N87zvAQ==
X-Received: by 2002:a17:902:a9c1:: with SMTP id b1mr1102494plr.45.1644879411912;
        Mon, 14 Feb 2022 14:56:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:fffe:8570:13af:4c81])
        by smtp.gmail.com with ESMTPSA id oj10sm15717812pjb.7.2022.02.14.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 14:56:51 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:56:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH] Input: zinitix - Add BT404 compatible string
Message-ID: <YgreMDuxQLKoKmo7@google.com>
References: <20220213225235.812864-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220213225235.812864-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus, Nikita,

On Sun, Feb 13, 2022 at 11:52:35PM +0100, Linus Walleij wrote:
> This driver works just fine with the BT404 version of the touchscreen
> as well. Tested on the Samsung GT-I8160 (Codina) mobile phone.

What about all other compatibles that we added to the binding document?
Do we need to prune them or add them to the driver?

> 
> Cc: Nikita Travkin <nikita@trvn.ru>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/input/touchscreen/zinitix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index b7a9c3cbe0b2..dff24899855b 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -626,6 +626,7 @@ static SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_suspend, zinitix_resume);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id zinitix_of_match[] = {
> +	{ .compatible = "zinitix,bt404" },
>  	{ .compatible = "zinitix,bt532" },
>  	{ .compatible = "zinitix,bt541" },
>  	{ }
> -- 
> 2.34.1
> 

Thanks.

-- 
Dmitry
