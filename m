Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4203537150
	for <lists+linux-input@lfdr.de>; Sun, 29 May 2022 16:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbiE2OVS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 May 2022 10:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiE2OVR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 May 2022 10:21:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8C842497
        for <linux-input@vger.kernel.org>; Sun, 29 May 2022 07:21:15 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id jx22so16443085ejb.12
        for <linux-input@vger.kernel.org>; Sun, 29 May 2022 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mjEHI99lRLZjmbE7yN5Vc3uafp8LIX67QIeSikjP+0k=;
        b=OCeCSM0Ry0XbkH3vo8R5rjfeiu9FUSChFE03CHQn6qKTZRM0/iYC9P4vI0nQ5r0n0i
         ia5LdpuIlrZvVawm2FoS1oKwbi9nDkIS3wHe/lPYRjQuAwZw4e5nJsaA6wDg8rr3e5Vg
         gTYlwBLCUGZPOhHtZmEgyNxJC9tlOy4WUsH8TJhAExS42VnHEr3ehbo5kc0zP2Bb/mj1
         VxFBtjt3C+Pvtv7MilgHgY99AQI7wXUJye84573LdQTx3fHFgBo7HTxie1Zbl7Fk7D7z
         7mY9RMhNa036KyHlDKF3XBzp5v0/A9v3ifgnYCltJyRKQ1w2/R5L8AZGJSUV842i+XA8
         PZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mjEHI99lRLZjmbE7yN5Vc3uafp8LIX67QIeSikjP+0k=;
        b=kKEQRFAI3Lc4neWMx1iJ8BcqGBV2YpBLcepmYeZUf9/oo04HcXbJhv6XFzNPENgZKy
         d5v2jCUljrw3f34CnC7/6xB1LUIZeSU6CzGNJMewMcVzXYlE+UUHtT3ApPU4lQ33l4Yk
         baTreXFe/4QbhcFKVxxLeTP4iSe3mwMBQHReFHrh4TZdL/dQMBOV/ZEMie0IFxVKv7QY
         zuT7Tidm3Flzj8DhLLeRfioV6zmFitkZBe7cgJLeK6OFeOMKBOYZ9SAKjnb3ZAM7f34A
         HGCgbuO4Ei4vgsDdqiUiEMndhT1OB8SFf44o1OS+5ZnXz/+4Csi7LZCJKUtVWSztoRjB
         eoFA==
X-Gm-Message-State: AOAM531kW2vyAZ6/6KrP4jF4MJm2kp96UpfLrOobCiqkqccFBUaSJzQX
        alqIQSBZ9Q+Ttpitr9gFoBi+0PwTEbIyrncw
X-Google-Smtp-Source: ABdhPJzaG3/GPj6E2gGmWOpmT5Z1QKhy7X39c3X4fuDnHgON7JWi/LN3waHAzmpyV3pW+sNopILVoQ==
X-Received: by 2002:a17:906:44b:b0:6f8:d325:bb84 with SMTP id e11-20020a170906044b00b006f8d325bb84mr45532026eja.174.1653834074197;
        Sun, 29 May 2022 07:21:14 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x25-20020a50f199000000b0042dd109b212sm356606edl.3.2022.05.29.07.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 07:21:13 -0700 (PDT)
Message-ID: <c4c17cde-686b-4f4e-65dc-9b8c41894bf2@linaro.org>
Date:   Sun, 29 May 2022 16:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: input: use generic node names
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andreas Kemnade <andreas@kemnade.info>
References: <20220524093136.7980-1-krzysztof.kozlowski@linaro.org>
 <20220527224401.GA395557@nixie71>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220527224401.GA395557@nixie71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 28/05/2022 00:44, Jeff LaBundy wrote:
> Hi Krzysztof,
> 
> On Tue, May 24, 2022 at 11:31:36AM +0200, Krzysztof Kozlowski wrote:
>> Devicetree specification expects nodes to have generic names, if
>> possible, so replace custom ones with something generic.  For gpio-keys,
>> the more popular format is "key-xxx" instead of "xxx-key", so choose the
>> first one.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Andreas Kemnade <andreas@kemnade.info>
>> ---
>>  .../devicetree/bindings/input/fsl,mpr121-touchkey.yaml        | 4 ++--
>>  Documentation/devicetree/bindings/input/gpio-keys.yaml        | 4 ++--
>>  Documentation/devicetree/bindings/input/iqs269a.yaml          | 2 +-
>>  Documentation/devicetree/bindings/input/iqs626a.yaml          | 2 +-
> 
> For iqs*a.yaml:
> 
> Acked-by: Jeff LaBundy <jeff@labundy.com>
> 
> Does there happen to be a list of preferred names based on device
> function, or is it simply a matter of what seems to be most common?

Devicetree spec has examples of names, but of course it does not cover
many of cases. Here I chosen mixture of device function and most common
(e.g. touch for touch controller).


Best regards,
Krzysztof
