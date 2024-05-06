Return-Path: <linux-input+bounces-3485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886F8BCD4F
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 14:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BBBE1C228FB
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 12:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE878143879;
	Mon,  6 May 2024 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bnp6wsx8"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8BE142E85
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 12:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997000; cv=none; b=tYx7JldLACy+YHZaTM5+f8I+BAxTu1I1TBIb6VQuUdWzXh6ThLBVVO1Qrhjqi/38tnAIN3MCuAfNkWTNimKTsRdFhUCwRPCTiQKIrqNWxhrUZoUTpjHqp13Q7khzOdMC0JipmSUX0cr8hsnEPyXST9ruz/ic7D3tzn34fm7FG+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997000; c=relaxed/simple;
	bh=j5Ry1fKKWDacYI6b6d9sK8zJumu5xC8p8e/9UVRHuGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTxW1rjg0Ub68WCGocVSFizbS6pqKlaJrtQ2nUZIRTwwvyYpbW7iLVN2lA1BjRemL3+9EYawRe0Ie9RUtvDzNFGodXYyFLs7LcVFvcHWARgb/Zn750N6NmeXnVyH0A8E4UR5XqnZttI14GFV9uUMeimmVepcpusiikG66sZ5Nbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bnp6wsx8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714996997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzZba38xk2bDpCg1kS6Eq/hb8hs4ygmli1/QCKUzpOY=;
	b=Bnp6wsx81COqiD2EY4GuhmdlYcdUZpTKvbSkC6lwrrP0g5n3a0mn8gmQRQyePdyhQYJEgQ
	QEf7qs/bZyLnhDk8n7+HN44wEd+qnMg9H+kgfiW24dvp6s5kQfMVr3RP95SyEv6TzrBxtz
	Q69M1Y7ivIxTfa/BiUhScdShKodScEI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-4AyuFjM2Mje-1oKOqkeOrw-1; Mon, 06 May 2024 08:03:16 -0400
X-MC-Unique: 4AyuFjM2Mje-1oKOqkeOrw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a59c942611bso69838566b.0
        for <linux-input@vger.kernel.org>; Mon, 06 May 2024 05:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714996995; x=1715601795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzZba38xk2bDpCg1kS6Eq/hb8hs4ygmli1/QCKUzpOY=;
        b=ub+zQzlaNsCVnyCpDkQp9vAApwT/QzcOfuGAFWvH1AM/7SxkLlc+79mNWBkWqo122b
         8KrVUrfsUvGzRuoOJXg1Xh3NR9gAj0Fh+9FSfaLUSOzuaf/u6OKwNaW213OfvSKLkjJk
         RjrIFgp2qM+aRCh0JHHVo/13/X+Ttjvl0YuW4arMPtnf8sjEPh7HznfOZ9uHq+lh76jy
         posOOpi1Iql1Ld4UNBAwkp/RHApH8PTCkWIwaxN4htTFlW93W+AkfYmY+ehcUCz4gW1B
         h72k+fhbJd3Vao6hz+0MIsS9m1YgVmzcmwPYzYlVz1mCu+Q/nIYzj8IwnjUTdqfB1S4/
         Y4aA==
X-Gm-Message-State: AOJu0YwHoYVKMG+DuQ8qOjb2PAVd1PRy75Ywhh2rz0kmzS+P+9wY0rW/
	NaM9NxGV1Mz2jsbbjBSP5jVQljpqQugVuO3gxa6kvvc35SaRm33mL0WJ8TsZAcN41x6pKsJJtp6
	8dyEJmdjjRLHLLvDdcGveIowxicV1m8TIKGN0wcAJHK7xI9jXbs/Ai/fLVSy2
X-Received: by 2002:a17:906:794c:b0:a59:cdf4:f938 with SMTP id l12-20020a170906794c00b00a59cdf4f938mr2195208ejo.37.1714996994927;
        Mon, 06 May 2024 05:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGucec+tIFmcjzIqbQWr5trspdhZZYai22RB6fKxuM7q1j9s8AS+oB8vTyh3NGz7MzNECHafQ==
X-Received: by 2002:a17:906:794c:b0:a59:cdf4:f938 with SMTP id l12-20020a170906794c00b00a59cdf4f938mr2195192ejo.37.1714996994481;
        Mon, 06 May 2024 05:03:14 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id hg12-20020a1709072ccc00b00a59b6eed3c4sm2277762ejc.45.2024.05.06.05.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 05:03:14 -0700 (PDT)
Message-ID: <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
Date: Mon, 6 May 2024 14:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
To: Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
 dmitry.torokhov@gmail.com, Richard Hughes <hughsient@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org
References: <20240506114752.47204-1-charles.goodix@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240506114752.47204-1-charles.goodix@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/6/24 1:47 PM, Charles Wang wrote:
> Export a sysfs interface that would allow reading and writing touchscreen
> IC registers. With this interface many things can be done in usersapce
> such as firmware updates. An example tool that utilizes this interface
> for performing firmware updates can be found at [1].

I'm not sure if I'm a fan of adding an interface to export raw register
access for fwupdate.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix_fwupload.c

Contains update support for older goodix touchscreens and it is not
that big. I think it might be better to just have an in kernel fwupdate
driver for this and have a sysfs file to which to write the new firmware.

Adding Richard Hughes, fwupd maintainer to the Cc. Richard, do you have
any input on the suggested method for firmware updating ?

If raw register access is seen as a good solution, then I think this
should use regmap + some generic helpers (to be written) to export
regmap r/w access to userspace.

> [1] https://github.com/goodix/fwupdate_for_berlin_linux

Hmm, that tool seems to have some licensing issues there is an Apache License v2.0
LICENSE file, but the header of fwupdate.c claims it is confidential ...

Regards,

Hans


> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  drivers/input/touchscreen/goodix_berlin.h     |  2 +
>  .../input/touchscreen/goodix_berlin_core.c    | 52 +++++++++++++++++++
>  drivers/input/touchscreen/goodix_berlin_i2c.c |  6 +++
>  drivers/input/touchscreen/goodix_berlin_spi.c |  6 +++
>  4 files changed, 66 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
> index 1fd77eb69..1741f2d15 100644
> --- a/drivers/input/touchscreen/goodix_berlin.h
> +++ b/drivers/input/touchscreen/goodix_berlin.h
> @@ -19,6 +19,8 @@ struct regmap;
>  int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>  			struct regmap *regmap);
>  
> +void goodix_berlin_remove(struct device *dev);
> +
>  extern const struct dev_pm_ops goodix_berlin_pm_ops;
>  
>  #endif
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index e7b41a926..e02160841 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -672,6 +672,44 @@ static void goodix_berlin_power_off_act(void *data)
>  	goodix_berlin_power_off(cd);
>  }
>  
> +static ssize_t goodix_berlin_registers_read(struct file *filp, struct kobject *kobj,
> +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
> +{
> +	struct goodix_berlin_core *cd;
> +	struct device *dev;
> +	int error;
> +
> +	dev = kobj_to_dev(kobj);
> +	cd = dev_get_drvdata(dev);
> +
> +	error = regmap_raw_read(cd->regmap, (unsigned int)off,
> +				buf, count);
> +
> +	return error ? error : count;
> +}
> +
> +static ssize_t goodix_berlin_registers_write(struct file *filp, struct kobject *kobj,
> +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
> +{
> +	struct goodix_berlin_core *cd;
> +	struct device *dev;
> +	int error;
> +
> +	dev = kobj_to_dev(kobj);
> +	cd = dev_get_drvdata(dev);
> +
> +	error = regmap_raw_write(cd->regmap, (unsigned int)off,
> +				 buf, count);
> +
> +	return error ? error : count;
> +}
> +
> +static struct bin_attribute goodix_berlin_registers_attr = {
> +	.attr = {.name = "registers", .mode = 0600},
> +	.read = goodix_berlin_registers_read,
> +	.write = goodix_berlin_registers_write,
> +};
> +
>  int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>  			struct regmap *regmap)
>  {
> @@ -743,6 +781,14 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>  
>  	dev_set_drvdata(dev, cd);
>  
> +	error = sysfs_create_bin_file(&cd->dev->kobj,
> +				      &goodix_berlin_registers_attr);
> +
> +	if (error) {
> +		dev_err(dev, "unable to create sysfs file, err=%d\n", error);
> +		return error;
> +	}
> +
>  	dev_dbg(dev, "Goodix Berlin %s Touchscreen Controller",
>  		cd->fw_version.patch_pid);
>  
> @@ -750,6 +796,12 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>  }
>  EXPORT_SYMBOL_GPL(goodix_berlin_probe);
>  
> +void goodix_berlin_remove(struct device *dev)
> +{
> +	sysfs_remove_bin_file(&dev->kobj, &goodix_berlin_registers_attr);
> +}
> +EXPORT_SYMBOL_GPL(goodix_berlin_remove);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Goodix Berlin Core Touchscreen driver");
>  MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
> index 6ed9aa808..35ef21cc8 100644
> --- a/drivers/input/touchscreen/goodix_berlin_i2c.c
> +++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
> @@ -46,6 +46,11 @@ static int goodix_berlin_i2c_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> +static void goodix_berlin_i2c_remove(struct i2c_client *client)
> +{
> +	goodix_berlin_remove(&client->dev);
> +}
> +
>  static const struct i2c_device_id goodix_berlin_i2c_id[] = {
>  	{ "gt9916", 0 },
>  	{ }
> @@ -66,6 +71,7 @@ static struct i2c_driver goodix_berlin_i2c_driver = {
>  		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
>  	},
>  	.probe = goodix_berlin_i2c_probe,
> +	.remove = goodix_berlin_i2c_remove,
>  	.id_table = goodix_berlin_i2c_id,
>  };
>  module_i2c_driver(goodix_berlin_i2c_driver);
> diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
> index 4cc557da0..8ffbe1289 100644
> --- a/drivers/input/touchscreen/goodix_berlin_spi.c
> +++ b/drivers/input/touchscreen/goodix_berlin_spi.c
> @@ -150,6 +150,11 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
>  	return 0;
>  }
>  
> +static void goodix_berlin_spi_remove(struct spi_device *spi)
> +{
> +	goodix_berlin_remove(&spi->dev);
> +}
> +
>  static const struct spi_device_id goodix_berlin_spi_ids[] = {
>  	{ "gt9916" },
>  	{ },
> @@ -169,6 +174,7 @@ static struct spi_driver goodix_berlin_spi_driver = {
>  		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
>  	},
>  	.probe = goodix_berlin_spi_probe,
> +	.remove = goodix_berlin_spi_remove,
>  	.id_table = goodix_berlin_spi_ids,
>  };
>  module_spi_driver(goodix_berlin_spi_driver);


