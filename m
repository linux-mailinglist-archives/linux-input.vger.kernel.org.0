Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D51610B057
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 14:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfK0NgE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 08:36:04 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59505 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfK0NgE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 08:36:04 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxU7-00034M-ND; Wed, 27 Nov 2019 14:35:59 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxU7-0000zW-2W; Wed, 27 Nov 2019 14:35:59 +0100
Date:   Wed, 27 Nov 2019 14:35:59 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nick Dyer <nick@shmanahar.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: atmel_mxt_ts - allow specification of config
 name
Message-ID: <20191127133559.bgho6fcr76o5vfst@pengutronix.de>
References: <20191127125456.9672-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127125456.9672-1-l.stach@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:29:21 up 12 days,  4:47, 24 users,  load average: 0.08, 0.03,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lucas,

just two nitpicks.

On 19-11-27 13:54, Lucas Stach wrote:
> From: Nick Dyer <nick@shmanahar.org>
> 
> Signed-off-by: Nick Dyer <nick@shmanahar.org>
> ---
> v2: Switch to linux instead of atmel as vendor prefix.
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Don't know the git behaviour but where happens the cut if we have two
'---'?

>  Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 3 +++
>  drivers/input/touchscreen/atmel_mxt_ts.c                   | 6 +++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> index c88919480d37..0764c7af045c 100644
> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> @@ -31,6 +31,9 @@ Optional properties for main touchpad device:
>  
>  - reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
>  
> +- linux,cfg-name: Provide name of configuration file in OBP_RAW format. This
> +    will be downloaded from the firmware loader on probe to the device.
> +
>  Example:
>  
>  	touch@4b {
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 24c4b691b1c9..60997086763b 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -308,6 +308,7 @@ struct mxt_data {
>  	struct t7_config t7_cfg;
>  	struct mxt_dbg dbg;
>  	struct gpio_desc *reset_gpio;
> +	const char *cfg_name;
>  
>  	/* Cached parameters from object table */
>  	u16 T5_address;
> @@ -2142,7 +2143,8 @@ static int mxt_initialize(struct mxt_data *data)
>  	if (error)
>  		return error;
>  
> -	error = request_firmware_nowait(THIS_MODULE, true, MXT_CFG_NAME,
> +	error = request_firmware_nowait(THIS_MODULE, true,
> +					data->cfg_name ? : MXT_CFG_NAME,

This will produce a warning if clang is used [1]. I don't know if we
should introduce gcc-extensions.

[1] https://releases.llvm.org/8.0.0/tools/clang/docs/DiagnosticsReference.html#wgnu-conditional-omitted-operand

Regards,
  Marco

>  					&client->dev, GFP_KERNEL, data,
>  					mxt_config_cb);
>  	if (error) {
> @@ -3015,6 +3017,8 @@ static int mxt_parse_device_properties(struct mxt_data *data)
>  		data->t19_num_keys = n_keys;
>  	}
>  
> +	device_property_read_string(dev, "linux,cfg-name", &data->cfg_name);
> +
>  	return 0;
>  }
>  
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
