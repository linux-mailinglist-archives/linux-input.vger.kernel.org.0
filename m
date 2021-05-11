Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E49337B08F
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 23:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhEKVK0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 17:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhEKVK0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 17:10:26 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3D5C061574
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 14:09:19 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id i14so16663891pgk.5
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TlrKkozj1QZ61N8+O/f9bA13eX8eTv6izDyMzuisg3s=;
        b=i2TjoK5rCYIELX5hIhFl7iu3MXH6UXLSQhmI4GAkIPeOZeo4kPgVwX/7cJiu7OwNYr
         vHp19CFWweE0M6nQRh3Dpb+1FNMvtR0J3mujL26yLraR9IwOAYxgmSLN4kWPzbTGjgoc
         +IdOnbP5a6np9eirzP40r5AGQEPJ3bIfBwa5OC46iH6CI+e5cnA5ZpiiC5N2anOjtUBv
         Rt2CmSLKwIzAXHIvMiFIB8RTPShipNtYFm8btC4MO5bArFiXKszFZoBmAeNMhkzmyLaD
         LKU/9hcBRXaLg8Nlq5bAptjWq7Ou2u8VZm688/Fl2AAx1fY1hhpuKgKv//x5PaJlazp1
         k6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TlrKkozj1QZ61N8+O/f9bA13eX8eTv6izDyMzuisg3s=;
        b=pB44CwL87h2PS9lS1cx7kWHYcaMd8cjY4DleOjhY4UvG9a61r+HtsgFVT1hnx1v/XA
         OINEcD2341lujr0IhzNoDusVW1h5w068fa8JZ3yExilWhRqs00CoBRuCzUaTv1f3xBme
         eBH9JjeZgUu4C2xgkM/IhrwsyGs4PEjgD04QGTWt/cdrXCgavy3lhzScphO6phBTdqOv
         fgCqSf318gmvhtTvW7mI2ifYQD/lFaREaXUskaoUsF5FoO3JWqOPidEKKiCVl8R/mSfV
         BIW8J0mtO/UgZADOUX04AaIQroyEd9uDuVUhgQmg6JxKugTd7O+12z7m1S51l9gNWfzR
         rKwQ==
X-Gm-Message-State: AOAM533w/1LOS5AsrZIMNHEpCTx7Pnq8Ndb7R7FpDqSLkLdY9DySfJNx
        7ltyIMjtc8Kp4SzDFgA74x4=
X-Google-Smtp-Source: ABdhPJy39V2VtDQV3JtRgaRZPuhrvH8/a2/ar6DAl0cghryhDaX3NvGhdlJa5w8+EQNVQaoWT9YW4g==
X-Received: by 2002:a63:ed17:: with SMTP id d23mr32953384pgi.107.1620767358694;
        Tue, 11 May 2021 14:09:18 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:206:cca1:1e8c:52e0])
        by smtp.gmail.com with ESMTPSA id u22sm3355543pfl.118.2021.05.11.14.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 14:09:17 -0700 (PDT)
Date:   Tue, 11 May 2021 14:09:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] Input: tsc200x: Drop hard-coded IRQ edge
Message-ID: <YJrye4Ji7CtZq8ds@google.com>
References: <20210509233830.359134-1-linus.walleij@linaro.org>
 <YJh8s5rU2VE+DyQz@google.com>
 <CACRpkdbXuZOrKyDeBttkMzGvHJbnqVgAnQv=Z=Ui0fHQOOaUMg@mail.gmail.com>
 <YJnSCGN1vUAtjf8F@google.com>
 <CAHCN7xKPZHLSSehkm5W9MtYSv1S2wH2sNoOAD8yHHWjEpc6tpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKPZHLSSehkm5W9MtYSv1S2wH2sNoOAD8yHHWjEpc6tpg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 11, 2021 at 01:24:00PM -0500, Adam Ford wrote:
> On Mon, May 10, 2021 at 7:39 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Mon, May 10, 2021 at 11:29:08AM +0200, Linus Walleij wrote:
> > > On Mon, May 10, 2021 at 2:22 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > > On Mon, May 10, 2021 at 01:38:30AM +0200, Linus Walleij wrote:
> > >
> > > > > This edge setting should come from the device tree not
> > > > > the driver. Also, most device trees sets this to the
> > > > > falling edge, which is contradictory to what is hardcoded.
> > > >
> > > > I see there are 2 possibilities:
> > > >
> > > > 1. The driver has never worked
> > > > 2. DT interrupt annotation is wrong.
> > > >
> > > > It would be nice to know if we are dealing with 1 or 2, as in case of #2
> > > > we need to adjust DTSes before this patch can be applied.
> > >
> > > I looked closer and unfortunately the mess and confusion
> > > is bizarre.
> > >
> > > The DTS files we know of are:
> > > arch/arm/boot/dts/am3517-som.dtsi - rising
> > > arch/arm/boot/dts/imx28-tx28.dts - falling
> > > arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi - low
> > > arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi - low
> > > arch/arm/boot/dts/imx53-tx53-x03x.dts - falling
> > > arch/arm/boot/dts/imx6q-dhcom-som.dtsi - falling
> > > arch/arm/boot/dts/imx6qdl-tx6.dtsi - none
> > > arch/arm/boot/dts/imx6ul-tx6ul.dtsi - none
> > > arch/arm/boot/dts/imx7d-nitrogen7.dts - falling
> > > arch/arm/boot/dts/logicpd-som-lv.dtsi - rising
> > > arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi - rising
> > > arch/arm/boot/dts/omap3-gta04.dtsi - falling
> > > arch/arm/boot/dts/omap3-n900.dts - rising
> > > arch/arm/boot/dts/omap4-var-som-om44.dtsi - low
> > > arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi - falling
> > >
> > > We can assume that some of this is the result of board
> > > engineers introducing inverters on the board as is custom,
> > > so the flags are actually correct when set to falling, just
> > > that we don't model the inverter.
> > >
> > > In the case of imx6qdl-tx6 and imx6ul-tx6ul with "none" IRQ
> > > type I assume this flag in the driver is actually necessary
> > > for the device to work at all.
> > >
> > > In the cases where rising is set, the addition of the flag is
> > > plain tautology, just setting what is already set.
> > >
> > > In the cases where falling are set the interrupts will arrive
> > > on both edges (if the hardware can provide that, which is
> > > not always the case) and as a result fire twice as many
> > > interrupts as they should, probably with zero effect on the
> > > second IRQ, just reporting nothing.
> >
> > That is not how we set up interrupts though. We only use
> > platform-supplied trigger if caller did not specify trigger when calling
> > request_irq().  From kernel/irq/manage.c::__setup_irq():
> >
> >         /*
> >          * If the trigger type is not specified by the caller,
> >          * then use the default for this interrupt.
> >          */
> >         if (!(new->flags & IRQF_TRIGGER_MASK))
> >                 new->flags |= irqd_get_trigger_type(&desc->irq_data);
> >
> > So in our case, since driver specified IRQF_TRIGGER_RISING it is how
> > interrupt line was configured, and what was in DTS had no effect.
> >
> > >
> > > The combination with active low is weird. I wonder what
> > > happens there.
> > >
> > > I am just confused now and have no idea what to do about
> > > it...
> > >
> > > But I just CC all the Freescale and OMAP people who
> > > seem to maintain these DTS files so they can clarify
> > > how well assigned these edges, none and active low (!)
> > > IRQs are.
> >
> > Hopefully they can confirm how the controller is wired on their boards
> > and then we can correct invalid DTSes and then finally apply your patch
> > to the driver.
> 
> I reviewed the Logicpd Torpedo (DM3730) and there isn't an interter.
> I changed the device tree entry for it to falling edge instead and
> rising, and it continued to work perfectly.
> 
> I'll review both the schematics and test the am3517-evm and the
> logicpd som-lv, but I am going to expect the same results since
> they'll all basically copy-paste of each other.
> 
> Once I've completed my analysis, I'll post device tree updates for all
> the logicpd stuff.

OK, so this is quite complicated. According to the datasheets [1], [2]
the ^PINTDAV pin is an active low pin, but in the default mode of
touchcsreen the "value" of the pin is logical AND of ^PENIRQ (active
low) and DAV [data available] (active high), which essentially turns it
into "edge" interrupt with data being available when pin is
transitioning from low to high. See fig 39 in [1] and 32 in [2].
This explains all the confusion in DTSes.

The driver is using this default mode, but this is not purely hardware
configuration. I think what we need is to have DTS to specify level,
either low or high, to allow handle presence of an inverter, and have
driver check the assigned polarity and convert it to the right edge as
long as it continues using the default method of handling of PINTDAV.

WDYT?

[1] https://www.ti.com/lit/ds/symlink/tsc2004.pdf
[2] https://www.ti.com/lit/ds/symlink/tsc2005.pdf

Thanks.

-- 
Dmitry
