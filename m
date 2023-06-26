Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2251673DF79
	for <lists+linux-input@lfdr.de>; Mon, 26 Jun 2023 14:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjFZMlx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jun 2023 08:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjFZMlw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jun 2023 08:41:52 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D47B10B
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 05:41:48 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-98df69cacd1so141572666b.1
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 05:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687783307; x=1690375307;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1O/RvKWo1h5dGU5mnuc9NaA7NfFghj3K3EQLA18Z6+g=;
        b=kmz+ri/+KnReuH1w1Kmf426oH88ZqYyfAb/jSzjMYH21Jo8oXbEYdhbtJMRL4kV5kI
         exdyjBeM6KnX6e/qhKnA26o1Tq1hwKR/tVwvonDSubxaHR4hQlYL775+Evh0MpSIkR/k
         33ojb8WHMAFMNZaO8Ikc7v3Ho7ZgbvPRebNsHuTMWhGdNqkwk2PESmswBVyGS4PIjyI5
         cokDpAASIIkFNrHx+pujPS6H85mjyYoMkNwyVvcQSGJVMyVUSz6XqYLTtBGUcni8svUS
         LEU5zIArhUdkCx4ddvKps99m0BVarzFVSjOzj2qF1PdK+jaJAXzNBdbxw666YaWtwWi1
         Jb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687783307; x=1690375307;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1O/RvKWo1h5dGU5mnuc9NaA7NfFghj3K3EQLA18Z6+g=;
        b=c0d6iGnnOPrRgsotSlAaCjDTCLAS6BEnB5DBwOEYuCjRudTxs0GwcQP84ZVcdirP76
         RVjVLXOf7V0/a2dSJkO7u1HPBI5lOZt2CwlH7wy0E5YBmE3Q/cILm2pRCxL1jG133XCF
         IH7KPjOx8SnHohWrxnT1gKdSQruNoYdMktNuadjLCSMlXh3eF1laxzOFYdj7aAv+Ir5n
         Zd9g+QJusqn6zuQMipof726RL3NRrI1YQj+qqdLex0hEgnaATFOsFx9OSqwt9/PxO1D3
         796W6qiT4m445/A4WDLfQnfh+ZmQsJFdlvcANzrt0oCr2v7dLyvzzWy8jdI5E6xjHJ9l
         l52Q==
X-Gm-Message-State: AC+VfDw/v46lqs/ypleywkpdXdwm4AF1OtkLsUA7jnnCjv9AwI29n0M6
        +sde5SgpRMi2DKlrE/dv2ZubzQ==
X-Google-Smtp-Source: ACHHUZ6Wpbt5aBvPSMbzTXtLCmARkKMUks0jSYfwjFoZnw5UKS1jyuNJhgcE6lT0V71KZsa7fo62fg==
X-Received: by 2002:a17:906:6a25:b0:989:40a9:505d with SMTP id qw37-20020a1709066a2500b0098940a9505dmr16561476ejc.0.1687783307102;
        Mon, 26 Jun 2023 05:41:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906710600b0098e48ad11f2sm1792732ejj.93.2023.06.26.05.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 05:41:46 -0700 (PDT)
Message-ID: <cd833975-7dd8-95a5-4bde-3dcdf9cf65a1@linaro.org>
Date:   Mon, 26 Jun 2023 14:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] dt-bindings: input: microchip,cap11xx: add
 advanced sensitivity settings
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jiri Valek - 2N <jiriv@axis.com>,
        krzysztof.kozlowski+dt@linaro.org, dmitry.torokhov@gmail.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        u.kleine-koenig@pengutronix.de
References: <20230626113740.809871-1-jiriv@axis.com>
 <20230626113740.809871-2-jiriv@axis.com>
 <0503b8fd-e8ce-ffda-577a-b851a9eebb07@linaro.org>
In-Reply-To: <0503b8fd-e8ce-ffda-577a-b851a9eebb07@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 26/06/2023 14:36, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:37, Jiri Valek - 2N wrote:
>> Add support for advanced sensitivity settings and signal guard feature.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> What? How did you get it?!?

To clarify - your previous patch was not working, not tested and not
correct. I pointed this out and I really wonder how from pointing out
errors, you figured out that I give your patch green light!

Best regards,
Krzysztof

