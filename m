Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263675FC5C8
	for <lists+linux-input@lfdr.de>; Wed, 12 Oct 2022 15:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiJLNAi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Oct 2022 09:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiJLNAg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Oct 2022 09:00:36 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A1ED90
        for <linux-input@vger.kernel.org>; Wed, 12 Oct 2022 06:00:34 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id t25so3281786qkm.2
        for <linux-input@vger.kernel.org>; Wed, 12 Oct 2022 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7I3Cz5+U5x6cIXGPA8p9f0gJdwGq7AR9Xznrk5pZ2M=;
        b=RUfyxSq7fmq5cjgnShru5p1DpyftvUBe1/f4hzQ1PmJ0Q+GHCzHTY5hwtO2C/v6jmA
         RdI0LdVobKGxBm018dRryOu+/vONbFYUGHH8VK+S6syziEp9u13ceqVcILGEWqE+gB8x
         pzGZhXVOU9KAEMQ0PqAWNxSgMj9x4I2IG1yHTDSYLgJINCC576qp8CQJMXENZBksoCbC
         mrSeZySI5K76K1GGVat8g9kSTpEcbayeMVJBZWij4QjvOV/JVIdDZdOkUx8wxGPyzCbO
         rq079Sc6EayGR5GZE87XrvXw+jkLbvXG2G/Rqr4s09/Mj/r9iWeNZuGTMsR0D2QNDdtT
         Ulzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7I3Cz5+U5x6cIXGPA8p9f0gJdwGq7AR9Xznrk5pZ2M=;
        b=d9yPbvErN05cS735ZPmFBEAWBllU29beDtFwwcX2sZN28zz6pV+Aa5VqPL7Gy9qONh
         GkIJ7fwBvnvvHasKC7UKtLIJ6S8Eph4WLoqGI/zd9xUAf25KJTy12FvB5rt6nrzJmpaS
         ztFTXivYk0pzEcCbEBcwSjlXJ02QifKchVD1CIQ/IbPNeKC3xnRjZ+ASvBPCm0VJjgkd
         OPwEaC8iolCbBOnYTeDiFQx4nCeb83R3sKEZ+20hAHc95Za0ytC1Sx95IceyewKA7tIQ
         2OVJWyXgmzlKWlxgBz2MjvyYVICyzrkRIoVjuMVYnU64maNG9VG3/9cDbM52HePZsEGV
         bXDQ==
X-Gm-Message-State: ACrzQf1ZZh0IBC5KsixU2CZQ62abLZtm6jvzYNV7D4ixpbnPXSA0qtUo
        G0fyH8TvCAQi2VedGl3/H8Of7g==
X-Google-Smtp-Source: AMsMyM4h65oRCdBS2LVLH3asi+Dz8Bht/2Ex4MGomFkxTgfupyoOTY1kejOISNYZo3eiUk2ujujm/g==
X-Received: by 2002:a05:620a:280d:b0:6cf:ab57:a130 with SMTP id f13-20020a05620a280d00b006cfab57a130mr20372720qkp.749.1665579625333;
        Wed, 12 Oct 2022 06:00:25 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s4-20020a05620a254400b006bbc09af9f5sm15488418qko.101.2022.10.12.06.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:00:24 -0700 (PDT)
Message-ID: <fc1e5799-20ea-de37-6693-e2ea0fb87f13@linaro.org>
Date:   Wed, 12 Oct 2022 09:00:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Add tps65219 as modules
Content-Language: en-US
To:     jerome Neanne <jneanne@baylibre.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, nm@ti.com,
        kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-omap@vger.kernel.org
References: <20221011140549.16761-1-jneanne@baylibre.com>
 <20221011140549.16761-7-jneanne@baylibre.com>
 <72b9809e-d6d7-862a-26b8-221d14ea4322@linaro.org>
 <60507e87-cf92-13d9-29d0-83f18a648f4b@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <60507e87-cf92-13d9-29d0-83f18a648f4b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/10/2022 04:39, jerome Neanne wrote:
>> You explained what you did, which is easily visible. You did not explain
>> why you are doing it.
>>
>> Best regards,
>> Krzysztof
>>
> Thanks for pointing me to the detailed guidelines
> I'm new to upstream and not well aware of all good practices.
> 
> Would below commit message be more suitable:
> 
> Add support for the TPS65219 PMIC by enabling MFD, regulator and 
> power-button drivers.  All drivers enabled as modules.

This still says only what you did. I still does not explain why.

Best regards,
Krzysztof

