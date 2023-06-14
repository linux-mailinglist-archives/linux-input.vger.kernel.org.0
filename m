Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B4E7307A4
	for <lists+linux-input@lfdr.de>; Wed, 14 Jun 2023 20:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbjFNSwf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jun 2023 14:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235333AbjFNSwe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jun 2023 14:52:34 -0400
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC381BF8;
        Wed, 14 Jun 2023 11:52:33 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-33b1e83e204so30352865ab.1;
        Wed, 14 Jun 2023 11:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686768752; x=1689360752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCpVlSRFlqkUQjM/Q9VL2Wm8eWOxSr76hGFfxs+TKZg=;
        b=Z9+bRS7fim5IT1gFp83+BMcxaSZMK0V5Bv/DxRUGdwnzfbWl7XhS8wUv+iHI5cn1xV
         BHMuqhuy7rAYmnhbaQBGobvbRbSyl+JDr2Jhl6QcxCQFiamuJKnJEVz6w++zABWTm2s6
         jCpjvs4Kg6kNZzPekitwMv29yt5HDgR7tlXYw9/HteQWuVnLnOODwmL6Xkhu3EwA/R7u
         QInjwvvLDVQbtJ25OuzN9o4S/vDGd3Hb7V2WIObGS8+hdrqprRbh5qPhZOQDEx0sTVds
         DUGOPk6hqAP5GnhpOmccVNblr6XYKIA4KG21EiAFvCbS53NqS5pVJFPotUvkGByoVvDP
         zA1A==
X-Gm-Message-State: AC+VfDw4lkZyPNUW1uMnCf+J6LS9t3Srj0akMp1FcHkb4+RkPHbfsCS2
        jPk6tb05SWLMguHgSP4eqg==
X-Google-Smtp-Source: ACHHUZ7bGk2jGf54tWHsuh+vvc3VVqQkxnWcCKRM9WYd9nN8uP8wmMZ2HlavY2EqEGYeMOAcSyuqwA==
X-Received: by 2002:a92:b011:0:b0:325:b002:89b4 with SMTP id x17-20020a92b011000000b00325b00289b4mr13284746ilh.25.1686768752160;
        Wed, 14 Jun 2023 11:52:32 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ed13-20020a056638290d00b004161870da90sm5184482jab.151.2023.06.14.11.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:52:31 -0700 (PDT)
Received: (nullmailer pid 2542467 invoked by uid 1000);
        Wed, 14 Jun 2023 18:52:30 -0000
Date:   Wed, 14 Jun 2023 12:52:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <168676874965.2542409.6244964295533099009.robh@kernel.org>
References: <ZHVD/9OgRTAwBhqx@nixie71>
 <ZHVEa0yM1LLUJEfO@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHVEa0yM1LLUJEfO@nixie71>
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


On Mon, 29 May 2023 19:33:47 -0500, Jeff LaBundy wrote:
> Add bindings for the Azoteq IQS7210A/7211A/E family of trackpad/
> touchscreen controllers.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
>  - Renamed 'azoteq,default-comms' to 'azoteq,forced-comms-default' and redefined
>    0, 1 and 2 as unspecified, 0 and 1, respectively
>  - Defined ATI upon its first occurrence
>  - Redefined 'azoteq,gesture-angle' in units of degrees
>  - Declared 'azoteq,rx-enable' to depend upon 'azoteq,tx-enable' within the
>    'trackpad' node
> 
> Hi Rob,
> 
> I attempted to reference existing properties from a common binding [1] as per
> your feedback in [2], however 'make DT_CHECKER_FLAGS=-m dt_binding_check' fails
> with the message 'Vendor specific properties must have a type and description
> unless they have a defined, common suffix.'
> 
> This seems related to the discussion in [3], where you warned that the tooling
> cannot yet deduce that vendor-specific properties have already been typed in an
> externally $ref'd binding. The only other example of a common vendor schema is
> [4], but in that case the common properties are defined under arbitraily named
> pinmux config nodes. As such, they are part of 'additionalProperties' instead of
> 'properties' and hence exempt from this particular validation.
> 
> Please let me know if I am mistaken (surprise!), in which case I will continue
> on this path and send a v3. Otherwise, I would like to suggest that the review
> moves forward under the premise that I will happily consolidate these bindings
> once the tooling supports this idea.
> 
> Kind regards,
> Jeff LaBundy
> 
> [1] https://github.com/jlabundy/linux/tree/azoteq-common (WIP)
> [2] https://patchwork.kernel.org/comment/25003573/
> [3] https://patchwork.kernel.org/comment/23867857/
> [4] Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml
> 
>  .../input/touchscreen/azoteq,iqs7211.yaml     | 769 ++++++++++++++++++
>  1 file changed, 769 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

