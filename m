Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2CC5E629A
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 14:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiIVMkj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 08:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiIVMki (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 08:40:38 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C260BE7215
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 05:40:36 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id j24so10319564lja.4
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=X48sd6dwxZB1SHayzPjumz0owiqRGtUb8ur+bpMGAg8=;
        b=WXKZhJOk8u61LgkuMC0We/AD6NplRu0uaHwhluHODR4xHt/Xqpu1uwP2yulqPUmM+q
         DwBuSZLRc6mdzwwf1pl3AgSTDqXGCVPAzeSmhpCDpGOVNeiXidNycACuhfuCcbi3mlDu
         5iMEs+raPOawyUlBHPvG/tbVY6OEp9mWgKUT3r3+wiMIaG9GqoAcxSgvCGKcb2nm2NW8
         ZWOOU9i3fqiqx4+eUN7Koz/brBZ6UE+4L518JsdF/s0pdM6AXs+lD9ZyLNP5w27Nj3N+
         Sh6rVpHqwdTiVBuvXyBju7H/rQvXU7tHtaFkq4uItxwHHOl8QxHl0R9aWa905NfF6niD
         ZDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=X48sd6dwxZB1SHayzPjumz0owiqRGtUb8ur+bpMGAg8=;
        b=5zVRs7nH34JvHEkHIktls1CHR+P1AkBWmLRP7+MYRem3ImjyMsDjxBmLVISbr4MSI2
         bJOZUOWWPBmPB8DP+CxVP7SgBPNftYCFCt3qCmpu5IRozv9YiRDnDiMYpl82CqfCpejL
         x2c596US7nppM2z1LHK8/q/3n/qso6xQc5Wsa+srWgEc/wzIWcbRj3gkfXDY5CCEwE9L
         bFlqsVn2clG5YJRSGyH//GWnlS3DeOQheBA0z7rtPq171uVH43/nXk08F/Fd/6qrO+PJ
         ZLzAjGOsczTsCV798CaCla8Kad9zNJWENlXUyyQP9GNkyiNwY3dZpuv8+W8+07uVHzZ5
         MQ1g==
X-Gm-Message-State: ACrzQf0suOH4/UxaMaWmoGkNu9B2+ETw/9tJNF1niKMZy0QHaSwa3mp0
        ikaKAPItj2I+3NisSPcMstBchw==
X-Google-Smtp-Source: AMsMyM5GU5VnXjFq1PwcBumh0Recos9Z+6aWQqFn881YTtujDAgRbzky9brsJOY7DLZHz+/aqrolgg==
X-Received: by 2002:a2e:9547:0:b0:26b:fb41:f60a with SMTP id t7-20020a2e9547000000b0026bfb41f60amr1040224ljh.295.1663850435003;
        Thu, 22 Sep 2022 05:40:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm921127lfg.190.2022.09.22.05.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:40:34 -0700 (PDT)
Message-ID: <6e6c1ef6-b15e-ea50-a627-9dc56aa4b806@linaro.org>
Date:   Thu, 22 Sep 2022 14:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_3/3=5d_dt-bindings=3a_arm=3a_rockchip=3a_a?=
 =?UTF-8?Q?dd_Theobroma_Systems_PX30-=c2=b5Q7_=28Ringneck=29_with_Haikou?=
Content-Language: en-US
To:     Quentin Schulz <foss+kernel@0leil.net>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, dmitry.torokhov@gmail.com,
        klaus.goger@theobroma-systems.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220922101211.3215888-1-foss+kernel@0leil.net>
 <20220922101211.3215888-4-foss+kernel@0leil.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922101211.3215888-4-foss+kernel@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 22/09/2022 12:12, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Add entry for the Theobroma Systems PX30-µQ7 (Ringneck) with Haikou
> devkit.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 7811ba64149c..f2aa5ddb76d2 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -658,6 +658,11 @@ properties:
>            - const: rockchip,rv1108-evb
>            - const: rockchip,rv1108
>  
> +      - description: Theobroma Systems PX30-µQ7 with Haikou baseboard
> +        items:
> +          - const: tsd,px30-ringneck-haikou
> +          - const: rockchip,px30

This should be somewhere around other px30 systems.

Best regards,
Krzysztof

