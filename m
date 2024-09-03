Return-Path: <linux-input+bounces-6107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 035DD96A6E9
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 20:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61022828E2
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 18:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C143192B85;
	Tue,  3 Sep 2024 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnpYIPNj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CED1925AB;
	Tue,  3 Sep 2024 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725389433; cv=none; b=UGr/SfKEo9bvO9n8di2qOLoHcz9HbpYtk3YUrZgOGsAobyc0KSLV290RoH/rct3D6VxY9Qq3rtvgjbgxgHLAnE3zP2Rxwfb+A9Z++GOfbmleE0Neqgj9JDHzsJQqmrHjfH8L2u/T4Nc/p/06TY17YLecWVAOhLmJn76EenghrWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725389433; c=relaxed/simple;
	bh=kSg1533I0r0PkbK2TEZPHjRsuMCYmQmvrMKSfsnHYpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTefv8TKbeie/EjS2qsx+TunC9i3kciTPQH/Sg0eCl7OCFajtWt0Exigsr2qwBGvtHQ8sFdCzCFrA2JyYjoiDGVPIj5zcBQY3fdNjhhud23+9JZ2bbmd8YF0QpaK90wpGJgac8xT6Lxj7P0SAXjtI3vgiR/eBpAof37DdNuy/6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnpYIPNj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2da4ea59658so1219373a91.0;
        Tue, 03 Sep 2024 11:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725389431; x=1725994231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bu4GQe3UiaUM0tGnHsfH7VdXeNCJgGZKmohYeo4w/J8=;
        b=TnpYIPNj//0HBopWY0grKmGBZ3zGd8fnts+YcJMiNDNNmov/RAvhqzh1paYz5nroqk
         fPkqT8zaXZyEAtNI9+jqk+5qwcWbqxFgQ7blOBaOxAuGhSHt1aemuLlKDgV954+yGnG/
         f71JteaXrNQCyBVV1xEUNUkH3xlXry7zd228HILimOsOz0Hmg0KjxhkPe4g8I6ZdLqAt
         RbFS6TNUN+C3uS0kASJa3ccBA76uVhhOPxfNV2ECnW5EsHhDxG6M8u4CmYG90norJ38f
         KqJLGaggH9eVMFI+vebLjVn2LVRYk7SeoP3h0xj+PyrkyKihRFh7IiRofQrHDnmpddld
         sc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725389431; x=1725994231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu4GQe3UiaUM0tGnHsfH7VdXeNCJgGZKmohYeo4w/J8=;
        b=i26k8bXOboeYKlFri9fwHp5QZM9lGuqKDSwM+uaonzdfgT71p8ZDRS8yeFUHITR0kG
         hHBqs+BWUZD+XEFWDGIWesXZyUud8lV5nygU9T7oQe8Jqu+G4K3M4T8XBtydFWD5qwyd
         XZrSSHXz8S7MPczwlaegUrnMEbI0TudQUfE5UZNoLuKy4DO+VdVyCVnT1M+aOvjh6iyh
         PY9zIRZFyg1h6RJQxZHpPa3fKzL8aJG6dmzqg921y+8rs5WsC9qZynnOQws/hSBPyC0S
         MwUAds82BfuCacc330E+zUAYwoYR04EtwkY6TtBSvt1ZOEc+cGTmXDdL3WPa2yE9cRLN
         rGuA==
X-Forwarded-Encrypted: i=1; AJvYcCV37MM/neQuy6W49dk3GFYO2+bNW1+2D0hpJ9296hPgoJ0jlWS2YyJ3aCAZNIIrgZGxf/1Xk8khKjBwL4I=@vger.kernel.org, AJvYcCVF1pC/INIZk2I3INcgKZU4bjDgJYXWEf0V36ZI5P8DrweosgU+Yw02C7tEc2+cpgHBW7J3seEAG00n@vger.kernel.org, AJvYcCXe5nBx7/TsyC/gS7a7X3c8/yT5YlCJ6Ah7cM0/mMyluV1ZKy+fwUYzk0tKSE+5tbD95Bh4Hiub1cAWBwju@vger.kernel.org
X-Gm-Message-State: AOJu0YytSB1bEYABCEoEHM2c+Xov0lNCXxXwnPiaIVM6GN6+BxWMMn62
	BBDqSIsGZky/IpiXkMLvFq2SPIBXAcOrWV00i78/Z0SmS2ZZ+v+Q
X-Google-Smtp-Source: AGHT+IH7i+s8ay2RYSBwbw0EFEWCvvj5h6jWEmYf/dWAvwbObT9pZF3N5UCpn3lN33Kc/lIg2ODlAA==
X-Received: by 2002:a17:90a:f2d8:b0:2cf:cc0d:96cc with SMTP id 98e67ed59e1d1-2d88d6680b5mr13365416a91.9.1725389430525;
        Tue, 03 Sep 2024 11:50:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da7ba49b57sm734102a91.18.2024.09.03.11.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 11:50:30 -0700 (PDT)
Date: Tue, 3 Sep 2024 11:50:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] input: touchscreen: ad7877: add dt support
Message-ID: <Ztdac2BANNpShK2t@google.com>
References: <20240902082707.4325-1-antoniu.miclaus@analog.com>
 <20240902082707.4325-2-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902082707.4325-2-antoniu.miclaus@analog.com>

Hi Antoniu,

On Mon, Sep 02, 2024 at 11:24:32AM +0300, Antoniu Miclaus wrote:
> Add devicetree support within the driver.
> 
> Make the old platform data approach optional.

Nobody is using it, so simply remove it.

> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> new in v2.
>  drivers/input/touchscreen/ad7877.c | 68 +++++++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
> index 7886454a19c6..3fa38043b561 100644
> --- a/drivers/input/touchscreen/ad7877.c
> +++ b/drivers/input/touchscreen/ad7877.c
> @@ -27,6 +27,7 @@
>  #include <linux/input.h>
>  #include <linux/interrupt.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spi/ad7877.h>
> @@ -667,6 +668,68 @@ static void ad7877_setup_ts_def_msg(struct spi_device *spi, struct ad7877 *ts)
>  	}
>  }
>  
> +static struct ad7877_platform_data *ad7877_parse_props(struct device *dev)
> +{
> +	struct ad7877_platform_data *pdata;
> +	u32 value, average;
> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pdata->model = (uintptr_t)device_get_match_data(dev);
> +
> +	device_property_read_u8(dev, "adi,stopacq-polarity",
> +				&pdata->stopacq_polarity);
> +	device_property_read_u8(dev, "adi,first-conv-delay",
> +				&pdata->first_conversion_delay);
> +	device_property_read_u8(dev, "adi,pen-down-acc-interval",
> +				&pdata->pen_down_acc_interval);
> +	device_property_read_u8(dev, "adi,acquisition-time",
> +				&pdata->acquisition_time);
> +
> +	device_property_read_u16(dev, "adi,vref-delay-usecs",
> +				 &pdata->vref_delay_usecs);
> +
> +	device_property_read_u32(dev, "touchscreen-x-plate-ohms", &value);
> +	pdata->x_plate_ohms = (u16)value;
> +	device_property_read_u32(dev, "touchscreen-y-plate-ohms", &value);
> +	pdata->y_plate_ohms = (u16)value;
> +	device_property_read_u32(dev, "touchscreen-min-x", &value);
> +	pdata->x_min = (u16)value;
> +	device_property_read_u32(dev, "touchscreen-min-y", &value);
> +	pdata->y_min = (u16)value;
> +	device_property_read_u32(dev, "touchscreen-max-x", &value);
> +	pdata->x_max = (u16)value;
> +	device_property_read_u32(dev, "touchscreen-max-y", &value);
> +	pdata->y_max = (u16)value;
> +	device_property_read_u32(dev, "touchscreen-max-pressure", &value);
> +	pdata->pressure_max = (u16)value;
> +	device_property_read_u32(dev, "touchscreen-min-pressure", &value);
> +	pdata->pressure_min = (u16)value;

Please use touchscreen_parse_properties() and also apply transformations
via touchscreen_report_pos() instead of rolling your own logic.

Thanks.

-- 
Dmitry

