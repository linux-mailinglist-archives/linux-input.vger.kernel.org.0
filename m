Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C03415908
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 09:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239623AbhIWHdo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 03:33:44 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:39686 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239577AbhIWHdn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 03:33:43 -0400
Received: by mail-vs1-f44.google.com with SMTP id o124so5603512vsc.6;
        Thu, 23 Sep 2021 00:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Del0A0BDgK2H615eS1cQ6WeLryzAAcR66Ofx7x6P3ZA=;
        b=zn7yYVJA3NK532FG7rh3kTjLv01o6nfQtV/d99r0857cVsFJ46sBC10SOyyA+jSmUF
         5Cfo9emdJW0JTb9tua9kpuHiT5IH0sky6JxpQxPKaWc1WNrHjXEHBvEEjaVNn3EzReT6
         z7cpBFdzIWXsnA4vZeDL/zQn3lH3mbFf4TYVgW73qfaj/olJZej9enI6Gqhj/ybzs2zu
         1WRtw4wnxeC34lTLGoazbn42pKNRuGmf0/6LhrqEEFHqPOvG/wDvkNgqCi//ARROAl+p
         sSqaMX/pVKjGjJaqHtMVnjQK9GpqPyDRLiy4bgnetRjKoZ7yWPa+rAq4NzelDHnjP8jz
         qvoA==
X-Gm-Message-State: AOAM532m8gKRBEtPynoEXkZ2Hw9jMvIIrd0ftQRd3s4fCmlApxtxd3la
        IpNGB4m5ReIXopkLk/7TRsaoTG/LG3AydVTmSki/UufFGIA=
X-Google-Smtp-Source: ABdhPJx2iI3nIR80L07lK27EgPXYrRps/W9O7UznBHGPV5J758D0AopxFfYecnf8nhZq1uivdYplN9bTMk/5j7ijxXY=
X-Received: by 2002:a05:6102:2086:: with SMTP id h6mr2800628vsr.50.1632382331911;
 Thu, 23 Sep 2021 00:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210922203027.3229474-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210922203027.3229474-1-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 09:32:00 +0200
Message-ID: <CAMuHMdULHnztv=7i1b1x9BEsO8pu=J3Af_Qx7=CzD3qJhYRNBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW46
 switch support
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kieran,

CC input

On Wed, Sep 22, 2021 at 10:30 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add support for SW46-1 and SW46-2 as switches using the gpio-keys
> framework.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Thanks for your patch!

> ---
>
> SW_LID and SW_DOCK are selected as low-impact switch events for the
> default configuration. Would SW_RFKILL_ALL, and SW_MUTE_DEVICE be
> preferred as more 'functional' defaults? (I have otherwise avoided these
> to hopefully prevent unwanted / undocumented effects occuring on
> development hardware running a full interface which may parse these)
>
> I'd expect them to be overridden by any platform using them anyway.

That's a good question

BTW, I'm happy you brought this up.  I discovered EV_SW only
recently, and had just started wondering whether we should use it
for the various slide switches on Renesas R-Car Gen2 and Gen3 boards,
which are modelled using the default EV_KEY and KEY_[1-4].

I see several DTS files using EV_SW (or hardcoded 5) with KEY_*
codes instead of EV_* codes, so perhaps KEY_A or KEY_B would be
suited better, to avoid strange effects? But SW_LID (and KEY_RESERVED)
seem to be quite popular, too.

Any input^Wgood advice from the input people? TIA!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> @@ -52,6 +52,24 @@ keys {
>                 pinctrl-0 = <&keys_pins>;
>                 pinctrl-names = "default";
>
> +               sw-1 {
> +                       gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
> +                       linux,code = <SW_LID>;
> +                       linux,input-type = <EV_SW>;
> +                       label = "SW46-1";
> +                       wakeup-source;
> +                       debounce-interval = <20>;
> +               };
> +
> +               sw-2 {
> +                       gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
> +                       linux,code = <SW_DOCK>;
> +                       linux,input-type = <EV_SW>;
> +                       label = "SW46-2";
> +                       wakeup-source;
> +                       debounce-interval = <20>;
> +               };
> +
>                 key-1 {
>                         gpios = <&gpio6 18 GPIO_ACTIVE_LOW>;
>                         linux,code = <KEY_1>;

Looks good to me.

> @@ -193,7 +211,8 @@ i2c6_pins: i2c6 {
>         };
>
>         keys_pins: keys {
> -               pins = "GP_6_18", "GP_6_19", "GP_6_20";
> +               pins = "GP_1_28", "GP_1_29",
> +                      "GP_6_18", "GP_6_19", "GP_6_20";
>                 bias-pull-up;
>         };

This part is not needed, as the GPIOs connected to the slide switches
have external pull-up resistors (unlike the GPIOs connected to the
push switches, which are driven low by open-drain buffers, without
external pull-up resistors).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
