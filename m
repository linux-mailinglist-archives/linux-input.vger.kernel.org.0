Return-Path: <linux-input+bounces-14454-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7BB421DC
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 15:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A1E61B23838
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 13:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD333043DB;
	Wed,  3 Sep 2025 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSm9Bpqx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA6D1FDE09;
	Wed,  3 Sep 2025 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906555; cv=none; b=BLwc6Bb3/2dpm7dWqov6dVjkSGrs4lBJNVKEjU9XUg3o+sfD//4k0tNYKvJYAKzBq4+dIDJzC4tknyn1aXNOOwHBkRQrzy6OF6w1PAkZnzcZXu6s92r/WtSCsPTpmkujDj3+Q6Bf354z1VxkLWViHNo0czfqqyLK+jnrUMwZUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906555; c=relaxed/simple;
	bh=sTpJYr2zp8LHrOcPJLG4wwyrHVGeO0gIJp52vosX9gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE5qqpLVT1RDOJ7NE+nDWb5zSriPAbEeLkBxB9b/Ozdl8mxQ/LXE/pZJXtjFuSPn1pkcgSA8IQFk5S0KItjPtSuy62YxYd/Un0jiayqyOnq+VpRZ2B5+v3vtoC5Qlm0PJhYNL66+SuZ4wJ2FJRhpaZGWKmWzk5gYhmBh4nJ5P0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSm9Bpqx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF386C4CEF0;
	Wed,  3 Sep 2025 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906555;
	bh=sTpJYr2zp8LHrOcPJLG4wwyrHVGeO0gIJp52vosX9gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSm9BpqxhoY5su2yUqKJjCmxZjfNyREzTeBLgxg2CXQzawHfgDGsAycXu0hFl6loo
	 i4UYSrj/9TkJGdTJN/j5pCpmBXf6P9tYJWy4XMiP0NFnZT9l+LXHsyt1rQquVbYJs1
	 +ChPT8tFBZFuDrpTyxQ2iSiGZxvEORwjeeeFCkN/ikL611j2ilGrw4/HBIAyYThikw
	 nbOWh2gzkK9O3hPcT/pc3bisY9tpbMTI/wqj4qjprPGsWPEHRSga5fxWLWIw4GKpsE
	 cImSI2186Y3iwXG+HCUh/AvWetxKUgh7g4hKDX0/2gjQuuwcNj6jNnLyRuTVwRhOUG
	 1GHuArs5fOmYw==
Date: Wed, 3 Sep 2025 14:35:50 +0100
From: Lee Jones <lee@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] Input: mc13783-pwrbutton: enable other mc13xxx
 PMIC
Message-ID: <20250903133550.GB2764654@google.com>
References: <20250829201517.15374-1-akurz@blala.de>
 <20250829201517.15374-5-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250829201517.15374-5-akurz@blala.de>

On Fri, 29 Aug 2025, Alexander Kurz wrote:

> All three mc13xxx types do feature two common power buttons referred as
> ONOFD[12] (mc13783) and PWRON[12] (mc13892/mc34708) in the SoC reference
> manuals. Add support for PWRON[12] (mc13892/mc34708) but skip support for
> button PWRON3 (mc13892) for sake of simplicity.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/Kconfig             |  4 +--
>  drivers/input/misc/mc13783-pwrbutton.c | 44 +++++++++++++++++++++++---

>  include/linux/mfd/mc13783.h            |  4 +--
>  include/linux/mfd/mc13xxx.h            |  2 ++

Acked-by: Lee Jones <lee@kernel.org>

>  4 files changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 0fb21c99a5e3..b66e920369f2 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -276,8 +276,8 @@ config INPUT_MC13783_PWRBUTTON
>  	tristate "MC13783 ON buttons"
>  	depends on MFD_MC13XXX
>  	help
> -	  Support the ON buttons of MC13783 PMIC as an input device
> -	  reporting power button status.
> +	  Support the ON buttons of MC13783/MC13892/MC34708 PMIC as an input
> +	  device reporting power button status.
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called mc13783-pwrbutton.
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index ace9f286fd24..c9eea57ceedd 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -30,16 +30,21 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  
> +struct mc13xxx_button_devtype {
> +	int button_id_max;
> +};
> +
>  struct mc13783_pwrb {
>  	struct input_dev *pwr;
>  	struct mc13xxx *mc13783;
> -#define MC13783_PWRB_B1_POL_INVERT	(1 << 0)
> -#define MC13783_PWRB_B2_POL_INVERT	(1 << 1)
> -#define MC13783_PWRB_B3_POL_INVERT	(1 << 2)
>  	int flags;
>  	unsigned short keymap[3];
>  };
>  
> +#define MC13783_PWRB_B1_POL_INVERT	(1 << 0)
> +#define MC13783_PWRB_B2_POL_INVERT	(1 << 1)
> +#define MC13783_PWRB_B3_POL_INVERT	(1 << 2)
> +
>  #define MC13783_REG_INTERRUPT_SENSE_1		5
>  #define MC13783_IRQSENSE1_ONOFD1S		(1 << 3)
>  #define MC13783_IRQSENSE1_ONOFD2S		(1 << 4)
> @@ -108,6 +113,8 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  {
>  	const struct mc13xxx_buttons_platform_data *pdata;
>  	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
> +	struct mc13xxx_button_devtype *devtype =
> +		(struct mc13xxx_button_devtype *)pdev->id_entry->driver_data;
>  	struct input_dev *pwr;
>  	struct mc13783_pwrb *priv;
>  	int err = 0;
> @@ -127,6 +134,11 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	if (devtype->button_id_max < 2 && pdata->b_on_flags[2] & 0x3) {
> +		dev_err(&pdev->dev, "button not supported\n");
> +		return -ENODEV;
> +	}
> +
>  	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
>  	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
>  	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
> @@ -239,12 +251,15 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
>  {
>  	struct mc13783_pwrb *priv = platform_get_drvdata(pdev);
>  	const struct mc13xxx_buttons_platform_data *pdata;
> +	struct mc13xxx_button_devtype *devtype =
> +		(struct mc13xxx_button_devtype *)pdev->id_entry->driver_data;
>  
>  	pdata = dev_get_platdata(&pdev->dev);
>  
>  	mc13xxx_lock(priv->mc13783);
>  
> -	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
> +	if (devtype->button_id_max >= 2 &&
> +		pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD3, priv);
>  	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD2, priv);
> @@ -254,7 +269,28 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
>  	mc13xxx_unlock(priv->mc13783);
>  }
>  
> +static const struct mc13xxx_button_devtype mc13783_button_devtype = {
> +	.button_id_max	= 2,
> +};
> +
> +static const struct mc13xxx_button_devtype mc13892_button_devtype = {
> +	/* PWRON3 is not supported yet. */
> +	.button_id_max	= 1,
> +};
> +
> +static const struct mc13xxx_button_devtype mc34708_button_devtype = {
> +	.button_id_max	= 1,
> +};
> +
> +static const struct platform_device_id mc13xxx_pwrbutton_idtable[] = {
> +	{ "mc13783-pwrbutton", (kernel_ulong_t)&mc13783_button_devtype },
> +	{ "mc13892-pwrbutton", (kernel_ulong_t)&mc13892_button_devtype },
> +	{ "mc34708-pwrbutton", (kernel_ulong_t)&mc34708_button_devtype },
> +	{ /* sentinel */ }
> +};
> +
>  static struct platform_driver mc13783_pwrbutton_driver = {
> +	.id_table	= mc13xxx_pwrbutton_idtable,
>  	.probe		= mc13783_pwrbutton_probe,
>  	.remove		= mc13783_pwrbutton_remove,
>  	.driver		= {
> diff --git a/include/linux/mfd/mc13783.h b/include/linux/mfd/mc13783.h
> index c25b1676741b..ab6db774e1fa 100644
> --- a/include/linux/mfd/mc13783.h
> +++ b/include/linux/mfd/mc13783.h
> @@ -65,8 +65,8 @@
>  #define MC13783_IRQ_UDM		23
>  #define MC13783_IRQ_1HZ		MC13XXX_IRQ_1HZ
>  #define MC13783_IRQ_TODA	MC13XXX_IRQ_TODA
> -#define MC13783_IRQ_ONOFD1	27
> -#define MC13783_IRQ_ONOFD2	28
> +#define MC13783_IRQ_ONOFD1	MC13XXX_IRQ_PWRON1
> +#define MC13783_IRQ_ONOFD2	MC13XXX_IRQ_PWRON2
>  #define MC13783_IRQ_ONOFD3	29
>  #define MC13783_IRQ_SYSRST	MC13XXX_IRQ_SYSRST
>  #define MC13783_IRQ_RTCRST	MC13XXX_IRQ_RTCRST
> diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
> index 0393083af28a..36e5e7de7cb2 100644
> --- a/include/linux/mfd/mc13xxx.h
> +++ b/include/linux/mfd/mc13xxx.h
> @@ -67,6 +67,8 @@ int mc13xxx_irq_unmask(struct mc13xxx *mc13xxx, int irq);
>  #define MC13XXX_IRQ_LOBATH	14
>  #define MC13XXX_IRQ_1HZ		24
>  #define MC13XXX_IRQ_TODA	25
> +#define MC13XXX_IRQ_PWRON1	27
> +#define MC13XXX_IRQ_PWRON2	28
>  #define MC13XXX_IRQ_SYSRST	30
>  #define MC13XXX_IRQ_RTCRST	31
>  #define MC13XXX_IRQ_PC		32
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

