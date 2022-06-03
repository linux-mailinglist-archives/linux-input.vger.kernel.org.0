Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8AF53CAC0
	for <lists+linux-input@lfdr.de>; Fri,  3 Jun 2022 15:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244676AbiFCNi3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jun 2022 09:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244689AbiFCNi3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jun 2022 09:38:29 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE79F183B1
        for <linux-input@vger.kernel.org>; Fri,  3 Jun 2022 06:38:27 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id c5-20020a1c3505000000b0038e37907b5bso6404429wma.0
        for <linux-input@vger.kernel.org>; Fri, 03 Jun 2022 06:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=a5qtjqk3oCOsLFQnzSyeB+P3p5IrJQXXpHb17O3nFyA=;
        b=IsGvuA5qx6PbXaJ3GLRo5mksXVMvyoH59njGpcZ8XEdpA7bR4S+sOWDTkDn9tqhw9A
         SObn9RsFHSdiXJYPfLPZSt9o1NB9lZZgqn2EYkP/eDPqfHGnFQ+lcP7ln8wbeCx72204
         vcTKM5+jqkfj7oIkxwuCM3bLsLR+GNwILBChNpb2IFmcfHxMKxo2Z/UEwqI+pTL434G/
         WiSJRlYJHsG8+AnkgprZOv6HZgRcx4TIQMOffMIT3sgn68k4CsJI62soNGq/WOXTVmTK
         2lBxxtmlu9C3vKmJGY3FEV87f70YR/ByXLXLJb+g2I6Kf0yQglbGpmvrNLfywAqfUS7J
         9USg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=a5qtjqk3oCOsLFQnzSyeB+P3p5IrJQXXpHb17O3nFyA=;
        b=bOONbIW4MYvoNOlw0DvG+dZoVMo8nAecWY1d1yQg9IH8NO98L6RbL5c6U53MpHzbGl
         K8/eq/KR/VMBjhqWJO2zCqqyadjwMfajHNw0t9MG0UWQtwlWe6lzmFS9m7UiYfkX66fP
         MmW/Zwx5JSZtGJS7pTFeKb1Zii4iuoPSEbGsBR/FrfuKhHXRybUOrylOkG8PNPrVCcrf
         bMVdVxWm8zUftaSGga8evskdkNyG6+AnVlCdARTDe/V5SogV4pD7rxEtIRTLtwqpn3y8
         OZRgrfE9siIA5av6loifn4Pmi+u2q34Pr4whY1LQw5Ou5YGtumhAOsJeXlV5CPPhleVE
         rH1A==
X-Gm-Message-State: AOAM532tBbGAR6gQmU2J4hl0KCcSUVwsIcqqw8WgccDXkqGrCJK0J2kk
        YhEAxBHOyBxL40JpwB9MX7o=
X-Google-Smtp-Source: ABdhPJxEe8t958tWF9lRKPfDnhIJmUSMvbLF5+CR8o3/y/dnXw1UAc5egQZLuzPrfMEnFlUZzlJE4w==
X-Received: by 2002:a05:600c:1c22:b0:397:5c31:6669 with SMTP id j34-20020a05600c1c2200b003975c316669mr37786196wms.78.1654263506447;
        Fri, 03 Jun 2022 06:38:26 -0700 (PDT)
Received: from p200300f6ef0219008f4342cbe8c8c65c.dip0.t-ipconnect.de (p200300f6ef0219008f4342cbe8c8c65c.dip0.t-ipconnect.de. [2003:f6:ef02:1900:8f43:42cb:e8c8:c65c])
        by smtp.gmail.com with ESMTPSA id m30-20020a05600c3b1e00b00395f15d993fsm13396276wms.5.2022.06.03.06.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 06:38:26 -0700 (PDT)
Message-ID: <b66fda1f80c77e7c38cd1d557d39eb3263e40000.camel@gmail.com>
Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
From:   Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>, Arnd Bergmann <arnd@arndb.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Nikolaus Voss <nv@vosn.de>
Date:   Fri, 03 Jun 2022 15:39:20 +0200
In-Reply-To: <294e3abdd3e8eb0423ea024cef4a437b1e09a65e.camel@gmail.com>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
         <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
         <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
         <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
         <YpMCh1Xje+jsny8j@google.com>
         <294e3abdd3e8eb0423ea024cef4a437b1e09a65e.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2022-06-03 at 15:34 +0200, Nuno S=C3=A1 wrote:
> On Sat, 2022-05-28 at 22:20 -0700, Dmitry Torokhov wrote:
> > On Fri, May 06, 2022 at 11:57:57AM +0000, Hennerich, Michael wrote:
> > >=20
> > >=20
> > > > -----Original Message-----
> > > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > > Sent: Donnerstag, 5. Mai 2022 09:50
> > > > To: Hennerich, Michael <Michael.Hennerich@analog.com>
> > > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Bogdan, Dragos
> > > > <Dragos.Bogdan@analog.com>; Sa, Nuno <Nuno.Sa@analog.com>; Arnd
> > > > Bergmann <arnd@arndb.de>; kernel@pengutronix.de; linux-
> > > > input@vger.kernel.org
> > > > Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
> > > >=20
> > > >=20
> > > > Hello Michael,
> > > >=20
> > > > On Thu, May 05, 2022 at 06:20:22AM +0000, Hennerich, Michael
> > > > wrote:
> > > > > > -----Original Message-----
> > > > > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > > > > Sent: Mittwoch, 4. Mai 2022 10:46
> > > > > > To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Hennerich,
> > > > > > Michael
> > > > > > <Michael.Hennerich@analog.com>
> > > > > > Cc: linux-input@vger.kernel.org; kernel@pengutronix.de;
> > > > > > Arnd
> > > > > > Bergmann <arnd@arndb.de>
> > > > > > Subject: [PATCH] Input: adp5588-keys: Remove unused driver
> > > > > >=20
> > > > > > The last user is gone since 2018 (commit 4ba66a976072
> > > > > > ("arch:
> > > > > > remove
> > > > > > blackfin port")). This is an i2c driver, so it could be
> > > > > > used
> > > > > > on a
> > > > > > non-blackfin machine, but this driver requires platform
> > > > > > data,
> > > > > > so it
> > > > > > cannot be bound using device tree.
> > > > >=20
> > > > > Hi Uwe,
> > > > >=20
> > > > > If we start removing drivers which obviously don't have a
> > > > > mainline
> > > > > in-tree user, we would upset up many users of these drivers.
> > > > > I agree on updating this driver to make platform data
> > > > > optional.
> > > > > We could provide a patch in a few days.
> > > >=20
> > > > Just to add some background why I stumbled over this driver: On
> > > > of my current
> > > > quests is to make i2c remove callbacks return void. As a
> > > > preparation for that I
> > > > work on updating all i2c drivers to return 0 in
> > > > .remove() to make the change to void have no side effects.
> > > >=20
> > > > One of the offenders is drivers/gpio/gpio-adp5588.c, which in
> > > > the
> > > > presence of a
> > > > pdata->teardown callback might return a non-zero value from
> > > > .remove(). While
> > > > looking at the pdata of possible devices I only found
> > > > drivers/input/keyboard/adp5588-keys.c.
> > > >=20
> > > > So the options for my quest are in increasing impact order:
> > > >=20
> > > > =C2=A0a) just warn if struct adp5588_gpio_platform_data::teardown
> > > > fails and
> > > > =C2=A0=C2=A0=C2=A0 still return 0 from .remove()
> > > > =C2=A0b) make struct adp5588_gpio_platform_data::teardown return
> > > > void
> > > > =C2=A0c) drop teardown support from adp5588_gpio_platform_data
> > > > =C2=A0d) drop platform support from gpio-adp5588
> > > > =C2=A0e) drop gpio-adp5588
> > > >=20
> > > > Currently I'd go for at least d).
> > > >=20
> > > > Having said that I think e) has a net benefit. If there is no
> > > > user left it reduces
> > > > maintainance burden. If there is a user left, they hopefully
> > > > will
> > > > tell us, we can
> > > > restore the driver from git history and then at least know a
> > > > tester for future
> > > > cleanups and changes.
> > >=20
> > > Hi Uwe,
> > >=20
> > > Thanks for the explanation.
> > >=20
> > > I know that there are users of this driver. But I admit, we
> > > should
> > > have earlier
> > > made platform_data support optional and also add proper dt
> > > bindings.
> > > We're in progress doing so. And in the meanwhile, I would prefer
> > > a
> > > less
> > > disruptive intermediate change. For example c) with the promise
> > > we're working on d).
> >=20
> > I am looking at the 2 drivers (adp5588-keys and gpio-adp5588) and I
> > think we need to add the missing functionality to adp5588-keys (and
> > make
> > keyboard part optional) and drop the gpio one.
> >=20
> > Thanks.
> >=20
>=20
> Hi,
>=20
> Just to note that I intend to start working on this next week so yes,
> this is not forgotten :).
>=20
> I think the only functionality we are missing is the interrupt
> generator capability (irqchip) which needs to be handled more
> carefully
> in the keys driver because, there, we also have the capability of
> adding GPIs to the keys event. I can see that this patch [1] also
> linked the irq generation to the keys event and I don't really think
> this is the way it's supposed to work looking at the datasheet. For
> interrupts generation, we should be using GPIN irqs.
>=20
> In the adp5588-keys driver we are already doing
> 'input_report_switch()'
> when we get an event for that key so I'm not sure if also "attaching"
> an interrupt to it is the way to go. The way I see it, the pin is
> either used as interrupt generator or key events...
>=20
> +cc=C2=A0 Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
>=20

Looks like it does not exist... Trying the other one in the patch:

+cc Nikolaus Voss <nv@vosn.de
>=20

