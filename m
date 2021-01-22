Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89049300810
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 17:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbhAVQBG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 11:01:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbhAVQAw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 11:00:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCD8C06174A
        for <linux-input@vger.kernel.org>; Fri, 22 Jan 2021 08:00:10 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2yr1-0001zX-2X; Fri, 22 Jan 2021 17:00:07 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2yr0-0000wP-Db; Fri, 22 Jan 2021 17:00:06 +0100
Date:   Fri, 22 Jan 2021 17:00:06 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, alistair23@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] touchscreen/wacom_i2c: Add support for distance
 and tilt x/y
Message-ID: <20210122160006.rh7bzmbr4jvvejzx@pengutronix.de>
References: <20210121065643.342-1-alistair@alistair23.me>
 <20210121065643.342-4-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121065643.342-4-alistair@alistair23.me>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:59:10 up 51 days,  6:05, 28 users,  load average: 0.07, 0.08,
 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

thanks for the patch. Please align all your patch-subjects belonging to
the driver to: "Input: wacom_i2c - ..."

On 21-01-20 22:56, Alistair Francis wrote:
> This is based on the out of tree rM2 driver.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index ec6e0aff8deb..5f0b80d52ad5 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -22,12 +22,16 @@
>  #define WACOM_CMD_QUERY3	0x02
>  #define WACOM_CMD_THROW0	0x05
>  #define WACOM_CMD_THROW1	0x00
> -#define WACOM_QUERY_SIZE	19
> +#define WACOM_QUERY_SIZE	22
>  
>  struct wacom_features {
>  	int x_max;
>  	int y_max;
>  	int pressure_max;
> +	int distance_max;
> +	int distance_physical_max;
> +	int tilt_x_max;
> +	int tilt_y_max;
>  	char fw_version;
>  };
>  
> @@ -79,6 +83,10 @@ static int wacom_query_device(struct i2c_client *client,
>  	features->y_max = get_unaligned_le16(&data[5]);
>  	features->pressure_max = get_unaligned_le16(&data[11]);
>  	features->fw_version = get_unaligned_le16(&data[13]);
> +	features->distance_max = data[15];
> +	features->distance_physical_max = data[16];
> +	features->tilt_x_max = get_unaligned_le16(&data[17]);
> +	features->tilt_y_max = get_unaligned_le16(&data[19]);
>  
>  	dev_dbg(&client->dev,
>  		"x_max:%d, y_max:%d, pressure:%d, fw:%d\n",
> @@ -95,6 +103,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>  	u8 *data = wac_i2c->data;
>  	unsigned int x, y, pressure;
>  	unsigned char tsw, f1, f2, ers;
> +	short tilt_x, tilt_y, distance;
>  	int error;
>  
>  	error = i2c_master_recv(wac_i2c->client,
> @@ -109,6 +118,11 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>  	x = le16_to_cpup((__le16 *)&data[4]);
>  	y = le16_to_cpup((__le16 *)&data[6]);
>  	pressure = le16_to_cpup((__le16 *)&data[8]);
> +	distance = data[10];
> +
> +	/* Signed */
> +	tilt_x = le16_to_cpup((__le16 *)&data[11]);
> +	tilt_y = le16_to_cpup((__le16 *)&data[13]);
>  
>  	if (!wac_i2c->prox)
>  		wac_i2c->tool = (data[3] & 0x0c) ?
> @@ -123,6 +137,9 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
>  	input_report_abs(input, ABS_X, x);
>  	input_report_abs(input, ABS_Y, y);
>  	input_report_abs(input, ABS_PRESSURE, pressure);
> +	input_report_abs(input, ABS_DISTANCE, distance);
> +	input_report_abs(input, ABS_TILT_X, tilt_x);
> +	input_report_abs(input, ABS_TILT_Y, tilt_y);
>  	input_sync(input);
>  
>  out:
> @@ -195,7 +212,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
>  	input_set_abs_params(input, ABS_PRESSURE,
>  			     0, features.pressure_max, 0, 0);
> -
> +	input_set_abs_params(input, ABS_DISTANCE, 0, features.distance_max, 0, 0);
> +	input_set_abs_params(input, ABS_TILT_X, -features.tilt_x_max,
> +			     features.tilt_x_max, 0, 0);
> +	input_set_abs_params(input, ABS_TILT_Y, -features.tilt_y_max,
> +			     features.tilt_y_max, 0, 0);
>  	input_set_drvdata(input, wac_i2c);
>  
>  	error = request_threaded_irq(client->irq, NULL, wacom_i2c_irq,
> -- 
> 2.29.2
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
