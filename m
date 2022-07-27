Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC42582443
	for <lists+linux-input@lfdr.de>; Wed, 27 Jul 2022 12:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbiG0K2G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jul 2022 06:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiG0K2D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jul 2022 06:28:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3E245F7A
        for <linux-input@vger.kernel.org>; Wed, 27 Jul 2022 03:28:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t1so26430642lft.8
        for <linux-input@vger.kernel.org>; Wed, 27 Jul 2022 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+cxae8gv9ghFQbgIV+zWyRPdnemR4uamP3+fIGQ0mcg=;
        b=unGh8VSdM4z9dQYZaotpL1ryQAJtRKmdzXSK3lhFziwgOgZe58IRl0RU1pj8VkTn5A
         elkIrdMs2VY5NdRDjZBCbIhXsN345uxhPlh5ZP1qtRUK2TyCtFAC2JTjjUQTitPDQuTW
         ndu7gpeqDnv6duTHuQhEkaRTUeUNMpFXJ6plWHEN9eMebgpfaXswzpE3aTOAXlPUjPHU
         dI6WqXYBRGihvlz7jNAAgUGryEgy24P0r2iMYsRI1JkbYkyCGJqXNF8PYcxdi0voKRVv
         LSHfEQm/5CSEj6yz0fnjp+n1I4cfvwnNXJTZbQkih7fxli6WdoNi6u3ZpHm2qea4GjvB
         Q8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+cxae8gv9ghFQbgIV+zWyRPdnemR4uamP3+fIGQ0mcg=;
        b=x+hmL/LoaG8IV26gsdotwGkum9K8lvbz8MkD3slEK4cmA2Xr2DzK2uj90Ut8LweI56
         sESt/MFOuekcIfAmZ+FIbOZ3eWlXImoZpQdkRHg7v032oym+K9Pw7Ld/4/S7p7BXEDxJ
         hLQudWHioi1RL431urww8SHntHFK6I6PbAXXRSjZTsuFmajH5bxC7DkwGGM5WA06OI7i
         dKmKiVg9PwNdo29jmvAUnKLDubCSLW2m/MRZSEltLW98ZjlB9LVdRmNuI6Nbv/bJ1Sat
         GSxP2QMhmPkc7llnjuXqtb7Rtkxhs6IZU0Orp7fNhFoahDG4DqPd9dEha+tI0SFlL7Vf
         4ebQ==
X-Gm-Message-State: AJIora+sNwLLbOhMyjFGihjAQfNbDqvudp2GImyJ9DbLqKuCCEKH2Q0W
        Rsldg8Ejhqb+MNe1KNmhFgwTBQ==
X-Google-Smtp-Source: AGRyM1sl8aBw5QZ2EVsyCzqKkcJGvcqaRHRnIc4WpVubax801paGLnvD6aDVAIrlGAggKjSJkOFyhw==
X-Received: by 2002:a05:6512:1093:b0:48a:7c08:8d29 with SMTP id j19-20020a056512109300b0048a7c088d29mr8053245lfg.540.1658917680455;
        Wed, 27 Jul 2022 03:28:00 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id m3-20020a056512358300b0048a85bd4429sm2102539lfr.126.2022.07.27.03.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 03:28:00 -0700 (PDT)
Message-ID: <ff0341b1-e6a3-c2ff-4095-a6cc3641c82a@linaro.org>
Date:   Wed, 27 Jul 2022 12:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/7] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,keys-per-group
Content-Language: en-US
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Fabien Parent <parent.f@gmail.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
 <20220720-mt8183-keypad-v2-3-6d42c357cb76@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720-mt8183-keypad-v2-3-6d42c357cb76@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 26/07/2022 14:56, Mattijs Korpershoek wrote:
> The MediaTek keypad has 2 modes of detecting key events:
> * single key: each (row, column) can detect one key
> * double key: each (row, column) is a group of 2 keys
> 
> With double key, two keys are physically wired to one (row, column) pin.
> These keys are in the same "group".
> 
> Multiple keys in the same group reduces the number of pins which
> minimizes cost.
> 
> Add a keys-per-group property to describe this.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
