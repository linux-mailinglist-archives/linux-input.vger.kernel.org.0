Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8CB35BF697
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 08:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiIUGr6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 02:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiIUGr4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 02:47:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321D57B294
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:47:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f14so7631459lfg.5
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=e/qlMRjeLI7cvdXCPMm7XCLXM8gfF+H0TRh7nH7eUmc=;
        b=OlkRaPzT/EsGVCYhp7QKngqgMhN2WB7xIl3iSkBNblcK1aMQf/e3vV3uImji2L/okS
         irQ4+OVGKyqvaPjBBDRBqYV++TVSc/TbpxptrDPORPR9yoK9G16+Ff6xylkU66LGlWQH
         jjMoA6MONOBG5PIVUsXNCV1Za5TfUMExx+q9tiUFOthrs1v+jmguuKCxpYqMray+JJZm
         yGos339JbYAb34YtrSKGCy6ZCAOKnTP2rRZeldsi07f+j1rS23tG5mx3/YFliGxCt+gG
         H01wlsf893s+yU7aLO4sqqs9vWRYuyeR4S7XPOGgoSyYFStGRuD4VVu3ChwrirChO0ki
         Wjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=e/qlMRjeLI7cvdXCPMm7XCLXM8gfF+H0TRh7nH7eUmc=;
        b=uSZ942UmMRy9Nn+q67UWgTHK9rDBzLM3UwsJAeycSpGNmBd3QQys2j0l2HoTH986HQ
         ufjT84MqT1XAAteqhNg6IQPm8TCm3iJOxhn+t7hS/hAJ2R/s1SsESq+MdGkQ9dwHsVQN
         0z8falH+OssZniyOo+CPuXiSqAc8bRqDCOvtxU63VkB695n2JOd2H0V1hhK6boLNrFYD
         ZtmJ2OcLYLltBujS/HhmHP+g45Bwqw+ZAum+I94OyKLOrQDoBCXyQ1j80un8X3budjOK
         7nu3Am3xYuzYm5dGIGRPb6O8oJviYUyuQw2es0wcpBW4eDBMW9EQZqX49BFTMKljYs4Q
         yn5w==
X-Gm-Message-State: ACrzQf0tI7F7w1XcAyu4vqBk0FCv4fAKYsZViHX34xWCCrwdBdB1DBPM
        IqKzxF57ptuF3nK0XqO0U2xIjg==
X-Google-Smtp-Source: AMsMyM6VSdl6GKknWuhyDqBfXdVFdqC5rXDETmWwrMAV8AsKNNZpVThYjbK5rNepO9cRHCPXEhPTIA==
X-Received: by 2002:a05:6512:3d9f:b0:497:a108:544f with SMTP id k31-20020a0565123d9f00b00497a108544fmr9018351lfv.688.1663742873480;
        Tue, 20 Sep 2022 23:47:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j16-20020ac253b0000000b004948378080csm295277lfh.290.2022.09.20.23.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 23:47:52 -0700 (PDT)
Message-ID: <f49144d0-4e26-6907-d2bb-0bb15ddb7954@linaro.org>
Date:   Wed, 21 Sep 2022 08:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-binding: input: egalax-ts: fix GPIO and IRQ in
 example
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-input@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220920042608.1865560-1-dmitry.torokhov@gmail.com>
 <20220920042608.1865560-2-dmitry.torokhov@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920042608.1865560-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20/09/2022 06:26, Dmitry Torokhov wrote:
> The driver is using level triggered interrupt (low) which is backed by
> and active low GPIO that can be used to wake the controller by driving it
> low. Let's annotate it properly in the example.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
