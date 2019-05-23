Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7F7276C6
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2019 09:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfEWHSY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 May 2019 03:18:24 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42906 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfEWHSY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 May 2019 03:18:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id e17so2500288pgo.9;
        Thu, 23 May 2019 00:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TN7AtYqCZm6R/1B3AnbwF3gCo9cDqlK3dBKjdEn9ISM=;
        b=Ft1mmKI5Ya7HAv26yTfKHrKkEOrs71DnpPKLN1MGjoogO2MmLtL3oTS7d01LnsHzMH
         99vs40OvbmljzhnPeOwV6nBAVbmHDoKAMzYqQT8cRi4W6qqVFQu6tViXWI/jB9H5OsVk
         nyUlP4wDiloBQFmn/qpRL7WZ3Ok9wzAZioKSnsvSJL2/oVvwN5yzYHv78ChCTU/2FVhZ
         ROaQSd5Ge0WuDnS+RezL1L7MMLk/aCArkwaDmzUaxz3+pYDgmQCi8NML80BdIvSKPxkS
         pUhmUdrOMoEbxp/WRwrO75KZAtM+KxSZrs7cYCz/taLYQRR4MxJgEb9P7xKaOneBtwDe
         0Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TN7AtYqCZm6R/1B3AnbwF3gCo9cDqlK3dBKjdEn9ISM=;
        b=KstLHdD/ehtDnAh13jL4T1s3y8aZE09ju8r05Yu8zW07fcHhTzHCMPfP70IKIGJwac
         QSdJXYURIRdLusblZd/upZIvRSGRZvd4VOGOpZ+TsVLX6oHgzelzWgHXeujQlcAY0h62
         C1S2eay5v63eDajndW5PyPQK/51n1C3U4Sv6oPsgz3jj8zC4ziCxNtYH3ZB9PP0VW0T3
         vpvaJ0Izg4LqopMYPv6u2UVqCcxzq052vL+DuxgyuvN1am98Zpzz4AYOwV4QLnkfPy4+
         K6ImctPEE0zFN9HEDErYD4Dr9ggpZ4Gp7Uu40cAzBlotnamcI0IfOqrWo5rHTnHCpf6z
         TZ8A==
X-Gm-Message-State: APjAAAUz9hP6OyXXCyiyRe/2NVt+SPBS+D+Hjin2yuA7SMD06LZzsB2m
        C3Unhk36eBGso7Jt80h1qGM=
X-Google-Smtp-Source: APXvYqwNkAE73hFLopSCXpSojQ+W34YbqNhqxaHe/bRS8Q/A3zBzhxMD3uqAFXGRDKemYsR6+cmFdg==
X-Received: by 2002:aa7:8493:: with SMTP id u19mr102095257pfn.233.1558595903022;
        Thu, 23 May 2019 00:18:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p64sm40511866pfp.72.2019.05.23.00.18.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 00:18:22 -0700 (PDT)
Date:   Thu, 23 May 2019 00:18:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bogdan Togorean <bogdan.togorean@analog.com>
Cc:     linux-input@vger.kernel.org, gustavo@embeddedor.com,
        linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com
Subject: Re: [PATCH RESEND] input: adp5589: Add gpio_set_multiple interface
Message-ID: <20190523071820.GA121292@dtor-ws>
References: <20190415122525.2576-1-bogdan.togorean@analog.com>
 <20190521083821.26540-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521083821.26540-1-bogdan.togorean@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bogdan,

On Tue, May 21, 2019 at 11:38:22AM +0300, Bogdan Togorean wrote:
> This patch implements the gpio_set_multiple interface for ADP558x chip.
> 
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
>  drivers/input/keyboard/adp5589-keys.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
> index 2835fba71c33..143871bd60ef 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -416,6 +416,30 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
>  	mutex_unlock(&kpad->gpio_lock);
>  }
>  
> +static void adp5589_gpio_set_multiple(struct gpio_chip *chip,
> +				      unsigned long *mask, unsigned long *bits)
> +{
> +	struct adp5589_kpad *kpad = container_of(chip, struct adp5589_kpad, gc);
> +	u8 bank, reg_mask, reg_bits;
> +
> +	mutex_lock(&kpad->gpio_lock);
> +
> +	for (bank = 0; bank <= kpad->var->bank(kpad->var->maxgpio); bank++) {
> +		if (bank > kpad->var->bank(get_bitmask_order(*mask) - 1))
> +			break;

I wonder if we should have:

	last_gpio = min(kpad->var->maxgpio, get_bitmask_order(*mask) - 1);
	last_bank = kpad->var->bank(last_bank);
	for (bank = 0; bank <= last_bank; bank++) {
		...
	}

> +		reg_mask = mask[bank / sizeof(*mask)] >>
> +			   ((bank % sizeof(*mask)) * BITS_PER_BYTE);
> +		reg_bits = bits[bank / sizeof(*bits)] >>
> +			   ((bank % sizeof(*bits)) * BITS_PER_BYTE);

This s really hard to parse. We know that "bank" is a byte, and mask is
long, we do not have to be this roundabout it.

> +		kpad->dat_out[bank] &= ~reg_mask;
> +		kpad->dat_out[bank] |= reg_bits & reg_mask;
> +		adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + bank,
> +			      kpad->dat_out[bank]);
> +	}

However the biggest issue is that this implementation seems to ignore
the kpad->gpiomap that translates GPIO numbers as seen by gpiolib to
GPIO numbers used by the chip. You need to reshuffle the mask and bits,
and only then do the writes.

Given the complexities, does set_multiple really save anything?

Thanks.

-- 
Dmitry
