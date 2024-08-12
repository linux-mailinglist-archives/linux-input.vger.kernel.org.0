Return-Path: <linux-input+bounces-5524-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA694F5E3
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 19:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA6AC1F2378D
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 17:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8CE1891AB;
	Mon, 12 Aug 2024 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyVjMoxj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F39D188CB0;
	Mon, 12 Aug 2024 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723484152; cv=none; b=FOd/yjJXginYyr4EBU1OjMdAmy97AcFZ+E3CoEIb3txn3vl6l6vz1x48NWotsontbhEzsKmBAfDx27Qnhw9pisZxo1OnhOd5FiwdGD6EOC2fG7NLJUm/oHTdmk0hs+ANIIh6IAwLWUFd5nOdhuUSVJw3nb8KToG7KVOpcP1WJq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723484152; c=relaxed/simple;
	bh=k0/vi7W0H2st2xtbJyB0alr4uujbiwXUAJjo8e91gEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPZxzBg6Lej1o5wMl0WfyisCJJ876xaY9p0xahXPx4kg4bpqPck0kykl5Jh5Yw//RGr+55GIxbgkA0ls4BX6wHERy2oxjOHNc3iFOtGuuMh/R2hvooAs4aa+Dnv+ie+Nfiw9lnbP9k0UgtyhqOlocFG8TBtiA0uBfxJKmR+NoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyVjMoxj; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-260f81f7fb5so2976139fac.0;
        Mon, 12 Aug 2024 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723484149; x=1724088949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGe9WVDpLw3EPv8WDjp8LJHxaG4nRuWgDJWrzJ3DiyM=;
        b=TyVjMoxjxK+OsEvUMx0AM9J5QFc4KB7ckC4ZZ6Xz5u4pmVhNArdwU4XMzGVEJU/MTa
         utinyWK3kGlKqrsvFWFWgdd77/xPOtDn8131Y7nIlr2+fUBM4Q6Rse+3J9mm8P33TynM
         64xjiA59zrFfeAEZsw4/kIe69snvGE7qOo4Tv/cjTHXlbUNX5pQhQBGOqXaHNKqh1mVF
         POnGy7ExMlQpB50F9sjLoTzTftcAdd3yS4ZzBhrEGGAwOVgGAEcvU+WasttXrj6g2syt
         UH0w57UELc+LGrKYJdjEn0atNYDwu6DtOHw2J/ota2l1em7pjr5C3GoIrGtQO+zgYSKu
         8oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723484149; x=1724088949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGe9WVDpLw3EPv8WDjp8LJHxaG4nRuWgDJWrzJ3DiyM=;
        b=qq0GGj/hn+0HHLvM1LHAm+fG35evAzR0AAnu+9++j9DLxItxKjskd+fD1dVUu3dz59
         3TBbB/rVK7rUUKtXtMQVOAfufupxTVRL2Wpemkip0sJUUcTo5CDepfLXt9njOHrPFSuh
         NtXzdzP4YD7NBof2KWHDWBx5qQo7sOFdlAxQP+ptPGdblSLK9/bL7TjsNJ6ZzWisWeAX
         p6hdNvuQd1g7RGnELl1K6L3SsHYZUk8jnk1qEGIQkgFnvBmJkjlofctr4Z75qmBWz7gb
         XfDdU3rWUGQB6rTwpseVx3aAQsXLKR/cTaV1x7bQMMfBp4/S2deSwj1duThguqfNGwkQ
         2DtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyw0KAHPwWnycgA/qj50Us1wxKo+4t/Wob9S3rRh0JwRWc+mQLs2nLKTte9v5RoRPwsyubnfM5fBHBQD9mk78XZkMNXeRtIj/8QWOo8Wf/ufSjgsxH6OAiu/f+5XUxC0BtlMwDiQGSAEw=
X-Gm-Message-State: AOJu0YznptGuePoa59UjIDr95RNZFVKHJ9ZfQNlqccDsS4ekMNwK2gEc
	DgPtJcqsh0O6n9AWfcn5conxUQpb5YNM/ep7x0SjbnBm6oXHmZUR
X-Google-Smtp-Source: AGHT+IGB+3J1W1v44bGEpVHOvf7ojdD7DKrucadL2qbcKM6lsELEjpgMQU86LpLfBQxsoGt6LxIipQ==
X-Received: by 2002:a05:6870:f685:b0:25d:f8fa:b53e with SMTP id 586e51a60fabf-26fcb826e8dmr862394fac.34.1723484149618;
        Mon, 12 Aug 2024 10:35:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:53c5:10b0:cfab:3972])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a89f52sm4260689b3a.162.2024.08.12.10.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 10:35:49 -0700 (PDT)
Date: Mon, 12 Aug 2024 10:35:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Joy Zou <joy.zou@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] input: keyboard: snvs_pwrkey: Enable clock when
 accessing HP* registers
Message-ID: <ZrpH8lXG4wkORlyA@google.com>
References: <20240716205612.1502608-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716205612.1502608-1-Frank.Li@nxp.com>

Hi Frank,

On Tue, Jul 16, 2024 at 04:56:09PM -0400, Frank Li wrote:
> From: Robin Gong <yibin.gong@nxp.com>
> 
> SNVS requires two clock sources:
> - LP (32k always on): All LP* registers need this clock. No management is
> needed as it is always on.
> - HP: All HP* registers require this clock to be enabled before accessing
> these registers. Some platforms (e.g., i.MX6SX/i.MX6UL) do not have a
> separate HP root clock and it is always on.
> 
> Add an optional "snvs-pwrkey" clock for the HP clock and enable it only
> when accessing HP* registers.
> 
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> - clock name snvs-pwrkey already documented at
> Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
> ---
>  drivers/input/keyboard/snvs_pwrkey.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> index ad8660be0127c..b352148a0cfb2 100644
> --- a/drivers/input/keyboard/snvs_pwrkey.c
> +++ b/drivers/input/keyboard/snvs_pwrkey.c
> @@ -37,6 +37,7 @@ struct pwrkey_drv_data {
>  	int keycode;
>  	int keystate;  /* 1:pressed */
>  	int wakeup;
> +	struct clk *clk;
>  	struct timer_list check_timer;
>  	struct input_dev *input;
>  	u8 minor_rev;
> @@ -48,7 +49,10 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
>  	struct input_dev *input = pdata->input;
>  	u32 state;
>  
> +	clk_prepare_enable(pdata->clk);

We are in timer context here, "prepare" is not allowed here. Can we
prepare the clock once and enable it as needed. Does it even need to be
disabled? Can it be also always on?

If you want enable/disable then error handling is needed.

>  	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
> +	clk_disable_unprepare(pdata->clk);
> +
>  	state = state & SNVS_HPSR_BTN ? 1 : 0;
>  
>  	/* only report new event if status changed */
> @@ -169,7 +173,15 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	if (pdata->irq < 0)
>  		return -EINVAL;
>  
> +	pdata->clk = devm_clk_get_optional(&pdev->dev, "snvs-pwrkey");
> +	if (IS_ERR(pdata->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(pdata->clk),
> +				     "Could not get the snvs-pwrkey clock");
> +
> +	clk_prepare_enable(pdata->clk);
>  	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
> +	clk_disable_unprepare(pdata->clk);
> +
>  	pdata->minor_rev = vid & 0xff;
>  
>  	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
> -- 
> 2.34.1
> 

Thanks.

-- 
Dmitry

