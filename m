Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2660C5B6C7C
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 13:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbiIMLoT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 07:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbiIMLoS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 07:44:18 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86233564E6;
        Tue, 13 Sep 2022 04:44:17 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso7876593otb.6;
        Tue, 13 Sep 2022 04:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bfJvXFyr0XimU/axNW1lkIA8juoI5cgi8wQItLLR21U=;
        b=CxbKFSp5v/8vDpQQ6GcM0SuAeopAi+PrL5cGw7qjcY3QCcdkNRf2JvtPqX5joZD6XX
         /K1FiiZdfbmaK6aZqi96W+R3sLPM95gC25OTpsNBn3vGxFw63/C6RR2V7owRgW3ZLZbc
         rW+FHur8sp1+UO8ZOmrXhrwc31UT6C03Yf86lH2mYFBl46auRkoJ6mI7YHcpbMAWGfnD
         I974hP5cQoWgDvsWTW62byq0RYnTuD6/hDC8MVl+A2q4JvHdAdYSjzphvhZgBr7ipxww
         IuSDkZ1ctiRfXf2V2KOuK03sF+o0OgGiQ4vUeP/sL+sy0XbcRdmXXUFSCGPnOhUdt/Hp
         Iz0g==
X-Gm-Message-State: ACgBeo3JEKUScRQaRIXYRJNtWLgxIRpRgAjvD++i4Dx1ak4JisYCGtQN
        sbD1wA6sWDSFUjqjU5H/XulBzsWN+w==
X-Google-Smtp-Source: AA6agR7YUVpBZdXEjhKYZqpdPImCEd6xhmnls7EAeu25WFD+sP70u32/Zg2nPT0qZauSsnFqOdUc2g==
X-Received: by 2002:a05:6830:1642:b0:655:ade9:2a90 with SMTP id h2-20020a056830164200b00655ade92a90mr8230625otr.19.1663069456686;
        Tue, 13 Sep 2022 04:44:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d3-20020a9d5e03000000b00636d4e8d480sm5813901oti.19.2022.09.13.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 04:44:16 -0700 (PDT)
Received: (nullmailer pid 3364577 invoked by uid 1000);
        Tue, 13 Sep 2022 11:44:15 -0000
Date:   Tue, 13 Sep 2022 06:44:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 10/11] dt-bindings: input: iqs7222: Add support for
 IQS7222A v1.13+
Message-ID: <20220913114415.GA3364519-robh@kernel.org>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-11-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908131548.48120-11-jeff@labundy.com>
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

On Thu, 08 Sep 2022 08:15:47 -0500, Jeff LaBundy wrote:
> IQS7222A revisions 1.13 and later widen the gesture multiplier from
> x4 ms to x16 ms; update the binding accordingly.
> 
> As part of this change, refresh the corresponding properties in the
> example as well.
> 
> Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  .../bindings/input/azoteq,iqs7222.yaml           | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
