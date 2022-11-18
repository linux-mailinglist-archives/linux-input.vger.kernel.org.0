Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAFD62F713
	for <lists+linux-input@lfdr.de>; Fri, 18 Nov 2022 15:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242260AbiKROTW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Nov 2022 09:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242265AbiKROTS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Nov 2022 09:19:18 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1CB2DD
        for <linux-input@vger.kernel.org>; Fri, 18 Nov 2022 06:19:17 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id r12so8451516lfp.1
        for <linux-input@vger.kernel.org>; Fri, 18 Nov 2022 06:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgA8yw24O2i30NCYTg1/JIIAnOY+Wu0LNbmyEIpvXuU=;
        b=wtPXLTlDYRv7ezb5DYtk3NuzdsUJn/t61NvLx3m4yBP2vADjQ/MIKaR6PNoc6qiOQM
         +++k8vvln3incuN+OMA7HhA8qB0ANJTGfEsl4VfHMLO+v/jP5A8nnxQixnSdm24/clYp
         z2udqjb/GLeUPtCSRn/P9QQOXB5aeK6liTbqHOseDdkTRDS4TQt2eO8jkFto9UG54tTj
         IouItXBlddBdFVIgz/9lx9h972Bcnq534DAQqRvUZlP2q4z+FkVJnYkvuFDXEc9ZAn71
         szrViWwk1XrwygDQtEl9afHWWBTIElJnt6/pUywzoZP0WwCeI7Oztdf/i9YeazWTZdLy
         CD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgA8yw24O2i30NCYTg1/JIIAnOY+Wu0LNbmyEIpvXuU=;
        b=68nOJaaqYAH9MVS0p7MR3Qdkju8/uu6aUHEGbvkiBXTHEpij56hppKSqfIqfIc1z5o
         W6qrTN8p/F89rieIAOxvGEu6H4VP2tcmW5FRL8w1PD4kKc+NS+KFBPPIqwxHBn1JRZF/
         5nR/ijEIFlvUS6NFMvYQSqTDDsd4evZhtfSdoE8L3I4jwFWkrRPyPkWYyXWssBQpgs9H
         0e7rGeEPXKMaTMvMbfy8ADvpisSw4RSg1CXLmZMOJD9xcaAssNEIJ5CqxEQi7zmMv6mh
         3Z0wuMLV9AFJPEO7gpDgfgor1DK8EWYh3h26rDk0Uh8TK0PIvhDpH3XvR9oLfNMsgKDV
         U78A==
X-Gm-Message-State: ANoB5pnsqTHl/jhRRcYVn6G9/T/66WdU3MYPJfD6mQ9JARIAtmgKtzX3
        YwKrYA/01B6NB5lLN1sFCxrFP/RYRw1gnaOe
X-Google-Smtp-Source: AA0mqf7TlmTWJziGrMLeJAgmh4qdlTOIPnh6RCz7Z3zW1Mofbv35K1UxHMtFKgjO4oBVMcUGe/sWEg==
X-Received: by 2002:a05:6512:324c:b0:4a2:2e51:85c1 with SMTP id c12-20020a056512324c00b004a22e5185c1mr2394064lfr.658.1668781155414;
        Fri, 18 Nov 2022 06:19:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s12-20020a056512314c00b004b0317a1035sm678035lfi.109.2022.11.18.06.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:19:14 -0800 (PST)
Message-ID: <3796bfa6-9d39-f0ca-55a4-6f03bf578a6e@linaro.org>
Date:   Fri, 18 Nov 2022 15:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RESNED PATCH 1/3] dt-bindings: input/touchscreen: Add compatible
 for IST3038 and IST30XXB
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Markuss Broks <markuss.broks@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20221117191436.87938-1-linmengbo0689@protonmail.com>
 <20221117191436.87938-2-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117191436.87938-2-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 17/11/2022 20:15, Lin, Meng-Bo wrote:
> From: Markuss Broks <markuss.broks@gmail.com>
> 
> Imagis IST3038 and IST30XXB are variants (firmware?) of Imagis IST3038 IC,
> add the compatible for them to the IST3038C bindings.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> [Change from IST3038B to IST3038 and IST30XXB]
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> ---
>  .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml  | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> index e3a2b871e50c..85390f6ffe36 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> @@ -18,7 +18,9 @@ properties:
>  
>    compatible:
>      enum:
> +      - imagis,ist3038
>        - imagis,ist3038c
> +      - imagis,ist30xxb

I don't get why this is a resend, but comments from v1 apply.

Best regards,
Krzysztof

