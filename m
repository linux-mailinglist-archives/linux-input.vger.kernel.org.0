Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA436A5443
	for <lists+linux-input@lfdr.de>; Tue, 28 Feb 2023 09:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjB1ISu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Feb 2023 03:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjB1ISr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Feb 2023 03:18:47 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78733EC6E
        for <linux-input@vger.kernel.org>; Tue, 28 Feb 2023 00:18:46 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id bt28so8770073wrb.8
        for <linux-input@vger.kernel.org>; Tue, 28 Feb 2023 00:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677572325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlZr9oxmYNUQ6f8YSJQivzDcQiNNTEU7Yai8ML9O5lE=;
        b=au1/3g1GzCRev6Ak2uA4BouE6GKnfc6aFbZdP0mbKGR5mmYrF7nbpyPMHloJYjqUmL
         dGkVdftqBcy6Ddf4zyc8HfPqUIZH86xKyTBY2V0ajPhTLhrcKxVXEvZyoRTjNtWx7inB
         gIVEEabVNEzBrh2tFjlr5SJI8TlxUAUrrt3PsHIbpoFpJ45ZdXtVQJjrSAeDM/Zg6aYf
         i1aEkGRVq4XkaMlt1+00ybeSjXV51dym/aR3p1V5OS2vX8U621SyM7uPXBcMegJAdKAV
         8Ieq+6z3lFybeYHyxkIv5sgorMd8XE7XdOaLL0Vo5/2jiK/9/tOvzhq45rdq7xkH3ffV
         idIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677572325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlZr9oxmYNUQ6f8YSJQivzDcQiNNTEU7Yai8ML9O5lE=;
        b=qhSiG2YYREJOBP2ZorA6O9dd36FzV7v2xF0812lJWE7jyrv626podS1sVAVi+omUM8
         axia2xOO5OKsSF1Li1pN7sK0Su2ZjgftUTBI52c8X7SLS523+7H2rJvrBN3F1ihiy9gZ
         apqx+qCc8IXRpYawOTO9qGSXm3HRL7R0HbfiqHYl4V7GWgB0I/oOeGUiw/W5TEAISXlm
         XBcrQs/N3RpI92Y9wTzOvSGFRpYzzPcFr/08K5vAiAfVqhtGkWgR3VxQv0XlZqojiDvN
         pU1WrAS3fyMfC09JfyrqUmF/qBUwQFcVYIP08IcnOUFr2acETk//oVxrREs2MW7SGqtS
         cvpA==
X-Gm-Message-State: AO0yUKVcM9rx4AthFGTHY1CxntVD+OoTfcaGq5uTLTxs1wkFRc20NhOF
        yPgV71I2FzFHNeinieUPVBgPvQ==
X-Google-Smtp-Source: AK7set/8ouL5IkXuB8PTui01SZapBw/nJOwDWjonLcPESa00+L/KSM/f5xxPdkwfHvL/yf3QLTU1Yg==
X-Received: by 2002:adf:dbc2:0:b0:2cc:5ee8:fee5 with SMTP id e2-20020adfdbc2000000b002cc5ee8fee5mr1363557wrj.71.1677572324894;
        Tue, 28 Feb 2023 00:18:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z19-20020a05600c0a1300b003e4326a6d53sm15105502wmp.35.2023.02.28.00.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:18:44 -0800 (PST)
Message-ID: <64f65665-1d3e-b629-d3f8-dce63aaee8bc@linaro.org>
Date:   Tue, 28 Feb 2023 09:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: input: atmel,maxtouch: add
 linux,keycodes
Content-Language: en-US
To:     =?UTF-8?Q?Andr=c3=a9_Apitzsch?= <git@apitzsch.eu>,
        Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht
References: <20230227205035.18551-1-git@apitzsch.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230227205035.18551-1-git@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27/02/2023 21:50, André Apitzsch wrote:
> In some configurations the touch controller can support the touch keys.
> Document the linux,keycodes property that enables those keys and
> specifies the keycodes that should be used to report the key events.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

