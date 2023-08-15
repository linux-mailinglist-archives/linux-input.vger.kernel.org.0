Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1976A77C6ED
	for <lists+linux-input@lfdr.de>; Tue, 15 Aug 2023 07:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234593AbjHOFLv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Aug 2023 01:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234682AbjHOFLI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Aug 2023 01:11:08 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644551BDF
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 22:10:19 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bdcade7fbso654291366b.1
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 22:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692076218; x=1692681018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bF28iUeNk56JK9TsikccLm4WltEZTE19xKJs8jn9uAQ=;
        b=mct1vZmLVqpwNiftHjdz7sR0wwQM52RIrTCtLvKnBc2sulf7CmZZyCra3ey1Z/4bjF
         q4kUgcJw32Vs/LONAis+TdSogerfcdo8Bxm1w/USc1PBdt9Dgu0LSJr53rXp3wjxOP3V
         7+KEGCJW1Zda2YQoU3E6NWn8gXrqVD93UzAPgpQbP1AqAw2wrnxdyDtlncPHJaknhwHv
         6kzV4bMU738my/CRVd1OqkR2vZBCvxBuBU7cHm1uqr+ZJVucJccb+LqgcfBmeCR7Iacl
         9IWQJ2AyAhcDpkEGgVY68QsnIhWwUpOFOYTkWdU+LR5v/i1+SSluK/dvGHsRv6Pwde/o
         NPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692076218; x=1692681018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bF28iUeNk56JK9TsikccLm4WltEZTE19xKJs8jn9uAQ=;
        b=PAcPL79tRMOrsLp3LIgs5xArcHc0DZLzH1TBO9wUTWHZcqtgnzOKtbQYwuYPuo+4X8
         nAXUMtfKZuDjCWRBThr3JINzzBvHbZ0pqcqZApW6YlymWokKx85sDqEgdx4rP6EvusEE
         G+7gnNgPFSL+ITlTXy3ryOxEStszqrBgypn0yL47IQAVuSzqWIZtAd8vVZ43rE0Jw16X
         m15OasIJkPMsxN5F1DW0lEN7Xe92xEpmI9rAfNASXFasFtH4eqwjsAag5DgI9tgjJ6FO
         49gp1bn+ZyEcNImIT3dIX9WxpIYpUY13DWPa3DbHXggpZKFM4zvMgkuuQoOgDEceHBKK
         KZ4Q==
X-Gm-Message-State: AOJu0YzfKjnSrob/9ncTROt90ZqZJzivpUWOlG2fNLMygkYWeu8l2Pzq
        xaGc53iaSejqC7jqTFhUXjIYOQ==
X-Google-Smtp-Source: AGHT+IGBkZ4LMf+dzSXpi05VjH8TZyFkhr+fyibIr+D55iwAeA/gaFr4uFToJqM8dsAEqZpeG1xURQ==
X-Received: by 2002:a17:907:7606:b0:991:e458:d14 with SMTP id jx6-20020a170907760600b00991e4580d14mr8196881ejc.34.1692076217690;
        Mon, 14 Aug 2023 22:10:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id d2-20020a170906640200b0099d0c0bb92bsm6461343ejm.80.2023.08.14.22.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 22:10:17 -0700 (PDT)
Message-ID: <2d8669f1-bab0-d02c-ece5-a6cd87b51e8e@linaro.org>
Date:   Tue, 15 Aug 2023 07:10:15 +0200
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
 <a1b1cead-17e4-2016-91a1-9ad9949ff9e3@linaro.org>
 <19e45248-5fff-d806-81f2-feea56d7778d@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <19e45248-5fff-d806-81f2-feea56d7778d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/08/2023 04:20, Fenglin Wu wrote:
> 
> 
> On 8/14/2023 6:06 PM, Krzysztof Kozlowski wrote:
>> On 31/07/2023 07:37, Fenglin Wu wrote:
>>> Add compatible string 'qcom,spmi-vib-gen2' to support vibrator module
>>> inside PMI632, PMI7250B, PM7325B, PM7550BA.
>>>
>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>> ---
>>>   .../bindings/input/qcom,pm8xxx-vib.yaml          | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
>>> index c8832cd0d7da..4a2319fc1e3f 100644
>>> --- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
>>> +++ b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
>>> @@ -11,10 +11,18 @@ maintainers:
>>>   
>>>   properties:
>>>     compatible:
>>> -    enum:
>>> -      - qcom,pm8058-vib
>>> -      - qcom,pm8916-vib
>>> -      - qcom,pm8921-vib
>>> +    oneOf:
>>> +      - enum:
>>> +          - qcom,pm8058-vib
>>> +          - qcom,pm8916-vib
>>> +          - qcom,pm8921-vib
>>> +      - items:
>>> +          - enum:
>>> +              - qcom,pmi632-vib
>>> +              - qcom,pm7250b-vib
>>> +              - qcom,pm7325b-vib
>>> +              - qcom,pm7550b-vib
>>> +          - const: qcom,spmi-vib-gen2
>>
>> This does not seem to implement my comment:
>>
>> "Entirely remove qcom,spmi-vib-gen2 and
>> qcom,spmi-vib-gen1.
>>
>> Use device specific compatibles names only. As fallback and as first
>> compatible."
>>
>> It's nice to respond that you disagree with it. Therefore, I am not
>> going to Ack it.
> 
> I saw your comments and I replied your later comments in v2: 
> https://lore.kernel.org/linux-arm-msm/b5e58172-beb5-0be3-834f-3f1db3e8b3b3@quicinc.com/. 
> It might not be a good place to follow the discussion though, I am 
> pasting my last reply below:
> 
> 'Sorry, I forgot to mention, in v3, I added the 'reg' value to the
> register offset and no longer hard code the 16-bit register address,
> that makes the vibrators inside PMI632/PM7250B/PM7325B/PM7550BA all
> compatible, and that was another motivation of adding a generic
> compatible string and make the others as the fallback.
> 
> This will be still the case in v4, I might keep it similar in v3 but
> just drop "qcom,spmi-vib-gen1" '
> 
> Anyway, if this is still not a good reason to add a generic compatible 
> string, I can revert it back to use device specific compatible string 
> only in next patch.

I just don't see how this argument is anyhow related to what I said. I
did not comment on removing the fallback. I said use specific compatible
as fallback.

Best regards,
Krzysztof

