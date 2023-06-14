Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED15D73079F
	for <lists+linux-input@lfdr.de>; Wed, 14 Jun 2023 20:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234804AbjFNSvS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jun 2023 14:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjFNSvP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jun 2023 14:51:15 -0400
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BEAED;
        Wed, 14 Jun 2023 11:51:13 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-34078ce751dso7432785ab.0;
        Wed, 14 Jun 2023 11:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686768673; x=1689360673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVA+IzrsLI7gIWGUpjJR28BuOP2Zxhu8AmoN5ruDpG0=;
        b=Ebj7//GRd+kdxpPDTiW2UVl5v/7NFMZAZ6C72tLoFdC3n1hD7p6oZgrvO4XcwLQbBo
         +W9c9JJZqEeQ+ogqOhbPaEmA3+5G4HUllcdy9gIpWPJDtgwyRg4GAdEhceQGX2EgDoCL
         M8I75+b422YWDQoL/T61NnTCQg7w//aBADmXVZ3v0vCeLWH6nLQmfOzw94wUhdORfrrc
         HENRURBmPn74X2iNiGl/anF6dq1Ubbyos2auKkFNsnpE3nFZ3Pd8HGInSeCVAzIEpVLG
         qzy29ek7eJYMqRZS4GzAXAgvU+u8/IqBoq4uhtDxm9jrEvAisHPEJkLJNWtAV66INb5f
         boLQ==
X-Gm-Message-State: AC+VfDwtv6NLfwVkzgJkQnOTQOlR+kzAOX6eEZYTf1THeZVBArm01s3t
        6Esci20jYFMbxfChXgbpuVxVH/+WJA==
X-Google-Smtp-Source: ACHHUZ4JCkKMdidGG3UVc7bPuwiaUSQkEZChMbMwuidbnU0Zik0qfT3e9jYdXL0+Mny5bzJy/KFxOg==
X-Received: by 2002:a92:ce48:0:b0:340:67df:56ea with SMTP id a8-20020a92ce48000000b0034067df56eamr5220951ilr.9.1686768672922;
        Wed, 14 Jun 2023 11:51:12 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t10-20020a92c0ca000000b00335c6e914dcsm5546216ilf.78.2023.06.14.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:51:12 -0700 (PDT)
Received: (nullmailer pid 2540730 invoked by uid 1000);
        Wed, 14 Jun 2023 18:51:10 -0000
Date:   Wed, 14 Jun 2023 12:51:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <20230614185110.GA2530944-robh@kernel.org>
References: <ZHVD/9OgRTAwBhqx@nixie71>
 <ZHVEa0yM1LLUJEfO@nixie71>
 <20230609142538.GA878396-robh@kernel.org>
 <ZIZvkGqr4a0kOGnR@nixie71>
 <20230612152925.GA65549-robh@kernel.org>
 <ZIe/Ti7u+2VHlahA@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIe/Ti7u+2VHlahA@nixie71>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 12, 2023 at 07:58:54PM -0500, Jeff LaBundy wrote:
> Hi Rob,
> 
> On Mon, Jun 12, 2023 at 09:29:25AM -0600, Rob Herring wrote:
> > On Sun, Jun 11, 2023 at 08:06:24PM -0500, Jeff LaBundy wrote:
> > > Hi Rob,
> > > 
> > > On Fri, Jun 09, 2023 at 08:25:38AM -0600, Rob Herring wrote:
> > > > On Mon, May 29, 2023 at 07:33:47PM -0500, Jeff LaBundy wrote:
> > > > > Add bindings for the Azoteq IQS7210A/7211A/E family of trackpad/
> > > > > touchscreen controllers.
> > > > > 
> > > > > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > > > > ---
> > > > > Changes in v2:
> > > > >  - Renamed 'azoteq,default-comms' to 'azoteq,forced-comms-default' and redefined
> > > > >    0, 1 and 2 as unspecified, 0 and 1, respectively
> > > > >  - Defined ATI upon its first occurrence
> > > > >  - Redefined 'azoteq,gesture-angle' in units of degrees
> > > > >  - Declared 'azoteq,rx-enable' to depend upon 'azoteq,tx-enable' within the
> > > > >    'trackpad' node
> > > > > 
> > > > > Hi Rob,
> > > > > 
> > > > > I attempted to reference existing properties from a common binding [1] as per
> > > > > your feedback in [2], however 'make DT_CHECKER_FLAGS=-m dt_binding_check' fails
> > > > > with the message 'Vendor specific properties must have a type and description
> > > > > unless they have a defined, common suffix.'
> > > > 
> > > > Is that because you have differing constraints in each case?
> > > 
> > > In the failing example [2], I have started with a simple boolean that carries
> > > nothing but a type and description. From the new azoteq,common.yaml:
> > > 
> > > properties:
> > >   [...]
> > > 
> > >   azoteq,use-prox:
> > >     type: boolean
> > >     description: foo
> > > 
> > > And from the first consumer:
> > > 
> > > patternProperties:
> > >   "^hall-switch-(north|south)$":
> > >     type: object
> > >     allOf:
> > >       - $ref: input.yaml#
> > >       - $ref: azoteq,common.yaml#
> > >     description: bar
> > > 
> > >     properties:
> > >       linux,code: true
> > >       azoteq,use-prox: true
> > > 
> > > However, the tooling presents the following:
> > > 
> > >   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> > > /home/jlabundy/work/linux/Documentation/devicetree/bindings/input/iqs62x-keys.yaml: patternProperties:^hall-switch-(north|south)$:properties:azoteq,use-prox: True is not of type 'object'
> > > 	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
> > > 	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> > > 
> > > [...]
> > > 
> > > I am committed to addressing your feedback; to help me do so, can you help me
> > > identify what I've done wrong, and/or point me to an example that successfully
> > > passes dt_binding_check?
> > 
> > You're not doing anything wrong. There's 2 options here. The first is we 
> > could just relax the check to allow boolean schema for vendor 
> > properties. The main issue with that is we then have to look for that 
> > improperly used and it doesn't help if you do have additional 
> > constraints to add on top of the common definition. The former can 
> > mostly be addressed by checking there is a type associated with the 
> > property. I'm going to look into adding that.
> 
> Thank you for your feedback. I started with a boolean property at first to
> simply test the idea before moving too far forward. In reality however, the
> common binding has many uint32's and uint32-arrays as well, often with
> different constraints among consumers. For this option to be effective, it
> would need to be extended to all types IMO.
> 
> > 
> > Alternatively, you could drop listing the properties and 
> > use 'unevaluatedProperties'. That's not quite equal to what you have. 
> > Presumably, you have 'additionalProperties' in this case, so listing 
> > them serves the purpose of defining what subset of properties each node 
> > uses from the referenced schema. We frequently don't worry if there are 
> > common properties not used by a specific schema. This also wouldn't work 
> > if you have additional constraints to add.
> 
> Because of varying constraints among each consumer, I do not believe this
> option is viable either.
> 
> I also think adopting 'unevaluatedProperties' here would be confusing from
> a customer perspective in this case. The new common binding has dozens of
> properties for which some are shared between devices A and B but not C, or
> devices B and C but not A.
> 
> Without each device's binding explicitly opting in for supported properties,
> it's difficult for customers to know what is supported for a given device.
> These particular devices are highly configurable yet void of nonvolatile
> memory, so there is simply no way around having so many properties. Most are
> touched in some way throughout various downstream applications.
> 
> Therefore I'd like to propose option (3), which is to move forward with patch
> [1/2] as-is and decouple the merging of this driver from future enhancements
> to the tooling. While patch [1/2] is admittedly a big binding with some repeat
> descriptions, none of the duplicate properties introduce a conflicting type.
> 
> If in the future option (1) can support all property types and handle varying
> constraints among consumers, I would be happy to be one of the first guinea
> pigs. Does this path seem like a reasonable compromise?

Yes, that's fine.

Rob
