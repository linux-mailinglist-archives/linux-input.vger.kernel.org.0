Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4768B906CC
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 19:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfHPRZE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 13:25:04 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39427 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfHPRZE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 13:25:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id f17so3440249pfn.6;
        Fri, 16 Aug 2019 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eV24mEVLUAWo7NIyZVsA3Rt3ddpLn+tixssQhqBd+jk=;
        b=I+Yu8AIZCUfZGeLW+9Sse7haGYCSeVgo6YQFpsbqTSKXFIJnN0aXAbLZbEEsSIY8YX
         pAT47/Au77G8bGzng16YJ3xYOkkFn1b03yP1fa9kWUreOp/ZCpS2BakuxLk1SdN6wTnS
         1MFBXs1a42yW5TjTtBR9PmXqybYzO9fi6wuBOFV011lrRLF9V88G4OfScbwUZX6ydA0D
         v+7bByYBbZm+B5ZeKDGpqSbbTS2uVDGEnhYrD0ccjMO7+8ophxICG/gMxnG+zhUHYREm
         HEOpxl2IELn26+TAzT9qrhoxaBUgMrVnEuA+Qh+43Mi2M3sMtez4zVV1sPOlXW8DQsMg
         CciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eV24mEVLUAWo7NIyZVsA3Rt3ddpLn+tixssQhqBd+jk=;
        b=Xqp5bWlOZhMyQhuYliL0/XYhGjdsABAVFlx9Y4ZpQQoKY43WLhERnt6NqngHekW1K3
         svCb5ZywrL5ijVZboxWbZeYu1pYz7A91zAsd7wrNy0o39xCOTQh+gGwfrNIA9R9ASwZF
         P2bmXiGI0ujVtsy0Q+m31WISg40I84G3Dov1eMbpXDZDQbbSbbyX1RTGD+F92wH24HLS
         5+ATtTc+u3Xnjpj4qFxflOSJHP4xxenMQOHaNbnWTxszPOkYHDdRTSzHX6vU6gJKJYYL
         eE+QTdZ14gQIaaOE576mx8lrZ0owCultOCMnaFku1/BEsXdyAL+HFsm5ixzubvzBuEii
         U9pQ==
X-Gm-Message-State: APjAAAX4/KiGE6XJLA+X6eIO+5eqCkz7ogHVoZ1p8nEFPsYhWI+747O/
        tNrgYPe4X57l3+eGKdlR5yM=
X-Google-Smtp-Source: APXvYqwqzHmUMmNaFK9M5wvmk81EsJ02lZiWY9eiwt5XVUo8e0fiIvbYMs8bsG3xPM4sQeDUjCy9Yg==
X-Received: by 2002:a65:448a:: with SMTP id l10mr8556895pgq.327.1565976303259;
        Fri, 16 Aug 2019 10:25:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z14sm4177882pjr.23.2019.08.16.10.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 10:25:02 -0700 (PDT)
Date:   Fri, 16 Aug 2019 10:25:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, george_davis@mentor.com
Subject: Re: [PATCH v1 39/63] Input: touchscreen: Atmel: Add device tree
 support for T15 key array objects
Message-ID: <20190816172500.GI121898@dtor-ws>
References: <20190816083525.19071-1-jiada_wang@mentor.com>
 <20190816083525.19071-5-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816083525.19071-5-jiada_wang@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 16, 2019 at 05:35:01PM +0900, Jiada Wang wrote:
> From: Daniel Gong <Zhanli.Gong@cn.bosch.com>

This should be with the code adding T15 handling.

> 
> Signed-off-by: Daniel Gong <Zhanli.Gong@cn.bosch.com>
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index be63002c2b31..3b9544c0a209 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -4143,10 +4143,12 @@ static int mxt_parse_device_properties(struct mxt_data *data)
>  {
>  	static const char keymap_property[] = "linux,gpio-keymap";
>  	static const char gpios_property[] = "atmel,gpios";
> +	static const char buttons_property[] = "atmel,key-buttons";
>  	struct device *dev = &data->client->dev;
>  	struct device_node *np = dev ? dev->of_node : NULL;
>  	struct device_node *np_gpio;
>  	u32 *keymap;
> +	u32 *buttonmap;
>  	int n_keys;
>  	int error;
>  
> @@ -4181,6 +4183,33 @@ static int mxt_parse_device_properties(struct mxt_data *data)
>  		data->t19_num_keys = n_keys;
>  	}
>  
> +	if (device_property_present(dev, buttons_property)) {
> +		n_keys = device_property_read_u32_array(dev, buttons_property,
> +							NULL, 0);
> +		if (n_keys <= 0) {
> +			error = n_keys < 0 ? n_keys : -EINVAL;
> +			dev_err(dev, "invalid/malformed '%s' property: %d\n",
> +				buttons_property, error);
> +			return error;
> +		}
> +
> +		buttonmap = devm_kmalloc_array(dev, n_keys, sizeof(*buttonmap),
> +					       GFP_KERNEL);
> +		if (!buttonmap)
> +			return -ENOMEM;
> +
> +		error = device_property_read_u32_array(dev, buttons_property,
> +						       buttonmap, n_keys);
> +		if (error) {
> +			dev_err(dev, "failed to parse '%s' property: %d\n",
> +				buttons_property, error);
> +			return error;
> +		}
> +
> +		data->t15_keymap = buttonmap;
> +		data->t15_num_keys = n_keys;
> +	}
> +
>  	device_property_read_u32(dev, "atmel,suspend-mode", &data->suspend_mode);
>  
>  	np_gpio = of_get_child_by_name(np, gpios_property);
> -- 
> 2.19.2
> 

-- 
Dmitry
