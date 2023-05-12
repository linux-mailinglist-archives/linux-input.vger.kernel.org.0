Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDBBB700047
	for <lists+linux-input@lfdr.de>; Fri, 12 May 2023 08:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239756AbjELGZ7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 May 2023 02:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbjELGZ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 May 2023 02:25:58 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B69435A6
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 23:25:57 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96aadfb19d7so38880066b.2
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683872755; x=1686464755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r1exhnuRm61lKc3x0rwGeHWk6dT2vR/1CPi8qpyaKMg=;
        b=gmGHhHCvMkCnWxGyHfkLx1KkdIIRDRMZ19JyipR8t03BPMUUSPJWuD+LjokTfnQuDr
         GZopQij93wYmjOIpvR1TPSAvn9WB9nXSj7Wa3bJJW+wwiB+U956R4ly9EsXVfs1FsVcc
         eEnKc/ZdoNrmdtDPhUEu+m+q0XVeTx1zAqw02AurxfIPHTJ0PDk7MHfxN6/wuZJuovti
         zhpfT1IVygAFOoivP4vDQ2CSaAXnwbRU8UzH4in0AT75MJgwJ/o9D1KX1t1qYIf5DKQH
         MsM+Yvcb7xi7QHBfcQyi4GJTetspTPVJYPvvPJ3bZMS8yKi7N9EHixYl4En1JJWtJnPV
         QPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683872755; x=1686464755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1exhnuRm61lKc3x0rwGeHWk6dT2vR/1CPi8qpyaKMg=;
        b=C2ZUVfmzxhd2eXLEYOUC6TwsIhdU15vjBr5+9alNJssxwsFlviFMPaizCSPqVNsCx4
         Bfv3sI1Py1ZZCeUuqUoJIysmv/RcMAiMb8mV4wfe3u5ibvdKqhva1dYzrLvuiDgV9lAp
         5JTrcvl5bGn4jQSsj4VKb4c5p0QxGxMZH0+5Ivcw4+DHRS03TIUvDvgi5MUXEUC1zrB1
         WFNcf6YTCL2P+Ul7l7q0mJ1lYzp+RI4J9yUdevec7Vle5rgGVwCAqYlFMNPRfwvVnWf3
         BeD7+aScjh6HzZFOm0X6szMHFT/zQVinChKt5KuXvBy2bxMlcl8inKg6a1/mfxRfJ98F
         iFGQ==
X-Gm-Message-State: AC+VfDwKlFuBNU+KmdDt9WrR1U4M2d69Uw8uTDf7YNp0nQr+y0qzASBM
        2EG4cv2CVD3lDsWQuFIYrnwMgQ==
X-Google-Smtp-Source: ACHHUZ4t+Vlk49wYucsz5P/lKkrFidzVTt9kRvR9kx+8biobSZWjGortS1eMOu2JIbtwMybMIylSxA==
X-Received: by 2002:a17:906:da87:b0:966:3c82:4a97 with SMTP id xh7-20020a170906da8700b009663c824a97mr17022638ejb.35.1683872755493;
        Thu, 11 May 2023 23:25:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id w21-20020a170907271500b00969dfd160aesm4650145ejk.109.2023.05.11.23.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:25:54 -0700 (PDT)
Message-ID: <a7261bc1-902d-99f9-aa3e-2c90dd264c8d@linaro.org>
Date:   Fri, 12 May 2023 08:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] dt-bindings: touchscreen: add virtual-touchscreen and
 virtual-buttons properties
Content-Language: en-US
To:     Javier Carrasco <javier.carrasco@wolfvision.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bastian Hecht <hechtb@gmail.com>,
        Michael Riesch <michael.riesch@wolfvision.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230510-feature-ts_virtobj_patch-v1-0-5ae5e81bc264@wolfvision.net>
 <20230510-feature-ts_virtobj_patch-v1-2-5ae5e81bc264@wolfvision.net>
 <280ab18d-bbfa-9920-5f1b-d069fd866e1f@linaro.org>
 <18526d2a-ac5f-2b26-9ed3-5a82f20cac86@wolfvision.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <18526d2a-ac5f-2b26-9ed3-5a82f20cac86@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/05/2023 12:28, Javier Carrasco wrote:
> On 11.05.23 11:45, Krzysztof Kozlowski wrote:
>> On 10/05/2023 15:50, Javier Carrasco wrote:
>>> The virtual-touchscreen object defines an area within the touchscreen
>>> where touch events are reported and their coordinates get converted to
>>> the virtual origin. This object avoids getting events from areas that
>>> are physically hidden by overlay frames.
>>>
>>> For touchscreens where overlay buttons on the touchscreen surface are
>>> provided, the virtual-buttons object contains a node for every button
>>> and the key event that should be reported when pressed.
>>
>> Hm, I don't understand - are these separate physical buttons? If so, why
>> would they be part of touchscreen? Where do the wires go?
> Those buttons are actually printed on some overlays which are mounted on
> top of the touchscreen and  they are used to provide a predefined
> functionality to that touchscreen region. Any touchscreen with such a
> physical overlay with buttons printed on them or clipped touchscreen
> areas might use this functionality.
> 
> These buttons are actually physical i.e. printed and with a given
> functionality, but still part of the touchscreen as the physical device
> is not aware of them. Therefore they only make sense in the touchscreen
> context.

So basically you still have the same touchscreen under the buttons and
these are not separate devices. Whether someone put a sticker on
touchscreen, does not really change hardware behavior and it's up to
system to handle this. What you are trying to do here is to create
virtual buttons through Devicetree and DT is not for that.

Best regards,
Krzysztof

