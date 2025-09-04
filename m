Return-Path: <linux-input+bounces-14486-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC0B43E5C
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 16:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDABA48547A
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185611D47B4;
	Thu,  4 Sep 2025 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="marQmdKw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DAC4A3C;
	Thu,  4 Sep 2025 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995402; cv=none; b=pRZdg0b+b2JCJXfF95fuotnqHRU5i66PCLt3QIKc8iWrvWhgDhXOq1XZO7lk3yzJ0GsvpHvonkxnS2kuCSSBJRiuctk4SrcSBiFC5ja/yaBgJANhVsTms4cqSwv6Z/Qu0sYg1+EFpEqxenV3k5PvanHSPeMYKclpTtpyaGDEpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995402; c=relaxed/simple;
	bh=5JD7NhgGPRoFcFkVrc+c3UVJx/sGAKDgLgiPp7ERQxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrsfMkC9ZShQHyRMBxGDPaw2+CIvUYgYgbwMBIyV5xvSgaWxqRW2sTE0sV5c+G7YqnIu2U38oKU/Mt38MmlKA7ZgO8kwyuSI+TmgJHnPcA+4WE5QNnhgPWprJ1g/ZNfzbeUTUmtNG2yfaSxrnKW3k3EKgucIfuV0LBOQ6zHBEuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=marQmdKw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24879ed7c17so8715595ad.1;
        Thu, 04 Sep 2025 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756995400; x=1757600200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THkDqBuclfSIllzwX0v+uGw/c0rEtdNTR4cHi62pkEE=;
        b=marQmdKw/3Dv/KbWZX+jH4XfR/4YLdefJ2Mamq5UJ7/feZKRv4a6kgf2hZCwO1+u1s
         eBjb85l5mrAcZsVzl4MEnj44MQvUv4k1kZAb8xmfV93EI8gYIYV7yhA87r8pIRdtoZqr
         YL3Lz+F+adva3uuv8lPMNMjYRuV5rXgZmxrlgbkNylw0u8crq3g2YrkgsFD1mpALIQZG
         4WDv3ZG8eQ0UnukiTG3hLhsoRQdICxDsWhn+Bd1cVmLj9kmM3iqsOouGkJS2z/RY8np2
         8W0KDlRjsoZ3WJfGsIXPh86YahB3eVZ+Em4kmLlGQuODtcN4hxL2i9AV4c14oMhIngKh
         8cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756995400; x=1757600200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THkDqBuclfSIllzwX0v+uGw/c0rEtdNTR4cHi62pkEE=;
        b=XmYJQX5E2Yn7JYZkOQsY//8/0KnGBQWCfd7ZMWEmLRGBdGpNAc1A+KkpfgZEQRUpXN
         bIhGlVSsquelGaXHjLs7/YhfhvqQnN6aENveWFOcufFUHJB7HJ79y+m57ox0/36dyWzk
         1v8OVXr0zHhZw06+lmHkMszGZDwn8EoIlmiCGo+4m6KlPs0OenhMGJ7p1lYh5+vWML6L
         kDCEEUuIGtWc0BLWbCWyvgnqAFiVQThFM+m2NwRiVnZuVb9F0/goei7ZE6cPfTQ0uhZA
         wScl6Y5FRCHRV0433LNnW0Fw+PtW+4/ZfjIHMSGqP08HnNZ9G0HmXk3OHxqZsvCvLsHk
         EsDA==
X-Forwarded-Encrypted: i=1; AJvYcCVkvw2s/b/xWbWpMLXz6qL4WlXo+t9EhI7HTqKfoFuKbNY9Wq5CksFr9IHbPITVOEOozm7kePWn9cqXv+zm@vger.kernel.org, AJvYcCWzlKZjKmVVkH9/HdrYbDvSJXn/9LWCoispN/07ROSWGBGq2zL9ljLVWjGSO+WuOvzpVVe8inqWc0cD@vger.kernel.org, AJvYcCXyZYttSXel85DpzV7OTv7RdBaM4md4Ff+FkuGKtyAWusRABug5NboNw3+7cL93vUoY0E3KY0KQOnPcC08=@vger.kernel.org
X-Gm-Message-State: AOJu0YybEnlS2Fgl0phMUr6bFPCndZOpzz1PlIKI4qDptomh/Qnmp+vG
	2fwxifbOsAN3SmywXPM3nl2+g5R/x+VY0c+szgxHGU4gMU2vOOFAKFP3
X-Gm-Gg: ASbGncve99TVBI4AdmY4oSOUjg3R74QKmPZgDwiXBRIp2e1pA16uTxWqTTvpkXsJCxP
	dIVBWQ0ErH5FDimJe0j76tt5Lu11yrTb5TZh/2zTruswIiyeTGXDOsoWPhJLzEPt/BMkkBr7kpE
	n9MLsfEbVNvOlDvbJnN4WpdfFR/GHUKklHTvRdz2fS0MS/PwHDvyDR3QhL3VJPwSID9yqPFx98b
	535J6AVh27s4LK8pL46P5PcC1zz+hOzYskpBkH64eqWq/LK2S9UGGqRMVZUpsfj94CeLln63uU2
	mbBQqGK2GpYIZR+Ba3Cuu+H0S9L1pZFmQBU0FSozPahsQHHMU2VZpr+hpY7iKR7gYkBPIDw0GF/
	xi004tVxzpH+TS7C2RMxckB4=
X-Google-Smtp-Source: AGHT+IGggMQ0gGUuTdj0jQKNaMSvb+X98sJgHYIMwU6UAzfjW12eZWknfzF54+2lsW7MbPdx2d0CDA==
X-Received: by 2002:a17:903:2347:b0:24a:8d5e:948 with SMTP id d9443c01a7336-24a8d5e0c76mr238758475ad.55.1756995399529;
        Thu, 04 Sep 2025 07:16:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ce20ea7cbsm6969655ad.28.2025.09.04.07.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:16:39 -0700 (PDT)
Date: Thu, 4 Sep 2025 07:16:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Kurz <akurz@blala.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Heiko Stuebner <heiko@sntech.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] Input: mc13783-pwrbutton: add OF support
Message-ID: <y2maxuchkhzi64m4dko5j6o2slc272rbbdckefdsc2kwrvh5hc@aynprvbbilkr>
References: <20250829201517.15374-1-akurz@blala.de>
 <20250829201517.15374-8-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829201517.15374-8-akurz@blala.de>

Hi Alexander,

On Fri, Aug 29, 2025 at 08:15:17PM +0000, Alexander Kurz wrote:
> Add OF support for the mc13783-pwrbutton so that it can be used with
> modern DT based systems.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 94 +++++++++++++++++++++++---
>  1 file changed, 86 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index c9eea57ceedd..a20236b19103 100644
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
> @@ -109,8 +110,82 @@ static irqreturn_t button3_irq(int irq, void *_priv)
>  	return button_irq(MC13783_IRQ_ONOFD3, _priv);
>  }
>  
> -static int mc13783_pwrbutton_probe(struct platform_device *pdev)
> +#ifdef CONFIG_OF

I do not think you need to guard this. As far as I can tell there are no
users of platform data in mainline, so just switch to using generic
device properties for configuration and get rid of struct
mc13xxx_buttons_platform_data altogether.

> +static struct mc13xxx_buttons_platform_data __init *mc13xxx_pwrbutton_probe_dt(
> +	struct platform_device *pdev)
>  {
> +	struct mc13xxx_buttons_platform_data *pdata;
> +	struct fwnode_handle *child;
> +	struct device *dev = &pdev->dev;
> +	struct mc13xxx_button_devtype *devtype =
> +		(struct mc13xxx_button_devtype *)platform_get_device_id(pdev)->driver_data;
> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	struct fwnode_handle *parent __free(fwnode_handle) =
> +		device_get_named_child_node(dev->parent, "buttons");
> +	if (!parent)
> +		return ERR_PTR(-ENODATA);
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
> +		if (fwnode_property_read_u32(child, "linux,code", &pdata->b_on_key[idx]))
> +			continue;
> +
> +		if (fwnode_property_read_bool(child, "active-low"))
> +			pdata->b_on_flags[idx] |= MC13783_BUTTON_POL_INVERT;
> +
> +		if (fwnode_property_read_bool(child, "fsl,enable-reset"))
> +			pdata->b_on_flags[idx] |= MC13783_BUTTON_RESET_EN;
> +
> +		pdata->b_on_flags[idx] |= MC13783_BUTTON_ENABLE | dbnc;
> +	}
> +
> +	return pdata;
> +}
> +#else
> +static inline struct mc13xxx_buttons_platform_data __init *mc13xxx_pwrbutton_probe_dt(
> +	struct platform_device *pdev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +
> +static int __init mc13783_pwrbutton_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
>  	const struct mc13xxx_buttons_platform_data *pdata;
>  	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
>  	struct mc13xxx_button_devtype *devtype =
> @@ -121,9 +196,13 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  	int reg = 0;
>  
>  	pdata = dev_get_platdata(&pdev->dev);
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "missing platform data\n");
> -		return -ENODEV;
> +	if (dev->parent->of_node) {
> +		pdata = mc13xxx_pwrbutton_probe_dt(pdev);
> +		if (IS_ERR(pdata))
> +			return PTR_ERR(pdata);
> +	} else if (!pdata) {
> +		dev_err(dev, "missing platform data\n");
> +		return -ENODATA;
>  	}
>  
>  	pwr = devm_input_allocate_device(&pdev->dev);
> @@ -290,15 +369,14 @@ static const struct platform_device_id mc13xxx_pwrbutton_idtable[] = {
>  };
>  
>  static struct platform_driver mc13783_pwrbutton_driver = {
> -	.id_table	= mc13xxx_pwrbutton_idtable,
> -	.probe		= mc13783_pwrbutton_probe,
> -	.remove		= mc13783_pwrbutton_remove,
>  	.driver		= {
>  		.name	= "mc13783-pwrbutton",
>  	},
> +	.id_table	= mc13xxx_pwrbutton_idtable,
> +	.remove		= mc13783_pwrbutton_remove,
>  };
>  
> -module_platform_driver(mc13783_pwrbutton_driver);
> +module_platform_driver_probe(mc13783_pwrbutton_driver, mc13783_pwrbutton_probe);

Switching to module_platform_driver_probe() seems an unrelated change.
>  
>  MODULE_ALIAS("platform:mc13783-pwrbutton");
>  MODULE_DESCRIPTION("MC13783 Power Button");

Thanks.

-- 
Dmitry

