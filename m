Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9DB38F950
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 06:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhEYEYR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 00:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhEYEYQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 00:24:16 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E2EC061574
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 21:22:47 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 29so10607866pgu.11
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 21:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NZmdCP2ijxvF2Pp3p7gXjlQkQqFo5R3c2WUmI0uuZnE=;
        b=jveQ2e5gAw7iQEobfND7TtWBrW0FEMrLM6EraBmMpNepACBR0zy/I+HwsYzt3XaCxC
         mAGpRFXgwdrw0ntcbn4WNTHDzeE3M0E7b21VZ/MZW7aIJ8I285RUZw/PXE6DogKiGNEZ
         lZFs2OtNR3OM7PK1xgz79ERfQekB9NWng79dKskPyqC/l0wGkGI4v8Uq00ywkcO9fbhs
         rp2VFvFmST2LBv4kt7/X3urIXuW35eA3VAlwl12c5s+eSc51SymPZ8IPYoKWoMraJbP5
         zzlD/tPjFtypFl5SMpeDlA84npWZ19iVMkD/di1S4KbsYpclCiakrfDfNwjmeRhVV4yy
         rACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NZmdCP2ijxvF2Pp3p7gXjlQkQqFo5R3c2WUmI0uuZnE=;
        b=Enq7nGSkcJjlRw5ay1xAegcig0II10vN5ou8QIos4j2fmlZD6StrV9lKGf+T7C0TD9
         neB+XbCXeT8nOUgXQC0uBY5aClI/XUuLA/GgqJfkh2gzGyQNipI2JTUHHtffvpj1uxeU
         ar0qrNkEQr8dOol4X/0YuZGT4HlaLqAheTuemsoRtoxeNvE5YL4MdyCUczKFwAeJ8XLs
         lCCcxhquOMjTYLdtEPA8u49ZlhqcD255gKJESqL4xLdHbzXrczD1xTgXOn7lpZlkAKIY
         2/HOI1NNCH5k3g7kxSx3WHTQjSWHB7r5lfcn8+8cvzZC2OU41LDx2bA8LC/OqNmsNWtl
         8mGw==
X-Gm-Message-State: AOAM531YMegUGpWAIdnOJoNpJVYey+O42zzDhgfu9DBXDFmQKMsgUphf
        B1hJyWm42B9WA95FUoGXUfO4FjJbUrQ=
X-Google-Smtp-Source: ABdhPJzkEM28t5lat2Pqz2V88PNcgOKr2tRo9hmREF/b8KMtEX9NeKDsA14ARNWBDoeHSv68agM8ig==
X-Received: by 2002:a62:148e:0:b029:2e4:e5a5:7e33 with SMTP id 136-20020a62148e0000b02902e4e5a57e33mr19948304pfu.9.1621916567270;
        Mon, 24 May 2021 21:22:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:870d:a395:9098:674])
        by smtp.gmail.com with ESMTPSA id h18sm12216660pfr.49.2021.05.24.21.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 21:22:46 -0700 (PDT)
Date:   Mon, 24 May 2021 21:22:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 3/3 v5] Input: cyttsp - Obtain regulators
Message-ID: <YKx7k4nQhmlwejd+@google.com>
References: <20210509223416.346104-1-linus.walleij@linaro.org>
 <20210509223416.346104-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509223416.346104-3-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Mon, May 10, 2021 at 12:34:16AM +0200, Linus Walleij wrote:
> The CYTTSP TMA340 chips have two supplies: VCPIN and
> VDD for analog and digital voltage respectively.
> Add some minimal code to obtain and enable these
> regulators if need be.
> 
> Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v5:
> - Rebase on v5.13-rc1
> ChangeLog v1->v3:
> - Collect Javier's reviewed-by.
> ---
>  drivers/input/touchscreen/cyttsp_core.c | 30 +++++++++++++++++++++++--
>  drivers/input/touchscreen/cyttsp_core.h |  2 ++
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
> index 106dd4962785..5af4d034b36b 100644
> --- a/drivers/input/touchscreen/cyttsp_core.c
> +++ b/drivers/input/touchscreen/cyttsp_core.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/property.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "cyttsp_core.h"
>  
> @@ -628,6 +629,19 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
>  	ts->bus_ops = bus_ops;
>  	ts->irq = irq;
>  
> +	/*
> +	 * VCPIN is the analog voltage supply
> +	 * VDD is the digital voltage supply
> +	 */
> +	ts->regulators[0].supply = "vcpin";
> +	ts->regulators[1].supply = "vdd";
> +	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
> +					ts->regulators);
> +	if (error) {
> +		dev_err(dev, "Failed to get regulators: %d\n", error);
> +		return ERR_PTR(error);
> +	}
> +
>  	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ts->reset_gpio)) {
>  		error = PTR_ERR(ts->reset_gpio);
> @@ -673,20 +687,32 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
>  		return ERR_PTR(error);
>  	}
>  
> +	error = regulator_bulk_enable(ARRAY_SIZE(ts->regulators),
> +				      ts->regulators);
> +	if (error) {
> +		dev_err(dev, "Cannot enable regulators: %d\n", error);
> +		return ERR_PTR(error);
> +	}

Please use devm_add_action_or_reset() to inject code disabling
regulators on error or remove() into devm sequence, otherwise we are
leaving regulators on.

Thanks.

-- 
Dmitry
