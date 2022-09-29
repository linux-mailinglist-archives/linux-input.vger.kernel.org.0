Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 686EE5EFD7D
	for <lists+linux-input@lfdr.de>; Thu, 29 Sep 2022 20:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiI2S7I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Sep 2022 14:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiI2S7H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Sep 2022 14:59:07 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D75A145964;
        Thu, 29 Sep 2022 11:59:06 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id d64so2541483oia.9;
        Thu, 29 Sep 2022 11:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=LeJWHLpXoFoED30POiS4pZiuNzEPtbfXVmIf+GU0wN8=;
        b=IjK1UsIQ8RMDBjBI6DjjbO5Reop29x+bNxs1sIQpLHrPwAKdPbJE78DB0WQKbd+WLG
         L30IHhtpK7OLgm4unGFBI2ApkUU791Mnt8MLah0dkXNCVri3C9ELM9o2gCor6NEdQRia
         Duxi7BQZKk3tXS0D9kyqA74RNowm6cCSgmLBQwYAbsQYE835bQY9jfao5REe7foWFTZU
         rXoq4cS9YtX/MHSUiGXphMmgSU3MHjQ54nAc0Sg/3aLXi9RiaD0j0AzLAjkT4wW7HGcr
         tX1oIUolhFzw9ek4umU5KL9LeRHGmbt6AU/YC+LpvKCcaQVCEGPlS1mp33EOf6Cri7LQ
         mrVg==
X-Gm-Message-State: ACrzQf2wDyhJIL4qx7c8Q30Vs/lSh9vuQh9IPW9fGiTl0miFlUtFKxcD
        /cP4F44fY4gUpl1vlGYt4Q==
X-Google-Smtp-Source: AMsMyM7GBmsPAjklKjH4ijzxlpUqLg6rz8YY/hoHi9CELAXiSxxjzcfJVUgOTZFXWWM3yKxGqtdqpA==
X-Received: by 2002:a05:6808:1b28:b0:34f:9229:2fa2 with SMTP id bx40-20020a0568081b2800b0034f92292fa2mr7718833oib.207.1664477945665;
        Thu, 29 Sep 2022 11:59:05 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q65-20020acac044000000b00342fc99c5cbsm25271oif.54.2022.09.29.11.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 11:59:05 -0700 (PDT)
Received: (nullmailer pid 2579022 invoked by uid 1000);
        Thu, 29 Sep 2022 18:59:04 -0000
Date:   Thu, 29 Sep 2022 13:59:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: input: iqs7222: Reduce 'linux,code'
 to optional
Message-ID: <166447792564.2578645.12532063566508669177.robh@kernel.org>
References: <YyP7l/ts6SFI9iM2@nixie71>
 <YyP8Cxtyh/iKQTfM@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyP8Cxtyh/iKQTfM@nixie71>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 15 Sep 2022 23:31:07 -0500, Jeff LaBundy wrote:
> Following a recent refactor of the driver to properly drop unused
> device nodes, the 'linux,code' property is now optional. This can
> be useful for applications that define GPIO-mapped events that do
> not correspond to any keycode.
> 
> Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
>  - Updated commit message
> 
>  Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
