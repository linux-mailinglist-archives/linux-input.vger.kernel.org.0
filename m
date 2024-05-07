Return-Path: <linux-input+bounces-3535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 210358BDB76
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 08:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 427CEB22C14
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 06:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CAE6F09C;
	Tue,  7 May 2024 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbUkpL0k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488E4F616
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715063388; cv=none; b=E6Ggze/B5sAgI1kUG3vZ5jYoSyyKC5TKyysbgZ3pIrvyXV8qw7k2ZSo1wTwh6cEUwP/jGrgjtH3IacJWNYka2Zd3ffFuvghTaMzZ5JZ/cb/aOzXwxKejN2WEWhVdfnBAZdNiwt/dZK23ppOe5S6lI0Ax+HFD2VmyVfZHZrmU6/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715063388; c=relaxed/simple;
	bh=atp/aVS6XRyaycB+GiGU7MqL3fI66SBjQjST9/hUzWc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FsMWCMQEX7ctgUufMv51hr1xxPjfBs9yIMDBOFzxI5VYrDask2aSrYPhwDxubLPBVAtD202JnuISwSpYgmZb9f9qtG2eX99psd3PY0s+Tz6KITDgq1O6LPbGGJLbt2u18q+naacd66PcberfdWTgoHkGBXFFqyeluYjHOPY/xjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbUkpL0k; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59a609dd3fso445150766b.0
        for <linux-input@vger.kernel.org>; Mon, 06 May 2024 23:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715063384; x=1715668184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpZEoAqJyFLLuJwwHaEU4Ss44j0+PYHwovy5rYv4HZs=;
        b=VbUkpL0kOuAdsa9CyxSjT0KOGjd7dEQEvLLDpY2toYTuqa544W1qAv+o67G8GNTUU0
         w5jmENPs3USO4KTdFSEZX0erGklrKOHGm6G23jNGVXG/UTBvDqrUN7nmN3rx6OhNA9kE
         kGiWH5HHkV+LJFDJ1R1fUB1Y1tpez441KuV6mO3XpWyCMX5BfUOh7ySUE1yGOdt9CosZ
         dHpHZ4Dt7yPRyadUSJhfXoYcqMuFl/U2H8QJmwTWGSnFuNUfpjp3t5hD5/ESoX6VRd1w
         yeY0/kKV4naj8ooS+9p45XUF+7TX6Des+kL+mibs6CAen8t9OVwlqR9SaFG+G/O1vjRF
         aS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715063384; x=1715668184;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HpZEoAqJyFLLuJwwHaEU4Ss44j0+PYHwovy5rYv4HZs=;
        b=ok07JybeuMnvCyHTd5aqDg+dHNHB7Ru1uN67aAW1c/UHHKQRN4M6o3CjrkGNUEq6bH
         TKak63D4bq+I2I+weFH1NAiudvTiDqjaiJJ/l0FCr6h5UMCP1hQCIgIyjTC5WxEqwCQH
         YBvBxRw7k51MssRESi1t+zNRVYShDWhN4lzN+zhvrlMWcCAFQNgSdhG/64sjc5l9+9/w
         b3CScskqRXge0Ltew0woRPx/rsy0GCcGx9VndvkCrxfnlJ/bRuSz3thotZclzfVD2F3D
         E34Dt3qBWhG5tH6FtECG74Khq56jwC3HqlRjfFTqEx5jroInLfo42dKSSaQP1Rz+Q49H
         J2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWFq2j9T7fGEQQHFUrgUbajo2yq6b0vSJ+THanUdI718C64aHoiZQmSm3VRhrgWmklVfgl6D76Ke5wurH+ffEGVLrNb3e/S3cgUnr4=
X-Gm-Message-State: AOJu0YwKcOFlBzYzf228jvuMWPEfYj1hk6ud/EM3ivoYPm4zt5Li8dfp
	eESkwz9OftVpP3cmE8QD/AL2Qg+8SKOTJjme3mZBsE7tP8uoeA4YI4yyUwiLgTc=
X-Google-Smtp-Source: AGHT+IEJgcKo+G/xpGo9QxOwLCrnEdMnA0yLoli/R5ICGZreB03Spa5VseZrIK/Edle5/SOhbPjlaw==
X-Received: by 2002:a17:907:174d:b0:a59:a5c0:9a40 with SMTP id lf13-20020a170907174d00b00a59a5c09a40mr1170661ejc.25.1715063384141;
        Mon, 06 May 2024 23:29:44 -0700 (PDT)
Received: from [10.24.4.35] ([89.207.171.118])
        by smtp.gmail.com with ESMTPSA id p25-20020a170906141900b00a55a5384986sm6037008ejc.24.2024.05.06.23.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 23:29:43 -0700 (PDT)
Message-ID: <2b0c832c-0e82-4be7-aeb7-eb5ec3711c37@linaro.org>
Date: Tue, 7 May 2024 08:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
 Richard Hughes <hughsient@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <ZjmOUp725QTHrfcT@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 04:13, Dmitry Torokhov wrote:
> On Mon, May 06, 2024 at 02:03:13PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 5/6/24 1:47 PM, Charles Wang wrote:
>>> Export a sysfs interface that would allow reading and writing touchscreen
>>> IC registers. With this interface many things can be done in usersapce
>>> such as firmware updates. An example tool that utilizes this interface
>>> for performing firmware updates can be found at [1].
>>
>> I'm not sure if I'm a fan of adding an interface to export raw register
>> access for fwupdate.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix_fwupload.c
>>
>> Contains update support for older goodix touchscreens and it is not
>> that big. I think it might be better to just have an in kernel fwupdate
>> driver for this and have a sysfs file to which to write the new firmware.
>>
>> Adding Richard Hughes, fwupd maintainer to the Cc. Richard, do you have
>> any input on the suggested method for firmware updating ?
>>
>> If raw register access is seen as a good solution, then I think this
>> should use regmap + some generic helpers (to be written) to export
>> regmap r/w access to userspace.
> 
> I think the less code we have in kernel the better, especially if in
> cases where firmware flashing is not essential for device to work (i.e.
> it the controller has a flash memory). That said IIRC Mark felt very
> strongly about allowing regmap writes from userspace... but maybe he
> softened the stance or we could have this functionality opt-in?

The update code is quite ugly, but we could probably limit the functionnality
and filtering the registers read/write to only the update registers.

Neil

> 
>>
>>> [1] https://github.com/goodix/fwupdate_for_berlin_linux
>>
>> Hmm, that tool seems to have some licensing issues there is an Apache License v2.0
>> LICENSE file, but the header of fwupdate.c claims it is confidential ...
>>
>> Regards,
>>
>> Hans
>>
>>
>>> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
>>> ---
>>>   drivers/input/touchscreen/goodix_berlin.h     |  2 +
>>>   .../input/touchscreen/goodix_berlin_core.c    | 52 +++++++++++++++++++
>>>   drivers/input/touchscreen/goodix_berlin_i2c.c |  6 +++
>>>   drivers/input/touchscreen/goodix_berlin_spi.c |  6 +++
>>>   4 files changed, 66 insertions(+)
>>>
>>> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
>>> index 1fd77eb69..1741f2d15 100644
>>> --- a/drivers/input/touchscreen/goodix_berlin.h
>>> +++ b/drivers/input/touchscreen/goodix_berlin.h
>>> @@ -19,6 +19,8 @@ struct regmap;
>>>   int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>   			struct regmap *regmap);
>>>   
>>> +void goodix_berlin_remove(struct device *dev);
>>> +
>>>   extern const struct dev_pm_ops goodix_berlin_pm_ops;
>>>   
>>>   #endif
>>> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
>>> index e7b41a926..e02160841 100644
>>> --- a/drivers/input/touchscreen/goodix_berlin_core.c
>>> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
>>> @@ -672,6 +672,44 @@ static void goodix_berlin_power_off_act(void *data)
>>>   	goodix_berlin_power_off(cd);
>>>   }
>>>   
>>> +static ssize_t goodix_berlin_registers_read(struct file *filp, struct kobject *kobj,
>>> +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
>>> +{
>>> +	struct goodix_berlin_core *cd;
>>> +	struct device *dev;
>>> +	int error;
>>> +
>>> +	dev = kobj_to_dev(kobj);
>>> +	cd = dev_get_drvdata(dev);
>>> +
>>> +	error = regmap_raw_read(cd->regmap, (unsigned int)off,
>>> +				buf, count);
>>> +
>>> +	return error ? error : count;
>>> +}
>>> +
>>> +static ssize_t goodix_berlin_registers_write(struct file *filp, struct kobject *kobj,
>>> +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
>>> +{
>>> +	struct goodix_berlin_core *cd;
>>> +	struct device *dev;
>>> +	int error;
>>> +
>>> +	dev = kobj_to_dev(kobj);
>>> +	cd = dev_get_drvdata(dev);
>>> +
>>> +	error = regmap_raw_write(cd->regmap, (unsigned int)off,
>>> +				 buf, count);
>>> +
>>> +	return error ? error : count;
>>> +}
>>> +
>>> +static struct bin_attribute goodix_berlin_registers_attr = {
>>> +	.attr = {.name = "registers", .mode = 0600},
>>> +	.read = goodix_berlin_registers_read,
>>> +	.write = goodix_berlin_registers_write,
>>> +};
>>> +
>>>   int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>   			struct regmap *regmap)
>>>   {
>>> @@ -743,6 +781,14 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>   
>>>   	dev_set_drvdata(dev, cd);
>>>   
>>> +	error = sysfs_create_bin_file(&cd->dev->kobj,
>>> +				      &goodix_berlin_registers_attr);
> 
> If we want to instantiate attributes from the driver please utilize
> dev_groups in respective driver structures to create and remove the
> attributes automatically.
> 
> Thanks.
> 


