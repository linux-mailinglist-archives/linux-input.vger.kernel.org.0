Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1B13574A6
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 20:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355491AbhDGS4u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 14:56:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355496AbhDGS4i (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 14:56:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43F6A61184;
        Wed,  7 Apr 2021 18:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617821788;
        bh=s1pwxfGbr+23r/1PPqHacfYAr8Ua+AqiSW14N4NXfY0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YM0wQ9XhVFqTSHAvSiH0ARmlmWdwANJ0kzxvoIded54FP7B06CGLGj+/4xsIw+jHN
         NZyDI/pTBdR+lNVLbuQgHwJwPu2znHsoBpIjlG3PlQcM3E/ch7wm9eyr2BoVhrqzvx
         rp11Y+VLSHTBmmRqxbl6oCkMLNRRS4BXCERFKgykfdOBKdKr7vX/qben/uwG+c33C+
         5tO4EKXs/BaEprPeTela9Fy3yDFbuaOaVPTAYQmy9P/jJAJ9s6X1vjBD8IosFHIqap
         G5fQLMynQ9LpEQ0sqMTL/Vw4SrqVTr2uHd0TRBWsm1VJUZ1U/LJAewiCameoSQGtOS
         qxnbdAS+ags1g==
Received: by mail-ej1-f45.google.com with SMTP id hq27so29357209ejc.9;
        Wed, 07 Apr 2021 11:56:28 -0700 (PDT)
X-Gm-Message-State: AOAM533gglVlM0g20/oAwYlAaR5dcW0qi4Et6sNZ/Kd631eVu/EAoPX3
        7INHgjbf/rN7yAcMrADq3OKeb9OfpCxGWfXMaA==
X-Google-Smtp-Source: ABdhPJy6e9BslEl51dXoDuq4DtwJuUJB+jGofOJPKp1uGLl1JeOkeDwA831dcoqDoAIXXk9nclDVL7I3GZsMmJu4+Sc=
X-Received: by 2002:a17:906:1984:: with SMTP id g4mr5389459ejd.525.1617821786686;
 Wed, 07 Apr 2021 11:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <YGbc7Qbu6s659Mx4@latitude> <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
 <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
 <1617715445.154812.1674495.nullmailer@robh.at.kernel.org> <937f75d4-6c2e-d476-f272-39f8ed2826f2@benettiengineering.com>
In-Reply-To: <937f75d4-6c2e-d476-f272-39f8ed2826f2@benettiengineering.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 7 Apr 2021 13:56:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL2QdSmYbcowgsPz2XXQt1W0KfkzqkNROafAsMNXx7m4w@mail.gmail.com>
Message-ID: <CAL_JsqL2QdSmYbcowgsPz2XXQt1W0KfkzqkNROafAsMNXx7m4w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: touchscreen: Add HY46XX bindings
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 7, 2021 at 12:57 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Hello Rob, All,
>
> On 4/6/21 3:24 PM, Rob Herring wrote:
> > On Fri, 02 Apr 2021 18:16:26 +0200, Giulio Benetti wrote:
> >> This adds device tree bindings for the Hycon HY46XX touchscreen series=
.
> >>
> >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> >> ---
> >> V1->V2:
> >> As suggested by Rob Herring:
> >> * fixed $id: address
> >> * added "hycon," in front of every custom property
> >> * changed all possible property to boolean type
> >> * removed proximity-sensor-switch property since it's not handled in d=
river
> >> V2->V3:
> >> As suggested by Jonathan Neusch=C3=A4fer:
> >> * fixed some typo
> >> * fixed description indentation
> >> * improved boolean properties descriptions
> >> * improved hycon,report-speed description
> >> ---
> >>   .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++=
++
> >>   MAINTAINERS                                   |   6 +
> >>   2 files changed, 126 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/input/touchscre=
en/hycon,hy46xx.yaml
> >>
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.exampl=
e.dt.yaml:0:0: /example-0/i2c/hycon-hy4633@1c: failed to match any schema w=
ith compatible: ['hycon,hy4633']
> >
> > See https://patchwork.ozlabs.org/patch/1461797
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
>
> I've just send corrected patches.
>
> Anyway I'd like to understand how to make dt_binding_check works correctl=
y.
>
> I've installed yamllint and 'make dt_binding_check' works but it still
> doesn't show that error up on compatible string.
>
> yamllint I have is version 1.20.0
>
> > pip3 install dtschema --upgrade
>
> I've already tried with that too and dtschema version is:
> 1.3.8

Huh? dtschema versions are YYYY.MM.

> I've read that dtc must be compiled with YAML output enabled and it
> seems to be so, since when I issue 'make dt_binding_check' from my file:
> hycon,hy46xx.yaml(with compatible string wrong "hycon,hy4633")

It's a new check queued for 5.13 in linux-next. See commit
c59773d204cc ("kbuild: Enable DT undocumented compatible checks").

I've updated the bot email with this, but after I sent this one.

Rob
