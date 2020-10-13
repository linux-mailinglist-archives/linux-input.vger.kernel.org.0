Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B0E28D07C
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 16:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbgJMOmS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 10:42:18 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44509 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJMOmP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 10:42:15 -0400
Received: by mail-oi1-f195.google.com with SMTP id x62so22683737oix.11;
        Tue, 13 Oct 2020 07:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1I9AZ3dVkBSyMQfgKs1TohAW9PkxtWPJANLEevozX18=;
        b=bo1Om4qdFQtU5iYc84aY4VdLEz31ClJZvTI54Dz66IQnLoK9QExkPuhmM2L/gqlClj
         qx630K2Mw6r8fnPZsAegIccWPx6O6fEsjBpacAWDe1VshyYSAPrkA7+09RpZj2RJ+EKJ
         1mf5rdeZbZYq6gxFtJKlWtBbr5FJJ5aZafgPTnXULe6arKW5+EVuuQnjecj/6evmwHKU
         bVbAlifGfhET2KMTr/RVSfq0kHsCw1EX4rH05Brb+LiH7yYagbs2CRWh0PCZAJotyDwU
         DwQDmVFVMPpefRcwcmrTR6kJdHE6/15+0NfVSyKQliesXKrCXpE+f/mxBJ7yporkhlJs
         CHOw==
X-Gm-Message-State: AOAM533pbPkYObl9VIAbJq8aRVODfDKJA4QBMc3srj2epLjQTX3DlIa4
        9HuT84Z6ZMxCTQqs2hm92A==
X-Google-Smtp-Source: ABdhPJwFbKntR2PxJCYnhFnlcnCgf6fko0lXPql9p88A+khxMxqyZ13HIlFoPTEwIgarURWtyfnL4A==
X-Received: by 2002:aca:5605:: with SMTP id k5mr33668oib.25.1602600133795;
        Tue, 13 Oct 2020 07:42:13 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z25sm14246ood.21.2020.10.13.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 07:42:13 -0700 (PDT)
Received: (nullmailer pid 3475676 invoked by uid 1000);
        Tue, 13 Oct 2020 14:42:11 -0000
Date:   Tue, 13 Oct 2020 09:42:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, dmitry.torokhov@gmail.com,
        rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
Message-ID: <20201013144211.GA3449602@bogus>
References: <20201008181514.668548-1-kholk11@gmail.com>
 <20201008181514.668548-4-kholk11@gmail.com>
 <CAJKOXPdZ_zo0bPwQd=_dKHhA2KWHgsH4KTH=+cX8hNxSVrqrig@mail.gmail.com>
 <CAK7fi1ZJN=AbkusWqDEbAkZ=AgKEPCvWH43hBpX0-EUDJWOC5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7fi1ZJN=AbkusWqDEbAkZ=AgKEPCvWH43hBpX0-EUDJWOC5g@mail.gmail.com>
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

The important part is whether everything needed to read the chip ID 
is identical? Same power supplies and sequencing, clocks, resets, 
enables, etc.? If any of those vary then you'll need something more 
specific. You can always have a common fallback.

Rob
