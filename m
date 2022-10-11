Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683BF5FB1FD
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 14:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiJKMGZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Oct 2022 08:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiJKMGX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 08:06:23 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5DC8D0DF
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 05:06:15 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id f8so874865qkg.3
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVRPkDEbACvmkZC8kApIS7yMdkHthYtuVHRwDkmsTFY=;
        b=NhH0A06ZPTKy45tcwzqP78rP8uzdihSRJD6UVIGQ2MBlCI+YSqrT1HQVWUnG8YAcAz
         gPj/dwH7zowzWBnlmrUG0QyMpQEWPR1mid7e0+IeeTlzWVubMTzwtKjlqtpEAVEPnesJ
         RE4rWeqdhXj4NMbVcXvcXxueWvvP+HJ7QmW/i93RLKOenyQmJ+7YrXQaCTWII3oF2LEs
         AQ+4sKPQSqXi4e4IvbmQ24fUD2rpEw7Jf/10Pbc7VtClMuNVy8p2YvX4ZF5JvyAYac8M
         OVgtlrgxYEytL0G7Itva+hbTYfuZDSINva/G24TC48CsG3eR1P84ktPC750qZSZnGFB6
         ZSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVRPkDEbACvmkZC8kApIS7yMdkHthYtuVHRwDkmsTFY=;
        b=dER7sPSzjRcxJn9VR45lzDsqqLZvnPUVY+9KRnoM0R+3OAIVXI1wIMgyH6eNPif4eM
         U4+B9BX7XwtHWBP1VxFTxGwDvpcUyMnmEoL5L26jBza+Mfme+XKvfBYaWiG4+tkqE/AY
         KGBAK1SHowdyPw3Lxt18b7d13CmvMAtom57pfDpT6RFnAVhSweo1hQ/pwpIiqb9kX0s+
         uYh+p3cF5vv2JrNhXCJhP5mzFEjDYn+c5wk4KiyLHUD8IF5NV2J6ewTlPi+Z5UlOhSco
         EeSBhRoei1ODNYQXh4jLz6lORo6ud1PAdQZEUJyBqJwf7sA4E9MrJuCupadqe/A32pt9
         egLQ==
X-Gm-Message-State: ACrzQf1m0NFpxogXrvdGCKJQZ314Wfwg3BqPQtMnTk4X93zQsM48eMKc
        S79h4ihBCVkMdWaIojyKehPOuQ==
X-Google-Smtp-Source: AMsMyM6OjIpqGMDaEgzj3/3BoL+9VrEq3Jr15zfY2zwCSrdjnFPPz0n+ElpXLJIs9GfTLc4SnGylRQ==
X-Received: by 2002:a05:620a:1b9b:b0:6ed:35f0:9b56 with SMTP id dv27-20020a05620a1b9b00b006ed35f09b56mr5955854qkb.196.1665489974107;
        Tue, 11 Oct 2022 05:06:14 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id b26-20020a05620a089a00b006ce3cffa2c8sm3428470qka.43.2022.10.11.05.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:06:12 -0700 (PDT)
Message-ID: <9afce114-1a0e-a0be-c07b-a78740e2f108@linaro.org>
Date:   Tue, 11 Oct 2022 08:03:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 3/5] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     broonie@kernel.org, chen.zhong@mediatek.com,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        fparent@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, lgirdwood@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
References: <cdb4e9f7-c7b3-3a1f-bf61-e42bdb021570@linaro.org>
 <972ba839-2fd3-2b45-3477-0c7e3d32f149@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <972ba839-2fd3-2b45-3477-0c7e3d32f149@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/10/2022 05:30, Alexandre Mergnat wrote:
> Hi Krzysztof,
> 
> Thanks for your review !
> 
>  >> +
>  >> +    properties:
>  >> +      regulator-name:
>  >> +        pattern: "^v(core|modem|pa|proc|s1)$"
>  >
>  > Why enforcing particular name of the regulator?
> 
> The regulator names are forced to match with the datasheet names.
> 
> I think it's a good practice to increase visibility between HW & SW.

Enforcing is not a good practice.

> 
> Also, that keep consistency with other Mediatek PMIC schema.

So there is a bad practice and instead of fixing it, you align to it... No.


Best regards,
Krzysztof

