Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C0DE826D
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387671AbfJ2HXI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:23:08 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:34421 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387673AbfJ2HXF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:23:05 -0400
Received: by mail-ua1-f66.google.com with SMTP id q16so3510212uao.1
        for <linux-input@vger.kernel.org>; Tue, 29 Oct 2019 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0SUH6/NtBC3ilVCpdONozL4mS3Prp0pIL3y1hHCcxAk=;
        b=eMchEOvQ/jKSqC7IlUVOrUOu2sRq3JlNHSwrSwCVZV7hyYX+NwsA3oadySVIS2GMhv
         Fvs0xOAQNNajFRHYthK70jYXsoHFLR0MqpOCX4UruR1XUSVhwPotDPQQJvLDpR6Qs35N
         fO+lH1wwkAdlVyFMk0fkQlRl+r7cTgEooYDbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0SUH6/NtBC3ilVCpdONozL4mS3Prp0pIL3y1hHCcxAk=;
        b=V27em/ZP5BO1vRdOKjNsNwPtUmlI2QAH90k9/xq/NcZ+CMFNMh8Glh9JaD5bErTs4i
         xFzlFzPjuWNJ+rdubVRlSzMsXVPxmTuJs7uC1sCvNOKUYi9pf2XNtgwV83W7jG1c+XWM
         3BFqDk9SVYlU1n6ssyGVf2/vhNBIkAbp3j/cwUYjJMuaKpp96uM5g4YJo19OV56rZkiC
         OL3qEiSQdQqHKQixCUCn/I3saINQkH/2DPhSOjuzAZ3Qq4r1+n4VgGZHsHuHNrLxy+8c
         gk3pCvybGXbZoj8kvfH6NKGgAZpYnXA4skympvpoAEAGEEnC5vzg7QJI1aaBrps3K4ks
         Ob+w==
X-Gm-Message-State: APjAAAX3s5+56U+F3ipXHXoOQ/IYJO+CATU1lO8f5CVFfnXoCKbp9Rai
        Nvboh+YlZP8XB64ltulOG/lN2UirJ6tPoVPJFzaTmA==
X-Google-Smtp-Source: APXvYqwu6KYbConXB0iKr6Mov1RGaa3I/esweFtuANMt32BxSyqi5DbWOfQ88/Vd4VamORlLwO9ez57AWW6x/2gTwcw=
X-Received: by 2002:ab0:6503:: with SMTP id w3mr7651016uam.17.1572333783797;
 Tue, 29 Oct 2019 00:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191023024348.225969-1-ikjn@chromium.org> <20191025194101.GA4734@bogus>
In-Reply-To: <20191025194101.GA4734@bogus>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 29 Oct 2019 15:22:52 +0800
Message-ID: <CAATdQgDxC_1EH4cBqf7deEqRjtRU1s4o=L8vOztvVZ7NS_q9Mw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Add DT bindings for Whiskers switch
To:     Rob Herring <robh@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 26, 2019 at 3:41 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 23, 2019 at 10:43:48AM +0800, Ikjoon Jang wrote:
> > Add the DT binding document for Hammer's TABLET_MODE switch.
>
> This doesn't have any properties. Why does it need to be in DT? Just
> have the EC driver instantiate it.
>
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > ---
> >  .../devicetree/bindings/input/cros-cbas.yaml  | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/cros-cbas.yaml b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> > new file mode 100644
> > index 000000000000..3bc989c6a295
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> > @@ -0,0 +1,22 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> (GPL-2.0-only OR BSD-2-Clause) for new bindings please.

This will be GPL-2.0-only in next patch.

>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/cros-cbas.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ChromeOS Hammer's Base Attached Switch
> > +
> > +maintainers:
> > +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > +
> > +description:
> > +  This device is used to signal when a detachable base is attached to a
> > +  Chrome OS tablet. The node for this device must be under a cros-ec node
> > +  like google,cros-ec-spi or google,cros-ec-i2c.
>
> This should probably just be part of an EC schema where it can be
> enforced that this is a child node. It could be either embedded into it
> or referenced. I'd lean toward the former given this is only a
> compatible string...

Sorry for basic questions here but I'm a bit confused,
"embedding" means that cros-ec.txt should be converted
into json schema first and embed this child bindings into there?

Many Chrome OS tablets have a switch exposed by 'cros-ec-keyb' device
which is directly controlled by EC. But this 'cros_cbas' switch device is for
other types of tablets which need additional logics on EC and HID.

Currently it doesn't need to have other properties, but maybe it could require
additional properties or device links in the future, plus this device
is not just
a EC subdevice, so I'd prefer this to be a separate binding.

>
> > +
> > +properties:
> > +  compatible:
> > +    const: google,cros-cbas
> > +
> > +required:
> > +  - compatible
>
> Add here:
>
> additionalProperties: false.

Okay, I will add this in a new patch set , thank you!

>
> > --
> > 2.23.0.866.gb869b98d4c-goog
> >
