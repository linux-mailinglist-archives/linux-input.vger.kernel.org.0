Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BFF629B28
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 14:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238537AbiKONux (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 08:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238517AbiKONu0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 08:50:26 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1CE2B60A
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 05:49:51 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id p8so24486155lfu.11
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83HRjZKoyBhiQsQuC/2fimMYvWtEYyPCZTwB6HczlYU=;
        b=U8aNfCV8mQrF6+8xUdV+q1DsV+b4rovI818ppeddszlbjp3ubxcnLzMH/ZKp/GV5CV
         WqprIGc12o1WqT1enKPpTj+fFsbBNfFsRvFXB3A6iLwW0YjmguEY9dWOD91hoVQHja5N
         bH+LMyA8vFfleHQJO2H0Su2/6fhpHECFf3GaxoSQ+Ki2VrRAICyhdymSGlVfvfjiwj9H
         prrmSrf2iDSpt9owuBHRQg/LT4JczPXiMqNTtJEg+lPV7WvtzNkoKxbJ3KvnhAfBtuzE
         ekUPmQdYhjp7nrd19MVz5LD253YiMUNvMvI4nGJrL5Job5/tpnfxr3uQbEwrJhZGqngA
         nIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83HRjZKoyBhiQsQuC/2fimMYvWtEYyPCZTwB6HczlYU=;
        b=q1lxR6Of3VuhF8pL8y4mV1iMlbxh0gBFxU8eHGn6AxEo0Y6MO5XaDMvYatJeVWGdaV
         8ULJLgBn2Z4xFqsqDBWJq+9r220Mz+sVEXMLcdaIReXpun7YeRtwnq2DSVufSNjMZQFV
         QdkYU88104+nM7USNo8oyr3cYaXVI4AgEe7WJjgozMtxi1UfGKzbB3pb8lNHKZIFeAcr
         M7YehOf6WZtjkMb5+QXXmt1NZkZlxkps61cLBO4PkyTDPoMoN176Ox8u+gyoQphpXtgu
         9ebgmKEHuTE7l11Yh77pr+v0E8gUPeKZhIYl9TYbtgAd1jdsSWbB7rwFvUhP3ahIcCr1
         cgMA==
X-Gm-Message-State: ANoB5pk6vUSDCDjoJdOTIYk0Z4hLl23gyeyjwqdCUwDbyji2jYY56+KF
        0yfpbsTf3w4ZHbLY7zDdkWf+qw==
X-Google-Smtp-Source: AA0mqf5HS5gfxzBVMqFriEE4HJoPWmEr5IGzGDfjoRndsB7SSJmPfMrJ7RjHxXmJSplQzZN4BQIGTQ==
X-Received: by 2002:ac2:5c10:0:b0:4b4:6ca6:c658 with SMTP id r16-20020ac25c10000000b004b46ca6c658mr6341920lfp.359.1668520189681;
        Tue, 15 Nov 2022 05:49:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t14-20020a2e8e6e000000b0026bf0d71b1esm2508099ljk.93.2022.11.15.05.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:49:49 -0800 (PST)
Message-ID: <dcb65352-64c7-774f-3933-42f9dfe95cba@linaro.org>
Date:   Tue, 15 Nov 2022 14:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        angelogioacchino.delregno@collabora.com, broonie@kernel.org,
        chen.zhong@mediatek.com, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, fabien.parent@linaro.org,
        fparent@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, lgirdwood@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        matthias.bgg@gmail.com, mkorpershoek@baylibre.com, pavel@ucw.cz,
        robh@kernel.org, sean.wang@mediatek.com
References: <09495553-e563-e12b-056e-bed95531ab6b@linaro.org>
 <ba0901a0-56c5-4e60-49b3-356899921934@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ba0901a0-56c5-4e60-49b3-356899921934@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/11/2022 11:34, Alexandre Mergnat wrote:
> I think I understand my error.
> Actually, the RTC (HW) support the "start-year" feature, then I suggest
> to fix the binding like that:
> 
> allOf:
>    - $ref: "rtc.yaml#"

No quotes.


Best regards,
Krzysztof

