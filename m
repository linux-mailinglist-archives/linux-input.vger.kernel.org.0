Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA325F3F19
	for <lists+linux-input@lfdr.de>; Tue,  4 Oct 2022 11:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbiJDJDH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Oct 2022 05:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiJDJDF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Oct 2022 05:03:05 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF00851A0C
        for <linux-input@vger.kernel.org>; Tue,  4 Oct 2022 02:03:02 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a10so14628861ljq.0
        for <linux-input@vger.kernel.org>; Tue, 04 Oct 2022 02:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6Rz7JPiFqnQUTcKl6KF3UzKzhEmXhk37vIVAZHa+Zsc=;
        b=ARQdfcnd0hZkpgkRFGhtWMhtV0thRyTho16zrA+UadR3bfU+0finfa4kMnCJeAdzU7
         V11tXuNV3lk2MbwroYb/wY2zpLdgneA+/XSPu8rX+Z/GCkwx/81PXtLvdoPtB1ublLdH
         PDtsBg1BgI1RFuuG+mooaXuWhmsyKvdf4e+jXXQOld7ymJDvtdIeLZ2xVP4VVxemJzOW
         IyRvXaAZq2wOcjiAyECkGDm6dJORK/TqZZvbeS6kyGPfdFrkqugkUrZQbmMYrPj/miJ1
         VfcyFe6UU6XavPamrDhD/3J6kav9sN7wNMx7TTQMJZJ8dlMQ+LeVe9OexgPk0znKcO+c
         P01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6Rz7JPiFqnQUTcKl6KF3UzKzhEmXhk37vIVAZHa+Zsc=;
        b=kPIGvuB9eloKJvyMvvoE2pu+JClkaN9nMTAFSsRfmGz+xpv3b3aVrwajUhbuyau5Se
         b7OxMANmCHt8wIaSAP1WvLLIzBCcY5os+j7G+svD+eFI3V8uvVAj++YqmYZgDdfUvZa1
         naH76xo+qgzXxNPMi5Evxtp0G3/axcsH+6suCxIqYdVlgikFMl8dOCA6gi/mS0I5gkHg
         bdcHlaY/HLeOJO3Z+KiD6jGW/wtugsumffW+TO7zfeGJejfBxhB8PIF6m+Vk3YteRMQZ
         fMiRyslMqAIzgMO0Vrsiiho1x+VtBA5OplOMNQBDxa95fiZI2b5pBw6ahJCARpYg+fFK
         SJkw==
X-Gm-Message-State: ACrzQf3ac2FoEy4mDJroHDCoXPDvKuwXxjfUVvshlDncPNJej4RqmHmu
        HjURec5nvkWOZpvcHL22cHprLg==
X-Google-Smtp-Source: AMsMyM6pWiwcRHRWvlWIdUW+lweRygu3yA3ScLsvUwn3CpFiWSO/FJFAsKSykWEXrinPQx2cH9BQng==
X-Received: by 2002:a05:651c:2117:b0:26d:e257:e454 with SMTP id a23-20020a05651c211700b0026de257e454mr2242911ljq.62.1664874181164;
        Tue, 04 Oct 2022 02:03:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p6-20020a2ea4c6000000b002682754293fsm1214451ljm.1.2022.10.04.02.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 02:03:00 -0700 (PDT)
Message-ID: <26509d68-9872-e4f3-4744-43b6f5d3f13c@linaro.org>
Date:   Tue, 4 Oct 2022 11:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 09/11] rtc: pm8xxx: drop unused pm8018 compatible
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v2-9-87fbeb4ae053@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-9-87fbeb4ae053@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 04/10/2022 10:08, Neil Armstrong wrote:
> The PM8921 compatible is used as fallback when PM8018 is available,
> then remove the PM8018 compatible.

Similar comments about msg.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

