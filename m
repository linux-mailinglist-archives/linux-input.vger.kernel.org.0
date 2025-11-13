Return-Path: <linux-input+bounces-16085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61449C57FCA
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F3AD4F0526
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 14:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6008A2D1907;
	Thu, 13 Nov 2025 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWBY8XBZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8412D0637;
	Thu, 13 Nov 2025 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044266; cv=none; b=p6Enq64Q5mfNldC3BM/CbMkLLFNahDrB+AgS0lezWiDazlrhAx/o3KTkmQG7YqOKX6KYy7uUC656T0P8s8aZdueHAui6Fu8vTKGNx5ZmPlXoO+4qtbwPLQKOiEoUKYDqVbaDdvhs5naP+Queo6hs17v4Zkv9nkhJpua8tuc4sEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044266; c=relaxed/simple;
	bh=2SqlKCmG59oy0VH9gs31FjX3CmCTeCbKA1g/8RhIuyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+OEeym0rTMI8SKMtrqnnQyNu960kuhFC7L4nUKO11m7n+BXwL6Vfo6kA5FnYjyPZ/j6yvX4/Hmaq1HjrYLmuTQ8OZyPD1MPGKSbQjuWZI8uyYY7Lu8f5bg5hgXcqNICt+mqLt93+8N6FAqihPBKDJlvHeZ5M5/yWWNw1EiVet0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWBY8XBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF00C4CEF7;
	Thu, 13 Nov 2025 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763044264;
	bh=2SqlKCmG59oy0VH9gs31FjX3CmCTeCbKA1g/8RhIuyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWBY8XBZRn3NUz3Lx4O/iWxTf0Z0iqQpgnqtkRW0fV+TTWR8uhW1rpb5hTlaVXwfx
	 aPThuank/04yBwz9ONGhPJjhwfzjI1bPn8Wv5FkOeIHD896B5Gk+yvrUB6eZVOTGVv
	 wqqPNyMDKKZkvg4dTc1Jw+eirK0ZJqTHTVkPZ+juDy2UH3JUpys/r1OTC4zMfTW5/a
	 YmAOupD3JUfdHhMny2KC6zU7ZVLuV1rzmGzX3VWQz0H/w1KBKvbOWWKK/qtx1nCFsl
	 hhry9uG4jQIDwu01A6maEme6oNht3A+Ti+qvlazszkhgbmO0p0sGRBM7k/KJRw8tTG
	 95xOmuei8wSrQ==
Date: Thu, 13 Nov 2025 14:30:57 +0000
From: Lee Jones <lee@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Dr . David Alan Gilbert" <linux@treblig.org>,
	Job Sava <jsava@criticallink.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v7 5/6] Input: mc13783-pwrbutton: add OF support and drop
 platform_data
Message-ID: <20251113143057.GK1949330@google.com>
References: <20251031195718.1586-1-akurz@blala.de>
 <20251031195718.1586-6-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031195718.1586-6-akurz@blala.de>

On Fri, 31 Oct 2025, Alexander Kurz wrote:

> Add OF support for the mc13783-pwrbutton so that it can be used with
> modern DT based systems, dropping support for platform_data.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 104 +++++++++++++++++++++----

>  drivers/mfd/mc13xxx-core.c             |   4 -
>  include/linux/mfd/mc13xxx.h            |  14 ----

Acked-by: Lee Jones <lee@kernel.org>

>  3 files changed, 88 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index 08618c59197f..0fa630adff19 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -27,6 +27,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/mc13783.h>
> +#include <linux/property.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  
> @@ -41,10 +42,20 @@ struct mc13783_pwrb {
>  	struct mc13xxx *mc13783;
>  	const struct mc13xxx_button_devtype *devtype;
>  	int flags;
> +	int b_on_flags[3];
> +	unsigned int b_on_key[3];
>  	unsigned short keymap[3];
>  	int irq[3];
>  };
>  
> +#define MC13783_BUTTON_DBNC_0MS         0
> +#define MC13783_BUTTON_DBNC_30MS        1
> +#define MC13783_BUTTON_DBNC_150MS       2
> +#define MC13783_BUTTON_DBNC_750MS       3
> +#define MC13783_BUTTON_ENABLE           (1 << 2)
> +#define MC13783_BUTTON_POL_INVERT       (1 << 3)
> +#define MC13783_BUTTON_RESET_EN         (1 << 4)
> +
>  #define MC13783_PWRB_B1_POL_INVERT	(1 << 0)
>  #define MC13783_PWRB_B2_POL_INVERT	(1 << 1)
>  #define MC13783_PWRB_B3_POL_INVERT	(1 << 2)
> @@ -88,9 +99,69 @@ static irqreturn_t button_irq(int irq, void *_priv)
>  	return IRQ_HANDLED;
>  }
>  
> +static int mc13xxx_pwrbutton_parse_properties(struct platform_device *pdev,
> +					      struct mc13783_pwrb *priv)
> +{
> +	struct fwnode_handle *child;
> +	struct device *dev = &pdev->dev;
> +	struct mc13xxx_button_devtype *devtype =
> +		(struct mc13xxx_button_devtype *)platform_get_device_id(pdev)->driver_data;
> +
> +	struct fwnode_handle *parent __free(fwnode_handle) =
> +		device_get_named_child_node(dev->parent, "buttons");
> +	if (!parent)
> +		return -ENODATA;
> +
> +	fwnode_for_each_named_child_node(parent, child, "onkey") {
> +		u32 idx;
> +		u8 dbnc = MC13783_BUTTON_DBNC_30MS;
> +		u16 dbnc_ms;
> +
> +		if (fwnode_property_read_u32(child, "reg", &idx))
> +			continue;
> +
> +		if (idx > devtype->button_id_max) {
> +			dev_warn(dev, "reg out of range\n");
> +			continue;
> +		}
> +
> +		fwnode_property_read_u16(child, "debounce-delay-ms", &dbnc_ms);
> +		switch (dbnc_ms) {
> +		case 0:
> +			dbnc = MC13783_BUTTON_DBNC_0MS;
> +			break;
> +		case 30:
> +			dbnc = MC13783_BUTTON_DBNC_30MS;
> +			break;
> +		case 150:
> +			dbnc = MC13783_BUTTON_DBNC_150MS;
> +			break;
> +		case 750:
> +			dbnc = MC13783_BUTTON_DBNC_750MS;
> +			break;
> +		default:
> +			dev_warn(dev, "invalid debounce-delay-ms value\n");
> +			continue;
> +		}
> +
> +		if (fwnode_property_read_u32(child, "linux,code", &priv->b_on_key[idx]))
> +			continue;
> +
> +		if (fwnode_property_read_bool(child, "active-low"))
> +			priv->b_on_flags[idx] |= MC13783_BUTTON_POL_INVERT;
> +
> +		if (fwnode_property_read_bool(child, "fsl,enable-reset"))
> +			priv->b_on_flags[idx] |= MC13783_BUTTON_RESET_EN;
> +
> +		priv->b_on_flags[idx] |= MC13783_BUTTON_ENABLE | dbnc;
> +	}
> +
> +	return 0;
> +}
> +
>  static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  {
> -	const struct mc13xxx_buttons_platform_data *pdata;
> +	struct device *dev = &pdev->dev;
>  	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
>  	struct mc13xxx_button_devtype *devtype =
>  		(struct mc13xxx_button_devtype *)pdev->id_entry->driver_data;
> @@ -100,11 +171,8 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  	int reg = 0;
>  	int irq = 0;
>  
> -	pdata = dev_get_platdata(&pdev->dev);
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "missing platform data\n");
> -		return -ENODEV;
> -	}
> +	if (!dev->parent->of_node)
> +		return -ENODATA;
>  
>  	pwr = devm_input_allocate_device(&pdev->dev);
>  	if (!pwr)
> @@ -114,14 +182,18 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	if (devtype->button_id_max < 2 && pdata->b_on_flags[2] & 0x3) {
> +	err = mc13xxx_pwrbutton_parse_properties(pdev, priv);
> +	if (err)
> +		return err;
> +
> +	if (devtype->button_id_max < 2 && priv->b_on_flags[2] & 0x3) {
>  		dev_err(&pdev->dev, "button not supported\n");
>  		return -ENODEV;
>  	}
>  
> -	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
> -	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
> -	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
> +	reg |= (priv->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
> +	reg |= (priv->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
> +	reg |= (priv->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
>  
>  	priv->pwr = pwr;
>  	priv->mc13783 = mc13783;
> @@ -130,17 +202,17 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  	mc13xxx_lock(mc13783);
>  
>  	for (int i = 0; i < devtype->button_id_max; i++) {
> -		if ((pdata->b_on_flags[i] & MC13783_BUTTON_ENABLE) == 0)
> +		if ((priv->b_on_flags[i] & MC13783_BUTTON_ENABLE) == 0)
>  			continue;
>  
> -		priv->keymap[i] = pdata->b_on_key[i];
> -		if (pdata->b_on_key[i] != KEY_RESERVED)
> -			__set_bit(pdata->b_on_key[i], pwr->keybit);
> +		priv->keymap[i] = priv->b_on_key[i];
> +		if (priv->b_on_key[i] != KEY_RESERVED)
> +			__set_bit(priv->b_on_key[i], pwr->keybit);
>  
> -		if (pdata->b_on_flags[i] & MC13783_BUTTON_POL_INVERT)
> +		if (priv->b_on_flags[i] & MC13783_BUTTON_POL_INVERT)
>  			priv->flags |= (MC13783_PWRB_B1_POL_INVERT << i);
>  
> -		if (pdata->b_on_flags[i] & MC13783_BUTTON_RESET_EN)
> +		if (priv->b_on_flags[i] & MC13783_BUTTON_RESET_EN)
>  			reg |= (MC13783_POWER_CONTROL_2_ON1BRSTEN << i);
>  
>  		irq = platform_get_irq_byname(pdev, devtype->irq_name[i]);
> diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
> index c29974722704..9512136e821b 100644
> --- a/drivers/mfd/mc13xxx-core.c
> +++ b/drivers/mfd/mc13xxx-core.c
> @@ -504,10 +504,6 @@ int mc13xxx_common_init(struct device *dev)
>  			&pdata->regulators, sizeof(pdata->regulators));
>  		mc13xxx_add_subdevice_pdata(mc13xxx, "%s-led",
>  				pdata->leds, sizeof(*pdata->leds));
> -		mc13xxx_add_subdevice_pdata_res(mc13xxx, "%s-pwrbutton",
> -				pdata->buttons, sizeof(*pdata->buttons),
> -				mc13xxx->variant->button_resources,
> -				mc13xxx->variant->button_resources_size);
>  		if (mc13xxx->flags & MC13XXX_USE_CODEC)
>  			mc13xxx_add_subdevice_pdata(mc13xxx, "%s-codec",
>  				pdata->codec, sizeof(*pdata->codec));
> diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
> index 71c7d3614d4c..ac3765df341d 100644
> --- a/include/linux/mfd/mc13xxx.h
> +++ b/include/linux/mfd/mc13xxx.h
> @@ -174,19 +174,6 @@ struct mc13xxx_leds_platform_data {
>  	u32 led_control[MAX_LED_CONTROL_REGS];
>  };
>  
> -#define MC13783_BUTTON_DBNC_0MS		0
> -#define MC13783_BUTTON_DBNC_30MS	1
> -#define MC13783_BUTTON_DBNC_150MS	2
> -#define MC13783_BUTTON_DBNC_750MS	3
> -#define MC13783_BUTTON_ENABLE		(1 << 2)
> -#define MC13783_BUTTON_POL_INVERT	(1 << 3)
> -#define MC13783_BUTTON_RESET_EN		(1 << 4)
> -
> -struct mc13xxx_buttons_platform_data {
> -	int b_on_flags[3];
> -	unsigned int b_on_key[3];
> -};
> -
>  #define MC13783_TS_ATO_FIRST	false
>  #define MC13783_TS_ATO_EACH	true
>  
> @@ -219,7 +206,6 @@ struct mc13xxx_platform_data {
>  
>  	struct mc13xxx_regulator_platform_data regulators;
>  	struct mc13xxx_leds_platform_data *leds;
> -	struct mc13xxx_buttons_platform_data *buttons;
>  	struct mc13xxx_ts_platform_data touch;
>  	struct mc13xxx_codec_platform_data *codec;
>  };
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

