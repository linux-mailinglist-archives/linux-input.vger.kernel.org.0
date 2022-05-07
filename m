Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB73451E898
	for <lists+linux-input@lfdr.de>; Sat,  7 May 2022 18:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357399AbiEGQog (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 May 2022 12:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348250AbiEGQog (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 May 2022 12:44:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2209913D50
        for <linux-input@vger.kernel.org>; Sat,  7 May 2022 09:40:49 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id kq17so19595063ejb.4
        for <linux-input@vger.kernel.org>; Sat, 07 May 2022 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gEK6D0jbYqvI5/HyOZvDexMQJb9rlvEGsgPSNRbRwe4=;
        b=wkxBdy7mLI1dWduTrehhE2Wm01sY11eHeQerPwJXb6CiGyhCVZ9E06dxrdj1yqViK6
         G/uctb+al2ElkqSCbKkMyesLfo3V0RxHon1dCfsZrqt0kfD8A9p4NC18xth3/moJIJFk
         worNOjMJPQGH9ET2qFNIkDE2NwiD92RAibx5ty0eG1ZQAdKiwA9yxY3NPuDYta5wkgVj
         jX6nu7IF3u0aDYj3tczcjtIB6OmNBhTj1mDpHcJEBV49pthXhdpV0PVBs4rd70kW33dq
         1Ygj4JoCuoX2riLkh2fIzwixF/M4mOkoJb+2WZrrSBuWxldwMNgVojjOGM0YLKBMtGqB
         Qp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gEK6D0jbYqvI5/HyOZvDexMQJb9rlvEGsgPSNRbRwe4=;
        b=e2atcquzzZ1iSeut+hBaKsz25JHS1JuakKehp/Tm4j4a+lbtHOqR3nEatAO8lGMZPA
         Flp0YJrz9JqamiI2PBKkijv3n0rMijAwadlbvRIk4kRKaDPmm+BAXMFEVps6Aestacuc
         zgOsydASmPO0mnCwgy2CcZSIEyiiYL8eKmKA44FqTvFfZmaoTVYfTUDADkODju4LOrEU
         AZlKz2q6R+N+c8BC+FRbg/2q8V9WawK0myjlHozFJnqw2QLguW6GPTmrmKvMJtAJc3T5
         KGgISUCO+FyXjdl2UXerpszQ6pAM55jvKLXuQD6apgLI1k6Qgcyg6uh+MXGgecEfGigl
         cU4A==
X-Gm-Message-State: AOAM530iv3HM9YpFLnC2VsvPlbsjH/rbAqDe2iduFFHxV6seITUqvq/1
        lllkQwburNyZXRssg+y5ZOOzTQ==
X-Google-Smtp-Source: ABdhPJwuTn/xMtvoc1f2bwECDfAj/wE4rma3gDDKCO73TqgwG5whAwnJkNJUwZkucPP0ZL3K7MmLLA==
X-Received: by 2002:a17:907:9492:b0:6f4:f618:b575 with SMTP id dm18-20020a170907949200b006f4f618b575mr7812482ejc.39.1651941647743;
        Sat, 07 May 2022 09:40:47 -0700 (PDT)
Received: from [192.168.0.233] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id wi22-20020a170906fd5600b006f3ef214de0sm3168896ejb.70.2022.05.07.09.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 May 2022 09:40:47 -0700 (PDT)
Message-ID: <425eddc6-84b4-74e3-40ed-bbd4c195e2b5@linaro.org>
Date:   Sat, 7 May 2022 18:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 05/11] dt-bindings: serio: add Arm PL050 DT schema
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <20220506140533.3566431-1-andre.przywara@arm.com>
 <20220506140533.3566431-6-andre.przywara@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220506140533.3566431-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 06/05/2022 16:05, Andre Przywara wrote:
> The Arm PL050 "Keyboard/Mouse Interface" is an Arm system IP providing a
> PS/2 compatible serial interface.
> 
> Add a simple DT schema binding, based on the TRM[1], the existing DTs and
> the Linux driver.
> 
> [1] https://developer.arm.com/documentation/ddi0143/latest


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
