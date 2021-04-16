Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9A73620F2
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 15:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243857AbhDPNan (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 09:30:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:43802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235011AbhDPNal (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 09:30:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EDB4611AB;
        Fri, 16 Apr 2021 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618579816;
        bh=n9xmFN2NsaASWbiOf1tjXSrysPr4eQ8p8Daqq/eQqzI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VzLXW0btd8iMCdR16X/ODd6jzYF2rBVrRWHEtPAB8wfNKf2U2Lx3wHtrHI6efxbLb
         9pEbsB6Lwp5gYD7UfLl5dBRx57lyC2RyMtU2RF7jZtDzil0ovv6rSzC3r6jsO6A2gW
         QaDxbIC7zAYlv93wEngg/rclzoVVWP6/Wu+yhm8nDY3zB8fuEv8T1i2vC0Shqn6Evd
         jgXqShtryKm22DTQC63oRLEcXmJxrdslhq58LKXMS823acjj9d8E7miF13AM4bk7Dw
         qOjyHJs4NtdsWbQ6hK91pKVtcd4ZA3WJm7mHhFFOCwdIKi2NyZjBxvMejJijPphbZ1
         /L1nIpWGNhnHw==
Received: by mail-ej1-f49.google.com with SMTP id x12so21386493ejc.1;
        Fri, 16 Apr 2021 06:30:16 -0700 (PDT)
X-Gm-Message-State: AOAM530Z3nT6xCfEXgElRw8u0+5WRJ1QwtHYOBWJU+0GIG1ahIprpW6y
        vQ3VagzT+NQEzIdhF4/6f5m7PNrpzjRCZPARTA==
X-Google-Smtp-Source: ABdhPJyYkMxFlTQe3wBkH0km71+lVgj11mjrhrSuWMukjpytVS+13WuaQ0umP4fhq7OEonjh4vw2GDt98yeQoFruT88=
X-Received: by 2002:a17:906:9ac5:: with SMTP id ah5mr8145109ejc.360.1618579815055;
 Fri, 16 Apr 2021 06:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210415032958.740233-1-ikjn@chromium.org> <20210415032958.740233-2-ikjn@chromium.org>
 <CAFqH_53GXdCfPCke_UN3fqrDxHZ_scd21ZekVzrYoVWbmLUmrw@mail.gmail.com>
In-Reply-To: <CAFqH_53GXdCfPCke_UN3fqrDxHZ_scd21ZekVzrYoVWbmLUmrw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 16 Apr 2021 08:30:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ0mqqK69m_iFKTqGzu_TYvR7WdsuKw-ead74Sc=6msDw@mail.gmail.com>
Message-ID: <CAL_JsqJ0mqqK69m_iFKTqGzu_TYvR7WdsuKw-ead74Sc=6msDw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] mfd: google,cros-ec: add DT bindings for a
 baseboard's switch device
To:     Enric Balletbo Serra <eballetbo@gmail.com>
Cc:     Ikjoon Jang <ikjn@chromium.org>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 16, 2021 at 12:37 AM Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
>
> Hi Ikjoon,
>
> Thank you for your patch.
>
> Missatge de Ikjoon Jang <ikjn@chromium.org> del dia dj., 15 d=E2=80=99abr=
.
> 2021 a les 5:32:
> >
> > This is for ChromeOS tablets which have a 'cros_cbas' switch device
> > in the "Whiskers" base board. This device can be instantiated only by
> > device tree on ARM platforms. ChromeOS EC doesn't provide a way to
> > probe the device.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >
> > ---
> >
> > Changes in v5:
> >  - Add missing blank lines and change the description property's positi=
on.
> >  - Add a note to description: "this device cannot be detected at runtim=
e."
> >
> > Changes in v4:
> > Define cros-cbase bindings inside google,cros-ec.yaml instead of
> > a separated binding document.
> >
> >  .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml =
b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > index 76bf16ee27ec..8dcce176b72e 100644
> > --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > @@ -114,6 +114,22 @@ properties:
> >        - "#address-cells"
> >        - "#size-cells"
> >
> > +  cbas:
> > +    type: object
> > +
> > +    description:
> > +      This device is used to signal when a detachable base is attached
> > +      to a Chrome OS tablet. This device cannot be detected at runtime=
.
> > +
> > +    properties:
> > +      compatible:
> > +        const: google,cros-cbas
> > +
> > +    required:
> > +      - compatible
> > +
> > +    additionalProperties: false
> > +
> >  patternProperties:
> >    "^i2c-tunnel[0-9]*$":
> >      type: object
> > @@ -180,6 +196,10 @@ examples:
> >              interrupts =3D <99 0>;
> >              interrupt-parent =3D <&gpio7>;
> >              spi-max-frequency =3D <5000000>;
> > +
> > +            base_detection: cbas {
>
> nit: Rob, shouldn't this be just cbas?

Yes.

>
> > +                compatible =3D "google,cros-cbas";
> > +            };
> >          };
> >      };
> >
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
>
> Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
