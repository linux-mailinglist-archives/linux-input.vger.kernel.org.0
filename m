Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C69B77C898
	for <lists+linux-input@lfdr.de>; Tue, 15 Aug 2023 09:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbjHOHdo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Aug 2023 03:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbjHOHdP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Aug 2023 03:33:15 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136E510C1
        for <linux-input@vger.kernel.org>; Tue, 15 Aug 2023 00:33:14 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c353a395cso690111266b.2
        for <linux-input@vger.kernel.org>; Tue, 15 Aug 2023 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692084792; x=1692689592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mbR8jCSs/QiaV6+2VKNjUs44H5IHvuOfBsH4XIH3FZA=;
        b=b4S6bUYtiLhsX0nhZOEZvszfR31uQkNh1w9uS0GuIZK1cTGPVMfuQebopR4toCuhOZ
         yW4bZeOdaiR7WtW3wj3SBlpnDP4o+Biu6f6/5yKJxA/CdulN4o4wUeKAmw8CPHJQzSx8
         365a9V7SWjF2zSXP1fQuOLa0uXWi1LFUd0OKj6kYMU1hjDEHTioVMdDRX1R3q/YF7+5p
         zzS6stfKAebdNm+/WDc9r5xA4vBaWMaW7OwBbdZzHYuuic9SkGayKeIu0+rTAgmpvYLW
         xZtfNo81EbuPSaeZdXJJh6StuSc9WcJcY2euGdN13lTavvhL+xEgStOBqtEIHij6T7G2
         tLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692084792; x=1692689592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbR8jCSs/QiaV6+2VKNjUs44H5IHvuOfBsH4XIH3FZA=;
        b=HvLZosaFH9+7xRLi1oHZgG/I2+q3+NiACeGgpl/VpUGtZ+hBJWYlk+H+Gex6Jxdgn9
         U7VdeRpVF0SVc69NlRU19Q9A7j5RajNFzOfhPHLfjwwZDXJpAdBTssNHlf7b5maJtAlg
         Y+edda8/hlIcRYYkZk/8Ue1ebjpeTOapL9g8yWsAnwwMFiJcfJFgHOD2VrAttsEtbJJp
         hhPYwdofOqzjy2HP+mR9HrKGH2x4r32pzAmmi9Hl5C6xzx6x4CH6o+XhMinv/v2Zrix9
         7ZfPZI4bHeUqooPl6Kb7PT3I4dpwDAbZuz1G8RkbjUdO9AV8kfrsJB/EciV6G8AczYiR
         IMMA==
X-Gm-Message-State: AOJu0YwdgUrnbjDdiyfO1Nke4EgmBxtShnPYXMo0TWFV+FqtC+lwfDsv
        LKIuZwGCBRMkW0/oHNtsAk5SzA==
X-Google-Smtp-Source: AGHT+IGYr6mviWLuAJOcMVHhWs6mcErZpsU6d2ANXHcTLWDqnzCdX+z3y/tcTK3XnSwggzX8pkDwyQ==
X-Received: by 2002:a17:906:314c:b0:99b:64d0:f6c8 with SMTP id e12-20020a170906314c00b0099b64d0f6c8mr8910909eje.50.1692084792293;
        Tue, 15 Aug 2023 00:33:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w20-20020a170906385400b0097404f4a124sm6651143ejc.2.2023.08.15.00.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:33:11 -0700 (PDT)
Message-ID: <79985698-2107-0aee-1395-81e3d9b4d727@linaro.org>
Date:   Tue, 15 Aug 2023 09:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 2/3] dt-bindings: input: qcom,pm8xxx-vib: add new SPMI
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
References: <20230815064917.387235-1-quic_fenglinw@quicinc.com>
 <20230815064917.387235-3-quic_fenglinw@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815064917.387235-3-quic_fenglinw@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/08/2023 08:49, Fenglin Wu wrote:
> Add compatible strings to support vibrator module inside PMI632,
> PMI7250B, PM7325B, PM7550BA.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

