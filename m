Return-Path: <linux-input+bounces-15894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE8C3829F
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 23:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7090E1A20161
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 22:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755A82F12B6;
	Wed,  5 Nov 2025 22:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayjMRaPz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED71C2F0686
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 22:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381094; cv=none; b=EePZVKan2MaNr/DTEM5LjpMZZQ3CgYm1owPFTY8VxLTlvFxQLvKvsIECNaRiXwnuePYS3JJE/dSH1iHAjq46JPOU38TULUdP4pOnPnYf0haGEsmID4INxdjRZDbfOZNNYiEtUaSJ/RjwkzYVIVeYBXcNLWpGMmTX1GBqKXjrJKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381094; c=relaxed/simple;
	bh=FgSHmdWK8fD86bwRD+NZMD0W0N6z+nayNo+9iUVv+Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqxYiz6Go8PtOmxIIUhmP0A923CoXvcJlPJGNxH361c0WU4t0Mm6wIZMpV3UUbyTwHK9v7Z5OO7TT/n4K3JQKdP7PUQn+UbE4n/jXMO/A2AtqYP6yYkaxKU2eR3RUNrElirhpjpfg3YYKRQ0ua5i7LoFkuK+9E3+8+sM8OLTLGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayjMRaPz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34188ba567eso319439a91.1
        for <linux-input@vger.kernel.org>; Wed, 05 Nov 2025 14:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762381092; x=1762985892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Im7C/yPVX9MxQ3wIFuOi8MGfdZ4IZni92LwvcWpKIGs=;
        b=ayjMRaPzv1xu7dmY/OaJsI/1A7EsC3QCEOV7CGR0Bg6ZTRXjC7dBZa0y6B9KjqsQrU
         1+2wZr+jYdfRCNMS+zbe1nRoorC9EztQ+ppXTe2gX0tkfhV1LaDZ4nTd0xAI5MPmro0R
         4eiPeOOs1vNV23BdWGi9+Sd9OTX/ja7ja24wvfvquPmjXw0cvft5biFO1yAEpwZ1CLTs
         LHoHKSBzNNRFmYXnJKfQOyFF9GVqpA6xpfGG/ZKGMdZaCOhdR5VWAgTHu262I7Zqu0S1
         QkX93ekiQZyUe+h9akbySFOP2AXbRaLbF6CNBMOBSgUlyH2JSj4OOqimdEXf2kU3uP04
         BFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762381092; x=1762985892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im7C/yPVX9MxQ3wIFuOi8MGfdZ4IZni92LwvcWpKIGs=;
        b=h/cp1kofwMA0P6UUPxldJra8HVHDaiG4dz9wOW5zw8KnqioztHQhlY9f2f4ttMs/0L
         dBJUqsmh/FYPbiBJ0UpjIGgQtWMPOHr4fcyP6pNQ0YwqDCwCZ6uV8QAZOgqz2GVudUd1
         uBRMV0rmWXi1gZ/kllSmG2eGv0hsRDvH7kG+TYGH2Y1sUmA4w2duk/r6+WQQe/XE1N4+
         UgCcyYfCfFc6uc9RavgB+bDjxyUrLrQTrGMWWM2CMc87lWhaucEWKFjI5aO/H1f9Pg0+
         WVN+Rh4L7TrHkMntlZXC0eY7WdMx3btXUZ4zaTjh4ldkh9zOvvQey5fb0EoEgotXz5au
         HesA==
X-Forwarded-Encrypted: i=1; AJvYcCW5vt6nfp6a6elBUwGp+vIFxC0RPADZcXJ52wxv42qcOotStmEnPqi8+T4V3w+e0AHo3lSMmJXZOuJ3qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBUaJhQ+A48QpzBg1BLfIoM/8FbPHv+aJ+snDK0i2ePyU5KEu
	o+UFoe2BNKztzRdDfMeRstVpWQQNguc59AAKV/jnKXHHe7SwHv0ZPUYm
X-Gm-Gg: ASbGncuOtE1LxMRy44SVqJvURC/tGEItllRLXtQcUV2aKA+KgP/QxSaz40WkURgjyXg
	rGjUY5X/LqvF2tqPLoJpqHDl190em7ecwOy450EKDwvUf5wnt56ziM5gOnMhIkwidZ7zp4gEf8X
	/bS9TuneD74y5KOjisIjfDSHNVMKuoImGZmaVD1oZwLXeDpR4H7GxbBwm/5uMGkSJImzCXzmSpe
	Lmo1gzTyKPpmu8btFhmH2O6GNTQTM7r4IV5bUye+AUIwG4ua97aob6FS9WqAVhG3R3SfQyfghqo
	tLruKBMTklDIp5IXtbtvtZsvxHm0FjR8VBTo866ppSgL9Lw6WUNqBUvrfZ0lPOOzuzutaiOgPEY
	nqa/NhhKBnp9Ur1c0WQ+Uv39bOHvTWlEN+3t64/btVqRgrcjtnwzeAyvfsbCrhv+93Jk5YznWsU
	5JMtuH/EX9Ej8Wc7yP2TqqRHHUc/DJ7eXaK53K57vOjjHshZo6odzL
X-Google-Smtp-Source: AGHT+IGMYKxUc+yFWPCSR1IktVa+NNpsyxMZ4O/wnRPrxacZqCnZibSpr1AmWZE5WIphsK5cnjwcSA==
X-Received: by 2002:a17:90b:5250:b0:340:c179:3666 with SMTP id 98e67ed59e1d1-341a6c1e314mr6059131a91.8.1762381092040;
        Wed, 05 Nov 2025 14:18:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:35dd:7def:e1d1:adfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d05c982dsm238658a91.20.2025.11.05.14.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 14:18:11 -0800 (PST)
Date: Wed, 5 Nov 2025 14:18:08 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: akemnade@kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Input: twl4030 - add TWL603x power button
Message-ID: <tyx4vvapd4pca6e236rcjkbxecor5kderzoinbwyuecdclzcix@jgksmvfioc4x>
References: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
 <20251105-twl6030-button-v3-2-9b37eb2b0989@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-twl6030-button-v3-2-9b37eb2b0989@kernel.org>

Hi Andreas,

On Wed, Nov 05, 2025 at 08:52:36PM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Like the TWL4030, these PMICs also have a power button feature, so extend
> the TWL4030 power button driver. As the irqchip of the TWL6030 mfd driver
> does not provide mask, unmask finctions, do it manually.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/input/misc/twl4030-pwrbutton.c | 61 +++++++++++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
> index f85cc289c053..b72fba9a1b2c 100644
> --- a/drivers/input/misc/twl4030-pwrbutton.c
> +++ b/drivers/input/misc/twl4030-pwrbutton.c
> @@ -25,22 +25,40 @@
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
>  #include <linux/input.h>
> +#include <linux/bits.h>

Move to the top of includes please.

>  #include <linux/interrupt.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/twl.h>
>  
> -#define PWR_PWRON_IRQ (1 << 0)
> +#define PWR_PWRON_IRQ BIT(0)
>  
> -#define STS_HW_CONDITIONS 0xf
> +#define STS_HW_CONDITIONS_4030 0xf
> +#define STS_HW_CONDITIONS_6030 0x2

Probably no need for these defines, just use numbers in structure
instances.

> +
> +struct twl_pwrbutton_chipdata {
> +	u8 status_reg;
> +	bool need_manual_irq;
> +};
> +
> +static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
> +	STS_HW_CONDITIONS_4030,
> +	false,

I am a big fan of named initializers, so maybe

	.status_reg = 0x0f,
	.need_manual_irq = false,

?

Otherwise looks good.

Thanks.

-- 
Dmitry

