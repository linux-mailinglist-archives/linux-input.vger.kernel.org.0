Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1910C5AF27
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2019 09:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfF3HMR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Jun 2019 03:12:17 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39495 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfF3HMR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Jun 2019 03:12:17 -0400
Received: by mail-pf1-f195.google.com with SMTP id j2so4993954pfe.6
        for <linux-input@vger.kernel.org>; Sun, 30 Jun 2019 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hNjuB62gMKoUwVItqtXlkU7ZF6tAIr/Hc1CG7hx9LhA=;
        b=gbiBnKUX36kBHPKdqu8TpH17y3pYzUglgnwkgXfudnpkE5dgfM/d4s0av0kqk0Iz0c
         ajbUHBObTdfzO+tRWdtHoR7zU4kn2ZRbBssNVIcpTH8130txMNRqHDv918OrZy4iH+Bq
         kCznPvn8V6/2dsD51YpeZI0uRrTwok4f5Bn+zKGE2s/w2QydL3lQ/FBn4OOvTvHIpDQK
         yaZcBDyRrYYHpWpkcLqC3PrfPLMOL5WCFCd8FWqYDwReHzF6RtQunSmk/VGFqKwtueeK
         W4B9B6kCJJYL6KnUeTuYLkdpaOHIWQEoajeeSCqANswE+xpLEWqMUC/ZqMxVXTEghZbK
         ZGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hNjuB62gMKoUwVItqtXlkU7ZF6tAIr/Hc1CG7hx9LhA=;
        b=RRie0zMRS+oHmtcKxtj0GS6+EDCtUgR5ahDQ8o4usB7SD3LETMYsreRv4ADtwYslgN
         3zcsr2SdqugpQw8/w0ArrNpN3OnzC1a3ph7UvuYnoQcMazLu4ZBxLhYu+o5kksh5bV56
         M/Bk+G8ogH0eFe1HUH1oLhKr8dGzfOeuxmRv73vMsCAwrOhDcFDm0V+gc0H2J5tA9sy4
         ZvVDwwL7iR22XzrVYk6ROcaJrJIHe1qSeuF4LQOjvP+d0bfZv3P3t2k7lYeyQJDD8I6f
         pRgidQZ0swKmvXMF849o/hz8+V8hviUSNdTgT3D+i6LUOurfBhdQdQl0pHqe/1yCxf3h
         6Fxw==
X-Gm-Message-State: APjAAAV3bxcEabkM5z/HxgjWkNe58zrGXaszFZgExfaEsXkwbBfEx2a/
        MfI6VXa2KOzqt6l7TiexuzQ=
X-Google-Smtp-Source: APXvYqwQDWT9fJ5z2/AkBfcvjy3nfeVnZYL7QIuqbSvG7cOa+BnmPD+vTwx3Y8HIQVjl1I5czUUhIg==
X-Received: by 2002:a17:90a:5288:: with SMTP id w8mr23683125pjh.61.1561878736028;
        Sun, 30 Jun 2019 00:12:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f186sm7270244pfb.5.2019.06.30.00.12.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 00:12:14 -0700 (PDT)
Date:   Sun, 30 Jun 2019 00:12:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martijn Braam <martijn@brixit.nl>
Cc:     m.felsch@pengutronix.de, robh@kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - add vdd supply
Message-ID: <20190630071213.GB91171@dtor-ws>
References: <20190514212111.21742-1-martijn@brixit.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514212111.21742-1-martijn@brixit.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Martijn,

On Tue, May 14, 2019 at 11:21:11PM +0200, Martijn Braam wrote:
> Add a regulator supply request for the controller power
> 
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 702bfda7ee77..226c623f8d46 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -29,6 +29,7 @@
>  #include <linux/ratelimit.h>
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/input.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
> @@ -103,6 +104,7 @@ struct edt_ft5x06_ts_data {
>  
>  	struct gpio_desc *reset_gpio;
>  	struct gpio_desc *wake_gpio;
> +	struct regulator *vdd;
>  
>  #if defined(CONFIG_DEBUG_FS)
>  	struct dentry *debug_dir;
> @@ -1092,6 +1094,22 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> +	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
> +	if (IS_ERR(tsdata->vdd)) {
> +		error = PTR_ERR(tsdata->vdd);
> +		if (error != -EPROBE_DEFER)
> +			dev_err(&client->dev,
> +				"Failed to get vdd regulator: %d\n", error);
> +		return error;
> +	}
> +
> +	/* power the controller */
> +	error = regulator_enable(tsdata->vdd);
> +	if (error) {
> +		dev_err(&client->dev, "Controller fail to enable vdd\n");
> +		return error;
> +	}
> +
>  	tsdata->wake_gpio = devm_gpiod_get_optional(&client->dev,
>  						    "wake", GPIOD_OUT_LOW);
>  	if (IS_ERR(tsdata->wake_gpio)) {
> @@ -1204,6 +1222,7 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
>  {
>  	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
>  
> +	regulator_disable(tsdata->vdd);

This is too early. You are powering down the chip while it may still
generate interrupts and we'll get errors if we try to access it then.
Please use devm_add_action_or_reset() to include turning off the
regulator into devm handling of the rest of the resources.

>  	edt_ft5x06_ts_teardown_debugfs(tsdata);
>  
>  	return 0;
> -- 
> 2.21.0
> 

Thanks.

-- 
Dmitry
