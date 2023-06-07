Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A177258D7
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 10:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239653AbjFGI4h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 04:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239655AbjFGI4O (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 04:56:14 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B241F1FD4
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 01:55:18 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-39a97058691so4102372b6e.2
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686128118; x=1688720118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tqe0uSaqEB6Au14F+7qw/E2m+GCqZxXJWRq1ozGgw4M=;
        b=1rYeL7/ZE6QViB3MAGE08zl0q66lsfwWRwNZfC4Lli2TlYzl80QZvpHYUbi5GWV9G0
         oY1is7fpJQzi57NRmRghFqvfUu1pe1BxJvEFnNQR137t7REFEl8JyCWCRrc/+eN2eV/p
         STwItd4hR+yQmJmipFmARlcsI8diAp6m2JJN3jFfSamNUHY5MEEO9myX5hiFCOrZcP9Z
         OY3iMfqIhGC+mpZqevnCXlb60mA/kaupt6UhgCRHMSFj4rSR1CDPY6d5RAdUuW8sI1jL
         x+bu8Vkhsn67H0tToRBJzfmN9s3OB6hSU52PnZbbbUtJOM2aJm1M0gVoh8xjA2dnugLF
         +7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128118; x=1688720118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tqe0uSaqEB6Au14F+7qw/E2m+GCqZxXJWRq1ozGgw4M=;
        b=XgVPcUqslGd/gf//2fOIzz5xpuBbK/daUXVoTaSkSPQSfyiLrlRCrlXyafMyH4Ujzr
         9LT7nqSt1+VURXHQQSqIbw5Ao7YXh8jTmNyAcIDFAKcNkWXDJBqGgQtgo2Ad+1mlgFe/
         V+q33eRp3y4dI3TN/wlTWRljMJK/uqStzwiuOAsBncdcYOtW6FIo0ectnz6JSNDGDytU
         valEVDP24x61V2fzKyk1QquD6FZJLwGLseqzQAhQd5LIHQplXuwRlJY98uu0VqcB9R4E
         oh65GLl7gQxBsOdNdTNzTm9PrZVi8/oPAIfjvXG6bKnzlF4gt/T5zFjoOJg5JSjC+A7S
         n2aA==
X-Gm-Message-State: AC+VfDwth0iVPsX7h2PoZIyPnJ2O8lWyUNIm5UwQTVIMspWIJ7xGKeu0
        1iRtZPRxB8Wxfj94eMHavZ86K8a1LbgkaHe4Mlf2Ow==
X-Google-Smtp-Source: ACHHUZ42GsM/DEKXgmYTtHkDGCy+5HWFW42gEt16El0n9bNH1MaMteDth5VHnx6pk+Hlh9ud5ISMzgBEREYCONJuKMc=
X-Received: by 2002:a05:6808:10:b0:39a:bb42:aa63 with SMTP id
 u16-20020a056808001000b0039abb42aa63mr4902138oic.17.1686128117964; Wed, 07
 Jun 2023 01:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230605060524.1178164-1-yangcong5@huaqin.corp-partner.google.com>
 <20230605060524.1178164-2-yangcong5@huaqin.corp-partner.google.com>
 <6818f4b0-4222-c3bb-c55f-bc0d26d7a681@linaro.org> <ZH+ANlOaPH2nkZPT@google.com>
In-Reply-To: <ZH+ANlOaPH2nkZPT@google.com>
From:   cong yang <yangcong5@huaqin.corp-partner.google.com>
Date:   Wed, 7 Jun 2023 16:55:06 +0800
Message-ID: <CAHwB_NKJa6PPHkUotG2-yyZMvLbdSOiC+QrTGRDX5TL=Lsqibg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: Add ilitek 9882T
 touchscreen chip
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dianders@chromium.org,
        hsinyi@google.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,Dmitry

On Wed, Jun 7, 2023 at 2:51=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Jun 05, 2023 at 12:34:54PM +0200, Krzysztof Kozlowski wrote:
> > On 05/06/2023 08:05, Cong Yang wrote:
> > > Add an ilitek touch screen chip ili9882t.
> > >
> > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > ---
> > >  .../bindings/input/elan,ekth6915.yaml         | 23 ++++++++++++++++-=
--
> > >  1 file changed, 20 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.ya=
ml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > > index 05e6f2df604c..f0e7ffdce605 100644
> > > --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > > +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > > @@ -15,11 +15,14 @@ description:
> > >
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - const: elan,ekth6915
> > > +    enum:
> > > +      - elan,ekth6915
> > > +      - ilitek,ili9882t
> > >
> > >    reg:
> > > -    const: 0x10
> > > +    enum:
> > > +      - 0x10
> > > +      - 0x41
> > >
> > >    interrupts:
> > >      maxItems: 1
> > > @@ -29,11 +32,13 @@ properties:
> > >
> > >    vcc33-supply:
> > >      description: The 3.3V supply to the touchscreen.
> > > +                 If using ili9882t then this supply will not be need=
ed.
> >
> > What does it mean "will not be needed"? Describe the hardware, not your
> > drivers.
>
> I do not think it makes sense to merge Ilitek and Elan into a single
> binding. The only thing that they have in common is that we are trying
> to reuse drivers/hid/i2c-hid/i2c-hid-of-elan.c to handle reset timings
> (which is also questionable IMO).
>
> Maybe if we had a single unified binding for HID-over-I2C touchscreens
> then combining would make more sense, at least to me...
>

Okay, thanks for the suggestion, I will add an ilitek binding.

> Thanks.
>
> --
> Dmitry
