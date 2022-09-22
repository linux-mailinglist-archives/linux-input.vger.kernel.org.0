Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFE75E62A0
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 14:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbiIVMlU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 08:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiIVMlT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 08:41:19 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3DFE7C3A
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 05:41:17 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q17so10797861lji.11
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jrS+VsYT+b+f3LmzRlJ19xxnrwcs/yWfI/hqoqYNbQw=;
        b=htHVzKp7+2NRaKk+H4Yw+4cB7Y6HgiUXZ47OoZUYOISeETfL/BPcckdCUSgO4KJPg7
         XRPqXRcJqXvgkLRV8PfuVxPSAQFIG4N8fI/q2SuDRl9BLHLCHgASdLbeQ+I7SIHfhhjq
         vcQJkps1D4Pr7eS4ZcYWoerMQyn7A0MbPXSN5bTaauSuS5hw+FEOwSK1x1Rcq73hthtd
         hhDUUG0UzSmXNvIUeSs87GNuEjfI/M2aAVfzW2hgPqIjsOvnMoicYMVUR7/lTmFnsjGP
         OhnFp/LvkJSh35TVVSZ2Z7VFQm6G7jyC7SUJpwGdtEvwsL4T5qdjCasZkB12Zul1WmAH
         mZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jrS+VsYT+b+f3LmzRlJ19xxnrwcs/yWfI/hqoqYNbQw=;
        b=KP+gT+w2QMvKIUPer76xmdaeBHEA1Cgebo/9pxWs8VYR2mBplMhcYEaw+88kFim1Wf
         eFTsOVK42KX64/r0/klc4jqUGFZiyFlf7P5bGVqVAGckbHQDnJurLytxNIId0HJgmA4g
         pc3/AZSfGrLAApJejunFlN40Brg6hYPrwbDzFsEpwae1/utEgfI3BMLFUIv/OVpahWH7
         e5T2aGHU0TLVwK7ZH93EmMVEYabySWfTGnPn254h6+m48TkYlFtZOCKsMg8RFpEYHZUg
         8guWeh8vYRPPpayAj7xDEqShQX6EQxd1uubTu0YpZ7ah8NXLBSmFhQifZl+I2RFnGqU2
         53Gw==
X-Gm-Message-State: ACrzQf26SZJFG0JPwPgHqfgoE1GQmLB63IPukmD94rlVRi1Zzrv+FERW
        VgQFeLEjs+8WwpqOEqABBhTcqBJUhVndpQ==
X-Google-Smtp-Source: AMsMyM4yed3T5zj8DayAtkpGWLnjuWRP/U3wHhYqSHfnfOxwvo9+6hGXfoOo1lrZThdvV7IYh9GUuw==
X-Received: by 2002:a2e:9653:0:b0:26a:c786:a104 with SMTP id z19-20020a2e9653000000b0026ac786a104mr968137ljh.183.1663850475610;
        Thu, 22 Sep 2022 05:41:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s13-20020a05651c048d00b0026ac8c94022sm889813ljc.119.2022.09.22.05.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:41:15 -0700 (PDT)
Message-ID: <233d4a3d-9dc1-cdd2-a718-4843e5fd23d7@linaro.org>
Date:   Thu, 22 Sep 2022 14:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_3/3=5d_dt-bindings=3a_arm=3a_rockchip=3a_a?=
 =?UTF-8?Q?dd_Theobroma_Systems_PX30-=c2=b5Q7_=28Ringneck=29_with_Haikou?=
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <6e6c1ef6-b15e-ea50-a627-9dc56aa4b806@linaro.org>
In-Reply-To: <6e6c1ef6-b15e-ea50-a627-9dc56aa4b806@linaro.org>
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

On 22/09/2022 14:40, Krzysztof Kozlowski wrote:
> On 22/09/2022 12:12, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> Add entry for the Theobroma Systems PX30-µQ7 (Ringneck) with Haikou
>> devkit.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> index 7811ba64149c..f2aa5ddb76d2 100644
>> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
>> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
>> @@ -658,6 +658,11 @@ properties:
>>            - const: rockchip,rv1108-evb
>>            - const: rockchip,rv1108
>>  
>> +      - description: Theobroma Systems PX30-µQ7 with Haikou baseboard
>> +        items:
>> +          - const: tsd,px30-ringneck-haikou
>> +          - const: rockchip,px30
> 
> This should be somewhere around other px30 systems.

... or not :) if other ordering is used. Anyway - if you keep existing
order, then:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

