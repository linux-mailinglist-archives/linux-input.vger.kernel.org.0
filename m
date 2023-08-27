Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29A74789C29
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 10:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjH0Ifz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Aug 2023 04:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjH0Ifc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Aug 2023 04:35:32 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112A5195
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 01:35:27 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so4819276a12.0
        for <linux-input@vger.kernel.org>; Sun, 27 Aug 2023 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693125325; x=1693730125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QgNqVUT0PUzMRYztLqBgJtsTJC3vN3Wx4d1g2QAn98=;
        b=WO3WWSB3mLxJ4JegKG945hEcH+WL5j1z6/qqG+Ewa8BgXqsDOh4lQMmJyqtBVvx4T1
         G7cLNnU/DT5p685loEIp6cA98FEklgkPZakXqOJo6y4lCZH6oVUtVAYq3h7A+ZIhZmtV
         HCDW7n+TTh/z2XqLfGrcSBgVTUapcIBN4V/ExAungctz+COwKKtLe7ekQ9J1cA9D+Uq1
         RHoR6k3Rx/4eKs6NVgindNe1cHu1zfhZJ/E8Jy6XFRh5NtEOgfQKUHnpwhn+UTcB0mw6
         wdc4L/DuDRAzZkXxHSoOyEdKJA4RopjBE0S6FQyVjMKhAnBvMExE/gkYD4BJ3oPVDQ4N
         8jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693125325; x=1693730125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QgNqVUT0PUzMRYztLqBgJtsTJC3vN3Wx4d1g2QAn98=;
        b=bk9INPG6/IidYPrULxQbqQsKjrsXiLwkRKAj7/9wmy4eW18kxuxVN/rKu0CeL4DY6J
         bEsaDs44irlMbeNig+IOOhjIct3g6Iq7YNUa1LOGsNS1HeCKayJVpTPtaG2zWKC9fCvE
         ZuAxIwBO2XvuIZ7arQgaA2UihZBfS2UaV3IIsJ/AoByDBz+iGJtAWPeLFXJdrokpNVqR
         uioEIpzJ38qydhYxMDULQQ2YDtCoSE9JhndCs8nWtix4dqUoI7HQDczh9B+gH2Rr+zvk
         XiJL+UXoYPnje0o3AsS41q43UkhWWnS/v1bnmcQoGrgOpaNOtCW3i0mj2kpz4uKHQbvV
         ynnA==
X-Gm-Message-State: AOJu0YwL86RWc3/bOjo+mDkmXCEolV33ozBf1i6RI3FK+bqgeoP15xYG
        bszR0A9ZaPWu0p12/QgxYtk16w==
X-Google-Smtp-Source: AGHT+IHFxiSvTWcd5IilQnNtpnYNzVsqATgW7ewhyWWd2IMPc2SKm/myh2nr3Y6KXX0l7Jky6PpEUQ==
X-Received: by 2002:a05:6402:3586:b0:522:b9ae:db3c with SMTP id y6-20020a056402358600b00522b9aedb3cmr23265938edc.6.1693125325585;
        Sun, 27 Aug 2023 01:35:25 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id s1-20020aa7c541000000b0052333e5237esm3046553edr.88.2023.08.27.01.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 01:35:25 -0700 (PDT)
Message-ID: <39af3ab5-4fa5-5b3c-395a-e86e70bbe803@linaro.org>
Date:   Sun, 27 Aug 2023 10:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 03/38] dt-bindings: mfd: qcom-pm8xxx: allow using
 interrupts-extended
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
 <20230827005920.898719-4-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230827005920.898719-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27/08/2023 02:58, Dmitry Baryshkov wrote:
> Allow using interrupts-extended, which is a preferred form of interrupts
> specification compared to the interrupt-parrent + interrupts pair.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> index 7fe3875a5996..33d9615e63c8 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> @@ -37,6 +37,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  interrupts-extended:
> +    maxItems: 1

The entire patch is not needed. At least should not be needed. What
problem are you trying to solve here?


Best regards,
Krzysztof

