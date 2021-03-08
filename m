Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C32331A29
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 23:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhCHW1t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 17:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhCHW1t (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 17:27:49 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE449C06174A
        for <linux-input@vger.kernel.org>; Mon,  8 Mar 2021 14:27:48 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id kx1so478520pjb.3
        for <linux-input@vger.kernel.org>; Mon, 08 Mar 2021 14:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3gYhEnnlfDIvDM/X4WxqXWQwOjLpqlJTqZyaF7NeY/U=;
        b=M57u4C5Y2AqdCs9a44mx1tVqBfjEHTEy9HuD60bAMhdwEfF4X1bbD32Q2ImUsTADaj
         HQYpvFvVum7Q9Mi/BKweyn/P1nZaHWxbjePAoCzbQXnRtc6kD7mwXBXndEA3rSu1VIBb
         IC649f+8vym6L46vPthIirDaDLiHGrU+W87w5IBEUcULa0xln8MVF0iXiGbEXNvMXQPt
         ByVTLKm0NYtMKGeMUGOF5+HH6B0yyEh0FpHlEc21WVafFDw1HHdDvLmWPW0E0JYqnRbz
         0BJbr0lA2CWTFB28PC4Et9mQRk2eCNQO81fhlvcCA2BMOLPFh2emMItRr2KtWYi7wRkj
         U5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3gYhEnnlfDIvDM/X4WxqXWQwOjLpqlJTqZyaF7NeY/U=;
        b=B8bJYsDiJIVA1jpzor2F6ftw7yZmM9pBSoldslH0VqfHyt9sT/NQ0zWJs0aV2jE/nL
         qkangwY13nXzghDkarjhFNQnZpZmiUjyHoV/zWsLBp0yMf+H5VP6x2u2Nm4UyRWV166d
         ygp4VVHG3f+zmJvIThkf8SrY8EPm4pB0f9dL/b1ZEBBZn5UqRlw7jFjLqh4KisnUuEIl
         jQLhT9XvJ5mepPow8sY9TEgyxW0fSFhgKPqvtqK390TUWKYTcv2ByevTrt+BldoXpqUF
         Y8lmVBHGlvUGV2ybVM1XBs3+6jT/C1SHQMlfmEzOQswJmSkih1L54PgNABaGUDVN2OoP
         CnXA==
X-Gm-Message-State: AOAM530vmv5wSEDDuq8nvQtKLo0ig0gk7K426qk6uqQRR8bUbmcRNNwq
        5cHQPBLOijiXKvHm/usaMqA=
X-Google-Smtp-Source: ABdhPJzRQVQs2vC/znWk35KIXsU04h7WAVAy0X+frPt9n0CotqOXbelK6yBBgKQCSEnV5rJIe3GYWw==
X-Received: by 2002:a17:90a:f3cc:: with SMTP id ha12mr1117580pjb.180.1615242468289;
        Mon, 08 Mar 2021 14:27:48 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id x14sm11533145pfm.207.2021.03.08.14.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:27:47 -0800 (PST)
Date:   Mon, 8 Mar 2021 14:27:45 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: tsc2007 - convert to GPIO descriptors
Message-ID: <YEak4dbMINWNf2rr@google.com>
References: <20210308215508.399362-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308215508.399362-1-andy.shevchenko@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 08, 2021 at 11:55:07PM +0200, Andy Shevchenko wrote:
> This converts the driver to use GPIO descriptors.
> 
> Note that it now uses logical polarity and thus nagation has been dropped.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> v2: dropped negation (Dmitry)
>  drivers/input/touchscreen/tsc2007.h      |  4 +++-
>  drivers/input/touchscreen/tsc2007_core.c | 17 ++++++++---------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
> index 91c60bf6dcaf..69b08dd6c8df 100644
> --- a/drivers/input/touchscreen/tsc2007.h
> +++ b/drivers/input/touchscreen/tsc2007.h
> @@ -19,6 +19,8 @@
>  #ifndef _TSC2007_H
>  #define _TSC2007_H
>  
> +struct gpio_desc;
> +
>  #define TSC2007_MEASURE_TEMP0		(0x0 << 4)
>  #define TSC2007_MEASURE_AUX		(0x2 << 4)
>  #define TSC2007_MEASURE_TEMP1		(0x4 << 4)
> @@ -69,7 +71,7 @@ struct tsc2007 {
>  	int			fuzzy;
>  	int			fuzzz;
>  
> -	unsigned int		gpio;
> +	struct gpio_desc	*gpiod;
>  	int			irq;
>  
>  	wait_queue_head_t	wait;
> diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
> index 3b80abfc1eca..eecd10effb56 100644
> --- a/drivers/input/touchscreen/tsc2007_core.c
> +++ b/drivers/input/touchscreen/tsc2007_core.c
> @@ -19,11 +19,11 @@
>  
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/input.h>
>  #include <linux/interrupt.h>
>  #include <linux/i2c.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_data/tsc2007.h>
>  #include "tsc2007.h"
>  
> @@ -226,11 +226,12 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct tsc2007 *ts = i2c_get_clientdata(client);
>  
> -	return !gpio_get_value(ts->gpio);
> +	return gpiod_get_value(ts->gpiod);
>  }
>  
>  static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
>  {
> +	struct device *dev = &client->dev;
>  	struct device_node *np = client->dev.of_node;
>  	u32 val32;
>  	u64 val64;
> @@ -266,13 +267,11 @@ static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
>  		return -EINVAL;
>  	}
>  
> -	ts->gpio = of_get_gpio(np, 0);
> -	if (gpio_is_valid(ts->gpio))
> -		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
> -	else
> -		dev_warn(&client->dev,
> -			 "GPIO not specified in DT (of_get_gpio returned %d)\n",
> -			 ts->gpio);
> +	ts->gpiod = devm_gpiod_get_optional(dev, NULL, GPIOD_IN);
> +	if (IS_ERR(ts->gpiod))
> +		return PTR_ERR(ts->gpiod);
> +
> +	ts->get_pendown_state = tsc2007_get_pendown_state_gpio;

OK, I know what my concern was here. You are now assigning
ts->get_pendown_state unconditionally, and with ts->gpiod being NULL it
will always return false, whereas the old code would skip setting
ts->get_pendown_state when GPIO is not available, and the driver would
assume that on interrupt the pen is actually down.

Thanks.

-- 
Dmitry
