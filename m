Return-Path: <linux-input+bounces-3552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E13258BE5FC
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1079B1C21C89
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6829B15F3EA;
	Tue,  7 May 2024 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="GQ9axj59"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C215F322;
	Tue,  7 May 2024 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092396; cv=none; b=XL3kCgZYRuFxwDMtJWstmq/VsCwGVNQ+HwlBzXTQtE4tQ5Ztb5QfwVUpELx2IRxzTzgyN/iV37CcUIrnHslpf0H9NF5dBifS6s/HRafNVQo4/0KuHoDpQKBOAfjRhhEePCHHy+f3xeRwmOenjIKz9GrJZpj42uZ0SoLu+WdjebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092396; c=relaxed/simple;
	bh=2bRKE40XKAnKAK3IOXbmvh2YbVgVOzuh6rhjPfP3L6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HgQv06juTYVxpmpZeRJYUKsK1vNwuq11K4J4hpResSszkn9f9+9u7RlrdGSrklyosD2SXbAzOSkxOGRuQ+0UL8Vf2b7PtShcvaX4c4ykeH44QoNTMIAWF55veYua/2fZRMtC7uvi+vYBn8H6hIgLp24gQ5abY1cieeH7x8j3bBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=GQ9axj59; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 359B8C005F;
	Tue,  7 May 2024 10:33:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1715092404; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=v+B8UAwdldlntNqSaN2SmWNVp3MgBr8FmyOkts8KjeM=;
	b=GQ9axj59docgOj999lAQCRr/y/bWWaGVrj8JMTprOuAzxim0AB28DoPtasGIA9KGYOXBO+
	7InvhrbEXK1UU+MMtjpA/kG3gT9E3bP+y6xjUdp51atbdG8nPMm7GWTqWEFBW9VUx/DvNF
	zENf8weZIdIEJ7OG9nVv94wQkdOgxgI=
Message-ID: <5e139685-02c3-4446-9b89-d68bf15f55b4@kaechele.ca>
Date: Tue, 7 May 2024 10:33:00 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] input: himax_hx83112b: add regulator handling
To: Job Noorman <job@noorman.info>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240504020745.68525-1-felix@kaechele.ca>
 <20240504020745.68525-3-felix@kaechele.ca>
 <95f8d63a-0343-49c3-90b6-f91efe559841@linaro.org>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <95f8d63a-0343-49c3-90b6-f91efe559841@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Thanks, Krzysztof! Really appreciate your input, as I'm currently not a 
regular contributor to the kernel.

On 2024-05-04 08:37, Krzysztof Kozlowski wrote:
> On 04/05/2024 04:04, Felix Kaechele wrote:
>> Handle regulators used on this chip family, namely AVDD and VDD. These
>> definitions are taken from the GPLv2 licensed vendor driver.
>>
>> Signed-off-by: Felix Kaechele <felix@kaechele.ca>
>> Link: https://github.com/HimaxSoftware/HX83112_Android_Driver
>> ---
>>   drivers/input/touchscreen/himax_hx83112b.c | 48 ++++++++++++++++++++--
>>   1 file changed, 44 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
>> index 4f6609dcdef3..0a797789e548 100644
>> --- a/drivers/input/touchscreen/himax_hx83112b.c
>> +++ b/drivers/input/touchscreen/himax_hx83112b.c
>> @@ -19,10 +19,12 @@
>>   #include <linux/interrupt.h>
>>   #include <linux/kernel.h>
>>   #include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>>   
>>   #define HIMAX_ID_83112B			0x83112b
>>   
>>   #define HIMAX_MAX_POINTS		10
>> +#define HIMAX_MAX_SUPPLIES		2
>>   
>>   #define HIMAX_REG_CFG_SET_ADDR		0x00
>>   #define HIMAX_REG_CFG_INIT_READ		0x0c
>> @@ -50,6 +52,7 @@ struct himax_event {
>>   static_assert(sizeof(struct himax_event) == 56);
>>   
>>   struct himax_ts_data {
>> +	struct regulator_bulk_data supplies[HIMAX_MAX_SUPPLIES];
>>   	struct gpio_desc *gpiod_rst;
>>   	struct input_dev *input_dev;
>>   	struct i2c_client *client;
>> @@ -63,6 +66,11 @@ static const struct regmap_config himax_regmap_config = {
>>   	.val_format_endian = REGMAP_ENDIAN_LITTLE,
>>   };
>>   
>> +static const char *const himax_supply_names[] = {
>> +	"avdd",
>> +	"vdd",
>> +};
>> +
> 
> That's confusing. Binding said only HX83100A family has regulators, but
> you request for everyone.
> 

You're right. Looking at the vendor driver for each of models I could 
see that it defined AVDD and VDD in both drivers. So I thought it could 
make sense to offer it for the entire chip family, with which I meant 
all HX831xx in this case.

But it seems after some more testing (and with this touch IC family 
generally being a part of the display controller) the regulators are 
sufficiently handled by the panel driver / bootloader for the use case 
of having the touchscreen on when the display is on.
It wouldn't allow for waking the screen by using the touchscreen, and 
while I'd have to go back to the original OS on the device to verify 
this again, I don't remember that working on the original OS either.

So I'm thinking I may drop the whole regulator part of the patchset to 
keep it smaller.

>>   static int himax_read_config(struct himax_ts_data *ts, u32 address, u32 *dst)
>>   {
>>   	int error;
>> @@ -267,7 +275,7 @@ static irqreturn_t himax_irq_handler(int irq, void *dev_id)
>>   
>>   static int himax_probe(struct i2c_client *client)
>>   {
>> -	int error;
>> +	int error, i;
>>   	struct device *dev = &client->dev;
>>   	struct himax_ts_data *ts;
>>   
>> @@ -290,11 +298,31 @@ static int himax_probe(struct i2c_client *client)
>>   		return error;
>>   	}
>>   
>> +	int num_supplies = ARRAY_SIZE(himax_supply_names);
>> +
>> +	for (i = 0; i < num_supplies; i++)
>> +		ts->supplies[i].supply = himax_supply_names[i];
>> +
>> +	error = devm_regulator_bulk_get(dev,
> 
> devm_regulator_bulk_get_enable and drop rest of the code here.
> 

That's pretty neat. If I do decide to bring in regulator handling this 
removes quite a bit of boilerplate.

> 
>> +					num_supplies,
>> +					ts->supplies);
> 
> Wrap it properly at 80, not one argument in one line.
> 
>> +	if (error) {
>> +		dev_err(dev, "Failed to get supplies: %d\n", error);
> 
> return dev_err_probe()
> 

Same here. Thanks for the hint.

>> +		return error;
>> +	}
>> +
>> +	error = regulator_bulk_enable(num_supplies,
>> +				      ts->supplies);
>> +	if (error) {
>> +		dev_err(dev, "Failed to enable supplies: %d\n", error);
>> +		goto error_out;
>> +	}
>> +

I'll be sending a v2 shortly.

Thanks again,
Felix

