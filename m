Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBB3EB06
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 21:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbfD2ToL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 15:44:11 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36063 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729054AbfD2ToL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 15:44:11 -0400
Received: by mail-pl1-f195.google.com with SMTP id w20so4950733plq.3;
        Mon, 29 Apr 2019 12:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p5mxYOCzDmHqTOVVnNaJuODiMrhAeGsShY3hmafnUYA=;
        b=QHvJstQqhGiOqrKZrS+A+UZeIxkbiwVuon/jyLvsokkJFE1dzEBMxeacDKICj3h32v
         +TnOzGeqGojGIPmJSdqq9S1J7gMFlhc+hoKl3Bm9FZko9yt7s2oLTIZR6A9QjjWeUZcs
         DekWAd8mLRjQC3Xeea7OE5ovNFPzfKlDVNOV4lMT3Vs/CmRVz0deLlDGEqXzyTZUtmVi
         NmFOWVRZV4KI4cEdVwgOO21CZ5KmdsiUgQ7ZDZQgTrTg5kvGieEOfwFUqVH6zR06PD0N
         4XsinHG54aGtX0ndUnxWmHfbhMadhGslZdj5GcilCdgZJlQQZ7hMKdmuUyIDPNs/1nZv
         hFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p5mxYOCzDmHqTOVVnNaJuODiMrhAeGsShY3hmafnUYA=;
        b=W+5uS6asASRf1FbwRyCxR3qDXQH38NjSq/nZPGbKT6grRLZSnUqImy/BL/dC6DhrXR
         UNyyXRPuV1CdDQXhBL4DE93Yx3TDVmkh+JnUU9B0iBS6PTkGeGVVkhtm4LjJHQ1zTkIu
         ddbkV/cxr52Nf0TEuNwUkA/nbcukeHxWsauIEb//QstwBysO7pP94bjMTEZ8RupVyAaa
         omZeyhawvbvq81dApZZL6vZEVxr7lMzuly+atVDWQzleFojjkOYlJMiAajHfE6n1X1/i
         FrWtpjxn3qvmZ3CNBhe5IZtNOuP9LhNMSES0a66OI+OUJrS9wpYidMKxw7HRtmE/81i9
         GIgg==
X-Gm-Message-State: APjAAAVqODa0v7DFteQzm6LOeduSHl9/QQ2WhGz8zrH1qklQ0vi466Xj
        IA08X9CH3dHxYmI/R+oMjCE=
X-Google-Smtp-Source: APXvYqz0FAqHVwoeNc+ipuMaaN0Zcwmp5u+BDWRMxV0cQkQjInoE0gnGnSiVMAmLla4LZqK1tmlixA==
X-Received: by 2002:a17:902:9a83:: with SMTP id w3mr65017395plp.241.1556567050534;
        Mon, 29 Apr 2019 12:44:10 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net. [24.6.192.50])
        by smtp.gmail.com with ESMTPSA id y2sm2180283pfy.123.2019.04.29.12.44.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 12:44:09 -0700 (PDT)
Subject: Re: [PATCH 4/4] input: keyboard: gpio-keys-polled: skip oftree code
 when CONFIG_OF disabled
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
References: <1555444645-15156-1-git-send-email-info@metux.net>
 <1555444645-15156-5-git-send-email-info@metux.net>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <2a760b29-9f0b-ffa7-03dd-47ddb074563a@gmail.com>
Date:   Mon, 29 Apr 2019 12:44:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555444645-15156-5-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/16/19 12:57 PM, Enrico Weigelt, metux IT consult wrote:
> we don't need to build in oftree probing stuff when oftree isn't
> enabled at all.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/input/keyboard/gpio_keys_polled.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index 3f773b2..fbccb89 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -147,6 +147,7 @@ static void gpio_keys_polled_close(struct input_polled_dev *dev)
>  static struct gpio_keys_platform_data *
>  gpio_keys_polled_get_devtree_pdata(struct device *dev)
>  {
> +#ifdef CONFIG_OF
>  	struct gpio_keys_platform_data *pdata;
>  	struct gpio_keys_button *button;
>  	struct fwnode_handle *child;
> @@ -200,6 +201,9 @@ static void gpio_keys_polled_close(struct input_polled_dev *dev)
>  	}
>  
>  	return pdata;
> +#else /* CONFIG_OF */
> +	return ERR_PTR(-ENOENT);
> +#endif /* CONFIG_OF */
>  }
>  
>  static void gpio_keys_polled_set_abs_params(struct input_dev *input,
> @@ -226,7 +230,7 @@ static void gpio_keys_polled_set_abs_params(struct input_dev *input,
>  	{ .compatible = "gpio-keys-polled", },
>  	{ },
>  };


> -MODULE_DEVICE_TABLE(of, gpio_keys_polled_of_match);
> +MODULE_DEVICE_TABLE_OF(gpio_keys_polled_of_match);

Not needed, when you use of_match_ptr() -- see below.

>  
>  static struct gpio_desc *gpio_keys_polled_get_gpiod_fwnode(
>  	struct device *dev,
> @@ -452,7 +456,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  	.probe	= gpio_keys_polled_probe,
>  	.driver	= {
>  		.name	= DRV_NAME,

> +#ifdef CONFIG_OF
>  		.of_match_table = gpio_keys_polled_of_match,
> +#endif /* CONFIG_OF */

No need for the #ifdef, use of_match_ptr():

  		.of_match_table = of_match_ptr(gpio_keys_polled_of_match),


>  	},
>  };
>  module_platform_driver(gpio_keys_polled_driver);
> 

