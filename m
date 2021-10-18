Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCFD43219A
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 17:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbhJRPFI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 11:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbhJRPEK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 11:04:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46538C061765;
        Mon, 18 Oct 2021 08:01:49 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id g10so283129edj.1;
        Mon, 18 Oct 2021 08:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tnMEOqokmGpTF0hZ3yCzYPnXo4CSB1sMTqH6Lf3QKsE=;
        b=JnJZL8br6Q2nYTjwg5jIu+zhh9Jyt8ILGrDgGFj22JD3RhoVSvIAANwX+nfJL6dphs
         EvEE1rPOB/2P0azICCAdx5YCmt3dmx69YdBZiCOPDeaKmobgpLI4lu3FHIjaG0RfQqLb
         qtgSedIs+R5YVh0vv3NlajJxhGl3TP7g7QDeCwTA4KHnroeS70bUrGAAR660ULgLx0Wj
         wPa1WqPIym7NBzMXcjE9LBYy16t9ZBZaLU+S5K9kqSXfK2vr2KTXgmQRT3fyGbx/y03Y
         vIAResAAty+j4WKPPRUyRHj9mk6QCCL8wEEChgw1xYme9cahIfJVagUFdkRyzYdPXpBw
         UzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tnMEOqokmGpTF0hZ3yCzYPnXo4CSB1sMTqH6Lf3QKsE=;
        b=iYbcmjzXd3SUBuVeV8Lmc840y9PP7XY7WwPiFejrqfMv7PVBv8W+I5a6VakN8QJTVu
         /hJsNmsIdjAqobXzcpbyfqUdNb7IINC8EHfEa6zrQRwce7qMRZyXmBmSdsyiwoVRnzlp
         CwIY6fcUqdLGOs8nkhaKyg6+bDedRT9RA+1ftqE7k4EydJOcuWfCWnY77XpJp2vTE4PN
         xhKHuup36vniiaQ9Ap553ITVCS4H0jYdJRmyXglcLijE3oRaEzvvFgkGZ7p4fF3PH9zl
         3MtCDSy/mYIB4pAyZYKyYuXiQpeyGBTdW/axUQpBpHsvVTupIWD0OxMfVQEq4zBEzcJ1
         ekfA==
X-Gm-Message-State: AOAM533Vw9vr8m+m5jBFYdh9uQRQUKlaXL/ly+1A8886Hms0PAYPF0kx
        dKCs2URvl/4MhLqG1vRsFgCX2YdBHX8J6gIlNyI/QRatuY3QLqDG
X-Google-Smtp-Source: ABdhPJynEkPsodXTZDsNXFkWk0EhfjhRKmLVfaw7l3zKUfDj1GIF21oeYL9MALoMrbEbzb3AEcJwTlmPHad02B7diRE=
X-Received: by 2002:a05:6402:10da:: with SMTP id p26mr45376484edu.283.1634569291374;
 Mon, 18 Oct 2021 08:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211018143324.296961-1-hdegoede@redhat.com> <20211018143324.296961-2-hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 18:00:39 +0300
Message-ID: <CAHp75VcvBxU=Hx=e+ksVqf5afVUFKKXnt2ZWzgnTypy96wKCfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: Intel: Move soc_intel_is_foo() helpers to a
 generic header
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 18, 2021 at 5:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The soc_intel_is_foo() helpers from
> sound/soc/intel/common/soc-intel-quirks.h are useful outside of the
> sound subsystem too.
>
> Move these to include/linux/platform_data/x86/soc.h, so that
> other code can use them too.

A nit-pick below which may be ignored.

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  include/linux/platform_data/x86/soc.h     | 65 +++++++++++++++++++++++
>  sound/soc/intel/common/soc-intel-quirks.h | 51 ++----------------
>  2 files changed, 68 insertions(+), 48 deletions(-)
>  create mode 100644 include/linux/platform_data/x86/soc.h
>
> diff --git a/include/linux/platform_data/x86/soc.h b/include/linux/platform_data/x86/soc.h
> new file mode 100644
> index 000000000000..8d710834e87a
> --- /dev/null
> +++ b/include/linux/platform_data/x86/soc.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*

> + * soc.h - helpers for Intel SoC model detection

No need of having the filename in the file itself, it even might add a
churn in the future in case of renaming.

> + *
> + * Copyright (c) 2019, Intel Corporation.
> + */
> +
> +#ifndef __PLATFORM_DATA_X86_SOC_H
> +#define __PLATFORM_DATA_X86_SOC_H
> +
> +#if IS_ENABLED(CONFIG_X86)
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
> +#define SOC_INTEL_IS_CPU(soc, type)                            \
> +static inline bool soc_intel_is_##soc(void)                    \
> +{                                                              \
> +       static const struct x86_cpu_id soc##_cpu_ids[] = {      \
> +               X86_MATCH_INTEL_FAM6_MODEL(type, NULL),         \
> +               {}                                              \
> +       };                                                      \
> +       const struct x86_cpu_id *id;                            \
> +                                                               \
> +       id = x86_match_cpu(soc##_cpu_ids);                      \
> +       if (id)                                                 \
> +               return true;                                    \
> +       return false;                                           \
> +}
> +
> +SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
> +SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
> +SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
> +SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
> +SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
> +
> +#else /* IS_ENABLED(CONFIG_X86) */
> +
> +static inline bool soc_intel_is_byt(void)
> +{
> +       return false;
> +}
> +
> +static inline bool soc_intel_is_cht(void)
> +{
> +       return false;
> +}
> +
> +static inline bool soc_intel_is_apl(void)
> +{
> +       return false;
> +}
> +
> +static inline bool soc_intel_is_glk(void)
> +{
> +       return false;
> +}
> +
> +static inline bool soc_intel_is_cml(void)
> +{
> +       return false;
> +}
> +#endif /* IS_ENABLED(CONFIG_X86) */
> +
> +#endif /* __PLATFORM_DATA_X86_SOC_H */
> diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
> index a93987ab7f4d..de4e550c5b34 100644
> --- a/sound/soc/intel/common/soc-intel-quirks.h
> +++ b/sound/soc/intel/common/soc-intel-quirks.h
> @@ -9,34 +9,13 @@
>  #ifndef _SND_SOC_INTEL_QUIRKS_H
>  #define _SND_SOC_INTEL_QUIRKS_H
>
> +#include <linux/platform_data/x86/soc.h>
> +
>  #if IS_ENABLED(CONFIG_X86)
>
>  #include <linux/dmi.h>
> -#include <asm/cpu_device_id.h>
> -#include <asm/intel-family.h>
>  #include <asm/iosf_mbi.h>
>
> -#define SOC_INTEL_IS_CPU(soc, type)                            \
> -static inline bool soc_intel_is_##soc(void)                    \
> -{                                                              \
> -       static const struct x86_cpu_id soc##_cpu_ids[] = {      \
> -               X86_MATCH_INTEL_FAM6_MODEL(type, NULL),         \
> -               {}                                              \
> -       };                                                      \
> -       const struct x86_cpu_id *id;                            \
> -                                                               \
> -       id = x86_match_cpu(soc##_cpu_ids);                      \
> -       if (id)                                                 \
> -               return true;                                    \
> -       return false;                                           \
> -}
> -
> -SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
> -SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
> -SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
> -SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
> -SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
> -
>  static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
>  {
>         /*
> @@ -114,30 +93,6 @@ static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
>         return false;
>  }
>
> -static inline bool soc_intel_is_byt(void)
> -{
> -       return false;
> -}
> -
> -static inline bool soc_intel_is_cht(void)
> -{
> -       return false;
> -}
> -
> -static inline bool soc_intel_is_apl(void)
> -{
> -       return false;
> -}
> -
> -static inline bool soc_intel_is_glk(void)
> -{
> -       return false;
> -}
> -
> -static inline bool soc_intel_is_cml(void)
> -{
> -       return false;
> -}
>  #endif
>
> - #endif /* _SND_SOC_INTEL_QUIRKS_H */
> +#endif /* _SND_SOC_INTEL_QUIRKS_H */
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
