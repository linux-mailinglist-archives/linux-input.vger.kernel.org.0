Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8A228BE75
	for <lists+linux-input@lfdr.de>; Mon, 12 Oct 2020 18:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403845AbgJLQwO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Oct 2020 12:52:14 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35752 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390683AbgJLQwO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Oct 2020 12:52:14 -0400
Received: by mail-ed1-f66.google.com with SMTP id cq12so17746914edb.2;
        Mon, 12 Oct 2020 09:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3mboFW4RncTKtOa1W24m1Ae7YyE66jcNb5+APhjiUo8=;
        b=TrFiW84TQByeVqD+r/u6Dikvtsw+SSUrb3fD1oAMSmQLye5TpAMe0S328tHQZHkKZu
         62w8UyLsbmLCo+g9Xm9MD4hzVoTfuej4AclSEYbme/86OcLxhQ+gtQsFkh33kAxbrB3R
         WkU6plJRoyc9szXsj96GBPNlfBfwWjeUD+cbc0iGfr/rNacd69LJXogZvoz+je28VKWL
         8iOFVEowAGFfK4KXXb1fGLHGEI/TnXol9ZCe0OZa7Q9BquLdUYTKCGW5HuxzNzXRlBNu
         RAFPxx5nZPJ4CEp4lpXuRonql3vSVsMkfHeMdY6Ny+1tR+tfA/D8CbWY3K4u+sp6JXP1
         lu0Q==
X-Gm-Message-State: AOAM532VXj1t5abkHx/Rpjp/wcfyqavBcx2nhtnIZ6/BRzk+T3x3aeyV
        42V4pCoJnTlqW80f8cAIfmA=
X-Google-Smtp-Source: ABdhPJwHfSMlR1K1xguOC5H0QrsWlq5j9g7EhtvzQgZS6un/QQ7FKO5pQ+6qmTh33FDIeD4VYJr+Hw==
X-Received: by 2002:aa7:dc16:: with SMTP id b22mr15155239edu.252.1602521532271;
        Mon, 12 Oct 2020 09:52:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.215])
        by smtp.googlemail.com with ESMTPSA id j24sm10475455edq.29.2020.10.12.09.52.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 09:52:10 -0700 (PDT)
Date:   Mon, 12 Oct 2020 18:52:08 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     dmitry.torokhov@gmail.com, Rob Herring <robh+dt@kernel.org>,
        rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
Message-ID: <20201012165208.GA3706@kozik-lap>
References: <20201008181514.668548-1-kholk11@gmail.com>
 <20201008181514.668548-4-kholk11@gmail.com>
 <CAJKOXPdZ_zo0bPwQd=_dKHhA2KWHgsH4KTH=+cX8hNxSVrqrig@mail.gmail.com>
 <CAK7fi1ZJN=AbkusWqDEbAkZ=AgKEPCvWH43hBpX0-EUDJWOC5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7fi1ZJN=AbkusWqDEbAkZ=AgKEPCvWH43hBpX0-EUDJWOC5g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 08, 2020 at 10:30:35PM +0200, AngeloGioacchino Del Regno wrote:
> Il giorno gio 8 ott 2020 alle ore 20:21 Krzysztof Kozlowski
> <krzk@kernel.org> ha scritto:
> >
> > On Thu, 8 Oct 2020 at 20:15, <kholk11@gmail.com> wrote:
> > >
> > > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > >
> > > Add binding for the Novatek NT36xxx series touchscreen driver.
> > >
> > > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > > ---
> > >  .../input/touchscreen/novatek,nt36xxx.yaml    | 59 +++++++++++++++++++
> > >  1 file changed, 59 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> > > new file mode 100644
> > > index 000000000000..e747cacae036
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> > > @@ -0,0 +1,59 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/input/touchscreen/novatek,nt36xxx.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Novatek NT36xxx series touchscreen controller Bindings
> > > +
> > > +maintainers:
> > > +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: touchscreen.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: novatek,nt36xxx
> >
> > Thanks for the changes, they look good except this part here which I
> > missed before. The compatible should not contain wildcards. If all
> > devices are really compatible, just add here one const, e.g. "const:
> > novatek,nt36525". If they are different, you could add multiple
> > compatibles in enum.
> >
> > Best regards,
> > Krzysztof
> 
> They are all managed the same way, but the page addresses are
> changing between all of them... the driver is reading the chip ID
> while the TS MCU is in "boot mode", then checking in a ID table
> if the chip is supported and finally assigning a page address table.
> This is done for the entire NT36*** series.
> 
> If wildcards are not permitted, perhaps I can change it to something
> like "novatek,nt36" or "novatek,nt36-ts"... as then specifying the
> specific IC model into the DT means that I would have to logically
> change the driver itself to also crosscheck a DT-specified model
> with whatever gets recognized by reading the chip (which then would
> be a triple check of what's going on, imo overcomplicating the logic).
> 
> What would you propose, at this point?

If you want the autodetection based on chip ID, then use the
oldest/earliest device as compatible, so "novatek,nt36525" and keep
everything else as is. In your case the HW description for all devices
is the same, thus one compatible is enough.  This way if in future you
need to bring a difference for a new HW (let's say some imaginary
NT36999), you can simply add a new compatible.

Best regards,
Krzysztof
