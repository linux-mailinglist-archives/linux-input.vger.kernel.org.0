Return-Path: <linux-input+bounces-12167-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B968FAABABE
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 09:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17AA8166270
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 07:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5BF36124;
	Tue,  6 May 2025 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnbkU5nP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C52EAC7;
	Tue,  6 May 2025 05:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746509180; cv=none; b=ef7YgWyKeS8gb/Z5x0osGRlP4up43+MzuwoCPQhKL3R8S3fMp52AFkKno/vwoVFB9eioY67CdX7/9g32xbzmPLiQl3nNOjvn1l9Y4NL+XnnODZhPB9Tf64OHQzAmZM8BHFkd/RdiZMoYR44OrShl8xg8Sn/F2GN1B7IUrm9zD4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746509180; c=relaxed/simple;
	bh=qNXIby4uYNWIaVuJaDjA+b6ycyAQSqRUDrXQ+jUPNbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSYbfJQWrTHBBslUSAQc0c28PVrq8dpuAVRAic6Iegl8u1KbxxB2wvI0Ch3L59PPVS39vWfoYAkIH4Xhikqc35QYqh/zNfdm87Urm+FkZUmCA+O+p0nEANoqq5oNZyca9sxWX1WoVBaoj/S3/1GzgbPCYAXImxds+26Vt1O1oG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnbkU5nP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4672672b3a.3;
        Mon, 05 May 2025 22:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746509178; x=1747113978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y15oNjv4Kk/N9ml+u4Bq1LF3INBs6geqVXqTsIBwJuk=;
        b=LnbkU5nPfAcj/+y6ciLtYGVAZe/JQ8SpKbORU5QUXqoof1YtsHEucY02NFIK0IFcI8
         Ause9vKL92DUrUQqr3Qu75Z3LlcDvD4X8i45l4Z8amqTFggOTufhFh34IZPE9M39Mekh
         rPOEaM5bKZ3J1sLzCXD1awutT2OnoMFdDQcGQLT5Zl7YCie1yJUb8wLuhI45edxbm1xo
         dUPqCwdfp46yI8MOymDZ3eX9tiQNdN8sBtWQIUcJdYaSYCrOLUgM83rDPw2ZHverNkR6
         iAqvUUJRA5yyIIfX2fA/MOUvf56tbKRGA4YS8mAcBDl3HkmBWtHj0SuK291pPpXxhZXk
         G62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746509178; x=1747113978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y15oNjv4Kk/N9ml+u4Bq1LF3INBs6geqVXqTsIBwJuk=;
        b=mkikT46jVz4vKKR/ET6kuoWghG7ndBhOyybi9wgEioJ6DPEKITD1qGZhZSmKIZ6S7W
         kWcMg+KbfmDl+C+reMYeJOt68DNM88NxyP4r/w03lkf6cm9WtmNDj4ugSlllrrIZD/ut
         cJUoBWYki7SSHkCs91R50b2pnGXklL1TVQR0OvfTJoU3J49dbUqexhhBgvoBWeZFfL6H
         rd3xRvuoNJGm+vBYGRyo3hNTdrpNTHeHgVz6NfPma/VRWC0r2WZAXNVhgDVU3BXVktNa
         Hh55o4Zvi3sTHGnZcuuQ5cx85dM97qBCR8FsxZuTnFm2h+z6mNqOL+g6s5dsLmnuybPy
         n9bg==
X-Forwarded-Encrypted: i=1; AJvYcCV+FxiT8KHtszRbkJZcZKgm4fByHmflhFsm4DvlLLShFfJqSUNsS0FHL+5YOe5lo0vHhYa8KQkM6TWHWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8NIV8MZ/QaLS9PSyZoWK+pKXqlIQgLLWLwiSjFjEXoNxNvF43
	GD9jpId+/FdVriLD66j94lqql3suOm5q3ZpTT5Am9enbCw3w0N2B85g0SQ==
X-Gm-Gg: ASbGncu5IbhE8zq05zVDEIpWPIvomW4urhr2pMqwUUfmNoX+7cOhe5VHf03dRQDKCHE
	aoVzXurNGzkZ8sHUD2+9jczvzsRWMw7ut7XQvEblZqxOuk3fMF1Gvl9I7Lf5cs45IsOM4VKWbrX
	2T68ZfrsZBMEI47/aZQ/PKXtFaX7t4deRtEqQTSP05THwfs+TxnqRcyN+wdi/xrbZQRJxY3Hdhf
	8lJtz9Fr1m88nwfEI8GQcEVJEucmvVeueIXJ20k1RU/5ghXrLHJqPTO8rQ8aLTPW811j5+2IAaD
	a75gJZiFlyJoPuMTuLGSthMM4/pXZeZDpttIuJepQFakwX2D6QSO
X-Google-Smtp-Source: AGHT+IH9Cn6u9F7xB+8RLrnkjpLhT3syigtxk8sAmWlySACFtl/jh+gI0GboLGnDW/HN6BSdYeHoIQ==
X-Received: by 2002:a05:6a00:8085:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-74091a91773mr2180295b3a.20.1746509177769;
        Mon, 05 May 2025 22:26:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17ab:9e47:29ba:57e6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a47esm7946975b3a.29.2025.05.05.22.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 22:26:17 -0700 (PDT)
Date: Mon, 5 May 2025 22:26:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Bauer <mail@david-bauer.net>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] Input sx951x: add Semtech SX9512/SX9513 driver
Message-ID: <siwaccc2rwbeggi7aq6rapm2rjqz6ceed3hp2zkwx5axmc56oi@jtkbjzdcraqy>
References: <20250505203847.86714-1-mail@david-bauer.net>
 <20250505203847.86714-2-mail@david-bauer.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505203847.86714-2-mail@david-bauer.net>

Hi David,

On Mon, May 05, 2025 at 10:38:45PM +0200, David Bauer wrote:
> The Semtech SX9512/SX9513 is a family of capacitive touch-keyboard
> controllers.
> 
> All chips offer 8 channel touch sensitive inputs with one LED driver per
> output channel.
> 
> The also SX9512 supports proximity detection which is currently not
> supported with the driver.
> 
> This chip can be found on the Genexis Pulse EX400 repeater platform.
> 
> Link: https://www.mouser.com/datasheet/2/761/SEMTS05226_1-2575172.pdf
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
>  drivers/input/keyboard/Kconfig  |  11 +
>  drivers/input/keyboard/Makefile |   1 +
>  drivers/input/keyboard/sx951x.c | 490 ++++++++++++++++++++++++++++++++
>  3 files changed, 502 insertions(+)
>  create mode 100644 drivers/input/keyboard/sx951x.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 1d0c5f4c0f99..6dc397389c64 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -616,6 +616,17 @@ config KEYBOARD_SUNKBD
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called sunkbd.
>  
> +config KEYBOARD_SX951X
> +	tristate "Semtech SX951X capacitive touch controller"
> +	depends on OF && I2C

I do not believe it should depend on OF. Please have the driver use
generic device properties instead (device_property_*()).

...

> +
> + #include <linux/kernel.h>
> + #include <linux/module.h>
> + #include <linux/input.h>
> + #include <linux/leds.h>
> + #include <linux/of.h>

You will likely need mod_devicetable.h instead of of.h.

> + #include <linux/regmap.h>
> + #include <linux/i2c.h>
> + #include <linux/gpio/consumer.h>
> + #include <linux/bitfield.h>
> +
> + /* Generic properties */
> +#define SX951X_I2C_ADDRESS		0x2b
> +#define SX951XB_I2C_ADDRESS_		0x2d

Why underscore at the end?

...

> +
> +#ifdef CONFIG_LEDS_CLASS
> +		error = sx951x_led_init(priv, child, reg);
> +		if (error) {
> +			dev_err(dev, "Failed to initialize LED %d: %d\n",
> +				reg, error);
> +			return error;
> +		}
> +#endif

Please provide stub for sx951x_led_init() instead of using #ifdef here. 

...
> +
> +	priv = devm_kzalloc(dev,
> +			    sizeof(struct sx951x_priv),

sizeof(*priv)

Thanks.

-- 
Dmitry

