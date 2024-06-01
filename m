Return-Path: <linux-input+bounces-4007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F858D71CE
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 22:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F3CBB21695
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 20:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0368248D;
	Sat,  1 Jun 2024 20:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqoNGqvf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479A1802E;
	Sat,  1 Jun 2024 20:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717274169; cv=none; b=I8CvJuoxG4ARlvDQUSoDYoyx1AS3fAfsoQuqnqFg5jKUwqKCczZrmUJDedlU5D5MQGM2zkTgpq7MFs1+kpwIahz5OSplUQVWqWrYwlScibjJZtIxwpg6lfeCYVpOExX2QvP2dfg7uOCLVweu4TtTKGnd3EFwcFKKsrHHRtKagL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717274169; c=relaxed/simple;
	bh=vHaRtKfsyO36lW7Dv9xqwyGDsAw2fMsvqELRTccw1I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGJkpWvgha4jIA92Qu5JJt/1ZsMSi+dsLoDKT8873B1UXYnj/mtX3qm26Uqbg+0QJRy/NF0kSDYKEwdpmJaMmwj/TXlg9Zcpqxbdtdh0xFqXhyKCrYet/38n/jRtfu4JnWbtDhdk6slfJ3XIHhUN7M0PwenNfepS2jBYDA8PJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqoNGqvf; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5b97f09cde3so477813eaf.0;
        Sat, 01 Jun 2024 13:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717274167; x=1717878967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7h+jQ7Ja8aNNX//dfY7u0TDow7aLWPm6IzQiHJUBe8=;
        b=dqoNGqvfyYY0OMDVk9dQz+mXubxAN+5CfMaGMC6bgUBLK8KHCkKnwFaoZ6tOGQRudP
         rox5e9gqb0UhLzvDp+MFzS3KOZAFcsXURjGezWguf8kaxrcpB2Ln+b/f2+IoMh3K8kx9
         iduNmYurwje3k/vCTkG5PUmFzwup3O6fPwsqo40ZzjAR0EnwLU1Oh/zzOySvJvlEyoU8
         ncOcluvUoMuvkBqrpaOBi/bQT0j0gTBknpRUg8J2ZJuzv8O0aZXaW9nv771UzHP31i5w
         gslEhYzeyirBlRX/HWpA8m+iNSznjfj4b+iedvhaKdyEp9ER6J7e/0DVm6Oz1Bbyl2XZ
         ZtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717274167; x=1717878967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7h+jQ7Ja8aNNX//dfY7u0TDow7aLWPm6IzQiHJUBe8=;
        b=mvocNnv6OWrgA4AHl9z8/TQdOARwCEbDQzYwy1YeXEpxEfc9CX3QJzGulzLsGIdfd6
         U6uVLwa764S1VAR7A5GQQHmKRGzmCO4zOmbY6+XepxhnQEYDhel51idlKnMyv2CP1DZY
         +f28bVcfNxY3b3GS3fsfULtDRGphBZuSSpD02CjUQMokiYZubjs1hN62CWPM2F1OEoiq
         qGlAFhqjrRzZuz/DBXh7c+fQ3Ozpy10LSYivXciY6NrRhFpZ0c9s2TL1pLT8AfcU0YTh
         O5JfLCvyLSMvp2s3PBmxkLjEaNxLdXEVHfRm1dZVt/xys5XwO8lOJ5YXuBCmgBbv6L4R
         5DSw==
X-Forwarded-Encrypted: i=1; AJvYcCV1sbpPcfCpbdfp0CXl1QxIcDQ7+dZF2ZTbYFq8ZjxamgBBI63ES8Xo+ph6d6SxEHeBD8AFRbzlPhGJh0sWR7YfR1auEJUs584sZ3PIY8q0C1PDK3JNm4iCQwZCuOr9szd66sxJxIiNbrFlM0z8itAIyrK3v0Xny47nqSRszaBNM44gnXlmD/alMM+q2tA=
X-Gm-Message-State: AOJu0YwhfGyoeJEkANwViJuqwYAZ+wklm60nu95kFkXoBag9RULhV41s
	vbwuXwhQeg/i+Rmoat1gWIkbaWyLu/t4GSzt1/mxGpU1cQtp0nH1
X-Google-Smtp-Source: AGHT+IENRztfzP/GvNSsTmL9gkAOzuLBv8AhBPU9paZaMqOOvaZqzIlp6vUomqoIUH80XiJosoNRuw==
X-Received: by 2002:a05:6808:140b:b0:3c9:9693:f66 with SMTP id 5614622812f47-3d1e35f6638mr6289711b6e.4.1717274166691;
        Sat, 01 Jun 2024 13:36:06 -0700 (PDT)
Received: from [192.168.0.98] ([67.6.32.220])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff2467eddsm21680301cf.62.2024.06.01.13.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 13:36:06 -0700 (PDT)
Message-ID: <100bc58f-0c21-45ee-b793-71b8309b402c@gmail.com>
Date: Sat, 1 Jun 2024 15:36:04 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] Input: novatek-nvt-ts: add support for NT36672A
 touchscreen
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240601-nvt-ts-devicetree-regulator-support-v4-0-e0c0174464c4@gmail.com>
 <20240601-nvt-ts-devicetree-regulator-support-v4-3-e0c0174464c4@gmail.com>
 <2b876ece-3b02-493e-ab1d-e5acc40c5d88@redhat.com>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <2b876ece-3b02-493e-ab1d-e5acc40c5d88@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans,

On 6/1/24 12:07, Hans de Goede wrote:
> Hi Joel,
> 
> Thank you for the new version.
> 
> On 6/1/24 5:30 PM, Joel Selvaraj via B4 Relay wrote:
>> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
>>
>> Extend the novatek touchscreen driver to support NT36672A chip which
>> is found in phones like qcom/sdm845-xiaomi-beryllium-tianma.dts.
>> Added devicetree support for the driver and used i2c chip data to handle
>> the variation in chip id and wake type. Also added vcc and iovcc
>> regulators which are used to power the touchscreen hardware.
>>
>> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
>> ---
>>   drivers/input/touchscreen/novatek-nvt-ts.c | 70 +++++++++++++++++++++++++++---
>>   1 file changed, 64 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
>> index 9bee3a0c122fb..c24c33f609eb8 100644
>> --- a/drivers/input/touchscreen/novatek-nvt-ts.c
>> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
>> @@ -31,9 +31,6 @@
>>   #define NVT_TS_PARAMS_CHIP_ID		0x0e
>>   #define NVT_TS_PARAMS_SIZE		0x0f
>>   
>> -#define NVT_TS_SUPPORTED_WAKE_TYPE	0x05
>> -#define NVT_TS_SUPPORTED_CHIP_ID	0x05
>> -
>>   #define NVT_TS_MAX_TOUCHES		10
>>   #define NVT_TS_MAX_SIZE			4096
>>   
>> @@ -51,11 +48,18 @@ static const int nvt_ts_irq_type[4] = {
>>   	IRQF_TRIGGER_HIGH
>>   };
>>   
>> +struct nvt_ts_i2c_chip_data {
>> +	u8 wake_type;
>> +	u8 chip_id;
>> +};
>> +
>>   struct nvt_ts_data {
>>   	struct i2c_client *client;
>>   	struct input_dev *input;
>>   	struct gpio_desc *reset_gpio;
>> +	struct regulator_bulk_data regulators[2];
>>   	struct touchscreen_properties prop;
>> +	const struct nvt_ts_i2c_chip_data *chip;
> 
> Almost there. I have one remark which requires fixing below,
> so since a v5 will be necessary anyways I also spotted another
> small possible improvement:
> 
> Since you only use chip->wake_type and chip->chip_id
> inside probe() you can make this chip pointer a local
> variable in probe(). This saves having this stored
> on the kernel heap even though it is never used again.
> 

Thanks for your detailed explanation here and below. I will fix them in v5.

Regards,
Joel

>>   	int max_touches;
>>   	u8 buf[NVT_TS_TOUCH_SIZE * NVT_TS_MAX_TOUCHES];
>>   };
>> @@ -142,6 +146,13 @@ static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
>>   static int nvt_ts_start(struct input_dev *dev)
>>   {
>>   	struct nvt_ts_data *data = input_get_drvdata(dev);
>> +	int error;
>> +
>> +	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators), data->regulators);
>> +	if (error) {
>> +		dev_err(&data->client->dev, "failed to enable regulators\n");
>> +		return error;
>> +	}
>>   
>>   	enable_irq(data->client->irq);
>>   	gpiod_set_value_cansleep(data->reset_gpio, 0);
>> @@ -155,6 +166,7 @@ static void nvt_ts_stop(struct input_dev *dev)
>>   
>>   	disable_irq(data->client->irq);
>>   	gpiod_set_value_cansleep(data->reset_gpio, 1);
>> +	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
>>   }
>>   
>>   static int nvt_ts_suspend(struct device *dev)
>> @@ -199,9 +211,31 @@ static int nvt_ts_probe(struct i2c_client *client)
>>   	if (!data)
>>   		return -ENOMEM;
>>   
>> +	data->chip = device_get_match_data(&client->dev);
>> +	if (!data->chip)
>> +		return -EINVAL;
>> +
> 
> As mentioned above instead of data->chip you can use a local
> "chip" variable here.
> 
>>   	data->client = client;
>>   	i2c_set_clientdata(client, data);
>>   
>> +	/*
>> +	 * VCC is the analog voltage supply
>> +	 * IOVCC is the digital voltage supply
>> +	 */
>> +	data->regulators[0].supply = "vcc";
>> +	data->regulators[1].supply = "iovcc";
>> +	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(data->regulators), data->regulators);
>> +	if (error) {
>> +		dev_err(dev, "cannot get regulators: %d\n", error);
>> +		return error;
>> +	}
>> +
>> +	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators), data->regulators);
>> +	if (error) {
>> +		dev_err(dev, "failed to enable regulators: %d\n", error);
>> +		return error;
>> +	}
>> +
>>   	data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>>   	error = PTR_ERR_OR_ZERO(data->reset_gpio);
>>   	if (error) {
> 
> Almost there. You need to disable the regulators when probe fails to
> avoid an error from the regulator core about unbalanced enable/disable
> of the regulators when the devm framework releases them.
> 
> So you need to add a regulator_bulk_disable() call in
> the "if (error) {" branch here:
> 
>    	data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>    	error = PTR_ERR_OR_ZERO(data->reset_gpio);
>    	if (error) {
> 		regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
> 		dev_err(dev, "failed to request reset GPIO: %d\n", error);
> 		return error;
> 	}
> 
> And ... (continued below)
> 
>> @@ -216,6 +250,11 @@ static int nvt_ts_probe(struct i2c_client *client)
>>   	gpiod_set_value_cansleep(data->reset_gpio, 1); /* Put back in reset */
>>   	if (error)
>>   		return error;
>> +	error = regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
> 
> I would not error check this, just like how it is not error checked
> in void nvt_ts_stop() and then I would move it to above the error
> checking for the nvt_ts_read_data(...NVT_TS_PARAMETERS...), to avoid
> the need for an extra regulator_bulk_disable() call in the if (error)
> path for the nvt_ts_read_data() call.
> 
> So make the code look like this:
> 
>          error = nvt_ts_read_data(data->client, NVT_TS_PARAMETERS_START,
>                                   data->buf, NVT_TS_PARAMS_SIZE);
>          gpiod_set_value_cansleep(data->reset_gpio, 1); /* Put back in reset */
> 	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
>          if (error)
>                  return error;
> 
>          width  = get_unaligned_be16(&data->buf[NVT_TS_PARAMS_WIDTH]);
>          height = get_unaligned_be16(&data->buf[NVT_TS_PARAMS_HEIGHT]);
> 	...
> 
> This way you only need one extra regulator_bulk_disable() call for
> error-exit paths in the case of devm_gpiod_get(dev, "reset", ...)
> failing.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
>> @@ -225,8 +264,8 @@ static int nvt_ts_probe(struct i2c_client *client)
>>   	if (width > NVT_TS_MAX_SIZE || height >= NVT_TS_MAX_SIZE ||
>>   	    data->max_touches > NVT_TS_MAX_TOUCHES ||
>>   	    irq_type >= ARRAY_SIZE(nvt_ts_irq_type) ||
>> -	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != NVT_TS_SUPPORTED_WAKE_TYPE ||
>> -	    data->buf[NVT_TS_PARAMS_CHIP_ID] != NVT_TS_SUPPORTED_CHIP_ID) {
>> +	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != data->chip->wake_type ||
>> +	    data->buf[NVT_TS_PARAMS_CHIP_ID] != data->chip->chip_id) {
>>   		dev_err(dev, "Unsupported touchscreen parameters: %*ph\n",
>>   			NVT_TS_PARAMS_SIZE, data->buf);
>>   		return -EIO;
>> @@ -277,8 +316,26 @@ static int nvt_ts_probe(struct i2c_client *client)
>>   	return 0;
>>   }
>>   
>> +static const struct nvt_ts_i2c_chip_data nvt_nt11205_ts_data = {
>> +	.wake_type = 0x05,
>> +	.chip_id = 0x05,
>> +};
>> +
>> +static const struct nvt_ts_i2c_chip_data nvt_nt36672a_ts_data = {
>> +	.wake_type = 0x01,
>> +	.chip_id = 0x08,
>> +};
>> +
>> +static const struct of_device_id nvt_ts_of_match[] = {
>> +	{ .compatible = "novatek,nt11205-ts", .data = &nvt_nt11205_ts_data },
>> +	{ .compatible = "novatek,nt36672a-ts", .data = &nvt_nt36672a_ts_data },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, nvt_ts_of_match);
>> +
>>   static const struct i2c_device_id nvt_ts_i2c_id[] = {
>> -	{ "nt11205-ts" },
>> +	{ "nt11205-ts", (unsigned long) &nvt_nt11205_ts_data },
>> +	{ "nt36672a-ts", (unsigned long) &nvt_nt36672a_ts_data },
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
>> @@ -287,6 +344,7 @@ static struct i2c_driver nvt_ts_driver = {
>>   	.driver = {
>>   		.name	= "novatek-nvt-ts",
>>   		.pm	= pm_sleep_ptr(&nvt_ts_pm_ops),
>> +		.of_match_table = nvt_ts_of_match,
>>   	},
>>   	.probe = nvt_ts_probe,
>>   	.id_table = nvt_ts_i2c_id,
>>
> 

