Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1460DC056F
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2019 14:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbfI0MqV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Sep 2019 08:46:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:48624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbfI0MqV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Sep 2019 08:46:21 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2AF22146E;
        Fri, 27 Sep 2019 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569588380;
        bh=weJ9waXnmNhfxGfLnZtXjlOa2n9Kp2OqKKWK+ROApk8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CZE+lrvNkP7ejRtZWu5PP2a5YD4uNsOb4l+v1zhW4WDvUH8BO2/nKtw9GFxxDcQvW
         OOyzVp5/Hh1sOchQ4fSfcqjkpbdcy9qzlqgYpNUOdClQ3z42qwpznEz4gAOrFh1QFa
         rXcwJsYv8Mh0h1Iw3mNz/aV+mgoYoQkO3Zx4wPoU=
Received: by mail-qk1-f176.google.com with SMTP id x134so1833130qkb.0;
        Fri, 27 Sep 2019 05:46:19 -0700 (PDT)
X-Gm-Message-State: APjAAAU6LVRvbBT3xaVJVRy25/W2NQXayf/jrtwqJjx3v4+PbGmgS9kw
        z3vJ4EWFVTeeWDszBPK9kSqA+rMYNp/CCkmrRQ==
X-Google-Smtp-Source: APXvYqxEA3goakRH4LTRlf8gFJnSX0oW3kq8vMiOTheJotfFpAgEKtJyeuE7oTCOrF7/Qvo/xSCLaQcB5X9pIUiMJDo=
X-Received: by 2002:a05:620a:7da:: with SMTP id 26mr4069346qkb.119.1569588379084;
 Fri, 27 Sep 2019 05:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
 <1567424417-3914-3-git-send-email-michal.vokac@ysoft.com> <20190903070123.GA15981@bogus>
 <c8c909e5-1e1f-23a7-dc22-f112fcaeab4c@ysoft.com>
In-Reply-To: <c8c909e5-1e1f-23a7-dc22-f112fcaeab4c@ysoft.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 27 Sep 2019 07:46:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLSSgjjjJYFSTZ6mHwz1UKef3AsrY-BwpfPuGn_TUYE8g@mail.gmail.com>
Message-ID: <CAL_JsqLSSgjjjJYFSTZ6mHwz1UKef3AsrY-BwpfPuGn_TUYE8g@mail.gmail.com>
Subject: Re: [PATCH input-next 2/4] dt-bindings: input: mpr121: Add
 poll-interval property
To:     =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 9:17 AM Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.=
com> wrote:
>
> On 03. 09. 19 9:01, Rob Herring wrote:
> > On Mon, Sep 02, 2019 at 01:40:15PM +0200, Michal Vok=C3=A1=C4=8D wrote:
> >> Add an option to periodicaly poll the device to get the buttons states
> >> as the interrupt line may not be used on some platforms.
> >>
> >> Signed-off-by: Michal Vok=C3=A1=C4=8D <michal.vokac@ysoft.com>
> >> ---
> >> I am not sure how to propperly handle this.
> >> Either interrupt or linux,poll-interval is required, but not both.
> >
> > Add this at the top level:
> >
> > oneOf:
> >    - required: [ interrupts ]
> >    - required: [ linux,poll-interval ]
> >
>
> Nice, works as expected.
>
> >>
> >>   .../bindings/input/fsl,mpr121-touchkey.yaml          | 20 ++++++++++=
+++++++++-
> >>   1 file changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchk=
ey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> >> index c463c1c81755..2b3073a3c9f4 100644
> >> --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> >> +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> >> @@ -34,6 +34,10 @@ properties:
> >>       minItems: 1
> >>       maxItems: 12
> >>
> >> +  linux,poll-interval:
> >> +    description: Poll interval time in milliseconds.
> >> +    maxItems: 1
> >
> > We already have 'poll-interval' in several bindings. Use that.
>
> OK, will do.
> linux,poll-intervall was initially suggested by Dmitry but AFAICT he is O=
K
> with this.
>
> > This should have a type definition and you don't need maxItems:
> >
> > $ref: /schemas/types.yaml#/definitions/uint32
>
> OK.
>
> > Really this should go in a common input schema doc.
>
> I am not sure how to deal with this. Do you suggest to create
>
>   Documentation/devicetree/bindings/input/input.yaml
>
> and put all the common input properties there? Something like:

Yes.

>
> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documen=
tation/devicetree/bindings/input/input.yaml
> new file mode 100644
> index 000000000000..5dc10ebdfdf0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/input.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/input.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common input schema binding
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +properties:
> +  linux,keycodes:
> +    description:
> +      Specifies an array of numeric keycode values to be used for report=
ing
> +      button presses. The array can contain up to 12 entries.
> +    minItems: 1
> +    maxItems: 12
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

When you have additional constraints on a referenced schema, the
reference has to be under an 'allOf':

allOf:
  - $ref: /schemas/types.yaml#/definitions/uint32-array

I still really don't get why and I've researched it...

However, for the common schema, you probably want to drop minItems/maxItems=
.

But you could define the value ranges?

items:
  minimum: 0
  maximum: 0xff


> +
> +  poll-interval:
> +    description: Poll interval time in milliseconds.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> ---
>
> Or something else?
> And what is the impact on the fsl,mpr121-touchkey.yaml content/format?
> I could not find any example in any subsystem of such approach.

You only need to define any additional constraints on the common
properties (such as minItems/maxItems) and don't need to repeat things
like the type or description.

In order to get the common schema applied, you do at the top-level of
your binding:

allOf:
  - $ref: input.yaml#

Sometimes we don't have to do this if we have a reliable way of
matching in the common binding such as the node name.

Rob
