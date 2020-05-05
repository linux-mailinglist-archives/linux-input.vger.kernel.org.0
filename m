Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1E31C51AE
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 11:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgEEJQd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 05:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727931AbgEEJQd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 05:16:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C082C061A0F
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 02:16:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jVtgl-00072A-T2; Tue, 05 May 2020 11:16:31 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jVtgl-0002O0-Au; Tue, 05 May 2020 11:16:31 +0200
Date:   Tue, 5 May 2020 11:16:31 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v2 3/3] input: touchscreen: ads7846: switch to gpiod API
Message-ID: <20200505091631.GC18755@pengutronix.de>
References: <20200504173745.1246505-1-daniel@zonque.org>
 <20200504173745.1246505-3-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504173745.1246505-3-daniel@zonque.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:37:12 up 73 days, 19:54, 142 users,  load average: 4.70, 4.52,
 4.23
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

thanks for picking my suggestion and converting the driver :)
Unfortunately it is not that easy since we need to care about the
existing users. You will get the legacy users if you grep for
ads7846_platform_data. Those platforms needs to converted to.

Again, pls align the commit subject prefix with the existing patches.

On 20-05-04 19:37, Daniel Mack wrote:
> Use gpiod_* function to access the pendown GPIO line.

Maybe this is better:
Input: ads7846 - Convert to GPIO descriptors                                                                                                                                            

This converts the ads7846 touchscreen driver to use GPIO                                                                                                                                                      
descriptors and switches all platform data boards over
to passing descriptors instead of global GPIO numbers.                                                                                                                                                          

We use the "pendown-gpio" name as found in the device
tree bindings for this touchscreen driver.

> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  drivers/input/touchscreen/ads7846.c | 53 ++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index 7f4ead542a73..b3e17ee4e499 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -27,7 +27,7 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/of_device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spi/ads7846.h>
>  #include <linux/regulator/consumer.h>
> @@ -137,7 +137,7 @@ struct ads7846 {
>  	void			*filter_data;
>  	void			(*filter_cleanup)(void *data);
>  	int			(*get_pendown_state)(void);
> -	int			gpio_pendown;
> +	struct gpio_desc	*gpio_pendown;
>  
>  	void			(*wait_for_sync)(void);
>  };
> @@ -598,7 +598,7 @@ static int get_pendown_state(struct ads7846 *ts)
>  	if (ts->get_pendown_state)
>  		return ts->get_pendown_state();
>  
> -	return !gpio_get_value(ts->gpio_pendown);
> +	return !gpiod_get_value(ts->gpio_pendown);

The gpio_get_value() function return the raw value and the ! before
inverts the logic. Thanks to gpiod we don't need to care about this
inverting logic anymore.

>  }
>  
>  static void null_wait_for_sync(void)
> @@ -919,6 +919,7 @@ static int ads7846_setup_pendown(struct spi_device *spi,
>  				 struct ads7846 *ts,
>  				 const struct ads7846_platform_data *pdata)
>  {
> +	struct device *dev = &spi->dev;
>  	int err;
>  
>  	/*
> @@ -929,27 +930,33 @@ static int ads7846_setup_pendown(struct spi_device *spi,
>  
>  	if (pdata->get_pendown_state) {
>  		ts->get_pendown_state = pdata->get_pendown_state;
> -	} else if (gpio_is_valid(pdata->gpio_pendown)) {
> -
> -		err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
> -					    GPIOF_IN, "ads7846_pendown");
> -		if (err) {
> -			dev_err(&spi->dev,
> -				"failed to request/setup pendown GPIO%d: %d\n",
> -				pdata->gpio_pendown, err);
> -			return err;
> -		}
> +		return 0;
> +	}
>  
> -		ts->gpio_pendown = pdata->gpio_pendown;
> +	ts->gpio_pendown = devm_gpiod_get(dev, "pendown", GPIOD_IN);
> +	if (IS_ERR(ts->gpio_pendown)) {
> +		err = PTR_ERR(ts->gpio_pendown);
>  
> -		if (pdata->gpio_pendown_debounce)
> -			gpio_set_debounce(pdata->gpio_pendown,
> -					  pdata->gpio_pendown_debounce);
> -	} else {
> -		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> -		return -EINVAL;
> +		if (gpio_is_valid(pdata->gpio_pendown)) {
> +			err = devm_gpio_request_one(dev, pdata->gpio_pendown,
> +						    GPIOF_IN,
> +						    "ads7846_pendown");
> +			if (err < 0)
> +				return err;
> +
> +			ts->gpio_pendown = gpio_to_desc(pdata->gpio_pendown);
> +			if (!ts->gpio_pendown)
> +				return -EINVAL;
> +		}
> +
> +		if (err < 0)
> +			return err;
>  	}
>  
> +	if (pdata->gpio_pendown_debounce)
> +		gpiod_set_debounce(ts->gpio_pendown,
> +				   pdata->gpio_pendown_debounce);
> +
>  	return 0;
>  }
>  
> @@ -1236,8 +1243,6 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
>  	pdata->wakeup = of_property_read_bool(node, "wakeup-source") ||
>  			of_property_read_bool(node, "linux,wakeup");
>  
> -	pdata->gpio_pendown = of_get_named_gpio(dev->of_node, "pendown-gpio", 0);
> -
>  	return pdata;
>  }

It's a bit hard to follow the changes within ads7846_setup_pendown(). To
make it easier and IMHO cleaner to everyone we should convert the
ads7846_platform_data to gpio_desc too and request the gpio within the
ads7846_probe_dt() function. Pls take a look on this patchset [1] from 
Linus. There you will get all informations who platform data based
machines can be changed usign gpiod_lookup_table's.

[1] https://patches.linaro.org/patch/185481/

Thanks for working on this =)
Regards,
  Marco

>  #else
> @@ -1340,8 +1345,10 @@ static int ads7846_probe(struct spi_device *spi)
>  	}
>  
>  	err = ads7846_setup_pendown(spi, ts, pdata);
> -	if (err)
> +	if (err) {
> +		dev_err(dev, "Unable to request pendown GPIO: %d", err);
>  		goto err_cleanup_filter;
> +	}
>  
>  	if (pdata->penirq_recheck_delay_usecs)
>  		ts->penirq_recheck_delay_usecs =
> -- 
> 2.26.2
