Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A53EE137600
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 19:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgAJS2p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 13:28:45 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36016 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgAJS2p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 13:28:45 -0500
Received: by mail-pj1-f66.google.com with SMTP id n59so1342987pjb.1;
        Fri, 10 Jan 2020 10:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J94Gt2KavJ+92EsuF8j8kbpp+RsCKdBdscQwUnQ304s=;
        b=Vq4SWeGEJHm0vmbrNoikmLoWEjOSMfyGtm/vurBrG0nIDevLPW8eAij0yuj9h7huRt
         y6IF4mGn0jJh3A/jgVKMFYRzblai47NigxwkDL9uhA4lG1xz7viO23gTReokI6HtTBuW
         rYvCc+cnvTduHmmZ/+6dpY9h2hUG575L2HpO02e1OQY9gLIm25GMX74cFgNPhqLaoFT8
         4GGZxKELbkWXjJA+HvtPfPhCNgsswQ2Zq2mH8UVJxR3vNsAfNKSLYTYcp0RXLStKRTUA
         7JSp/RZkAF7I2ZU+49N6Afcobzyjt1fWpw6S3JGLejOobfP/FjO5uhtCdaK7crtoAfUZ
         +CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J94Gt2KavJ+92EsuF8j8kbpp+RsCKdBdscQwUnQ304s=;
        b=BFfkb2vlB6lS4AUSmstJ4Tuq8k5xzfLCOL4Hh+CIgABHq/lHWSojuUC8IvyWn7DEUr
         2UyLodVv5BSpF606uAw+XCTlbV2rf2OIMXPXYt408hddXFAe9csI9/51otTVcVf32GBR
         UIe6M0l38QKwWnEpzVZCfUNJct2ixVvfYr66qDG5EWb74S5tKHy59ZGxb+FNTKcVmoPy
         MeF6VoVX28+CbDFyT0qzMoI9eJNBemMpD4Rdfwi7r2Gu/T3iNBaR6/ORs5cZLUkaKG8+
         K7LEQpbk8kQl+qZ7mF/nb4FTIt9gse7knE/BNNImK/8ijZd1OldvuJ11IznTelAage60
         bjwg==
X-Gm-Message-State: APjAAAV5FFlAm050KoOkrn1L9W35ND7l25zZzyavQjfWZyF2Xf8cy144
        KSLnt6HK7/bGSMUumMbwm6g=
X-Google-Smtp-Source: APXvYqxv/OH8LTfIgw2X+dUqs2IICI+hkk1y93ELAsSn8IVTCqkVeTgPvrm92eMOO1cksCL5wfwXsQ==
X-Received: by 2002:a17:902:868e:: with SMTP id g14mr5960561plo.214.1578680924226;
        Fri, 10 Jan 2020 10:28:44 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v23sm3467360pjh.4.2020.01.10.10.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 10:28:43 -0800 (PST)
Date:   Fri, 10 Jan 2020 10:28:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] input: max77650-onkey: add of_match table
Message-ID: <20200110182841.GT8314@dtor-ws>
References: <20191210100753.11090-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210100753.11090-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 10, 2019 at 11:07:53AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We need the of_match table if we want to use the compatible string in
> the pmic's child node and get the onkey driver loaded automatically.

Do we really need of_match table or adding

MODULE_ALIAS("platform:max77650-onkey");

will work as well?

In general, do we ever instantiate onkey portion from device tree? Or
is it always an MFD cell that is instantiated unconditionally?

> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/input/misc/max77650-onkey.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/misc/max77650-onkey.c b/drivers/input/misc/max77650-onkey.c
> index 4d875f2ac13d..ee55f22dbca5 100644
> --- a/drivers/input/misc/max77650-onkey.c
> +++ b/drivers/input/misc/max77650-onkey.c
> @@ -108,9 +108,16 @@ static int max77650_onkey_probe(struct platform_device *pdev)
>  	return input_register_device(onkey->input);
>  }
>  
> +static const struct of_device_id max77650_onkey_of_match[] = {
> +	{ .compatible = "maxim,max77650-onkey" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max77650_onkey_of_match);
> +
>  static struct platform_driver max77650_onkey_driver = {
>  	.driver = {
>  		.name = "max77650-onkey",
> +		.of_match_table = max77650_onkey_of_match,
>  	},
>  	.probe = max77650_onkey_probe,
>  };
> -- 
> 2.23.0
> 

Thanks.

-- 
Dmitry
