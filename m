Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB42F730013
	for <lists+linux-input@lfdr.de>; Wed, 14 Jun 2023 15:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245009AbjFNNaN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jun 2023 09:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245002AbjFNNaM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jun 2023 09:30:12 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0C11FDC
        for <linux-input@vger.kernel.org>; Wed, 14 Jun 2023 06:30:09 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9827109c6e9so81336466b.3
        for <linux-input@vger.kernel.org>; Wed, 14 Jun 2023 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686749408; x=1689341408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FANL57ecbIxqC2s7WVdfFkY/wb9kISO9tnMy6zPKsiU=;
        b=txhaf/go51p1KpK+q8iErRvGq64ClFPXTsTwzV/xtf4DM3J/d5VanUzyzEoAhZIxeL
         BLcZ1uzi2tf5aXjBBEfezBYP70SNdDmOfeCMxaBmLcu6Oga7uNYqrOiZLiXuQu4/IH0g
         ubyrjSv5YxAPkZ+4LzAsdv4zqgWB6Mcoi5rTDRsF0VaZ9qSmZoQBC8mAXvs/PW5orUAz
         Wqafo4wCZxiQ8iIO/GCE3UlfhzmDoli6/AHnncISYWtyJxmBbg3JfInTBj+n8vOTs07Y
         f6yzWrgXw1qKSx4BU9m4B1M7E9OpzgRZZXZbH7NBGbsGUlbn5VlLnkmUqfS99+NN8WOt
         26BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686749408; x=1689341408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FANL57ecbIxqC2s7WVdfFkY/wb9kISO9tnMy6zPKsiU=;
        b=jIcJa5jcu4HEboFlPxBM1qU+XUeBa/noqySiwNq3EZiNA/eg8ZaLPqjlCD86pi8ic6
         ZMR7oLvP7eMZieuhDXDEELTSzLkFcZDNJYMuL6KKOQ+YDSqTJLRi0WFp0GDFRvrcn9ky
         6I/10iJXTi+2jbAiD88u7PM7DMoqLtALj3zgzZNO1egO1SLYl0njO7mQRXK/ENrwTCNZ
         fLzA0lb2cFn4fmerytDL2MmzBzNWa9CCwb9KG+juSSSCZV4VtP+H5R4SmPuCMPLS2zYS
         5K3m+QtptvZc3lk611j1iR9CpHvw/4EjKKSqrV3W+HSB8qm0DRZ8N18u6oE54Gt77l0z
         tkhQ==
X-Gm-Message-State: AC+VfDzI7WEsi4bq57oyvyADpGVItKjf3M8QWQ60ljAV0GufxfVTKBpa
        c/HwK3EKfDee3qddz73euq7NpQ==
X-Google-Smtp-Source: ACHHUZ6iLbCBVSbhZKUrRJIYPwu+LuxmhaU9ojfe0LqSVK+C4pp2Gte8t2lMU7Bb5ACI02/YTHkJuQ==
X-Received: by 2002:a17:907:728d:b0:96f:afe9:25c4 with SMTP id dt13-20020a170907728d00b0096fafe925c4mr14390331ejc.50.1686749408420;
        Wed, 14 Jun 2023 06:30:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lv16-20020a170906bc9000b00965a52d2bf6sm8013335ejb.88.2023.06.14.06.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 06:30:07 -0700 (PDT)
Message-ID: <45f91d55-7a98-b300-f81c-30f9009519b0@linaro.org>
Date:   Wed, 14 Jun 2023 15:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 05/10] dt-bindings: power: reset: Add bindings for
 twl6030-power
Content-Language: en-US
To:     Mithil <bavishimithil@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>
Cc:     "contact@paulk.fr" <contact@paulk.fr>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "sre@kernel.org" <sre@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>
References: <CAGzNGR=BkOMtw2PhudUs_b4ffk3B+x==9dtWuA-kcqnePaHVYA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGzNGR=BkOMtw2PhudUs_b4ffk3B+x==9dtWuA-kcqnePaHVYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 14/06/2023 11:13, Mithil wrote:
> Subject: Re: [PATCH 05/10] dt-bindings: power: reset: Add bindings for
> twl6030-power
> 
> On Tue, Aug 23, 2022 at 12:54 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Sat, Aug 20, 2022 at 12:46:55PM +0530, Mithil Bavishi wrote:
>>> Adds documentation for the twl6030 power driver.
>>>
>>> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
>>> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
>>> ---
>>>  .../bindings/power/reset/twl6030-power.txt    | 31 +++++++++++++++++++
>>
>> New bindings must be DT schema format.
>>
>>>  1 file changed, 31 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/power/reset/twl6030-power.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/power/reset/twl6030-power.txt b/Documentation/devicetree/bindings/power/reset/twl6030-power.txt
>>> new file mode 100644
>>> index 000000000..946bb3d9f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/power/reset/twl6030-power.txt
>>> @@ -0,0 +1,31 @@
>>> +Texas Instruments TWL family (twl6030) reset and power management module
>>> +
>>> +For now, the binding only supports the complete shutdown of the system after
>>> +poweroff.
>>> +
>>> +Required properties:
>>> +- compatible : must be
>>> +       "ti,twl6030-power"
>>> +
>>> +Optional properties:
>>> +
>>> +- ti,system-power-controller: This indicates that TWL6030 is the
>>
>> We have a generic property for this.
>>
> 
> What is property is that? And how would it get implemented here?

Easy to guess...

git grep system-power-controller



> 
>>> +  power supply master of the system. With this flag, the chip will
>>> +  initiate an ACTIVE-to-OFF or SLEEP-to-OFF transition when the
>>> +  system poweroffs.
>>> +
>>> +Example:
>>> +&i2c1 {
>>> +       clock-frequency = <2600000>;
>>> +
>>> +       twl: twl@48 {
>>> +               reg = <0x48>;
>>> +               interrupts = <7>; /* SYS_NIRQ cascaded to intc */
>>> +               interrupt-parent = <&intc>;
>>> +
>>> +               twl_power: power {
>>> +                       compatible = "ti,twl6030-power";
>>> +                       ti,system-power-controller;
>>
>> Why do you need a child node here? There aren't any resources for the
>> sub-block.
>>
> 
> Just an example and how it is used on a device as well, is it fine if
> just the block is as-is?

The question is not about example. Question was why do you need child
node at all. Children without resources are usually useless.

Best regards,
Krzysztof

