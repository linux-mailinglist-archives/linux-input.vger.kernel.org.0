Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 440FF4E3063
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 20:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352388AbiCUTDW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 15:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346596AbiCUTDW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 15:03:22 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EFD6BDC6;
        Mon, 21 Mar 2022 12:01:55 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id z9-20020a05683020c900b005b22bf41872so11102402otq.13;
        Mon, 21 Mar 2022 12:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OFNzX0RcfjvIV1qQsoDTPNb+AhrilIDRJVRjWyRvurs=;
        b=SHZkpJd+fAU5BXC2YE81LziJXKOmrKGBmZM8vuNXyP/BIrvFFqq8BkozF3K3HUuLi1
         5qnxx2MYCKnWdUaJJJp9PebD86QU9KT+9GBlHscqJ08kx9/2/xPEJYzG2lfJVkrJ+0/O
         a8UOb/ZhBuznqknK2C3+6c1zp9f/IwaKeONnDYmEvVYh5ySG1dOo3+TGL61/1gYMlBQz
         aZuCAM5s4tEjmKde+lGBPtCZm3lb6Uf3Am8OGWn0bWkrMO+YUeZlHdjVxgqtTNgtbUpY
         Wvgtmhk7/kHs3sDC+zRPosZP2MjqJOec0dHkMN6O0TYCx9TEFisp9l+sa6E74zogUTP8
         qtUg==
X-Gm-Message-State: AOAM533JI798rdebjRkPibJskJej6UCn4t5fvzyAK2GymEMM33w8mu23
        4KIwGTMEJ0SQcNsrt+iTgQ==
X-Google-Smtp-Source: ABdhPJxjYA4wqMBQQY15Sz3S7Ek8UJwpW/VRiWrfPkV/RELlwACRKSJU78WDb012aNCY4yCGNOAuCA==
X-Received: by 2002:a05:6830:3c1:b0:5b0:3e3d:b788 with SMTP id p1-20020a05683003c100b005b03e3db788mr8702196otc.179.1647889315203;
        Mon, 21 Mar 2022 12:01:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r10-20020a056830448a00b005c9344dac06sm7881963otv.19.2022.03.21.12.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 12:01:53 -0700 (PDT)
Received: (nullmailer pid 372195 invoked by uid 1000);
        Mon, 21 Mar 2022 19:01:51 -0000
Date:   Mon, 21 Mar 2022 14:01:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Add Immersion Corporation prefix
Message-ID: <YjjLn4vM4f1tpZzO@robh.at.kernel.org>
References: <20220315233528.1204930-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315233528.1204930-1-linus.walleij@linaro.org>
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

On Wed, 16 Mar 2022 00:35:26 +0100, Linus Walleij wrote:
> Immersion Corporation makes haptic feedback circuits such as
> the ISA1200.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
