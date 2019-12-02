Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1371110EEDB
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 19:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfLBSBD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 13:01:03 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45060 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfLBSBD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 13:01:03 -0500
Received: by mail-pl1-f193.google.com with SMTP id w7so237787plz.12;
        Mon, 02 Dec 2019 10:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1w9HwwKcyt/aaVgyqgk1aq69J6V3a1nHZf9c3WPixEs=;
        b=vOKtnxqTHWMAlkEVTF2m7iEod/7EhIbcOIAQeyHZPeP1GY1O1PeT3hmUYRWcQyXflF
         Hpar2GSvKs8RZdaXsFuAJ73k1VDimR2F2sa5I/R/0ougSxF/LLotqXHTb0mAQCQszRNg
         O8DAiYX3C1JYUQGFjldCQz2o9iAY0BHh8ZGvw2JgAgJG7Oqx5S8iDkFbbnqoxlF71Wmm
         nubHqS3bEFgISSPWrbagF4cr7AdxBSDlOJLhf4i/qjM2xVtmFkgB9TpZkFlMQREatWvw
         AMeRXif6C1JKhsyR+TrR1kTc9eWVj9S5TrJFKHWTqpg5tidRe164iLh2V3yQLRek/Pmz
         /Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1w9HwwKcyt/aaVgyqgk1aq69J6V3a1nHZf9c3WPixEs=;
        b=F8MiXMyCgn93w3e374JuCM7VJ8IW89DheCFM7ge0tf7pDoDdiQHFb0b8Suir/3Drak
         ERUCNJEwUVsp3GNlgBFIxLkGhnBiJc/0P95Bw1FDYocjoVB2OSyTUw2QJf0Q+06vlz0G
         53HsCDreeiWGI5QaexBBuI90gv7MlRO7/8Bj/GGi2sriQY58pit5PSjt0ttSa4PUcxHW
         LrFf7YxH5W89hOqY2gq8/Ts5iiSWntuQd2p1/jEn/Q9++862u0ah7ftX35TtCwZNaHA9
         MenL/N0bjg1WKeZUgqPgqr8+XUx8+5Ova1cghx9yHG8uXQYCDDoLy5YT63nNFoAZzz4w
         NM4A==
X-Gm-Message-State: APjAAAUOUnaQE8ow/5O5DpIUw4cOKU/vSASd5yplxyJDKxMARzE2T6P/
        rizhtEvcT7a8UzhOJFoPFmM=
X-Google-Smtp-Source: APXvYqwyj7Uhvra2x8yp386KtJKlOZUsotjhUnz3I4deUdPNzb/A1Ae+NpGG45t/WKkB+pndHq1q3Q==
X-Received: by 2002:a17:90a:1b45:: with SMTP id q63mr300841pjq.91.1575309660735;
        Mon, 02 Dec 2019 10:01:00 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h128sm108832pfe.172.2019.12.02.10.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 10:00:59 -0800 (PST)
Date:   Mon, 2 Dec 2019 10:00:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 4/5] Input: edt-ft5x06 - make wakeup-source switchable
Message-ID: <20191202180057.GC50317@dtor-ws>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127120948.22251-5-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 01:09:47PM +0100, Marco Felsch wrote:
> Since day one the touch controller acts as wakeup-source. This seems to
> be wrong since the device supports deep-sleep mechanism [1] which
> requires a reset to leave it. Also some designs won't use the
> touchscreen as wakeup-source.
> 
> According discussion [2] we decided to break backward compatibility and
> go the common way by using the 'wakeup-source' device-property.
> 
> [1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/FT5x26.pdf
> [2] https://patchwork.kernel.org/patch/11149037/
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - make use of common wakeup-source property
> - adapt commit message
> 
>  drivers/input/touchscreen/edt-ft5x06.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index e1b31fd525e2..8d2ec7947f0e 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -24,6 +24,7 @@
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/ratelimit.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> @@ -1056,6 +1057,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  	unsigned long irq_flags;
>  	int error;
>  	char fw_version[EDT_NAME_LEN];
> +	bool en_wakeup;
>  
>  	dev_dbg(&client->dev, "probing for EDT FT5x06 I2C\n");
>  
> @@ -1114,6 +1116,8 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> +	en_wakeup = device_property_present(&client->dev, "wakeup-source");
> +
>  	if (tsdata->wake_gpio) {
>  		usleep_range(5000, 6000);
>  		gpiod_set_value_cansleep(tsdata->wake_gpio, 1);
> @@ -1208,7 +1212,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  		return error;
>  
>  	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
> -	device_init_wakeup(&client->dev, 1);
> +	device_init_wakeup(&client->dev, en_wakeup);

I2C core already marks device as wakeup source if I2C_CLIEMT_WAKE is set
(and the flag is specified when, among other things, device has
"wakeup-source" property).

So the only thing that is needed is to remove

	device_init_wakeup(&client->dev, 1);

line.

Thanks.

-- 
Dmitry
