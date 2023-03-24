Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 239566C7D5C
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 12:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbjCXLk7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Mar 2023 07:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjCXLk5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 07:40:57 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC861DB87
        for <linux-input@vger.kernel.org>; Fri, 24 Mar 2023 04:40:56 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id ek18so6791141edb.6
        for <linux-input@vger.kernel.org>; Fri, 24 Mar 2023 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679658054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDA/uoSWTDnnUdNCbAzztacdJP3oEz9K+rqxIbnxmm0=;
        b=Z4EGMPnKp+OJfyJukNmtJMR+11sVCPZVpG4ab+3ntrTI99bny+nf70oE2lk08/ErNr
         jrxuNym58CtNdHfW6eCdpsE3Q/2pdZyD7zJeQaZhYo0zcUZZTHfs858aHf4uLxieF3fy
         Sk6yMqbyX3FitpcS2ao4XyhjaWatm2eadCccyjabVWD/eLoJ840NdJCJQz0to15eN611
         mWk3GPJNUH2vsZRJmKADau+9yYDjrbaj5a9/uRBDSr2+DzfGtTRowzCDJX+ijuq6npzA
         G+uRupBCg+l/Je+FQPe4XEKdNwSLcx6VKLqKtqxwCHmhN0IQMmHqOAG3/X03TnRQgr0d
         Uf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679658054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDA/uoSWTDnnUdNCbAzztacdJP3oEz9K+rqxIbnxmm0=;
        b=T9H6t5MP+4UF0ZOk/bGpADb87WKyo+huk0Ir7XUVYwWpVb7ieErrfKtI1hBgpyLtMc
         Y6nAEL4qHSmHwdm8CGsk0ZsTkSovBZDIt7Gs9hJfRNpnBkYMFBSoqMx+18mT7/RRwMIh
         6JfBB3tFqoK4Lh6M1zKYUZHcz8a5SsnORhEiWO7A4CG5oIh4iPIT3RNuFZW2c/wNSXy5
         8SKpYrgdFJ1NzlCte7OzbQzctJMs5NzOyAeWsL0qwvT3KrmylhdtdNbYi5ya9rpIq8J/
         r/VnH0RfKjGlDFnxPNvn3LRFyBQZp87vppWH1x4gtEUBwBstl3L2FSKVI4nPsI4tybz2
         Fc6g==
X-Gm-Message-State: AAQBX9cH1gWMr3gn2jhHGEtvNP+5ahdi7Ob+xx44VA2hq055adNCvx6I
        L+PwXtZFB+qo0dmXRgwdotMLaA==
X-Google-Smtp-Source: AKy350Y/ge5Gs2wjFmEoOlbUMNFbhhzaLG3HHyOrLWfaZLXTPJHPyiR6NXgz4FKZxj0V9+iSnegLBw==
X-Received: by 2002:aa7:cc12:0:b0:502:2265:8417 with SMTP id q18-20020aa7cc12000000b0050222658417mr1219481edt.17.1679658054585;
        Fri, 24 Mar 2023 04:40:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3027:fb0b:ae08:588? ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
        by smtp.gmail.com with ESMTPSA id b15-20020a50b40f000000b0050221d6768csm698869edh.11.2023.03.24.04.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 04:40:54 -0700 (PDT)
Message-ID: <f69664cf-d995-41d1-f6d7-d6ea123506ef@linaro.org>
Date:   Fri, 24 Mar 2023 12:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: input: fsl,scu-key: add wakeup-source
 property
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     shawnguo@kernel.org, aisheng.dong@nxp.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Peng Fan <peng.fan@nxp.com>
References: <20230323093141.4070840-1-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323093141.4070840-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 23/03/2023 10:31, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add wakeup-source to indicate whether it could work to wakeup the system
> from suspend mode.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

