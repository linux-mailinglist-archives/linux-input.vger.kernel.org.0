Return-Path: <linux-input+bounces-9796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F37A294F4
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 16:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 449C07A282A
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 15:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB28218A6A9;
	Wed,  5 Feb 2025 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVptnsWX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABAB1519A6;
	Wed,  5 Feb 2025 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769625; cv=none; b=o+vxrk1ez+/YAeFb1Aw6nzj+LNvyd4vrMOr08LZK9aK1tO2qa4OZr/pwuJhVFYknbiw36Oog8FuJkdCdBqDK1YO9s4MK2v1UTjZzqdRMmgIouCe4khBR68wPqd9703O7o++qp9Gq3ExKospeGTTq4RtRqCfHbXSLqHxWTvRJ83k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769625; c=relaxed/simple;
	bh=tfROW3MT1+iQtO0UmSZNl6/xGBUQQah0YBmHgWpTETw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rh5ok/3Q3oU+4s17VTm8KXuqc9eJhY8oAlwX9ddMcM8Q1DmTtJ/auJoW0/CKp4PSt+CWGVgJBRpoWHnnnqCjd5fwYymYN28HJ3bRF/vUVEgtSiiEH+qa0Wd8mEi5+MBwz3fSZfAPj2j8J2rP1RzZxDaYU6Z0VhzcQfjCGFiFCxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVptnsWX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21670dce0a7so8583325ad.1;
        Wed, 05 Feb 2025 07:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738769623; x=1739374423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DishrXDHCeYqBDv/ojIlSbtDc30XKhDDwt934bvfR40=;
        b=BVptnsWXk5eicq0gxTK5dgxeNYNJPXEdVCfKZenxmJZoWRNVSQBunCiWrKLNl3Mdil
         gM03n7bl1rAh6zlbKP5yxWfBRdwOYP9LkYpOGsEWJoaEKgsZEj6HNNBKwZkC8y0hfYN2
         t5BuRhggRKTRsiF6pIihc5j+xVWN13Vafz9i//A5upLSICM806JSsXgYP/pbd5xsVFFj
         MpjXhKqHp4n/2rZX2+WjDQSQKo3IcxDyRbXmQsry0/RArw+ZL+s5d0Osv39EFYgu0nvj
         M6cJQ5YLIhfR8lCB18Y9FQz6lmVa2a0CkcRvFsUxYyN5XOuEmidynWdaucnYaS+Tut3B
         QeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769623; x=1739374423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DishrXDHCeYqBDv/ojIlSbtDc30XKhDDwt934bvfR40=;
        b=mIsdZodBu9K+1npdh/CFsJbVk/+QSu1iq85RRuMXG4HZT2sdtb6WJluwXNDt6vUhRd
         mADmJ7xI+YAHMzfQCpU629B+qNFrkszadSS/S/gEJLAhov33CE9GhpHdYVDC143esNwq
         avVMtEvSERIj6JUTFlyToAKpEpLr5gyRk9IJc0jQdPdxRUJju46y3KOizmBeUXrru++/
         Isx0vHjyLqOGQL28F2JyosxK5CzWx7ThcQDYjFxHRv+wE+cut7bdk8wEEmGvDXsD7MBA
         hBQieq2TymuLeNPo38O7qNsUqqHV19w0opatsZX8X7SuWaE0oUa8LtGWtYG21ro6+TvX
         5J8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+6KeBs1wvPy+AWgmchkrcrAJzsnpkGVLMcnzX/OjiX+rcrG7TxJIsPrEGK/6z7bD8Lioppi7n@vger.kernel.org, AJvYcCWGUf9ff1R5t5IvoAbB6Zac6voJmJsI7uFenblmeyalmdXAEBveHdXO7c40r5cYj0gc6YaGS7pZVs55MLm5@vger.kernel.org, AJvYcCXVo9+uSzZIpi12JwJMVSOInNpHz9oS9vN/c7TXOXv6GUgkVxUdgBHDYvNYINRN2P3y2ab7l2Wr4QV+xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlmYiTTfBYNZsQ1sySJC0daGLps3kJjRBWl81flWvPZH5C+753
	GWwIVpAPKyUos2rjqN4Nx4G9wyzN6DR3uYEC0+5OgSJu/hTMtYE2
X-Gm-Gg: ASbGncvXyxrFlO70nDnpnEv66Q2dogIl1HR7CLFwVecq4My7n1dXaXft0IQ3JEUJw9j
	CWKRmnHNIp4M7gvkC0/oGfo3mp9qP3rNT47tZldG32d0iBpXE6NQ8X4hyNiShwgvn/8OtlcL4uO
	UKH+2nqDjhlI3YrgUc5aUvV913DmMY5Zygk/hv9YGXChFkwfDYNG9WfcEhcezvJZldpu8QEAICA
	hEerJji9iO7nhyMBPhX+FUXafi6zahgInH//jCwcIUAe4M6t29zR6uN4SBODjO/nL4e3JObuIDt
	CU1jD/vMD3Nx50N+
X-Google-Smtp-Source: AGHT+IFAXo5/s5gx6LecNuNWScGVpjx1sRLbu8Xk+9+72ywcn9gwVSiSYl8I3wrWphNkY9UfuLdTGw==
X-Received: by 2002:a17:903:18f:b0:21f:75c:f7d3 with SMTP id d9443c01a7336-21f17ec7bd9mr54860965ad.38.1738769619354;
        Wed, 05 Feb 2025 07:33:39 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5c49:8415:dbd3:5f54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21effa74ed3sm37632175ad.215.2025.02.05.07.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:33:38 -0800 (PST)
Date: Wed, 5 Feb 2025 07:33:36 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Maxime Ripard <mripard@kernel.org>,
	=?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cyttsp5 - ensure minimum reset pulse width
Message-ID: <Z6OE0IRgaovHMf34@google.com>
References: <20250204190100.2210863-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204190100.2210863-1-hugo@hugovil.com>

On Tue, Feb 04, 2025 at 02:01:00PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> The current reset pulse width is measured to be 5us on a
> Renesas RZ/G2L SOM. The manufacturer's minimum reset pulse width is
> specified as 10us.
> 
> Extend reset pulse width to make sure it is long enough on all platforms.
> 
> Also reword confusing comments about reset pin assertion.
> 
> Fixes: 5b0c03e24a06 ("Input: Add driver for Cypress Generation 5 touchscreen")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  drivers/input/touchscreen/cyttsp5.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> index eafe5a9b8964..bb09e84d0e92 100644
> --- a/drivers/input/touchscreen/cyttsp5.c
> +++ b/drivers/input/touchscreen/cyttsp5.c
> @@ -870,13 +870,16 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
>  	ts->input->phys = ts->phys;
>  	input_set_drvdata(ts->input, ts);
>  
> -	/* Reset the gpio to be in a reset state */
> +	/* Assert gpio to be in a reset state */
>  	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(ts->reset_gpio)) {
>  		error = PTR_ERR(ts->reset_gpio);
>  		dev_err(dev, "Failed to request reset gpio, error %d\n", error);
>  		return error;
>  	}
> +
> +	fsleep(1000); /* Ensure long-enough reset pulse (minimum 10us). */
> +

If the manufacturer specified that 10us is enough why do we want to wait
100 times longer?

Thanks.

-- 
Dmitry

