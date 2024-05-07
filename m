Return-Path: <linux-input+bounces-3541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF68BDD1E
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 10:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEB282834E0
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 08:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D40213CA91;
	Tue,  7 May 2024 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+FsmQGg"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C1E13CAB1
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715070338; cv=none; b=IOFAzMGWeRTgKrSG7spTK9PktBH5eX39Cnns2zUpfd/QvGiXUZfZ18NNGiOeZMeQn31gnjQwTAPK7zoGy9EGDtc4SuDWlWjP4HRBz6EuLX4kVuQ6tYhrGnRbu5QCeqh44UBUYQpr8rVnfDgPp1rJQ9J4o9HSDWKIYcj1ZwsmlRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715070338; c=relaxed/simple;
	bh=Ru/3Cuwl0Ds0fAdi+u7L2g+qfrHVWs2fWeekuJRZ6DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mD7YeZvt3iYMfntmqFlWzXXSHgThk6sjEXyq8rdyd5rJ032a1+tKYQDr5PGubpwVJ4S+zyjPClIj/dqYdgdqywggZywJ0czQ4RUwK7Mlk6QDmHGxa8AfLRpkc/vHoeH3Ptc1EjClSUVbKXzFawB7vitFfQZ6cdrm1e5nxfNSym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+FsmQGg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715070335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIV59TTIklTZ8E7Mjg7QWgOJHw97ato/FlS68wODcd0=;
	b=I+FsmQGgKS6GUTwKGckR5AbtkmAyR6mqROuXEFhjBKdNI75Dm96/LlFaqtytCR2KzvNz2+
	EIPDluqo6M7aluehvptnBGCxBdQTolNem/Rr0NOukILJtzOHy0GJy3lstyqOLKVN+yFO3K
	kZQ6nSkxM6MOxZke+PekZ9iGyH7FFfc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-xX7C0X5xN8aThOs2IR1lEw-1; Tue, 07 May 2024 04:25:32 -0400
X-MC-Unique: xX7C0X5xN8aThOs2IR1lEw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a592c35ac06so292604266b.0
        for <linux-input@vger.kernel.org>; Tue, 07 May 2024 01:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715070331; x=1715675131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIV59TTIklTZ8E7Mjg7QWgOJHw97ato/FlS68wODcd0=;
        b=XweY1m0A4Uu7wZStKZxt4m0ErhxdrNPdad5dt9KDo5foGII+BeCy4uPZrSNkupFRRb
         UxXmghs/XF1k6ZLjOQh4xK913BVuvkhnFVXbuWcy9QzUJMaOlk95nNa4dXkqqzZOLpTY
         C55Gv3WEwNbaI8V1Syn2AwaS6rMpFBES98VTeT0FAZRCN0akt5IqzCFxs1PcFYlB2mj7
         ajPzeWZ1EGxXtEF6ltBrT1HsA5laA9+v5RXD6lExCILbrcFYpOB17Qifn4EMuOEiIlxt
         gKv35A0P5s1k7G5nir/2T4I8xpWjZT0mg/ckYQUOBwJ5niiyfLyw+oR3a81xDneEW39Y
         g/2w==
X-Forwarded-Encrypted: i=1; AJvYcCV6mymSSXlZtHZHFkXUnTO8EeN04QmFxUWRhM/LhKfqdILeLsdGIub9g8YjuZlsqotGtgoDGLBfigsMQ+42PESPDKCEwsJ3L/hy2VU=
X-Gm-Message-State: AOJu0Yw8cQrKCHZ4E7UPCBCp5tuZjN5fxUnVP2S4TY8Ai9dxClpG7a0k
	64Db0CF1jkLw9NoxH79AnYhwNA45aijZLhLzUYow9uyuaFtkOhKzGEy+PdtfWLBmMQn4w5mKGW6
	svPyZYJaT6g8P2zX3KY+d3wjbOUZD0d1S813mzELqYJ/3LCA2pjyLzxst5lxN
X-Received: by 2002:a17:907:9451:b0:a59:f2d2:49b1 with SMTP id dl17-20020a170907945100b00a59f2d249b1mr513042ejc.9.1715070331092;
        Tue, 07 May 2024 01:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE0YLDxSU/VMUbuSbDaD4PxbC8U7jFZ/xx4z1XkZHULEfaIHq2T/SXOucES9GSEXN/mDLg3A==
X-Received: by 2002:a17:907:9451:b0:a59:f2d2:49b1 with SMTP id dl17-20020a170907945100b00a59f2d249b1mr513024ejc.9.1715070330705;
        Tue, 07 May 2024 01:25:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ao18-20020a170907359200b00a59bda080ffsm3123769ejc.194.2024.05.07.01.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 01:25:30 -0700 (PDT)
Message-ID: <155361c0-5068-44df-9fca-d775fc518b7d@redhat.com>
Date: Tue, 7 May 2024 10:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
 Richard Hughes <hughsient@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 Mark Brown <broonie@kernel.org>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZjmOUp725QTHrfcT@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/7/24 4:13 AM, Dmitry Torokhov wrote:
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
> I think the less code we have in kernel the better,

Ok.

> especially if in
> cases where firmware flashing is not essential for device to work (i.e.
> it the controller has a flash memory).

Right the existing older goodix fw-upload is different because some
controllers are flash-less so they need a fw upload every boot.

> That said IIRC Mark felt very
> strongly about allowing regmap writes from userspace... but maybe he
> softened the stance or we could have this functionality opt-in?

Right when I was talking about generic helpers that was meant for
code re-use purposes. Actually exposing the regmap r/w functionality
to userspace is something which should be decided on a case by case
basis by the driver (IMHO).

Regards,

Hans



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
>>>  drivers/input/touchscreen/goodix_berlin.h     |  2 +
>>>  .../input/touchscreen/goodix_berlin_core.c    | 52 +++++++++++++++++++
>>>  drivers/input/touchscreen/goodix_berlin_i2c.c |  6 +++
>>>  drivers/input/touchscreen/goodix_berlin_spi.c |  6 +++
>>>  4 files changed, 66 insertions(+)
>>>
>>> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
>>> index 1fd77eb69..1741f2d15 100644
>>> --- a/drivers/input/touchscreen/goodix_berlin.h
>>> +++ b/drivers/input/touchscreen/goodix_berlin.h
>>> @@ -19,6 +19,8 @@ struct regmap;
>>>  int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>  			struct regmap *regmap);
>>>  
>>> +void goodix_berlin_remove(struct device *dev);
>>> +
>>>  extern const struct dev_pm_ops goodix_berlin_pm_ops;
>>>  
>>>  #endif
>>> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
>>> index e7b41a926..e02160841 100644
>>> --- a/drivers/input/touchscreen/goodix_berlin_core.c
>>> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
>>> @@ -672,6 +672,44 @@ static void goodix_berlin_power_off_act(void *data)
>>>  	goodix_berlin_power_off(cd);
>>>  }
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
>>>  int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>  			struct regmap *regmap)
>>>  {
>>> @@ -743,6 +781,14 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>>>  
>>>  	dev_set_drvdata(dev, cd);
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


