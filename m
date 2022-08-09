Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9884558DB40
	for <lists+linux-input@lfdr.de>; Tue,  9 Aug 2022 17:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243599AbiHIPhx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Aug 2022 11:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244049AbiHIPhe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Aug 2022 11:37:34 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A21B9587
        for <linux-input@vger.kernel.org>; Tue,  9 Aug 2022 08:37:32 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id j7so14775857wrh.3
        for <linux-input@vger.kernel.org>; Tue, 09 Aug 2022 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=PtkDAKuLYtipKso/qtzcAxoyZFXE+gtPjmSjF2+dZT8=;
        b=B4aSdALX+HOfDoK2RMhVxwCMY75Lvw/KvYO3H2Pp836XdkT7RwzrmfbytDbKOOJQIE
         kiMgeho3WTxF0lRCKxiry19SGg4wVqXaXWhIpPGTRLVtf24VQH2yQ1da/InL1+a/vFUT
         vbQh2m+R4oXo/CnacHGLNfs3MZc8MugsgbKxkPIWF++cNeCS8W+dju0WKSHHbQ4QDmd/
         MVhzo3+9dqoCYaptzlMx78HrArs6dvvz/PAOgJSyNAmjOE4FneuFdiuYPoghL10e9mHF
         V/Dw+/z785JI4VGewE/j8verPHsuw6KdmoWbb6Bb75cmiHRPxU2ONacU7fcILAbXcwcT
         LXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=PtkDAKuLYtipKso/qtzcAxoyZFXE+gtPjmSjF2+dZT8=;
        b=CQXAYkC53wUxTu9HCS8NNaLXD0wG1WG8qT6ohU2Dqor4VSQfduW9aEPYq3xVt8Wr4y
         faBiuoCp2pDrFVV+3encmmkULeBtAuGrlAmijXkehm4HqUvkQmXc6yPdiEPcFoUAECtk
         oY87a88y9Ufv54z5MVsoBsRHKeGHOb0Xy9Te+05PYUNZLzWiE9WdFZr/q2hpi0R8HPTo
         0FisGwudGOGZ5/d1SzxO09aIkxwfQBfjegMUGnMo24oml7VNOqUTRSCHrxNmK2ZNbOxA
         TkeGpm1cl5uDvN5wqjVv3NMwRZbtTNkTAC8FfOGHbsAyQaLZUMDZWTv6huygo9z8nIT/
         mLYQ==
X-Gm-Message-State: ACgBeo1MMSJ/xYAwzXoFeQgHRD1btKNOug2gkf57cwWzveqcBTuEG9gA
        mwVPKqMjpHoQ4on33NjPCKQsTQ==
X-Google-Smtp-Source: AA6agR7Rl6LrXJMccHtrODxJmUsBl/OXTkCxpvd9qLdL2g6K1oFbc81PrOCebZAftVyGx6FprERcaw==
X-Received: by 2002:adf:fc08:0:b0:21e:d133:3500 with SMTP id i8-20020adffc08000000b0021ed1333500mr15478038wrr.353.1660059450864;
        Tue, 09 Aug 2022 08:37:30 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c4f0800b003a17ab4e7c8sm24014628wmq.39.2022.08.09.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 08:37:29 -0700 (PDT)
Date:   Tue, 9 Aug 2022 16:37:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: iio: adc: stmpe: Remove node name
 requirement
Message-ID: <YvJ/N2zulizbiU6u@google.com>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-5-francesco.dolcini@toradex.com>
 <20220809134607.GA44926@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809134607.GA44926@francesco-nb.int.toradex.com>
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 09 Aug 2022, Francesco Dolcini wrote:

> Hello Jonathan, can you pick this? Patches 1 and 2 were applied to MFD
> tree.

Sending out nags whilst the merge-window is open is seldom helpful.

Also, please refrain from top-posting.

Thanks.

> On Tue, Jul 12, 2022 at 06:33:44PM +0200, Francesco Dolcini wrote:
> > STMPE driver does not require a specific node name anymore, only the
> > compatible is checked, update binding according to this.
> > 
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> > index 9049c699152f..333744a2159c 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> > @@ -13,8 +13,7 @@ description:
> >    This ADC forms part of an ST microelectronics STMPE multifunction device .
> >    The ADC is shared with the STMPE touchscreen. As a result some ADC related
> >    settings are specified in the parent node.
> > -  The node name myst be stmpe_adc and should be a child node of the stmpe node
> > -  to which it belongs.
> > +  The node should be a child node of the stmpe node to which it belongs.
> >  
> >  properties:
> >    compatible:
> 

-- 
DEPRECATED: Please use lee@kernel.org
