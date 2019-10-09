Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1CAD10B0
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 15:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbfJIN6G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 09:58:06 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48716 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbfJIN6G (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 09:58:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99Dvwne100687;
        Wed, 9 Oct 2019 08:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570629478;
        bh=/ue5OkAym5pkJB6sybZnGxsl6L0cOsyFyWRtZAd4BGY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=clm8RYcORtL7X/+OVweOJe2LXrr4Ki9fKjdRw+dh8D2lHBB8r2BIH9Pg9G+AtVn6x
         5MIyIobb7Up+Bpm/AGLFo/nLi9RmpMOLw2u1TJ+C408ZHujWgm3IdpbWf8dh4m3yYM
         t026FYITtrsiJTxdbso9p6/9zJ4rVClXAU2Rty/M=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99Dvwt2067610
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 08:57:58 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 08:57:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 08:57:58 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99DvuKe088661;
        Wed, 9 Oct 2019 08:57:57 -0500
Subject: Re: [PATCH 1/5] Input: pixcir_i2c_ts - Remove unneeded gpio.h header
 file
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Fabio Estevam <festevam@gmail.com>, <linux-input@vger.kernel.org>,
        <jcbian@pixcir.com.cn>
References: <20191007121607.12545-1-festevam@gmail.com>
 <ce6d29b1-1a7c-9fa4-da07-1b1d8c2a0efa@ti.com>
 <20191008184408.GG22365@dtor-ws>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <66565811-14bf-c1d3-aac0-e9d0090b9505@ti.com>
Date:   Wed, 9 Oct 2019 16:57:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008184408.GG22365@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 08/10/2019 21:44, Dmitry Torokhov wrote:
> On Tue, Oct 08, 2019 at 01:11:15PM +0300, Roger Quadros wrote:
>> Hi,
>>
>> On 07/10/2019 15:16, Fabio Estevam wrote:
>>> The touchscreen device is a GPIO consumer, not a GPIO controller,
>>> so there is no need to include <linux/gpio.h>.
>>>
>>> Remove the unneeded header file.
>>>
>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>>
>> For all 5 patches,
>>
>> Reviewed-by: Roger Quadros <rogerq@ti.com>
> 
> I guess we can also do this:
> 
> Input: pixcir_i2c_ts - remove platform data
> 
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Previous change moved platform data definition into the driver, making it
> unusable for users. Given that we want to move away from custom platform
> data structures, and always use device properties (DT, ACPI or static) to
> configure devices, let's complete the removal.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger


> ---
>   drivers/input/touchscreen/pixcir_i2c_ts.c |  100 +++++++----------------------
>   1 file changed, 25 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
> index ec768ab6148e..9aa098577350 100644
> --- a/drivers/input/touchscreen/pixcir_i2c_ts.c
> +++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
> @@ -62,7 +62,7 @@ enum pixcir_int_mode {
>   #define PIXCIR_INT_POL_HIGH	(1UL << 2)
>   
>   /**
> - * struct pixcir_irc_chip_data - chip related data
> + * struct pixcir_i2c_chip_data - chip related data
>    * @max_fingers:	Max number of fingers reported simultaneously by h/w
>    * @has_hw_ids:		Hardware supports finger tracking IDs
>    *
> @@ -72,12 +72,6 @@ struct pixcir_i2c_chip_data {
>   	bool has_hw_ids;
>   };
>   
> -struct pixcir_ts_platform_data {
> -	int x_max;
> -	int y_max;
> -	struct pixcir_i2c_chip_data chip;
> -};
> -
>   struct pixcir_i2c_ts_data {
>   	struct i2c_client *client;
>   	struct input_dev *input;
> @@ -87,7 +81,6 @@ struct pixcir_i2c_ts_data {
>   	struct gpio_desc *gpio_wake;
>   	const struct pixcir_i2c_chip_data *chip;
>   	struct touchscreen_properties prop;
> -	int max_fingers;	/* Max fingers supported in this instance */
>   	bool running;
>   };
>   
> @@ -111,7 +104,7 @@ static void pixcir_ts_parse(struct pixcir_i2c_ts_data *tsdata,
>   	memset(report, 0, sizeof(struct pixcir_report_data));
>   
>   	i = chip->has_hw_ids ? 1 : 0;
> -	readsize = 2 + tsdata->max_fingers * (4 + i);
> +	readsize = 2 + tsdata->chip->max_fingers * (4 + i);
>   	if (readsize > sizeof(rdbuf))
>   		readsize = sizeof(rdbuf);
>   
> @@ -132,8 +125,8 @@ static void pixcir_ts_parse(struct pixcir_i2c_ts_data *tsdata,
>   	}
>   
>   	touch = rdbuf[0] & 0x7;
> -	if (touch > tsdata->max_fingers)
> -		touch = tsdata->max_fingers;
> +	if (touch > tsdata->chip->max_fingers)
> +		touch = tsdata->chip->max_fingers;
>   
>   	report->num_touches = touch;
>   	bufptr = &rdbuf[2];
> @@ -469,31 +462,9 @@ static int __maybe_unused pixcir_i2c_ts_resume(struct device *dev)
>   static SIMPLE_DEV_PM_OPS(pixcir_dev_pm_ops,
>   			 pixcir_i2c_ts_suspend, pixcir_i2c_ts_resume);
>   
> -#ifdef CONFIG_OF
> -static const struct of_device_id pixcir_of_match[];
> -
> -static int pixcir_parse_dt(struct device *dev,
> -			   struct pixcir_i2c_ts_data *tsdata)
> -{
> -	tsdata->chip = of_device_get_match_data(dev);
> -	if (!tsdata->chip)
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -#else
> -static int pixcir_parse_dt(struct device *dev,
> -			   struct pixcir_i2c_ts_data *tsdata)
> -{
> -	return -EINVAL;
> -}
> -#endif
> -
>   static int pixcir_i2c_ts_probe(struct i2c_client *client,
>   			       const struct i2c_device_id *id)
>   {
> -	const struct pixcir_ts_platform_data *pdata =
> -			dev_get_platdata(&client->dev);
>   	struct device *dev = &client->dev;
>   	struct pixcir_i2c_ts_data *tsdata;
>   	struct input_dev *input;
> @@ -503,19 +474,11 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
>   	if (!tsdata)
>   		return -ENOMEM;
>   
> -	if (pdata) {
> -		tsdata->chip = &pdata->chip;
> -	} else if (dev->of_node) {
> -		error = pixcir_parse_dt(dev, tsdata);
> -		if (error)
> -			return error;
> -	} else {
> -		dev_err(dev, "platform data not defined\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!tsdata->chip->max_fingers) {
> -		dev_err(dev, "Invalid max_fingers in chip data\n");
> +	tsdata->chip = device_get_match_data(dev);
> +	if (!tsdata->chip && id)
> +		tsdata->chip = (const void *)id->driver_data;
> +	if (!tsdata->chip) {
> +		dev_err(dev, "can't locate chip data\n");
>   		return -EINVAL;
>   	}
>   
> @@ -532,30 +495,17 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
>   	input->id.bustype = BUS_I2C;
>   	input->open = pixcir_input_open;
>   	input->close = pixcir_input_close;
> -	input->dev.parent = dev;
> -
> -	if (pdata) {
> -		input_set_abs_params(input, ABS_MT_POSITION_X, 0, pdata->x_max, 0, 0);
> -		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, pdata->y_max, 0, 0);
> -	} else {
> -		input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
> -		input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
> -		touchscreen_parse_properties(input, true, &tsdata->prop);
> -		if (!input_abs_get_max(input, ABS_MT_POSITION_X) ||
> -		    !input_abs_get_max(input, ABS_MT_POSITION_Y)) {
> -			dev_err(dev, "Touchscreen size is not specified\n");
> -			return -EINVAL;
> -		}
> -	}
>   
> -	tsdata->max_fingers = tsdata->chip->max_fingers;
> -	if (tsdata->max_fingers > PIXCIR_MAX_SLOTS) {
> -		tsdata->max_fingers = PIXCIR_MAX_SLOTS;
> -		dev_info(dev, "Limiting maximum fingers to %d\n",
> -			 tsdata->max_fingers);
> +	input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
> +	input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
> +	touchscreen_parse_properties(input, true, &tsdata->prop);
> +	if (!input_abs_get_max(input, ABS_MT_POSITION_X) ||
> +	    !input_abs_get_max(input, ABS_MT_POSITION_Y)) {
> +		dev_err(dev, "Touchscreen size is not specified\n");
> +		return -EINVAL;
>   	}
>   
> -	error = input_mt_init_slots(input, tsdata->max_fingers,
> +	error = input_mt_init_slots(input, tsdata->chip->max_fingers,
>   				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
>   	if (error) {
>   		dev_err(dev, "Error initializing Multi-Touch slots\n");
> @@ -635,14 +585,6 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
>   	return 0;
>   }
>   
> -static const struct i2c_device_id pixcir_i2c_ts_id[] = {
> -	{ "pixcir_ts", 0 },
> -	{ "pixcir_tangoc", 0 },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(i2c, pixcir_i2c_ts_id);
> -
> -#ifdef CONFIG_OF
>   static const struct pixcir_i2c_chip_data pixcir_ts_data = {
>   	.max_fingers = 2,
>   	/* no hw id support */
> @@ -653,6 +595,14 @@ static const struct pixcir_i2c_chip_data pixcir_tangoc_data = {
>   	.has_hw_ids = true,
>   };
>   
> +static const struct i2c_device_id pixcir_i2c_ts_id[] = {
> +	{ "pixcir_ts", (unsigned long) &pixcir_ts_data },
> +	{ "pixcir_tangoc", (unsigned long) &pixcir_tangoc_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pixcir_i2c_ts_id);
> +
> +#ifdef CONFIG_OF
>   static const struct of_device_id pixcir_of_match[] = {
>   	{ .compatible = "pixcir,pixcir_ts", .data = &pixcir_ts_data },
>   	{ .compatible = "pixcir,pixcir_tangoc", .data = &pixcir_tangoc_data },
> 
> 
> 
> Thanks.
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
