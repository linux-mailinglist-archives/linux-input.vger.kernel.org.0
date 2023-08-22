Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558757839F6
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 08:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbjHVGa7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 02:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbjHVGa5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 02:30:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FB41A5
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 23:30:47 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so80135a12.2
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685845; x=1693290645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VHk+06zi6qSfSbxVeYt1+fxZedarjijNYMaQFKrSq4=;
        b=Ru3E9ONucyWJmgq96yGSHyzBuRemc9gGU3F/xKoJEJAeFQRmro3vvIfIabjysDS8Rv
         DWx4BbQKYHHuUDKTgcb7RLQXppym7nipLZ04StYmpIUMt/jDqktMIKA8cIJ+os1cGQ3w
         HP6O5n4M1BqnPTicIRAYz5FyuzE2PCleiYnqCDErZ76gNLJr2Mupx5tg4bXeZspCqPph
         dJvIl9YIrOXtu4x2fHOwVwnziPmiiYysJTc8l/Gn9m5vtIdN0R/L9S5N2ne5ofOlAd7/
         +6HHDVwLk3TZyJEi1jvmNVJ/Shsd+6+XvxF1++joPyx8ZCREahWrlAF+QZHh5sT2CMDp
         dFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685845; x=1693290645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VHk+06zi6qSfSbxVeYt1+fxZedarjijNYMaQFKrSq4=;
        b=LUTTqZAJdrUYm5FAaC0x8n6GX8DB1EBwtkfyHZKFW/brR9Lu2JpRmiAlKtEBQ9bdKg
         bYUpnRs/2qbOh7lVKrx+OsYRLOGgB5umKKe/nOg9VGuH6ovmkJMV/uyY6/xxxRZGb39T
         hMbTaPI0ZEiURiqhZ80oPSLtjVbdHu4S8AMnktSaiTPZIx3m6eJ5eB4OZ+rsASPpZ17I
         YkRTAA5w4imEcipmZahNXnn5Gral6rAcJ2Sw0fBstP4i7+5xvj6XlWAq9FAkY1esdegy
         FfJYcxJwUIwlRdFK6ZINTCuv+3LW4RKefJVJLyUPdv5Jz3yZvEF8KIr/SoJYEXKDMdie
         uNjg==
X-Gm-Message-State: AOJu0Ywz/bz+vx+6J+pTeew0LcQ52svaYz9H3sXj+DYdkvxzu7z79uWF
        /BJpZFuw4DTcSsJa/UnNxTInbQ==
X-Google-Smtp-Source: AGHT+IHIgYMKa283zryEdoTkbwauR/9bTyt3psWUAdiJa8GmXwLLHkWB2Xr/4z9xTMeWN/zayaTw6w==
X-Received: by 2002:a17:907:75cf:b0:9a1:6fcf:fcf9 with SMTP id jl15-20020a17090775cf00b009a16fcffcf9mr5810636ejc.62.1692685845534;
        Mon, 21 Aug 2023 23:30:45 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709060b4800b0099bc8db97bcsm7633180ejg.131.2023.08.21.23.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:30:45 -0700 (PDT)
Message-ID: <87733e12-e25f-865c-3837-6b4e0450cefa@linaro.org>
Date:   Tue, 22 Aug 2023 08:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 03/32] dt-bindings: bus: convert qcom,ssbi schema to
 YAML format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822001349.899298-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 22/08/2023 02:13, Dmitry Baryshkov wrote:
> Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with bus
> bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

