Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1618B60AE0C
	for <lists+linux-input@lfdr.de>; Mon, 24 Oct 2022 16:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbiJXOqs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Oct 2022 10:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234553AbiJXOqb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Oct 2022 10:46:31 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930DDFF262
        for <linux-input@vger.kernel.org>; Mon, 24 Oct 2022 06:23:12 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id 3so7812129vsh.5
        for <linux-input@vger.kernel.org>; Mon, 24 Oct 2022 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWc/OUEN2es9kqnp/4qvx+BKaSgxt+n/QrUsiA3J9n8=;
        b=RV+PNeif1pUPdEtV/l0kimvzLD38P+NGFDI7R2MB0zn7FLBqrR0kjFR/pzGrn56OoD
         RnMr7FVEiW1VNggUCcqHMa4DoaopHTLcN96XRAOJfRYt8OrMKCb/at6NxnFhjHrPz6w/
         VnmWJ4xN7t5zIVvdNUJgT2yEIcK1wLAt4TDBcq9sFDUZL2DC6tHEp9KYpdj9cbr7aXUU
         rVnkr2cNc13BMjGYBFtGTeSgCKWqBpSRuKf3k765eCEFudM0GXPT0M/hiWCgFL6/LWrW
         zvp0y7Xos5BG6t07kKsC+RiuP5CBibTdRJoN0zBMmEQQi7n1QUW3mvAlHAZu+rSjGZ4z
         tGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWc/OUEN2es9kqnp/4qvx+BKaSgxt+n/QrUsiA3J9n8=;
        b=JKoh+Too+4b1kyJE91LF69X4pNGSQMU7cUrjtjfEEOjdD3NxqNsZhtuqePRI1D+rI5
         Rdtd+7NlbdgmPCmL5X+WUHmANOGoEScehFeToMYoU9+QFkGGTcpcbUeYL/2CkNkDDqyF
         DFg2k0Oh8uBXthIoKdoFuFiewNPjRRtRUsvGJflvlCCn+FaHpmId9JDt0gti+VoJQglt
         hxl2IucxmSER3o/7jdaYn/sjp37zEfHNz3ZSN73OANF2ciKfAhldzf0/8EHbzXTYM/Al
         l3aHbbB7UtA3TVa9yG1i0iI3gRB8IZSww47QX4+JcwhJcKkxmYpfYiSNmR2/mZVhXIXh
         xxAA==
X-Gm-Message-State: ACrzQf343p3x9XALnh7jI4JMfsbBZPWuZ42N0iFBcUjYzzr5QQjP1hBk
        3Eu/LVXr5EDof3y+TCQWPeRn8LqdorMyZA==
X-Google-Smtp-Source: AMsMyM4j1KAp2dle7rqk1PkzslURb4vmAjiBwNbic/cyGPwWxZnDMQA+TWzMLStfV5PG/wERtTOiXQ==
X-Received: by 2002:ad4:5f4c:0:b0:4b8:ec94:68e with SMTP id p12-20020ad45f4c000000b004b8ec94068emr17972070qvg.38.1666615852853;
        Mon, 24 Oct 2022 05:50:52 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id fb20-20020a05622a481400b0039442ee69c5sm12725487qtb.91.2022.10.24.05.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:50:52 -0700 (PDT)
Message-ID: <ce7c18ef-8619-1719-59e8-7983e4b0bdc1@linaro.org>
Date:   Mon, 24 Oct 2022 08:50:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 17/21] input: remove s3c24xx touchscreen driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-input@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-17-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-17-arnd@kernel.org>
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

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx SoC support and its adc driver was removed, so this driver
> has no remaining users.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/input/touchscreen/Kconfig      |  12 -
>  drivers/input/touchscreen/Makefile     |   1 -
>  drivers/input/touchscreen/s3c2410_ts.c | 464 -------------------------
>  3 files changed, 477 deletions(-)

This also could be usable on S3C64xx, but it seems no one added any DT
nodes, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

