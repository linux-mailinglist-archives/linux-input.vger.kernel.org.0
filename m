Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A941729CD3
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 16:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241420AbjFIO0i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 10:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241417AbjFIO02 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 10:26:28 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823003C2B;
        Fri,  9 Jun 2023 07:25:41 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77a1cad6532so81433539f.1;
        Fri, 09 Jun 2023 07:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686320740; x=1688912740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZ+YmK/T9GmG6A7tTW5EH5jVTLp9UhBtnlEqA9a5NI8=;
        b=L/kDuRyJpQk5PO7yNXkLPWLqPcMgcrmeCtrt6/+AzH7wEcGUPIhcy8YJ1PA+m72GYK
         cHPA4KKG6qztH61fmL/VS8bn73/u7kUX7afYnf++rffIw14kjIgnUqQznTP5uYeBJoD3
         z8J2IMIjT+NnXaVq663WguSowI3XRIpOCJTNn7v7DoQ3QbYgwt+qYFsp//UAT8aKaToV
         DjF6hJE/rQNVGISF78DNPpzYIXVl2ZT5C+S09WFkPNfYC7+Ph7mQq06Qm06pvr5FRjtm
         9Vul6+1BAeTGFI3XxtmMK0CRhhXeiEjkV4m6+q5IlYRMwXAxHJPiCesNWsk2RirolZLH
         8doA==
X-Gm-Message-State: AC+VfDzGXfT7w/CWcZaEyt/FO5zC+EpI33Ph4e7ZhSs3LGpd1YD11t07
        go068fxuFpz2g2lGr1xfBw==
X-Google-Smtp-Source: ACHHUZ7lJIICtOuYaskf7sg/dUBFKYvtBxAgH/nZ70S/2reCEK1731gMhLBF3Wrc8KGVz3qjO63tqw==
X-Received: by 2002:a6b:7f47:0:b0:776:f6cd:f68e with SMTP id m7-20020a6b7f47000000b00776f6cdf68emr1750607ioq.1.1686320740592;
        Fri, 09 Jun 2023 07:25:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e9-20020a056638020900b00418af04e405sm283201jaq.116.2023.06.09.07.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:25:39 -0700 (PDT)
Received: (nullmailer pid 885695 invoked by uid 1000);
        Fri, 09 Jun 2023 14:25:38 -0000
Date:   Fri, 9 Jun 2023 08:25:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <20230609142538.GA878396-robh@kernel.org>
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

On Mon, May 29, 2023 at 07:33:47PM -0500, Jeff LaBundy wrote:
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

Is that because you have differing constraints in each case?

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
