Return-Path: <linux-input+bounces-4787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C191E99E
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 22:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 531EC1C21D83
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 20:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220BD16DEAD;
	Mon,  1 Jul 2024 20:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgCgeeSF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C916D9B6
	for <linux-input@vger.kernel.org>; Mon,  1 Jul 2024 20:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865950; cv=none; b=SitjBNQvU2ehMoMRXWxeWjMVXlpzPWgWwdRlwGd0HzXs8hNVwuqnXtoQ02/KWZG9nXJCimoVmuxnoDX9nk9bvUDo463Lka2EzPyYU9D1/fZvtT2+oFMLOwR0RjnfKUpz8frF2tm1f3Of+YThz6eh1EJ/H5r3SV6PJNI4i/JFl84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865950; c=relaxed/simple;
	bh=xpN7/tTYQgy383QB2y2T9uhzz123rWmHug8FpUAhRWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlSOuQlCcXj4K4jMboxnGFFF+ung0F3M9ZXtcvmJY+sRNiKp3v9Tfn1M2tsjaKXqhy135N1dSjNwwV7IthOya2amBXQ1lBgEm2RWawI/KJ72B4XvUtR5xeOf/0YPT6phfJcpx9aOuUJNyCasnig9wXDq3tJePvnRYUkX5GLiG4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgCgeeSF; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so3810737e87.2
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2024 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719865946; x=1720470746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4Al+p7+Jx4QMS6ZRzOMzn7/IcRW4qS/ED9WAZRF5M0=;
        b=NgCgeeSFjasOhQsDYo2Mpdf5YD+Og5uCCxGjOvJo1pZOQ3Njt8Xc4mRM9hvQO54pAw
         QgStnA1/BTvV3wmCf7dGrq8cIIneX1/0O2xBtFFAHI6iYnrpsVaVCE1Sn4+LmtmdCyVh
         hSbq0+5GHpVewQ4H7ZlvlyAqpNvDgOhI2Hyhve7wjMPLatARK2M6k0f9G0CW3rkFpEui
         tY+uEOvjzQ7PvZXl6zcsZu2PI7BJ2BlrAyMQVMGTZQSFuLqBsUfMNykwHO+29XunoaxG
         7eZ/4MuoHNNd6GgOQIEOLput8Zi0dNRvwV5Bn0v7hsG8YM4LipFpOs2g+ktQHOXqjmgX
         3s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719865946; x=1720470746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4Al+p7+Jx4QMS6ZRzOMzn7/IcRW4qS/ED9WAZRF5M0=;
        b=WsFx28ZM/ki4xIkuyR999Ub67DJad6OBDbOao+tyuKCS7JV2WSJ9WlDxjagR0c7bNJ
         IUYIF08IO0etReCmvGZ6C1bhOa2DTLz99R4v7AryCWJAbF4UlgUekAkYX9IA7MHHQaxE
         2XyX4+y3cxSuAU48iYHYM54ltPUcggE0mwarjZNwjI3OM+aYbZtThBjvsR/7LFjf35nR
         RchgfusDhclbi12W4mQX2+W01l5wO65SHnyBn/HWm5FY8GbhQx59fNNcJEiR4QnFVEMH
         59y7n6Nvel/UZttCWL/D6gVTEIbTf9RKWQSuzFEaA3jvbLPSlmlLltNEmzH0afH/0/ML
         GAVg==
X-Forwarded-Encrypted: i=1; AJvYcCUgp/JeDBgzPmStgjfvPxJqCy0yJxzUQ96YrU9SXjQ2NJkLaEI+Feerfmfq9g6LswyalWcJybD7799g1t43cQTYH/IXC65txnjnrfY=
X-Gm-Message-State: AOJu0Yz3LOPQWyfaFVCqjOrpUwpsAac7v1cSCzMkpER8jtm3KTZVOxSj
	4PAzANV2u6D5hohn1WSYH/Ore97Z3qW2SUkU8zzFWHkIht9dgYXW0p6RODiKXoE=
X-Google-Smtp-Source: AGHT+IFJr9iphLbm2TbLxdU2q9eLCNITZS5yDZ612pI0Pqk94QNI9OpKhvGgRjiFMmsb1ZR/me6Rwg==
X-Received: by 2002:a05:6512:2312:b0:52c:7fe8:6489 with SMTP id 2adb3069b0e04-52e8273e4a5mr4495138e87.63.1719865944333;
        Mon, 01 Jul 2024 13:32:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2f77dsm1528020e87.229.2024.07.01.13.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:32:23 -0700 (PDT)
Date: Mon, 1 Jul 2024 23:32:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 6/8] drm/panel: add driver for samsung amb655x
Message-ID: <37y25ko7q2hoqlzvteqt3cj2lsms3lkwi6xu6qm4xaq5gm6pus@lxh4jo4hpryv>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-6-c4a1f8da74f1@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630-oneplus8-v2-6-c4a1f8da74f1@postmarketos.org>

On Sun, Jun 30, 2024 at 08:36:29PM GMT, Caleb Connolly wrote:
> This is a 1080x2400 120hz panel used on the OnePlus 8T. It uses DSC but
> with many non-standard DCS commands.
> 
> The only user of this panel (the OnePlus 8T) has a bug somewhere in the
> DSI stack whereby it isn't possible to properly initialize this panel
> after a reset. As a result, the reset GPIO is made optional so it can be
> left unused on that device.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-amb655x.c | 399 ++++++++++++++++++++++++++
>  4 files changed, 416 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 807feae089c4..2b9cfbf92d7a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7142,8 +7142,15 @@ M:	Robert Chiras <robert.chiras@nxp.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
>  F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
>  
> +DRM DRIVER FOR SAMSUNG AMB655X PANEL
> +M:	Caleb Connolly <caleb@postmarketos.org>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-amb655x.c
> +
>  DRM DRIVER FOR SAMSUNG DB7430 PANELS
>  M:	Linus Walleij <linus.walleij@linaro.org>
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index bf4eadfe21cb..7203d16ab20a 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -590,8 +590,17 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
>  	depends on OF
>  	select DRM_MIPI_DSI
>  	select VIDEOMODE_HELPERS
>  
> +config DRM_PANEL_SAMSUNG_AMB655X
> +	tristate "Samsung AMB655X DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  DRM panel driver for the Samsung AMB655X panel.
> +	  This panel has a resolution of 1080x2400 @ 60hz or 120Hz.
> +
>  config DRM_PANEL_SAMSUNG_ATNA33XC20
>  	tristate "Samsung ATNA33XC20 eDP panel"
>  	depends on OF
>  	depends on BACKLIGHT_CLASS_DEVICE
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 051b75b3df7b..be6d500a56a4 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -58,8 +58,9 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
>  obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMB655X) += panel-samsung-amb655x.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o


> +static int samsung_amb655x_prepare(struct drm_panel *panel)
> +{
> +	struct samsung_amb655x *ctx = to_samsung_amb655x(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	/*
> +	 * During the first call to prepare, the regulators are already enabled
> +	 * since they're boot-on. Avoid enabling them twice so we keep the refcounts
> +	 * balanced.

I see your intent, but I don't think this is fully correct. If the
driver gets rebound, then it will perform one extra disable call. On the
next driver probe / enable / disable / remove cycle the driver will
perform one more, underflowing enable count. I think
regulator_init_complete_work_function should give the phone enough time
to boot the panel.

> +	 */
> +	if (!regulator_is_enabled(ctx->supplies[0].consumer)) {
> +		ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +

-- 
With best wishes
Dmitry

