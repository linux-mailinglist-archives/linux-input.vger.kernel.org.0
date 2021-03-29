Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A1134D7D0
	for <lists+linux-input@lfdr.de>; Mon, 29 Mar 2021 21:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC2TLR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Mar 2021 15:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbhC2TLG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Mar 2021 15:11:06 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53541C061574;
        Mon, 29 Mar 2021 12:11:06 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id h20so4873596plr.4;
        Mon, 29 Mar 2021 12:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0Hu6mwHB1UFgXMF4A5yjML93mVMTtYs/OXtImgSyrj8=;
        b=BIpW5efjQK2c9Djv8qZpH+pyBLcvac1+TJsJWK+G46zZCj8SaqdFc+N6kt/XAipu/q
         wuRE9GYetO68OdrkZfNYfRqESqJV5bVA+B6D7XAxNmukKUYnxjxiQ0wueSss5rQCdOUJ
         fFy1ScGyCU4SD7cswezYbrOu1VOfTcArZoEB1Whe9XykJPFRez6JDZAZvCMezaOJHwHL
         Ir5ZCnzwhuSPbjLVuJT9zyJIBb+DNYxByBSZ43kAmA/+HxFc4pyArRwNRjjh4WKnw1p0
         GHGLSiNt9U4U085FibhwZA1WC2mJoPUlnaSrhX/kwEtsfBParPhlwnpfAKslIfR8eSu4
         kDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Hu6mwHB1UFgXMF4A5yjML93mVMTtYs/OXtImgSyrj8=;
        b=IoUxbOI2uYdy6a99gbdaYxtmPvTc22iDzGrlk7a78+FIhuF85p0nPfvQI5QLHS572O
         Lu1W5YDV0Yt4Ipaajyug85fEXZdv2ahm/YD3HECTqgY09IWEA8Wz5Tz8B/+uErtKOck2
         veDAuvSMxH9lbPSv4oBldk/aF5mxas6xfNIDAv4NtxJ8+GmJAc3UsrhcVj1FqWR3kmJn
         OQ3RscfCnbS5eNV7xZXlGIBQAD2wEJpe3MO+xUp0Wdb6ih2cHikdL+H9z13TDTao6w1T
         yfS814Zod5pkUM1qq+5U2E6bLsg586V+O+sWZhmZY1SQpY2wvSEmz/WnpkNGCZDbMIGb
         JSvA==
X-Gm-Message-State: AOAM533k/Yn17PHDEh6t8dYfOP+2pGsFFjR3iV6GUu7mo7SVyHUhjL4q
        xbmGYwPog/4yt7fugwoscGU=
X-Google-Smtp-Source: ABdhPJzk8EW0Jkty8e1A/JNEKk0r50r4jxGPSzUNxd/LPSvMGNpHlgkqvijuHK6Znv/Ur+mhLheXbw==
X-Received: by 2002:a17:90a:4894:: with SMTP id b20mr634238pjh.50.1617045065867;
        Mon, 29 Mar 2021 12:11:05 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a82a:a913:988c:7480])
        by smtp.gmail.com with ESMTPSA id d21sm13329729pgj.62.2021.03.29.12.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:11:04 -0700 (PDT)
Date:   Mon, 29 Mar 2021 12:11:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v4 03/10] Input: wacom_i2c - Add device tree support to
 wacom_i2c
Message-ID: <YGImRiUexkjNVKbX@google.com>
References: <20210326015229.141-1-alistair@alistair23.me>
 <20210326015229.141-3-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326015229.141-3-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Thu, Mar 25, 2021 at 09:52:23PM -0400, Alistair Francis wrote:
> Allow the wacom-i2c device to be exposed via device tree.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
> v4:
>  - Avoid unused variable warning by not using of_match_ptr()
> 
>  drivers/input/touchscreen/wacom_i2c.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 1afc6bde2891..eada68770671 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <asm/unaligned.h>
>  
>  #define WACOM_CMD_QUERY0	0x04
> @@ -262,10 +263,17 @@ static const struct i2c_device_id wacom_i2c_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
>  
> +static const struct of_device_id wacom_i2c_of_match_table[] = {
> +	{ .compatible = "wacom,generic" },

No, "generic" is not something we want in device tree binding. What is
the version of the controller used in your device? Put it instead of
"generic". Or if you know the earliest model with this protocol then it
can be used.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
> +
>  static struct i2c_driver wacom_i2c_driver = {
>  	.driver	= {
>  		.name	= "wacom_i2c",
>  		.pm	= &wacom_i2c_pm,
> +		.of_match_table = wacom_i2c_of_match_table,
>  	},
>  
>  	.probe		= wacom_i2c_probe,
> -- 
> 2.31.0
> 

Thanks.

-- 
Dmitry
