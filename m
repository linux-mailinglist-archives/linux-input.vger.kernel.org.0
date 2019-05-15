Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E671E7B8
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 06:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbfEOElU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 00:41:20 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50461 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOElU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 00:41:20 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hQljB-0005jj-St; Wed, 15 May 2019 06:41:17 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hQljA-0001MD-V4; Wed, 15 May 2019 06:41:16 +0200
Date:   Wed, 15 May 2019 06:41:16 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Martijn Braam <martijn@brixit.nl>
Cc:     dmitry.torokhov@gmail.com, robh@kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - add vdd supply
Message-ID: <20190515044116.ss6usdlc2yb2aqwe@pengutronix.de>
References: <20190514212111.21742-1-martijn@brixit.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514212111.21742-1-martijn@brixit.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:38:45 up 116 days,  9:20, 91 users,  load average: 0.00, 0.02,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Martijn,

On 19-05-14 23:21, Martijn Braam wrote:
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

This will break current device tree's and this should never happen. So
we need to make this regulator optional.
BTW:
Did you changed the bindings too?

Regards,
  Marco

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
>  	edt_ft5x06_ts_teardown_debugfs(tsdata);
>  
>  	return 0;
> -- 
> 2.21.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
