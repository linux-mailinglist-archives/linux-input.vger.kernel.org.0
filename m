Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B91616AB4
	for <lists+linux-input@lfdr.de>; Wed,  2 Nov 2022 18:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbiKBR3B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Nov 2022 13:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbiKBR26 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Nov 2022 13:28:58 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CA910BE;
        Wed,  2 Nov 2022 10:28:57 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13c569e5ff5so20662367fac.6;
        Wed, 02 Nov 2022 10:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9a0wvsCSnT/xWIPqbzQDwoWxsjty2U93TRnjNkLEzk=;
        b=Azqriy2CLMn0/XUp0j/g/u544SrTvd7fPff/WzeORPAPk623OW30KwM0N3hlChhHm6
         1SkO/n4pdwlOxvt5Cq0tsQVknGlJoyf6MeClb/pDjeTXpq8d4pQZt0prfh/KC1M00jQS
         VzjHkQ0NVIvLDNorli9iHooLOEPfF6AngEvmjpLSUiPdqfWfcf+JhMIXtGSCkOUNyWYV
         BSEfT1HPMmOKb/w9iQoYz6B/LlQAi42yfkBB39qp/i/BRVM7s3ky8pbbE+A7quRR0eeK
         SIW4TVA7zBhd1GWUk6MSybEWhv60YxrzgyUZ/8enUHq7l9fgH8swVWl4zrvfGWnKFRwd
         zrag==
X-Gm-Message-State: ACrzQf13elmUJWuN9GABDd6iGCEXBveEEfRmzyWdZ7vEr6yGBbw8XwDk
        6I2tcDxtaqCJXMtgNnQGLQ==
X-Google-Smtp-Source: AMsMyM7GXGQgFi8k32FyKSuR0yvQ/Sbs93jOubBAmge3qsz5gJqJMOz2GbMWlZbbHd4ERK4fcKXjUA==
X-Received: by 2002:a05:6870:a44a:b0:13c:7aa9:4614 with SMTP id n10-20020a056870a44a00b0013c7aa94614mr16934422oal.229.1667410136849;
        Wed, 02 Nov 2022 10:28:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p5-20020a056870830500b0013b92b3ac64sm6258146oae.3.2022.11.02.10.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:28:56 -0700 (PDT)
Received: (nullmailer pid 4192420 invoked by uid 1000);
        Wed, 02 Nov 2022 17:28:58 -0000
Date:   Wed, 2 Nov 2022 12:28:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-sunxi@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@csie.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 8/9] dt-bindings: input: sun4i-lradc-keys: Add F1C100s
 compatible
Message-ID: <166741013756.4192364.675668624512332912.robh@kernel.org>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-9-andre.przywara@arm.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Tue, 01 Nov 2022 14:16:57 +0000, Andre Przywara wrote:
> The Allwinner F1C100s series of SoCs contain a LRADC (aka. KEYADC)
> compatible to the version in other SoCs.
> The manual doesn't mention the ratio of the input voltage that is used,
> but comparing actual measurements with the values in the register
> suggests that it is 3/4 of Vref.
> 
> Add an F1C100s compatible string to the list, and pair it with the
> A83T fallback. Since the A64 is the same, combined both using an enum.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
