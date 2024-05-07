Return-Path: <linux-input+bounces-3548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF478BE24D
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08B2EB29B18
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 12:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22933156885;
	Tue,  7 May 2024 12:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hnSzkkOf"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D83152E13
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 12:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085518; cv=none; b=kaA0lgo1oDoAfgaRvmQ/wFG1mxXWFMkNvDYLMlnYyUgnrCT9XPmlR3Mv4y0ssVULpJEFGlnVeCuP6ZdX98p8nm+aY+aWXIh6AiMWexxP4ELc2+Dl/sgMIDhQa5l3RXCHN+thwxetF9lbbYqoVml/Yd0qzEdZdg4iDzbJ/n4B3BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085518; c=relaxed/simple;
	bh=N4x7ddF13TSS9Nea4s5diAVC6CLhsJR/c+e98qA9adw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PA5h/cFEZOUTVD2mO0E4+ILYbPfG/zj78RKhqlYMFm9YCIRcIVXQWuxtM9HGz4biNPXp9K8wS9TBwAt6llbw1ePtg+vAWF5Jhejn1iV3AjNb03m345ewmR14mQn2Bcvmd3cBOhTy8USl4JskHJm/cB/LE/KCocw8WJLyunrG/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hnSzkkOf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715085515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWPEcqR9ErU9XdKxA7hqSt4OB0qwEGWcYY6ZOijOyEI=;
	b=hnSzkkOfUVdYZlyG6EAvlA3KFclUf4JgKpPqg8Rj9op7Lg4RHWAOjjlCcSkYYlDH+muIC+
	pNub+Azj/+HvC+p0BjolcnFq0Za/qJVXS6G+KCYKYXIKS9rNa6QvocASiEag1cpGvGNdnI
	lwm/5J2E9AAN5WBMIx8ZKetvVtw7oKM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-wfPArV9tOj-DbbWP8fLw1g-1; Tue, 07 May 2024 08:38:34 -0400
X-MC-Unique: wfPArV9tOj-DbbWP8fLw1g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56e645a8762so2249358a12.3
        for <linux-input@vger.kernel.org>; Tue, 07 May 2024 05:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715085513; x=1715690313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWPEcqR9ErU9XdKxA7hqSt4OB0qwEGWcYY6ZOijOyEI=;
        b=EOLqchFqHrHPmkW7aXq76fbi/dPMtBprYy2JFpaorgIqRAppS5IKDnVYMMxX1ul2pN
         AJ7z+egFo5oHhQvs+fsGQnNWLPIWaJj9Vr1uswuFFffa1L252AAbbOZFpLTCsoEIYPJW
         IAVZ+gWxA6ZRhkiKv7R8yIxZ4JQtLek6z8uF1F013tuoIsBzYjPMlmiYm1pbzT+NQDso
         2EDVjaSn5W93oD311dU5vhn6GgZYA1yh7jyDmiSy7evjsAxy7zS2D5LPvpozzbHeELbT
         GdNbizA5hNP5/EPzbSwuzIPwkKmt7Bwvdqyklp10Yu8SNYS+gxU7chCLKkKxYzOzrA84
         FtQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr1kjgBToDAyZkxemZunIb8wU+PUqErFat2eKH+ljhLGt6p+xptEoCdwaSnSvNoHqz1adR6LguTDE9exgzB63nddlcvyPQgo3YKIw=
X-Gm-Message-State: AOJu0YxOE5aQtl0x7Gos6xxrwLJFlZkzHKD9XtksUvwRxdKxCbCMbwuo
	t5OVrqoHpTWO7mng6s1hNbVBlA/UdccGEZvnAgOi5leSmh8FJ7Ou/EHbKo+TcXhYP7wc1dOrnt6
	TLx7pmGZQ1WEn74CcmtxIVPu0AVX+sIcQVP15txf18D4/4z9pq61j3Hg5W2izwGilwVTslQU=
X-Received: by 2002:a50:ab5e:0:b0:572:3cc4:2dcf with SMTP id t30-20020a50ab5e000000b005723cc42dcfmr8859973edc.14.1715085512809;
        Tue, 07 May 2024 05:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHroxd8bLzrqkFtsPgGzF1TvuHA3TG7s9IGZVCQTAMan3/CD0a4Lwt87DsFEPiKjQIkUlgyMg==
X-Received: by 2002:a50:ab5e:0:b0:572:3cc4:2dcf with SMTP id t30-20020a50ab5e000000b005723cc42dcfmr8859958edc.14.1715085512396;
        Tue, 07 May 2024 05:38:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u1-20020aa7d541000000b00572eebbfc61sm3387091edr.35.2024.05.07.05.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 05:38:31 -0700 (PDT)
Message-ID: <3b379071-d5ff-4861-aa38-874e92d4461a@redhat.com>
Date: Tue, 7 May 2024 14:38:30 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
To: Charles Wang <charles.goodix@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hadess@hadess.net, Richard Hughes <hughsient@gmail.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org, Mark Brown <broonie@kernel.org>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com> <ZjocV1nvWnxr_qUI@mb-board>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZjocV1nvWnxr_qUI@mb-board>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/7/24 2:28 PM, Charles Wang wrote:
> Hi,
> 
> On Tue, May 07, 2024 at 10:25:29AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 5/7/24 4:13 AM, Dmitry Torokhov wrote:
>>> On Mon, May 06, 2024 at 02:03:13PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 5/6/24 1:47 PM, Charles Wang wrote:
>>>>> Export a sysfs interface that would allow reading and writing touchscreen
>>>>> IC registers. With this interface many things can be done in usersapce
>>>>> such as firmware updates. An example tool that utilizes this interface
>>>>> for performing firmware updates can be found at [1].
>>>>
>>>> I'm not sure if I'm a fan of adding an interface to export raw register
>>>> access for fwupdate.
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix_fwupload.c
>>>>
>>>> Contains update support for older goodix touchscreens and it is not
>>>> that big. I think it might be better to just have an in kernel fwupdate
>>>> driver for this and have a sysfs file to which to write the new firmware.
>>>>
>>>> Adding Richard Hughes, fwupd maintainer to the Cc. Richard, do you have
>>>> any input on the suggested method for firmware updating ?
>>>>
>>>> If raw register access is seen as a good solution, then I think this
>>>> should use regmap + some generic helpers (to be written) to export
>>>> regmap r/w access to userspace.
>>>
>>> I think the less code we have in kernel the better,
>>
>> Ok.
>>
>>> especially if in
>>> cases where firmware flashing is not essential for device to work (i.e.
>>> it the controller has a flash memory).
>>
>> Right the existing older goodix fw-upload is different because some
>> controllers are flash-less so they need a fw upload every boot.
>>
>>> That said IIRC Mark felt very
>>> strongly about allowing regmap writes from userspace... but maybe he
>>> softened the stance or we could have this functionality opt-in?
>>
>> Right when I was talking about generic helpers that was meant for
>> code re-use purposes. Actually exposing the regmap r/w functionality
>> to userspace is something which should be decided on a case by case
>> basis by the driver (IMHO).
> 
> So what's the final conclusion, does the interface need to be modified?

I believe that the final conclusion is that the interface is fine.

Personally I think if the syfs store/show functions used for this
could be made into generic regmap helpers and then use those helpers
in the driver, so that if other drivers want similar functionality
they can re-use the show / store functions.

You should be able to use dev_get_regmap() to make the show/store
functions generic.

Regards,

Hans





>>>>> ---
>>>>>  drivers/input/touchscreen/goodix_berlin.h     |  2 +
>>>>>  .../input/touchscreen/goodix_berlin_core.c    | 52 +++++++++++++++++++
>>>>>  drivers/input/touchscreen/goodix_berlin_i2c.c |  6 +++
>>>>>  drivers/input/touchscreen/goodix_berlin_spi.c |  6 +++
>>>>>  4 files changed, 66 insertions(+)
>>>>>
>>>>> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
>>>>> index 1fd77eb69..1741f2d15 100644
>>>>> --- a/drivers/input/touchscreen/goodix_berlin.h
>>>>> +++ b/drivers/input/touchscreen/goodix_berlin.h
>>>>> @@ -19,6 +19,8 @@ struct regmap;
>>>>>  int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>>>  			struct regmap *regmap);
>>>>>  
>>>>> +void goodix_berlin_remove(struct device *dev);
>>>>> +
>>>>>  extern const struct dev_pm_ops goodix_berlin_pm_ops;
>>>>>  
>>>>>  #endif
>>>>> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
>>>>> index e7b41a926..e02160841 100644
>>>>> --- a/drivers/input/touchscreen/goodix_berlin_core.c
>>>>> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
>>>>> @@ -672,6 +672,44 @@ static void goodix_berlin_power_off_act(void *data)
>>>>>  	goodix_berlin_power_off(cd);
>>>>>  }
>>>>>  
>>>>> +static ssize_t goodix_berlin_registers_read(struct file *filp, struct kobject *kobj,
>>>>> +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
>>>>> +{
>>>>> +	struct goodix_berlin_core *cd;
>>>>> +	struct device *dev;
>>>>> +	int error;
>>>>> +
>>>>> +	dev = kobj_to_dev(kobj);
>>>>> +	cd = dev_get_drvdata(dev);
>>>>> +
>>>>> +	error = regmap_raw_read(cd->regmap, (unsigned int)off,
>>>>> +				buf, count);
>>>>> +
>>>>> +	return error ? error : count;
>>>>> +}
>>>>> +
>>>>> +static ssize_t goodix_berlin_registers_write(struct file *filp, struct kobject *kobj,
>>>>> +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
>>>>> +{
>>>>> +	struct goodix_berlin_core *cd;
>>>>> +	struct device *dev;
>>>>> +	int error;
>>>>> +
>>>>> +	dev = kobj_to_dev(kobj);
>>>>> +	cd = dev_get_drvdata(dev);
>>>>> +
>>>>> +	error = regmap_raw_write(cd->regmap, (unsigned int)off,
>>>>> +				 buf, count);
>>>>> +
>>>>> +	return error ? error : count;
>>>>> +}
>>>>> +
>>>>> +static struct bin_attribute goodix_berlin_registers_attr = {
>>>>> +	.attr = {.name = "registers", .mode = 0600},
>>>>> +	.read = goodix_berlin_registers_read,
>>>>> +	.write = goodix_berlin_registers_write,
>>>>> +};
>>>>> +
>>>>>  int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>>>  			struct regmap *regmap)
>>>>>  {
>>>>> @@ -743,6 +781,14 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>>>  
>>>>>  	dev_set_drvdata(dev, cd);
>>>>>  
>>>>> +	error = sysfs_create_bin_file(&cd->dev->kobj,
>>>>> +				      &goodix_berlin_registers_attr);
>>>
>>> If we want to instantiate attributes from the driver please utilize
>>> dev_groups in respective driver structures to create and remove the
>>> attributes automatically.
>>>
>>> Thanks.
>>>
>>
> 


