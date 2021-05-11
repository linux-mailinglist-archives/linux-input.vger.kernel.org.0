Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A66237B2D5
	for <lists+linux-input@lfdr.de>; Wed, 12 May 2021 01:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhEKX7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 19:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhEKX7S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 19:59:18 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D926C061574
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 16:58:10 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id l4so32302438ejc.10
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 16:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UxZ1tmt/dVOEDzMFaE6wBrJZUDhQ6gvsHT4DJhGYTZg=;
        b=fjAMpsaaz9iaNfquaFuJ1SOIrdvG5w0r+YMEbqVbB5QmLSbodipKhG4KADo+z2VabH
         7SsZBt1YOh6pQO7lhcFspmx+uF++lsPnn1EjoTOXu0uldpHzeYqbNpQOvXG7Pzxf/wo+
         NQzki0Yc4q6ayaJS05cFf1KVT1WMTwg1OylThwe7+R/g9u7lGQUI02WvJBQQr0K3Gn+0
         rAeG4TpFufDxjBhjDxNDX+dpRmXqQ+BYmFSUR/yArlF6AVxZ2WXOvp3OY5x6AHGsrZdn
         dqINF1wlGA0DYZ4scfn7I/qC9cd48Jfu2tkyl9P9yHZk6AISF1ygB68ZjmWoIPltzO4P
         k4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UxZ1tmt/dVOEDzMFaE6wBrJZUDhQ6gvsHT4DJhGYTZg=;
        b=fwOvI9ad5XrOSjOpRAhBZiZQOBmX6QdRnjmKgdtKdZJaJZ6noXHyr8mORDdjTgOOcs
         P6CUJtj/H5r+7xTaTlkWslIt647chpsouGqQvmJJbvnptl7Bm3HNmdLt9llk7ErpMTo3
         Lk0AuLIb6aGahXSojXvsHRoWI0w7JyvyfxFOJsf+uIMCENtZhcrAt6bBmIpUC9j2y8WB
         VVJg72bj+hLJiAPqV6wYVvLiyQe59tE6ytPSafDnpdogwDMF4014mSxNnjpsfz6xd/6d
         /cK8sXLmSe6gHA4gCIazYmCsk4QdRULLmdxzzP4RtSVOPoeCEN3nFWbBO/kVHb1P7gEK
         1Rlw==
X-Gm-Message-State: AOAM5324hTCOd9zmHYFxDE5BQkKvuv2Fj8z2Nkf3shOzMo5NIydPkwcC
        2c73SElkczUYWNXMJ0qaGQ0cOeh5aTKadn5Blaz83OT+tnZOAw==
X-Google-Smtp-Source: ABdhPJzH1uk5mt3unzrLsnsk0/o8OG07PDE+dHFG2LUdXNPO1rtF+BG0gYE/xg0b5k6ZCGKBKspiRvnZkELGf4J0mYM=
X-Received: by 2002:a17:906:d7a2:: with SMTP id pk2mr34632979ejb.551.1620777488868;
 Tue, 11 May 2021 16:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210509233830.359134-1-linus.walleij@linaro.org>
 <YJh8s5rU2VE+DyQz@google.com> <CACRpkdbXuZOrKyDeBttkMzGvHJbnqVgAnQv=Z=Ui0fHQOOaUMg@mail.gmail.com>
 <YJnSCGN1vUAtjf8F@google.com> <CAHCN7xKPZHLSSehkm5W9MtYSv1S2wH2sNoOAD8yHHWjEpc6tpg@mail.gmail.com>
 <YJrye4Ji7CtZq8ds@google.com>
In-Reply-To: <YJrye4Ji7CtZq8ds@google.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 11 May 2021 18:57:57 -0500
Message-ID: <CAHCN7xKhEp9wYUqEatsCTEANzRVXZw-Sd1CTbCFY=_oJ08yg1A@mail.gmail.com>
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

On Tue, May 11, 2021 at 4:09 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, May 11, 2021 at 01:24:00PM -0500, Adam Ford wrote:
> > On Mon, May 10, 2021 at 7:39 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Mon, May 10, 2021 at 11:29:08AM +0200, Linus Walleij wrote:
> > > > On Mon, May 10, 2021 at 2:22 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > On Mon, May 10, 2021 at 01:38:30AM +0200, Linus Walleij wrote:
> > > >
> > > > > > This edge setting should come from the device tree not
> > > > > > the driver. Also, most device trees sets this to the
> > > > > > falling edge, which is contradictory to what is hardcoded.
> > > > >
> > > > > I see there are 2 possibilities:
> > > > >
> > > > > 1. The driver has never worked
> > > > > 2. DT interrupt annotation is wrong.
> > > > >
> > > > > It would be nice to know if we are dealing with 1 or 2, as in case of #2
> > > > > we need to adjust DTSes before this patch can be applied.
> > > >
> > > > I looked closer and unfortunately the mess and confusion
> > > > is bizarre.
> > > >
> > > > The DTS files we know of are:
> > > > arch/arm/boot/dts/am3517-som.dtsi - rising
> > > > arch/arm/boot/dts/imx28-tx28.dts - falling
> > > > arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi - low
> > > > arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi - low
> > > > arch/arm/boot/dts/imx53-tx53-x03x.dts - falling
> > > > arch/arm/boot/dts/imx6q-dhcom-som.dtsi - falling
> > > > arch/arm/boot/dts/imx6qdl-tx6.dtsi - none
> > > > arch/arm/boot/dts/imx6ul-tx6ul.dtsi - none
> > > > arch/arm/boot/dts/imx7d-nitrogen7.dts - falling
> > > > arch/arm/boot/dts/logicpd-som-lv.dtsi - rising
> > > > arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi - rising
> > > > arch/arm/boot/dts/omap3-gta04.dtsi - falling
> > > > arch/arm/boot/dts/omap3-n900.dts - rising
> > > > arch/arm/boot/dts/omap4-var-som-om44.dtsi - low
> > > > arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi - falling
> > > >
> > > > We can assume that some of this is the result of board
> > > > engineers introducing inverters on the board as is custom,
> > > > so the flags are actually correct when set to falling, just
> > > > that we don't model the inverter.
> > > >
> > > > In the case of imx6qdl-tx6 and imx6ul-tx6ul with "none" IRQ
> > > > type I assume this flag in the driver is actually necessary
> > > > for the device to work at all.
> > > >
> > > > In the cases where rising is set, the addition of the flag is
> > > > plain tautology, just setting what is already set.
> > > >
> > > > In the cases where falling are set the interrupts will arrive
> > > > on both edges (if the hardware can provide that, which is
> > > > not always the case) and as a result fire twice as many
> > > > interrupts as they should, probably with zero effect on the
> > > > second IRQ, just reporting nothing.
> > >
> > > That is not how we set up interrupts though. We only use
> > > platform-supplied trigger if caller did not specify trigger when calling
> > > request_irq().  From kernel/irq/manage.c::__setup_irq():
> > >
> > >         /*
> > >          * If the trigger type is not specified by the caller,
> > >          * then use the default for this interrupt.
> > >          */
> > >         if (!(new->flags & IRQF_TRIGGER_MASK))
> > >                 new->flags |= irqd_get_trigger_type(&desc->irq_data);
> > >
> > > So in our case, since driver specified IRQF_TRIGGER_RISING it is how
> > > interrupt line was configured, and what was in DTS had no effect.
> > >
> > > >
> > > > The combination with active low is weird. I wonder what
> > > > happens there.
> > > >
> > > > I am just confused now and have no idea what to do about
> > > > it...
> > > >
> > > > But I just CC all the Freescale and OMAP people who
> > > > seem to maintain these DTS files so they can clarify
> > > > how well assigned these edges, none and active low (!)
> > > > IRQs are.
> > >
> > > Hopefully they can confirm how the controller is wired on their boards
> > > and then we can correct invalid DTSes and then finally apply your patch
> > > to the driver.
> >
> > I reviewed the Logicpd Torpedo (DM3730) and there isn't an interter.
> > I changed the device tree entry for it to falling edge instead and
> > rising, and it continued to work perfectly.
> >
> > I'll review both the schematics and test the am3517-evm and the
> > logicpd som-lv, but I am going to expect the same results since
> > they'll all basically copy-paste of each other.
> >
> > Once I've completed my analysis, I'll post device tree updates for all
> > the logicpd stuff.
>
> OK, so this is quite complicated. According to the datasheets [1], [2]
> the ^PINTDAV pin is an active low pin, but in the default mode of
> touchcsreen the "value" of the pin is logical AND of ^PENIRQ (active
> low) and DAV [data available] (active high), which essentially turns it
> into "edge" interrupt with data being available when pin is
> transitioning from low to high. See fig 39 in [1] and 32 in [2].
> This explains all the confusion in DTSes.

The bindings in tsc2005.txt also state rising, but if you simply look
at the schematic symbol which shows active low, it's really easy for
me to see why there would be confusion.
>
> The driver is using this default mode, but this is not purely hardware
> configuration. I think what we need is to have DTS to specify level,
> either low or high, to allow handle presence of an inverter, and have
> driver check the assigned polarity and convert it to the right edge as
> long as it continues using the default method of handling of PINTDAV.
>
> WDYT?

Personally, I have never been a fan of hard-coding IRQ's or GPIO's,
because some hardware implementations may use inverters for various
reasons, so I am always in favor of actually using the device tree to
specify it.
Since the driver is currently hard-coded, it seems reasonable to me to
unify all the device trees with whatever the current hard-coded value
is first.  I think doing so would better reflect what's happening now.
If we leave the device trees unchanged, any code chance to handle the
IRQ differently may appear to break functionality when in fact, it
would potentially be an incorrect device tree.

I am happy to test code changes on the TSC2004's implementations that
I have if you need.

adam
>
> [1] https://www.ti.com/lit/ds/symlink/tsc2004.pdf
> [2] https://www.ti.com/lit/ds/symlink/tsc2005.pdf
>
> Thanks.
>
> --
> Dmitry
