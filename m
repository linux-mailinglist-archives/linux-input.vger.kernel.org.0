Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0124A33CA45
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 01:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbhCPALT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Mar 2021 20:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhCPALF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Mar 2021 20:11:05 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBB6C06174A
        for <linux-input@vger.kernel.org>; Mon, 15 Mar 2021 17:11:05 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id n9so20484451pgi.7
        for <linux-input@vger.kernel.org>; Mon, 15 Mar 2021 17:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lYmj4jMDI2V21amL/S/CeB66ne/jqFNZAVjCnHu8oK0=;
        b=ZKKHWK1WvtWRMdufaKp0Rd2QKQyhaDB/8XDILoi3ftlkjl3O0H4MR8lSsnbw91Uy9b
         dX+z+knPDLu24fP+8XkuW2ttQn7bVNrp2Ot31qBxzZrZ8//YfrGMXZEkWyjk+wYnwiCx
         ITHeSk+vf449AfWZ6qH1jzbjLI41sIeVpu068e+o3c/lozY4LMmUqlwYCko+nUjiNpvv
         Mt11y0G2nDwjcrsi/IXfedzOtEJOk/hhJieL2zP4IoaUrH4Sk2e+t+S2dC3i0j6WVjuN
         z3QsDM6XOuHsy8nGRzxNh3dcnafi6nfnVEuN7lc1ZsEH16tMUhYkK9zI0T/WKGWDFkOu
         Xicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lYmj4jMDI2V21amL/S/CeB66ne/jqFNZAVjCnHu8oK0=;
        b=Xf7zW19481lDaljoQCiPmFTzF+JNd9CDa8FN7cI31YI1A0inDB919bPLNFQQEluhHP
         W24OiIXpiuYJgXstcPGmL7rbTKkbmCfv04f1JSbc5reKXFb3X2Q+9Ylxg2Cut9mPNQQH
         9cLuebZExDJIexCAvk98dVy0VW7sUBraaHBT4LNVXqiWBzPJtQTnMvOighArtz9VgZfA
         ay8lw3k0heOc6Fp7y+NljmTEFzH1ROXdonAPz6PJUReMSEZ9hcRsUXKFqJiucE8WtzSO
         owQdhWlkj/G7l4JknGkE7/Mwxo7rOdugjNgxDw47gmrFlbvD6bEhw74H7OrFkGLkNqHQ
         Mybw==
X-Gm-Message-State: AOAM531uujL/RPW6d/KKxPZvN7qPAV4z0IlD2EtPYCRWRRzl4FDhmn3L
        jnomscTTlqK0FkrpggV7vzggIhMilXI=
X-Google-Smtp-Source: ABdhPJxKYCe9v7N//vTBjN7bWi1Q4LH5B5xFtjc07HWQYUIM3HdNl1N9o396Pq+7PDyRKJN+6IvS7g==
X-Received: by 2002:a65:5a0a:: with SMTP id y10mr1355575pgs.285.1615853464615;
        Mon, 15 Mar 2021 17:11:04 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c4f3:b674:6a37:83cb])
        by smtp.gmail.com with ESMTPSA id v23sm14089577pfn.71.2021.03.15.17.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 17:11:03 -0700 (PDT)
Date:   Mon, 15 Mar 2021 17:11:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Input: tsc2007 - convert to GPIO descriptors
Message-ID: <YE/3lDI5UGK51twS@google.com>
References: <20210314210951.645783-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210314210951.645783-1-andy.shevchenko@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andy,

On Sun, Mar 14, 2021 at 11:09:50PM +0200, Andy Shevchenko wrote:
> This converts the driver to use GPIO descriptors.
> 
> Note that it now uses logical polarity and thus nagation has been dropped.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> v3: left ->get_pendown_state() assignment conditionally (Dmitry)
>  drivers/input/touchscreen/tsc2007.h      |  4 +++-
>  drivers/input/touchscreen/tsc2007_core.c | 12 ++++++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
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
> index 3b80abfc1eca..e4ab5962ddd4 100644
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
> @@ -266,8 +267,11 @@ static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
>  		return -EINVAL;
>  	}
>  
> -	ts->gpio = of_get_gpio(np, 0);
> -	if (gpio_is_valid(ts->gpio))
> +	ts->gpiod = devm_gpiod_get_optional(dev, NULL, GPIOD_IN);
> +	if (IS_ERR(ts->gpiod))
> +		return PTR_ERR(ts->gpiod);
> +
> +	if (ts->gpiod)
>  		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
>  	else
>  		dev_warn(&client->dev,

This does not really compile as the warning still refers to the legacy
gpio number. I fixed it up locally and applied, thank you.

-- 
Dmitry
