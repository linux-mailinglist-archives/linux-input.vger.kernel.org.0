Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4426867FE94
	for <lists+linux-input@lfdr.de>; Sun, 29 Jan 2023 12:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjA2LdN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Jan 2023 06:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjA2LdM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Jan 2023 06:33:12 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5131E9F4
        for <linux-input@vger.kernel.org>; Sun, 29 Jan 2023 03:33:10 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id t18so8718030wro.1
        for <linux-input@vger.kernel.org>; Sun, 29 Jan 2023 03:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICxEAz2lTPvNArr1Of6NmwuUlJJFVR9Q6sHPnf6bJqQ=;
        b=oTNmVLchTqTuyj8wtBqqQ23usioQjMxx6C7SqLtjlvInJbo0I3OO6HU+NnLjAuqbSG
         V8abxoFjqujql7Sndgme6MVspyU2xP8GXRFGmKd66xqtL3TYEUcWnRkRjfPfgprbXzyv
         WaRI7DMbTy1CffpAR60MbvvJz/IdU5HNR5li22J8hybjxHaY725WI+A2L7Jod/3n74bh
         s36CQBaEHBtnoHUl7UYPBmv0OR6+OLudB6YF3ZrP4dLLCUt9UDUh2AGTY1IDVYAPH3Ca
         j/rUAPh1wYAIKaRItMRxINXuVowRCBJmhLgbgQA5eyd2AM+jKPEwkc/VMJltRe1mChbj
         drOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICxEAz2lTPvNArr1Of6NmwuUlJJFVR9Q6sHPnf6bJqQ=;
        b=7l1MHaXYutkJa6vgwcoLNe2i2jLWJ87j83wCfaiRCpE581MUMpFFTAEA37YlaeGjhY
         +bSZISrhMieEycAc/r3cNsND0oL0BsUDtUUTSQVrljl/39f5OK0lQ7RXqle0/ES/MV6l
         Jycl0GkQ0YOqpcweHluojAEg8fH/Df4qTYAnZd5f/XcxK5ZOxHumBVefukx5Ay9V3ojG
         r8VsoWH0lJ34k/bNBEzn6PkNqRcTh5rpRoRCbpZHqLL/lN0pZYB2pqTZ31AXWQ8JbizW
         hFCmJLjmlVXvP6iP3mKmY6FfjWbZ+BayNh4ec+Fnl6iZ8IpcxEk5NBHdjZBriZ4FhB/R
         jdpg==
X-Gm-Message-State: AFqh2koujSyzLOOYknWsDUMU42m7FPNlupvyaW1qwmLnK/WuhwJmP2BW
        m6HFqUwlrWG5w1cEzxbyBV+IVA==
X-Google-Smtp-Source: AMrXdXu+96NQRYpy8juaEVrWzdhFnO3M/UrQmzfQ0iBrX/GCzOtqSJ5G+vUE0p6nRVOR9oE+y8XVpg==
X-Received: by 2002:a5d:52ca:0:b0:2be:579b:1668 with SMTP id r10-20020a5d52ca000000b002be579b1668mr29419581wrv.1.1674991988734;
        Sun, 29 Jan 2023 03:33:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f12-20020adfdb4c000000b002bfb1de74absm8953897wrj.114.2023.01.29.03.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 03:33:08 -0800 (PST)
Message-ID: <e4f11bda-32c1-fa9d-39d7-402e55ff1d22@linaro.org>
Date:   Sun, 29 Jan 2023 12:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] dt-bindings: hid: Add CP2112 HID USB to SMBus Bridge
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
References: <20230128202622.12676-1-kaehndan@gmail.com>
 <20230128202622.12676-2-kaehndan@gmail.com>
 <fa320b2c-5cf5-c10a-ba63-17ccb5c992ad@linaro.org>
In-Reply-To: <fa320b2c-5cf5-c10a-ba63-17ccb5c992ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 29/01/2023 12:05, Krzysztof Kozlowski wrote:
> On 28/01/2023 21:26, Danny Kaehn wrote:
>> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
>>
> Thank you for your patch. There is something to discuss/improve.
> 
>> The binding allows describing the chip's gpio and i2c controller in DT
>> using the subnodes named "gpio" and "i2c", respectively. This is
>> intended to be used in configurations where the CP2112 is permanently
>> connected in hardware.
>>
>> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
>> ---
>>  .../bindings/hid/silabs,cp2112.yaml           | 82 +++++++++++++++++++
> 
> There is no "hid" directory, so I think such devices where going to
> different place, didn't they?
> 
>>  1 file changed, 82 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml b/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
>> new file mode 100644
>> index 000000000000..49287927c63f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hid/silabs,cp2112.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: CP2112 HID USB to SMBus/I2C Bridge
>> +
>> +maintainers:
>> +  - Danny Kaehn <kaehndan@gmail.com>
>> +
>> +description:
>> +  This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> s/This is/CP2112 is/
> 
>> +  While USB devices typically aren't described in DeviceTree, doing so with the
>> +  CP2112 allows use of its i2c and gpio controllers with other DT nodes when
>> +  the chip is expected to be found on a USB port.
> 
> Drop these three and replace with description of the hardware.
> 
>> +
>> +properties:
>> +  compatible:
>> +    const: usb10c4,ea90
> 
> So this is an USB device, so I guess they all go to usb?
> 
> Missing blank line.
> 
>> +  reg:
>> +    maxItems: 1
>> +    description: The USB port number on the host controller
> 
> Blank line
> 
>> +  i2c:
>> +    $ref: /schemas/i2c/i2c-controller.yaml#
> 
> This is not specific enough. What controller is there?

OK, assuming this is tightly wired (with cp2112 I2C controller), then
the compatible could be skipped as it is inferred from parent one. Yet
still you need description and unevaluatedProperties.

> 
> Missing unevaluatedProperties: false, anyway.
> 
>> +  gpio:
>> +    $ref: /schemas/gpio/gpio.yaml#
> 
> Same comments.

Description, unevaluatedProperties and constraints on properties (line
names, reserved ranges, ranges).



> 
>> +
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    usb1 {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
> 
> Drop, not related.
> 
>> +
>> +      usb@1 {
>> +        compatible = "usb424,2514";
>> +        reg = <1>;
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        device@1 {	/* CP2112 I2C Bridge */
>> +          compatible = "usb10c4,ea90";
>> +          reg = <1>;
>> +
>> +          cp2112_i2c0: i2c {
> 
> Drop unneeded labels.
> 
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            /* Child I2C Devices can be described as normal here */

Drop also this comment.

Best regards,
Krzysztof

