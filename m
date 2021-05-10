Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AF237980F
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 21:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhEJT71 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 15:59:27 -0400
Received: from vps.xff.cz ([195.181.215.36]:34694 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230449AbhEJT71 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 15:59:27 -0400
X-Greylist: delayed 572 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 May 2021 15:59:27 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1620676128; bh=B8eHJulLMTIqpRqowzaDBTTzCNcHgp/teURVcQYxNS4=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=BrTFONPTUjkWY9rf4LG9yAWo+bsptjWkzwzbZlFZ5oN+mL5893WCbWvFpN5lDy57z
         pxzQ5DvtbRz38W4d8wyB8+K6EDi3wkuCk1lPLjTCYWMTc/R5D1NWfYhuvWnA4gKmkV
         3fRmUhhspitnwvJAiJJL3kRrXA/HEJWqf8jgBsuQ=
Date:   Mon, 10 May 2021 21:48:48 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Message-ID: <20210510194848.g7cgty3lirxkht5g@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210510193108.50178-1-stephan@gerhold.net>
 <20210510193108.50178-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510193108.50178-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Stephan,

On Mon, May 10, 2021 at 09:31:08PM +0200, Stephan Gerhold wrote:
> At the moment, the edt-ft5x06 driver can control a single regulator
> ("vcc"). However, some FocalTech touch controllers have an additional
> IOVCC pin that should be supplied with the digital I/O voltage.
> 
> The I/O voltage might be provided by another regulator that should also
> be kept on. Otherwise, the touchscreen can randomly stop functioning if
> the regulator is turned off because no other components still require it.
> 
> Implement (optional) support for also enabling an "iovcc-supply".
> The datasheet specifies a delay of ~ 10us before enabling VDD/VCC
> after IOVCC is enabled, so make sure to enable IOVCC first.
> 
> Cc: Ondrej Jirman <megous@megous.com>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Sorry about the long delay, couldn't find the time to test the new changes :)
> 
> Changes in v2:
>   - Respect 10us delay between enabling IOVCC and VDD/VCC line
>     (suggested by Marco Felsch)
> 
> v1: https://lore.kernel.org/linux-input/20210108192337.563679-2-stephan@gerhold.net/
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 34 ++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 2eefbc2485bc..d3271856bb5c 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -104,6 +104,7 @@ struct edt_ft5x06_ts_data {
>  	u16 num_x;
>  	u16 num_y;
>  	struct regulator *vcc;
> +	struct regulator *iovcc;
>  
>  	struct gpio_desc *reset_gpio;
>  	struct gpio_desc *wake_gpio;
> @@ -1067,6 +1068,7 @@ static void edt_ft5x06_disable_regulator(void *arg)
>  	struct edt_ft5x06_ts_data *data = arg;
>  
>  	regulator_disable(data->vcc);
> +	regulator_disable(data->iovcc);
>  }
>  
>  static int edt_ft5x06_ts_probe(struct i2c_client *client,
> @@ -1107,9 +1109,28 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> +	tsdata->iovcc = devm_regulator_get(&client->dev, "iovcc");
> +	if (IS_ERR(tsdata->iovcc)) {
> +		error = PTR_ERR(tsdata->iovcc);
> +		if (error != -EPROBE_DEFER)
> +			dev_err(&client->dev,
> +				"failed to request iovcc regulator: %d\n", error);

Please use dev_err_probe instead. If this pattern is used for vcc-supply, maybe
change that too. Maybe also consider using a bulk regulator API.

Thank you,
	o.

> +		return error;
> +	}
> +
> +	error = regulator_enable(tsdata->iovcc);
> +	if (error < 0) {
> +		dev_err(&client->dev, "failed to enable iovcc: %d\n", error);
> +		return error;
> +	}
> +
> +	/* Delay enabling VCC for > 10us (T_ivd) after IOVCC */
> +	usleep_range(10, 100);
> +
>  	error = regulator_enable(tsdata->vcc);
>  	if (error < 0) {
>  		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
> +		regulator_disable(tsdata->iovcc);
>  		return error;
>  	}
>  
> @@ -1289,6 +1310,9 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
>  	ret = regulator_disable(tsdata->vcc);
>  	if (ret)
>  		dev_warn(dev, "Failed to disable vcc\n");
> +	ret = regulator_disable(tsdata->iovcc);
> +	if (ret)
> +		dev_warn(dev, "Failed to disable iovcc\n");
>  
>  	return 0;
>  }
> @@ -1319,9 +1343,19 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
>  		gpiod_set_value_cansleep(reset_gpio, 1);
>  		usleep_range(5000, 6000);
>  
> +		ret = regulator_enable(tsdata->iovcc);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable iovcc\n");
> +			return ret;
> +		}
> +
> +		/* Delay enabling VCC for > 10us (T_ivd) after IOVCC */
> +		usleep_range(10, 100);
> +
>  		ret = regulator_enable(tsdata->vcc);
>  		if (ret) {
>  			dev_err(dev, "Failed to enable vcc\n");
> +			regulator_disable(tsdata->iovcc);
>  			return ret;
>  		}
>  
> -- 
> 2.31.1
> 
