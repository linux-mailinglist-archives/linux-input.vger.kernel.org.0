Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7E979201
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 19:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbfG2RXi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 13:23:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42630 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfG2RXi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 13:23:38 -0400
Received: by mail-io1-f68.google.com with SMTP id e20so91360395iob.9;
        Mon, 29 Jul 2019 10:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mtFAgnB4JJdhVJsMAimYhvrChXu1VlwiU+snpq6tdyU=;
        b=uWnQn0iO084kQ4gM+zCAh6Cu3wBVnM2CgrsP6W8Xwuk6125qURG3zXbesjjl3a2ppO
         Se6gGRx81grhhuny1AefJ4vLq+EhQyoa+ioF4AhUSoYiJSy7oyXeW9NGPauHa5zrZ+Fu
         Xx3H+jz7lg7HmrLyCEJLo70+ErX69O2XbM5X/Tz/sGDZeBFaoyxWKLAqF686AsVElN3X
         eiSKghlXrTGimZQIzHiuCzMAPMKnLiQPa37YdY+l51vtsegnAS7hQA6xkWt2YYx9LLyV
         dtDhsuJL/rwE+4nqnma32TaRk3w7x2lKBegaH1GQO7Idki7Od02MMH1VGQtsaMVbQU0g
         wGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mtFAgnB4JJdhVJsMAimYhvrChXu1VlwiU+snpq6tdyU=;
        b=W3C13nCjqlNR5vKptBINlJ6KsI1lAm7CEVvsRmb6iUgWr5GQhAbhxdYw58qFlnWng+
         bks3bnGU2Qp5+bXCIyxvtFfAP0FZD7OLTNR5/QCvZmGEr7LgNNdDYik2R0RDqlsEUtrE
         et82vyJZ2RD+HQwSqAj4nogyEx1VQXNtRQh6aQW/LtjIsoaG2YGWdhF/l2z8lp3zlHb/
         zqvdqJcqvOvnYncJqCTEfomEwT3sueec9p5g2oYrJyx37eJedJMSVC2c16SxnxM9QF8x
         vOoXti80VAJDvllSraU50mdX5YVH0Uccj3JyiAN2kNGJzrVpA3BnKSw+Odrrd++yuL1W
         cyNw==
X-Gm-Message-State: APjAAAXZnzIHEN0gJDWV696igkq1Ri3Vm/L2vZWsoeFikVmctPZyGw4z
        5tA3Aw4xwLx9fatVgAEHZWM=
X-Google-Smtp-Source: APXvYqw94/xAf06ftfzUw0ov3sP6F5MxyNXrTaS5/BidIpHj7B1B5oj3I67uF0Zvk56gxctltSvr/g==
X-Received: by 2002:a02:16c5:: with SMTP id a188mr117304586jaa.86.1564421016999;
        Mon, 29 Jul 2019 10:23:36 -0700 (PDT)
Received: from localhost ([8.46.76.96])
        by smtp.gmail.com with ESMTPSA id y20sm51213222ion.77.2019.07.29.10.23.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 10:23:36 -0700 (PDT)
Date:   Mon, 29 Jul 2019 19:23:13 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: misc: soc_button_array: use
 platform_device_register_resndata()
Message-ID: <20190729172313.GA755@penguin>
References: <1564410372-18506-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564410372-18506-1-git-send-email-info@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 29, 2019 at 04:26:12PM +0200, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
> 
> The registration of gpio-keys device can be written much shorter
> by using the platform_device_register_resndata() helper.
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/input/misc/soc_button_array.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
> index 5e59f8e5..f5e148b 100644
> --- a/drivers/input/misc/soc_button_array.c
> +++ b/drivers/input/misc/soc_button_array.c
> @@ -110,25 +110,21 @@ static int soc_button_lookup_gpio(struct device *dev, int acpi_index)
>  	gpio_keys_pdata->nbuttons = n_buttons;
>  	gpio_keys_pdata->rep = autorepeat;
>  
> -	pd = platform_device_alloc("gpio-keys", PLATFORM_DEVID_AUTO);
> -	if (!pd) {
> -		error = -ENOMEM;
> +	pd = platform_device_register_resndata(NULL,

I wonder if we should pass &pdev->dev instead of NULL here to form
proper device hierarchy, now that we have this option.

> +		"gpio-keys",
> +		PLATFORM_DEVID_AUTO,
> +		NULL,
> +		0,
> +		gpio_keys_pdata,
> +		sizeof(*gpio_keys_pdata));
> +
> +	if (IS_ERR(pd)) {
> +		dev_err(&pdev->dev, "failed registering gpio-keys: %ld\n", PTR_ERR(pd));
>  		goto err_free_mem;

Since you did not assign 'error' value here this goto will result in the
function returning 0 even if platform_device_register_resndata() failed.
I'd doing:

	pd = platform_device_register_resndata(NULL, ...);
	error = PTR_ERR_OR_ZERO(pd);
	if (error) {
		dev_err(...);
		goto err_free_mem;
	}

Thanks.

-- 
Dmitry
