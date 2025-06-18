Return-Path: <linux-input+bounces-12946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF099ADED1B
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 14:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67A3B1891950
	for <lists+linux-input@lfdr.de>; Wed, 18 Jun 2025 12:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03572E54C5;
	Wed, 18 Jun 2025 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vooGQp+c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509A2E54CE
	for <linux-input@vger.kernel.org>; Wed, 18 Jun 2025 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251430; cv=none; b=jCR/yoSNhJCQIsirD1BB+XMMQm6ooDPRA6nsx+cQgis8/ZW46jKKLgd8OcOYidSy0jbWqKjSr8wli00VcY8WOaoJK1eCfI6PRlemTZwW6oY7W1yQbopUR4M7ScWbZdFhp0kvd4c2JEblVLvGYM3WluqS5RGsiwH+YnijS1h9aq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251430; c=relaxed/simple;
	bh=chU3ZzgX8ixQ80XuNsDpy9w595hkOFK6g+6/L8GwJwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ep5f+7FGEclyvXxtfIGGFzGMcQ1fRn1KaqIJZjO141Xo441Q5fMK8I5xgyko7VZ1Mwzrz4EBa+YpNuUHCtG2lf0uoP6rdZHt0d+zNKTnWZJIYoij5UcaqlojkGHKsQhWLNYMP84QETLoB27356+LAmGrx49xRIm1R2c3tuVBdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vooGQp+c; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e81a7d90835so6583734276.1
        for <linux-input@vger.kernel.org>; Wed, 18 Jun 2025 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251427; x=1750856227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=vooGQp+cXA7Bl9EdDFb5l+L/SbQXuI4V5FZ0RzgjuAXNy2/KAcAyg2o0IWDzripkkE
         tBcO61mGf6On7hilM9Kk8BA7p/r54kdadUGCT7+RjJWLFtKtD49Ey3xovothllGuoj/4
         cxXsMsagUqhtNDY9xe3IgmmjXPfqYXJqlV92vCEkihxdk3DWBzTR13Wc9w9peHStJI3V
         2RGg4jkTHOtGpN/1nexrUJ0QdBXUzSHI/I18yISa6Mx4qaxv6QSZzxrY1VkWUzOfo/r6
         IL7vbyCJIta0JWgxjWOjrHPMkACNqcs8A1MbsIp1o40U5q2UIjPOipsV3G9Vi/CcrE/r
         7Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251427; x=1750856227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=LtINLA8xVuvH05YnhLNM7Db61ouEhcJk3bTwlkvod0erD6wDTRyYfBBBnmIbXFDb3v
         +cGk61jO3B0HJp6CnOchLV3JjrLlSsfW3K3qH9hFW8xMcaTU8paXU5iHtceDD/1rpVuQ
         OtPaE8tWjCQHNBQtApGm19CUhzdIJBALyjTCU2ykb79u07wUT9iR11aJe2gCkfc/wcFY
         DsdlzxsCUWEyYdyK6Uv/vmp6IowhOMsYyOEtsVo3/KBxjJxUA6ndYZzMfmaTOTw/+o9N
         RNMoZGFFdU6twd0HjCSOKGl6aavKuzUxuEDefohqUvuFpiOgwP6Ki/Gl/6abDj48LzkV
         x6+A==
X-Forwarded-Encrypted: i=1; AJvYcCUJU5U/4bWUmjftukiVyF6yKzYWnh0IDPSKE1eLluU1DjFYQlUsSv78WSngL3r1ocOqN8+BQtkQI7tDvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+0G1rgEZV59ISqrqFq/sYsX+srsG1uqea7B7Bth5aPcSR0Tz
	JIMtNMcm3+hHvHdwP09NQ2OhxNCYI4FfNfOIR4/72MFtx/WPAh0qQg4ieDtic+eaKMtZ/QIcPQ+
	2T5ts7BSawXnAHetybMQ2/IbQu7VLbqs5cHII+ezcxg==
X-Gm-Gg: ASbGnctWso0Dyr6eqzh1/eLnSU1NIoVD8cZFKOkDQTcgfs/OXV1Tpv4tM2q+eRyuLFW
	XAITLVuktQh7t5DIfRZXPBL6neHTjkfuX4FzjAl4ULOX6jG+YA4HsUwDXGfR79jgXrT0DOmQbf7
	Y6MJRsjWc/G+PRNaAvAZxjjtSbPDRhkqK15/+oGkK2YgU=
X-Google-Smtp-Source: AGHT+IEZlf2SkQ6pDtcOhhdvV3LmUw3iR0H22QpguHg1V4liWBddtmQy97+4HMMAxIbIevgaVnIrB0SHGsEYRyBVYzQ=
X-Received: by 2002:a05:6902:6303:b0:e82:2b85:ea3a with SMTP id
 3f1490d57ef6-e822b85ee43mr16723424276.32.1750251426746; Wed, 18 Jun 2025
 05:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org> <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:30 +0200
X-Gm-Features: AX0GCFsnEI_9cu3U9fY7I_D0EnrNerJPcmhYfg39LAqv66uN774UfRLbAU6VCkM
Message-ID: <CAPDyKFrQ3Uj+coa0WCG00_pyaxu-yEnH26qmS6tevZ_772oZVg@mail.gmail.com>
Subject: Re: [PATCH 01/11] pmdomain: apple: Drop default ARCH_APPLE in Kconfig
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 23:12, Sven Peter <sven@kernel.org> wrote:
>
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
>
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/apple/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
> index 12237cbcfaa983083367bad70b1b54ded9ac9824..a8973f8057fba74cd3e8c7d15cd2972081c6697d 100644
> --- a/drivers/pmdomain/apple/Kconfig
> +++ b/drivers/pmdomain/apple/Kconfig
> @@ -9,7 +9,6 @@ config APPLE_PMGR_PWRSTATE
>         select MFD_SYSCON
>         select PM_GENERIC_DOMAINS
>         select RESET_CONTROLLER
> -       default ARCH_APPLE
>         help
>           The PMGR block in Apple SoCs provides high-level power state
>           controls for SoC devices. This driver manages them through the
>
> --
> 2.34.1
>
>

