Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547AA415EC3
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 14:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241038AbhIWMtE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 08:49:04 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:35609 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241013AbhIWMtD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 08:49:03 -0400
Received: by mail-ua1-f44.google.com with SMTP id d4so4173200uak.2;
        Thu, 23 Sep 2021 05:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9+oX/hZLMr7MwGX9KlLoMnQVuO/vswFUJrco6bWsLco=;
        b=irt4xHMKOkN7qrSI/xkTv6bYxmZgU2YnYSyQczus2SgE9krWvLSDh1TB6/+BAcqi/2
         7c+8Prz51YAEaIjVva/wGXYDcCTcj8CH/GmIi7/0nXOv8+lHpKD9uksDnj04wgdz5Hsx
         1IK4G9AkqXoP0HRDq9uahRfKJLU4CyaeT5tjt2+3liG3HSys5Ujzi/JBUmf6wzP40aXv
         X404IyQLPal5ekGJqvFkl+qC9Ozqgm/314cWgE6T6kLYc34BiKBB7oYkjAKrFahwB2JP
         gqXVsLwaFRDVhjonpJo2H7xImnda396MYanepRKcRVd91ji/6m0VUMuBAU1edNNuOlK7
         tfVA==
X-Gm-Message-State: AOAM531iTVLgnv1ZagqsGdioUr7HS76MTpYqsvmTGB2/cHy+oogaYH4Z
        69t65TwkM1biTq7h1vPIFGnDWr+4WqpxLl9bpcI=
X-Google-Smtp-Source: ABdhPJxNh8HF+zJVW644DxAFWsBPkZApmTfFOKbdG02sCW+Xa5hJlIjdDankGv2SFSOFQGCbZGvmt6B/k4BUQkn8Lxc=
X-Received: by 2002:a9f:30d8:: with SMTP id k24mr3743169uab.89.1632401251566;
 Thu, 23 Sep 2021 05:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210922203027.3229474-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdULHnztv=7i1b1x9BEsO8pu=J3Af_Qx7=CzD3qJhYRNBA@mail.gmail.com> <eda13f7c-b353-dcf4-c4ea-c2aa65858e7a@ideasonboard.com>
In-Reply-To: <eda13f7c-b353-dcf4-c4ea-c2aa65858e7a@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 14:47:20 +0200
Message-ID: <CAMuHMdWzXz7ymzqajcUMNDU_jQewssWcb7=g73nKaDBq5w3qcQ@mail.gmail.com>
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

On Thu, Sep 23, 2021 at 2:17 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> On 23/09/2021 08:32, Geert Uytterhoeven wrote:
> > On Wed, Sep 22, 2021 at 10:30 PM Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> >> Add support for SW46-1 and SW46-2 as switches using the gpio-keys
> >> framework.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>         keys_pins: keys {
> >> -               pins = "GP_6_18", "GP_6_19", "GP_6_20";
> >> +               pins = "GP_1_28", "GP_1_29",
> >> +                      "GP_6_18", "GP_6_19", "GP_6_20";
> >>                 bias-pull-up;
> >>         };
> >
> > This part is not needed, as the GPIOs connected to the slide switches
> > have external pull-up resistors (unlike the GPIOs connected to the
> > push switches, which are driven low by open-drain buffers, without
> > external pull-up resistors).
>
> Ah - for some reason I thought it was required to configure the PFC
> regardless, and show that these pins are acquired by the gpio function -
> but of course I'd expect 'getting' the gpio would do that..

That should work automatically, for a GPIO.

> Out of interest, is the OD buffer there to act as a hardware debounce or
> such? or is there another likely reason?

Perhaps to improve sharing of the GPIO through the expansion connector?
Other Renesas boards use the exact same input circuitry, with a
capacitor and resistor for debouncing, but without the OD buffer, and
they also provide access to the GPIO through an expansion connector.
It's even a plain buffer, without schmitt-trigger inputs.  Personally,
I would have taken one with schmitt-trigger functionality, if I would
have bothered with adding a buffer in the first place (but I'm not
a real hardware engineer ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
