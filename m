Return-Path: <linux-input+bounces-16217-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 389EBC6DFEF
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 11:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC8FF4F6317
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 10:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3CA34B1AD;
	Wed, 19 Nov 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="NgYlL0UU"
X-Original-To: linux-input@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B7C349B12;
	Wed, 19 Nov 2025 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763547828; cv=none; b=ILRFSFjc2leyPqaawv4c06A8w3KMdPvxz52djNsi8gnFwld7hnE/xX1iAZyNoQDK8ogvq/P3dMtE0OZYAVkzHxm4smsDqHvT7H7tlZmWgb7muVDdaO9lFf2igsudr7kA0ZD6bfqP0P/rVQhOECVRPaQWgXycZZWoaUz7pLl80cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763547828; c=relaxed/simple;
	bh=a+wOZNfcxAMtXmnwwTLW1m/2Ial0GTpieAlShB5E14Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHtrYuUNuDGQZhw7QNBOxO4AmvrbnbVSU/ggDm5bqn3XVIg4JB2Yf8gV8XH3+VidnN9we02bh8eeajxa1/3sDB3p+7IsNVwO7u0biYKUeEGjdL1xh6ZBBt+IBXVJ41kkC37SsYVumRDXeeqfQPdG5kQafDqRfQ4TTHk5ke4kkig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=NgYlL0UU; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1763547815;
	bh=DDRfipI1OhTM7VYMY1TjZweAa9TrnaTYPRqV1PZBZqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NgYlL0UUJC9BwsjYqU79CAgWIJVNSOwv4LX88YVP6PhtmNYFGcxktDtIa78j9cOej
	 vkMakB9dn1nKrzJ136puU6C9yYvI6Hi6qAyV2VI/p74uemueG5raNdDkY96M3l4jmy
	 E3lGFsYjvg+pQro/BGOZmA49VGgb47DioMKBNECU=
Received: from [10.0.30.14] (unknown [10.0.30.14])
	by uho.ysoft.cz (Postfix) with ESMTP id 90651A0365;
	Wed, 19 Nov 2025 11:23:35 +0100 (CET)
Message-ID: <0e5eb4c0-bc63-4ca7-9ba2-985afa237d67@ysoft.com>
Date: Wed, 19 Nov 2025 11:23:35 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: pixcir_i2c_ts - add support for one-time total
 calibration
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
References: <20251112130019.1488005-1-michal.vokac@ysoft.com>
 <5uyos6zu74jfro7zsfup4zbkrywf5odi4ytfuwuttslgrus2of@fmopwef7fkme>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
In-Reply-To: <5uyos6zu74jfro7zsfup4zbkrywf5odi4ytfuwuttslgrus2of@fmopwef7fkme>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dmitry,

On 18. 11. 25 20:26, Dmitry Torokhov wrote:
> Hi Michal,
> 
> On Wed, Nov 12, 2025 at 02:00:19PM +0100, Michal Vokáč wrote:
>> The Pixcir Tango controller has support for a one-time total calibration
>> (manual calibration) procedure. Its purpose is to measure the capacitance
>> offsets of the electrode system and to store these values into EEPROM.
>>
>> During normal operation this calibration data is subtracted from the values
>> measured. This calibration should be necessary only once in the product
>> lifetime. It should be performed as part of the final adjustment after
>> the panel is mounted in the product.
>>
>> Add support for the calibration with sysfs interface.
>>
>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>> ---
>>   drivers/input/touchscreen/pixcir_i2c_ts.c | 34 +++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
>> index dad5786e82a4..2215e56b1458 100644
>> --- a/drivers/input/touchscreen/pixcir_i2c_ts.c
>> +++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
>> @@ -24,6 +24,7 @@
>>    */
>>   #define PIXCIR_REG_POWER_MODE	51
>>   #define PIXCIR_REG_INT_MODE	52
>> +#define PIXCIR_REG_SPECOP	58
>>   
>>   /*
>>    * Power modes:
>> @@ -82,6 +83,7 @@ struct pixcir_i2c_ts_data {
>>   	const struct pixcir_i2c_chip_data *chip;
>>   	struct touchscreen_properties prop;
>>   	bool running;
>> +	struct mutex sysfs_mutex;
>>   };
>>   
>>   struct pixcir_report_data {
>> @@ -462,6 +464,35 @@ static int pixcir_i2c_ts_resume(struct device *dev)
>>   static DEFINE_SIMPLE_DEV_PM_OPS(pixcir_dev_pm_ops,
>>   				pixcir_i2c_ts_suspend, pixcir_i2c_ts_resume);
>>   
>> +static ssize_t calibrate_store(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       const char *buf, size_t count)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct pixcir_i2c_ts_data *ts = i2c_get_clientdata(client);
>> +	static const u8 cmd = 0x03;
>> +	int error;
>> +
>> +	error = mutex_lock_interruptible(&ts->sysfs_mutex);
>> +	if (error)
>> +		return error;
> 
> Why do we need this mutex? i2c_smbus_write_byte_data() does take adapter
> lock, why do we need this additional locking?

Honestly I was not sure about usefulness of the lock.
I originally have not it there when the patch was in our downstream tree.
When I was rewriting it for mainline I realized there are other touchscreen
drivers that already have this calibration feature implemented and that
they have the lock in place. See raydium_i2c_ts.c or elants_i2c.c.
So I got inspired and used it as well for the case I missed something.

Now after a second look at the mentioned drivers I see that these also
have a sysfs interface for FW update. So it make sense to use the lock
to assure the whole fw transfer is finished before someone else can
access the device.

That is not our case. The mutex can safely be removed. I will send v2.

Thank you,
Michal




