Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 165D5683DD
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 09:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbfGOHHH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 03:07:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41927 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbfGOHHG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 03:07:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so7771746pls.8;
        Mon, 15 Jul 2019 00:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pSC+/Vapa63qJAD8HSHAp0SCmOrA1F7T+uT16tkYTr4=;
        b=tDtwyMHm6/+OQ9aR/h4cWRSLljjiZmbZ5WGeExhumKIuy6ReIXJ5XcIoURoIjw2Uk8
         lpseICB0R8GexFhXEt50+QLIj9T3SjIbXJpkVPIf5sKaWxtrOhRRf3a/pN3NUqUTZSv3
         RSRtkwpJfl1osB2lD9oyrmztdAGCL9LfPBgJyr0OMPpv4hdY1jGlfSg/DcLP098lPUXe
         6Jjl1gQO5tREndQg/WglKEFnnK4QIsNAHcyQ6xxhfccFoEU4NT6aFodIsbI9HDDs7kZJ
         DtQvzC27zy2VYx0FN5TKStxh2auY5a+0rhgoKz6KhkmTA44qe2DaK+uHjqzfjshHtXG4
         o3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pSC+/Vapa63qJAD8HSHAp0SCmOrA1F7T+uT16tkYTr4=;
        b=ASyxuOAJ1cpNo/XAuwPbKBf35/pFVYjG1noeDxPSciB+4VyZ3vfgGOmm9IzD0OnqYs
         sNc04Apvgm/N1WEWaHVGjNmtTazjCGnqB1PE4TTMvQepgQ3WhqBPBgN5cM5YSpHI10O5
         SLYyDd889/RgWkYXbqnMG4iOY1rvEuBv6rz+6unjEspx8sv1yw4NUhNkM2KOiXY3MmBx
         u913mBdYaFDQFAabOVI9Zd/YBc+2yZPsYd9/VYu2zy5Xir5on22WRenm5zYFj1tVi29L
         neb0T/VGtrUM3yzts0QIMPK6APyGB4lUICDGp/03GVwx3E7B2UjTOgH11TeBcMN9cd0C
         aazw==
X-Gm-Message-State: APjAAAUI/8Q3BtqM9G2HCnpEtZe7britshmMMiG3qBi3vp+RaVfl1GoX
        Ox0cT4dALQZ2xHqs2ZnUyH0=
X-Google-Smtp-Source: APXvYqwsmMtwVdpazRLUDMaFjNCqhAgkg27G/2ntGzO1KxoRa+jaEWHH96bIBtFeACrzIUaVDhBNdA==
X-Received: by 2002:a17:902:758d:: with SMTP id j13mr23135655pll.197.1563174425802;
        Mon, 15 Jul 2019 00:07:05 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g2sm24045257pfq.88.2019.07.15.00.07.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 00:07:05 -0700 (PDT)
Date:   Mon, 15 Jul 2019 00:07:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/3] input: touchscreen mc13xxx: Add mc34708 support
Message-ID: <20190715070702.GA153485@dtor-ws>
References: <20190711222346.5245-1-lukma@denx.de>
 <20190711222346.5245-4-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711222346.5245-4-lukma@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lukasz,
 
On Fri, Jul 12, 2019 at 12:23:46AM +0200, Lukasz Majewski wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> The mc34708 has a different bit to enable pen detection. This
> adds the driver data and devtype necessary to probe the device
> and to distinguish between the mc13783 and the mc34708.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> Changes for v2:
> - Change nested if statements to a single one (with cr0 > ...)
> - Replace hardcoded max resistance value (4080) with a generic driver data
>   value.
> - Introduce new include/linux/mfd/mc34708.h header file for mc34708 specific
>   defines
> - Define as driver data mask and value for accessing mc13xxx registers
> 
> Changes from the original patch:
> - Simplify the mcXXXXX_set_pen_detection functions
> - Fix checkpatch warnings
> ---
>  drivers/input/touchscreen/mc13783_ts.c | 59 +++++++++++++++++++++++++++++++---
>  1 file changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/mc13783_ts.c b/drivers/input/touchscreen/mc13783_ts.c
> index edd49e44e0c9..8fd3d0e47f57 100644
> --- a/drivers/input/touchscreen/mc13783_ts.c
> +++ b/drivers/input/touchscreen/mc13783_ts.c
> @@ -10,6 +10,7 @@
>   */
>  #include <linux/platform_device.h>
>  #include <linux/mfd/mc13783.h>
> +#include <linux/mfd/mc34708.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/input.h>
> @@ -30,6 +31,8 @@ MODULE_PARM_DESC(sample_tolerance,
>  		"is supposed to be wrong and is discarded.  Set to 0 to "
>  		"disable this check.");
>  
> +struct mc13xxx_driver_data;

Why don't you define the structure here instead of sing forward
declaration? The structure is also commonly called as xxx_chip, so
struct mc13xxx_chip {
	...
};

> +
>  struct mc13783_ts_priv {
>  	struct input_dev *idev;
>  	struct mc13xxx *mc13xxx;
> @@ -37,6 +40,33 @@ struct mc13783_ts_priv {
>  	unsigned int sample[4];
>  	u8 ato;
>  	bool atox;
> +	struct mc13xxx_driver_data *drvdata;

const struct mc13xxx_chip *chip;

> +};
> +
> +enum mc13xxx_type {
> +	MC13XXX_TYPE_MC13783,
> +	MC13XXX_TYPE_MC34708,
> +};
> +
> +struct mc13xxx_driver_data {
> +	enum mc13xxx_type type;
> +	int max_resistance;
> +	u32 reg_mask;
> +	u32 reg_value;
> +};
> +
> +static struct mc13xxx_driver_data mc13783_driver_data = {
> +	.type = MC13XXX_TYPE_MC13783,
> 	.max_resistance = 4096,
> +	.reg_mask = MC13XXX_ADC0_TSMOD_MASK,
> +	.reg_value = MC13XXX_ADC0_TSMOD0,
> +};
> +
> +static struct mc13xxx_driver_data mc34708_driver_data = {
> +	.type = MC13XXX_TYPE_MC34708,
> +	.max_resistance = 4080,
> +	.reg_mask = MC34708_ADC0_TSMASK,
> +	.reg_value = MC34708_ADC0_TSPENDETEN,
>  };

Have these 2 closer to the ID table.

>  
>  static irqreturn_t mc13783_ts_handler(int irq, void *data)
> @@ -93,6 +123,10 @@ static void mc13783_ts_report_sample(struct mc13783_ts_priv *priv)
>  
>  	cr0 = (cr0 + cr1) / 2;
>  
> +	if (priv->drvdata->type == MC13XXX_TYPE_MC34708 &&
> +	    cr0 > priv->drvdata->max_resistance)
> +		cr0 = 0;

I would like to avoid the type comparisons. Given that both cr0 and cr1
can't be more than 4095 (because we limit them when parsing sampling
data) I think we can simply say

	if (cr0 > priv->chip->max_resistance)
		cr0 = 0;

Thanks.

-- 
Dmitry
