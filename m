Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDF83F4597
	for <lists+linux-input@lfdr.de>; Mon, 23 Aug 2021 09:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbhHWHHv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Aug 2021 03:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbhHWHHv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Aug 2021 03:07:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460B4C061575
        for <linux-input@vger.kernel.org>; Mon, 23 Aug 2021 00:07:09 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1mI42v-0007m7-6A; Mon, 23 Aug 2021 09:07:01 +0200
Subject: Re: [PATCH v9 05/11] Input: wacom_i2c - Add support for distance and
 tilt x/y
To:     Alistair Francis <alistair@alistair23.me>,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     alistair23@gmail.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210818154935.1154-1-alistair@alistair23.me>
 <20210818154935.1154-6-alistair@alistair23.me>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <e3d7b9be-cf0e-7074-3e49-45dbff27ce8d@pengutronix.de>
Date:   Mon, 23 Aug 2021 09:06:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818154935.1154-6-alistair@alistair23.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 18.08.21 17:49, Alistair Francis wrote:
> Add support for the distance and tilt x/y.
> 
> This is based on the out of tree rM2 driver.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 35 +++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 28255c77d426..4d0c19fbada4 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c

> +	/* Signed */
> +	tilt_x = le16_to_cpup((__le16 *)&data[11]);
> +	tilt_y = le16_to_cpup((__le16 *)&data[13]);
> +
> +	distance = le16_to_cpup((__le16 *)&data[15]);

Use get_unaligned_u16 for all three. The existing code doesn't need to do this,
because with the current struct layout, the array is suitable aligned
for 2 byte accesses. You are accessing data at odd indices though, so you
need to use an unaligned accessor.

Cheers,
Ahmad

> +
>  	if (!wac_i2c->prox)
>  		wac_i2c->tool = (data[3] & 0x0c) ?
>  			BTN_TOOL_RUBBER : BTN_TOOL_PEN;
> @@ -127,6 +151,9 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>  	input_report_abs(input, ABS_X, x);
>  	input_report_abs(input, ABS_Y, y);
>  	input_report_abs(input, ABS_PRESSURE, pressure);
> +	input_report_abs(input, ABS_DISTANCE, distance);
> +	input_report_abs(input, ABS_TILT_X, tilt_x);
> +	input_report_abs(input, ABS_TILT_Y, tilt_y);
>  	input_sync(input);
>  
>  out:
> @@ -202,7 +229,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  	input_set_abs_params(input, ABS_Y, 0, features->y_max, 0, 0);
>  	input_set_abs_params(input, ABS_PRESSURE,
>  			     0, features->pressure_max, 0, 0);
> -
> +	input_set_abs_params(input, ABS_DISTANCE, 0, features->distance_max, 0, 0);
> +	input_set_abs_params(input, ABS_TILT_X, -features->tilt_x_max,
> +			     features->tilt_x_max, 0, 0);
> +	input_set_abs_params(input, ABS_TILT_Y, -features->tilt_y_max,
> +			     features->tilt_y_max, 0, 0);
>  	input_set_drvdata(input, wac_i2c);
>  
>  	error = devm_request_threaded_irq(dev, client->irq, NULL, wacom_i2c_irq,
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
