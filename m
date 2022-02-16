Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57AA14B8160
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 08:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiBPHUO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 02:20:14 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:51436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiBPHUN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 02:20:13 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3881E373D
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 23:20:01 -0800 (PST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A949E40813
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644996000;
        bh=7w2DeuDBNiRSAXfzi3M+RcvsldsGybZXzRUnLDhYfvo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=YjEcJCttEwoc00rju/iqMCvGrK0JtWIo9G5/brW50HPJRO2IfWVOradwpsL63TPcA
         gh4Uk98I2laeUsfHprNok0b5PJ7ZaEpJV3kAgEtpqFObyEvKzzSqlo+ielVWXWaShb
         dbPZ22KkPx+abbGJnpYOSspf6ZI7vJyX8D1L6njmytuy/8OGt2FpuK2vDBHpESE7gJ
         nA5nsCrEPkI/osg2ljvS+otrhU23p3qEVCM16fgbncA2TFFpatscA4KzLjUrPu5ODW
         zm7b+uCf9gEsnAVOBy3qhp8/DHeCk+ofJD2TGXzMFcKNjbr2UlQXwPn3GMA+hVpx08
         /rdEm55j7UiTQ==
Received: by mail-wr1-f71.google.com with SMTP id g17-20020adfa591000000b001da86c91c22so682537wrc.5
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 23:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7w2DeuDBNiRSAXfzi3M+RcvsldsGybZXzRUnLDhYfvo=;
        b=tcq7E9uuuP2mmqyqa4sLZOiy3toYWmdjb5VicanW4+w3ARZNbQiDJH/tRINU08YafY
         w5U/CXHOyzK08lqGKtvYoWBESDMooA6JDCCMxf23JDQWKmA6nQgD1f4JpLkA6a3Y28/V
         2Jk+/IAPx/5DToc3VGUqffAE1CvkqZ/Z+OvPXnndPPIbKmeT1UvrjMc1YhJB72LiPynQ
         JnEXWRzO8rGHwIWgJhDPi4gdpXIs830FEEYPMr3Dp5IgYaU+ElBeM5lVndPOHuw5xJpo
         P1Cr4N6EeWNeLzA/YJ30nFRf7FbiwKvq9Pre8LVgxKzFNF5w6vaxBBiV0LOYTt5aA4Qf
         M43A==
X-Gm-Message-State: AOAM531Yt1k5vbtWb92B2K0tI9CnCWmLufQEims1hsN8AMs3Dtl7Ki7z
        bCZUCG0RMWm2hvodxi9qMK0P8sJoX0Q4dpRbdNc2mh8CjTwJHq49zMupWkQKoVwhOL+u4fIeFdw
        fgRvI/STquEPKZlW4SnxamknOz4SjbOZHB0tnIyB+
X-Received: by 2002:a5d:5045:0:b0:1e3:20ed:4386 with SMTP id h5-20020a5d5045000000b001e320ed4386mr1219903wrt.262.1644995999857;
        Tue, 15 Feb 2022 23:19:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb1VVbNY7bGK3DwOXT5yvrd8OpjtnZcWQy8cN8iBkRu2VOhrUSKcPJ5EqScPCYI1d3U5+FbA==
X-Received: by 2002:a5d:5045:0:b0:1e3:20ed:4386 with SMTP id h5-20020a5d5045000000b001e320ed4386mr1219896wrt.262.1644995999743;
        Tue, 15 Feb 2022 23:19:59 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id d6sm34450578wrs.85.2022.02.15.23.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 23:19:59 -0800 (PST)
Message-ID: <81b4dc29-1402-7eb8-d2d9-c2f09af4c1ab@canonical.com>
Date:   Wed, 16 Feb 2022 08:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] dt-bindings: ps2-gpio: document bus signals open
 drain
Content-Language: en-US
To:     Danilo Krummrich <danilokrummrich@dk-develop.de>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org
References: <20220215180829.63543-1-danilokrummrich@dk-develop.de>
 <20220215180829.63543-3-danilokrummrich@dk-develop.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215180829.63543-3-danilokrummrich@dk-develop.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/02/2022 19:08, Danilo Krummrich wrote:
> The PS/2 bus defines data and clock line to be open drain, this should
> be reflected in the gpio flags set in the binding.
> 
> Especially, this is important since the clock line sometimes is driven
> by the host while being used as interrupt source.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
> ---
>  .../devicetree/bindings/serio/ps2-gpio.yaml        | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
