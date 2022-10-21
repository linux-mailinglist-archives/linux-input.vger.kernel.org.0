Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D7D6078C9
	for <lists+linux-input@lfdr.de>; Fri, 21 Oct 2022 15:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbiJUNnx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Oct 2022 09:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiJUNnn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Oct 2022 09:43:43 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C443278145
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 06:43:37 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id f8so2019206qkg.3
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68YdhNq4klXYc5Yx3t3w6nqtAfwxq5Tm5goHX4+ewlQ=;
        b=RUXESQr8aeDoE097KVeOA//3Qe2hrCWZULTkGcHjkMecIx+JTUkPgfQJK10qAQyzf+
         Oz2rbRUI/jIIlC72z8FJ6P7IkZLM2uJNSim51P3f/MZC4dJQ2mgf6MkBhG2l9b2GNriD
         wQXoVSiOb/4+hGEqLOLQXhAbwwYGDnIJDXAUKfvuVbPE/rVCGT16KfvCTIW9UocpGEF3
         BkQVjq7pMObYYXSCQ+MC2lHQ3dOLFEOU8ogdGZoAnNGEvgX9mgjo7SF4LcrYpRZj/QrX
         0qmpghMOHpzkVcEg0H1ok4CzLXB6BjFLDz/UsyIvT/QxRNxX9yiGq3MMp1WVqkWQk29G
         9yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68YdhNq4klXYc5Yx3t3w6nqtAfwxq5Tm5goHX4+ewlQ=;
        b=YZcYyaPxhkxbDU5RgV1is8QuLS3wVhuvXVW3WoUHn8lfmXNVW5B3/sasY1CkT49X80
         Cuj7wX0Au7LoNGgU1vri7OBKjo8rxP+CirJZ/eccLOK1OiIxQ3CjyQxK508F8rSLv7U2
         WbISECB4OdsWTTgKjs9VO7eAnDUZZdD6gsPCIJpH5hW2Vk7lBfAhwBlUo6zFO7s3gz7U
         ubU+AJiPFsNnGH3V0wdxsrjOjwAIdzkjqI6k3rLwaBpYPl6qaTrp1xf3s5zbraA0Je0P
         Rv62HrY0mN+tLVsDNcVCv36oJDZYKQMJkT9HMz126CBLXi3rdxonnB5yx1nypqo/Tics
         rS6g==
X-Gm-Message-State: ACrzQf2lNPokpWYhHs/F0CHDKzl+H9lPPMY56FZ8VB3GKkYZw/uig05M
        UbdxqlpHkhzyPRndkS4TPMxYsg==
X-Google-Smtp-Source: AMsMyM5JM5KpQQYFv6OYpXqUq63GuzYcwkwH/6fk6e7+zOFCL+WAybBK621N4LdQPq2JrDmfuOQeOQ==
X-Received: by 2002:a05:620a:1a22:b0:6ee:d333:d4a8 with SMTP id bk34-20020a05620a1a2200b006eed333d4a8mr13101988qkb.680.1666359816796;
        Fri, 21 Oct 2022 06:43:36 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id hf8-20020a05622a608800b0039cbbcc7da8sm7855038qtb.7.2022.10.21.06.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 06:43:36 -0700 (PDT)
Message-ID: <65bb7736-9095-d9eb-32dd-dfcb7c3ca272@linaro.org>
Date:   Fri, 21 Oct 2022 09:43:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 02/11] arm: dts: qcom: mdm9615*: add
 SPDX-License-Identifier
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-2-dac2dfaac703@linaro.org>
 <76eca66c-5449-a125-23eb-c872324f321b@linaro.org>
In-Reply-To: <76eca66c-5449-a125-23eb-c872324f321b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 21/10/2022 09:42, Krzysztof Kozlowski wrote:
> On 21/10/2022 05:06, Neil Armstrong wrote:
>> Replace the license blob by a clean SPDX-License-Identifier with GPL2+
>> or MIT even if X11 is specified in the original blob since the actual
>> license text corresponds to a MIT license.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

But just to clarify: I was not involved in the DTS, so I hold no
copyrights over it. The review is only confirming the code looks good to me.


Best regards,
Krzysztof

