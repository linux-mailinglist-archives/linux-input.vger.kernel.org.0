Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F82D37A2B0
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 10:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbhEKI4n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 04:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhEKI4n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 04:56:43 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EC9C061760
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 01:55:37 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id a5so8540003pfa.11
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yv7JOioo8NokeIgCiQAVCLNKcBXIN5FjohvMBc6oEZo=;
        b=IjrSZ/MBJIXPLWhgb2vBNqGnRgcz/pl4GrnOAav+jod2qEyNbldyR3140Wf4Oq0pVs
         8k0o2PbFxucJDwaJ8Reownq2b+eoDI+9mtg4UWraYTkh16GeKBGwtoZmlKuQg9xOjbBF
         rOAyryrYehEgLy1JH1qUYRK6naD3lnYNL182g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yv7JOioo8NokeIgCiQAVCLNKcBXIN5FjohvMBc6oEZo=;
        b=gomCfMnwZMknnkkEoVRKd8sswwCF2saERf9DXNYfHV9xO8QaQdPBxobaVVrdToocVU
         oQD2XnyDpMr25EeLHDpgvj4laSWNu288WXd0bvqYaxVc5cAXXcm6fSv9y8UQj6puOpVO
         O2HAVhdNJ78o7J04auFmU3XEuzraubiXGz5UmF2AkpvBA7s06exm6P5n1/Ozgh+awdnw
         OCpvA1h19M/VhqS7k5b2ngpPnIfZhFBWIy/auCCuakxev1vkrESWfbIBGwr54h343uLh
         HCshtNqf1EBUfnS3aIFMpXCHphC6RZZPgcTAaIk6nd8dEJTHbeg9wLyZdu46lui56ap3
         hTfA==
X-Gm-Message-State: AOAM533M1kRJbMAN8GeV4jJ1d/4PDTCdaYoIOIQzOI4GKZxIE5mVgWQb
        BG97LHYAs4YW2HCMbpgC8+J9WKSyeH9RHQfoT3oVfA==
X-Google-Smtp-Source: ABdhPJzfJaXV9C774l39y1nfIuJgZ6++yAnwWMMzvr3IEV+eavjS34LSzHuQnPfx+kG/AEjJG2DKLq+0zZ73fma9T1I=
X-Received: by 2002:a62:6544:0:b029:261:14cc:b11d with SMTP id
 z65-20020a6265440000b029026114ccb11dmr29306277pfb.12.1620723336588; Tue, 11
 May 2021 01:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210415032958.740233-1-ikjn@chromium.org> <20210415032958.740233-2-ikjn@chromium.org>
 <CAFqH_53GXdCfPCke_UN3fqrDxHZ_scd21ZekVzrYoVWbmLUmrw@mail.gmail.com> <CAL_JsqJ0mqqK69m_iFKTqGzu_TYvR7WdsuKw-ead74Sc=6msDw@mail.gmail.com>
In-Reply-To: <CAL_JsqJ0mqqK69m_iFKTqGzu_TYvR7WdsuKw-ead74Sc=6msDw@mail.gmail.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 11 May 2021 16:55:25 +0800
Message-ID: <CAATdQgAUGUntdZCwyP_7gdqD+sXYPubitwEHOfdvmZ=F3wmzHw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] mfd: google,cros-ec: add DT bindings for a
 baseboard's switch device
To:     Rob Herring <robh+dt@kernel.org>, Jiri Kosina <jikos@kernel.org>
Cc:     Enric Balletbo Serra <eballetbo@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
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

On Fri, Apr 16, 2021 at 9:30 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Apr 16, 2021 at 12:37 AM Enric Balletbo Serra
> <eballetbo@gmail.com> wrote:
> >
> > Hi Ikjoon,
> >
> > Thank you for your patch.
> >
> > Missatge de Ikjoon Jang <ikjn@chromium.org> del dia dj., 15 d=E2=80=99a=
br.
> > 2021 a les 5:32:
> > >
> > > This is for ChromeOS tablets which have a 'cros_cbas' switch device
> > > in the "Whiskers" base board. This device can be instantiated only by
> > > device tree on ARM platforms. ChromeOS EC doesn't provide a way to
> > > probe the device.
> > >
> > > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > >
> > > ---
> > >
> > > Changes in v5:
> > >  - Add missing blank lines and change the description property's posi=
tion.
> > >  - Add a note to description: "this device cannot be detected at runt=
ime."
> > >
> > > Changes in v4:
> > > Define cros-cbase bindings inside google,cros-ec.yaml instead of
> > > a separated binding document.
> > >
> > >  .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++=
++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yam=
l b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > > index 76bf16ee27ec..8dcce176b72e 100644
> > > --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > > @@ -114,6 +114,22 @@ properties:
> > >        - "#address-cells"
> > >        - "#size-cells"
> > >
> > > +  cbas:
> > > +    type: object
> > > +
> > > +    description:
> > > +      This device is used to signal when a detachable base is attach=
ed
> > > +      to a Chrome OS tablet. This device cannot be detected at runti=
me.
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        const: google,cros-cbas
> > > +
> > > +    required:
> > > +      - compatible
> > > +
> > > +    additionalProperties: false
> > > +
> > >  patternProperties:
> > >    "^i2c-tunnel[0-9]*$":
> > >      type: object
> > > @@ -180,6 +196,10 @@ examples:
> > >              interrupts =3D <99 0>;
> > >              interrupt-parent =3D <&gpio7>;
> > >              spi-max-frequency =3D <5000000>;
> > > +
> > > +            base_detection: cbas {
> >
> > nit: Rob, shouldn't this be just cbas?
>
> Yes.

Sorry, I'm a bit confused here.
'base_detection: cbas' in example should be just 'cbas'?
Maybe that's because cbas doesn't need to have a phandle or just by
its definition in schema?

Please let me upload v6 if this needs to be fixed.

Thanks for reviewing!



>
> >
> > > +                compatible =3D "google,cros-cbas";
> > > +            };
> > >          };
> > >      };
> > >
> > > --
> > > 2.31.1.295.g9ea45b61b8-goog
> > >
> >
> > Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
