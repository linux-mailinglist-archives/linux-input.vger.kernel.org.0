Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185DB378FA3
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 15:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhEJNwG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 09:52:06 -0400
Received: from muru.com ([72.249.23.125]:53926 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237650AbhEJNmx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 09:42:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8977880C7;
        Mon, 10 May 2021 13:41:38 +0000 (UTC)
Date:   Mon, 10 May 2021 16:41:32 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH] Input: tsc200x: Drop hard-coded IRQ edge
Message-ID: <YJk4DFCYo1fW9Vjn@atomide.com>
References: <20210509233830.359134-1-linus.walleij@linaro.org>
 <YJh8s5rU2VE+DyQz@google.com>
 <CACRpkdbXuZOrKyDeBttkMzGvHJbnqVgAnQv=Z=Ui0fHQOOaUMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbXuZOrKyDeBttkMzGvHJbnqVgAnQv=Z=Ui0fHQOOaUMg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

* Linus Walleij <linus.walleij@linaro.org> [210510 09:29]:
> On Mon, May 10, 2021 at 2:22 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Mon, May 10, 2021 at 01:38:30AM +0200, Linus Walleij wrote:
> 
> > > This edge setting should come from the device tree not
> > > the driver. Also, most device trees sets this to the
> > > falling edge, which is contradictory to what is hardcoded.
> >
> > I see there are 2 possibilities:
> >
> > 1. The driver has never worked
> > 2. DT interrupt annotation is wrong.
> >
> > It would be nice to know if we are dealing with 1 or 2, as in case of #2
> > we need to adjust DTSes before this patch can be applied.
> 
> I looked closer and unfortunately the mess and confusion
> is bizarre.
> 
> The DTS files we know of are:
> arch/arm/boot/dts/am3517-som.dtsi - rising
> arch/arm/boot/dts/imx28-tx28.dts - falling
> arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi - low
> arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi - low
> arch/arm/boot/dts/imx53-tx53-x03x.dts - falling
> arch/arm/boot/dts/imx6q-dhcom-som.dtsi - falling
> arch/arm/boot/dts/imx6qdl-tx6.dtsi - none
> arch/arm/boot/dts/imx6ul-tx6ul.dtsi - none
> arch/arm/boot/dts/imx7d-nitrogen7.dts - falling
> arch/arm/boot/dts/logicpd-som-lv.dtsi - rising
> arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi - rising
> arch/arm/boot/dts/omap3-gta04.dtsi - falling
> arch/arm/boot/dts/omap3-n900.dts - rising
> arch/arm/boot/dts/omap4-var-som-om44.dtsi - low
> arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi - falling
> 
> We can assume that some of this is the result of board
> engineers introducing inverters on the board as is custom,
> so the flags are actually correct when set to falling, just
> that we don't model the inverter.
> 
> In the case of imx6qdl-tx6 and imx6ul-tx6ul with "none" IRQ
> type I assume this flag in the driver is actually necessary
> for the device to work at all.
> 
> In the cases where rising is set, the addition of the flag is
> plain tautology, just setting what is already set.
> 
> In the cases where falling are set the interrupts will arrive
> on both edges (if the hardware can provide that, which is
> not always the case) and as a result fire twice as many
> interrupts as they should, probably with zero effect on the
> second IRQ, just reporting nothing.
> 
> The combination with active low is weird. I wonder what
> happens there.
> 
> I am just confused now and have no idea what to do about
> it...
> 
> But I just CC all the Freescale and OMAP people who
> seem to maintain these DTS files so they can clarify
> how well assigned these edges, none and active low (!)
> IRQs are.

Maybe the GTA04 or LogicPD folks can check the interrupt edge
direction for tsc2005 on the device end to see if inversion
happens. So adding some more people to Cc.

Looks like at least the tsc2005 data sheet says:

"Interrupt output. Data available or PENIRQ depends on setting.
 Pin polarity with active low."

So it seems the dts configuration should have level active low
for the GPIO interrupt unless the hardware inverts it somewhere.

If the edge configuration for a GPIO interrupt has been done
for tsc2005 for PM wake purposes, there should be no longer
need for it at least on omaps. Folks can just configure a
dedicated wakeirq with interrupts-extended dts property and
the i2c framework will handle that automatically :) There are
some examples if you grep dts files for '"wakeup"'.

Regards,

Tony
