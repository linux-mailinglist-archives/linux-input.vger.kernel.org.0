Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F894E5B0E
	for <lists+linux-input@lfdr.de>; Wed, 23 Mar 2022 23:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243699AbiCWWJN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Mar 2022 18:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238850AbiCWWJN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Mar 2022 18:09:13 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4375C657;
        Wed, 23 Mar 2022 15:07:42 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id d15-20020a9d72cf000000b005cda54187c3so2053389otk.2;
        Wed, 23 Mar 2022 15:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+k118EBZ9Ly3Szi3Mxb7IXwKz7kOcKPTbNJ/BWP0n8U=;
        b=0Alo3+eLDj2hTS9MTS0UsXrepkak5txB6tGYagtLVTrXBcEv73WmDZDeTEdgBsICIr
         bL+NmCQB8kxSTx70QJ9aVRN9C51fDEnRNs5mQTWyeWlp2XAcqffpexiCBfIqVWUmnrPu
         Tz/TqdYjJ3Ua3wxjwITdcO7oTdnu1majv7Nox6QReZdGeAi5HzqsaixwgmF1xjL2pV7z
         e7ZaL807LH+c/+KE2pUBiUTj0UbwRYyBZDlS/d/KcKk6HYw91uw84+vOtAithncAs7R/
         FmfNIRQWIIa+pNw9l/D9zVxdSUWblW9nkjgeqkSZUA4cmIU7W2Lghoq1H805Cl8OGx2N
         WX0g==
X-Gm-Message-State: AOAM531barf292WBq4KHxob4pZVa9fruAHh8rJlauYc9PJP/OQLYZrdL
        ACYQS6N4DsAoVR67KtNm8OMuqpBjmQ==
X-Google-Smtp-Source: ABdhPJw7gnH0on5+VuPG99lAMzszLuHJzDpkKnDuE2x3uL6p6JER3OsZ5NYU+MEvSoY741aHmr4ZMQ==
X-Received: by 2002:a9d:6c94:0:b0:5b2:2c47:7228 with SMTP id c20-20020a9d6c94000000b005b22c477228mr926239otr.14.1648073262156;
        Wed, 23 Mar 2022 15:07:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q6-20020acaf206000000b002ef960f65b3sm522714oih.25.2022.03.23.15.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 15:07:40 -0700 (PDT)
Received: (nullmailer pid 543440 invoked by uid 1000);
        Wed, 23 Mar 2022 22:07:39 -0000
Date:   Wed, 23 Mar 2022 17:07:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: input: Add bindings for Immersion
 ISA1200
Message-ID: <YjuaK09nOztYOmyn@robh.at.kernel.org>
References: <20220315233528.1204930-1-linus.walleij@linaro.org>
 <20220315233528.1204930-2-linus.walleij@linaro.org>
 <YjjNkyChcJcaJi11@robh.at.kernel.org>
 <CACRpkdbz6Ua+0bTJMf-Qc7tju33CmEEgUsxH5KCS_zW3A_-SYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbz6Ua+0bTJMf-Qc7tju33CmEEgUsxH5KCS_zW3A_-SYA@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 23, 2022 at 03:57:44PM +0100, Linus Walleij wrote:
> On Mon, Mar 21, 2022 at 8:10 PM Rob Herring <robh@kernel.org> wrote:
> 
> > > +properties:
> > > +  compatible:
> > > +    description: One compatible per product using this chip. Each product
> > > +      need deliberate custom values for things such as LRA resonance
> > > +      frequency and these are not stored in the device tree, rather we
> > > +      let the operating system look up the appropriate parameters from a
> > > +      table.
> > > +    enum:
> > > +      - immersion,isa1200-janice
> > > +      - immersion,isa1200-gavini
> >
> > Same device, different boards. I think I would put necessary properties
> > in the DT.
> 
> That will be all of these (from the driver):
> 
> +struct isa1200_config {
> +       u8 ldo_voltage;
> +       bool pwm_in;
> +       bool erm;
> +       u8 clkdiv;
> +       u8 plldiv;
> +       u8 freq;
> +       u8 duty;
> +       u8 period;
> +};

Could be all, but in your 2 cases some of these values are the same.

> 
> Example:
> 
> +/* Configuration for Janice, Samsung Galaxy S Advance GT-I9070 */
> +static const struct isa1200_config isa1200_janice = {
> +       .ldo_voltage = ISA1200_LDO_VOLTAGE_30V,
> +       .pwm_in = false,
> +       .clkdiv = ISA1200_HCTRL0_DIV_256,
> +       .plldiv = 2,
> +       .freq = 0,
> +       .duty = 0x3b,
> +       .period = 0x77,
> +};
> 
> This is derived from the compatible rather than individual properties
> or extra regulator and/or clock abstractions in line with:
> Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> 
> Which was originally looking like so:
> https://lore.kernel.org/dri-devel/20170813114448.20179-2-linus.walleij@linaro.org/
> 
> To which you replied:
> https://lore.kernel.org/dri-devel/20170817204424.e2wdkmyp4vyx2qj3@rob-hp-laptop/
> 
> "Normally, we the physical panel is described which would imply all these
> settings. Are there lots of panels with this controller that would
> justify all these settings?"

I reserve the right to contradict myself. :)

Seriously, it's always a judgement call.

> 
> In that case there was one (1)
> 
> In this case there are two (2) products that I know of. It does not have the
> relationship between panel and panel controller products though, but...
> it's not very different.
> 
> I don't think this chip was used a lot, I really tried to find other instances.
> But they could exist of course.

Okay, if you want to leave it like this, I'm fine with that.

Rob
