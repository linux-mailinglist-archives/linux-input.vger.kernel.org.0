Return-Path: <linux-input+bounces-4545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B291912805
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 16:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7967288D3E
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 14:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930282135A;
	Fri, 21 Jun 2024 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leWgReEU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BF2C69B;
	Fri, 21 Jun 2024 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980710; cv=none; b=jsqCUa0SZ4OfR7O4ZsyiYDengLzRDBiHiT2LMHqTgDgte1TPNLYVuVgvRKA6xSS84KGNpi1iuP8XcAtU57mF/n5/6MScKBkwldZ9uUh3KadR+lbS64m2i6SlG8KOctC9m7VwvFokXRhPfh3+TFO2JWN5gl/YJoAWfhZVjAAnv/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980710; c=relaxed/simple;
	bh=OFsMerkpLml/Yel0FswMbPjyh2bBw+rYuhjVlIR66Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heT6rQrhrKIQgNX96XjBzcZLMTzBkmL3yusdtNDUFENww4TZRFxfM28T7pHKty2Eal1sbKqNIkHcQZ1F47pF+k+3jMxF0NItzbZl5pQNWF1rHzO4KDGiGRzl107SOolKGqSKaYQqf/6nYY5xNfeuz7qDPIEkgGHp4dvV37jc3Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leWgReEU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4218314a6c7so17917965e9.0;
        Fri, 21 Jun 2024 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718980707; x=1719585507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmmWGPZLjK3G3SA6NooN/QLEoyW6TtuGBY6WdnfAAco=;
        b=leWgReEU5Ygr9LOKYUGa91GXig6KEV/c0/ZBmLxGVycZbnVeATGgbH3PgmrHb5pH/3
         POGF6TYVWLwdhyNYyv+esv0qICl2lCpwBDjeVil9hZUT9+qPWPBRdgvYOvH/U2fz79rO
         srsLLU9YeWU8KUAla0yvvr2W14nheBA5QRufHg8/pzZp3XfjyCUVbY3bl4hb9ths7MNU
         biLs0gPWg0ulVEf28C+Y14JLJkPB12jYbJ19DmG60Nczly2TAHsbwHzypSoxaFUkq5vQ
         qt8Oes2y8HdMUYpNp0hABEWL6SWC5/3oUGZHDbEakRdprFSuEQZd22LvWpCgPst5urHs
         NuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718980707; x=1719585507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmmWGPZLjK3G3SA6NooN/QLEoyW6TtuGBY6WdnfAAco=;
        b=WCoTK8mXFVWpxvMGhDGpSjA6neaYZQ1E7d+IF804jcHfiVxRpXlSfvl1xpipm+uTBo
         5rPBVlAHFcQCuVpcC25K59tZ2FfI84tw2SDgDt/Uq0nKY17tPtW/z8mPahYpZQQ87Jmm
         ZwwWPfWR0Pcq0n2SGNGL2r11T/9JiT0YzPHYLdUaXB8SaX1xaApVOVzqYKy/Xt9kU+Jz
         GLLIQJQQZnseV++n8Ar6uglOO8DDzkBRur7LM8bAVgMKx4QeqKZ0VQKpjoMhnQLxGOWG
         Bf95UQnM9YOsmFBOd9ikX4F9CZtCHQhGn294qyLbX51TWcEGLCh4f3Dyh3RidxaXkl5G
         +XYA==
X-Forwarded-Encrypted: i=1; AJvYcCVpq3TjcIizqIcvnj2ECEoq+P6UcLYtNS0rXsZIpR7pdadbAehgLaYF7tlV/h5a2WL5WM26BJrF2eC0kjeG4RW0UhBq36LEr6RRKAwzZX2SwnJaOCTK7ZA1KkzRgUXqXeoOZnsz828Ab1nLe6aWaRFO8XcLHtRaYkSOc1HKGqsiQgtwryLj
X-Gm-Message-State: AOJu0Yy8hHBK4Ah1SJc9TmbJe5eKb52+Ln9YNysXkON/2aojeGGG7VU/
	G7GQ/aSrsBk2F5dAXZm3VWFs3grribDRVCk9B9ULbq1TFUGGMj6Z
X-Google-Smtp-Source: AGHT+IGTFyJEJlx/pYBjW3mrPn4TfjUgSZJZrcUjTy19xTD34e1W/E9Pk33yXvWlmRrhHDj2wrVZ1A==
X-Received: by 2002:a05:600c:35cf:b0:424:80f3:c001 with SMTP id 5b1f17b1804b1-42480f3c18dmr22951215e9.8.1718980707028;
        Fri, 21 Jun 2024 07:38:27 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:b162:502a:9bd1:4c8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b27sm67482395e9.30.2024.06.21.07.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:38:26 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:38:25 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: nick@shmanahar.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 1/4] Input: atmel_mxt_ts - add power off and power on
 functions
Message-ID: <ZnWQYc1IunNyhmD4@eichest-laptop>
References: <20240417090527.15357-1-eichest@gmail.com>
 <20240417090527.15357-2-eichest@gmail.com>
 <ZnRMxONryyi5uZ8a@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnRMxONryyi5uZ8a@google.com>

Hi Dmitry

On Thu, Jun 20, 2024 at 08:37:40AM -0700, Dmitry Torokhov wrote:
> Hi Stefan,
> 
> On Wed, Apr 17, 2024 at 11:05:24AM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Add a separate function for power off and power on instead of calling
> > regulator_bulk_enable and regulator_bulk_disable directly.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> >  drivers/input/touchscreen/atmel_mxt_ts.c | 59 +++++++++++++++---------
> >  1 file changed, 37 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> > index 542a31448c8f..52867ce3b9b6 100644
> > --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> > +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> > @@ -1307,6 +1307,38 @@ static int mxt_soft_reset(struct mxt_data *data)
> >  	return 0;
> >  }
> >  
> > +static int mxt_power_on(struct mxt_data *data)
> > +{
> > +	int error;
> > +
> > +	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
> > +				      data->regulators);
> > +	if (error) {
> > +		dev_err(&data->client->dev, "failed to enable regulators: %d\n",
> > +			error);
> > +		return error;
> > +	}
> > +
> > +	msleep(MXT_BACKUP_TIME);
> > +
> > +	if (data->reset_gpio) {
> > +		/* Wait a while and then de-assert the RESET GPIO line */
> > +		msleep(MXT_RESET_GPIO_TIME);
> > +		gpiod_set_value(data->reset_gpio, 0);
> > +		msleep(MXT_RESET_INVALID_CHG);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void mxt_power_off(struct mxt_data *data)
> > +{
> > +	if (data->reset_gpio)
> > +		gpiod_set_value(data->reset_gpio, 1);
> > +
> > +	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
> > +}
> > +
> >  static void mxt_update_crc(struct mxt_data *data, u8 cmd, u8 value)
> >  {
> >  	/*
> > @@ -3305,25 +3337,9 @@ static int mxt_probe(struct i2c_client *client)
> >  		return error;
> >  	}
> >  
> > -	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
> > -				      data->regulators);
> > -	if (error) {
> > -		dev_err(&client->dev, "failed to enable regulators: %d\n",
> > -			error);
> > +	error = mxt_power_on(data);
> > +	if (error)
> >  		return error;
> > -	}
> > -	/*
> > -	 * The device takes 40ms to come up after power-on according
> > -	 * to the mXT224 datasheet, page 13.
> > -	 */
> > -	msleep(MXT_BACKUP_TIME);
> > -
> > -	if (data->reset_gpio) {
> > -		/* Wait a while and then de-assert the RESET GPIO line */
> > -		msleep(MXT_RESET_GPIO_TIME);
> > -		gpiod_set_value(data->reset_gpio, 0);
> > -		msleep(MXT_RESET_INVALID_CHG);
> > -	}
> >  
> >  	/*
> >  	 * Controllers like mXT1386 have a dedicated WAKE line that could be
> > @@ -3361,8 +3377,8 @@ static int mxt_probe(struct i2c_client *client)
> >  	mxt_free_input_device(data);
> >  	mxt_free_object_table(data);
> >  err_disable_regulators:
> > -	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
> > -			       data->regulators);
> > +	mxt_power_off(data);
> > +
> >  	return error;
> >  }
> >  
> > @@ -3374,8 +3390,7 @@ static void mxt_remove(struct i2c_client *client)
> >  	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
> >  	mxt_free_input_device(data);
> >  	mxt_free_object_table(data);
> > -	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
> > -			       data->regulators);
> > +	mxt_power_off(data);
> 
> This change means that on unbind we will leave with GPIO line asserted.
> Won't this potentially cause some current leakage? Why do we need to
> have reset asserted here?

This is correct, but I checked the datasheet of three different maxTouch
models and all of them have the reset line low active. This means we had
a current leakage before this patch. Now it is fixed because we assert
the reset line, which sets the pin to 0. I also think it makes sense if
we look at the power on sequence. There we first power on the controller
before we release the reset line. Without asserting it on unbind this
would never trigger a reset after a power on.

Regards,
Stefan

