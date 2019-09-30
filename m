Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3FCC2A42
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 01:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731806AbfI3XIK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 19:08:10 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41814 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfI3XIK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:10 -0400
Received: by mail-pl1-f194.google.com with SMTP id t10so4489656plr.8;
        Mon, 30 Sep 2019 16:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E983INdsI8HZd9F5u40UdgLm7nSL3Xu0oq9O20W1ovM=;
        b=kUxflo+b7fwRhsVnvWrqhLriEDr+8P3bt3ZJ7+7TvQ977IbX9ezpTONvrjMfgoPvXl
         ST5g15fZVfiSJ6iLENHd9jfIuDCdXmJCwXdhq/viVlmHDYqMSPMbkW6YEjDONXNd6HHn
         UxXDM8YcsNfrT51FZKj7KeEclbCoQfbxKFdafiP4R2/l1k6p5dCJMpNxuhqNd30A6wWS
         Reultuy1M8+f3cJXC676OgDEvVD3IXHxlo+0H88J+9hvHi1u+AJcbvgTHTFQS5DMDany
         VwzaScZqVP+mD7SnBLgoln4JOstO7ayxm2/T9j7fTRutj5+nxQ3f93v40pNzpNq4UjTp
         Vw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E983INdsI8HZd9F5u40UdgLm7nSL3Xu0oq9O20W1ovM=;
        b=L3bYXUteZX+Q+grWvmP8tckix8B1V8SK1FwXpiuc3VWy6ga8/57rGKmMpbeC5O1Z9B
         utRavDv8e36GSj7wdcdcKm3ToApq7TgOg+VpbhDQOHns8hkVenSvherb5RWuccFtPFJy
         whhbvm26eXNGctj1xghj7zTR4pYvopyCqF7S2Br7cAzqSjoS9esqPyh5hlID2iuPM1I1
         HUMQKg+o0ZyV6Zp7A4OVGCkE3O9GNO2uG8lbU+YiPRs2sG873G2zW7JnJRtpar08QKya
         0r5decfovHkGMoNoom+WAdFjJAgvQ8IeBH8MLEN6ws9VXojNnVXSYapDBuhPFHzeGgYm
         Tb8Q==
X-Gm-Message-State: APjAAAXPFf55+iLiRMjl9kpWTCw0cy7CNCQ4uELJcTZy0Q2HyFYguhd8
        HhARDfKSCXt3AAi7fXzBTfw=
X-Google-Smtp-Source: APXvYqyNdIVMLjKtt7WybLk7W8rhaXw9OFx2WNxakfR9vLhuazCchaVvRrr1LHSnFn/Z4XT9tuC/FA==
X-Received: by 2002:a17:902:8d81:: with SMTP id v1mr3737145plo.124.1569884888852;
        Mon, 30 Sep 2019 16:08:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 64sm15434442pfx.31.2019.09.30.16.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 16:08:08 -0700 (PDT)
Date:   Mon, 30 Sep 2019 16:08:06 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, swboyd@chromium.org, mojha@codeaurora.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] input: touchscreen: imx6ul_tsc: Use 'dev' instead of
 dereferencing it repeatedly
Message-ID: <20190930230806.GX237523@dtor-ws>
References: <1569315731-2387-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569315731-2387-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 24, 2019 at 05:02:11PM +0800, Anson Huang wrote:
> Add helper variable dev = &pdev->dev to simply the code.

Do we get any code savings from this?

> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/input/touchscreen/imx6ul_tsc.c | 37 +++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
> index 9ed2588..4555aa9 100644
> --- a/drivers/input/touchscreen/imx6ul_tsc.c
> +++ b/drivers/input/touchscreen/imx6ul_tsc.c
> @@ -361,7 +361,8 @@ static void imx6ul_tsc_close(struct input_dev *input_dev)
>  
>  static int imx6ul_tsc_probe(struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
>  	struct imx6ul_tsc *tsc;
>  	struct input_dev *input_dev;
>  	int err;
> @@ -369,11 +370,11 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  	int adc_irq;
>  	u32 average_samples;
>  
> -	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
> +	tsc = devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
>  	if (!tsc)
>  		return -ENOMEM;
>  
> -	input_dev = devm_input_allocate_device(&pdev->dev);
> +	input_dev = devm_input_allocate_device(dev);
>  	if (!input_dev)
>  		return -ENOMEM;
>  
> @@ -389,14 +390,14 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  
>  	input_set_drvdata(input_dev, tsc);
>  
> -	tsc->dev = &pdev->dev;
> +	tsc->dev = dev;
>  	tsc->input = input_dev;
>  	init_completion(&tsc->completion);
>  
> -	tsc->xnur_gpio = devm_gpiod_get(&pdev->dev, "xnur", GPIOD_IN);
> +	tsc->xnur_gpio = devm_gpiod_get(dev, "xnur", GPIOD_IN);
>  	if (IS_ERR(tsc->xnur_gpio)) {
>  		err = PTR_ERR(tsc->xnur_gpio);
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>  			"failed to request GPIO tsc_X- (xnur): %d\n", err);
>  		return err;
>  	}
> @@ -404,28 +405,28 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  	tsc->tsc_regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(tsc->tsc_regs)) {
>  		err = PTR_ERR(tsc->tsc_regs);
> -		dev_err(&pdev->dev, "failed to remap tsc memory: %d\n", err);
> +		dev_err(dev, "failed to remap tsc memory: %d\n", err);
>  		return err;
>  	}
>  
>  	tsc->adc_regs = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(tsc->adc_regs)) {
>  		err = PTR_ERR(tsc->adc_regs);
> -		dev_err(&pdev->dev, "failed to remap adc memory: %d\n", err);
> +		dev_err(dev, "failed to remap adc memory: %d\n", err);
>  		return err;
>  	}
>  
> -	tsc->tsc_clk = devm_clk_get(&pdev->dev, "tsc");
> +	tsc->tsc_clk = devm_clk_get(dev, "tsc");
>  	if (IS_ERR(tsc->tsc_clk)) {
>  		err = PTR_ERR(tsc->tsc_clk);
> -		dev_err(&pdev->dev, "failed getting tsc clock: %d\n", err);
> +		dev_err(dev, "failed getting tsc clock: %d\n", err);
>  		return err;
>  	}
>  
> -	tsc->adc_clk = devm_clk_get(&pdev->dev, "adc");
> +	tsc->adc_clk = devm_clk_get(dev, "adc");
>  	if (IS_ERR(tsc->adc_clk)) {
>  		err = PTR_ERR(tsc->adc_clk);
> -		dev_err(&pdev->dev, "failed getting adc clock: %d\n", err);
> +		dev_err(dev, "failed getting adc clock: %d\n", err);
>  		return err;
>  	}
>  
> @@ -439,18 +440,18 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  
>  	err = devm_request_threaded_irq(tsc->dev, tsc_irq,
>  					NULL, tsc_irq_fn, IRQF_ONESHOT,
> -					dev_name(&pdev->dev), tsc);
> +					dev_name(dev), tsc);
>  	if (err) {
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>  			"failed requesting tsc irq %d: %d\n",
>  			tsc_irq, err);
>  		return err;
>  	}
>  
>  	err = devm_request_irq(tsc->dev, adc_irq, adc_irq_fn, 0,
> -				dev_name(&pdev->dev), tsc);
> +				dev_name(dev), tsc);
>  	if (err) {
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>  			"failed requesting adc irq %d: %d\n",
>  			adc_irq, err);
>  		return err;
> @@ -484,7 +485,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  		tsc->average_select = ilog2(average_samples) - 2;
>  		break;
>  	default:
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>  			"touchscreen-average-samples (%u) must be 1, 4, 8, 16 or 32\n",
>  			average_samples);
>  		return -EINVAL;
> @@ -492,7 +493,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  
>  	err = input_register_device(tsc->input);
>  	if (err) {
> -		dev_err(&pdev->dev,
> +		dev_err(dev,
>  			"failed to register input device: %d\n", err);
>  		return err;
>  	}
> -- 
> 2.7.4
> 

-- 
Dmitry
