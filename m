Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39DC2FCB02
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 07:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbhATGSz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jan 2021 01:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728934AbhATGRA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jan 2021 01:17:00 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A677C061575;
        Tue, 19 Jan 2021 22:16:20 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id e22so44738574iom.5;
        Tue, 19 Jan 2021 22:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rMaHKvzt4gI4vZWbUD57VHvPjiMKfLAdC+SHpPHGSGc=;
        b=VeOIAKyd91TBSjSAATeK2jHqNqvfdNibnrh8EpcGHmTP/Okp9ArD5NbGrB4xDUXukL
         5qp8hpujrNPI2vRfyQYQfhBxulUQ81nxOFlIBN3NxvELJRl6cq+MLU2+UopYELxQGm6y
         13aPp02TlhOxRBgjakhA7yOnu97tJFrqQqrZD8+drhie/kbSYERElnphl3/uHHe9ixYy
         FzFAQQjo2t4NHvFyb/xqCHHAoLjEs6DVhkB3oBfg9rXUxA7xOwi2W89ego99nx01+M4E
         cf8gHaOfW1yTJaIPKHiteGzxGFEIjffA8HWgI02zLpq4YoFVbMxLnSxb2nzne/MwtpnV
         fUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rMaHKvzt4gI4vZWbUD57VHvPjiMKfLAdC+SHpPHGSGc=;
        b=sQMWA+9xIzIR4yNElFYJJKvqqjBoWW1MdQgkltI5rNPMpHjXMFUEbR0kEuElFVehg7
         TwvgR6KcdGs0/IERzNwwQ3ntGaquI9H3b4ZJ4D/a9QsDUIYjd/XBliLElWujGGBylWAw
         77VTTgdiY3PWBNQzqfa4bKlADStSH4SFtlnXDZ+kq0+w6UxESZb63sLPBjIHsEN2ykKJ
         3fgKKl1eQ8UA1UEBmpR3yPXSSgJBhOzQzIJw0dJXQcxbvTc3+BpL3x0HLctuhtv1NXEX
         WPaM/rIR/Z2r0fgOGtgNrNN/NBxvBdG1u37yN+OmNYWmnoa03jbXd4t7z83REfS+rbeq
         Kwvw==
X-Gm-Message-State: AOAM533LLrIURUCh7Kf8F6iZg6HO7sUTLGR45hUXrvtZXE47B+XyBfBo
        /8oM3WPY9V7jANRqUEZv8as8LEkPWJ2jeVocBFwtIrZES1U=
X-Google-Smtp-Source: ABdhPJweAGhyRwjSGO9zW9ha79X6kmVPg5wscpTHkCPaq/GvUbOPWCmTC6BNuCWC4AW8bnaHPQdQR9eO4ik1OyCueKg=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr6613008ild.267.1611123379666;
 Tue, 19 Jan 2021 22:16:19 -0800 (PST)
MIME-Version: 1.0
References: <20210117042428.1497-1-alistair@alistair23.me> <YAeSL1PSo0vn7E/5@google.com>
In-Reply-To: <YAeSL1PSo0vn7E/5@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 19 Jan 2021 22:15:53 -0800
Message-ID: <CAKmqyKPMXxLOGj4BH_fYx4hjZ+pHO3LNQVtN1buFrSAom38j1g@mail.gmail.com>
Subject: Re: [PATCH 1/3] devicetree/bindings: Initial commit of wacom,wacom-i2c
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 19, 2021 at 6:15 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Alistair,
>
> On Sat, Jan 16, 2021 at 08:24:26PM -0800, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  .../input/touchscreen/wacom,wacom-i2c.yaml    | 55 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  2 files changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> > new file mode 100644
> > index 000000000000..6b0e0034f836
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/touchscreen/wacom,wacom-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Wacom I2C Controller
> > +
> > +maintainers:
> > +  - Alistair Francis <alistair@alistair23.me>
> > +
> > +allOf:
> > +  - $ref: touchscreen.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: wacom,wacom-i2c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  flip-tilt-x:
> > +  flip-tilt-y:
>
> Does the device support tilt? The driver does not, at least at the
> moment. Also, does it make sense to flip tilt but not position?
>
> > +  flip-pos-x:
> > +  flip-pos-y:
>
> This needs to use standard touchscreen properties. See
> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
>
> > +  flip-distance:
>
> I am having trouble understanding when this one would be useful.

Thanks for the review. These came from the original out of tree DT. I
have removed them, I'm planning on using the standard touchscreen ones
you pointed out if they are required.

Alistair

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include "dt-bindings/interrupt-controller/irq.h"
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        digitiser@9 {
> > +                compatible = "wacom,wacom-i2c";
> > +                reg = <0x9>;
> > +                interrupt-parent = <&gpio1>;
> > +                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> > +                flip-tilt-x;
> > +                flip-tilt-y;
> > +                flip-pos-x;
> > +                flip-pos-y;
> > +                flip-distance;
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 041ae90b0d8f..5bca22f035a3 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1202,6 +1202,8 @@ patternProperties:
> >      description: Vision Optical Technology Co., Ltd.
> >    "^vxt,.*":
> >      description: VXT Ltd
> > +  "^wacom,.*":
> > +    description: Wacom Co., Ltd
> >    "^wand,.*":
> >      description: Wandbord (Technexion)
> >    "^waveshare,.*":
> > --
> > 2.29.2
> >
>
> Thanks.
>
> --
> Dmitry
