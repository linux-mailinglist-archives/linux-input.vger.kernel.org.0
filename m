Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38FCCE91AC
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 22:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfJ2VSw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 17:18:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:42420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbfJ2VSw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 17:18:52 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 134B821734;
        Tue, 29 Oct 2019 21:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572383931;
        bh=zpgMRmB2+OUmfkPUJn+0sPhsYPa/nJY+387yladmnrc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M372WvepBD01pI9VIjsiCfpipdnqFMbpzbuthX+wVwQEqQ8XZ8lV6VZFciCZZs6fh
         ELbBr4yJxE4+jWNbJ2Z6nweRDOhuqp0KuVCaMxqtwY36d9LeuJB6KhctgTZSpIt/Ok
         0bSgcASRz+8ocb7i4RsnEiJtOVZ61x7G7p+s9Ito=
Received: by mail-qt1-f176.google.com with SMTP id e14so253842qto.1;
        Tue, 29 Oct 2019 14:18:51 -0700 (PDT)
X-Gm-Message-State: APjAAAXmTLb4uwxxzIseSgQCZdcHi0tiOBktOFS8d4vE1VutiKttwuqt
        4tVEOsrFV2PEg0evjG6TZViTymlUXud5uC42Xw==
X-Google-Smtp-Source: APXvYqxo+gATAnWKaH4+/7DfLaTaJSdXC7dT+aqj7Pm+u15wwoD9JB4JIj7f9Qiz9jWQueCpx/cWWbcYKy3Q5nqHfi8=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr1394611qtq.143.1572383930154;
 Tue, 29 Oct 2019 14:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191023024348.225969-1-ikjn@chromium.org> <20191025194101.GA4734@bogus>
 <CAATdQgDxC_1EH4cBqf7deEqRjtRU1s4o=L8vOztvVZ7NS_q9Mw@mail.gmail.com>
In-Reply-To: <CAATdQgDxC_1EH4cBqf7deEqRjtRU1s4o=L8vOztvVZ7NS_q9Mw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 29 Oct 2019 16:18:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJkFND8JP1bG6jbk9E365MpoNOHn1s9=SG-mFjwBa6Gvg@mail.gmail.com>
Message-ID: <CAL_JsqJkFND8JP1bG6jbk9E365MpoNOHn1s9=SG-mFjwBa6Gvg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Add DT bindings for Whiskers switch
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nicolas Boitchat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 29, 2019 at 2:23 AM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> On Sat, Oct 26, 2019 at 3:41 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Oct 23, 2019 at 10:43:48AM +0800, Ikjoon Jang wrote:
> > > Add the DT binding document for Hammer's TABLET_MODE switch.
> >
> > This doesn't have any properties. Why does it need to be in DT? Just
> > have the EC driver instantiate it.
> >
> > >
> > > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > > ---
> > >  .../devicetree/bindings/input/cros-cbas.yaml  | 22 +++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/cros-cbas.yaml b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> > > new file mode 100644
> > > index 000000000000..3bc989c6a295
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> > > @@ -0,0 +1,22 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> >
> > (GPL-2.0-only OR BSD-2-Clause) for new bindings please.
>
> This will be GPL-2.0-only in next patch.

That's not what I said. Dual licensed please:

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

>
> >
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/input/cros-cbas.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ChromeOS Hammer's Base Attached Switch
> > > +
> > > +maintainers:
> > > +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > +
> > > +description:
> > > +  This device is used to signal when a detachable base is attached to a
> > > +  Chrome OS tablet. The node for this device must be under a cros-ec node
> > > +  like google,cros-ec-spi or google,cros-ec-i2c.
> >
> > This should probably just be part of an EC schema where it can be
> > enforced that this is a child node. It could be either embedded into it
> > or referenced. I'd lean toward the former given this is only a
> > compatible string...
>
> Sorry for basic questions here but I'm a bit confused,
> "embedding" means that cros-ec.txt should be converted
> into json schema first and embed this child bindings into there?

Right.

> Many Chrome OS tablets have a switch exposed by 'cros-ec-keyb' device
> which is directly controlled by EC. But this 'cros_cbas' switch device is for
> other types of tablets which need additional logics on EC and HID.
>
> Currently it doesn't need to have other properties, but maybe it could require
> additional properties or device links in the future, plus this device
> is not just
> a EC subdevice, so I'd prefer this to be a separate binding.

But in the description you say it is a child device.

Rob
