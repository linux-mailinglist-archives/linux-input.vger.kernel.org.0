Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C7953CD03
	for <lists+linux-input@lfdr.de>; Fri,  3 Jun 2022 18:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343719AbiFCQPM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jun 2022 12:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343717AbiFCQPM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jun 2022 12:15:12 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B15D51334
        for <linux-input@vger.kernel.org>; Fri,  3 Jun 2022 09:15:10 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o17so7153974pla.6
        for <linux-input@vger.kernel.org>; Fri, 03 Jun 2022 09:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uSmdUyP5QeYKJxl8RkswkPwaxM9lM1pCE6CLrd1ARdE=;
        b=VsVZypuPB3JT9o7ndyQswfmHj3X9eGzrWkmRPRBo3ejsKGJX+j3aWN7upor8kJegMx
         yuMTxShYHq/ZY60F9fqu3IcrELm04mYntaUgd/1VZKFsNkyBMos8KdyBHLPUEjJggPRH
         gTGlp9vPfO7aTz+UzP0k3l8hYjpIIM8/m317nloAHMXGCwNjCtUUKpg8B3BG4dkWgRO1
         /ohEKYdxLWTSwtNYuQCE+vroJxDWmpB8DY6mISHIOP103dGlZPFPz2xPDs/m4fWAXkOb
         xhquJyr18NDL+GHxJTkVg1H20Q9WffZ/bgA3TFXgs4obBQ4LNVYFCg/Zq9drXR5hzBjM
         QqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uSmdUyP5QeYKJxl8RkswkPwaxM9lM1pCE6CLrd1ARdE=;
        b=VI3RnAVRE4GfZaOTWF55pZ4S9C/PSJ+LQg71dfYk5E59RoJ2dfcUaoNRcihO7zsjZD
         eIt/BS4sDaiQGNNbEYutxbOYD2Y6Vir8Tu+WCH5uvHuNx6SKZFesFIOpYtwJo7YdpwxH
         GOXfrlz5X9i3xMAIw3eEdiI5VDpWC7XlU1sV4tRPjEBvr8QwUMbNBntyBLmKa/vZFart
         3C1mplNC9EfJHU7E1CBbaeD3LhkfOhw+IKMyunCUSbu3sOAJp7z1iXDUcqtiJzejiiHK
         NcvTfZszFQmOh5P4H8ny7n+23FmXfzqKCjuyaYEJ3AwUpeVPYawo2rA8Tce+T22gQHUc
         5Bew==
X-Gm-Message-State: AOAM5322UXVQXb/Ur1bszDhNrFdCLQ6XoRuH+TqFBddOAN/po4l1XgQs
        Ypm7L4yplOkWhMmR23l9E9xK0sJM6VU=
X-Google-Smtp-Source: ABdhPJyfKeNSNwaUekFWMZuIMkZFUebbacaGp1mVa0JEOaZScgqQdYOt+Jcpr2HDCsTFVZQ5hFVdkQ==
X-Received: by 2002:a17:902:e947:b0:163:91e5:d3c with SMTP id b7-20020a170902e94700b0016391e50d3cmr10667580pll.39.1654272909395;
        Fri, 03 Jun 2022 09:15:09 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:aea8:f22c:dcaf:b60e])
        by smtp.gmail.com with ESMTPSA id y20-20020aa78054000000b0050dc7628140sm5720349pfm.26.2022.06.03.09.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 09:15:08 -0700 (PDT)
Date:   Fri, 3 Jun 2022 09:15:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc:     "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>, Arnd Bergmann <arnd@arndb.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Nikolaus Voss <nv@vosn.de>
Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
Message-ID: <YpoziY97pndS1srV@google.com>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
 <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
 <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <YpMCh1Xje+jsny8j@google.com>
 <294e3abdd3e8eb0423ea024cef4a437b1e09a65e.camel@gmail.com>
 <b66fda1f80c77e7c38cd1d557d39eb3263e40000.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b66fda1f80c77e7c38cd1d557d39eb3263e40000.camel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 03, 2022 at 03:39:20PM +0200, Nuno Sá wrote:
> On Fri, 2022-06-03 at 15:34 +0200, Nuno Sá wrote:
> > On Sat, 2022-05-28 at 22:20 -0700, Dmitry Torokhov wrote:
> > > On Fri, May 06, 2022 at 11:57:57AM +0000, Hennerich, Michael wrote:
> > > > 
> > > > 
> > > > > -----Original Message-----
> > > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > Sent: Donnerstag, 5. Mai 2022 09:50
> > > > > To: Hennerich, Michael <Michael.Hennerich@analog.com>
> > > > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Bogdan, Dragos
> > > > > <Dragos.Bogdan@analog.com>; Sa, Nuno <Nuno.Sa@analog.com>; Arnd
> > > > > Bergmann <arnd@arndb.de>; kernel@pengutronix.de; linux-
> > > > > input@vger.kernel.org
> > > > > Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
> > > > > 
> > > > > 
> > > > > Hello Michael,
> > > > > 
> > > > > On Thu, May 05, 2022 at 06:20:22AM +0000, Hennerich, Michael
> > > > > wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > > > Sent: Mittwoch, 4. Mai 2022 10:46
> > > > > > > To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Hennerich,
> > > > > > > Michael
> > > > > > > <Michael.Hennerich@analog.com>
> > > > > > > Cc: linux-input@vger.kernel.org; kernel@pengutronix.de;
> > > > > > > Arnd
> > > > > > > Bergmann <arnd@arndb.de>
> > > > > > > Subject: [PATCH] Input: adp5588-keys: Remove unused driver
> > > > > > > 
> > > > > > > The last user is gone since 2018 (commit 4ba66a976072
> > > > > > > ("arch:
> > > > > > > remove
> > > > > > > blackfin port")). This is an i2c driver, so it could be
> > > > > > > used
> > > > > > > on a
> > > > > > > non-blackfin machine, but this driver requires platform
> > > > > > > data,
> > > > > > > so it
> > > > > > > cannot be bound using device tree.
> > > > > > 
> > > > > > Hi Uwe,
> > > > > > 
> > > > > > If we start removing drivers which obviously don't have a
> > > > > > mainline
> > > > > > in-tree user, we would upset up many users of these drivers.
> > > > > > I agree on updating this driver to make platform data
> > > > > > optional.
> > > > > > We could provide a patch in a few days.
> > > > > 
> > > > > Just to add some background why I stumbled over this driver: On
> > > > > of my current
> > > > > quests is to make i2c remove callbacks return void. As a
> > > > > preparation for that I
> > > > > work on updating all i2c drivers to return 0 in
> > > > > .remove() to make the change to void have no side effects.
> > > > > 
> > > > > One of the offenders is drivers/gpio/gpio-adp5588.c, which in
> > > > > the
> > > > > presence of a
> > > > > pdata->teardown callback might return a non-zero value from
> > > > > .remove(). While
> > > > > looking at the pdata of possible devices I only found
> > > > > drivers/input/keyboard/adp5588-keys.c.
> > > > > 
> > > > > So the options for my quest are in increasing impact order:
> > > > > 
> > > > >  a) just warn if struct adp5588_gpio_platform_data::teardown
> > > > > fails and
> > > > >     still return 0 from .remove()
> > > > >  b) make struct adp5588_gpio_platform_data::teardown return
> > > > > void
> > > > >  c) drop teardown support from adp5588_gpio_platform_data
> > > > >  d) drop platform support from gpio-adp5588
> > > > >  e) drop gpio-adp5588
> > > > > 
> > > > > Currently I'd go for at least d).
> > > > > 
> > > > > Having said that I think e) has a net benefit. If there is no
> > > > > user left it reduces
> > > > > maintainance burden. If there is a user left, they hopefully
> > > > > will
> > > > > tell us, we can
> > > > > restore the driver from git history and then at least know a
> > > > > tester for future
> > > > > cleanups and changes.
> > > > 
> > > > Hi Uwe,
> > > > 
> > > > Thanks for the explanation.
> > > > 
> > > > I know that there are users of this driver. But I admit, we
> > > > should
> > > > have earlier
> > > > made platform_data support optional and also add proper dt
> > > > bindings.
> > > > We're in progress doing so. And in the meanwhile, I would prefer
> > > > a
> > > > less
> > > > disruptive intermediate change. For example c) with the promise
> > > > we're working on d).
> > > 
> > > I am looking at the 2 drivers (adp5588-keys and gpio-adp5588) and I
> > > think we need to add the missing functionality to adp5588-keys (and
> > > make
> > > keyboard part optional) and drop the gpio one.
> > > 
> > > Thanks.
> > > 
> > 
> > Hi,
> > 
> > Just to note that I intend to start working on this next week so yes,
> > this is not forgotten :).
> > 
> > I think the only functionality we are missing is the interrupt
> > generator capability (irqchip) which needs to be handled more
> > carefully
> > in the keys driver because, there, we also have the capability of
> > adding GPIs to the keys event. I can see that this patch [1] also
> > linked the irq generation to the keys event and I don't really think
> > this is the way it's supposed to work looking at the datasheet. For
> > interrupts generation, we should be using GPIN irqs.
> > 
> > In the adp5588-keys driver we are already doing
> > 'input_report_switch()'
> > when we get an event for that key so I'm not sure if also "attaching"
> > an interrupt to it is the way to go. The way I see it, the pin is
> > either used as interrupt generator or key events...
> > 
> > +cc  Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
> > 
> 
> Looks like it does not exist... Trying the other one in the patch:
> 
> +cc Nikolaus Voss <nv@vosn.de

I'd like remove special case of reporting switches from adp5588-keys.c
and instead implement enough of irqchip to allow gpio-keys to attach to
those pins and report switches from there.

Thanks.

-- 
Dmitry
