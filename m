Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC7E53CAB3
	for <lists+linux-input@lfdr.de>; Fri,  3 Jun 2022 15:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243503AbiFCNdK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jun 2022 09:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244213AbiFCNdJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jun 2022 09:33:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B9BD109
        for <linux-input@vger.kernel.org>; Fri,  3 Jun 2022 06:33:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u3so10441275wrg.3
        for <linux-input@vger.kernel.org>; Fri, 03 Jun 2022 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=bWQiFfbpPrI+EX533rnfVffO/KwES1OR4rCF3rjfY6k=;
        b=YVxE/jziX8J46RwHhyCI2yu5WgibcsS9hLPHuEmkOmor/rjkviUuCJhoA293X6MKfa
         AD9zAEp13sTpjTwtW1JmsgMcctUJyeuysq+x5WiNKv/qywJGKVdJBcCD+Hna0nJJR9U3
         23bDpxiDhGhBc0Z6UiognqCmszOjP9O/MpYw37e1WSxGjp8VBIISMRfiE/NFC8/AnEke
         d1xWjMkDs4l/odwq65GyJsTJbfyV9INX01H/m/GVf1KAVq/7ibTvg1kFzAc31bSFhtMn
         ADDRsz/Ci5vWKGO7paC7A4rEeXQNPxAiT8rFrQK6s7mNIpsg1Nnhh+Gkpw6RbZ2GjsDj
         0z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=bWQiFfbpPrI+EX533rnfVffO/KwES1OR4rCF3rjfY6k=;
        b=gP0NTtHwkaTng86ssrnS2yLTJg5+j/HMFGQRh4BggnOKYPgrkaOIUw/FA/gC2o47/G
         n3m+8FnBrASmwZ4GcMuE8zTYUVT93Qfbaew86i8y/nWIvRcawgreEHCfrkaRJIHHRF1N
         0FVgutElkgRI5aimEAMpYTN1npAlW5mCenFVF8OCKOJwGW5wK9uej2gb+VQFIsNXcmbn
         nn510QnEAdWeUysyrN+sWi8hQfYxEgcP7eduBqKzBW5+XfLfcSi8b2eGy0As2Kq+W1q9
         TJOfrD42VO5TfCfFkWaZPmHvmDpRMoBee1QfQsMifBA1FhVnGMbk3ZVU9KmwR7sLRnKk
         cZHg==
X-Gm-Message-State: AOAM530dkxx6yApsbBrUlf+pRPjDdQEoiAqfk/xl4gqnoR1G5pu0xhSz
        YBF5H8wGtEkliFmrayMOTMxh/bFjxGfBmVT6
X-Google-Smtp-Source: ABdhPJyCJcsfhNWPyvsE3zv0fSA+NdtDyv28UJJJGybpjsOBhCj6ZaDn3I0/nOz9awdHssmDOI2i6A==
X-Received: by 2002:adf:d1ec:0:b0:210:2c68:a06d with SMTP id g12-20020adfd1ec000000b002102c68a06dmr8278329wrd.37.1654263186748;
        Fri, 03 Jun 2022 06:33:06 -0700 (PDT)
Received: from p200300f6ef0219008f4342cbe8c8c65c.dip0.t-ipconnect.de (p200300f6ef0219008f4342cbe8c8c65c.dip0.t-ipconnect.de. [2003:f6:ef02:1900:8f43:42cb:e8c8:c65c])
        by smtp.gmail.com with ESMTPSA id n4-20020a1c7204000000b003949dbc3790sm9758801wmc.18.2022.06.03.06.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 06:33:06 -0700 (PDT)
Message-ID: <294e3abdd3e8eb0423ea024cef4a437b1e09a65e.camel@gmail.com>
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
        Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Date:   Fri, 03 Jun 2022 15:34:01 +0200
In-Reply-To: <YpMCh1Xje+jsny8j@google.com>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
         <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
         <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
         <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
         <YpMCh1Xje+jsny8j@google.com>
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

On Sat, 2022-05-28 at 22:20 -0700, Dmitry Torokhov wrote:
> On Fri, May 06, 2022 at 11:57:57AM +0000, Hennerich, Michael wrote:
> >=20
> >=20
> > > -----Original Message-----
> > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > Sent: Donnerstag, 5. Mai 2022 09:50
> > > To: Hennerich, Michael <Michael.Hennerich@analog.com>
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Bogdan, Dragos
> > > <Dragos.Bogdan@analog.com>; Sa, Nuno <Nuno.Sa@analog.com>; Arnd
> > > Bergmann <arnd@arndb.de>; kernel@pengutronix.de; linux-
> > > input@vger.kernel.org
> > > Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
> > >=20
> > >=20
> > > Hello Michael,
> > >=20
> > > On Thu, May 05, 2022 at 06:20:22AM +0000, Hennerich, Michael
> > > wrote:
> > > > > -----Original Message-----
> > > > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > > > Sent: Mittwoch, 4. Mai 2022 10:46
> > > > > To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Hennerich,
> > > > > Michael
> > > > > <Michael.Hennerich@analog.com>
> > > > > Cc: linux-input@vger.kernel.org; kernel@pengutronix.de; Arnd
> > > > > Bergmann <arnd@arndb.de>
> > > > > Subject: [PATCH] Input: adp5588-keys: Remove unused driver
> > > > >=20
> > > > > The last user is gone since 2018 (commit 4ba66a976072 ("arch:
> > > > > remove
> > > > > blackfin port")). This is an i2c driver, so it could be used
> > > > > on a
> > > > > non-blackfin machine, but this driver requires platform data,
> > > > > so it
> > > > > cannot be bound using device tree.
> > > >=20
> > > > Hi Uwe,
> > > >=20
> > > > If we start removing drivers which obviously don't have a
> > > > mainline
> > > > in-tree user, we would upset up many users of these drivers.
> > > > I agree on updating this driver to make platform data optional.
> > > > We could provide a patch in a few days.
> > >=20
> > > Just to add some background why I stumbled over this driver: On
> > > of my current
> > > quests is to make i2c remove callbacks return void. As a
> > > preparation for that I
> > > work on updating all i2c drivers to return 0 in
> > > .remove() to make the change to void have no side effects.
> > >=20
> > > One of the offenders is drivers/gpio/gpio-adp5588.c, which in the
> > > presence of a
> > > pdata->teardown callback might return a non-zero value from
> > > .remove(). While
> > > looking at the pdata of possible devices I only found
> > > drivers/input/keyboard/adp5588-keys.c.
> > >=20
> > > So the options for my quest are in increasing impact order:
> > >=20
> > > =C2=A0a) just warn if struct adp5588_gpio_platform_data::teardown
> > > fails and
> > > =C2=A0=C2=A0=C2=A0 still return 0 from .remove()
> > > =C2=A0b) make struct adp5588_gpio_platform_data::teardown return void
> > > =C2=A0c) drop teardown support from adp5588_gpio_platform_data
> > > =C2=A0d) drop platform support from gpio-adp5588
> > > =C2=A0e) drop gpio-adp5588
> > >=20
> > > Currently I'd go for at least d).
> > >=20
> > > Having said that I think e) has a net benefit. If there is no
> > > user left it reduces
> > > maintainance burden. If there is a user left, they hopefully will
> > > tell us, we can
> > > restore the driver from git history and then at least know a
> > > tester for future
> > > cleanups and changes.
> >=20
> > Hi Uwe,
> >=20
> > Thanks for the explanation.
> >=20
> > I know that there are users of this driver. But I admit, we should
> > have earlier
> > made platform_data support optional and also add proper dt
> > bindings.
> > We're in progress doing so. And in the meanwhile, I would prefer a
> > less
> > disruptive intermediate change. For example c) with the promise
> > we're working on d).
>=20
> I am looking at the 2 drivers (adp5588-keys and gpio-adp5588) and I
> think we need to add the missing functionality to adp5588-keys (and
> make
> keyboard part optional) and drop the gpio one.
>=20
> Thanks.
>=20

Hi,

Just to note that I intend to start working on this next week so yes,
this is not forgotten :).

I think the only functionality we are missing is the interrupt
generator capability (irqchip) which needs to be handled more carefully
in the keys driver because, there, we also have the capability of
adding GPIs to the keys event. I can see that this patch [1] also
linked the irq generation to the keys event and I don't really think
this is the way it's supposed to work looking at the datasheet. For
interrupts generation, we should be using GPIN irqs.

In the adp5588-keys driver we are already doing 'input_report_switch()'
when we get an event for that key so I'm not sure if also "attaching"
an interrupt to it is the way to go. The way I see it, the pin is
either used as interrupt generator or key events...

+cc  Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>

[1]:
https://lore.kernel.org/all/3230ace6f820fccadb51097ae9ba9f5ee247d79b.154937=
9326.git.nikolaus.voss@loewensteinmedical.de/

- Nuno S=C3=A1
