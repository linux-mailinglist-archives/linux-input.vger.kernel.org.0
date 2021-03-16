Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA6433CAFE
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 02:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhCPBsb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Mar 2021 21:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbhCPBsW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Mar 2021 21:48:22 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADB8C06174A
        for <linux-input@vger.kernel.org>; Mon, 15 Mar 2021 18:48:21 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id bt4so9789579pjb.5
        for <linux-input@vger.kernel.org>; Mon, 15 Mar 2021 18:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WFCZBFMZAbCyI75h2O3xXF80y9jUuK37UXMeAS/f5Ug=;
        b=hT/U8fXsghgM0if/6y6jhX6pSq24mWONXlbC/n3yoJD6y9Q0v7bPPWQ1Ob8uk7a2VH
         XBXbz5KA7VxDD8zzxnMnrsHad6KY4Y2VSktubmncfw1h9EPlOZkOtP/Q9whN/DvaqtRf
         Xtjq9fHTBdYbJgd+Tb3CEkGwhQyQoYQrltGzJMK7yDMxmvpxN0Tioq9jGrN7dCrVCWZ2
         R1M7pqKtxGMA/9lrPwpx78brfzSlS6ZBts3LTSONBbAIsKYYvJGXYdWaJ7lrwJ+2DLoz
         VieYonRhmHqb2+CYUbEbEn7Jl8W1vaMWU7+493b5UBpr9mcsN6NF1IFbbOaHpWjUX+Xl
         5vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WFCZBFMZAbCyI75h2O3xXF80y9jUuK37UXMeAS/f5Ug=;
        b=lMCBaOxWWHYZeGS+CBl1Ogk2XfvcoymrDdUswov4AJpXkJNarGZ5Qul6Y/M5ArvXLn
         DLomrqhd6k0s0HHqQcWQ6OmBdlO9kU5WujgoMgSAjcU1M3g9TuNq9suM09sQz8jUcgJ3
         LbfmXEYZyg58W+ABowQc5WYTlcp8N98K5TdnvX9fovTmwzBU8fOP1xVl4c98vUdOqNeQ
         P0/pXYjTEFKoidJKvl/nFE9t11xOw2zWdmh0u7Nwk07HZ2NJPVj5PtAknCGMjsCNUw8b
         vDoDORRKWRXRL9uB45CMpP9dV8GiLjNRjDKrkEnYYUtgG4B3M2n6SsmTPbPE4kOzEfUd
         gaFA==
X-Gm-Message-State: AOAM531kGaSR6z8rtDnYSb38RpFJdCIjqO/Ekgc+D6fw6yP4kzD7rXZn
        6Dpn/D6p/J1hjXO6rl6Pw5k=
X-Google-Smtp-Source: ABdhPJzai+UG4UZ7oC/Eg61gKXqJf0gm2aMg2bgEmrLTqpkrPf4TyIuNmFDPNQz1v35e/qpnG0DvFw==
X-Received: by 2002:a17:902:904b:b029:e5:5cc5:877d with SMTP id w11-20020a170902904bb02900e55cc5877dmr14390911plz.50.1615859301277;
        Mon, 15 Mar 2021 18:48:21 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c4f3:b674:6a37:83cb])
        by smtp.gmail.com with ESMTPSA id o9sm15413187pfh.47.2021.03.15.18.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 18:48:20 -0700 (PDT)
Date:   Mon, 15 Mar 2021 18:48:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: imx_keypad - convert to a DT-only driver
Message-ID: <YFAOYaPkLjCLBIWy@google.com>
References: <20210315171037.171120-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315171037.171120-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fabio,

On Mon, Mar 15, 2021 at 02:10:37PM -0300, Fabio Estevam wrote:
> i.MX has been converted to a DT-only platform, so make the driver
> depend on OF, remove the CONFIG_OF ifdefery and remove of_match_ptr().
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/input/keyboard/Kconfig      | 1 +
>  drivers/input/keyboard/imx_keypad.c | 4 +---
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 32d15809ae58..bef0c06ef2a9 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -458,6 +458,7 @@ config KEYBOARD_SNVS_PWRKEY
>  config KEYBOARD_IMX
>  	tristate "IMX keypad support"
>  	depends on ARCH_MXC || COMPILE_TEST
> +	depends on OF

ARCH_MXC is a stronger constraint than OF, so I wonder if we really need
this.

>  	select INPUT_MATRIXKMAP
>  	help
>  	  Enable support for IMX keypad port.
> diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
> index 1f5c9ea5e9e5..815b3d11dfbb 100644
> --- a/drivers/input/keyboard/imx_keypad.c
> +++ b/drivers/input/keyboard/imx_keypad.c
> @@ -408,13 +408,11 @@ static int imx_keypad_open(struct input_dev *dev)
>  	return -EIO;
>  }
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id imx_keypad_of_match[] = {
>  	{ .compatible = "fsl,imx21-kpp", },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, imx_keypad_of_match);
> -#endif
>  
>  static int imx_keypad_probe(struct platform_device *pdev)
>  {
> @@ -582,7 +580,7 @@ static struct platform_driver imx_keypad_driver = {
>  	.driver		= {
>  		.name	= "imx-keypad",
>  		.pm	= &imx_kbd_pm_ops,
> -		.of_match_table = of_match_ptr(imx_keypad_of_match),
> +		.of_match_table = imx_keypad_of_match,
>  	},
>  	.probe		= imx_keypad_probe,
>  };

If we truly converting this driver then we should also remove references
to dev_get_platdata() and checks for pdev->dev.of_node from
imx_keypad_probe.

Thanks.

-- 
Dmitry
