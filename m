Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE32B1790BF
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 14:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387776AbgCDNBq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Mar 2020 08:01:46 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40547 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729175AbgCDNBq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Mar 2020 08:01:46 -0500
Received: by mail-ot1-f67.google.com with SMTP id x19so1886147otp.7;
        Wed, 04 Mar 2020 05:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opM8Fy++1GyzDxf+EPvf/wCqRO4m4i5PhEYBUHthtOc=;
        b=qMIHC9SBj3BlqcAS5KgiznPD16M9p5WxOiNy4VeLO13vJCIVFXBr6m/GrwrLi+q949
         KhojqiXeDxYsjVvjqOAsWjP8YDLoHqC5k/47EkoQSLx6iqPFN/3/03Mjs5GZ/c4+orxr
         IIchzrz7EkOmzHGk2LwMvtIlE0Sa6r1FDLHCbEJDCfYgUMpSz+8WSJE3Bf1d+qqWV6tj
         y/b3Jmt9+9lAdlqRRP75O37FM3FUpKhvibPtpgm/wSxBWQGG6tw7fGN78Tg7tZ7vJmQS
         M99dL19cdvMyIJnTPHl2qYfUKiGk+TrFNQl7giRo16PHimoHh2eP8zOdqX7hUe6A59TG
         ilEg==
X-Gm-Message-State: ANhLgQ34Jqu5/WzG0d1pUedwvH4EbLckvMLq+tjqUlP0f0MxmSzj+V3/
        Qlw1/mCLU2CxB74M/us+ZDIirwAFH940pnA+GDQ=
X-Google-Smtp-Source: ADFU+vsU78gBsz9h37aXui1CkbXyoggabSJPcX+7H2jLG4oKFbmh2MhIgJsb02nVhmQvV8gDrE04gu8SZZFHKiU3/u8=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr2229894ots.250.1583326905599;
 Wed, 04 Mar 2020 05:01:45 -0800 (PST)
MIME-Version: 1.0
References: <1580808174-11289-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <CAMuHMdVmsDVJRWp2uzVs0BKp-CjAcc6PS-1wBPT8J+UZr1O7CA@mail.gmail.com> <OSAPR01MB502876C5213B528A95A5B912AEE50@OSAPR01MB5028.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB502876C5213B528A95A5B912AEE50@OSAPR01MB5028.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Mar 2020 14:01:34 +0100
Message-ID: <CAMuHMdWarWksbXsAaGpG7wunGdNb7DA=EL2NPE4gNrS+P7zufg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: iwg22d-sodimm: Enable touchscreen
To:     Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marian,

On Wed, Mar 4, 2020 at 1:38 PM Marian-Cristian Rotariu
<marian-cristian.rotariu.rb@bp.renesas.com> wrote:
> > > --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > > +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > > @@ -128,6 +128,47 @@
> > >         status = "okay";
> > >         clock-frequency = <400000>;
> > >
> > > +       stmpe811@44 {
> > > +               compatible = "st,stmpe811";
> >
> > According to the DT bindings, this must be "st,stmpe-ts", but the example
> > also uses "st,stmpe811"?
>
> The device is a MFD and the bindings doc is here:
> Documentation/devicetree/bindings/mfd/stmpe.txt

Thanks, I hadn't considered that file when looking for "st,stmpe811",
due to the regex used in the document.

> You need to add its specific function as a child node of the mfd dt node. In our
> case it is a touchscreen:
> Documentation/devicetree/bindings/input/touchscreen/stmpe.txt

OK.

> > > +               reg = <0x44>;
> > > +               interrupt-parent = <&gpio4>;
> > > +               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> >
> > This should be "<4 IRQ_TYPE_LEVEL_LOW>", to refer to GP4_4.
>
> Indeed, I will fix it in v2.
>
> >
> > > +               irq-gpio = <&gpio4 4 IRQ_TYPE_LEVEL_LOW>;
> >
> > "irq-gpio" is not documented in the DT bindings.
>
> See "Documentation/devicetree/bindings/mfd/stmpe.txt"

I believe you cannot use the same GPIO as an interrupt and as a GPIO at
the same time.  Don't you get a -EBUSY somewhere?
Perhaps it worked due to the typo above?

As both interrupts and irq-gpio are documented to be optional
properties, probably they are mutually exclusive, and you can drop
irq-gpio?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
