Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76CEEF0FA
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2019 09:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfD3HPC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Apr 2019 03:15:02 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35200 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfD3HPC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Apr 2019 03:15:02 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so6321156plp.2;
        Tue, 30 Apr 2019 00:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RsHBTisSuQ7+0nqw471B/2w56soH4fHyxAYYtLk4NVc=;
        b=Rte8mMyPPB1QKQ5iXUnRCwIKood1FeAkyzaer8LJKG2J2EJkdmGkc8oNET0cNu6QjK
         0CQq3Gxn+Q/OD2FSJlz+BJh7oKVipZ1STI3WS39chsM+yhKU1zR1h6DRFumcuKflk0YD
         JpKxkIpxHUe3/gGfE9ZIU5zOBfG3GQCXRU+I8RyAi06MH6jztHjWqTIu6kPjJjWaXsco
         dD9liXoeRkHOa9leYYCbinRWA5qjgqUHw3KdrBoa6HLHk+HtejYl4trskfDgE4Db1he+
         WDUyTZPXcmOiM51r5pm8LxcopSPfMkpq8yRNrjRq/XBAX2/91XDEyZWw8hpboYmcmfgC
         doXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RsHBTisSuQ7+0nqw471B/2w56soH4fHyxAYYtLk4NVc=;
        b=P69ttEz0MdZkNTLO8CHjEdBmidVedYLo3uGwpxqXnSmbvkkZliI7q5mFIZA+SrqAAG
         Mb5m64ESsOECaHuTIkjGfhd/crA13NQoEMVcMNLoa9LKjZ/6Gj4Zi+Or1Sd0nYlQvsIc
         sS6kfKNuQAVRmaqmc2UC3w9WXDN5IFrCwcONYGm886pquIkkCBrYkSLLcqIMxR4+Vs8e
         Z1iqfubonqaN5F20Zon2IMh0kjC0kRz/FhH24ch6POY9Zhy1I5foFlzqrk23CLBbSFX7
         hvnsuJXGYtCTroR4XKHsXypEfkVF4OHjdhK6NeSZteHggyP5bpVka05tl3FdFCxqxEgp
         X4rg==
X-Gm-Message-State: APjAAAU35HboxNynK6JvrQIImQ1BZtEPetNPR6q0NzWSyeK51hpM7hCu
        05cB/IJjkEm9L/BctSG4Uno=
X-Google-Smtp-Source: APXvYqwKuLXac/TZUzLFky20KYr8k+Av/WaFPLa7cMgq0NOaxnGWSHEo+tqrqzkUHFr5f2MopRPhSg==
X-Received: by 2002:a17:902:8490:: with SMTP id c16mr14442896plo.240.1556608500936;
        Tue, 30 Apr 2019 00:15:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h187sm60188287pfc.52.2019.04.30.00.14.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 00:14:59 -0700 (PDT)
Date:   Tue, 30 Apr 2019 00:14:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        Coly Li <colyli@suse.de>, Lee Jones <lee.jones@linaro.org>,
        Xiaotong Lu <xiaotong.lu@spreadtrum.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh@kernel.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        David Brown <david.brown@linaro.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] Input: add a driver for GPIO controllable
 vibrators
Message-ID: <20190430071457.GA148015@dtor-ws>
References: <20190426194747.22256-1-luca@z3ntu.xyz>
 <20190426194747.22256-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190426194747.22256-2-luca@z3ntu.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 26, 2019 at 09:47:46PM +0200, Luca Weiss wrote:
> Provide a simple driver for GPIO controllable vibrators.
> It will be used by the Fairphone 2.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Applied, thank you.

> ---
>  drivers/input/misc/Kconfig      |  12 ++
>  drivers/input/misc/Makefile     |   1 +
>  drivers/input/misc/gpio-vibra.c | 209 ++++++++++++++++++++++++++++++++
>  3 files changed, 222 insertions(+)
>  create mode 100644 drivers/input/misc/gpio-vibra.c
> 
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index e15ed1bb8558..6dfe9e2fe5b1 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -290,6 +290,18 @@ config INPUT_GPIO_DECODER
>  	 To compile this driver as a module, choose M here: the module
>  	 will be called gpio_decoder.
>  
> +config INPUT_GPIO_VIBRA
> +	tristate "GPIO vibrator support"
> +	depends on GPIOLIB || COMPILE_TEST
> +	select INPUT_FF_MEMLESS
> +	help
> +	  Say Y here to get support for GPIO based vibrator devices.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called gpio-vibra.
> +
>  config INPUT_IXP4XX_BEEPER
>  	tristate "IXP4XX Beeper support"
>  	depends on ARCH_IXP4XX
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index b936c5b1d4ac..f38ebbdb05e2 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_INPUT_DRV2667_HAPTICS)	+= drv2667.o
>  obj-$(CONFIG_INPUT_GP2A)		+= gp2ap002a00f.o
>  obj-$(CONFIG_INPUT_GPIO_BEEPER)		+= gpio-beeper.o
>  obj-$(CONFIG_INPUT_GPIO_DECODER)	+= gpio_decoder.o
> +obj-$(CONFIG_INPUT_GPIO_VIBRA)		+= gpio-vibra.o
>  obj-$(CONFIG_INPUT_HISI_POWERKEY)	+= hisi_powerkey.o
>  obj-$(CONFIG_HP_SDC_RTC)		+= hp_sdc_rtc.o
>  obj-$(CONFIG_INPUT_IMS_PCU)		+= ims-pcu.o
> diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
> new file mode 100644
> index 000000000000..b76c81015de9
> --- /dev/null
> +++ b/drivers/input/misc/gpio-vibra.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  GPIO vibrator driver
> + *
> + *  Copyright (C) 2019 Luca Weiss <luca@z3ntu.xyz>
> + *
> + *  Based on PWM vibrator driver:
> + *  Copyright (C) 2017 Collabora Ltd.
> + *
> + *  Based on previous work from:
> + *  Copyright (C) 2012 Dmitry Torokhov <dmitry.torokhov@gmail.com>
> + *
> + *  Based on PWM beeper driver:
> + *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +struct gpio_vibrator {
> +	struct input_dev *input;
> +	struct gpio_desc *gpio;
> +	struct regulator *vcc;
> +
> +	struct work_struct play_work;
> +	bool running;
> +	bool vcc_on;
> +};
> +
> +static int gpio_vibrator_start(struct gpio_vibrator *vibrator)
> +{
> +	struct device *pdev = vibrator->input->dev.parent;
> +	int err;
> +
> +	if (!vibrator->vcc_on) {
> +		err = regulator_enable(vibrator->vcc);
> +		if (err) {
> +			dev_err(pdev, "failed to enable regulator: %d\n", err);
> +			return err;
> +		}
> +		vibrator->vcc_on = true;
> +	}
> +
> +	gpiod_set_value_cansleep(vibrator->gpio, 1);
> +
> +	return 0;
> +}
> +
> +static void gpio_vibrator_stop(struct gpio_vibrator *vibrator)
> +{
> +	gpiod_set_value_cansleep(vibrator->gpio, 0);
> +
> +	if (vibrator->vcc_on) {
> +		regulator_disable(vibrator->vcc);
> +		vibrator->vcc_on = false;
> +	}
> +}
> +
> +static void gpio_vibrator_play_work(struct work_struct *work)
> +{
> +	struct gpio_vibrator *vibrator =
> +		container_of(work, struct gpio_vibrator, play_work);
> +
> +	if (vibrator->running)
> +		gpio_vibrator_start(vibrator);
> +	else
> +		gpio_vibrator_stop(vibrator);
> +}
> +
> +static int gpio_vibrator_play_effect(struct input_dev *dev, void *data,
> +				     struct ff_effect *effect)
> +{
> +	struct gpio_vibrator *vibrator = input_get_drvdata(dev);
> +
> +	int level = effect->u.rumble.strong_magnitude;
> +
> +	if (!level)
> +		level = effect->u.rumble.weak_magnitude;
> +
> +	if (level)
> +		vibrator->running = true;
> +	else
> +		vibrator->running = false;
> +
> +	schedule_work(&vibrator->play_work);
> +
> +	return 0;
> +}
> +
> +static void gpio_vibrator_close(struct input_dev *input)
> +{
> +	struct gpio_vibrator *vibrator = input_get_drvdata(input);
> +
> +	cancel_work_sync(&vibrator->play_work);
> +	gpio_vibrator_stop(vibrator);
> +	vibrator->running = false;
> +}
> +
> +static int gpio_vibrator_probe(struct platform_device *pdev)
> +{
> +	struct gpio_vibrator *vibrator;
> +	int err;
> +
> +	vibrator = devm_kzalloc(&pdev->dev, sizeof(*vibrator), GFP_KERNEL);
> +	if (!vibrator)
> +		return -ENOMEM;
> +
> +	vibrator->input = devm_input_allocate_device(&pdev->dev);
> +	if (!vibrator->input)
> +		return -ENOMEM;
> +
> +	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
> +	err = PTR_ERR_OR_ZERO(vibrator->vcc);
> +	if (err) {
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to request regulator: %d\n",
> +				err);
> +		return err;
> +	}
> +
> +	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
> +	err = PTR_ERR_OR_ZERO(vibrator->gpio);
> +	if (err) {
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Failed to request main gpio: %d\n",
> +				err);
> +		return err;
> +	}
> +
> +	INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
> +
> +	vibrator->input->name = "gpio-vibrator";
> +	vibrator->input->id.bustype = BUS_HOST;
> +	vibrator->input->close = gpio_vibrator_close;
> +
> +	input_set_drvdata(vibrator->input, vibrator);
> +	input_set_capability(vibrator->input, EV_FF, FF_RUMBLE);
> +
> +	err = input_ff_create_memless(vibrator->input, NULL,
> +				      gpio_vibrator_play_effect);
> +	if (err) {
> +		dev_err(&pdev->dev, "Couldn't create FF dev: %d\n", err);
> +		return err;
> +	}
> +
> +	err = input_register_device(vibrator->input);
> +	if (err) {
> +		dev_err(&pdev->dev, "Couldn't register input dev: %d\n", err);
> +		return err;
> +	}
> +
> +	platform_set_drvdata(pdev, vibrator);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused gpio_vibrator_suspend(struct device *dev)
> +{
> +	struct gpio_vibrator *vibrator = dev_get_drvdata(dev);
> +
> +	cancel_work_sync(&vibrator->play_work);
> +	if (vibrator->running)
> +		gpio_vibrator_stop(vibrator);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused gpio_vibrator_resume(struct device *dev)
> +{
> +	struct gpio_vibrator *vibrator = dev_get_drvdata(dev);
> +
> +	if (vibrator->running)
> +		gpio_vibrator_start(vibrator);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(gpio_vibrator_pm_ops,
> +			 gpio_vibrator_suspend, gpio_vibrator_resume);
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id gpio_vibra_dt_match_table[] = {
> +	{ .compatible = "gpio-vibrator" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, gpio_vibra_dt_match_table);
> +#endif
> +
> +static struct platform_driver gpio_vibrator_driver = {
> +	.probe	= gpio_vibrator_probe,
> +	.driver	= {
> +		.name	= "gpio-vibrator",
> +		.pm	= &gpio_vibrator_pm_ops,
> +		.of_match_table = of_match_ptr(gpio_vibra_dt_match_table),
> +	},
> +};
> +module_platform_driver(gpio_vibrator_driver);
> +
> +MODULE_AUTHOR("Luca Weiss <luca@z3ntu.xy>");
> +MODULE_DESCRIPTION("GPIO vibrator driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:gpio-vibrator");
> -- 
> 2.21.0
> 

-- 
Dmitry
