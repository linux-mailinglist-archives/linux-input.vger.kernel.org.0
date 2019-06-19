Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07AF4BA6A
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 15:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbfFSNqU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 09:46:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:43590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfFSNqT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 09:46:19 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B515F21855;
        Wed, 19 Jun 2019 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560951978;
        bh=EGpQTsqPwQGdZTB7N5b5GPJ8i5ITR6OC5D8Kmy/WY7c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KYGnwVOzJwrf7jsw0SwpgU39w8e3mw2/mKlMZzzitPi+qkwPfZPxCd63wqhXLXhvj
         iur5h0CLxfKmYcMNMwxMzxsv9ZIruS1thb+UgU416SeIruxRlhJAdtVYi1VHu76brZ
         FS/b6vKr1ZzwzUitsjI9bZmX2RRuS6TX2cgkv9y0=
Received: by mail-qk1-f178.google.com with SMTP id r6so10953938qkc.0;
        Wed, 19 Jun 2019 06:46:18 -0700 (PDT)
X-Gm-Message-State: APjAAAVzQwR1VDNVGs7aaRGTdsnJHS/jLgUOQPrGAGLyEaTh4vk/Yvg8
        zBhu4NxSxIYE+cwf16Yx3s0EkhS/SmtVB1yNAQ==
X-Google-Smtp-Source: APXvYqy1HaFYTFnpmoM6P6BmrzHo+o9aTo0pUVAEFk37D/WX2801HaoxI2MDt3bibRCPgOfpW+c4wsPUsnASzbaynyY=
X-Received: by 2002:ae9:f801:: with SMTP id x1mr9724166qkh.151.1560951977950;
 Wed, 19 Jun 2019 06:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com> <20190527161938.31871-5-leif.middelschulte@klsmartin.com>
 <20190614195859.GA6351@bogus> <aeaec8c92e8cea8ab9a5f7f0c70bbe2de81b037e.camel@klsmartin.com>
In-Reply-To: <aeaec8c92e8cea8ab9a5f7f0c70bbe2de81b037e.camel@klsmartin.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 19 Jun 2019 07:46:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJBqxfSJh0Htm3esnF9DnbnNHKFMxj=iLyGcuL88qepBw@mail.gmail.com>
Message-ID: <CAL_JsqJBqxfSJh0Htm3esnF9DnbnNHKFMxj=iLyGcuL88qepBw@mail.gmail.com>
Subject: Re: [PATCH 09/10] dt-bindings: input: touchscreen: stmpe: add
 tracking index
To:     "Middelschulte, Leif" <Leif.Middelschulte@klsmartin.com>
Cc:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 19, 2019 at 6:47 AM Middelschulte, Leif
<Leif.Middelschulte@klsmartin.com> wrote:
>
> Am Freitag, den 14.06.2019, 13:58 -0600 schrieb Rob Herring:
> > On Mon, May 27, 2019 at 06:19:37PM +0200, Leif Middelschulte wrote:
> > > The tracking index is a "minimum" distance two touch
> > > points need to have in order for the second to be valid.
> > > This adds the corresponding binding property documentation.
> > >
> > > Signed-off-by: Leif Middelschulte <
> > > leif.middelschulte@klsmartin.com
> > > >
> > > ---
> > >  .../bindings/input/touchscreen/stmpe.txt          | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> > > index 09d2d4f288cc..8696af35a7b8 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> > > @@ -42,6 +42,21 @@ Optional properties:
> > >                             The given window also affects the value range (limits) set
> > >                             within the input subsystem which, in turn, affects
> > >                             the input resolution calculation on both axes.
> > > +- st,tracking-index        : Minimal distance between the current touch position and the previous
> > > +                           touch position. If the distance is shorter than the tracking
> > > +                           index, it is discarded. The tracking is calculated by summation
> > > +                           of the horizontal and vertical movement.
> > > +                           If pressure reporting is enabled (X/Y/Z), an increase in pressure
> > > +                           override the movement tracking and report the new data set, even
> > > +                           if X/Y is within the previous tracking index.
> > > +                           0 -> disabled
> > > +                           1 -> 4
> > > +                           4 -> 8
> > > +                           3 -> 16
> > > +                           4 -> 32
> > > +                           5 -> 64
> > > +                           6 -> 92
> > > +                           7 -> 127
> >
> > This is what touchscreen-fuzz-x/y is for.
>
> The stmpe touchcontroller does not support handling each axis separately.
> Also it is not to be mistaken in its specific behavior (i.e. override)
> for the general `fuzz` parameter. However, should I rename it to `st,fuzz-x-y` or similar?
>
> AFAICS there[0] is no generic combined devicetree property, is there?

Can't you set both properties and require them to be the same value?

Rob
