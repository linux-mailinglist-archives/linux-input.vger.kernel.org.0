Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C48943AD9F
	for <lists+linux-input@lfdr.de>; Tue, 26 Oct 2021 09:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbhJZH57 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Oct 2021 03:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbhJZH55 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Oct 2021 03:57:57 -0400
X-Greylist: delayed 2349 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Oct 2021 00:55:33 PDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60C6C061767
        for <linux-input@vger.kernel.org>; Tue, 26 Oct 2021 00:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QTaiuoG3E3gV8q8Ul32tNVdJglS7a/guFT+rX2ETcBw=; b=O8Z+ppBpu4lBC7JfJEw6bbdzOq
        0j18LPve6kDkhUfOIj7PsVjoy8CY6XAdiifo/m5FnCjpmgejog7LGjBJCUdnTFUd+Q8zaHtOIeClZ
        RuYrwTSk3JwDDimAQJNjnAN14adAAhNXy0WKBsayMGZt2H+HHx7O89Ib+8truDD+WdJE=;
Received: from p200300ccff1906001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff19:600:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mfGgz-0003NL-6W; Tue, 26 Oct 2021 09:16:17 +0200
Date:   Tue, 26 Oct 2021 09:16:16 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alistair Francis <alistair@alistair23.me>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        alistair23@gmail.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Subject: Re: [PATCH 2/4] Documentation: DT: bindings: input: Add
 documentation for cyttsp5
Message-ID: <20211026091616.7d9d05e4@aktux>
In-Reply-To: <CACRpkdYjBM9Pu=rO8SqfGvpP_fGeD=2YCqh+Rh-bOVq_k2S6CQ@mail.gmail.com>
References: <20211025114214.44617-1-alistair@alistair23.me>
        <20211025114214.44617-3-alistair@alistair23.me>
        <CACRpkdYjBM9Pu=rO8SqfGvpP_fGeD=2YCqh+Rh-bOVq_k2S6CQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 26 Oct 2021 01:18:24 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> Hi Alistair,
>=20
> On Mon, Oct 25, 2021 at 1:42 PM Alistair Francis <alistair@alistair23.me>=
 wrote:
>=20
> > From: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com>
> >
> > Add the Cypress TrueTouch Generation 5 touchscreen device tree bindings
> > documentation. It can use I2C or SPI bus.
> > This touchscreen can handle some defined zone that are designed and
> > sent as button. To be able to customize the keycode sent, the
> > "linux,code" property in a "button" sub-node can be used.
> >
> > Signed-off-by: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.c=
om>
> > Message-Id: <20170529144538.29187-3-mylene.josserand@free-electrons.com>
> > Signed-off-by: Alistair Francis <alistair@alistair23.me> =20
>=20
> > +title: Cypress cyttsp touchscreen controller, generation 5 =20
> (...)
> > +  compatible:
> > +    const: cypress,cyttsp5 =20
>=20
> Is this the real product name? When I rewrote the bindings for
> the original "CYTTSP", actually "Cypress TrueTouch Standard Product"
> it came out that the actual product names were CY8CTMA340
> and CY8CTMA341. "CYTTSP" was a marketing name for the
> whole family.
>=20
> See
> Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.ya=
ml
>=20
> If the actual products have some product names such as
> CY8* then use these as compatibles instead and just write in the
> decription that it is Cypress TrueTouch Standard Product series 5.
>=20
Since I have uptreamed 4 devicetrees containing that touchscreen (and
marked that as todo). I tried to look it up:
https://fccid.io/NOIKBN249/Internal-Photos/Internal-Photos-3802584.pdf

Page 4 might be interesting. Something below that 3d code (zbarimg does
not recognize it) Peeling up the label reveals:
TT21000
-44LQI
1802 TWN
6491U0 (two illegible characters)

You find it in the net:=20
https://www.digipart.com/part/TT21000-48LQI36T

Regards,
Andreas

