Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8CC217CA35
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 02:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgCGBNB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 20:13:01 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46065 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgCGBNB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 20:13:01 -0500
Received: by mail-pl1-f195.google.com with SMTP id b22so1551824pls.12
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 17:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7qwWstaUv+14YXD3T1vZzm/IoALM/Evymn9lpGtPIzw=;
        b=KcOhMc2Ni3TjcsSCVQ4sXvETTG6W0OFzvNKxWKrKFvWB6KS5u5MFEoXqJjHGHQrqJM
         U+EAwjhzhUhgGPz/rOgg1E3Hl36MoQsbKXSoMNntUb8LfS3X61RctcOhMX6OKOK4AhSZ
         a3OKandcqQ2zMLq5Tf/0dwOGhoNLOWlkdQX5hqZNSdIszI8j2gAMFdBbvgqQ8GTRrV12
         Cow1WDYOz7pDMmtYEnBvMu+sTDe9dcy+3EX6u/sRpt5uIXxEWzkQEQKXN0ls4lyLakWc
         7pQF4lDmrxzJV8tYD4/GgOB9Qq7X3GYK9QEESnns4gx+x+ftCX3FOl8IimFub6GKfkW2
         ClPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7qwWstaUv+14YXD3T1vZzm/IoALM/Evymn9lpGtPIzw=;
        b=nt+EvqSGn8HdsyCTjzALKjbE0JpoXC4OCFR46TsLPxc7pDNyoG7zAQNxVUfpoTaKij
         4ULRCnj09bzSBKYnTYXtfM/Z5etfxt4IaWxcyi83UPTC+2QSDPL2vpmbsH2gEOyfNnlf
         YlvrwLvhbcT9yNwEydVWrLxRK2Gdmy55TIOkR3VJe8I2BPegGe35RlGsssP9H7C4LvwC
         zs1CTnC6EdtM2Tbfg49RkqZDMxmvpvFrGxSFX/aUM2HfQ1g36TRY1QinhG1LyvKeuwIf
         rtM+eh0jryCSiFKR/xCrWdWvs9CVX/PfeBOg7MmLnq7Fcs17ABJUMHZAKt0JbOaYdUy9
         4kSA==
X-Gm-Message-State: ANhLgQ1RBxIJ+lxWiGgxN5OqGrRAJ8dxbedweu/0KeNDRkceoNrxalzj
        aknrOxd4C5bE0i9Rt4XxeBk=
X-Google-Smtp-Source: ADFU+vtQMnhvcyCJKYHv0ZDsejZuYf9n6Sf1ExKe9W+MbCB4BjogVuEKARq8jVhQTZy8iDntXS5+RA==
X-Received: by 2002:a17:90a:bd84:: with SMTP id z4mr6309506pjr.156.1583543578648;
        Fri, 06 Mar 2020 17:12:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y200sm3462272pfb.138.2020.03.06.17.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 17:12:58 -0800 (PST)
Date:   Fri, 6 Mar 2020 17:12:56 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v1 1/5] Input: of_touchscreen - explicitly choose axis
Message-ID: <20200307011256.GQ217608@dtor-ws>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 03, 2020 at 08:09:13PM +0200, Andy Shevchenko wrote:
> The 'axis + 1' calculation is implicit and potentially error prone.
> Moreover, few lines before the axis is set explicitly for both X and Y.
> 
> Do the same when retrieving different properties for X and Y.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/of_touchscreen.c | 35 +++++++++++-----------
>  1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/of_touchscreen.c b/drivers/input/touchscreen/of_touchscreen.c
> index e16ec4c7043a..97342e14b4f1 100644
> --- a/drivers/input/touchscreen/of_touchscreen.c
> +++ b/drivers/input/touchscreen/of_touchscreen.c
> @@ -66,7 +66,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>  {
>  	struct device *dev = input->dev.parent;
>  	struct input_absinfo *absinfo;
> -	unsigned int axis;
> +	unsigned int axis, axis_x, axis_y;
>  	unsigned int minimum, maximum, fuzz;
>  	bool data_present;
>  
> @@ -74,33 +74,34 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>  	if (!input->absinfo)
>  		return;
>  
> -	axis = multitouch ? ABS_MT_POSITION_X : ABS_X;
> +	axis_x = multitouch ? ABS_MT_POSITION_X : ABS_X;
> +	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
> +
>  	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
> -						input_abs_get_min(input, axis),
> +						input_abs_get_min(input, axis_x),
>  						&minimum) |
>  		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
>  						input_abs_get_max(input,
> -								  axis) + 1,
> +								  axis_x) + 1,
>  						&maximum) |
>  		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
> -						input_abs_get_fuzz(input, axis),
> +						input_abs_get_fuzz(input, axis_x),
>  						&fuzz);
>  	if (data_present)
> -		touchscreen_set_params(input, axis, minimum, maximum - 1, fuzz);
> +		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
>  
> -	axis = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
>  	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
> -						input_abs_get_min(input, axis),
> +						input_abs_get_min(input, axis_y),
>  						&minimum) |
>  		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
>  						input_abs_get_max(input,
> -								  axis) + 1,
> +								  axis_y) + 1,
>  						&maximum) |
>  		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
> -						input_abs_get_fuzz(input, axis),
> +						input_abs_get_fuzz(input, axis_y),
>  						&fuzz);
>  	if (data_present)
> -		touchscreen_set_params(input, axis, minimum, maximum - 1, fuzz);
> +		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
>  
>  	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
>  	data_present = touchscreen_get_prop_u32(dev,
> @@ -117,15 +118,13 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>  	if (!prop)
>  		return;
>  
> -	axis = multitouch ? ABS_MT_POSITION_X : ABS_X;
> -
> -	prop->max_x = input_abs_get_max(input, axis);
> -	prop->max_y = input_abs_get_max(input, axis + 1);
> +	prop->max_x = input_abs_get_max(input, axis_x);
> +	prop->max_y = input_abs_get_max(input, axis_y);
>  
>  	prop->invert_x =
>  		device_property_read_bool(dev, "touchscreen-inverted-x");
>  	if (prop->invert_x) {
> -		absinfo = &input->absinfo[axis];
> +		absinfo = &input->absinfo[axis_x];
>  		absinfo->maximum -= absinfo->minimum;
>  		absinfo->minimum = 0;
>  	}
> @@ -133,7 +132,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>  	prop->invert_y =
>  		device_property_read_bool(dev, "touchscreen-inverted-y");
>  	if (prop->invert_y) {
> -		absinfo = &input->absinfo[axis + 1];
> +		absinfo = &input->absinfo[axis_y];
>  		absinfo->maximum -= absinfo->minimum;
>  		absinfo->minimum = 0;
>  	}
> @@ -141,7 +140,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>  	prop->swap_x_y =
>  		device_property_read_bool(dev, "touchscreen-swapped-x-y");
>  	if (prop->swap_x_y)
> -		swap(input->absinfo[axis], input->absinfo[axis + 1]);
> +		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
>  }
>  EXPORT_SYMBOL(touchscreen_parse_properties);
>  
> -- 
> 2.25.1
> 

-- 
Dmitry
