Return-Path: <linux-input+bounces-3296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9E8B603E
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 19:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749741C22072
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 17:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788E3126F2C;
	Mon, 29 Apr 2024 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LZJjv8nB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F212780630
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714412287; cv=none; b=n5KYMq/uA0TdMq9nfnX9SK8ZYHPfDr2dHoEw0m58BRAS+BzOm+LP2ZTGMri9bhG+b6XrXZY9mR+dvZul6rTK2zCaC0jTDNaVSXpgczHn7RI6Fv/u3M/+ASbstSsDY9T4RVVLWYxy3xrFNFcC8QRD5DBvWzYkMAb8jofslTu/gkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714412287; c=relaxed/simple;
	bh=jZICQhTLjVbGoXbLAw7fdChRrXlYrhHBQwoN7fp00Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxG3v7IFtWQi/J0oPhMHYU6PzVlZqPUNqgRTwQSuPZ5kr+fH5ZslkwdsPiI5fAaTC7nwiax/KhBaOg6IrrOpJ6fyv4OES/I29vjzjtqYAY9FKez72ZE44oNF4tr/UPGyFLbWhRy692fCyt4xVrjnxu3aEI9yeHuX1mv0UPuk4Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LZJjv8nB; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6eddff25e4eso4081385b3a.3
        for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714412284; x=1715017084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZdX1Cezd33gwlmLv7IZxW/osMfveXEryHL7Jm8dSrs=;
        b=LZJjv8nB5yK2CbMViEHtZlILSokwuxq5OdVsDEK8ye/foQuZHZ5xotoB14MNNuXQKM
         umCJ1skdtCJntlrWnIwTdfb4nX3rgP4xYAE/sWi6Vdh452Oe4B83qKKnL+gQlgCqP7dY
         N+lh+2mMEkBwUHJVbkKRD5zVshbS9L/1DViIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714412284; x=1715017084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZdX1Cezd33gwlmLv7IZxW/osMfveXEryHL7Jm8dSrs=;
        b=X4cdXh0ecWvl/ajY4sUHvMvugU6k5pCQYeAhmtjc8HKFlgfaDTEieFyMLrslrULHm5
         Bn/Mdh9tzRROl4zTks5FpsSGhHdBpQyvVgfKW4xxVQPdAWGIWztiGWjjUxH3XzIWBtGS
         pe+5AMrbXas7y9m4nnLlw8xP+u+yKujFePAmtft/O6vYtK7wGx+BWNsMH7ec3HN5kBOX
         O5PMO9NQ+8WUDAkYL9qy91Bw4c9JG0PTt0RYdn7nmiEVjjASGbDP2HwQ65hW/4pVzFQ6
         VcUMECQV3txyYO08kA61MN+9JZhd1f/21cZtIN39BwF+lJBFD0au/czCmmHVx3LPNCZq
         WuxA==
X-Forwarded-Encrypted: i=1; AJvYcCWSj2WcS8HqIwU0K9O8M9RHLGiEFxHPHQUwTADmRzTqOffHxtR4EyHkBIYoVrpeXybddsMI6ecESOwmu8HZeWIKD72kYVyeGWyLISE=
X-Gm-Message-State: AOJu0YyBY/JOhFwXzNAa7qvfuEQk03pdk4erV3XopmPgTN76Bs6lM6gs
	fbLbdcrhvJvSO1g5m5wm5XSfjbfB1VIx0j8AQa57qn9sOdzawXjvGwi7yUIdUg==
X-Google-Smtp-Source: AGHT+IG0Ug+Y9/YgxIBXiIws/D83aLQ8EE2Y9SjkanMbBtQN9P+XFAK2SptutXGuaucRfTEMzA8PzA==
X-Received: by 2002:a05:6a00:850:b0:6f3:8479:290a with SMTP id q16-20020a056a00085000b006f38479290amr246404pfk.17.1714412284263;
        Mon, 29 Apr 2024 10:38:04 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id le7-20020a056a004fc700b006e567c81d14sm19497081pfb.43.2024.04.29.10.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:38:03 -0700 (PDT)
Date: Mon, 29 Apr 2024 10:38:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@outlook.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: ff-core - prefer struct_size over open coded
 arithmetic
Message-ID: <202404291037.1A42B7C6B@keescook>
References: <AS8PR02MB72371E646714BAE2E51A6A378B152@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB72371E646714BAE2E51A6A378B152@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sat, Apr 27, 2024 at 05:05:56PM +0200, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
> 
> As the "ff" variable is a pointer to "struct ff_device" and this
> structure ends in a flexible array:
> 
> struct ff_device {
> 	[...]
> 	struct file *effect_owners[] __counted_by(max_effects);
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the calculation "size + count * size" in
> the kzalloc() function.
> 
> The struct_size() helper returns SIZE_MAX on overflow. So, refactor
> the comparison to take advantage of this.
> 
> This way, the code is more readable and safer.
> 
> This code was detected with the help of Coccinelle, and audited and
> modified manually.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Erick Archer <erick.archer@outlook.com>
> ---
> Hi,
> 
> The Coccinelle script used to detect this code pattern is the following:
> 
> virtual report
> 
> @rule1@
> type t1;
> type t2;
> identifier i0;
> identifier i1;
> identifier i2;
> identifier ALLOC =~ "kmalloc|kzalloc|kmalloc_node|kzalloc_node|vmalloc|vzalloc|kvmalloc|kvzalloc";
> position p1;
> @@
> 
> i0 = sizeof(t1) + sizeof(t2) * i1;
> ...
> i2 = ALLOC@p1(..., i0, ...);
> 
> @script:python depends on report@
> p1 << rule1.p1;
> @@
> 
> msg = "WARNING: verify allocation on line %s" % (p1[0].line)
> coccilib.report.print_report(p1[0],msg)
> 
> Regards,
> Erick
> ---
>  drivers/input/ff-core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
> index 16231fe080b0..609a5f01761b 100644
> --- a/drivers/input/ff-core.c
> +++ b/drivers/input/ff-core.c
> @@ -9,8 +9,10 @@
>  /* #define DEBUG */
>  
>  #include <linux/input.h>
> +#include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/overflow.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  
> @@ -315,9 +317,8 @@ int input_ff_create(struct input_dev *dev, unsigned int max_effects)
>  		return -EINVAL;
>  	}
>  
> -	ff_dev_size = sizeof(struct ff_device) +
> -				max_effects * sizeof(struct file *);
> -	if (ff_dev_size < max_effects) /* overflow */
> +	ff_dev_size = struct_size(ff, effect_owners, max_effects);
> +	if (ff_dev_size == SIZE_MAX) /* overflow */
>  		return -EINVAL;
>  
>  	ff = kzalloc(ff_dev_size, GFP_KERNEL);
> -- 
> 2.25.1
> 

Yup, thanks. This looks right to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

