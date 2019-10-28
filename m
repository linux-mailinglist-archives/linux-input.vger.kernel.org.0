Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F91E7D1A
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 00:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731637AbfJ1Xid (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 19:38:33 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35971 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfJ1Xic (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 19:38:32 -0400
Received: by mail-pl1-f196.google.com with SMTP id g9so5935295plp.3;
        Mon, 28 Oct 2019 16:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rcCZ53RwEYpDpGOEaXXe4dALJ7rLP+WtLnX4AoLa6xE=;
        b=R+hY9P1plzrpzZCLwFiO8LmTIAQjJ/N8JxGhyEFI4ihQQfdN0ElpOroT5q3npDcTzK
         T7xxO/yNgSFGo9/aXULo47a1Tam3xx8PcFBDI/7bdj2DcH2pVqjlQIQfvFMNMo6sjTSA
         o+URwc1NZNWP0vZKJCX3EKJQHhNqJIB93uAHSAj1DtY+/fkemy3YPsh/E63ZQPuJZ96y
         3hQz0sOx3z/8IGCw1B1fg7FxXAg7+DuS3SW5XrCFHLL0T5Izl+imMfBpJ8W/pnwgrH+6
         ljxusI0GMLkNmKZXSBhRr92OBD4B50R1VPF39yvUigiHtFv0pesAPkbfkaUp+PrieCHg
         OSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rcCZ53RwEYpDpGOEaXXe4dALJ7rLP+WtLnX4AoLa6xE=;
        b=DfLK2vv8WPaj9yLL4Mlf4ONRujSELiOvDiPYxCqYsTyv+6g/aRQl2Puh8xkaxzMkMQ
         N6dIeNJaEzianBLxIlDj+ijblT49lva3NPM0jwNETYvWYqbU01E6VLDTGL5q+1uForO2
         0TjYPkRaDEAncjpYFjSRWykcXgH8z7Qac1/7smvkTQdq3VIOaWr5JzCbhp03zXb5w0lw
         wF23G+aY4aHVJsR4KzvepFPy53QdCCZylFQbZEdjX9ENOgjc7Oxz5CThuVRigoBNH2eg
         IQJbxNe+sCbkpX3UuRFaFxs/zdeZYdZwm3TXsrd0m8A1CFRQN+2g4G7jIVGYLVHOLyJa
         BzjA==
X-Gm-Message-State: APjAAAWPK+akT+Vbu5lo/K2miw2UeENnetPunUXp33F1b5F/RzKRo8HV
        SGNjEkVUPNrn3pc5+pPnCXK61Xlu
X-Google-Smtp-Source: APXvYqxwuSbByXQBKFk5+9hCeN4OZScPkx8p4Zb6Ry7/i9qhgON4+IsHT1hSF3thJVEwiUIzcRMzIQ==
X-Received: by 2002:a17:902:a610:: with SMTP id u16mr738406plq.200.1572305911798;
        Mon, 28 Oct 2019 16:38:31 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v6sm11598182pgv.24.2019.10.28.16.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:38:30 -0700 (PDT)
Date:   Mon, 28 Oct 2019 16:38:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER" 
        <linux-input@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] input: sun4i-lradc-keys: Add wakup support
Message-ID: <20191028233828.GA57214@dtor-ws>
References: <20191028221502.3503543-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028221502.3503543-1-megous@megous.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ondrej,

On Mon, Oct 28, 2019 at 11:15:02PM +0100, Ondrej Jirman wrote:
> Allow the driver to wakeup the system on key press.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> index 4a796bed48ac..bba679d7b54b 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -22,6 +22,8 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/pm_wakeup.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  
> @@ -226,8 +228,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
>  {
>  	struct sun4i_lradc_data *lradc;
>  	struct device *dev = &pdev->dev;
> -	int i;
> -	int error;
> +	int i, error, irq;
>  
>  	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), GFP_KERNEL);
>  	if (!lradc)
> @@ -272,8 +273,13 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
>  	if (IS_ERR(lradc->base))
>  		return PTR_ERR(lradc->base);
>  
> -	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
> -				 sun4i_lradc_irq, 0,
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get IRQ\n");
> +		return irq;
> +	}
> +
> +	error = devm_request_irq(dev, irq, sun4i_lradc_irq, 0,
>  				 "sun4i-a10-lradc-keys", lradc);
>  	if (error)
>  		return error;
> @@ -282,6 +288,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
>  	if (error)
>  		return error;
>  
> +	device_init_wakeup(dev, true);

I do not think we want to do this unconditionally. Can we maybe key off
"wakeup-source" device property.

> +
> +	error = dev_pm_set_wake_irq(dev, irq);
> +	if (error) {
> +		dev_err(dev, "Could not set wake IRQ\n");
> +		return error;
> +	}
> +

I wonder if we could teach platform driver core to handle this for us.

Thanks.

-- 
Dmitry
