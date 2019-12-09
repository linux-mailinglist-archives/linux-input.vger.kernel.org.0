Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C06211723D
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 17:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfLIQ4A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 11:56:00 -0500
Received: from onstation.org ([52.200.56.107]:39240 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfLIQz7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 11:55:59 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C5F0A3E8F7;
        Mon,  9 Dec 2019 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1575910558;
        bh=IOou9TpV+L1zTliwsDvEweGpQGlqyMJMFaeFEvowmJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pv/qQ4oRIKZXzsuVDiX+sBNfpA+09Ne97DInXCT6Wpym9V3Dt113bUDVb+iNGWMcJ
         CGoTHeGIVsZudI8+KLLM3KRF6QLbX/a+6PX6nB4wzjlMD3QIs4wDD5pFGjCYtu8Zjd
         tKkd8akm416FTOfVJRHg5lSyXOC4lRlSfm8c5MsA=
Date:   Mon, 9 Dec 2019 11:55:58 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        thierry.reding@gmail.com
Subject: Re: [PATCH 4/7] dt-bindings: Input: introduce new clock vibrator
 bindings
Message-ID: <20191209165558.GA3212@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org>
 <20191205002503.13088-5-masneyb@onstation.org>
 <CAL_Jsq+jpz6_N18sChREC_xGYt9sSFZFtWr3omb_6o7+MFxuHg@mail.gmail.com>
 <20191209005436.GA13647@onstation.org>
 <CAL_JsqJ2v1fL7gkAg7C3GjokV7WD87S3P5HCwi-ZJ7EOjds8Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ2v1fL7gkAg7C3GjokV7WD87S3P5HCwi-ZJ7EOjds8Pw@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 09, 2019 at 10:16:26AM -0600, Rob Herring wrote:
> On Sun, Dec 8, 2019 at 6:54 PM Brian Masney <masneyb@onstation.org> wrote:
> >
> > On Thu, Dec 05, 2019 at 07:56:10AM -0600, Rob Herring wrote:
> > > On Wed, Dec 4, 2019 at 6:25 PM Brian Masney <masneyb@onstation.org> wrote:
> > > >
> > > > Add support for clock-based vibrator devices where the speed can be
> > > > controlled by changing the duty cycle.
> > > >
> > > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > > ---
> > > >  .../bindings/input/clk-vibrator.yaml          | 60 +++++++++++++++++++
> > > >  1 file changed, 60 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/input/clk-vibrator.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/input/clk-vibrator.yaml b/Documentation/devicetree/bindings/input/clk-vibrator.yaml
> > > > new file mode 100644
> > > > index 000000000000..2103a5694fad
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/input/clk-vibrator.yaml
> > > > @@ -0,0 +1,60 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/bindings/input/clk-vibrator.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Clock vibrator
> > > > +
> > > > +maintainers:
> > > > +  - Brian Masney <masneyb@onstation.org>
> > > > +
> > > > +description: |
> > > > +  Support for clock-based vibrator devices where the speed can be controlled
> > > > +  by changing the duty cycle.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: clk-vibrator
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  clock-names:
> > > > +    description: output clock that controls the speed
> > > > +    items:
> > > > +      - const: core
> > >
> > > No point in making up a name when there's only one clock, so drop.
> >
> > OK, will do.
> >
> > >
> > > > +
> > > > +  clock-frequency: true
> > >
> > > Given the frequency is variable, what does this mean in this case?
> >
> > The clock frequency is fixed. The duty cycle is what's variable.
> 
> That sounds like a PWM then...

Yes... See this message from Stephen with some more background
information about why this is in the clk subsystem:

https://lore.kernel.org/lkml/20190627234929.B78E520815@mail.kernel.org/

Brian
