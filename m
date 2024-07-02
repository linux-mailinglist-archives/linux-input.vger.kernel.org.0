Return-Path: <linux-input+bounces-4802-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 454AE923C25
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 13:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692511C20C8B
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 11:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B25158DDD;
	Tue,  2 Jul 2024 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMptZSdD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9887C6FC3
	for <linux-input@vger.kernel.org>; Tue,  2 Jul 2024 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719918794; cv=none; b=DepbC9yDgdiv2E/J6vRUe4y+D7qEE+Py8wYEatbfghrDO2K6fp+6rVsxgFtcKwjY4FKae5yiF/nvrpRQ6lBQO+enCA3XbVosRicdErjjlav/35984+tytjX4p0bV/b8fEL1oqGicL2oTacs1fzXSo1p/VhuqYXgw2ZWJ7ZYcdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719918794; c=relaxed/simple;
	bh=ZA2RukZW6Lk9QiReyZU5WGfhUVp/7ceSyeaFN1+Zc0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/oxKGvPnqosdsLTEvzOT299JVgZrIm26NoITqFf9NAllCzTcR9wT5G1+uRc8mMm+QbVIj+hPGQzuxcEbBRzxCPVx9L+NFPn/CzTtro/VsBhL/QPXlNNIrktuzC7xnMpDB5qM53qCM1qox/wN2NbijiuKYmiTY60uwPgq9VDAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMptZSdD; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-64f4c11d2c9so14210927b3.2
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2024 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719918791; x=1720523591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yZwkViluL9fZYJDEVjVHxofuWUETp5oFGLDBWD1R34Y=;
        b=KMptZSdD52VXDFoNdvSBIL1FHT3OECFdk7qWKPOuVc9JtLpOC/bxnlmGL7SL8u6OR9
         TZ84M1kdILKfwr2QhRS/kFX3g4q1SUj0TOMseRd2ePTbHgx+FD2WUMAEaxarJLPFoT99
         twWs8XPopqpXtrgdc2lHu6qqxtjnJ0AYkrZAHD9tP5t2Cd15kqgI6WzulX4v+60NqPhs
         l99I8iGbRWklzDm6XYpXMuQTP8Q4F2qUh0n5pnxCKxLFTd4aWUMaQHh7Iu1q2Yrnmwqa
         7w2zxeaDehXF9GqYjGlVpgXGVbEKo6H9mYS1UjQ/GmfmdWtVwBpiMlqSNLQEZaMR3ixL
         72Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918791; x=1720523591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZwkViluL9fZYJDEVjVHxofuWUETp5oFGLDBWD1R34Y=;
        b=jyRSbzJu8w4qjf5eGUF2yxgm75a5WjaO+5kz9n11i5cB0Q+4WBGI7HpKOG74Ulau9v
         oqZADpWt6N8X55ii5fG30MxgXfkXzm21fkhsJpLPDNiBAyT9IsBQcCfxEfI42Ua5UxzG
         F3jpjANkNN5RGABbvjcxDgV2Ht/UgQ24pMfl2wVuzWJ9gHzudgRAdLVZv7pHn4y7rzLh
         DkFfTJrL/7VNxzkJwrC5/44Stp2kFrFPFbWinI71lQtZuFKoE9vM2Q6mNAZxOmpyitb7
         CCQOrwkN4iRSGVN3OdXjcM/klo4DHjeXH750rrQZeEzz0gShaHhc9r9yD+wCNiv5qAHX
         Oc9g==
X-Forwarded-Encrypted: i=1; AJvYcCWYNQ0fZ67HYh8TF3rqUiv4BynQiz/vVwdgkWTEDz57xJu9HY47BY5Hf/NM4djZzvvz06j+BHs4wbqAAJRBVDuIRRWZLaFLiORPVKk=
X-Gm-Message-State: AOJu0YwbE3p/blIUQXYFfrPlmdHqOKnpYz23VJ9Q1lMVUD8uaN+cz2M+
	tV8rI5i1oLRetUWDu3MeM5nGdv6/vrvuUUz8PmQGeKjt1+PxJ/g01h1irZE0BSKainGL2qSdbUB
	Pq2X8fdRTL0RFuVmo8vYq+vc68qxJ5k3Ih12QbQ==
X-Google-Smtp-Source: AGHT+IE+XENqew12llqHSNS380ty5q6Xoz123+Kygwygr+yT2Q9JclDAXyV8vjEJVMRy6iBc7TeDkbDj9c+tJaEHcv4=
X-Received: by 2002:a81:69c4:0:b0:630:de2f:79b8 with SMTP id
 00721157ae682-64c71802f74mr90961787b3.13.1719918791593; Tue, 02 Jul 2024
 04:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-6-c4a1f8da74f1@postmarketos.org> <37y25ko7q2hoqlzvteqt3cj2lsms3lkwi6xu6qm4xaq5gm6pus@lxh4jo4hpryv>
 <efa5b7c2-05ac-4354-830b-1d5a66e2fb58@postmarketos.org>
In-Reply-To: <efa5b7c2-05ac-4354-830b-1d5a66e2fb58@postmarketos.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Jul 2024 14:13:00 +0300
Message-ID: <CAA8EJprniEW4ktqRQb0Zac1BcwzrvBbXQcve6V3rGmCOAC-vUA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/panel: add driver for samsung amb655x
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jul 2024 at 12:43, Caleb Connolly <caleb@postmarketos.org> wrote:
>
>
>
> On 01/07/2024 22:32, Dmitry Baryshkov wrote:
> > On Sun, Jun 30, 2024 at 08:36:29PM GMT, Caleb Connolly wrote:
> >> This is a 1080x2400 120hz panel used on the OnePlus 8T. It uses DSC but
> >> with many non-standard DCS commands.
> >>
> >> The only user of this panel (the OnePlus 8T) has a bug somewhere in the
> >> DSI stack whereby it isn't possible to properly initialize this panel
> >> after a reset. As a result, the reset GPIO is made optional so it can be
> >> left unused on that device.
> >>
> >> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> >> ---
> >>   MAINTAINERS                                   |   7 +
> >>   drivers/gpu/drm/panel/Kconfig                 |   9 +
> >>   drivers/gpu/drm/panel/Makefile                |   1 +
> >>   drivers/gpu/drm/panel/panel-samsung-amb655x.c | 399 ++++++++++++++++++++++++++
> >>   4 files changed, 416 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 807feae089c4..2b9cfbf92d7a 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -7142,8 +7142,15 @@ M:    Robert Chiras <robert.chiras@nxp.com>
> >>   S: Maintained
> >>   F: Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> >>   F: drivers/gpu/drm/panel/panel-raydium-rm67191.c
> >>
> >> +DRM DRIVER FOR SAMSUNG AMB655X PANEL
> >> +M:  Caleb Connolly <caleb@postmarketos.org>
> >> +S:  Maintained
> >> +T:  git https://gitlab.freedesktop.org/drm/misc/kernel.git
> >> +F:  Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
> >> +F:  drivers/gpu/drm/panel/panel-samsung-amb655x.c
> >> +
> >>   DRM DRIVER FOR SAMSUNG DB7430 PANELS
> >>   M: Linus Walleij <linus.walleij@linaro.org>
> >>   S: Maintained
> >>   T: git https://gitlab.freedesktop.org/drm/misc/kernel.git
> >> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> >> index bf4eadfe21cb..7203d16ab20a 100644
> >> --- a/drivers/gpu/drm/panel/Kconfig
> >> +++ b/drivers/gpu/drm/panel/Kconfig
> >> @@ -590,8 +590,17 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
> >>      depends on OF
> >>      select DRM_MIPI_DSI
> >>      select VIDEOMODE_HELPERS
> >>
> >> +config DRM_PANEL_SAMSUNG_AMB655X
> >> +    tristate "Samsung AMB655X DSI panel"
> >> +    depends on OF
> >> +    depends on DRM_MIPI_DSI
> >> +    depends on BACKLIGHT_CLASS_DEVICE
> >> +    help
> >> +      DRM panel driver for the Samsung AMB655X panel.
> >> +      This panel has a resolution of 1080x2400 @ 60hz or 120Hz.
> >> +
> >>   config DRM_PANEL_SAMSUNG_ATNA33XC20
> >>      tristate "Samsung ATNA33XC20 eDP panel"
> >>      depends on OF
> >>      depends on BACKLIGHT_CLASS_DEVICE
> >> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> >> index 051b75b3df7b..be6d500a56a4 100644
> >> --- a/drivers/gpu/drm/panel/Makefile
> >> +++ b/drivers/gpu/drm/panel/Makefile
> >> @@ -58,8 +58,9 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
> >>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
> >>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
> >>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
> >>   obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
> >> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMB655X) += panel-samsung-amb655x.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
> >
> >
> >> +static int samsung_amb655x_prepare(struct drm_panel *panel)
> >> +{
> >> +    struct samsung_amb655x *ctx = to_samsung_amb655x(panel);
> >> +    struct device *dev = &ctx->dsi->dev;
> >> +    int ret;
> >> +
> >> +    /*
> >> +     * During the first call to prepare, the regulators are already enabled
> >> +     * since they're boot-on. Avoid enabling them twice so we keep the refcounts
> >> +     * balanced.
> >
> > I see your intent, but I don't think this is fully correct. If the
> > driver gets rebound, then it will perform one extra disable call. On the
> > next driver probe / enable / disable / remove cycle the driver will
> > perform one more, underflowing enable count. I think
> > regulator_init_complete_work_function should give the phone enough time
> > to boot the panel.
>
> I do make an extra call to regulator_bulk_enable() in probe(), does that
> balance things out?

Hmm, I missed it. But if you have it, why not just have a single
regulator_bulk_enable() in pre_enable() like everybody else does?

> >
> >> +     */
> >> +    if (!regulator_is_enabled(ctx->supplies[0].consumer)) {
> >> +            ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> >> +            if (ret) {
> >> +                    dev_err(dev, "Failed to enable regulators: %d\n", ret);
> >> +                    return ret;
> >> +            }
> >> +    }
> >> +
> >



-- 
With best wishes
Dmitry

