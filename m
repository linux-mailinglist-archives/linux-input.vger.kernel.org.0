Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF784A5ACE
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 17:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbfIBPvs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 11:51:48 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43356 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfIBPvs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Sep 2019 11:51:48 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so6723296pld.10;
        Mon, 02 Sep 2019 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wwYzR4RXyJBC2LODw7K5HxvfzakvNrUuJC4vXS2HF2o=;
        b=ikafkbvFXmM417gm4yuid1Pr8wjoRX1gnYnpTM9wqj2jvM9w3yYLBk6liU5zeBkynY
         XopORa2JhRRfGajGvJbagt4S8taSJ7B2Xh8P2lomRj4tDX+LB0IeGv7s+EsX+ptvPFoB
         l5hU/dHyNa8IjrRhbIjZFVNwt0Guzs20hTqzins5PclWkRNjkZfMKb7cfGRDrIamesKE
         BFDbGpqBiA2Ns7y29b/vBlZJiaMzvGfysxvTgcK5WvaCULH35NKuAqTf0tFkDFzvfkNj
         yI7X7SpVb5P4p07+Q9Il9wI5qSxteaAVhIdgSKbNPCuVJlFziJiRcyGG+VnP3YMSpAp+
         4+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wwYzR4RXyJBC2LODw7K5HxvfzakvNrUuJC4vXS2HF2o=;
        b=eJsn0/krQsLMxZ60HY0eBg+PMK4svXWQN4RuV8/JLBYUwezEvkvzZiZMmuFLNi/9GO
         Lhz+nb1tsUHbaHtlUXPHY33BUnWmOz3RRA3U+P9X7HauSpEVd3UYAyZ+mkVrWxtkMPEC
         O6el3C+Kf9hizQvPTAiWLO+0vwk8DeFi8GD8jKvw/3EuBWZDL8gqeOjQ0xK4tmqdUDTm
         i12Jh1Qf9COpGcjVt1r+AFSXUdjHSC/Zwt5RzHvgCKkfCirxSJJ1BL36G0ZSyK/+BMla
         DiNFEVJDJHpUf+TIbfVHNXTzw6sXx/smZNAAGti8/pLRr00lmudf/zepx+7M1Fd5dIQS
         Iyxg==
X-Gm-Message-State: APjAAAVWd5sM79bjI9I9Fk4tDBPGnc2NNGuVIiixzC64eTYB/Dhc+s+A
        dpE5o/1FNxRx15rliaW0wO4=
X-Google-Smtp-Source: APXvYqwIewayxOq109hYwBMMZXs9Fr+WeZjZMy0SrOPRj4QXk7jOsxiGIqDPKrZ1mNk4SjRbrwvkrg==
X-Received: by 2002:a17:902:8d8c:: with SMTP id v12mr30923382plo.198.1567439507395;
        Mon, 02 Sep 2019 08:51:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d3sm11644122pjz.31.2019.09.02.08.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 08:51:46 -0700 (PDT)
Date:   Mon, 2 Sep 2019 08:51:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-input@vger.kernel.org, Denis Carikli <denis@eukrea.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] Input: tsc2007 - use GPIO descriptor
Message-ID: <20190902155144.GK187474@dtor-ws>
References: <20190823071021.5598-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190823071021.5598-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 23, 2019 at 09:10:21AM +0200, Linus Walleij wrote:
> This switches the TSC2007 to use a GPIO descriptor to read
> the pendown GPIO line.
> 
> As this will make the gpiolib start to respect polarity
> inversion flags on the GPIO lines, drop the inversion when
> reading the line with gpio_get_value(), fix two offenders
> in the i.MX device trees, and also emphasize the importance
> of marking the polarity right in the device tree bindings.
> 
> Cc: Denis Carikli <denis@eukrea.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Drop inversion on the GPIO descriptor value, rely on the
>   gpiolib to handle polarity inversion.
> - Comb through device trees, identify two offenders, fix
>   them as part of the patch for a clean cut.
> - Also fix the device tree bindings.
> ---
>  .../bindings/input/touchscreen/tsc2007.txt         |  5 +++--
>  arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi       |  3 ++-
>  arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi       |  3 ++-

Shawn, Sascha, any objections to these DTS changes?

>  drivers/input/touchscreen/tsc2007.h                |  4 +++-
>  drivers/input/touchscreen/tsc2007_core.c           | 14 +++++++-------
>  5 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> index ed00f61b8c08..b08b54d49699 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> @@ -7,7 +7,8 @@ Required properties:
>  
>  Optional properties:
>  - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> -  The penirq pin goes to low when the panel is touched.
> +  The penirq pin goes to low when the panel is touched, so make sure to tag
> +  the GPIO line with GPIO_ACTIVE_LOW.
>    (see GPIO binding[1] for more details).
>  - interrupts: (gpio) interrupt to which the chip is connected
>    (see interrupt binding[0]).
> @@ -31,7 +32,7 @@ Example:
>  			reg = <0x49>;
>  			interrupt-parent = <&gpio4>;
>  			interrupts = <0x0 0x8>;
> -			gpios = <&gpio4 0 0>;
> +			gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
>  			ti,x-plate-ohms = <180>;
>  		};
>  
> diff --git a/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi b/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
> index 17bd2a97609a..b8ac60622936 100644
> --- a/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
> +++ b/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright 2013 Eukréa Electromatique <denis@eukrea.com>
>   */
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include "imx35.dtsi"
>  
>  / {
> @@ -33,7 +34,7 @@
>  
>  	tsc2007: tsc2007@48 {
>  		compatible = "ti,tsc2007";
> -		gpios = <&gpio3 2 0>;
> +		gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&gpio3>;
>  		interrupts = <0x2 0x8>;
>  		pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi b/arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi
> index c2a929ba8ceb..016d0bc64bdb 100644
> --- a/arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi
> +++ b/arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright 2013 Eukréa Electromatique <denis@eukrea.com>
>   */
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include "imx51.dtsi"
>  
>  / {
> @@ -33,7 +34,7 @@
>  
>  	tsc2007: tsc2007@49 {
>  		compatible = "ti,tsc2007";
> -		gpios = <&gpio4 0 1>;
> +		gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&gpio4>;
>  		interrupts = <0x0 0x8>;
>  		pinctrl-names = "default";
> diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
> index 91c60bf6dcaf..0306c38b56c7 100644
> --- a/drivers/input/touchscreen/tsc2007.h
> +++ b/drivers/input/touchscreen/tsc2007.h
> @@ -49,6 +49,8 @@
>  #define READ_X		(ADC_ON_12BIT | TSC2007_MEASURE_X)
>  #define PWRDOWN		(TSC2007_12BIT | TSC2007_POWER_OFF_IRQ_EN)
>  
> +struct gpio_desc;
> +
>  struct ts_event {
>  	u16	x;
>  	u16	y;
> @@ -69,7 +71,7 @@ struct tsc2007 {
>  	int			fuzzy;
>  	int			fuzzz;
>  
> -	unsigned int		gpio;
> +	struct gpio_desc	*gpiod;
>  	int			irq;
>  
>  	wait_queue_head_t	wait;
> diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
> index 3b80abfc1eca..0eadd6d86fa0 100644
> --- a/drivers/input/touchscreen/tsc2007_core.c
> +++ b/drivers/input/touchscreen/tsc2007_core.c
> @@ -23,7 +23,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/i2c.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/platform_data/tsc2007.h>
>  #include "tsc2007.h"
>  
> @@ -226,7 +226,7 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct tsc2007 *ts = i2c_get_clientdata(client);
>  
> -	return !gpio_get_value(ts->gpio);
> +	return gpiod_get_value(ts->gpiod);
>  }
>  
>  static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
> @@ -266,13 +266,13 @@ static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
>  		return -EINVAL;
>  	}
>  
> -	ts->gpio = of_get_gpio(np, 0);
> -	if (gpio_is_valid(ts->gpio))
> +	ts->gpiod = devm_gpiod_get_optional(&client->dev, NULL, GPIOD_IN);
> +	if (IS_ERR(ts->gpiod))
> +		return PTR_ERR(ts->gpiod);
> +	if (ts->gpiod)
>  		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
>  	else
> -		dev_warn(&client->dev,
> -			 "GPIO not specified in DT (of_get_gpio returned %d)\n",
> -			 ts->gpio);
> +		dev_warn(&client->dev, "GPIO not specified in DT\n");
>  
>  	return 0;
>  }
> -- 
> 2.21.0
> 

-- 
Dmitry
