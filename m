Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D281723500
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 04:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbjFFCGT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jun 2023 22:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbjFFCGS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jun 2023 22:06:18 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18A511A
        for <linux-input@vger.kernel.org>; Mon,  5 Jun 2023 19:06:17 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-256cda5c1c1so2553365a91.1
        for <linux-input@vger.kernel.org>; Mon, 05 Jun 2023 19:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686017177; x=1688609177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW68YijPC5M/xCRpMcVO/BAMrMv1lIZeTHggFsWAt3k=;
        b=Pq4XeiWh+lt9vOCi+qa+rwki0ALN2wovdTXzj/yfLh6mcIwEK7tz36PZoeODDyeVyY
         5IVp7VF/3+bVlNhLh2I7bkMRtoDtKdajzIvABZzoFoCc9uCwlxxYum5WqcBFBiiju6uS
         F7l7pXUDcT9DfV1rSZCb7VWPwbTuKycuoiDcHXKBI8UEY/6xomtSIYdGiGazzXXrLsKC
         jpXLlWOzarRebIxCt0posCCgYb45rxxubvH69KwTVk4t/Tkbzu6qArecsLw4rGb00r6j
         Xs9Pm1NTUfG4IQvYUGLGpmT7setkDeEtLQnWWfFYikIw4WfJ58bknXw3awJTrF4O8eet
         Gc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686017177; x=1688609177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW68YijPC5M/xCRpMcVO/BAMrMv1lIZeTHggFsWAt3k=;
        b=IET+/cDhqIvwOaEbZZg5ARwZFW2tK8rGcXNgy0ei2faLksePMotBgHWQaGZm3HZK7r
         WdF4zXC8QW6OtXWHkhXfO3y2d6cJiCXg34dU4mG2XYp7syudQ6oC1K/eLCspxzX8tz25
         H+uHJkHlZO1zkY+O/mupt4YTZkO84D/ARBali2M8jwyew6iHhlrEWbna+SLI0d16omko
         9ejpqxvywv1T546lmWNpIoHbpGTVPsyQDtyWzTzc8OGivSZSG5MhlP6++FcFAMufuQie
         Rl2Mpwsy6+9nFE9vF5CiPgOh8VoIDGZT6IHmQG9/igxvYxx7RH9LeZtENC4LYJnZfyz4
         QW3w==
X-Gm-Message-State: AC+VfDz/xtt8zWcifIeJSodOVRkLY+c7AiHfe4/6zctpPrZ3leX9WCrT
        5nZTNzw3WcL0TGIHM8NS8f5hlQ2J8YVljakhW1D13g==
X-Google-Smtp-Source: ACHHUZ7KiGCkrKfrTiI8e3B0XsDL6OBdSXWbPBmvfSKZ8Xi7N2zKyEhVQXjxnnhXYn1HPOsTnC3vANQxkzd4E01FlJY=
X-Received: by 2002:a17:90b:2353:b0:256:f86:fa6e with SMTP id
 ms19-20020a17090b235300b002560f86fa6emr214511pjb.48.1686017177023; Mon, 05
 Jun 2023 19:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230605060524.1178164-1-yangcong5@huaqin.corp-partner.google.com>
 <20230605060524.1178164-2-yangcong5@huaqin.corp-partner.google.com> <20230605-anyway-grab-f7a35aa199fb@spud>
In-Reply-To: <20230605-anyway-grab-f7a35aa199fb@spud>
From:   cong yang <yangcong5@huaqin.corp-partner.google.com>
Date:   Tue, 6 Jun 2023 10:06:05 +0800
Message-ID: <CAHwB_NK_j1SJ1BBkVqafFM_+fWSyvwjCpMmHQxjLjnz_KHR=KA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: Add ilitek 9882T
 touchscreen chip
To:     Conor Dooley <conor@kernel.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
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

Hi,Conor,

On Mon, Jun 5, 2023 at 6:20=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> Hey Cong Yang,
>
> On Mon, Jun 05, 2023 at 02:05:23PM +0800, Cong Yang wrote:
> > Add an ilitek touch screen chip ili9882t.
>
> Could you add a comment here mentioning the relationship between these
> chips?

Okay, I will add in V3 version.

> On Mon, Jun 05, 2023 at 02:05:23PM +0800, Cong Yang wrote:
>
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  .../bindings/input/elan,ekth6915.yaml         | 23 ++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml=
 b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > index 05e6f2df604c..f0e7ffdce605 100644
> > --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > @@ -15,11 +15,14 @@ description:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - const: elan,ekth6915
> > +    enum:
> > +      - elan,ekth6915
> > +      - ilitek,ili9882t
> >
> >    reg:
> > -    const: 0x10
> > +    enum:
> > +      - 0x10
> > +      - 0x41
>
> Is 0x10 only valid for the elan,ekth6915 & 0x41 for the ilitek one?
> If so, please add some enforcement of the values based on the
> compatible.

I don't think 0x10 is the only address for ekth6915,(nor is 0x41 the
only address for ili9882t). It depends on the hardware design.

>
> >
> >    interrupts:
> >      maxItems: 1
> > @@ -29,11 +32,13 @@ properties:
> >
>
>
> >    vcc33-supply:
> >      description: The 3.3V supply to the touchscreen.
> > +                 If using ili9882t then this supply will not be needed=
.
> >
> >    vccio-supply:
> >      description:
> >        The IO supply to the touchscreen. Need not be specified if this =
is the
> >        same as the 3.3V supply.
> > +      If using ili9882t, the IO supply is required.
>
> There's no need for these sort of comments, you can rely on the required
> sections to describe these relationships.

Got it ,thanks.


>
> Cheers,
> Conor.
>
> >
> >  required:
> >    - compatible
> > @@ -41,6 +46,18 @@ required:
> >    - interrupts
> >    - vcc33-supply
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: ilitek,ili9882t
> > +then:
> > +  required:
> > +    - compatible
> > +    - reg
> > +    - interrupts
> > +    - vccio-supply
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.25.1
