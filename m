Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456BF136491
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbgAJBHP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:07:15 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40072 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbgAJBHP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:07:15 -0500
Received: by mail-pl1-f195.google.com with SMTP id s21so164897plr.7;
        Thu, 09 Jan 2020 17:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RucCZQ4sb/R2yGrWWDwh4H1jBsTOsRv/1jEJmC7xR08=;
        b=VkziFxEPf3zTg0IZE1DsQnY37bNfxEP3UbJG6V/A3Fin6xU31TZ8iAdkfY2yFCX+bh
         TB52PR1FRY5d1SYFrgn3g94uy/oVAkHHTVtnLIuWc3eEWClyhvRuIOhGGZl4/wLTzif4
         3b1ovW1725G5BU60ria7pUhwQQmWXCPj4I+bvz3YgQmBA7dtKwwowxCpenB+zkk/CY9e
         1w6D3OYw0u+HUYKY9LdIacibkXj+pDZKcb11Ofsg2RnyYAPE67gCcE9TmWLmtIN1wx4+
         nUzgx2AlwUXIZD0YfpQFKr+7JQB7Uek5Yi+HObJTWrXUVPnH/Dj3ZxWSdQcNw5WZKMAj
         ln8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RucCZQ4sb/R2yGrWWDwh4H1jBsTOsRv/1jEJmC7xR08=;
        b=Fjd2tlRznpsiSgaUk9v6W8rCxUWqwvie5Id98aODPFjZcfDVKG2wwUMZ30Lt1Z7xon
         14/KZXmo5mgd1YlhcaH1g1ZRRuAUvoRUssyxokzVfyRvE1lhK1p5c+Nc6bVk0tY0p/rj
         C4cfZiL/N88Nm7Dvyf9A7tCou/D6qTa9rJeaVLcP4erWL9n2hjL+uhUXT1kOEhNKPvKB
         b0QRIFbeIec/KgDGXqja7hVZt47YnHGXuvbzpnOkLpApWDPHWEur1bLN0/2pQXCFZK+0
         ZGbwWWs//U0ohVdOHojUc77O31gDt/O2pkjl9khQfUOY/cNPD90sHmku5UoG3kx4O/0w
         Gfew==
X-Gm-Message-State: APjAAAVvKWDFZkuJpaVgvgsPAzbBA0sWI6iYy1eyaF6RQ1ViQ36ZLn1G
        Hl+lOus4eqRe8A882x99J8o=
X-Google-Smtp-Source: APXvYqzhObQopxKoE5MKGhClfatWqO3TjQeK5RGPj0caYDhpv7S8W7G62HP4v0FplSTlI2GNlpyA+A==
X-Received: by 2002:a17:902:b210:: with SMTP id t16mr945036plr.65.1578618434714;
        Thu, 09 Jan 2020 17:07:14 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b42sm243169pjc.27.2020.01.09.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:07:14 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:07:12 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 4/6] Input: edt-ft5x06 - make wakeup-source switchable
Message-ID: <20200110010712.GN8314@dtor-ws>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
 <20200108111050.19001-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108111050.19001-5-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 08, 2020 at 12:10:48PM +0100, Marco Felsch wrote:
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
> Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thank you.

> ---
> v3:
> - make use of i2c-core wakeup-source handling
> 
> v2:
> - make use of common wakeup-source property
> - adapt commit message
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index e1b31fd525e2..c781952c3409 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1208,7 +1208,6 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  		return error;
>  
>  	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
> -	device_init_wakeup(&client->dev, 1);
>  
>  	dev_dbg(&client->dev,
>  		"EDT FT5x06 initialized: IRQ %d, WAKE pin %d, Reset pin %d.\n",
> -- 
> 2.20.1
> 

-- 
Dmitry
