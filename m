Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F1B681C9E
	for <lists+linux-input@lfdr.de>; Mon, 30 Jan 2023 22:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjA3VXq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Jan 2023 16:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjA3VXp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Jan 2023 16:23:45 -0500
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D9B30E9D;
        Mon, 30 Jan 2023 13:23:44 -0800 (PST)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-16332831ed0so16881181fac.10;
        Mon, 30 Jan 2023 13:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXDVqlordLFHwv2zr49dgBWgwD0E9baFCXpCLTA+9pk=;
        b=ODbSrFAFdtlI+ZjkskzS+lJkDa5KyrvKXXpptBT5hgIneyLr4nPzUqhBP1t4rQjgaN
         GAEj10dTsqUCIX2Knk8Z5iul16hyZLrMVdebLzHBPZziIvUwtC6B3FoJALSl2xOg2vK1
         spVugjrmE5oDc93OXeP1CV31jO5L1OwzRWqQBV3nejHvUze1IlERr+lCwqaizvbyhG9v
         V0c10bmL4HyxiZi/mAc+mXwHxEQnPx9FqkTSkNE3Ai2UPP0b5w25KqPgazlqM5Wn8fCe
         a/uNISSz8cvO7gjjmJkrYNDSBM2MHwhea+FWBFozhFShgSyo4SZwJ7Yg/KcJRx77rAeY
         Z2yw==
X-Gm-Message-State: AO0yUKVG+Ni14yCjZv4mbYrRz2Gkw03gn31ZtJFrL+EJVvXb71OafxPa
        C+sbTT3fGwSnFGO2+GPcMA==
X-Google-Smtp-Source: AK7set/OKWSuNqcHN4pW1hLW02IPKCRs0GojSJeFzFU4IJj+sOO/th/hbqg/lSpBiSkyrx0TTlLPUQ==
X-Received: by 2002:a05:6870:b48c:b0:163:3d6c:848b with SMTP id y12-20020a056870b48c00b001633d6c848bmr11166165oap.31.1675113823327;
        Mon, 30 Jan 2023 13:23:43 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f8-20020a056871070800b00163b85ef1bfsm856316oap.35.2023.01.30.13.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 13:23:43 -0800 (PST)
Received: (nullmailer pid 3533240 invoked by uid 1000);
        Mon, 30 Jan 2023 21:23:42 -0000
Date:   Mon, 30 Jan 2023 15:23:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: input: iqs626a: Redefine trackpad
 property types
Message-ID: <167511382145.3532957.4191474297906568204.robh@kernel.org>
References: <Y9RQCQa69f3TaiWf@nixie71>
 <Y9RQcddToBr1rrnJ@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9RQcddToBr1rrnJ@nixie71>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Fri, 27 Jan 2023 16:30:09 -0600, Jeff LaBundy wrote:
> Following a recent refactor of the driver to properly drop unused
> device nodes, the driver expects trackpad channel touch thresholds
> and ATI base values to be specified under single trackpad channel
> child nodes.
> 
> This enhancement moves both properties to scalar values as opposed
> to arrays, making their types consistent across bindings.
> 
> Fixes: a8f1f0dc865c ("dt-bindings: input: Add bindings for Azoteq IQS626A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
>  - Added to series
> 
>  .../devicetree/bindings/input/iqs626a.yaml    | 94 +++++++++++++------
>  1 file changed, 67 insertions(+), 27 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
