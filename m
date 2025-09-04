Return-Path: <linux-input+bounces-14485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CDB43E4F
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 16:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 370DD1C871CE
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F4930276C;
	Thu,  4 Sep 2025 14:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPYkxP7q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839A306D26;
	Thu,  4 Sep 2025 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995151; cv=none; b=JBU4w1vz3KYCKYGhflUrN0R/lcIPbi6NRNuRx9OQZzg89VHq4EiCdIG7QT8Iw+e+NbZUQ+7G3krcwBLZVIQLLj66w3x2/prvU/criHmNwfHCptjY8Lud/G8GbPjczRjDEofQBmHN5Lcgyc1DEs5w0w8BWGl9PSRFLMm1tIewDM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995151; c=relaxed/simple;
	bh=W8kFo4TJaCKoEjaeJJihxyrfAh7bEaxCgGWuH/80A/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9ENdhWiTAIZLSJQzj7t3M29b7mlw2SpG59fB/fonapNfVPPUmDKr/c9jwl2bONsj3A9NOlbnP8LR2MOdDo/iD9D0Z38s7aoDmbOkTneGXPXYCmsYV1Yq5GwxiKyNAswQZCKmxDFApyqpF0vkomeWt/gEelYaPJ14LPFFDsOTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPYkxP7q; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4cf40cd0d1so862615a12.0;
        Thu, 04 Sep 2025 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756995149; x=1757599949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rO7fGKL6oE7ZhmMB1sWrKLpf1oropPjv/qa6mMzZIuQ=;
        b=nPYkxP7q4LUV61koYYUHsH0+nd7jF4Pf1xZQBfASifdxwiMK1t2CuRtgEANM8shZ/n
         i6dtePalY7xUONUP67GXZuu1zOoZpeyszL10pwQaYfNLijyg8v/EpPr5khIb4J2vqAUX
         aFX4mE7fCCVsPEdUUet2IS9gPYQxlWY1XjEc4UI/rczoiiOvQVTusDvR2mWLQRu99s+o
         j9wL2UT0+LsBCn1BeQC5PfOcGxu+Bt7JxxleCHyGS2Gvp5d9QWyJozGGrhqPuLQE3KYt
         RNQr6OJzYBPDRrzst7fMGORdC6SW0D4s+EMX4Iciwq7/4mg0GFUwYVmlY/EdRgup3rW8
         g0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756995149; x=1757599949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rO7fGKL6oE7ZhmMB1sWrKLpf1oropPjv/qa6mMzZIuQ=;
        b=LaUuYiHEOT9jhV1DMXwLh7E13w3MBhFNW5xOrhHnSUxvawrGFPoXjdNrDBE/OlxUrx
         O5q63dQam5+4MTv3QPE1RF1OnyyYKwVNuHFT7uAWOJvKBZlHwPsCwASCUpJu1AyThTm4
         yRr3c8re9HvgpCZYFeEH6e8dVn2yelivXqG/LFzG+wYasIm3qhjfnp2D+HREt4eOmfqV
         v/L9/GX9ctp7YXcBhZFzlnzNY+RKPPpmRw8+KhCcIHyk4h745fsB84kveiPT3Ln3IRo/
         B1dmX0BaGbcu+KO9qa4rvLTGTYv7ex0pTqkPC65fhHeKj7zITYgUYkJP3xBXCW28Avrg
         rY/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJMWsKGt/K+N/mtgw0mYZ+zsJ257xuNBwrgz/FjTiVRXUwzBkKuUKYiDg1XcjA95VHyyIdLqjKguRF@vger.kernel.org, AJvYcCUNvNkjOskNPUzifG6P95BfXNQxWFYk1Gi1d6hFSX8huP0DeG4feGK3FZSKX/zMMRLvB/T2tJ2SYN5mZTs=@vger.kernel.org, AJvYcCXo5HY0gE4jxlmwtk/d4FIVFxsTbjlnkrRbxr4p0Z2xqbQlrnsxqQBPbiXcuFO9taRfQ9uLsnr/H/+GZSyz@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGlyTZTicvqch8Y0kHOQFdWQ6ycvuZnZDur8iDrK/IfQbqvPB
	a5x6v6UGjaNPrG7LsqIOafrqJLK/Re35xXTwhFatbqO4FhVseys8liUm
X-Gm-Gg: ASbGncvHZhBd5xjAxXEgTie01mzfQZbaLhHfY81TKsxzFlSNfvTNk2N4vLuTqk8Lk7g
	P98o07chmyJhWT44J5sF9dp+kmehUbeFEJG+dvaTPe49gbUfTwEV0gZwNlGacc/0wPIm0tt/aDP
	uMJ+C80jpQPgOVF5uPe/3Fpgh8spXL6hVuYp8Di1z6SmOQj93oRHhZJ7ybVLexo0eIidwgnms5e
	nWLih1GJ1CPh40Uennhd7XjgcTGsdMBS0O/sDUHgXxfNqF5h53qGwP3Zu7wZNn/8WGSFjgkKeQC
	LUTX9bTwLUroT2q3epKgbP6++2UjTrv5n0qbeJZjlDwWm9Hpu1/MtIxVsrAwrmj7zoe6VZOxhzg
	/uBVAUkjlhsst4TRJ8TBKJzZwLVoEjM1kUw==
X-Google-Smtp-Source: AGHT+IH6DGxUeZhYqBOm+Gc0th3PMkcPpNXISZSTwHdzIz7V0VzbAd8sXPoN6i6VET2UJoCwiO/+Tw==
X-Received: by 2002:a17:902:f787:b0:24b:1f34:a64c with SMTP id d9443c01a7336-24b1f34a8famr103815855ad.10.1756995148764;
        Thu, 04 Sep 2025 07:12:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e445d875sm8105916a91.11.2025.09.04.07.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:12:28 -0700 (PDT)
Date: Thu, 4 Sep 2025 07:12:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Kurz <akurz@blala.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Heiko Stuebner <heiko@sntech.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] Input: mc13783-pwrbutton: use managed resources
Message-ID: <hedy3ou3epaux2kkljgujiw5xojqt4uf27m2edro55bi7sya22@keetqrg2sd6g>
References: <20250829201517.15374-1-akurz@blala.de>
 <20250829201517.15374-3-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829201517.15374-3-akurz@blala.de>

On Fri, Aug 29, 2025 at 08:15:12PM +0000, Alexander Kurz wrote:
> Use devres functionality to simplify resource freeing, dev.parent will
> be set by devm_input_allocate_device().
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 28 ++++++++------------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index 4765b25bc9f6..9fd84b8d163d 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -21,6 +21,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/input.h>
>  #include <linux/interrupt.h>
> @@ -118,18 +119,13 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	pwr = input_allocate_device();
> -	if (!pwr) {
> -		dev_dbg(&pdev->dev, "Can't allocate power button\n");
> +	pwr = devm_input_allocate_device(&pdev->dev);
> +	if (!pwr)
>  		return -ENOMEM;
> -	}
>  
> -	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		err = -ENOMEM;
> -		dev_dbg(&pdev->dev, "Can't allocate power button\n");
> -		goto free_input_dev;
> -	}
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
>  
>  	reg |= (pdata->b1on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
>  	reg |= (pdata->b2on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
> @@ -155,7 +151,7 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  					  button1_irq, "b1on", priv);
>  		if (err) {
>  			dev_dbg(&pdev->dev, "Can't request irq\n");
> -			goto free_priv;
> +			goto free_mc13xxx_lock;
>  		}
>  	}
>  
> @@ -203,7 +199,6 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  
>  	pwr->name = "mc13783_pwrbutton";
>  	pwr->phys = "mc13783_pwrbutton/input0";
> -	pwr->dev.parent = &pdev->dev;
>  
>  	pwr->keycode = priv->keymap;
>  	pwr->keycodemax = ARRAY_SIZE(priv->keymap);
> @@ -234,12 +229,8 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE)
>  		mc13xxx_irq_free(mc13783, MC13783_IRQ_ONOFD1, priv);

mc13xxx_irq_request() uses devm so you can drop calls to
mc13xxx_irq_free() in both error paths and in remove().

This comment is pretty much moot if you follow my suggestion of using
resources to pass interrupts to the child device.

Thanks.

-- 
Dmitry

