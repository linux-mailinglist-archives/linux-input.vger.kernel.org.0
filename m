Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D47E330518
	for <lists+linux-input@lfdr.de>; Sun,  7 Mar 2021 23:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbhCGW6B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 17:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbhCGW5m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Mar 2021 17:57:42 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E9CC06174A
        for <linux-input@vger.kernel.org>; Sun,  7 Mar 2021 14:57:42 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id d14-20020a17090ab30eb02900caa8f10060so1943378pjr.4
        for <linux-input@vger.kernel.org>; Sun, 07 Mar 2021 14:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TuzhxdDKs3QcCGYJM07hlhq2i6elRi+asGfoqZCEqiU=;
        b=Fv/fqyI/R4EXFRhv4YbEkKqxAx0BtMN9xPvy0Wv+oI/+B9GOLZAM8xn/VRGP0VdZ1N
         AnxdIo8OdaksL/rl4uASIsDo40TqnvURW3g76L/q0ggoPrM1Lg8jQ5L96HoD1//ylQnX
         soZW7wyMKFr1iFOv7KrwqTl9bLXMPhLu7OlAwoaWc1m2i56ED6Sz6pC7+Q/j3ja8D4oB
         5TcbPyupApFNQ2ch652gGAHPjkWlFyOBS0/xG8m7H8zmGA2tXhRRjRemcKmCGHKEYPCb
         995jMICctMLVfm74/8lPq/K1hnMFd81PijJEBrTddDnY2LT9sIiFjpjERTItOzURjXAz
         bWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TuzhxdDKs3QcCGYJM07hlhq2i6elRi+asGfoqZCEqiU=;
        b=IZXJtgaBUdd3lpkzkrnzOAJjFknRsofVq1Hrxm52Tog1kZBQK/HeubS12MoOcijXfQ
         7aAO8b83HVsgkWwmU1IYdQ3+8KjvOwS/JGy3CiilSNwV8MmilbvelMyM9nvWrZXu87Sl
         /tAU2fMjY3AKzHpbEzblZQtDpZGsfqqVzY33ZiSkphvYZPrKY30sevbOIwHZnXXTCe9j
         x4re45qMomK0xNntBoF23N6grZ54Zkc5nWewoLqZBWv6FRBmvzvV9CKEVL/iLCUPSIDX
         2H0ShDoL/ZfGuIi3+xHWy8E3w0G6RjuSxPAajbaZiVAWJcIeRH5J09QqshiImzn1jx9d
         8bkw==
X-Gm-Message-State: AOAM532Hz+W4o6rQaXDSegyw4XKy/4eqwWoQUxmEFg9RX97rX/cZQ6EF
        SScqG6ccMXUr6wlu8ktYx3X21KoHP9g=
X-Google-Smtp-Source: ABdhPJztzJlJQeS1Rl3E728B3/RGUaLlQA0j37grK4JW9mkL8xzb8FZJJhEUbEg86IkdpveUrms8sA==
X-Received: by 2002:a17:90a:67cf:: with SMTP id g15mr21576173pjm.208.1615157861529;
        Sun, 07 Mar 2021 14:57:41 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc9b:5ab2:d763:15bc])
        by smtp.gmail.com with ESMTPSA id j23sm4507112pfn.94.2021.03.07.14.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:57:40 -0800 (PST)
Date:   Sun, 7 Mar 2021 14:57:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v1 1/2] Input: tsc2007 - convert to GPIO descriptors
Message-ID: <YEVaYiA9Faylr9il@google.com>
References: <20210307220549.354263-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307220549.354263-1-andy.shevchenko@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andy,

On Mon, Mar 08, 2021 at 12:05:48AM +0200, Andy Shevchenko wrote:
> @@ -226,11 +226,12 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct tsc2007 *ts = i2c_get_clientdata(client);
>  
> -	return !gpio_get_value(ts->gpio);
> +	return !gpiod_get_value(ts->gpiod);

This is not correct. gpio_get_value() is raw polarity vs
gpiod_get_value() using logical active/inactive, and tsc2007 GPIO lines
are active low. The negation must be dropped after switching to GPIOD
API.

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

GPIO is definitely not optional in DT case, at least in the way the
driver written right now.

> +	if (IS_ERR(ts->gpiod))
> +		return PTR_ERR(ts->gpiod);
> +
> +	ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
>  
>  	return 0;
>  }
> -- 
> 2.30.1
> 

Thanks.

-- 
Dmitry
