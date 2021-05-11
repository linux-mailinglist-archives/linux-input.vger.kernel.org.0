Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B66337AE64
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 20:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhEKSZV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 14:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhEKSZV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 14:25:21 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902EDC061574
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 11:24:13 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id b25so31130129eju.5
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 11:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SXEwYB1Y2EYTuZm4BqlvsgjrmrmNyGSE2d2Vv2IpoK8=;
        b=G/TjkccCT6/9EiLvtC7Y/w2n9cqtzu9rRS9IZ4Iqcl2vJjdc0D+2eYbllBf+QgGpZX
         0J3HdJDeE0cdwr6dxln/A9gLQGf4D1EHglvrA9SUPmYhVPFyif8dZZuufa9btSMHXWMS
         gu5oqlR50kzM7k7Ee5eg0a64HpLcFmnU4bVUp8OzV0mJ0vjG93V4ylHON7ITG5FAdLaC
         d0CbmI+nT8MpZNXiUnNZQ8gxKncaSz01P897pzQYopUS5n08seI2UGUXLzmOkdWkqthX
         MwnKI3Lt1JvK+EVafMG2YsdM/ph9Zc3vlNPfJZRXMY0CsHfdKi8sB4omEHMYry+XJfPq
         J2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SXEwYB1Y2EYTuZm4BqlvsgjrmrmNyGSE2d2Vv2IpoK8=;
        b=JhZIB0zxCU2LFFdAWMYpczDzS/yXctkudZVMrMMoS6XfSycqEqfuOpbFtKTfHes3zS
         mDaTWSJhKnzt0+D0NSMLIT/qMLSR/ijmC+FoWBYOKu1XWmD2Q21EjUBrfU6T+JIg3LWV
         NAZG3hOi+MkEzon6/DTFpf5Vg2kFVZfks5QKdVWei0h8dLFB76hqRKcULqT0k0FSDyUx
         Y0egXFUf+w8bKSYJkgQ2v2e47uxLUrtX6RCON2D3zCDR+Gd9y6C+NXIEHFH1stMDHk80
         S2u5RxWL4L5N6KbiTbANbHMilVuvthYgnynl56/aPtdy93WGLnCCdbnzeQ32zHvarJ2b
         poog==
X-Gm-Message-State: AOAM5336Ltt2SQI8tjRKWv4o8ClD7cbTDjY3ISt2IRp8cCJNXM+FnSG5
        YB/VVMExWPcX7DUyl6onfo/3fJh4y2xPG2gGF8OY/EaQhDk=
X-Google-Smtp-Source: ABdhPJxofUWKnEfjncp/oIOHqP4w5Ay6Lfh4QecK7xCbboTRNxnQY2TAxu3bTvi5IseK0MHyTeVWWRu4jsI+AeY9Kh0=
X-Received: by 2002:a17:906:5a96:: with SMTP id l22mr33294455ejq.450.1620757452006;
 Tue, 11 May 2021 11:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210509233830.359134-1-linus.walleij@linaro.org>
 <YJh8s5rU2VE+DyQz@google.com> <CACRpkdbXuZOrKyDeBttkMzGvHJbnqVgAnQv=Z=Ui0fHQOOaUMg@mail.gmail.com>
 <YJnSCGN1vUAtjf8F@google.com>
In-Reply-To: <YJnSCGN1vUAtjf8F@google.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 11 May 2021 13:24:00 -0500
Message-ID: <CAHCN7xKPZHLSSehkm5W9MtYSv1S2wH2sNoOAD8yHHWjEpc6tpg@mail.gmail.com>
Subject: Re: [PATCH] Input: tsc200x: Drop hard-coded IRQ edge
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Input <linux-input@vger.kernel.org>,
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

On Mon, May 10, 2021 at 7:39 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, May 10, 2021 at 11:29:08AM +0200, Linus Walleij wrote:
> > On Mon, May 10, 2021 at 2:22 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, May 10, 2021 at 01:38:30AM +0200, Linus Walleij wrote:
> >
> > > > This edge setting should come from the device tree not
> > > > the driver. Also, most device trees sets this to the
> > > > falling edge, which is contradictory to what is hardcoded.
> > >
> > > I see there are 2 possibilities:
> > >
> > > 1. The driver has never worked
> > > 2. DT interrupt annotation is wrong.
> > >
> > > It would be nice to know if we are dealing with 1 or 2, as in case of #2
> > > we need to adjust DTSes before this patch can be applied.
> >
> > I looked closer and unfortunately the mess and confusion
> > is bizarre.
> >
> > The DTS files we know of are:
> > arch/arm/boot/dts/am3517-som.dtsi - rising
> > arch/arm/boot/dts/imx28-tx28.dts - falling
> > arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi - low
> > arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi - low
> > arch/arm/boot/dts/imx53-tx53-x03x.dts - falling
> > arch/arm/boot/dts/imx6q-dhcom-som.dtsi - falling
> > arch/arm/boot/dts/imx6qdl-tx6.dtsi - none
> > arch/arm/boot/dts/imx6ul-tx6ul.dtsi - none
> > arch/arm/boot/dts/imx7d-nitrogen7.dts - falling
> > arch/arm/boot/dts/logicpd-som-lv.dtsi - rising
> > arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi - rising
> > arch/arm/boot/dts/omap3-gta04.dtsi - falling
> > arch/arm/boot/dts/omap3-n900.dts - rising
> > arch/arm/boot/dts/omap4-var-som-om44.dtsi - low
> > arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi - falling
> >
> > We can assume that some of this is the result of board
> > engineers introducing inverters on the board as is custom,
> > so the flags are actually correct when set to falling, just
> > that we don't model the inverter.
> >
> > In the case of imx6qdl-tx6 and imx6ul-tx6ul with "none" IRQ
> > type I assume this flag in the driver is actually necessary
> > for the device to work at all.
> >
> > In the cases where rising is set, the addition of the flag is
> > plain tautology, just setting what is already set.
> >
> > In the cases where falling are set the interrupts will arrive
> > on both edges (if the hardware can provide that, which is
> > not always the case) and as a result fire twice as many
> > interrupts as they should, probably with zero effect on the
> > second IRQ, just reporting nothing.
>
> That is not how we set up interrupts though. We only use
> platform-supplied trigger if caller did not specify trigger when calling
> request_irq().  From kernel/irq/manage.c::__setup_irq():
>
>         /*
>          * If the trigger type is not specified by the caller,
>          * then use the default for this interrupt.
>          */
>         if (!(new->flags & IRQF_TRIGGER_MASK))
>                 new->flags |= irqd_get_trigger_type(&desc->irq_data);
>
> So in our case, since driver specified IRQF_TRIGGER_RISING it is how
> interrupt line was configured, and what was in DTS had no effect.
>
> >
> > The combination with active low is weird. I wonder what
> > happens there.
> >
> > I am just confused now and have no idea what to do about
> > it...
> >
> > But I just CC all the Freescale and OMAP people who
> > seem to maintain these DTS files so they can clarify
> > how well assigned these edges, none and active low (!)
> > IRQs are.
>
> Hopefully they can confirm how the controller is wired on their boards
> and then we can correct invalid DTSes and then finally apply your patch
> to the driver.

I reviewed the Logicpd Torpedo (DM3730) and there isn't an interter.
I changed the device tree entry for it to falling edge instead and
rising, and it continued to work perfectly.

I'll review both the schematics and test the am3517-evm and the
logicpd som-lv, but I am going to expect the same results since
they'll all basically copy-paste of each other.

Once I've completed my analysis, I'll post device tree updates for all
the logicpd stuff.

adam

>
> Thanks.
>
> --
> Dmitry
