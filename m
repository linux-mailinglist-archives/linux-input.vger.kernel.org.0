Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0AEF99F0
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 20:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKLTmY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 14:42:24 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39480 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfKLTmY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 14:42:24 -0500
Received: by mail-pf1-f194.google.com with SMTP id x28so14069326pfo.6;
        Tue, 12 Nov 2019 11:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yqktiPl2EC0yR95xmbyrqYNKwgzhcW9RKfI9BIqCrE0=;
        b=RLfvVJiStfVTn96qzXe6kxlRNrY/i7GV2TmteyCTXT6GlBu2LahG8I/HU4gxdeRxyQ
         PkDZ3tlU/QNWWTfXSeuUtihzsng+FZTeSOPL+zCdCi1J455XJqzK/iU09iKwkAGkr74B
         F4hOloOJYnvSuJQexAnRNMnN+aG8G+ewc9wKY3cT+BQHafSeQLIdJxSt/p9hORWYWHiT
         S0y5fgDXm+7T+f6huLXNUeA0BZQi79XHOcZ4/Tp4JgIH0WmMisZQQnmhae5g67HIU6Xz
         IcBxs9hf8tmQklNj5lZ9jPEtjsRo9imP2O3aXmyfgZvdgNH6yQfpnPlzsnF41RHJLshk
         2EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yqktiPl2EC0yR95xmbyrqYNKwgzhcW9RKfI9BIqCrE0=;
        b=lPfo1m5DYOOG18GP490p7dRtMbZQz/8SFYSr2nZyQAWkbzx8dCtdsaU1/5ejBbJl2m
         8UYA3drMGxteSZBcImR1H6I0r+hzzfj8zCO75kpPctc7hQyN0TFdgSse0ytf1CfQMPoV
         cB9j4yH3gwypU6glsh4KdJCL7ajWKLWwoC5YNs6O0RM8tuNzCNlIObQQtHDmCsykBAdR
         mBQ9ujzoEKICR1YIfY51aa4Hnmt8ujzqA8otqgACUKyFkD3yB2cWL/Bxot/ZcA5kDrfc
         fwX5gioEFArZABd13bAhm133IWH4hdArD569jWt+fNxI19O3vIhv95/V4SP7SGtXIyZ4
         tYUQ==
X-Gm-Message-State: APjAAAVohyToV5uGtCmjhXeSmdpW8ziRhNbBAZWF8tdddErtNmiACMm1
        54aZAkekG23qaDBIKWGZWQJNA8lb
X-Google-Smtp-Source: APXvYqy5VceYuMP3Jc0wwKxQ1YJZG6EGMhwq1tnyC/ce/nnn8oy5zvpT9U2BveiAo1skbwXgUqaoHA==
X-Received: by 2002:a17:90a:be05:: with SMTP id a5mr684792pjs.73.1573587743630;
        Tue, 12 Nov 2019 11:42:23 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 23sm6092392pgw.8.2019.11.12.11.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:42:22 -0800 (PST)
Date:   Tue, 12 Nov 2019 11:42:20 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1 2/3] Input: ili210x - add resolution to chip
 operations structure
Message-ID: <20191112194220.GD13374@dtor-ws>
References: <20191112164429.11225-1-TheSven73@gmail.com>
 <20191112164429.11225-2-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112164429.11225-2-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 12, 2019 at 11:44:28AM -0500, Sven Van Asbroeck wrote:
> Optionally allow the touch screen resolution to be set by adding
> it to the chip operations structure. If it is omitted (left zero),
> the resolution defaults to 64K. Which is the previously hard-coded
> value.
> 
> Set the ili2117 resolution to 2048, as indicated in its datasheet.
> 
> Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
> Cc: Marek Vasut <marex@denx.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: <linux-kernel@vger.kernel.org>
> Cc: linux-input@vger.kernel.org
> Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>  drivers/input/touchscreen/ili210x.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index a6feae5ce887..4321f0d676cc 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -31,6 +31,7 @@ struct ili2xxx_chip {
>  				 unsigned int *x, unsigned int *y);
>  	bool (*continue_polling)(const u8 *data, bool touch);
>  	unsigned int max_touches;
> +	unsigned int resolution;
>  };
>  
>  struct ili210x {
> @@ -160,6 +161,7 @@ static const struct ili2xxx_chip ili211x_chip = {
>  	.parse_touch_data	= ili211x_touchdata_to_coords,
>  	.continue_polling	= ili211x_decline_polling,
>  	.max_touches		= 10,
> +	.resolution		= 2048,
>  };
>  
>  static int ili251x_read_reg(struct i2c_client *client,
> @@ -336,6 +338,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	struct gpio_desc *reset_gpio;
>  	struct input_dev *input;
>  	int error;
> +	unsigned int max_xy;
>  
>  	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
>  
> @@ -386,8 +389,12 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	input->id.bustype = BUS_I2C;
>  
>  	/* Multi touch */
> -	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 0xffff, 0, 0);
> -	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 0xffff, 0, 0);
> +	if (chip->resolution)
> +		max_xy = chip->resolution - 1;
> +	else
> +		max_xy = 0xffff;

	max_xy = (chip->resolution ?: 65536) - 1;

> +	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_xy, 0, 0);
> +	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
>  	touchscreen_parse_properties(input, true, &priv->prop);
>  
>  	error = input_mt_init_slots(input, priv->chip->max_touches,
> -- 
> 2.17.1
> 

-- 
Dmitry
