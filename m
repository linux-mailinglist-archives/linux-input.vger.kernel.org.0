Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FA043C9A7
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 14:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237502AbhJ0MbG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 08:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbhJ0MbG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 08:31:06 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250F3C061570;
        Wed, 27 Oct 2021 05:28:41 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id r194so3404062iod.7;
        Wed, 27 Oct 2021 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+NSeNdDBdXhQ+pOeFQyEinJIauVf8QrglUD04cdh1Yc=;
        b=SISfreNzkthVhyjTuLbvT5Z4/YJUJ3DgeXJEIzD0NsprtBQgsHA1sEokqVMK/vfMID
         RzUdC8hw04JFZeSkxhQcvheLB+SPG//xrNHj7HEYG0HRph5VeClvnSWsqUzfS1PNTwkF
         yCJQ8X1pgi9RkZkB4h5zaSywPe7rY6ErGS/b3o3ocqSEd6sQnMaYHSXrx5/QrkTsqiXw
         vx5YQadcnmgRoaWHR8GLofvo9ahiaZ+7rIGQ/tqLl1YpfcnNOp4iqKx4740xi83c2gyC
         U/OVfrorZfe6U3dRCBkjSeLyrtydlPHbZYI0KMdZcDFiJjBmOi0TBNuiEKPgNL9qHQab
         MMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+NSeNdDBdXhQ+pOeFQyEinJIauVf8QrglUD04cdh1Yc=;
        b=sfU3zSPEc4xMKe4/ow63tsrM1o9QdDBQ4FXmKBSObU2Yp/yh7NmHrJguCGbFVcEoer
         8TMCs/ReA2IBLT5ecpk5ZIJ9VvzIc9OTKUoezY4sCqFo77/qUv35A75BWoWCZ2kZ1AsR
         HDRvjG5+Cs1ETJxBIDtTXVXgY6UwQoXy8GEAGJLQDvdkWwTRbf7Fp8yaZzUFllscu1Tl
         e/hFgWuJi/+XJBooahwCzOBELilZAL/myD4hDU0ByHkC9YUcly+QwFTnBMfQ6sfXuzI6
         kkfJ0V14J/GPFBvQImr5BF/wEV5Wp96rwyZ9F3WsS6B//lYQp3rHBRdSiQZDGuMnqeub
         j1ug==
X-Gm-Message-State: AOAM530H9IaQm2kb6ya1WSPzAHdA/IIlYiYcJc/bQhlbaq0M/6VUNY88
        hzt7KLhYjqCzisjDVjYOI2i7g3dKKiKZy8kxfIpC6kZ97I0ZJ2SCas4=
X-Google-Smtp-Source: ABdhPJw98rwqM4ZG10H38hCEsPp2u0wkY+aDpqsYZSWalN9/BonBVx7JrS+n6eijt6vNzO8lcgkePHudz1SzL1ZPFm0=
X-Received: by 2002:a6b:6e0e:: with SMTP id d14mr16933881ioh.57.1635337720530;
 Wed, 27 Oct 2021 05:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211025114214.44617-1-alistair@alistair23.me>
 <20211025114214.44617-3-alistair@alistair23.me> <CACRpkdYjBM9Pu=rO8SqfGvpP_fGeD=2YCqh+Rh-bOVq_k2S6CQ@mail.gmail.com>
 <20211026091616.7d9d05e4@aktux>
In-Reply-To: <20211026091616.7d9d05e4@aktux>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 27 Oct 2021 22:28:14 +1000
Message-ID: <CAKmqyKPkHC4sAt2O3b8NphrbwroZB=Dn8qEoHxtc_2=DpTkKPg@mail.gmail.com>
Subject: Re: [PATCH 2/4] Documentation: DT: bindings: input: Add documentation
 for cyttsp5
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Alistair Francis <alistair@alistair23.me>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 26, 2021 at 5:16 PM Andreas Kemnade <andreas@kemnade.info> wrot=
e:
>
> On Tue, 26 Oct 2021 01:18:24 +0200
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > Hi Alistair,
> >
> > On Mon, Oct 25, 2021 at 1:42 PM Alistair Francis <alistair@alistair23.m=
e> wrote:
> >
> > > From: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com>
> > >
> > > Add the Cypress TrueTouch Generation 5 touchscreen device tree bindin=
gs
> > > documentation. It can use I2C or SPI bus.
> > > This touchscreen can handle some defined zone that are designed and
> > > sent as button. To be able to customize the keycode sent, the
> > > "linux,code" property in a "button" sub-node can be used.
> > >
> > > Signed-off-by: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons=
.com>
> > > Message-Id: <20170529144538.29187-3-mylene.josserand@free-electrons.c=
om>
> > > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> >
> > > +title: Cypress cyttsp touchscreen controller, generation 5
> > (...)
> > > +  compatible:
> > > +    const: cypress,cyttsp5
> >
> > Is this the real product name? When I rewrote the bindings for
> > the original "CYTTSP", actually "Cypress TrueTouch Standard Product"
> > it came out that the actual product names were CY8CTMA340
> > and CY8CTMA341. "CYTTSP" was a marketing name for the
> > whole family.
> >
> > See
> > Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.=
yaml
> >
> > If the actual products have some product names such as
> > CY8* then use these as compatibles instead and just write in the
> > decription that it is Cypress TrueTouch Standard Product series 5.
> >
> Since I have uptreamed 4 devicetrees containing that touchscreen (and
> marked that as todo). I tried to look it up:
> https://fccid.io/NOIKBN249/Internal-Photos/Internal-Photos-3802584.pdf
>
> Page 4 might be interesting. Something below that 3d code (zbarimg does
> not recognize it) Peeling up the label reveals:
> TT21000
> -44LQI
> 1802 TWN
> 6491U0 (two illegible characters)
>
> You find it in the net:
> https://www.digipart.com/part/TT21000-48LQI36T

Thanks!

So I'll change the name to cypress,tt21000

Alistair

>
> Regards,
> Andreas
>
