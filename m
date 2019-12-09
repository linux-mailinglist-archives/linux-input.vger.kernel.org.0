Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D828B117155
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 17:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfLIQQl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 11:16:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:54984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfLIQQl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 11:16:41 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B251920828;
        Mon,  9 Dec 2019 16:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575908199;
        bh=l4AhqF+61Jiy/j68RJXORhPY3suI4I2IVJ52J64y4Zk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0wDWFAoulgr5XplI38skCakA+bNiEcj2Wxof1qA3rXeM9rIeY4K0yEcqH3yvjr05P
         QIGUWPh6AIJCl7capcigI94Qpb2MYx7Ja+ANKu/yNtAKWaChuWo/kjXO4LCf5i+dRa
         XHkcsS0d1WFvuMnWFd56LGf7qF4UGCmZm6SHt7lg=
Received: by mail-qk1-f180.google.com with SMTP id v23so13563567qkg.2;
        Mon, 09 Dec 2019 08:16:39 -0800 (PST)
X-Gm-Message-State: APjAAAXIAKnW6A0hfaI7t6Vh7HPGUTtMSOfFxMYyg+r5j7Ny+cAqXnz7
        IZAA+SUip30trvJbj/39EdOrnC+EgoPZ8doxng==
X-Google-Smtp-Source: APXvYqzm+y1a+nHLIKKviHPGNroxVtdzzfAl0KJk/UiMX5C7PNHWL6f86VHVl/ycQZQyz1jGTdzQuSJozTV+lWFQMio=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr28125112qkd.223.1575908198803;
 Mon, 09 Dec 2019 08:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20191205002503.13088-1-masneyb@onstation.org> <20191205002503.13088-5-masneyb@onstation.org>
 <CAL_Jsq+jpz6_N18sChREC_xGYt9sSFZFtWr3omb_6o7+MFxuHg@mail.gmail.com> <20191209005436.GA13647@onstation.org>
In-Reply-To: <20191209005436.GA13647@onstation.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 9 Dec 2019 10:16:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2v1fL7gkAg7C3GjokV7WD87S3P5HCwi-ZJ7EOjds8Pw@mail.gmail.com>
Message-ID: <CAL_JsqJ2v1fL7gkAg7C3GjokV7WD87S3P5HCwi-ZJ7EOjds8Pw@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: Input: introduce new clock vibrator bindings
To:     Brian Masney <masneyb@onstation.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 8, 2019 at 6:54 PM Brian Masney <masneyb@onstation.org> wrote:
>
> On Thu, Dec 05, 2019 at 07:56:10AM -0600, Rob Herring wrote:
> > On Wed, Dec 4, 2019 at 6:25 PM Brian Masney <masneyb@onstation.org> wrote:
> > >
> > > Add support for clock-based vibrator devices where the speed can be
> > > controlled by changing the duty cycle.
> > >
> > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > ---
> > >  .../bindings/input/clk-vibrator.yaml          | 60 +++++++++++++++++++
> > >  1 file changed, 60 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/clk-vibrator.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/clk-vibrator.yaml b/Documentation/devicetree/bindings/input/clk-vibrator.yaml
> > > new file mode 100644
> > > index 000000000000..2103a5694fad
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/clk-vibrator.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/bindings/input/clk-vibrator.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Clock vibrator
> > > +
> > > +maintainers:
> > > +  - Brian Masney <masneyb@onstation.org>
> > > +
> > > +description: |
> > > +  Support for clock-based vibrator devices where the speed can be controlled
> > > +  by changing the duty cycle.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: clk-vibrator
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    description: output clock that controls the speed
> > > +    items:
> > > +      - const: core
> >
> > No point in making up a name when there's only one clock, so drop.
>
> OK, will do.
>
> >
> > > +
> > > +  clock-frequency: true
> >
> > Given the frequency is variable, what does this mean in this case?
>
> The clock frequency is fixed. The duty cycle is what's variable.

That sounds like a PWM then...

Rob
