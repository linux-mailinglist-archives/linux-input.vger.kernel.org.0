Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948AB72CA11
	for <lists+linux-input@lfdr.de>; Mon, 12 Jun 2023 17:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237126AbjFLP3d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jun 2023 11:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236249AbjFLP3a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jun 2023 11:29:30 -0400
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08737E62;
        Mon, 12 Jun 2023 08:29:29 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-777b4c9e341so292571739f.0;
        Mon, 12 Jun 2023 08:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686583768; x=1689175768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02DkNPWWONbv0u1k4t26LVu45zaxMd+aECoLnHrf170=;
        b=MdF2tOlfSHiirrsl7M0p3aqTekOVXCxokiuy1fPEoMEdcOcpvzVD7ctZ9pItRzy4Um
         cj2ZjYE80tyM8qjoFxx8fPEb1i8DrG7TmX0Sq+cWM5UwUpcWPMP4ErRKJQZDO30UosWW
         RRB9peu5Ih0uxMSFhMYL2RUSknuxZBjzjEHLMEgGdkJHcswO6C6eEKXIFWI30nRxkyM8
         xlvyedY7GSlGuQ54JYd5xQUhMp2KnQF1Po7VAHRbCbZmeNdY+0J3JCFgfwndU8KT8ZDS
         w+RSAdlxjGA6Cffgf3uVT9ntd4iOfMg/HZj8G++U5zSzdxOUUJQ2PakLjpZ3doNG7vGG
         9ypA==
X-Gm-Message-State: AC+VfDzOw6JkXbPl1ADvVoJ8c+VDDsBl6LAevqptkn4Qgg8n1dTRvaxs
        iCe1+k1941A8kaRrFXWUVw==
X-Google-Smtp-Source: ACHHUZ5OTMtb2/1iP67kCEtc1B3C124Kbz/uogOGn3ZX8BywrbEYr3v1mN1WAB1C6eG21xCyaXSDNQ==
X-Received: by 2002:a5e:db07:0:b0:777:8e86:7636 with SMTP id q7-20020a5edb07000000b007778e867636mr9282230iop.15.1686583768097;
        Mon, 12 Jun 2023 08:29:28 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k19-20020a02cb53000000b004167410a9bcsm2773773jap.113.2023.06.12.08.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 08:29:27 -0700 (PDT)
Received: (nullmailer pid 87347 invoked by uid 1000);
        Mon, 12 Jun 2023 15:29:25 -0000
Date:   Mon, 12 Jun 2023 09:29:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <20230612152925.GA65549-robh@kernel.org>
References: <ZHVD/9OgRTAwBhqx@nixie71>
 <ZHVEa0yM1LLUJEfO@nixie71>
 <20230609142538.GA878396-robh@kernel.org>
 <ZIZvkGqr4a0kOGnR@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIZvkGqr4a0kOGnR@nixie71>
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

On Sun, Jun 11, 2023 at 08:06:24PM -0500, Jeff LaBundy wrote:
> Hi Rob,
> 
> On Fri, Jun 09, 2023 at 08:25:38AM -0600, Rob Herring wrote:
> > On Mon, May 29, 2023 at 07:33:47PM -0500, Jeff LaBundy wrote:
> > > Add bindings for the Azoteq IQS7210A/7211A/E family of trackpad/
> > > touchscreen controllers.
> > > 
> > > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > > ---
> > > Changes in v2:
> > >  - Renamed 'azoteq,default-comms' to 'azoteq,forced-comms-default' and redefined
> > >    0, 1 and 2 as unspecified, 0 and 1, respectively
> > >  - Defined ATI upon its first occurrence
> > >  - Redefined 'azoteq,gesture-angle' in units of degrees
> > >  - Declared 'azoteq,rx-enable' to depend upon 'azoteq,tx-enable' within the
> > >    'trackpad' node
> > > 
> > > Hi Rob,
> > > 
> > > I attempted to reference existing properties from a common binding [1] as per
> > > your feedback in [2], however 'make DT_CHECKER_FLAGS=-m dt_binding_check' fails
> > > with the message 'Vendor specific properties must have a type and description
> > > unless they have a defined, common suffix.'
> > 
> > Is that because you have differing constraints in each case?
> 
> In the failing example [2], I have started with a simple boolean that carries
> nothing but a type and description. From the new azoteq,common.yaml:
> 
> properties:
>   [...]
> 
>   azoteq,use-prox:
>     type: boolean
>     description: foo
> 
> And from the first consumer:
> 
> patternProperties:
>   "^hall-switch-(north|south)$":
>     type: object
>     allOf:
>       - $ref: input.yaml#
>       - $ref: azoteq,common.yaml#
>     description: bar
> 
>     properties:
>       linux,code: true
>       azoteq,use-prox: true
> 
> However, the tooling presents the following:
> 
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> /home/jlabundy/work/linux/Documentation/devicetree/bindings/input/iqs62x-keys.yaml: patternProperties:^hall-switch-(north|south)$:properties:azoteq,use-prox: True is not of type 'object'
> 	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
> 	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> 
> [...]
> 
> I am committed to addressing your feedback; to help me do so, can you help me
> identify what I've done wrong, and/or point me to an example that successfully
> passes dt_binding_check?

You're not doing anything wrong. There's 2 options here. The first is we 
could just relax the check to allow boolean schema for vendor 
properties. The main issue with that is we then have to look for that 
improperly used and it doesn't help if you do have additional 
constraints to add on top of the common definition. The former can 
mostly be addressed by checking there is a type associated with the 
property. I'm going to look into adding that.

Alternatively, you could drop listing the properties and 
use 'unevaluatedProperties'. That's not quite equal to what you have. 
Presumably, you have 'additionalProperties' in this case, so listing 
them serves the purpose of defining what subset of properties each node 
uses from the referenced schema. We frequently don't worry if there are 
common properties not used by a specific schema. This also wouldn't work 
if you have additional constraints to add.

Rob
