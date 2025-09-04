Return-Path: <linux-input+bounces-14484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A30B43E44
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 16:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CED507B421E
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3219F307ACF;
	Thu,  4 Sep 2025 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QT40FOxF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955A23074B3;
	Thu,  4 Sep 2025 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995017; cv=none; b=m4sff9xDaNKw83VnmUpDn8+0cD/LwNTvlwPJYcKXqUPHwROn4fhvS6ETbg7RmvwqqT3XO6Z/Nqddh9desYm7gkJHk1jXvhuuhKMwpB31fP/IllqkaCa/pOP4f4FMrp+LRrE2qx5qC7r+AaRemh1Ysky55ce5QX6L/bdu8sVTExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995017; c=relaxed/simple;
	bh=ed2L0pHfGMS2TMXBSVrjS/NC7cRu0qpdmC68l2Mnd/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D337w6eaBUevxAtPrDWRodjtZu1R0OZ9IW41Woq8zQiGj30ZtBUghc1DGmXNMIfli8RxAh5nH2tIvqFKPJWxntps4yKrKUY4ke0DJYwOlEUcBpBfa0+a29jsFPn7NkJIeWGSXLDFVhW1VCM4CfhspK1DrL1+yNoy4L5hJfTEHIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QT40FOxF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-772679eb358so1042717b3a.1;
        Thu, 04 Sep 2025 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756995015; x=1757599815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MM4IQl7o7mRtl1iZelo8b+WkFD4gcrQqWA2jTn77Aro=;
        b=QT40FOxFbO1Y8yx7/iREozrmlHpeNVty/y5NkMCdODzXFo4tbOxmD6yVJt+VBxDx9F
         qtDeCYNVZ2tLhSUv27OKlFJb+fvprevLApxekLif+RJLfeFsLa1hKcUa+onABy2pFzaS
         y2mFC5VSHRrhDYXhJr9UBZgKdFRfabwbDXctVky2iBNpJ+s09vhlbZR/h2ZWY06cy/Od
         s6gKtrbLrJdUbI3b7EubniW+GkeEfju6RZpcoI0NN4dr+vbpj6ZNCLXDH0swbZitHERd
         Wso9htiVIgrIy8c6NNPeASRqbYH4msnXdx5R0DFb6QKz4mHqw+bpVsTyyhfsCn/vbRbF
         UwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756995015; x=1757599815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM4IQl7o7mRtl1iZelo8b+WkFD4gcrQqWA2jTn77Aro=;
        b=MeKbl6m8EoRRPfVp5VKEj/eddYUZAYEllbXKmWbEHbtnCxAsSLZRn+3Hd/jHKNyte7
         7hoBKjRC6zyPPWETJ8+zmP1quhlo2BUipinX5Mb0DzQZT2FWYXrcTXUg6iyu80KpVrAr
         P5Wac/ydKblgINNLqPvBixJd7UM1tF92HxgWqBC+DGxpJaTDQAkxmKkFRLmUfu2eYyH9
         xtPBFBzVKWqxWRGe/NU1V3JCXIBGgq2waEsmucFoz+lvz8Rp5l1VpBFiuujxFAQu5GjQ
         x3qmizD41u23qzSjLb8+/AmvAJMlU0o6hXbwQ+YqYyqMrL6OaESZ/4rFmW4fAagV2pCO
         5neA==
X-Forwarded-Encrypted: i=1; AJvYcCURHHyNxv4Lle8EE8Lj9/At0sxe42ZBXo+r2eb9dm9ai3At0sjFuv6gDirNDc8+m6sijm0aYFI9Iq+A@vger.kernel.org, AJvYcCUe3xNKQE5Jg49i1Qz/PdbLcIBX6nHsdxLO/RSScLy8YdWUgZ9DmJQuXtNLf5ZhKfU4zf9qOCFL4CgUTT8=@vger.kernel.org, AJvYcCXnleiZW/qqWIu6AOkWgGYcYp82ce6Z7HlGJk5qh5li5wOd38+7a3+SoLWEEjcwRs6Oz4dTZZ7iRRGo6ePj@vger.kernel.org
X-Gm-Message-State: AOJu0YxiSkuzaW6PC21VZfezB6bnM3rD2sXMe7kTqVfulLPm/HgW3aOc
	L8Rt22/coTtMHbvgOT6UocddENKf6glnjJn3GIfrVubnnC9lb9DKaJvm
X-Gm-Gg: ASbGncubFPRUX8JjLLQeO7NHTitwKTja/6tAcg6hjoD3CxEBZGu43ZlE5ZLXXkkaSZl
	6341oObHTINPu89Qnh2epPHXLQ3h/n3qx6aVtUlslu3dr7vW+looGfyirk8RzpU2diydmm3TK1X
	Qg+H3e9xh6IUq8amHLgaAvHlWZJjz6GPi+u3bPen2z4bREITKI0Jwo1efTWOETuV4DCDG1z9eAo
	heCgkUtjVx/AURyxk6mDruSVwUG2BHCKF1a5FfbOmWsOA+nUjDA17JyP/LYIX4JLYZL+C2bB3ks
	iNekimCvzXh8rOMI/xpDHdIB9YynFrXRopDn4sA+DsCCDwaH+v/FJo+cLbXQBLSSUuOrJupFsUq
	QkbjWTI3Yorq/9hH6UmLe6cU=
X-Google-Smtp-Source: AGHT+IE6NXgYNhGhd6mylXT6bnZkgUjsaLmVd1+c+FXLtU2QPBjrGDruUPS8/xgJfXncrzTMmBiP1w==
X-Received: by 2002:a05:6a21:6d9a:b0:243:af85:44b2 with SMTP id adf61e73a8af0-243d6bc9cf9mr25978255637.0.1756995014433;
        Thu, 04 Sep 2025 07:10:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3095df7sm17155992a12.36.2025.09.04.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:10:13 -0700 (PDT)
Date: Thu, 4 Sep 2025 07:10:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Kurz <akurz@blala.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Heiko Stuebner <heiko@sntech.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] Input: mc13783-pwrbutton: fix irq mixup
Message-ID: <lxbr75qvptmrilhll7c7l7jooblezc6sw5wuwsdbktsxisvekw@i344yc45xw25>
References: <20250829201517.15374-1-akurz@blala.de>
 <20250829201517.15374-2-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829201517.15374-2-akurz@blala.de>

Hi Alexander,

On Fri, Aug 29, 2025 at 08:15:11PM +0000, Alexander Kurz wrote:
> The mfd mc13xxx interrupt handling was migrated to regmap with commit
> 10f9edaeaa30 ("mfd: mc13xxx: Use regmap irq framework for interrupts").
> As a consequence, button_irq() will get called with virtual irq instead
> of chip-internal irq now. Add wrappers for the three supported interrupts.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index 1c7faa9b7afe..4765b25bc9f6 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -88,6 +88,21 @@ static irqreturn_t button_irq(int irq, void *_priv)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t button1_irq(int irq, void *_priv)
> +{
> +	return button_irq(MC13783_IRQ_ONOFD1, _priv);
> +}
> +
> +static irqreturn_t button2_irq(int irq, void *_priv)
> +{
> +	return button_irq(MC13783_IRQ_ONOFD2, _priv);
> +}
> +
> +static irqreturn_t button3_irq(int irq, void *_priv)
> +{
> +	return button_irq(MC13783_IRQ_ONOFD3, _priv);
> +}
> +
>  static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  {
>  	const struct mc13xxx_buttons_platform_data *pdata;
> @@ -137,7 +152,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
>  
>  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD1,
> -					  button_irq, "b1on", priv);
> +					  button1_irq, "b1on", priv);

I wonder if it would not be better to have drivers/mfd/mc13xxx-core.c
use resources to describe/pass interrupts to the power button driver and
get rid of mc13xxx_irq_request() completely.

The power button driver would use platform_get_irq() to fetch virtual
interrupt numbers, store them in priv, and then compare interrupt
numbers in button_irq().

Thanks.

-- 
Dmitry

