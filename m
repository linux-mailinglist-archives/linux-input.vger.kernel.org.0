Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D48EE26C8
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2019 00:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406203AbfJWW7q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Oct 2019 18:59:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44917 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392721AbfJWW7o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Oct 2019 18:59:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id q21so13819541pfn.11;
        Wed, 23 Oct 2019 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VBEn/ZEVvdF0PqXom7XbyG81OSCKs1CYpQEi1Eolam8=;
        b=D9Xv4ssAOo2hZ/YGQdDTtME2FAHVqoWaRy5aJoAHz6gy1Ci3f7i42Pb4UGYG+abd29
         fk2pRdZJEKYVmxaW5L9obfNOKqEwRjwig57aCo+x9GR/SMN6N51feS558DuO6+u9fbTd
         rXu+2ywkwdlD/dPu9nqnJaLJn+6af8vSAUZluXsH9OXdnvkPbNMRX4QVK0H/Fw+Dyb/R
         Mncl2w6T7m9AVw8REiHK0P6w+Qo9fWeyQ0SBC70ZWCp/aeIOdoBodjpNns9fZ+iAG9ql
         u76e7qqCh8tjqr7/tVUP0yEANPeQspoKdLHioH2uXdhl6WjaIE+vm2D9A4SIUFM064j2
         8OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VBEn/ZEVvdF0PqXom7XbyG81OSCKs1CYpQEi1Eolam8=;
        b=kaLtDpRG6I7oWj0ltddiE+70yGAkPtwfMG0iIpPke6WkLh7TBjKVy1rr3MOoUIGC7M
         9oh8FITG13UTa2ccGrB/jDEqbiryeuFygAw3gIpF6JeOVHfpAcwtr6ZNZbWwFBEmWwWO
         qC/bGJ7mBiVIJA0Tli2MpfpJY25W0DZDjvJ2/BsZXoN5HNfTnZSpUw3ySfLF4b2tZj8I
         IFZZqMJHQ6dRc39rk66DC8MjuB34rCgsivBK7Yvb+dZDJUTBG0kDCx+hJ+EyoBe4A+No
         yPp1JAygcuuyJs4aXCu2yC4IpUbRn/kxmO3pZ5E6a6CYLunGGAZAHdWKMZoQVRNNIip6
         jp/A==
X-Gm-Message-State: APjAAAXXdNm32L5ohKmIBfcP3ubSXUFjxMOmGNZHZOqwc79hYkoNZVZs
        xSv0JmSCciYWxHgp5FALEBw=
X-Google-Smtp-Source: APXvYqx3N2SmZe1Lma+SZXSglX0ZRaurx+TsuCKC4IH2bF3mV551cJT9zYZsSuPilhdCYoomVw3/Bg==
X-Received: by 2002:a63:2f47:: with SMTP id v68mr12804624pgv.318.1571871582843;
        Wed, 23 Oct 2019 15:59:42 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s21sm26262778pgv.37.2019.10.23.15.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 15:59:41 -0700 (PDT)
Date:   Wed, 23 Oct 2019 15:59:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH][RESEND] input: adp5589: Make keypad support optional
Message-ID: <20191023225939.GA35946@dtor-ws>
References: <20190927123836.28047-1-alexandru.ardelean@analog.com>
 <20191023070541.13940-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023070541.13940-1-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexandru,

On Wed, Oct 23, 2019 at 10:05:41AM +0300, Alexandru Ardelean wrote:
> From: Lars-Peter Clausen <lars@metafoo.de>
> 
> On some platforms the adp5589 is used in GPIO only mode. On these platforms
> we do not want to register a input device, so make that optional and only
> create the input device if a keymap is supplied.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/input/keyboard/adp5589-keys.c | 197 +++++++++++++++-----------
>  1 file changed, 111 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
> index 4f96a4a99e5b..08bfa8b213e8 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -495,10 +495,10 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
>  	return n_unused;
>  }
>  
> -static int adp5589_gpio_add(struct adp5589_kpad *kpad)
> +static int adp5589_gpio_add(struct adp5589_kpad *kpad,
> +	const struct adp5589_kpad_platform_data *pdata)
>  {
>  	struct device *dev = &kpad->client->dev;
> -	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
>  	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
>  	int i, error;
>  

All these changes passing pdata to various functions are not really
needed for this patch. I dropped them and applied.

Sorry for the delay.

-- 
Dmitry
