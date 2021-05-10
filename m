Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BDC377F5D
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 11:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhEJJac (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 05:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhEJJa1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 05:30:27 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D771AC061574
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 02:29:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m11so5910399lfg.3
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 02:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9NQQkdNhXevLawtr24xbgszMZ8KLgwl2l9QNBESZzYY=;
        b=A++sdj3DRLNhLEGLeWsuwGTOHwHcEnoxio4u8Ra63uEdmfQRcZrZt1MGUp6mYocWq4
         ZiHToB1ibTBXKCZjRASM5xhHSX+s9OiNhezgxvbVgzK1nBLiZjWxkV61vxVR4lfBf9HT
         9K8qnU34cyWcsiaF8rKbT03O4bjfe8DVQKiCHvOGOxfEJS+5baFAtVfb2ku+JceRJGgt
         4kLFgM1Y1HhLo8N9DI0VYVxaMVN4yXYuGqV0ZpXGShMYRM6vaq5wnJNPEftAnd+0X3tS
         hGC+SccY3ahBLRhQYuqiUn5hfeSEB1gkxrbigMHB3ofxkPn7KVYXYuBYb7yGtxT/pS+v
         03Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9NQQkdNhXevLawtr24xbgszMZ8KLgwl2l9QNBESZzYY=;
        b=HIn+3dAsJCqzR8+HXol0eTT33uHchE50EM0EiQsRAzDlDF5hHvcsPVVMtWQ/RVv23v
         bBxuHTGtV/m4VUIOt+Jzu4LbelhMe2JqG0nmpHj3oOgXrUz78r/72A2CRoZTva3wTeI9
         d5yb8I4Z4F7CrJEix/Xaw1Rus9DP2gQUFzG+qaNfO6SK/Ys2GNHDPcSWypd+BNyTLm/Q
         9aHLp05P9qcbzfRwb3yO5IgwH/OXYgLa2x6rq162wYkynsqpj1J/1Q767DAI+lxJ7z8h
         lB4z3NVuq70ZEPoeQs4/MMby6li/T39u9nworR8mF2loRpt6rEvBGmH30QUmIkTw9DnY
         tXQg==
X-Gm-Message-State: AOAM531Z5ZWr30m3C4vpY8nqnUTsl0xwN+/iMGFi7IHR0eC3mh8efNAj
        snDmAgFozpKqcD7NTsu8Foiekbcg7wgUZcwmSJQmOg==
X-Google-Smtp-Source: ABdhPJyk102VoBZY+PDPZgmfYHlWdQ81Rw2pNDWYNSIpvfnqu1GqdrL4ZuuxSiV/QL6ovH8UHYEMSha4mBWWwJiJ35M=
X-Received: by 2002:a19:a418:: with SMTP id q24mr15771913lfc.649.1620638960242;
 Mon, 10 May 2021 02:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210509233830.359134-1-linus.walleij@linaro.org> <YJh8s5rU2VE+DyQz@google.com>
In-Reply-To: <YJh8s5rU2VE+DyQz@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 May 2021 11:29:08 +0200
Message-ID: <CACRpkdbXuZOrKyDeBttkMzGvHJbnqVgAnQv=Z=Ui0fHQOOaUMg@mail.gmail.com>
Subject: Re: [PATCH] Input: tsc200x: Drop hard-coded IRQ edge
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 10, 2021 at 2:22 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, May 10, 2021 at 01:38:30AM +0200, Linus Walleij wrote:

> > This edge setting should come from the device tree not
> > the driver. Also, most device trees sets this to the
> > falling edge, which is contradictory to what is hardcoded.
>
> I see there are 2 possibilities:
>
> 1. The driver has never worked
> 2. DT interrupt annotation is wrong.
>
> It would be nice to know if we are dealing with 1 or 2, as in case of #2
> we need to adjust DTSes before this patch can be applied.

I looked closer and unfortunately the mess and confusion
is bizarre.

The DTS files we know of are:
arch/arm/boot/dts/am3517-som.dtsi - rising
arch/arm/boot/dts/imx28-tx28.dts - falling
arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi - low
arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi - low
arch/arm/boot/dts/imx53-tx53-x03x.dts - falling
arch/arm/boot/dts/imx6q-dhcom-som.dtsi - falling
arch/arm/boot/dts/imx6qdl-tx6.dtsi - none
arch/arm/boot/dts/imx6ul-tx6ul.dtsi - none
arch/arm/boot/dts/imx7d-nitrogen7.dts - falling
arch/arm/boot/dts/logicpd-som-lv.dtsi - rising
arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi - rising
arch/arm/boot/dts/omap3-gta04.dtsi - falling
arch/arm/boot/dts/omap3-n900.dts - rising
arch/arm/boot/dts/omap4-var-som-om44.dtsi - low
arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi - falling

We can assume that some of this is the result of board
engineers introducing inverters on the board as is custom,
so the flags are actually correct when set to falling, just
that we don't model the inverter.

In the case of imx6qdl-tx6 and imx6ul-tx6ul with "none" IRQ
type I assume this flag in the driver is actually necessary
for the device to work at all.

In the cases where rising is set, the addition of the flag is
plain tautology, just setting what is already set.

In the cases where falling are set the interrupts will arrive
on both edges (if the hardware can provide that, which is
not always the case) and as a result fire twice as many
interrupts as they should, probably with zero effect on the
second IRQ, just reporting nothing.

The combination with active low is weird. I wonder what
happens there.

I am just confused now and have no idea what to do about
it...

But I just CC all the Freescale and OMAP people who
seem to maintain these DTS files so they can clarify
how well assigned these edges, none and active low (!)
IRQs are.

Yours,
Linus Walleij
