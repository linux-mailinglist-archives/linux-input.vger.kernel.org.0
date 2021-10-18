Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C386C4321DC
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 17:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbhJRPIh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 11:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhJRPHu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 11:07:50 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AE8C061770;
        Mon, 18 Oct 2021 08:04:30 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y12so404889eda.4;
        Mon, 18 Oct 2021 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0EoNkAsRbOrEvWzKDHBUYgcF1HioS2sQFMJGO4X0WEY=;
        b=nkBu+K1IBFyS2v0cOqSVIiKofX7iomeXuHBoIAWeaN0cw1gsCLPxA7ElV175msvijv
         JlYwDlEFmqBGZ0aJhqQ6Mw2NEiTU31Sq3SwU+L39wmCznJ+3oITUaNA7tsThdIN6XDGz
         wlJZcHttlDEeAHkX8W1mQg2H5dZv/9kHz4eO0P/Z9Jf2DEwT9E7E4L4/+2sLplE4QuyX
         o+qVeQpc/0BTuJj/YoYqv8yEV3+U/NeTMg3LEWosREQVnJdUebc1VSZML4665bpD9PcI
         Ny53/vLXj72mVWyBN8y48RmyyhMUWhXTKTAZhr3/SlfhVOWKJsxxCkiBkl0X/hBol4jQ
         0I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0EoNkAsRbOrEvWzKDHBUYgcF1HioS2sQFMJGO4X0WEY=;
        b=IAOEZi9uRRMzdiPJ9eR3M7SY4b9KQ7m46WLgFgwtG2xAXWS5FhJsAKNmN166NfjRgJ
         gTT/NoPWmwYNfFQLrxutrB8eox+z1O2uqzwxXQN5zn3MZTuLxZ5rvIhzB8A/g9oVbgHU
         fYapk1i+I1Ul55oyc+43SmDiTpmTtLO+dbvr0QSX4c7JET6VK0e6pjP9PCOpX3N/ocUi
         zUxI7nRpq6uCH9N3U1jhj6lQj3iTnoV051ET3KT4dl1jwXCJNi0OT2gY+6UYJ1C9XM+9
         hw6+WYPimrV3NC2v2cbMfOQhdx63fiGPBPTRSGVNHgfg6L3yNywMjyy/7qUlHD0ZJJQv
         vWgw==
X-Gm-Message-State: AOAM531s7S8jyLqTknEO2BWuh/c/9IFJ42M+Gsia3bIuPngTTMqeajpC
        90Trc1wsBqt3wMy/Jxbtvsiqs50jkmsQb7vgm2k=
X-Google-Smtp-Source: ABdhPJzbZXNPcv61uQq2QUa5n4xq8FkHa4q8cyf+rDGmsW/py/6AxuvMev6HiHzFdiKuP6r+n/pL30fIkZVepbN/s6w=
X-Received: by 2002:a17:906:eb86:: with SMTP id mh6mr30733082ejb.141.1634569463133;
 Mon, 18 Oct 2021 08:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211018143324.296961-1-hdegoede@redhat.com> <20211018143324.296961-3-hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 18:03:31 +0300
Message-ID: <CAHp75VeG=RLXY16pMzNQbB9GR7GUsRTZu9Rx9yB0u3hzmhGELA@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: intel_int0002_vgpio: Use the new
 soc_intel_is_byt/cht helpers
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

Couple of nit-picks below (may be ignored).

> Use the new soc_intel_is_byt/cht helpers to clean things up a bit.

soc_intel_is_byt()/soc_intel_is_cht() (or anything alike to show that
these are functions / macros).

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/int0002_vgpio.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
> index 569342aa8926..617dbf98980e 100644
> --- a/drivers/platform/x86/intel/int0002_vgpio.c
> +++ b/drivers/platform/x86/intel/int0002_vgpio.c
> @@ -34,13 +34,11 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/x86/soc.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>
> -#include <asm/cpu_device_id.h>
> -#include <asm/intel-family.h>
> -
>  #define DRV_NAME                       "INT0002 Virtual GPIO"
>
>  /* For some reason the virtual GPIO pin tied to the GPE is numbered pin 2 */
> @@ -151,12 +149,6 @@ static struct irq_chip int0002_irqchip = {
>         .irq_set_wake           = int0002_irq_set_wake,
>  };
>
> -static const struct x86_cpu_id int0002_cpu_ids[] = {
> -       X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT, NULL),
> -       X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT, NULL),
> -       {}
> -};
> -
>  static void int0002_init_irq_valid_mask(struct gpio_chip *chip,
>                                         unsigned long *valid_mask,
>                                         unsigned int ngpios)
> @@ -167,15 +159,13 @@ static void int0002_init_irq_valid_mask(struct gpio_chip *chip,
>  static int int0002_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> -       const struct x86_cpu_id *cpu_id;
>         struct int0002_data *int0002;
>         struct gpio_irq_chip *girq;
>         struct gpio_chip *chip;
>         int irq, ret;
>
>         /* Menlow has a different INT0002 device? <sigh> */
> -       cpu_id = x86_match_cpu(int0002_cpu_ids);
> -       if (!cpu_id)

> +       if (!soc_intel_is_byt() && !soc_intel_is_cht())

  if (!(soc_intel_is_byt() || soc_intel_is_cht()))

?

>                 return -ENODEV;
>
>         irq = platform_get_irq(pdev, 0);
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
