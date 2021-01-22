Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5814E300806
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 17:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbhAVP7H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 10:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729233AbhAVP6o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 10:58:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603C1C06174A
        for <linux-input@vger.kernel.org>; Fri, 22 Jan 2021 07:58:03 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2yox-0001iz-WF; Fri, 22 Jan 2021 16:58:00 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2yox-0000vm-JO; Fri, 22 Jan 2021 16:57:59 +0100
Date:   Fri, 22 Jan 2021 16:57:59 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, alistair23@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] input/touchscreen: Add device tree support to
 wacom_i2c
Message-ID: <20210122155759.zkpmbskjoewvhpcx@pengutronix.de>
References: <20210121065643.342-1-alistair@alistair23.me>
 <20210121065643.342-3-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121065643.342-3-alistair@alistair23.me>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:50:30 up 51 days,  5:56, 28 users,  load average: 0.17, 0.11,
 0.05
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 21-01-20 22:56, Alistair Francis wrote:
> Allow the wacom-i2c device to be exposed via device tree.

You did a lot more than exposing.

> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../input/touchscreen/wacom,wacom-i2c.yaml       |  4 ++++
>  drivers/input/touchscreen/wacom_i2c.c            | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> index b36d22cd20a2..06ad5ee561af 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> @@ -22,6 +22,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  vdd-supply:
> +    maxItems: 1
> +

Unrelated change.

>  required:
>    - compatible
>    - reg
> @@ -40,5 +43,6 @@ examples:
>                  reg = <0x9>;
>                  interrupt-parent = <&gpio1>;
>                  interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +                vdd-supply = <&reg_touch>;

Dito.

>          };
>      };
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 1afc6bde2891..ec6e0aff8deb 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -11,7 +11,9 @@
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/irq.h>
> +#include <linux/input/touchscreen.h>

Unrelated change.

>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <asm/unaligned.h>
>  
>  #define WACOM_CMD_QUERY0	0x04
> @@ -32,6 +34,7 @@ struct wacom_features {
>  struct wacom_i2c {
>  	struct i2c_client *client;
>  	struct input_dev *input;
> +	struct touchscreen_properties props;
>  	u8 data[WACOM_QUERY_SIZE];
>  	bool prox;
>  	int tool;
> @@ -187,6 +190,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  	__set_bit(BTN_STYLUS2, input->keybit);
>  	__set_bit(BTN_TOUCH, input->keybit);
>  
> +	touchscreen_parse_properties(input, true, &wac_i2c->props);

Unrelated change, please move it into a sepreate patch.

>  	input_set_abs_params(input, ABS_X, 0, features.x_max, 0, 0);
>  	input_set_abs_params(input, ABS_Y, 0, features.y_max, 0, 0);
>  	input_set_abs_params(input, ABS_PRESSURE,
> @@ -214,6 +218,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  	}
>  
>  	i2c_set_clientdata(client, wac_i2c);
> +

Unrelated change.

>  	return 0;
>  
>  err_free_irq:
> @@ -262,10 +267,21 @@ static const struct i2c_device_id wacom_i2c_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
>  
> +#ifdef CONFIG_OF

This #ifdef can be removed using the __maybe_unused macro.

> +static const struct of_device_id wacom_i2c_of_match_table[] = {
> +	{ .compatible = "wacom,wacom-i2c" },

IMHO "wacom,wacom-i2c" is not good maybe:
 - "wacom,generic" if you don't know the device, or
 - "wacom,XYZ" where XYZ belongs to the real device name.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
> +#endif
> +
>  static struct i2c_driver wacom_i2c_driver = {
>  	.driver	= {
>  		.name	= "wacom_i2c",
>  		.pm	= &wacom_i2c_pm,
> +#ifdef CONFIG_OF
> +		.of_match_table = of_match_ptr(wacom_i2c_of_match_table),
> +#endif

No need for this #ifdef.

Regards,
  Marco


>  	},
>  
>  	.probe		= wacom_i2c_probe,
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
