Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83EEC136494
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730374AbgAJBHW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:07:22 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43727 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbgAJBHW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:07:22 -0500
Received: by mail-pg1-f195.google.com with SMTP id k197so148932pga.10;
        Thu, 09 Jan 2020 17:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8gf0dC0dRVdVH3asejeWCAw3bScAeUAoa43f1Y4k490=;
        b=cxyPo7ds5XIm+IoCGIkrhULbAZHlYT3Uue6K5gNqz1V6eu8xVpD49Jlgzb72zY41ng
         yN2KO5uV8QiQVwMHErpoqKOwp3reWkjDl3+d8FkNVVNMKJgnKv79O8WRZRtxpWjzXxRh
         tRwlBWcZBxM3Bllavo4MHIPXyfACHhPKqjcY3ts2CJFhM7YkRNLvU6EfkE1c7aUX1sST
         8D/eTaXvGGOstpdXzsC2LshxmyzPYXsA9WOdwtE1EWQGTEf3ZTiUM6h/Xc8N1Ai89qil
         FmP4vEMp+8eIqKdxMnABJx1TCP3pkocdEUTmWz+0OJhujC7nZIZrJBFYEQCl9mYywzSk
         V8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8gf0dC0dRVdVH3asejeWCAw3bScAeUAoa43f1Y4k490=;
        b=gncE7QuB/IadnHIQL3VkpZS1dnHaQy5uOWn5eg8VAjMNakwEJAETcYtDzIBxsqNXLF
         B53aosx+dRHToXj2P6tosP4AKlIhrN4LdRHvPzlq+b6Uhm7lmqhO9cYomrEtiLYSFl6+
         Rtpga+mnw38331Tob4kN6dM+MihoVjBtyntpGVZ4Wf4xhY616piWjrojG3uouhBqdZ4h
         azVa7Q+063sn7LTbLGn4hSCh+SA87oWn7W6D240TjctepHmd5mnNtdbmTb2nUQnh06Ev
         PHDxvsJdfXmNHohblehh+ec1tgD/JI9IRPlZ0AOdsndkE+ndbxMeBLWzdmm+t7zWeEgK
         K+Nw==
X-Gm-Message-State: APjAAAXdiycjyzsIaO5GCBMnI2eDKfnY9cTA4PIVlWNL4j+74i3rIQ6G
        zLTp9sx7t9RI492ONP4/px0=
X-Google-Smtp-Source: APXvYqzGRZlbena3J1Z60asKocS5Z+w3g+ggFh+Hq6TtZ3PNXIBj9lB5N3rZl9MsKXb/NbH6+3IDcQ==
X-Received: by 2002:a62:7696:: with SMTP id r144mr823327pfc.177.1578618441252;
        Thu, 09 Jan 2020 17:07:21 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u2sm174091pgc.19.2020.01.09.17.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:07:20 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:07:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 5/6] Input: edt-ft5x06 - use pm core to enable/disable
 the wake irq
Message-ID: <20200110010718.GO8314@dtor-ws>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
 <20200108111050.19001-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108111050.19001-6-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 08, 2020 at 12:10:49PM +0100, Marco Felsch wrote:
> We do not have to handle the wake-irq within the driver because the pm
> core can handle this for us. The only use case for the suspend/resume
> callbacks was to handle the wake-irq so we can remove the callbacks.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.

> ---
> v3:
> - new patch to drop enable/disable_irq_wake() calls
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 24 ------------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index c781952c3409..d2587724c52a 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1227,29 +1227,6 @@ static int edt_ft5x06_ts_remove(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -
> -	if (device_may_wakeup(dev))
> -		enable_irq_wake(client->irq);
> -
> -	return 0;
> -}
> -
> -static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -
> -	if (device_may_wakeup(dev))
> -		disable_irq_wake(client->irq);
> -
> -	return 0;
> -}
> -
> -static SIMPLE_DEV_PM_OPS(edt_ft5x06_ts_pm_ops,
> -			 edt_ft5x06_ts_suspend, edt_ft5x06_ts_resume);
> -
>  static const struct edt_i2c_chip_data edt_ft5x06_data = {
>  	.max_support_points = 5,
>  };
> @@ -1288,7 +1265,6 @@ static struct i2c_driver edt_ft5x06_ts_driver = {
>  	.driver = {
>  		.name = "edt_ft5x06",
>  		.of_match_table = edt_ft5x06_of_match,
> -		.pm = &edt_ft5x06_ts_pm_ops,
>  	},
>  	.id_table = edt_ft5x06_ts_id,
>  	.probe    = edt_ft5x06_ts_probe,
> -- 
> 2.20.1
> 

-- 
Dmitry
