Return-Path: <linux-input+bounces-3998-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F7B8D6D15
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 02:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B35288297
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 00:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54F3628;
	Sat,  1 Jun 2024 00:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlMgNgSV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4C037E;
	Sat,  1 Jun 2024 00:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717200624; cv=none; b=OWdWDi8vRZ1WRYjvA2dT67ed358UCggC7m+9qFg3AojUPBLdF/Sp0D2qgJhVdjGAxsjzGwFaThb5X/m2kO4VNW+7ZmLZ8gxGaJ2IBazTaZOky8xJzYDJJoncrm7Tgq30qPCL7LckG5+uHjosv+g4K5Cs3Cvcpjk9D/OmwO8/Gx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717200624; c=relaxed/simple;
	bh=91n2kwnI74OK5r+ydkpLfw2spS5DCQ1J5SRP6i3YAQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcmSzM6L3OOZ4EuPMUNIoAm++NYmQmT3uiM2odHJDyBev2X0oBcNXxknRtLm69rY8wH8yDDrb+CbRBuysWD4UlwA1JLA5PAadlG1ZQaKTsvP8dKcpVbvCW0YY7jSlFN4HlVA2ROn/Qa1/3H69hMWQLPd1+chzPPq14ZcZWfaxrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlMgNgSV; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ae10ec3bd7so2385236d6.1;
        Fri, 31 May 2024 17:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717200622; x=1717805422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSzJ+L/cbNA7sYLgQBG3/PvK9MnOtIiCP0OTqTlJIHk=;
        b=FlMgNgSVqp0FBYHbvzzEpIokXDizST/k+slfSYtgqjPVXPDqNPkxRZ0GfG4sLKQcH+
         5pAsXkA9kprSQbjdqu7By/Zi8SUPccTIpbCdkVXwl6iMaaNyJ35J5iRij/DMyotegMTg
         uO047Rb6LCFEjJpjzkADgauwZo9+vup0bWBYJTDPamseCPlWwWdie5G3TY5ZzQphQWnx
         bZBmz2gatcJTUuwhJ8k3QBoha8T90H/fp6UcERTOiBIFPBwqidJL2kmYvM8XOfSzaQXc
         4+2xqsiAAIxLy97TiwtiNQnLV7WILV1aJFUgeejKCOdVguUNG7s5idiQY9/EhQpqC6Xl
         iwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717200622; x=1717805422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSzJ+L/cbNA7sYLgQBG3/PvK9MnOtIiCP0OTqTlJIHk=;
        b=f79vq2hSJJX2NTm5vo9D/rpThBUT/m+M+xUGAc4fUpQGb2genEXRkCGnmM/DLuCRKV
         F5v6Gx/FtlgOf/1uG8pYASJNOM013rnq7twmjb7WbPwBNOEx1BfPZRXUAnwqbVRTuSVO
         GwOaXEQxI4PrI52CLsuB0SSZqDcAGZNihwRfhIgBfHbgpkFcgmm+LITPtc8jXmJNPzAa
         b6mgsmWcQXRzYESOcCIbvIO+jgUecHvwPWD0E98TuhzGWAnFh1nW5UJ6reYkDn2nV1Bi
         3mwrSOSJnFyh+0RYQ2xBHzQ454llTL7EnpmZLIMtzEwXd3RyJvcvqibPe09v+7i+jJTH
         voTw==
X-Forwarded-Encrypted: i=1; AJvYcCXWd2GKj5vfCCxVrgodcAG8fG+hqndZodS8bF9vH+zCjHgTD8g/U0GBaAzXCP8FLuKZzNppUGqNdwV7g5y6EqI/hr/EeELlJsrrTLnZ5cenXRpffxJTFkeTf1vhA9n1F3v860jG/LHDU/6XTHhpW7Kn2O1gKfsjEJZTUzSdwFHDIXPyo4uifpk2RwdVffE=
X-Gm-Message-State: AOJu0YxbzvX11eCjHFW7YFpHUzgPJdncrx25FQWPRDZI0AzHuzdIoMHz
	cSqZTPTadu8O06VNUbOzZBWswIDt6H1vW+QpE6AoO7kpOzNOWBPi
X-Google-Smtp-Source: AGHT+IHoL2mHJHbKUOWC5NiDcAMqLzR0pPVM700KBUPJG6vSPJONv3wJvMsi2fwBuGwxHejvntBBlw==
X-Received: by 2002:a05:6214:c48:b0:6ab:8c3b:9032 with SMTP id 6a1803df08f44-6aecd573592mr36731136d6.1.1717200622086;
        Fri, 31 May 2024 17:10:22 -0700 (PDT)
Received: from [192.168.0.98] ([67.6.32.220])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4a73e767sm10633516d6.1.2024.05.31.17.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 17:10:21 -0700 (PDT)
Message-ID: <a2f68c56-e6d6-4626-8d05-b5e808da60da@gmail.com>
Date: Fri, 31 May 2024 19:10:20 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] Input: novatek-nvt-ts: add support for NT36672A
 touchscreen
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com>
 <20240526-nvt-ts-devicetree-regulator-support-v3-3-aa88d10ccd9a@gmail.com>
 <55272a3b-575d-4212-a40b-7245beed5d80@redhat.com>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <55272a3b-575d-4212-a40b-7245beed5d80@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans de Goede,

On 5/27/24 03:42, Hans de Goede wrote:
> Hi Joel,
> 
> On 5/27/24 5:26 AM, Joel Selvaraj via B4 Relay wrote:
>> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
>>
>> ---
>>   drivers/input/touchscreen/novatek-nvt-ts.c | 78 +++++++++++++++++++++++++++---
>>   1 file changed, 72 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
>> index 224fd112b25a9..7a82a1b09f9d5 100644
>> --- a/drivers/input/touchscreen/novatek-nvt-ts.c
>> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
>> @@ -139,9 +143,23 @@ static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static void nvt_ts_disable_regulators(void *_data)
>> +{
>> +	struct nvt_ts_data *data = _data;
>> +
>> +	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
>> +}
>> +
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
> 
> This is weird, you already enable the regulators in probe() and
> those get disabled again on remove() by the devm action you add.
> 
> So there is no need to enable / disable the regulators on start/stop .
> 
> If you want the regulators to only be enabled when the touchscreen
> is on then you should disable the regulators again in probe()
> after the nvt_ts_read_data() call there (and drop the devm action).

Yes, I want the regulators to be enabled only when the touchscreen is 
on/active. I will disable the regulators in probe and remove the devm 
action in v4.

>> @@ -277,8 +324,26 @@ static int nvt_ts_probe(struct i2c_client *client)
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
>> -	{ "NT11205-ts" },
>> +	{ "NT11205-ts", (unsigned long) &nvt_nt11205_ts_data },
>> +	{ "NT36672A-ts", (unsigned long) &nvt_nt36672a_ts_data },
> 
> The i2c-subsystem will also match of compatible strings to i2c_device_ids
> by looking at the partof the compatible after the ',', so for a compatible
> of e.g. "novatek,nt36672a-ts" will match an i2c_device_id of "nt36672a-ts".
> 
> So if you change these to lower-case:
> 
> 	{ "nt11205-ts", (unsigned long) &nvt_nt11205_ts_data },
> 	{ "nt36672a-ts", (unsigned long) &nvt_nt36672a_ts_data },
> 
> Then you can drop the nvt_ts_of_match table since that is not necessary
> then.
> 
> Hmm I just realized that this will break module auto-loading though since that
> does require of modaliases .
>   
> So maybe this is not such a good idea after all. Still switching to lowercase
> i2c_device_id-s would be good for consistency and you need to respin
> the patch-set for the regulator issue anyways.

Ok. I will change it to lowercase i2c device id in v4.

Regards,
Joel Selvaraj

