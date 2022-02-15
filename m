Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5104B75BD
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 21:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239548AbiBORBe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Feb 2022 12:01:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236512AbiBORBd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Feb 2022 12:01:33 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8DC106CAA
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 09:01:23 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1495E40259
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644944482;
        bh=SfcsF1mVhQhwOu0M+IJzq8imoaIRW/agDsf8ihIikrI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Js3yscD1eWjG4qJ26wnkt4QhQn4koFB9F5FdDnzF0lpsq2x+DS32Tpbe5wcmYMbMm
         epfk0qLkZofBIkn8rkTltV40Vskb3uM2OA1zfBTu1kQQUAuDYedEJxU6KO3wZEOOsg
         wlntKFJ4n12NuQLcaPjOOi3GN9VfM/4R6wlWzEo7Sxx4NFFJkGBUNHmpJpzdpNKJK3
         RqqEVpNnUYCCEI3Wh/ggZCf193ux8eBKrzb7tfalvubUZdfLOgpRXSm6uTEg3p1bSf
         9qta3I+O5FQdGRMc2zsR0ZNbNu94xPEfuMmqtlSoCCULtojv1dJZSTpTdBwKWUuxMC
         VY5EwuO6CE3ZQ==
Received: by mail-ej1-f71.google.com with SMTP id l18-20020a1709063d3200b006a93f7d4941so7631845ejf.1
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 09:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SfcsF1mVhQhwOu0M+IJzq8imoaIRW/agDsf8ihIikrI=;
        b=SjQXobUYpXt5YzP+A/rmsrPlDwAavR9+1QqpDoaWO9X+4g6WXVL85jls/UjzMTkYx/
         v3qo6o6EEwN7/1BGubuykOCuKoWCYH1I1MOanrsU3CfQenbcI1XQKjJmhigC2o7RV4xh
         Ziu0Tv98dWCtSakHjilENbdhplXcTMibBKwi1oAcQpthuYowfHTdkfJwEEM8XBDrlNTO
         54oYnmbAbwKdACXLhyd5v6j0CdFjQkGBvLxJdq2c6Xfjf63suHTt9rYlruBx9hG2CuBe
         LNHk1lL+qr/d9xj0pxvbRtDZLw7smvwCF3P1rWkDjmMNNeI7POfzcFWv2d9jv6Chqvwv
         0Ltw==
X-Gm-Message-State: AOAM531DNPLt9npknwPRK2Nbmh74ib6Od/r6BSsnjqF9B3mxchoqeg8o
        8wp14hVWuBGfRaOnesKOMd9UbW2aj2Nd0pm1s0lqLe5NcO+Yu7ZMLnBd2/WELuSDDzXJcfrFOrP
        8Heh6toJA8elRDJxMXzLAvZFmnhtC4teDh0hOUk35
X-Received: by 2002:a17:907:a41f:: with SMTP id sg31mr3642202ejc.645.1644944481608;
        Tue, 15 Feb 2022 09:01:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzMQsYTFUkZkiFrj3/E6W19Nix9stJF1B8bhLbUQmhJC33R7s7pBFl+O1wg+WfY04/ukm0SQ==
X-Received: by 2002:a17:907:a41f:: with SMTP id sg31mr3642180ejc.645.1644944481369;
        Tue, 15 Feb 2022 09:01:21 -0800 (PST)
Received: from [192.168.0.109] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id fy37sm2822372ejc.219.2022.02.15.09.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 09:01:20 -0800 (PST)
Message-ID: <cce2459e-cb6e-898c-e130-e818bd427ef3@canonical.com>
Date:   Tue, 15 Feb 2022 18:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: dt-bindings: ps2-gpio: convert binding to json-schema
Content-Language: en-US
To:     Danilo Krummrich <danilokrummrich@dk-develop.de>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org
References: <20220215165113.52659-1-danilokrummrich@dk-develop.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215165113.52659-1-danilokrummrich@dk-develop.de>
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

On 15/02/2022 17:51, Danilo Krummrich wrote:
> Changes since v1
> ================
>   - binding as separate patch (driver patch will be sent outside the scope of
>     this patch series)

Bindings patches are not a separate series, but a separate patches
within the series, so driver should be posted here as well.

Best regards,
Krzysztof
