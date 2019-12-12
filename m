Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC93511C191
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 01:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfLLAkF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 19:40:05 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39471 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbfLLAkE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 19:40:04 -0500
Received: by mail-lf1-f65.google.com with SMTP id y1so286460lfb.6;
        Wed, 11 Dec 2019 16:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TpJH9BlElad3H0V4gG9h4C/bHptIUDCHOUjpJVyqbUA=;
        b=JdBcIRfMMJOBFOLxBeF3DmUoI367S2ToCKWECl5WFJrWqWDivIvTc4Zfy/IXeqMzUc
         1DNPdNALRi0bJJZ0tHyoWwa+rJKKly7PD0puQg9hukRknq3B5qlv9RwZjwCv8+cmdrEy
         s/oKy7MWHXHD2XpaFhhBopkeGxpgUYtfeTuOKjqMEuMPktm0cPUT047gD7V+RDg50VOk
         kCLO1tsGpBxHW4G8avFlDmyLdsC/wpMfcWJyK0K/BKqxPpMv42kaI8BkLSO7ODUXnsTd
         Yx5Y7J77JXntPgOmSs/93485xM+RzTOUQUI5PRD+SIMs7cWK6XVtYtnyMlzJOOJAYuEF
         5wsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TpJH9BlElad3H0V4gG9h4C/bHptIUDCHOUjpJVyqbUA=;
        b=HH9i/+Sz/DN3XtX1PcdNNyhFeNor/soc5lNowsaTIbWTsxnJnGB60gyLdWK6ZDgwmo
         W8UF8igxu+twJccGVDL+PdW9MHZYCS5h29E6z3cgpIFO+V2kPnxqJzb8Lc7luUO33c+R
         2ZCoOxMDcjPS2cpBGT1DUbPN6MHn4usHElL4WsgmZsjAeQ+N8jR2Z/761dpDNMAmuxZW
         PxDEWQeqcW2lvRXd7P+QdGWfl6AVFrWr1v4d1Gxu2c7NJx7/UqBJlB49mnne1PDY2WLm
         dGX4/o7jZR2mSp3iTQ0Kl7NMz23DzO4om0dGSoaFqX3AWRp/9yxy8GXJEF+0acYAz3hm
         GFSQ==
X-Gm-Message-State: APjAAAXhAtOs5b8ZD1YhoTX2Q8J03O9SmEft0VQp7f1YgfHrIiK8vY56
        ID4Tn9JQgADHFRsRfBlTLq4=
X-Google-Smtp-Source: APXvYqxCaF9G5jq2+1tBeC+ziEjigehiraVTobWk5dm7OyCXgDEvvo4QoZg699z+c2uIHLp3IfxZhA==
X-Received: by 2002:ac2:5dc7:: with SMTP id x7mr4055295lfq.24.1576111201548;
        Wed, 11 Dec 2019 16:40:01 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id n3sm1929009lfk.61.2019.12.11.16.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:40:00 -0800 (PST)
Subject: Re: [PATCH v2 6/9] input: elants: read touchscreen size for EKTF3624
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <a9681f2f1b64d9677886dd81c228b0194298277d.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0fb2f4fa-0556-4025-e029-f8eab8aacf7d@gmail.com>
Date:   Thu, 12 Dec 2019 03:39:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <a9681f2f1b64d9677886dd81c228b0194298277d.1576079249.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2019 19:03, Michał Mirosław пишет:
> EKTF3624 as present in Asus TF300T tablet has touchscreen size encoded
> in different registers.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 82 ++++++++++++++++++++++++--
>  1 file changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 369004678a46..1c3eb49a22e4 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -34,7 +34,7 @@
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
>  #include <linux/acpi.h>
> -#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <asm/unaligned.h>
> @@ -42,6 +42,10 @@
>  /* Device, Driver information */
>  #define DEVICE_NAME	"elants_i2c"
>  
> +/* Device IDs */
> +#define EKTH3500	0
> +#define EKTF3624	1
> +
>  /* Convert from rows or columns into resolution */
>  #define ELAN_TS_RESOLUTION(n, m)   (((n) - 1) * (m))
>  
> @@ -162,6 +166,7 @@ struct elants_data {
>  
>  	bool wake_irq_enabled;
>  	bool keep_power_in_suspend;
> +	u8 chip_id;
>  
>  	/* Must be last to be used for DMA operations */
>  	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
> @@ -436,7 +441,58 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
>  	return 0;
>  }
>  
> -static int elants_i2c_query_ts_info(struct elants_data *ts)
> +static int elants_i2c_query_ts_info_ektf(struct elants_data *ts)
> +{
> +	struct i2c_client *client = ts->client;
> +	int error;
> +	u8 resp[4];
> +	u16 phy_x, phy_y;
> +	const u8 get_xres_cmd[] = {
> +		CMD_HEADER_READ, E_INFO_X_RES, 0x00, 0x00
> +	};
> +	const u8 get_yres_cmd[] = {
> +		CMD_HEADER_READ, E_INFO_Y_RES, 0x00, 0x00
> +	};
> +
> +	/* Get X/Y size in mm */
> +	error = elants_i2c_execute_command(client, get_xres_cmd,
> +					   sizeof(get_xres_cmd),
> +					   resp, sizeof(resp), 1,
> +					   "get X size");
> +	if (error)
> +		return error;
> +
> +	phy_x = resp[2] | ((resp[3] & 0xF0) << 4);
> +
> +	error = elants_i2c_execute_command(client, get_yres_cmd,
> +					   sizeof(get_yres_cmd),
> +					   resp, sizeof(resp), 1,
> +					   "get Y size");
> +	if (error)
> +		return error;
> +
> +	phy_y = resp[2] | ((resp[3] & 0xF0) << 4);
> +
> +	if (!phy_x || !phy_y) {
> +		dev_warn(&client->dev,
> +			 "invalid size data: %d x %d mm\n",
> +			 phy_x, phy_y);
> +		return 0;
> +	}
> +
> +	dev_dbg(&client->dev, "phy_x=%d, phy_y=%d\n", phy_x, phy_y);
> +
> +	/* calculate resolution from size */
> +	ts->x_max = 2240-1;
> +	ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
> +
> +	ts->y_max = 1408-1;
> +	ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
> +
> +	return 0;
> +}
> +
> +static int elants_i2c_query_ts_info_ekth(struct elants_data *ts)
>  {
>  	struct i2c_client *client = ts->client;
>  	int error;
> @@ -587,8 +643,20 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  		error = elants_i2c_query_test_version(ts);
>  	if (!error)
>  		error = elants_i2c_query_bc_version(ts);
> -	if (!error)
> -		error = elants_i2c_query_ts_info(ts);
> +
> +	switch (ts->chip_id) {
> +	case EKTH3500:
> +		if (!error)
> +			error = elants_i2c_query_ts_info_ekth(ts);
> +		break;
> +	case EKTF3624:
> +		if (!error)
> +			error = elants_i2c_query_ts_info_ektf(ts);
> +		break;
> +	default:
> +		unreachable();
> +		break;
> +	}
>  
>  	if (error)
>  		ts->iap_mode = ELAN_IAP_RECOVERY;
> @@ -1185,6 +1253,9 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	ts->client = client;
>  	i2c_set_clientdata(client, ts);
>  
> +	if (client->dev.of_node)
> +		ts->chip_id = (uintptr_t)of_device_get_match_data(&client->dev);
> +
>  	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
>  	if (IS_ERR(ts->vcc33)) {
>  		error = PTR_ERR(ts->vcc33);
> @@ -1409,7 +1480,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id elants_of_match[] = {
> -	{ .compatible = "elan,ekth3500" },
> +	{ .compatible = "elan,ekth3500", .data = (void *)EKTH3500 },
> +	{ .compatible = "elan,ektf3624", .data = (void *)EKTF3624 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, elants_of_match);
> 

In a comment to v1 I suggested to remove the OF table and use I2C table
for the OF matching, but this variant is okay as well.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
