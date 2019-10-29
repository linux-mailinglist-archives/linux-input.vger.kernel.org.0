Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1AF2E7F03
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 05:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbfJ2EMh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 00:12:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35349 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfJ2EMh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 00:12:37 -0400
Received: by mail-pg1-f196.google.com with SMTP id c8so8583093pgb.2;
        Mon, 28 Oct 2019 21:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fotQTCwFbUkGmWq3Vfv6xZ57FAEae+iQDNEiUNGXyFA=;
        b=rnSsf3KEcCyiauJP+dBU6It92AJHO4FKeAHf4yULj5px2zirNuwEj6WeFeUVS/BfN4
         yG2fgpEZKrbwiCY9/HlGRBKEg4Odvucywf3sn2BcSZhUTkWujkhrFw5A6aHHeXmL9lQK
         xf0wIqjNH1sYqBeKxN5OHbrR52ZgyZBAklVxVXsG5xzc/Exxft+TivBLBvQqIIBB7mtt
         sYJXojKde/nKs2PFakGZiwCdHeOJM6E0XKOyxiWq3rAXeeqGBGWGmHRH9LbXIuR+WcDu
         GHCb6AjItnZphJuyW+CPvn9qgQIISr0RX6Vm83xfRBMn34d5BKEt+CbRvYz+UEQNHNmj
         6hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fotQTCwFbUkGmWq3Vfv6xZ57FAEae+iQDNEiUNGXyFA=;
        b=g140WkzCzUh1PLS0HJRRuWAjCXmLvdv3HhfPTM/LvKuJESMRoWNLyFvdPGsVSWuI2w
         Ka3FiG9cdZ5CCJ3DnxQzfKqv0KVLZEvCzhNMCmlXk+NTpZtMxhIHkWYLGr/a6OUupvkt
         BCgNJLlBUYMUvti2BZdTdoK+vXZ2hzst/EqpbmTuP7+Jeu6aEhDwo0P5PLsmJtOS2cUe
         1R1a2IEJrVZVwP0ZwQ9MdQJPf5HlcSNNnzXMhEuU8UZSd0MCnctCJoAWdLTbFz9B3bzC
         Ki1+jIRLpye8ivyPqr/WLaAnlSv48iwHYs8XBD0j+NMHDOLWn2nfusN7xtV2fg8HZ0hA
         5Huw==
X-Gm-Message-State: APjAAAWYEdwz3TnHIPgEIlcNROnNwl7dIbqEseoP7E3RlGYsfDwLAWkz
        FoU1pLfrhmU9Sr366LccPEM=
X-Google-Smtp-Source: APXvYqzhn7DFilMbyw5b9cTxX4wjvnl0wGuIeOA2ub7dz46QVLXJbdGYxKU0J0WYmxtsidT/2aaW9Q==
X-Received: by 2002:a63:1e59:: with SMTP id p25mr24365509pgm.361.1572322356001;
        Mon, 28 Oct 2019 21:12:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id t13sm11663745pfh.12.2019.10.28.21.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 21:12:35 -0700 (PDT)
Date:   Mon, 28 Oct 2019 21:12:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] input: edt-ft5x06: Add support for regulator
Message-ID: <20191029041233.GD57214@dtor-ws>
References: <20191029005806.3577376-1-megous@megous.com>
 <20191029005806.3577376-2-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029005806.3577376-2-megous@megous.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 29, 2019 at 01:58:04AM +0100, Ondrej Jirman wrote:
> From: Mylène Josserand <mylene.josserand@bootlin.com>
> 
> Add the support for enabling optional regulator that may be used as VCC
> source.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 30 ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 5525f1fb1526..d61731c0037d 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -28,6 +28,7 @@
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
>  #include <asm/unaligned.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define WORK_REGISTER_THRESHOLD		0x00
>  #define WORK_REGISTER_REPORT_RATE	0x08
> @@ -88,6 +89,7 @@ struct edt_ft5x06_ts_data {
>  	struct touchscreen_properties prop;
>  	u16 num_x;
>  	u16 num_y;
> +	struct regulator *vcc;
>  
>  	struct gpio_desc *reset_gpio;
>  	struct gpio_desc *wake_gpio;
> @@ -1036,6 +1038,13 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
>  	}
>  }
>  
> +static void edt_ft5x06_disable_regulator(void *arg)
> +{
> +	struct edt_ft5x06_ts_data *data = arg;
> +
> +	regulator_disable(data->vcc);
> +}
> +
>  static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  					 const struct i2c_device_id *id)
>  {
> @@ -1064,6 +1073,27 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  
>  	tsdata->max_support_points = chip_data->max_support_points;
>  
> +	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
> +	if (IS_ERR(tsdata->vcc)) {
> +		error = PTR_ERR(tsdata->vcc);
> +		if (error != -EPROBE_DEFER)
> +			dev_err(&client->dev,
> +				"failed to request regulator: %d\n", error);
> +		return error;
> +	}
> +
> +	error = regulator_enable(tsdata->vcc);
> +	if (error < 0) {
> +		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
> +		return error;
> +	}
> +
> +	error = devm_add_action_or_reset(&client->dev,
> +					 edt_ft5x06_disable_regulator,
> +					 tsdata);
> +	if (error)
> +		return error;
> +
>  	tsdata->reset_gpio = devm_gpiod_get_optional(&client->dev,
>  						     "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(tsdata->reset_gpio)) {
> -- 
> 2.23.0
> 

-- 
Dmitry
