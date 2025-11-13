Return-Path: <linux-input+bounces-16084-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DCBC57F6D
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BC114E5CED
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 14:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8D82C0260;
	Thu, 13 Nov 2025 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5t+1LVB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9D02BF017;
	Thu, 13 Nov 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044237; cv=none; b=GFTPU+Y40h/NZgnrK9tv2oAu6mfD2xfJHCDaman/YFtt8nDIKg4evbPz7YrwOED6rYs3nSHstS2jrAZS6QpFwpbrwwjNAjpMHLYuM4k1do7/Y4Emf1ZCDSA1CC+JTh2HVByEO9DUAnivLrYi94/biFcuHV9PPxl+RLVGg2RUUGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044237; c=relaxed/simple;
	bh=qH4DioWsSdddifokanN44++630Ul0UCbsrzeONqMNSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c46KN8yf9LlgGYDpuAC5A4S2wpqW6/9AMgFnmZKVyzc/mHSiXq+YocYkPyIyqlHbFMmSjIvxtX2Jt392+/ZV4z1WZA/QA2mGR8wLvLGtBYVZmxhdE0y8UDmK+/reHwArZxChJWYMPiZRCrFsYcQ6w64IYwBBJvyLM7Wjw5kQpjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5t+1LVB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182D7C113D0;
	Thu, 13 Nov 2025 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763044236;
	bh=qH4DioWsSdddifokanN44++630Ul0UCbsrzeONqMNSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5t+1LVBMmNcg3CUNoXBE1h3k+ZjGeBYM2uZBvVfRI0zJhzYeOyS+d/zngO8f9DMi
	 +j/VDe2MxRKXnHlcfBEaB1TpdSyAkhBRTQxmUyx/bH652wc7zFcvn1hAI1itNRuKTo
	 sGVc7wYfQWa5FRCHEnnjEhLQ0re84a5DpVqPR/QIZJdZUcbKlF4u/Cai22OruMQtky
	 ztO4pFoakumctnpI4svigQxI8WZH1ZPzI6ygN3HmA5R1coUzgvrYA7hub5Ukzrrpui
	 5/YPeMqVF9ZUxTB5/jWJNY8aysUyjnNx18WChJx3EqefU1XZhhNuEE/hQkG9DkvXH5
	 temUs1VNuy4yA==
Date: Thu, 13 Nov 2025 14:30:28 +0000
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
Subject: Re: [PATCH v7 3/6] Input: mc13783-pwrbutton: convert pdata members
 to array
Message-ID: <20251113143028.GJ1949330@google.com>
References: <20251031195718.1586-1-akurz@blala.de>
 <20251031195718.1586-4-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031195718.1586-4-akurz@blala.de>

On Fri, 31 Oct 2025, Alexander Kurz wrote:

> As preparation for the extension of support for all three mc13xxx
> variants, convert the members of mc13xxx_buttons_platform_data to
> arrays to allow index access within the next commit.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 42 +++++++++++++-------------
>  include/linux/mfd/mc13xxx.h            |  8 ++---

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 23 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index 20f68aab6edf..2ee115d77b1c 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -108,24 +108,24 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	reg |= (pdata->b1on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
> -	reg |= (pdata->b2on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
> -	reg |= (pdata->b3on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
> +	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
> +	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
> +	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
>  
>  	priv->pwr = pwr;
>  	priv->mc13783 = mc13783;
>  
>  	mc13xxx_lock(mc13783);
>  
> -	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE) {
> -		priv->keymap[0] = pdata->b1on_key;
> -		if (pdata->b1on_key != KEY_RESERVED)
> -			__set_bit(pdata->b1on_key, pwr->keybit);
> +	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE) {
> +		priv->keymap[0] = pdata->b_on_key[0];
> +		if (pdata->b_on_key[0] != KEY_RESERVED)
> +			__set_bit(pdata->b_on_key[0], pwr->keybit);
>  
> -		if (pdata->b1on_flags & MC13783_BUTTON_POL_INVERT)
> +		if (pdata->b_on_flags[0] & MC13783_BUTTON_POL_INVERT)
>  			priv->flags |= MC13783_PWRB_B1_POL_INVERT;
>  
> -		if (pdata->b1on_flags & MC13783_BUTTON_RESET_EN)
> +		if (pdata->b_on_flags[0] & MC13783_BUTTON_RESET_EN)
>  			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
>  
>  		irq = platform_get_irq_byname(pdev, "b1on");
> @@ -144,15 +144,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  		priv->irq[0] = irq;
>  	}
>  
> -	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE) {
> -		priv->keymap[1] = pdata->b2on_key;
> -		if (pdata->b2on_key != KEY_RESERVED)
> -			__set_bit(pdata->b2on_key, pwr->keybit);
> +	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE) {
> +		priv->keymap[1] = pdata->b_on_key[1];
> +		if (pdata->b_on_key[1] != KEY_RESERVED)
> +			__set_bit(pdata->b_on_key[1], pwr->keybit);
>  
> -		if (pdata->b2on_flags & MC13783_BUTTON_POL_INVERT)
> +		if (pdata->b_on_flags[1] & MC13783_BUTTON_POL_INVERT)
>  			priv->flags |= MC13783_PWRB_B2_POL_INVERT;
>  
> -		if (pdata->b2on_flags & MC13783_BUTTON_RESET_EN)
> +		if (pdata->b_on_flags[1] & MC13783_BUTTON_RESET_EN)
>  			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
>  
>  		irq = platform_get_irq_byname(pdev, "b2on");
> @@ -171,15 +171,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  		priv->irq[1] = irq;
>  	}
>  
> -	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE) {
> -		priv->keymap[2] = pdata->b3on_key;
> -		if (pdata->b3on_key != KEY_RESERVED)
> -			__set_bit(pdata->b3on_key, pwr->keybit);
> +	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE) {
> +		priv->keymap[2] = pdata->b_on_key[2];
> +		if (pdata->b_on_key[2] != KEY_RESERVED)
> +			__set_bit(pdata->b_on_key[2], pwr->keybit);
>  
> -		if (pdata->b3on_flags & MC13783_BUTTON_POL_INVERT)
> +		if (pdata->b_on_flags[2] & MC13783_BUTTON_POL_INVERT)
>  			priv->flags |= MC13783_PWRB_B3_POL_INVERT;
>  
> -		if (pdata->b3on_flags & MC13783_BUTTON_RESET_EN)
> +		if (pdata->b_on_flags[2] & MC13783_BUTTON_RESET_EN)
>  			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
>  
>  		irq = platform_get_irq_byname(pdev, "b3on");
> diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
> index dd46fe424a80..4437ab80fcf8 100644
> --- a/include/linux/mfd/mc13xxx.h
> +++ b/include/linux/mfd/mc13xxx.h
> @@ -181,12 +181,8 @@ struct mc13xxx_leds_platform_data {
>  #define MC13783_BUTTON_RESET_EN		(1 << 4)
>  
>  struct mc13xxx_buttons_platform_data {
> -	int b1on_flags;
> -	unsigned short b1on_key;
> -	int b2on_flags;
> -	unsigned short b2on_key;
> -	int b3on_flags;
> -	unsigned short b3on_key;
> +	int b_on_flags[3];
> +	unsigned int b_on_key[3];
>  };
>  
>  #define MC13783_TS_ATO_FIRST	false
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

