Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED984ACD58
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 02:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbiBHBFo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Feb 2022 20:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241653AbiBGXdp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Feb 2022 18:33:45 -0500
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F240AC061355;
        Mon,  7 Feb 2022 15:33:44 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id q145-20020a4a3397000000b002e85c7234b1so15604687ooq.8;
        Mon, 07 Feb 2022 15:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eD+WbFNgoiVOWs2+mRiGqAg5p4oZ63XL14CKRP0Hztk=;
        b=yw1+RUppI70W6ANKDtxpI2/MxQ3fQ4yjS1OsC+DqDRas5+ukbmAP9sxlvgyUR08HEs
         7aYwtSAqGyxj5mYZTA28ah+cTvFPRObY0jGPtxIaDIMKd6obsznFpCGtEd4jM81/PSwA
         Ghs8EkeZHBL4nf6BlCD3WCIODzH5ou0JpKGEp1lcY829cSymnK/C2aZG+eI5v4sogrri
         r60T8b+85Ez7mROkH/a96ssyoFsk1BC9+CVyNogt4kTLjsm0EC3o50ECR+0Zx8Zg80Ab
         fFyskRdjv5GmPmVZWioLKdF/ak0gvqNOFEVIboVkM3Ri8Zppun558nIj1LgfkFUkh0Xf
         /07g==
X-Gm-Message-State: AOAM531v32t31sf6fBfUv1xRUn5HT/+jTo2ndwmcscysPvc3Pb9lLFJK
        2scTs3x/mSzAUOouYzwaOQ==
X-Google-Smtp-Source: ABdhPJwfq4DJq1b0SJyD+QTW8RjwU7x0Hk110ctjUsDCjQw3ledmXS2oTNIV7EBNIzAK1+oIhAQQUw==
X-Received: by 2002:a05:6870:1942:: with SMTP id m2mr448317oak.152.1644276824260;
        Mon, 07 Feb 2022 15:33:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v78sm4844873oie.18.2022.02.07.15.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 15:33:43 -0800 (PST)
Received: (nullmailer pid 1136265 invoked by uid 1000);
        Mon, 07 Feb 2022 23:33:42 -0000
Date:   Mon, 7 Feb 2022 17:33:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7222A/B/C
Message-ID: <YgGsVmxoA2szjJqv@robh.at.kernel.org>
References: <20220126030723.223809-1-jeff@labundy.com>
 <20220126030723.223809-2-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126030723.223809-2-jeff@labundy.com>
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

On Tue, 25 Jan 2022 21:07:22 -0600, Jeff LaBundy wrote:
> This patch adds bindings for the Azoteq IQS7222A/B/C family of
> capacitive touch controllers.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
>  - Renamed binding to include vendor prefix
>  - Corrected error in channel node name regex
>  - Removed superfluous '#address-cells' and '#size-cells' properties
>  - Added more detail to 'azoteq,max-counts' property
> 
>  .../bindings/input/azoteq,iqs7222.yaml        | 960 ++++++++++++++++++
>  1 file changed, 960 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
