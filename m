Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB6AB5B6C78
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 13:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbiIMLm6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 07:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbiIMLm5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 07:42:57 -0400
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE2D5C362;
        Tue, 13 Sep 2022 04:42:51 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-12803ac8113so31276455fac.8;
        Tue, 13 Sep 2022 04:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vLbFMBKB5KNrSYg/UbOoaUJEFX5UNztJTZXTeikzwqE=;
        b=aua4GAaZlPXZ60MivzfH2BAJ9XZyjH4vVUubL6crwv6KK1xOtnX8XIJts1FwvwngZq
         hBf0be35p/o9I2t9D5901BZmraSyy5jQ87NyDtd8URRsgij7jJFi0uDZtdk+3M/KPPFj
         rhcGgD2BsNQ1YAcEt99v3DKu5o3zc7mGS+lfstataW85JIgVdcfToxSDGgG8mftCBzAI
         pUjax4dBPJ6SvUmhWn0O0pUKNpE9+cZVvWxpuxg5uldX48tWOLKSJRiXic7ZS6qf2bGM
         x07Uaq5Reb2Luo6dL4uENfhaB7ba6dm+oDTkYbPMCaUOONcAgvEGXyn48nwJsrRgHtAn
         xNIQ==
X-Gm-Message-State: ACgBeo2xb6x1x6t6iTxqxFzwqAoYSuzNOTLOlCfR0faXHnM/EbiygsW2
        4BvNYDlSjsiHNqAuxexLTKSYx/fXig==
X-Google-Smtp-Source: AA6agR7quMbtjrDSwyYPVlQzXsCClp7Y/oFhYe8X9swhNSnN9xSCe3KAkl9YRcizDPKZSgZLFcsyrw==
X-Received: by 2002:aca:5988:0:b0:345:443d:5c32 with SMTP id n130-20020aca5988000000b00345443d5c32mr1229507oib.96.1663069370634;
        Tue, 13 Sep 2022 04:42:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f19-20020a056870899300b0011f400edb17sm7026360oaq.4.2022.09.13.04.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 04:42:50 -0700 (PDT)
Received: (nullmailer pid 3356672 invoked by uid 1000);
        Tue, 13 Sep 2022 11:42:49 -0000
Date:   Tue, 13 Sep 2022 06:42:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 09/11] dt-bindings: input: iqs7222: Allow 'linux,code' to
 be optional
Message-ID: <20220913114249.GA3323895-robh@kernel.org>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-10-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908131548.48120-10-jeff@labundy.com>
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

On Thu, Sep 08, 2022 at 08:15:46AM -0500, Jeff LaBundy wrote:
> The 'linux,code' property has been made optional in the driver;
> update the binding to reflect this change.

But with an old kernel, it would still be required. So still required in 
the DT.

> 
> Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> index 785fb9e83354..913fd2da9862 100644
> --- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> +++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> @@ -473,9 +473,6 @@ patternProperties:
>                Specifies whether the event is to be interpreted as a key (1)
>                or a switch (5).
>  
> -        required:
> -          - linux,code
> -
>          additionalProperties: false
>  
>      dependencies:
> @@ -620,9 +617,6 @@ patternProperties:
>                GPIO, they must all be of the same type (proximity, touch or
>                slider gesture).
>  
> -        required:
> -          - linux,code
> -
>          additionalProperties: false
>  
>      required:
> -- 
> 2.25.1
> 
> 
