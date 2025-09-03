Return-Path: <linux-input+bounces-14453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C5B421DA
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 15:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15563189621C
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 13:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F97309DDD;
	Wed,  3 Sep 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aunVBMVS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108BE3093C8;
	Wed,  3 Sep 2025 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906524; cv=none; b=NUFTbZ5UWwYoNeLcClsMIKvSN6nffiv0oPzh67yDQtrcQY+lwNa/Wy49dpjG2QDMkToqrHj2j21NjVdpLI+4dXmPL4B0NtHkY3Pft8rYsthB9uCQnM9fO6Z4rvPahTaL+t2Ay+5vOQXn5JjoiZzFjH7CiOP1gKRc2Lz1cY7Ry+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906524; c=relaxed/simple;
	bh=B4Uua83WqvGn9xcywAsGwKgNMnkrfNj/6a5jDSjsg1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+01N1+/rch6sMhRO2Gqaymyrx9ECKB6d41d0sjaUPDaNde3A5llqIi+a3MzrLPFpShL9axQ92FJqGX53qxpe9SZMGVxkqYpwaifbsFVGLHMESIDw3JvnFQYkKYtxW7sep1ZcUdwSMxNpy1+vdCzuDR2fC14BfsUWoYGGptjuoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aunVBMVS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04823C4CEF5;
	Wed,  3 Sep 2025 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906523;
	bh=B4Uua83WqvGn9xcywAsGwKgNMnkrfNj/6a5jDSjsg1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aunVBMVSGtb9j901yrt1VJ4vNNWpkxqyzH03OoGKBR4+9WlTbZteUCTHAn+/eJNcW
	 NchuP0cbpn6uPUrnS5h0brw7NS0EHPLLc3iZc8HkOGWrsJyxvufrfHZ1e2JK4kFYjn
	 DhkB46s46ZWZeNlVu+uS8l3+SrZuFJ+X9oM+JJ9iR0mgoJ4fuYAilargSzyUQQFlTx
	 WEkF8HNvJeCTkmB3/YsufH3Hl6wjcgco4TXhYZn2XfUGM0/lRKtVlfZ+s18/WZUd37
	 Cv7hk7QfiiwIlNFyoPyitUbqQI9OsSndskj92+4ZUIPumvdf92nSVbdKZEW+ODDg07
	 i9jubOV6iiwvA==
Date: Wed, 3 Sep 2025 14:35:18 +0100
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
Subject: Re: [PATCH v3 3/7] Input: mc13783-pwrbutton: convert pdata members
 to array
Message-ID: <20250903133518.GA2764654@google.com>
References: <20250829201517.15374-1-akurz@blala.de>
 <20250829201517.15374-4-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250829201517.15374-4-akurz@blala.de>

On Fri, 29 Aug 2025, Alexander Kurz wrote:

> As preparation for mc13783-pwrbutton OF support, convert the members of
> mc13xxx_buttons_platform_data to arrays to allow index access within
> the next commit.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 54 +++++++++++++-------------

>  include/linux/mfd/mc13xxx.h            |  8 +---

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 29 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index 9fd84b8d163d..ace9f286fd24 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -127,24 +127,24 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
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
>  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD1,
> @@ -155,15 +155,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  		}
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
>  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD2,
> @@ -174,15 +174,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  		}
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
>  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD3,
> @@ -218,15 +218,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  free_irq:
>  	mc13xxx_lock(mc13783);
>  
> -	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE)
> +	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD3, priv);
>  
>  free_irq_b2:
> -	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE)
> +	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD2, priv);
>  
>  free_irq_b1:
> -	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE)
> +	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD1, priv);
>  
>  free_mc13xxx_lock:
> @@ -244,11 +244,11 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
>  
>  	mc13xxx_lock(priv->mc13783);
>  
> -	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE)
> +	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD3, priv);
> -	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE)
> +	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD2, priv);
> -	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE)
> +	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(priv->mc13783, MC13783_IRQ_ONOFD1, priv);
>  
>  	mc13xxx_unlock(priv->mc13783);
> diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
> index f372926d5894..0393083af28a 100644
> --- a/include/linux/mfd/mc13xxx.h
> +++ b/include/linux/mfd/mc13xxx.h
> @@ -187,12 +187,8 @@ struct mc13xxx_leds_platform_data {
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

