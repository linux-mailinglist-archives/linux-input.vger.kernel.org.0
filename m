Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A728377B5F8
	for <lists+linux-input@lfdr.de>; Mon, 14 Aug 2023 12:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235339AbjHNKHL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Aug 2023 06:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235126AbjHNKHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Aug 2023 06:07:01 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56544E6E
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 03:06:58 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5234f2c6c1dso5607367a12.1
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007617; x=1692612417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gpFUakM9U9BclH5hKRnHKIPFG3rdR19+7vcbSkpu9+8=;
        b=HV0WDI/Epsk6hzNmAN9LNW2gBufN9Pdobqmt7ZKcvbXnEKAcR0AL9UdocNNR3wKylZ
         rQ0AWg4bDCWnl4ymonjqhTFAq+wwMt4RPBc3FP/Bils91iLDEWwP/cP16xbAkYb2q5AG
         DIpDAE/3wDpOpUqvANyoI0vj/8HY7TQAB0Koaf5m2+dCjPOoCEyt7xHgRqnemKll+Zt9
         74uqNxZ8PwtVRIPq91fFSNRIp85i9AVNdE6DhklJKbSySJMs7I77OE4E2NAM54EZMqlJ
         8/CGyvj6ikJoBWaZfyXB09PP7B4vYHECS9x497L4LP/qb84JdLnu0WdaRMZb+Sayz8UY
         ymgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007617; x=1692612417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpFUakM9U9BclH5hKRnHKIPFG3rdR19+7vcbSkpu9+8=;
        b=Wrbd2LF6epkqXsx4yfTJyFdPXeTTZZMVnFwmxqCWQekx2I+Wl4wcp+PQEy5QtdNioY
         ZaITww8M3Msk618d8ffObnJ0XrZMyLDFuDBTeW73T2l6DQ1ZzW06UQMzRc9xqFR4zUX9
         brq2xw8G/v0rJxXYXqhJA/CnOm19kHzQFjHfNEvq4UKNFDdTpaQt/AY5/GvLLkmZTKui
         nk+7xZdO5FlmlmqYgCtyOqJeWiiF5NItb48hZVsSFOvimGBHxKbhwLs8YPTRYJirZ0Kt
         LbRy5bxFTxSCEKthXoTQ+T8iPpvtu0ZvNAGfcGzHVIp5dH01BXrK1OiQyrniAV82Nfn+
         dolw==
X-Gm-Message-State: AOJu0YxcUb24qL6+PblwRoinxj2JEVHJ0nTqUZXhvqj0I8/2/qCkki22
        IZqDUP7xbImuPIQxmTnPANGlmg==
X-Google-Smtp-Source: AGHT+IFh0XWM4zQE34VibfXSge5f5gInCENxWeqQzXdw3INipJ8V402AhDwfC5TGsmdpZ3NYa5DGqg==
X-Received: by 2002:a17:906:3284:b0:99c:570a:e23e with SMTP id 4-20020a170906328400b0099c570ae23emr7695264ejw.24.1692007616819;
        Mon, 14 Aug 2023 03:06:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906039000b00993470682e5sm5499705eja.32.2023.08.14.03.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 03:06:56 -0700 (PDT)
Message-ID: <a1b1cead-17e4-2016-91a1-9ad9949ff9e3@linaro.org>
Date:   Mon, 14 Aug 2023 12:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/3] dt-bindings: input: qcom,pm8xxx-vib: add new SPMI
 vibrator module
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org,
        dmitry.baryshkov@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230731053712.2220898-1-quic_fenglinw@quicinc.com>
 <20230731053712.2220898-3-quic_fenglinw@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731053712.2220898-3-quic_fenglinw@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 31/07/2023 07:37, Fenglin Wu wrote:
> Add compatible string 'qcom,spmi-vib-gen2' to support vibrator module
> inside PMI632, PMI7250B, PM7325B, PM7550BA.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  .../bindings/input/qcom,pm8xxx-vib.yaml          | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> index c8832cd0d7da..4a2319fc1e3f 100644
> --- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> +++ b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
> @@ -11,10 +11,18 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pm8058-vib
> -      - qcom,pm8916-vib
> -      - qcom,pm8921-vib
> +    oneOf:
> +      - enum:
> +          - qcom,pm8058-vib
> +          - qcom,pm8916-vib
> +          - qcom,pm8921-vib
> +      - items:
> +          - enum:
> +              - qcom,pmi632-vib
> +              - qcom,pm7250b-vib
> +              - qcom,pm7325b-vib
> +              - qcom,pm7550b-vib
> +          - const: qcom,spmi-vib-gen2

This does not seem to implement my comment:

"Entirely remove qcom,spmi-vib-gen2 and
qcom,spmi-vib-gen1.

Use device specific compatibles names only. As fallback and as first
compatible."

It's nice to respond that you disagree with it. Therefore, I am not
going to Ack it.

Best regards,
Krzysztof

