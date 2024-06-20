Return-Path: <linux-input+bounces-4483-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B8790FACB
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 03:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D345B1F22A93
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 01:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E570F9CB;
	Thu, 20 Jun 2024 01:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IplBurGl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CC9DDB8;
	Thu, 20 Jun 2024 01:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718845971; cv=none; b=GafLqjRKzJ41sbBu1ksmyWWb+xpldPVr0icj6nXBxfGRc/DiA07glHQu5bBXik2VHPOwgxQbSRalYDQ5dsVuDJB1jzf3qEwWjqJClBJjZYVN4bT5w/mAa9vCHLL+QJsq5XcEuUCgoaGjO2fKJ2dnIRRkE08OxlamkWCXYsjPXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718845971; c=relaxed/simple;
	bh=3HNIuZoo+ROzi0VRAp8ZG2s8jhkxEgXvZlwP6uxaGdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCXxX26XHRPFp9gL3kKJ0ReXBoyPpbs4z+eCqYGOTytgY6YMs7RrBi+/2HKdrppPw/IU9nRrOMuHn6e88cRYDbulkI9vNABNgmgVSK7NWmHSiw+2xsmFTbkaS22n3FlHPBU2LnNwLVTyTgU9WV36lcMTtRgCUNnQB6C4CdjfW2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IplBurGl; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c2c6277ef3so311532a91.3;
        Wed, 19 Jun 2024 18:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718845969; x=1719450769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UtvZzPbiVDm2fGC/hNhp/8eLXltMc47O/VCFEAdXX3g=;
        b=IplBurGlxCnW/T80MuXZ/fDwf00G9CwddY7rPtBtyuOzCtUQ5qyehhSN1gNH3tT4K3
         HQqiNOMv2GzJF6mgsiU3S6HMBCAOHH9kW1dTWVn9PjaRVDNvllI+q9wn4jeRrBowqh0x
         RMKPNonMrtGlwUUiWJ5xNpN7s774WHMBF5+qLzluWhlsL8v2txyY86dRYXhu3ZYHP3Sr
         3QhI+R01yhKmaXvPnh311MT3Q05G1ZyJR8VosBrczgNXF5FGTJG1f+kwZdr8fCH1Nutf
         UQBVEanWa8AG+GrQgG2K3Bfmo/YWYPtMnDfzcLPsebBa2WwCVPS0GJ1qUsUJqnLOx2Al
         kdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718845969; x=1719450769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtvZzPbiVDm2fGC/hNhp/8eLXltMc47O/VCFEAdXX3g=;
        b=OaQTMpACVJkD0Tws29yIKI/lsVd25FffPBtLompHP7c6y9IN1nkg+4o+m0mmBz1AoZ
         /jxaYV1kfQd/sLIEoIZ+vC0gu5C8y360UnVF+6cCRB4qovzPsQgTANdTzIcIfvF8bmDb
         t7OP2u/xRUCn3SGIjbSgQ0TIFzXQhp7nALRNiFxpwwSfvxRT9bdZ4yjsnWEgCpSE6YJZ
         IywKSgVneo+/hhkRe4gDqYCG/MC5ezyKHO0DkXZFa/USCmcPFdiUPah2o9fLYbA+3Czu
         +VZnw3ZaocW1MBxGiAJWTlBXboIunGjekp1nK247SSCsDx5SLapFhjvVPE9rcxAdYx1s
         T3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtK4fANqmeLKgUVp4N4VsZPmlmSv8KZjC7zT5awo549vkuhQzJbQeiDZuPcOda+76Xr2qHFVc2YsH3xknda3HtEQaVoYF+8IVgtCKr52grAfyuyM0AmyDKyRur0jvEBInih+RaQbENGVQVLyyRBlEqlg/Liwnowe8vAc8R6iJtiMMgDeAs
X-Gm-Message-State: AOJu0Yw3JKSoKsS7NidGWGswM/X1QCU9F32Ejfz0JVe7xGQRbW0Ivs63
	rIlHn9d8A+l5YT7XnMWdgjP9UOYZgBCxQPlRRnqD53msnwMphakH
X-Google-Smtp-Source: AGHT+IEcLf7lv1yrtj40upN5wlspygK1BImuzVSjfItDZZ1Ahzzekk8L9Ndysr+GKBxGEvT0LQS66w==
X-Received: by 2002:a17:90a:cf02:b0:2c7:b045:254a with SMTP id 98e67ed59e1d1-2c7b5daeac7mr3566594a91.46.1718845968950;
        Wed, 19 Jun 2024 18:12:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:36d9:2b1f:59f:8e9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c7e4ffe7b0sm340390a91.3.2024.06.19.18.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 18:12:48 -0700 (PDT)
Date: Wed, 19 Jun 2024 18:12:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: nick@shmanahar.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 4/4] Input: atmel_mxt_ts - add support for
 poweroff-sleep
Message-ID: <ZnOCDaetFnsg09if@google.com>
References: <20240417090527.15357-1-eichest@gmail.com>
 <20240417090527.15357-5-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417090527.15357-5-eichest@gmail.com>

Hi Stefan,

On Wed, Apr 17, 2024 at 11:05:27AM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add support for poweroff-sleep to the Atmel maXTouch driver. This allows
> us to power off the input device entirely and only power it on when it
> is opened. This will also automatically power it off when we suspend the
> system.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 71 +++++++++++++++++++-----
>  1 file changed, 57 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 7c807d1f1f9b..f92808be3f5b 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -317,6 +317,7 @@ struct mxt_data {
>  	struct gpio_desc *reset_gpio;
>  	struct gpio_desc *wake_gpio;
>  	bool use_retrigen_workaround;
> +	bool poweroff_sleep;

Why is this separate from "enum mxt_suspend_mode suspend_mode"? Can we
make MXT_SUSPEND_POWEROFF and use it in mxt_start() and others? It still
can be driven by the "atmel,poweroff-sleep" device property. 

>  
>  	/* Cached parameters from object table */
>  	u16 T5_address;
> @@ -2277,6 +2278,19 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
>  	release_firmware(cfg);
>  }
>  
> +static int mxt_initialize_after_resume(struct mxt_data *data)
> +{
> +	const struct firmware *fw;
> +
> +	mxt_acquire_irq(data);
> +
> +	firmware_request_nowarn(&fw, MXT_CFG_NAME, &data->client->dev);
> +
> +	mxt_config_cb(fw, data);

Is this really required? As far as I know all maXTouch controllers have
NVRAM for their configs and should not lose configuration even if power
is cut off. In fact, the whole automatic request of firmware/config upon
probe I think was a mistake and I would like to get rid of it. In fact,
on Chrome OS the version of the driver in use does not do that and
instead relies on userspace to check if firmware update is needed.

If this is actually required you need to add error handling.

Thanks.

-- 
Dmitry

