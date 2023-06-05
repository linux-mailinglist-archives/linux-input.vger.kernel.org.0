Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79CE0721DC6
	for <lists+linux-input@lfdr.de>; Mon,  5 Jun 2023 08:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjFEGDa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jun 2023 02:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjFEGD1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jun 2023 02:03:27 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DEAD3
        for <linux-input@vger.kernel.org>; Sun,  4 Jun 2023 23:03:25 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b280319df5so133691a34.3
        for <linux-input@vger.kernel.org>; Sun, 04 Jun 2023 23:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685945004; x=1688537004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0Yw8elYtiYzWozkgNSpagrAOBmH8kfH6Po7gRfewsU=;
        b=i/qC4qKsUwZmrc2NzHVzDh8VkEzPd/VXd2RimZKN9QjIW6o6os0oYTSMuJVfUacGJA
         grbddwKihXgQLZdlyKC+5YnGdOylIiihLnlVtHykNFc74wKTO1GipRyRNX7CHKpVTUUY
         32W847l1id4x6Tr4SyDInCqMRP0iYJLKct64JUYngYU7KKVRhti2D8nKL6FP2my2MI0R
         tFMPl/94oqSMC682QUUtOhowDoouMohjyWYPD5rBDTahFxTpgPOCOmPhdtJaWhAKSMUI
         CCwWkGWO8VBykjWVaUNYVy5xbFRaJAT4CYx18826w51ahz1/6GQ1GHdqI86fd+MF9Pq8
         JDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685945004; x=1688537004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0Yw8elYtiYzWozkgNSpagrAOBmH8kfH6Po7gRfewsU=;
        b=KlhuILoA2PjVt7wWKKvXRYmcV2t1nSMsRCV/PdndlDYFVlQS/YmI8R+6YiTJ4yhmA+
         GUVQMNBzgw0BRuMe2i2dPlCMW32j8SruW+yirEoltsa2KhHL6aqf0aUJmCxJhCnSrJC8
         osVFadHnQ6O5iRozUt+JokeW6AH551ow7z0SSbBbdpMU+o4YZH7Ixqi/bSsfcZXJN3kv
         p47C+RZCJMikyFVcEM9orwtAfyYGqtI/SlIX99dVzyZfjUrN9rchcDc06yLp/xcnWolQ
         HB/oWieV5a67EhLSLVsJUXY4FLocp1DhyL6S1epYHf7OWVNVUEr73sQzfFibmkn2HyI6
         ovVA==
X-Gm-Message-State: AC+VfDxFNcshoIiAwge3DDJHPfq3lj1i+O8WYKHic06gsDCSUKpJMt2X
        BlzBCBg/bZ6F7numlZOBzXTTxRKAzBS6nE57szKyOg==
X-Google-Smtp-Source: ACHHUZ5NwiNSYQpTUWHSbja4IK0c8lNse+oq4gdAeGBmoacQoR3HGcVWbLZofoaZtDubqLWpihVJfknO+G/vPzNMQUs=
X-Received: by 2002:a05:6359:2e90:b0:129:bf30:3ee with SMTP id
 rp16-20020a0563592e9000b00129bf3003eemr5325673rwb.7.1685945004606; Sun, 04
 Jun 2023 23:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230602140948.2138668-1-yangcong5@huaqin.corp-partner.google.com>
 <20230602140948.2138668-2-yangcong5@huaqin.corp-partner.google.com> <afd610cf-954f-afc2-00da-86da9fe4192d@linaro.org>
In-Reply-To: <afd610cf-954f-afc2-00da-86da9fe4192d@linaro.org>
From:   cong yang <yangcong5@huaqin.corp-partner.google.com>
Date:   Mon, 5 Jun 2023 14:03:13 +0800
Message-ID: <CAHwB_NLHsbxayS+Y9au7WqBM6rXdnoqUdemNFqBCmaLVkiTr9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: Add ilitek 9882T
 touchscreen chip
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dianders@chromium.org,
        hsinyi@google.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,Krzysztof,
   Thanks for Krzysztof.Sorry, I didn't run `make dt_binding_check. I
will check before sending V2 patch.

On Fri, Jun 2, 2023 at 10:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/06/2023 16:09, Cong Yang wrote:
> > Add an ilitek touch screen chip ili9882t.
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
>
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
>
> There is no way this would work and if you test you will see error msg.
> Feel free to ping if message is unclear.
>
> > ---
> >  .../bindings/input/elan,ekth6915.yaml         | 36 ++++++++++++++-----
> >  1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml=
 b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > index 05e6f2df604c..73e94cb6c4e0 100644
> > --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > @@ -15,11 +15,15 @@ description:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - const: elan,ekth6915
> > +    oneOf:
>
> It's not oneOf. Just enum

Done,thanks.

>
> > +      - enum:
> > +        - elan,ekth6915
> > +        - ilitek,ili9882t
> >
> >    reg:
> > -    const: 0x10
> > +    enum:
> > +      - 0x10
> > +      - 0x41
> >
> >    interrupts:
> >      maxItems: 1
> > @@ -29,17 +33,31 @@ properties:
> >
> >    vcc33-supply:
> >      description: The 3.3V supply to the touchscreen.
> > +                 If using ili9882t then this supply will not be needed=
.
>
> Are you sure these are compatible devices then? What does it mean "not
> needed"? Is the pin there or is not?

Yes,ili9882t this touch ic not needed 3.3V supply,this pin does not exist.

>
> >
> >    vccio-supply:
> >      description:
> >        The IO supply to the touchscreen. Need not be specified if this =
is the
> >        same as the 3.3V supply.
> > -
> > -required:
> > -  - compatible
> > -  - reg
> > -  - interrupts
> > -  - vcc33-supply
> > +      If using ili9882t, the IO supply is required.
> > +
> > +  required:
>
> NAK. Really. Test patches before sending.
>
> Best regards,
> Krzysztof
>
