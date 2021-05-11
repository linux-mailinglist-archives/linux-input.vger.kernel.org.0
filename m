Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D69379B9D
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 02:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhEKAjo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 20:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhEKAjn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 20:39:43 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E547CC061574
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 17:38:37 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id gj14so10724959pjb.5
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 17:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dJM8F61UuigzNguogv0R+++DBzre3BtNoj2mtvsmVh4=;
        b=CWYKVThI/hOLDTms5P7XmHZHuaJI23wlOOGoR8cyr7hFIdWGH9CoeIJTUfKCS4f1SN
         M7dGnYYZa2D83+2QbfPmK1TJGSTktXGNAMvu7GVswX3AlWw2YgeAiPZZdJ47vwQKObk8
         U4drG/KNtrJJObXRYXxkNJPi9QDJgxq7yaKCknBzpPsNONLHo/S60xiPFMekyxDZIDbU
         ZJen7m78O/tumsPKSMZoG8t/Ng7fJRYglj/KuUPZ90lEta9R+2kX01aXuaWepaWDweGK
         GBj7/hPCjVe/4j5VYOdHpVDjCIlqSvRCgM+qe0ExR50sJ49ZFGdRpkRRDEpK2iEYPn8p
         kPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dJM8F61UuigzNguogv0R+++DBzre3BtNoj2mtvsmVh4=;
        b=mQ21mjKAZtxMojReHk2GxH5p/hqz8ESfcznRM/8lIGomHbdI12dKsMC7hZhvMa8Jiu
         t+fvm+hmKC/j9/VjP2twWvaA1hhlsFwhEwGDfUl5PPOQfwhbv9CtL9kAFieup8g8EbD5
         i1U/hTlrPLbzOG6c8p1ydd1ovkdpBGJsf4X7DpjiK33/d5xnjrmW49zGTBxwwmzAvj3G
         oI2FcQnc6FLD/MvDI11R469v4af1hTPaOvzQ1YsJhtW4H9t3iAIr8dl2DzSfLs3KQsAP
         smdFlCdVzg5NH8ezzB3iiW4qPQxbSon2nGiY5CdOdeLp3HEd7HVJibnnGd0oLWb/60RN
         XOMw==
X-Gm-Message-State: AOAM531QsRMw1RrqSBWnVRhwUwCZcK9jSsd7hWt5+1hhGj0ca3qPMgsa
        CDprJSU9WpaCLVgXo9K6RtHu5884KFQ=
X-Google-Smtp-Source: ABdhPJxVl7d7IAtblDXUTSF/geDqAMR0SrbXMiKoGKNVrEfp4p+0fv04zFDTrwZSSIGGf9iz5/gltw==
X-Received: by 2002:a17:903:230d:b029:ef:5d8f:f2c4 with SMTP id d13-20020a170903230db02900ef5d8ff2c4mr499798plh.62.1620693517312;
        Mon, 10 May 2021 17:38:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:206:cca1:1e8c:52e0])
        by smtp.gmail.com with ESMTPSA id w81sm11893137pfc.106.2021.05.10.17.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 17:38:35 -0700 (PDT)
Date:   Mon, 10 May 2021 17:38:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] Input: tsc200x: Drop hard-coded IRQ edge
Message-ID: <YJnSCGN1vUAtjf8F@google.com>
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

On Mon, May 10, 2021 at 11:29:08AM +0200, Linus Walleij wrote:
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

That is not how we set up interrupts though. We only use
platform-supplied trigger if caller did not specify trigger when calling
request_irq().  From kernel/irq/manage.c::__setup_irq():

	/*
	 * If the trigger type is not specified by the caller,
	 * then use the default for this interrupt.
	 */
	if (!(new->flags & IRQF_TRIGGER_MASK))
		new->flags |= irqd_get_trigger_type(&desc->irq_data);

So in our case, since driver specified IRQF_TRIGGER_RISING it is how
interrupt line was configured, and what was in DTS had no effect.

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

Hopefully they can confirm how the controller is wired on their boards
and then we can correct invalid DTSes and then finally apply your patch
to the driver.

Thanks.

-- 
Dmitry
