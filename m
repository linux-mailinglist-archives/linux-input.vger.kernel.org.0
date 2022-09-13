Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDC35B6C6B
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 13:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbiIMLhS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 07:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiIMLhR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 07:37:17 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E592EF24;
        Tue, 13 Sep 2022 04:37:17 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1225219ee46so31290376fac.2;
        Tue, 13 Sep 2022 04:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=es5VviBfCfjJDWnQQDGsY0ZEFyJ8tjZ9cwVKNT5Gju0=;
        b=zn6Kt8Vc28HpN2r/1EjSUCQF/l2NUb3mLTTaiNrmi09v4nC5Bpd/JX2CYnlhS+BDHO
         t4AzICEcxmWm5HfsdLo7AJ6XRK8R/QiWB+d1sQkDMrEBGeUX4m8ob/vyc0QfnU/9hulK
         VyLPdbSYnwI+hIMHBeqocZuCRbvZ/nMzabNEk0jyLvaC8UdE5boK23ezakvGxKlNQnCY
         gAsXONO+ApUoWTOYkzIv5zMwgPZUlQS1kvFoSfYl4+0riOm3BZC1i4R5dl349qwRRdQ6
         FVtpB158H0M9Neqa+8O+2e0MBuwFzhU6brxdPMa93dkhXEuvapUebYFS9434TfmSRRob
         wQRw==
X-Gm-Message-State: ACgBeo1QOu9f5P+WW0jI/KSus8y8MOGmYUGWRPZnbs4sWIuGLQF9d0Ro
        DgY2bq4A4uYm9doBknOayg==
X-Google-Smtp-Source: AA6agR4q6QrgVZn+8gUM1TPZY7TFs7RSJeRaKHvdLU6Mdg2YsHZyGfnx+v9KqSLvdjrJKXgGcG0znQ==
X-Received: by 2002:a05:6808:1309:b0:344:9497:7821 with SMTP id y9-20020a056808130900b0034494977821mr1282110oiv.50.1663069036239;
        Tue, 13 Sep 2022 04:37:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r19-20020a056870439300b00127d2005ea1sm7189523oah.18.2022.09.13.04.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 04:37:15 -0700 (PDT)
Received: (nullmailer pid 3323511 invoked by uid 1000);
        Tue, 13 Sep 2022 11:37:15 -0000
Date:   Tue, 13 Sep 2022 06:37:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 03/11] dt-bindings: input: iqs7222: Correct minimum
 slider size
Message-ID: <20220913113715.GA3323414-robh@kernel.org>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-4-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908131548.48120-4-jeff@labundy.com>
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

On Thu, 08 Sep 2022 08:15:40 -0500, Jeff LaBundy wrote:
> The minimum slider size enforced by the driver is 1 or 16 for the
> IQS7222C or IQS7222A, respectively.
> 
> Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
