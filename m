Return-Path: <linux-input+bounces-15094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B69B9CD0D
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 02:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F5DC162AA3
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 00:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5685B1FC3;
	Thu, 25 Sep 2025 00:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5iYqGXD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3960F507
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 00:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758848; cv=none; b=qSrJcow1dqpNE+8ydVeF3XFK4Lm66bf8mOvuONet4vY5w3VV/KHAkb2225VQIgfJ9Y3YWBEgRPrXfJ1uogseBP6fgzjiBNyRhtE2b3CZLEedm3vi3GFx9Dd14vvBA68ZPTqfL0vYPkwh7MUup+NoO+CcyguOhRIueW9a11OPP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758848; c=relaxed/simple;
	bh=1cZ3oKaiPcozHJi/JFoRFd2W0JOXfm4/0jKPaRc9Aok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewMOuY1hnmlPlhAonbg0dt+f2QJZxnVvPWJMiKM3s1n/RdQ1HiIeMiDqmCFj9nLXb39LIn2Wbv8tj+kqjUycNosDrulCWTpJaBPSGCuCZjy25sDSY1ydR0UBcJoohy45UXN3H9DtH8E032BLYJ2N1p5naHob+GW+6nlDZWsn4G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5iYqGXD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f32d99a97so450718b3a.1
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 17:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758758846; x=1759363646; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJmSHJuWnEm+Y6n3jgC+gpDcxVtryVrAbif7MTL4dGs=;
        b=d5iYqGXDm1CkuNJm/QQ0vMQz2HkHbnY29jmRf69J+SuftsWA3VAA317Fo3OqHCQslJ
         g2gQeMKx9Zx2azAIynxez9dRnyTRA2EOSbd8OmGY+yZZeHSFE9wHGB3/UzZ8p3/pbMLo
         YcCz5u5IjSD12ERfQO+mmGa4S3VlyX0lNSulCbU+dFMAOGma4lY1U9uqxwb2LBzk/myS
         seH/fqWBlJVep/Ya2aM9hRLbeOIf9uIpR/+UTKoYV2Ptn+8dfv4Zh+tElFohBGJrD/NK
         stIgjB5DdZ7yH9HQVJMs03g9Ap6Uk9ry37UUlfXwFzMVqj/GLo3rEMhxUT+pN+/CGB07
         gzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758846; x=1759363646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJmSHJuWnEm+Y6n3jgC+gpDcxVtryVrAbif7MTL4dGs=;
        b=I+g7E8vvmuhlmfKu8vqrL4PQFjXX7y39l5qJuGRBv8YF2dbQQmoOCMCyy0KH5rXsO+
         tOp3XhxQHVKTMKBJUw0gNMOK4GbuqeArGh5p//eiInXqlIfeR+Im55nuRZv+CNP4Trkr
         StYJHKw4V3n9YSzUkTqA9E7GN77Hfm+nAQzvE28tvEsrLfiicMf86bCexAQ0tocimLM7
         LDeBrTgkmI1QO6DeC4CH4oh4HcHs/NoXYJd6eiYTXM7wWRNyGgkB/6U4UK2RDUN0gefh
         L0pshEDCPTO1x0ZzGPuFXKVIzCp8mUr+ppnmBO+EtIZukr5v1XGbUwB/r35RCQ6nPT9a
         Nb2g==
X-Forwarded-Encrypted: i=1; AJvYcCUPmYwvp6/8P2qecDprnKiP5p0tF/DTbP3EXfuG3dA28t0rFdmjTQ+1OMPKvqYwmiRyKdxYoMsOBtBz9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDzQlL/XQdVfl3FpzRRoICkICBuS3Qa7nT/ZSipi9mXLRGL4J0
	DDnHUoBx79QXR5oITp72O2IUDcPjjO04IaVbYP0xMqxmDZCYCXjvh+1l
X-Gm-Gg: ASbGncvGES2XhBwtAczRu+4cmne7RNbvpF5bFbPy3y20BWW2aX0RQETp3qqysTdK0Jl
	l0USeKZDP0KyHWFmywYLZC9u6xJtYPsaBQ9xNv2qA3a8tynp9oO5O18BQqBYNb3eDHIQRpG0w7h
	g0/JmMSgA4u8P4J0YaVXHvdhrGARokCZ+2oO4FDPeVs+pUoNZuQAi6qgO38N6Ors6c2wmhGMky0
	81wDgbhZM1D7lvtrqtPdezhIiSdog8l5QdGoogzGmLsJVnUT5S+PBvbxRolJZLcRCrPclMB/J0q
	0kkcMSLfmfCpaWyBxqZLTnWPuxGwO7/LY3zpB1gNmjk9+PfAcaN3pt+y7cMLnZ9o7H0a31wt34s
	w9BhC2hz6ttLlcVpbN56Agg==
X-Google-Smtp-Source: AGHT+IGd9HIpJpnXzZqtS/alatlQSjs7XZc0qZPsm4TCXRNUjYv4LP6C+c8aETL/1ThI0JKUMxu8NQ==
X-Received: by 2002:a05:6a20:3945:b0:252:f0b6:bd8 with SMTP id adf61e73a8af0-2e7d474d13amr1603822637.36.1758758845932;
        Wed, 24 Sep 2025 17:07:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33474c157d4sm247716a91.25.2025.09.24.17.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:07:25 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:07:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei <wei.liu@oss.qualcomm.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gatien.chevallier@foss.st.com, namcao@linutronix.de, 
	zhiqiang.tu@oss.qualcomm.com
Subject: Re: [PATCH] Input: gpio-keys - fix misleading GPIO number
Message-ID: <kdpj4yddikjg2cvd7pyzf55udaqrttlyhuwmupmhvrn4jxdjw4@q6pajmr5f3i4>
References: <20250924064905.276174-1-wei.liu@oss.qualcomm.com>
 <CACRpkdZ49_mo0AN78ri4WTt+V2gNdFOTgxzgfXw+3vd2rNNiJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ49_mo0AN78ri4WTt+V2gNdFOTgxzgfXw+3vd2rNNiJw@mail.gmail.com>

On Wed, Sep 24, 2025 at 12:25:29PM +0200, Linus Walleij wrote:
> On Wed, Sep 24, 2025 at 8:49 AM Wei <wei.liu@oss.qualcomm.com> wrote:
> 
> > From: Wei Liu <wei.liu@oss.qualcomm.com>
> >
> > The error log prints button->gpio, which is unset and default to 0
> > in non-legacy configurations, leading to misleading messages.
> >
> > Use desc_to_gpio() to report the actual global GPIO number.
> >
> > Signed-off-by: Wei Liu <wei.liu@oss.qualcomm.com>
> > ---
> >  drivers/input/keyboard/gpio_keys.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> > index f9db86da0818..243295a3ea1d 100644
> > --- a/drivers/input/keyboard/gpio_keys.c
> > +++ b/drivers/input/keyboard/gpio_keys.c
> > @@ -584,7 +584,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
> >                                 error = irq;
> >                                 dev_err_probe(dev, error,
> >                                               "Unable to get irq number for GPIO %d\n",
> > -                                             button->gpio);
> > +                                             desc_to_gpio(bdata->gpiod));
> 
> That's technically a legacy interface.
> 
> Can we just not mention the GPIO number?

Yes, there was a patch removing printing this number... We are losing
debug context though.

> 
> The only thing that would actually make sense in this kind
> of errors is if we add some new interface like:
> 
> const char * get_gpiod_debug_string(gpiod);

I assume the char will be dynamically allocated. Freeing it will be
PITA.

I see vsprintf() has %pC for printing clocks and %pg for block devices,
maybe we could have %pGD or similar for GPIO descriptors?

Thanks.

-- 
Dmitry

