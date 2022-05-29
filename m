Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1C7536FC1
	for <lists+linux-input@lfdr.de>; Sun, 29 May 2022 07:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbiE2FUQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 May 2022 01:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiE2FUP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 May 2022 01:20:15 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06AAE9983A
        for <linux-input@vger.kernel.org>; Sat, 28 May 2022 22:20:12 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id v15so7376314pgk.11
        for <linux-input@vger.kernel.org>; Sat, 28 May 2022 22:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=h7TjAMCdfwRyci3st3UkeZHRbDz0DU25w/mePK6XMFc=;
        b=IHkGpFBO2SBECwYwNJCm3AcXJ6TlwnyK+imrCL9UyKlt3OC+va0ApIy10fCR5/kiAU
         9mNEdQeitAh/Ipd4h2BJK8lQAXGpXcNpLg6/Gr4jJtMFawB2OCT4bL666aKE4QpoPVT2
         ksZtufGcUopxawlYO+syJlljXh+R+35di37Hch63w0NKkXYuRxAa5NrP2Mz17UbG0R+R
         3SmabDCP9wOADX5TT1F0CT2hUGMYfNsoLUZZO7z2Dpbn+ej2RMYKsFd1T3Vn/KKEKdIZ
         mRvonFSzYLdp03Ivu1LzyLWE5vW3bvkoL6r317NRFqmenRQQ/hMam4spDSZb2zigVVJR
         EsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=h7TjAMCdfwRyci3st3UkeZHRbDz0DU25w/mePK6XMFc=;
        b=Rxi5nDAhzRyrclYQ+sYBI2k1lmHeT6u53sUCk3pqgEN744l+rmpzQ6CASS8M0weqFa
         sjfC5yRx4dmb86YYXiprzZjkpV58OxzR9SUa4rCf0YZwh6MrCcJQirL/oCqwm3MCLPn/
         JqdqZSlrTLbCqmASThV0OO2cJGoia9bTGYT1hmH0TvzB4kDw5mahIob01F41thGA+HPp
         olI4/ImKwtMZTNAW1vdNjAYKKn7CIqo6tF4YqFhRSXJ7wIVJnzoWAaYHchxkYRMmC3UQ
         1oibQLqmI1DzdU2mtcLgmjnXjXIKSRb4UPm5Z5PMqK8LHcATNu6KtCX6JANRlfwODHLu
         I92A==
X-Gm-Message-State: AOAM530pn6m+S3BerSnqCb/Bb40bVQmqlpPZGHaQ+FqvmBKdRsJXsE9+
        ifxRpZ8Uxaa8tMJLv4D/90c=
X-Google-Smtp-Source: ABdhPJx9EuyLBBrG9ayyBu/9eDGZ0AEziqw59W8rV8o/pH6ETEo75GXWNGhKMHY+xpO+PVdq7W9C5Q==
X-Received: by 2002:a05:6a00:2353:b0:518:96b7:ceb8 with SMTP id j19-20020a056a00235300b0051896b7ceb8mr35085916pfj.5.1653801611978;
        Sat, 28 May 2022 22:20:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:781a:4ab0:a93b:176b])
        by smtp.gmail.com with ESMTPSA id c22-20020a170902c2d600b0015e8d4eb2e8sm6430601pla.306.2022.05.28.22.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 22:20:09 -0700 (PDT)
Date:   Sat, 28 May 2022 22:20:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>, Arnd Bergmann <arnd@arndb.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
Message-ID: <YpMCh1Xje+jsny8j@google.com>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
 <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
 <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 06, 2022 at 11:57:57AM +0000, Hennerich, Michael wrote:
> 
> 
> > -----Original Message-----
> > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > Sent: Donnerstag, 5. Mai 2022 09:50
> > To: Hennerich, Michael <Michael.Hennerich@analog.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Bogdan, Dragos
> > <Dragos.Bogdan@analog.com>; Sa, Nuno <Nuno.Sa@analog.com>; Arnd
> > Bergmann <arnd@arndb.de>; kernel@pengutronix.de; linux-
> > input@vger.kernel.org
> > Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
> > 
> > 
> > Hello Michael,
> > 
> > On Thu, May 05, 2022 at 06:20:22AM +0000, Hennerich, Michael wrote:
> > > > -----Original Message-----
> > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > Sent: Mittwoch, 4. Mai 2022 10:46
> > > > To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Hennerich, Michael
> > > > <Michael.Hennerich@analog.com>
> > > > Cc: linux-input@vger.kernel.org; kernel@pengutronix.de; Arnd
> > > > Bergmann <arnd@arndb.de>
> > > > Subject: [PATCH] Input: adp5588-keys: Remove unused driver
> > > >
> > > > The last user is gone since 2018 (commit 4ba66a976072 ("arch: remove
> > > > blackfin port")). This is an i2c driver, so it could be used on a
> > > > non-blackfin machine, but this driver requires platform data, so it
> > > > cannot be bound using device tree.
> > >
> > > Hi Uwe,
> > >
> > > If we start removing drivers which obviously don't have a mainline
> > > in-tree user, we would upset up many users of these drivers.
> > > I agree on updating this driver to make platform data optional.
> > > We could provide a patch in a few days.
> > 
> > Just to add some background why I stumbled over this driver: On of my current
> > quests is to make i2c remove callbacks return void. As a preparation for that I
> > work on updating all i2c drivers to return 0 in
> > .remove() to make the change to void have no side effects.
> > 
> > One of the offenders is drivers/gpio/gpio-adp5588.c, which in the presence of a
> > pdata->teardown callback might return a non-zero value from .remove(). While
> > looking at the pdata of possible devices I only found
> > drivers/input/keyboard/adp5588-keys.c.
> > 
> > So the options for my quest are in increasing impact order:
> > 
> >  a) just warn if struct adp5588_gpio_platform_data::teardown fails and
> >     still return 0 from .remove()
> >  b) make struct adp5588_gpio_platform_data::teardown return void
> >  c) drop teardown support from adp5588_gpio_platform_data
> >  d) drop platform support from gpio-adp5588
> >  e) drop gpio-adp5588
> > 
> > Currently I'd go for at least d).
> > 
> > Having said that I think e) has a net benefit. If there is no user left it reduces
> > maintainance burden. If there is a user left, they hopefully will tell us, we can
> > restore the driver from git history and then at least know a tester for future
> > cleanups and changes.
> 
> Hi Uwe,
> 
> Thanks for the explanation.
> 
> I know that there are users of this driver. But I admit, we should have earlier
> made platform_data support optional and also add proper dt bindings.
> We're in progress doing so. And in the meanwhile, I would prefer a less
> disruptive intermediate change. For example c) with the promise we're working on d).

I am looking at the 2 drivers (adp5588-keys and gpio-adp5588) and I
think we need to add the missing functionality to adp5588-keys (and make
keyboard part optional) and drop the gpio one.

Thanks.

-- 
Dmitry
