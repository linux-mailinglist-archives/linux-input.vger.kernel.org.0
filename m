Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77DC753DEA3
	for <lists+linux-input@lfdr.de>; Mon,  6 Jun 2022 00:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348354AbiFEWgI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Jun 2022 18:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244959AbiFEWgH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Jun 2022 18:36:07 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7657337A3D;
        Sun,  5 Jun 2022 15:36:06 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id az35so2608751qkb.3;
        Sun, 05 Jun 2022 15:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qdL2h+CpB7Qp73uInrXQknZDwtjhnJMiR1ys7J8wUKg=;
        b=K8sjgGRlTe1PDPw+Rvvc45VuL94iDn2+bCOKlsiygyPSkOsKJjCcGTfBly81Jlvf/H
         Ai5xMDtXacyt8XSzUhKe4HmM0R0O3Dd71pFODxnkYU7sn+/k5XoQKXkabBiv4BbcIbaL
         sH2fJp41boS5pKI6sHzT5oa7Y3aUxFBFt5x2zs1DYCYgeEiPOfF770CThQz8wbIpKERF
         ZIAT2C4Vxs7cyAcnwfd0eZTGjwT7stCuKrbyXSI/cvMXE07aS6dKrRUe9rl3UFValqfA
         pATKT3sdkkMy6+pNecvok/ewqb8JapAs2zhAgHXwhkkC3ab4o2wzqTGrsnldEf8hsBns
         mRBA==
X-Gm-Message-State: AOAM532dMR8wKgzVoidxjqxaVQruvil9xkhhT4pp+QJgNDXwmNVR1V6O
        MuJtqJvRji8oU1InXhSuNQ==
X-Google-Smtp-Source: ABdhPJxcqt/PoDG0WQ5Wt6/haRjT98u70HDtx6+YvKp5Fc9p2f5o+gZXGKA17Vxnzj4zMjyuUlf1bA==
X-Received: by 2002:ae9:e50f:0:b0:6a6:a470:5 with SMTP id w15-20020ae9e50f000000b006a6a4700005mr8671243qkf.705.1654468565587;
        Sun, 05 Jun 2022 15:36:05 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:1bdb:2e61:f12:452:5315:9c7e])
        by smtp.gmail.com with ESMTPSA id y20-20020ac87c94000000b00304ea539edesm2054546qtv.16.2022.06.05.15.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 15:36:05 -0700 (PDT)
Received: (nullmailer pid 3653388 invoked by uid 1000);
        Sun, 05 Jun 2022 22:36:03 -0000
Date:   Sun, 5 Jun 2022 17:36:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, heiko@sntech.de,
        krzysztof.kozlowski+dt@linaro.org, dmitry.torokhov@gmail.com,
        maccraft123mc@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: adc-joystick: bindings for
 adc-joystick-polled
Message-ID: <20220605223603.GA3649253-robh@kernel.org>
References: <20220601191730.29721-1-macroalpha82@gmail.com>
 <20220601191730.29721-2-macroalpha82@gmail.com>
 <db2795c639cc092e54980de6f3af3b01@artur-rojek.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db2795c639cc092e54980de6f3af3b01@artur-rojek.eu>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 01, 2022 at 09:44:43PM +0200, Artur Rojek wrote:
> On 2022-06-01 21:17, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> 
> Hi Chris,
> 
> > 
> > Add devicetree bindings for adc-joystick-polled.
> > 
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  Documentation/devicetree/bindings/input/adc-joystick.yaml | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > index 2ee04e03bc22..a9d2ac157322 100644
> > --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > @@ -12,11 +12,15 @@ maintainers:
> > 
> >  description: >
> >    Bindings for joystick devices connected to ADC controllers supporting
> > -  the Industrial I/O subsystem.
> > +  the Industrial I/O subsystem. Supports both polled devices where no
> > +  iio trigger is available and non-polled devices which are triggered
> > +  by iio.
> > 
> >  properties:
> >    compatible:
> > -    const: adc-joystick
> > +    enum:
> > +      - adc-joystick
> > +      - adc-joystick-polled
> 
> There is no need to create a new compatible for your functionality. Instead,
> just add a new (optional) property.

Perhaps the already defined for input devices 'poll-interval'.

Rob
