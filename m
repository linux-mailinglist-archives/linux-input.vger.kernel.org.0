Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6B516012F
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgBOXs5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:48:57 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37521 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgBOXs5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:48:57 -0500
Received: by mail-pg1-f195.google.com with SMTP id z12so7098198pgl.4;
        Sat, 15 Feb 2020 15:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=px4w9p6FHG6OgnsadU3BymipOoWoC+t5cmMfFNjEzMs=;
        b=GGcDcxt0jetlXZjeqHjHUPjOipiV/I5i0zQbmQ4fNT9QdAmrpithYUB37II/T6NRiw
         Bs6MN1LKz45JYSDND+0WwWYWBd9ICdsqYkH2UT6dzArfPTxEDRKSTwPbHbaIzhnKMyQm
         NRnGmuaor/NRad30Dc7yTIKMuqeR5uwQlpNMAgMfU4griHNGaHb6RWB9kW+CSuBGXnF/
         frUhEyDokVTeO4YXhritkQKIn/AF6/PrhRubS8O1ekB5U+QBB1JkjhlePuO+On7WfOyS
         oZ8SZOtsz8Dyha5dzRUTYnKyjArttcpVqkP6JKsEwmUglx9qBxixA9nyg8aOZf6G+uA6
         7sfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=px4w9p6FHG6OgnsadU3BymipOoWoC+t5cmMfFNjEzMs=;
        b=Gjsfx3FXQ9x4NVlQbDhuOmAT6xiULtgjmWI+B+eq0+a7u0up6jtm3ipJ+mKrw1GvoT
         8WMg7YeVVgoXd0RuRTOv9M3CVGrnOwFXmLTL+w4IXdQ/BgdovtRmmU/2sLEIUkYgjrY7
         /FMyhsWm977TkOO6DJyEW65WHM+kZydR4OePOOoBxJU67VerHo3+6jTivQoHW0RB1FxH
         w7C/zh2SyqV/cQGV0+15f/NULb4qG1mtlTtTVbvqAogJmanf4YuONe6m61iBfPtoaEfE
         vUOeDmHpLCoMkPK0in5QuVfQ0XkUqmQr2RIOtNX5tX6xEFi2vAh+Ns3bGHuAbynjhOBP
         wSQg==
X-Gm-Message-State: APjAAAUjy99x4butFVYERFW44cASSkh7v2nPBsmv9MVk3CZ9rnBoy1oo
        W9Efa/ZJDY5W+it+sZJy/ILoWksq
X-Google-Smtp-Source: APXvYqzn3qfAjWScMTVKjJnCtrwPDer4X8DKQliNxgBrPo9sv7X+Bu+2GRDiXp6VVuodEZy1395kpA==
X-Received: by 2002:a62:547:: with SMTP id 68mr10152237pff.217.1581810535351;
        Sat, 15 Feb 2020 15:48:55 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id t11sm11607289pgi.15.2020.02.15.15.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:48:54 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:48:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-input@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: ili210x - add ili2120 support
Message-ID: <20200215234852.GM183709@dtor-ws>
References: <20200209151904.661210-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200209151904.661210-1-luca@z3ntu.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Feb 09, 2020 at 04:19:03PM +0100, Luca Weiss wrote:
> This adds support for the Ilitek ili2120 touchscreen found in the
> Fairphone 2 smartphone.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Applied, thank you.

> ---
> Changes from v1:
> - Rebase on master, adjust for upstream changes
> 
>  .../bindings/input/ilitek,ili2xxx.txt         |  3 +-
>  drivers/input/touchscreen/ili210x.c           | 32 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
> index dc194b2c151a..cdcaa3f52d25 100644
> --- a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
> +++ b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
> @@ -1,9 +1,10 @@
> -Ilitek ILI210x/ILI2117/ILI251x touchscreen controller
> +Ilitek ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller
>  
>  Required properties:
>  - compatible:
>      ilitek,ili210x for ILI210x
>      ilitek,ili2117 for ILI2117
> +    ilitek,ili2120 for ILI2120
>      ilitek,ili251x for ILI251x
>  
>  - reg: The I2C address of the device
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 84bf51d79888..199cf3daec10 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -167,6 +167,36 @@ static const struct ili2xxx_chip ili211x_chip = {
>  	.resolution		= 2048,
>  };
>  
> +static bool ili212x_touchdata_to_coords(const u8 *touchdata,
> +					unsigned int finger,
> +					unsigned int *x, unsigned int *y)
> +{
> +	u16 val;
> +
> +	val = get_unaligned_be16(touchdata + 3 + (finger * 5) + 0);
> +	if (!(val & BIT(15)))	/* Touch indication */
> +		return false;
> +
> +	*x = val & 0x3fff;
> +	*y = get_unaligned_be16(touchdata + 3 + (finger * 5) + 2);
> +
> +	return true;
> +}
> +
> +static bool ili212x_check_continue_polling(const u8 *data, bool touch)
> +{
> +	return touch;
> +}
> +
> +static const struct ili2xxx_chip ili212x_chip = {
> +	.read_reg		= ili210x_read_reg,
> +	.get_touch_data		= ili210x_read_touch_data,
> +	.parse_touch_data	= ili212x_touchdata_to_coords,
> +	.continue_polling	= ili212x_check_continue_polling,
> +	.max_touches		= 10,
> +	.has_calibrate_reg	= true,
> +};
> +
>  static int ili251x_read_reg(struct i2c_client *client,
>  			    u8 reg, void *buf, size_t len)
>  {
> @@ -447,6 +477,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  static const struct i2c_device_id ili210x_i2c_id[] = {
>  	{ "ili210x", (long)&ili210x_chip },
>  	{ "ili2117", (long)&ili211x_chip },
> +	{ "ili2120", (long)&ili212x_chip },
>  	{ "ili251x", (long)&ili251x_chip },
>  	{ }
>  };
> @@ -455,6 +486,7 @@ MODULE_DEVICE_TABLE(i2c, ili210x_i2c_id);
>  static const struct of_device_id ili210x_dt_ids[] = {
>  	{ .compatible = "ilitek,ili210x", .data = &ili210x_chip },
>  	{ .compatible = "ilitek,ili2117", .data = &ili211x_chip },
> +	{ .compatible = "ilitek,ili2120", .data = &ili212x_chip },
>  	{ .compatible = "ilitek,ili251x", .data = &ili251x_chip },
>  	{ }
>  };
> -- 
> 2.25.0
> 

-- 
Dmitry
