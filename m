Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0587573D2
	for <lists+linux-input@lfdr.de>; Tue, 18 Jul 2023 08:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbjGRGNB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jul 2023 02:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbjGRGMg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jul 2023 02:12:36 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2401FDB
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 23:12:04 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b743161832so80164251fa.1
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 23:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689660720; x=1692252720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FuxBGExkZpHQKsmDHlV/hAGsueJeyW+J9iiwyicARBU=;
        b=cd+AitMjVTkfMPwx8BZxeJBEHG7AUSX/qbVAy2lD5z6k5N+9n9mtRzPnYd33ihNqaX
         xB7um66/R9Zam+YgeU1ZGU0hJw4rhqwAEJp7KJUGAU50vgE/Gcdf+FqGEZ7mhO18vCSn
         Of6WgpGJCILKq2sQ6k77blylOsmH3xK2vF0vAMnCi2bQubSaoINEreYtbr9V35SDssxM
         TIvq3OCrrpFOiWg1InP2ZyRvFQ+0q8neNVBv7qCp+/2Z2wg+4Wln/PcwjBVwgP++AKz0
         a4C4y1H4ANiE97yuwYYVa/j5V10CvBl1YITanrUMqSLP86rZWHiRpzGnWrLxRrBhD38V
         mfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689660720; x=1692252720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FuxBGExkZpHQKsmDHlV/hAGsueJeyW+J9iiwyicARBU=;
        b=MkMVN2l4t6ki2klz4UCgwST4hHxIfzfkl8mhTFINf0IuPV8pTbcLOctQ2cdD9typsG
         f47DswgVzOn/TnaY0b5QqBsxHuxsiNJ9Bf7/JbzkmQLRomJvmbevp701QUJs398j8Fm7
         9vYxYNNZ4K+m9DtXF3ce+d6Uf85lJ62t4DKtxau2bMHaLEnTrz/Atsx9QAYiP6aV83vK
         1PHdu4jnew9onGdHs1hvjjUXJK6yDNyyc6XQwj0qJ7cWh8TU/modmJoChICyfBCs0SVl
         2+wkJ7HcMv9uad2V3SlzKJ2h7g538XFq7wZLcLqyGolIbTlkjb/QqFTON9l6QCs2h6f6
         F8LA==
X-Gm-Message-State: ABy/qLb4huLJ4o04AtfTqU1maiYSt104e6IAjIxM2JNJBWSqqWNOHTXE
        GtlLfX6KLU5WyvfVmBHRIDYy/Q==
X-Google-Smtp-Source: APBJJlF3CZLus35/mCVGby07iUVU6tk7NqzG0eJLwmxyz418tiaGubEW1E73Ysc/Ws8qP4fWSue92A==
X-Received: by 2002:a2e:978d:0:b0:2b6:df5d:8e08 with SMTP id y13-20020a2e978d000000b002b6df5d8e08mr9748785lji.28.1689660720108;
        Mon, 17 Jul 2023 23:12:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k13-20020a17090627cd00b00997bd42d210sm540489ejc.205.2023.07.17.23.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:11:59 -0700 (PDT)
Message-ID: <2a215bc5-784b-4335-449e-c55faea2b750@linaro.org>
Date:   Tue, 18 Jul 2023 08:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/2] dt-bindings: input: qcom,pm8xxx-vib: add more PMIC
 support
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230717062547.2086869-1-quic_fenglinw@quicinc.com>
 <20230717062547.2086869-2-quic_fenglinw@quicinc.com>
 <6338cc75-e3fe-ba19-3df7-727b63fec245@linaro.org>
 <2b1301e6-fac3-7a06-6716-a65ffd0be7c2@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2b1301e6-fac3-7a06-6716-a65ffd0be7c2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 18/07/2023 04:37, Fenglin Wu wrote:
> 
> 
> On 7/18/2023 3:59 AM, Krzysztof Kozlowski wrote:
>> On 17/07/2023 08:25, Fenglin Wu wrote:
>>> Add support for vibrator module inside Qualcomm PMI632, PM7250B, PM7325B
>>> and PM7550BA PMICs.
>>>
>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
>>> index c8832cd0d7da..642408e2b35f 100644
>>> --- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
>>> +++ b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
>>> @@ -15,6 +15,10 @@ properties:
>>>         - qcom,pm8058-vib
>>>         - qcom,pm8916-vib
>>>         - qcom,pm8921-vib
>>> +      - qcom,pmi632-vib
>>> +      - qcom,pm7250b-vib
>>> +      - qcom,pm7325b-vib
>>> +      - qcom,pm7550ba-vib
>>
>> Aren't the last two compatible?
> 
> There are still every different PMICs even though the vibrator module in 
> PM7325B and PM7550BA are the same and they share the same register base 
> address as well.

So the vibrator modules are compatible? Then I propose to make them
compatible.

Best regards,
Krzysztof

