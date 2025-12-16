Return-Path: <linux-input+bounces-16598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D90CC1163
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 07:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C351305E71B
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 06:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268A7339B36;
	Tue, 16 Dec 2025 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wcuka7/s"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFBD337BB1
	for <linux-input@vger.kernel.org>; Tue, 16 Dec 2025 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765865601; cv=none; b=CoU/0R26ocj4YLYtssc5QaitX0uep/dweWUQfclDLd5YeqeeZfMbaUZWy3FqnOyBNSp+1y/koosDpUR1VTRuyMaQxrzzaVIbj+iLuakDCjGNko+vn9P0y9BSoVLwJ8PG4FQWjdeSvuNQ6yAKUOxRvki9HWVu52MfIVC95cWDqJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765865601; c=relaxed/simple;
	bh=ZNeVFGbz2XYogdEq08c1v61hZ3isj+iJr72rsluyE7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqjJJ7eoHksCI0mBoTfGsMzTgnglEoI+BJlEXGL4RKHdncqbOYjoN8UVZiuFqAZ5qfN7xnYPrPT6wH/vtWA7XKmOcBoMBMsHq6sIcR/MXXGNLbRHfGPMEfkmgAeTuaGoqiR2tQmqabKE2jNM+HUzra8FtkukoWHCXR8Ff8CIDmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wcuka7/s; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bf1b402fa3cso4003415a12.3
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 22:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865594; x=1766470394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u5zoZFyP/UKoHmMIxoc2u4i7dlhbVg1+Ja56v9O8ZVo=;
        b=Wcuka7/s8kwiOYYyeN/V+rlDMXcm8l+FV/NzAvZvqSXRzlZRnrMkRUfrejJ4WZDqd1
         aU8usQxjJnDm+6qcEoG6l5stwRKHTQDUpfvPj+tRtHKQYU1HtEhnX2YMRSt0xgMmqYxP
         KwLNR+afdZHn6c8rDPzj66hH6KBWCqvormqnLMMg5FLSjcgHyb8eDAw5aaxUvaWKJ2yw
         8NOIwnKavTzT6NWv70TZNmSy/K0YEi5I5n1oLhsfamfuYxVfQUFdnyH1Ql2LFORpkzv+
         //gi7PLArggpmX34akuKmFb1q9A+0rXftq4KOQ54EFTf8vi2JzzDZN6Dj3GO0P6MHRFO
         EkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865594; x=1766470394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5zoZFyP/UKoHmMIxoc2u4i7dlhbVg1+Ja56v9O8ZVo=;
        b=IAMgrcUXpb03mYhJv6M86FR75F/yHqyywzLqhdmycGqBNevJElP4cnVjetW9xS2Mte
         M1DTwZDZKHEx6bcgdEHlZOY58CGVJCwlsqs6/4XlrR8Ecc8lyE1pgxGMTaj+y9+rFnzo
         cAMimpAENRR5hekJa2iS5RriKjXzRaPWxdLGHqAkm1yu7G08FzJLxTAFVeuGsuVfDKjy
         MFWPru7kbfEux3lc1GxSXYqSdjRiQ6j7E6JIxF7eyMyDTcBzt26FRFNzkqXW7oGf8cvP
         vTbz6NIfJByynpOeM1GBDmnT2j8f62VcdEOH2K4EThwEpLLa+WgZnO87/sTQfTVTXW7S
         w+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIMKrR0RJv8VWJdtL7J8g/9LXS4njeDDT3TewJBXrIEgBx0QLgRr06ZuflLjfUu0bW5823IfthXUcVNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyquv3ZE8aBJu/VB0trbDY2faDtMwHbg/Q8AeA0SzDRm+szz7Zz
	RbYHyXQbT8Resd/AqgEnSPJDD1Q6OFzmB+MKGIT1+ugG5zjSR/sS/SDE
X-Gm-Gg: AY/fxX4WLw5kw+/ROhfA1ULqbMLiL6D4g3Qe3qSvyXbCjCuJNACZANC5cddxjE42C5O
	yj2eZxIPeQMX7phd7AHibJ4CQ8ewD3GAz0bh1vkBYpzTbndUadSq5lnAAvM/+dSEshYotfQjRbg
	Ik63DGtsatd8P9assnv1V9PRDVKutoEo7EO4hRazzJKTQfk13gi8ak5WDUowfqyLg3WHeLS++1r
	ETVc6gFQjDZi6WLYy8uEL2FAOZVy4oWPdUsg1Thc4x8MSByEG+Yynxsgl6AtAtwjvN9CgD0ffh2
	3cmnR7TkegtfK5RSEddzDtAZhSnxXFeCzm0FL/7bWrdug7FhxkSDuPDK7xtuvxJ//2N9ohFY2YY
	rGNGk9AniE1/2vUXUxShcC86mkQP3xsQdTNEwLb+bGRQkzt6ZhsnpyFhikA6lwC4bgc8gRYQQoV
	J2zQjyLeTsz2ZYtiLg5aKLLVkV71ZcDqWJlVx6Uk8m8LuftfcBI4Q=
X-Google-Smtp-Source: AGHT+IEmPAJNRn3fZOAHPgVaJN4wVPNoEF0Tp25i8w7vUd23/VJa6NjYmY8OiorI1jp6xbp+SVUYoQ==
X-Received: by 2002:a05:7301:907:b0:2ac:1e68:2331 with SMTP id 5a478bee46e88-2ac3014dd34mr7837424eec.39.1765865593824;
        Mon, 15 Dec 2025 22:13:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f0546d9sm499892eec.28.2025.12.15.22.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:13:13 -0800 (PST)
Date: Mon, 15 Dec 2025 22:13:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Input: stmfts - use client to make future code
 cleaner
Message-ID: <hpmm5fhs74swrhkneaif4s5dquqeclujdlua7ygmkvcmtf6n4t@rsahxu23xwfp>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-4-8c1e3a63ebf1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-4-8c1e3a63ebf1@ixit.cz>

Hi David,

On Mon, Dec 15, 2025 at 03:30:04PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Make code cleaner, compiler will optimize it away anyway.
> 
> Preparation for FTM5 support, where more steps are needed.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/input/touchscreen/stmfts.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index 4b166b0a9a5a6..06845a00348cc 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -747,9 +747,10 @@ static int stmfts_runtime_suspend(struct device *dev)
>  static int stmfts_runtime_resume(struct device *dev)
>  {
>  	struct stmfts_data *sdata = dev_get_drvdata(dev);
> +	struct i2c_client *client = sdata->client;
>  	int ret;
>  
> -	ret = i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
> +	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);

Sorry but I do not see how using a temporary cleans things up compared
to a simple structure member access, given that it happens only once
here.

>  	if (ret)
>  		dev_err(dev, "failed to resume device: %d\n", ret);
>  
> 

Thanks.

-- 
Dmitry

