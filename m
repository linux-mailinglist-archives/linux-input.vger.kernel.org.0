Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6435565BB73
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 08:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbjACHyo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 02:54:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjACHym (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 02:54:42 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B470CDF2F
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 23:54:41 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so44593443lfv.2
        for <linux-input@vger.kernel.org>; Mon, 02 Jan 2023 23:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4HMcx1QAFcXp/Qx6CDx8fr1cXVBwmYfFpEeT3225EpU=;
        b=Kk5d4b+4KRmJBd52EyRmGjIYQfiK/sPMkXIuJz+JBdw8whxybJmypWgvxZywZVJ3ZF
         vXL8tWaEngjt1xIp8AfunAm2uOOt5OgAsFMjYOx1MLbjBI6I/DRAnaBwDvpVlpWEilco
         kLcehxM7N+DygG3hKGlputvxBcg/M2EJmamxaeyKsGSmcLuy75cyPipZAojh0aft68Sq
         aSyXgEm1jtTVwhG+wzzA0dJ12X5QG8bsIrw8vu/AXCxDb7zkjey1AgTkH6O0e8PtxuCO
         uj6e+0hfTsaS4CXttOTyAH1aXlDBPSX3faES3t+p3rxCNci+Ya0IjP2YOTBhs6y3i/U+
         vREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HMcx1QAFcXp/Qx6CDx8fr1cXVBwmYfFpEeT3225EpU=;
        b=n/hIBpRCBSwvtrgYDJHUK+SzZIIJrnU24Lseh9KhmdT+Rw/qnrcAf8XVW1pKunXNEh
         +W7AtelBpAp915ws5uiFBgBhxWjDC5lFRyPZ3typb8gI7tQR/MLbm22oUjB+p3sY6tLR
         0M40mi29mq/YMvwZktwdWhH2w+bH7/T3GgznW+tpo7SpKIrMODiVkgQRZWVfa8pPsnIy
         y1o6NMrbFzmdbxE7Pc0y6SSMrXDJ79WfMLIVnZDeT6g6GnOxNn1BsA4F/N9zSOZvaVsn
         pOQfRp9N4ip9BPkTB6eHxZCYYvMkR1vHmCj1/j0JKN3hknPaRHmB1ftAdu5TqgHAqYYB
         AxsA==
X-Gm-Message-State: AFqh2kpMfme7RH0VMy/qHC9J2Rqlpbkluk1+bTgw+WG2LvjlswFmksvV
        z2lSXdpwcf2uTzT7DarVdrBRmG2YOPS0/RxC
X-Google-Smtp-Source: AMrXdXuelxBI1Yn8tmASSWnPS6ou6W79wdh5bus50/Y0A+K/kWdF2O72HyZqfVXzN5IVZtI0qPTjMg==
X-Received: by 2002:a05:6512:2e3:b0:4a4:68b7:dedd with SMTP id m3-20020a05651202e300b004a468b7deddmr13146611lfq.57.1672732480029;
        Mon, 02 Jan 2023 23:54:40 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o8-20020ac24348000000b004b49025f96dsm4743641lfl.187.2023.01.02.23.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 23:54:39 -0800 (PST)
Message-ID: <52277543-c12b-e1da-8127-fb9917dfe7f3@linaro.org>
Date:   Tue, 3 Jan 2023 08:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/69] Input: max77693-haptic - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Content-Language: en-US
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-12-jic23@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230102181842.718010-12-jic23@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02/01/2023 19:17, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

