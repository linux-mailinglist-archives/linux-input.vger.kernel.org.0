Return-Path: <linux-input+bounces-6930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A96E698B8C0
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 11:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505991F22DCD
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 09:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A973419FA87;
	Tue,  1 Oct 2024 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkeoSH/w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABE219FA81;
	Tue,  1 Oct 2024 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727776635; cv=none; b=e7rLpEUlG9dMv71L5vLwERFmEiI07ripFRG9dH+T+Nsnin1tqrdDorAU777ZtQexaW7i5OsqZ6XFPLqMb1eW0WAHciScsTXwlXwEDA9rWnqsKdzKLUctI4fFjtg+luvzMuOdH6vZZ6T+z7TDLr4ebEfsJ7Fe2xf+2dol3wFTUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727776635; c=relaxed/simple;
	bh=8xOpexw0IBwpN6v3nr+XgR7IzkoYYrJYs0h852W5o2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/h0y9DfKBABTGFSBah2ttRzq6N+nObhorsKOwm5a8y5REN3aiLHxHHLzqfctHex2P6JBTJREpVmNZVBNMIiileD/s5ZrN8k6s5+vXMhcNamf8+LG9j1DsZSQ8b9vYcZz7rsCT2TAqTcRA2EfPHssv25AC1whYCr4AbtXOkWOW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkeoSH/w; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20aff65aa37so42838065ad.1;
        Tue, 01 Oct 2024 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727776633; x=1728381433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJZZRH5f3SlZnl5oD83B2IHXh9EXL5azgjHetsdsSic=;
        b=QkeoSH/wbsvkFeHeIc2jcc5hatJGcmM2Lftzug6CAT5eomTZJ84/eKDLD7PETtOS/7
         FDtlIHDPlEZUQ0NG/A3BXBgykBAfY92+Xh61iV7KZy2bA7LN/8OzdFiqjiJF88DiHGtA
         xl51rx0l+awlQGPeXSc9/Xa/m8lxdOw9aCHdDVwTOHoxLSq/4mV3aylCZuRbrAW58wT/
         F/irJfR50+QzhopLwHDMkYcy+CF92kxpeyNAY7EsJvAwuTWHEVvz4IQSCwufHjytsJeJ
         1VV0TcWs1OipbRePnojOCMMwQq/6SyGxvOxaROmnjgsB7FDtg+1usMHtEQOKopBI6hE0
         OVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727776633; x=1728381433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJZZRH5f3SlZnl5oD83B2IHXh9EXL5azgjHetsdsSic=;
        b=NasBOPSLokcN7IF7I2oV1LpGqWzwme8Vxx1zywNYlHJLFZpNKO7+9UQamtT5mEV+dw
         CTg/pdcMdhKCVGSnHqAnSMDuhovvIQ/gFIjGDXsRTOVtpJdvrCQ5SqcKOnozptrsvSu6
         9tVROIkDy6SvQ0e215BSriDRxdab+47Bn52g2D0JohtIlaSF89uY0jc4RD4Uh4MTSsc2
         NmLuRN8NJ3Fp0vFXhZI3AhDmMDTn+1Ks+hkjDZTBf0vgF9tB9Veef7lKGfnsv5YQ8jtA
         40MwRsVbuuH1wr+B3XAaWFe+VkSVjr8a5lP5foRVtE+bNYSv4OQUknmpSedz17Nd0GCf
         E2kg==
X-Forwarded-Encrypted: i=1; AJvYcCWnY0rtRUBLZ+8VlcKJDp1L4+2EIyx01NrMP8pxDgPS+kIVumdfiqwot2RE9F4m98mP3o7sUVNVCUUQMaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+Wape3kQyZA9bQpsAxFZXYgRJ527nh5DgolosSyObder3PBE
	5K191vq5Kj41Dod98Dc7l8yjwHe5CbeNu0Ulk/Iz1Hj/fMvk3Cix
X-Google-Smtp-Source: AGHT+IFg49hq/u73GrCxeA0RXbOWXevk7voboCl/fDLoMZqqtQhmBtjQhddqMRoGeEFpmxyMKZ7Sqg==
X-Received: by 2002:a17:902:e94d:b0:20b:8d7f:d13 with SMTP id d9443c01a7336-20b8d7f0f82mr95866485ad.58.1727776633324;
        Tue, 01 Oct 2024 02:57:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6ca63f9sm9620563a91.33.2024.10.01.02.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:57:13 -0700 (PDT)
Date: Tue, 1 Oct 2024 02:57:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <ZvvHdlD6E5bzsWwV@google.com>
References: <20241001093815.2481899-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001093815.2481899-1-wenst@chromium.org>

On Tue, Oct 01, 2024 at 05:38:14PM +0800, Chen-Yu Tsai wrote:
> Elan trackpad controllers require some delay after enabling power to
> the controller for the hardware and firmware to initialize:
> 
>   - 2ms for hardware initialization
>   - 100ms for firmware initialization
> 
> Until then, the hardware will not respond to I2C transfers. This was
> observed on the MT8173 Chromebooks after the regulator supply for the
> trackpad was changed to "not always on".
> 
> Add proper delays after regulator_enable() calls.
> 
> Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This will unfortunately slightly slow down the driver probe and resume.
> An optimization would be to check if the regulator is enabled already,
> and shorten or skip the delay if it is. This would require a new API
> though.
> ---
>  drivers/input/mouse/elan_i2c_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index ce96513b34f6..89556f61004e 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -46,6 +46,8 @@
>  #define ETP_FWIDTH_REDUCE	90
>  #define ETP_FINGER_WIDTH	15
>  #define ETP_RETRY_COUNT		3
> +/* H/W init 2 ms + F/W init 100 ms w/ round up */
> +#define ETP_POWER_ON_DELAY	110
>  
>  /* quirks to control the device */
>  #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
> @@ -1237,6 +1239,8 @@ static int elan_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> +	msleep(ETP_POWER_ON_DELAY);
> +
>  	/* Make sure there is something at this address */
>  	error = i2c_smbus_read_byte(client);
>  	if (error < 0) {
> @@ -1374,6 +1378,8 @@ static int elan_resume(struct device *dev)
>  			dev_err(dev, "error %d enabling regulator\n", error);
>  			goto err;
>  		}
> +
> +		msleep(ETP_POWER_ON_DELAY);

This will add an unwanted delay on ACPI systems that handle power
sequencing in firmware. However use of "optional" regulators is frowned
upon in this case as the supply in reality is not optional.

Mark, has there been any developments that would help reconciling
difference in behavior between ACPI and DT systems. Ideally we'd need to
know when supply was turned on, and adjust the wait accordingly.

Thanks.

-- 
Dmitry

