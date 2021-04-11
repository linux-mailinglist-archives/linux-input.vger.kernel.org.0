Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2BF35B395
	for <lists+linux-input@lfdr.de>; Sun, 11 Apr 2021 13:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhDKLh0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Apr 2021 07:37:26 -0400
Received: from smtpcmd0641.aruba.it ([62.149.156.41]:52753 "EHLO
        smtpcmd0641.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235366AbhDKLh0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Apr 2021 07:37:26 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id VYOpl4RdCZCSXVYOplNlUT; Sun, 11 Apr 2021 13:37:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618141028; bh=ZVdgFLZgRdxjhQAxHjDTMFTjxTmSu5e+jgsFZLM4Qq8=;
        h=From:Subject:To:Date:MIME-Version:Content-Type;
        b=iyTrffwhOcGTjObQlh4JXNi5zwB8OXztUIMVBvMeYdznH0MFtH5FwbKcvjy4z3o3x
         E3rCYj1Sj+EFs4TpXS2UAVhsFsOTzIP47/npUVjgbph8ryuqvdsoT+Zyk5/3MPRLei
         XptpFcJiPsZaZ+nlT8mSVpwTMb1MPJVgYmIz2HdsRjx6W6IIQYafSviBqBk1fbkOhI
         dF3V+V/gqQ+vSrdX29gYyGPjGHsJty8p/8coLCXMtfnNaDqwLFvBYNBs9Y9Wy6Jfbo
         RUqyJgegZTLdQgLncgCp8UIUsQ2AMCDdsXd1DbrSQQXzd0cj2TJbVKYCJ8mqdEndzb
         wKg1Mf+HOIDfQ==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: touchscreen: Add HY46XX bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <YGxkB6icZSJfx/VB@latitude>
 <20210407174909.1475150-1-giulio.benetti@benettiengineering.com>
 <20210407174909.1475150-3-giulio.benetti@benettiengineering.com>
 <20210408202137.GA1890401@robh.at.kernel.org>
Message-ID: <d7879bea-8b89-1b92-0fe8-9acca6de3258@benettiengineering.com>
Date:   Sun, 11 Apr 2021 13:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408202137.GA1890401@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKXIrBYfk2OxDQfDl8A1x7l5Of6vMMsKwRFjxYmQA8SQuQKd3SR/JwGRjJE7gWdskTq4xEtJgogOLnLuI5VH7jgy8pKmYF+tx3e8rUgDyXN6FiBMdlQj
 s77p/TQ9ZA4Mw/xgIzh2c9sZnkE6kxleRDfuHb1kl3/l3RSfnl6+wjwh18YxlnRxfiNzuXA8KWRXKUTXLkxDAjGZ+gPN3fnp/idRYqJ0bB6uJWwjOPlyjlfk
 Le2omJ+m/hOUz8KYqHhlW1rXsgBfvO1ZFmot23xwmen78J/c3StW4gVS4cViJ7Q9PC0CuZkpxsFUVfBYmGGerx6jdv8Uu5J1hz/DQnjZJKsPiqfCZWIh33Gq
 d6SDG71oOuNdl0TOn9PFtaK6u+m9EFSdk2DuNEc5Vk8B4eh6dR4JnZsAyiqBpWfHR3Ti5va1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/8/21 10:21 PM, Rob Herring wrote:
> On Wed, Apr 07, 2021 at 07:49:08PM +0200, Giulio Benetti wrote:
>> This adds device tree bindings for the Hycon HY46XX touchscreen series.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> As suggested by Rob Herring:
>> * fixed $id: address
>> * added "hycon," in front of every custom property
>> * changed all possible property to boolean type
>> * removed proximity-sensor-switch property since it's not handled in driver
>> V2->V3:
>> As suggested by Jonathan Neuschäfer:
>> * fixed some typo
>> * fixed description indentation
>> * improved boolean properties descriptions
>> * improved hycon,report-speed description
>> V3->V4:
>> * fixed binding compatible string in example as suggested by Jonathan Neuschäfer
>> ---
>>   .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>> new file mode 100644
>> index 000000000000..8860613a12ad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>> @@ -0,0 +1,120 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/touchscreen/hycon,hy46xx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Hycon HY46XX series touchscreen controller bindings
>> +
>> +description: |
>> +  There are 6 variants of the chip for various touch panel sizes and cover lens material
>> +   Glass: 0.3mm--4.0mm
>> +    PET/PMMA: 0.2mm--2.0mm
>> +    HY4613(B)-N048  < 6"
>> +    HY4614(B)-N068  7" .. 10.1"
>> +    HY4621-NS32  < 5"
>> +    HY4623-NS48  5.1" .. 7"
>> +   Glass: 0.3mm--8.0mm
>> +    PET/PMMA: 0.2mm--4.0mm
>> +    HY4633(B)-N048  < 6"
>> +    HY4635(B)-N048  < 7" .. 10.1"
>> +
>> +maintainers:
>> +  - Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +
>> +allOf:
>> +  - $ref: touchscreen.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - hycon,hycon-hy4613
>> +      - hycon,hycon-hy4614
>> +      - hycon,hycon-hy4621
>> +      - hycon,hycon-hy4623
>> +      - hycon,hycon-hy4633
>> +      - hycon,hycon-hy4635
> 
> As suggested earlier, drop the 2nd 'hycon'.

Ok

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  vcc-supply: true
>> +
>> +  hycon,threshold:
>> +    description: Allows setting the sensitivity in the range from 0 to 255.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 255
>> +
>> +  hycon,glove-enable:
>> +    type: boolean
>> +    description: Allows enabling glove setting.
>> +
>> +  hycon,report-speed:
>> +    description: Allows setting the report speed in Hertz.
> 
> If in Hertz, use standard unit suffix.
> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> And then you can drop this.

Ok

>> +    minimum: 0
> 
> 0Hz doesn't seem to useful?

You're right, I've also checked and with 0Hz controller correctly does 
nothing. I've also tried seeting 1Hz and it actually works, but at 1Hz, 
so I keep 1Hz as minimum.

>> +    maximum: 255
>> +
>> +  hycon,power-noise-enable:
> 
> hycon,noise-filter-enable
> 
> No one wants to enable power noise. :)

:-) Yeah

> 
>> +    type: boolean
>> +    description: Allows enabling power noise filter.
>> +
>> +  hycon,filter-data:
>> +    description: Allows setting the filtering data before reporting touch
>> +                 in the range from 0 to 5.
> 
> This is averaging samples? Sounds like something common perhaps.

maybe you mean touchscreen-average-samples property, but this is not the 
case.In datasheet they state "Before report coordinate throw away the 
data number, setting range：0--5" and I've tried sweep-setting it 1-5 
and what I get with filter-data set to 5 is that touchscreen answers 
after like 0.5 seconds but keep reporting as fast as set report-speed, 
so to me it throws away the first samples because it considers them 
"bad" samples when one is first touching the panel. So I'm going to 
modify the description as:
description: Allows setting how many samples throw before reporting
               touch in the range from 0 to 5.

>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 5
>> +
>> +  hycon,gain:
>> +    description: Allows setting the sensitivity distance in the range from 0 to 5.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 5
>> +
>> +  hycon,edge-offset:
>> +    description: Allows setting the edge compensation in the range from 0 to 16.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 16
>> +
>> +  touchscreen-size-x: true
>> +  touchscreen-size-y: true
>> +  touchscreen-fuzz-x: true
>> +  touchscreen-fuzz-y: true
>> +  touchscreen-inverted-x: true
>> +  touchscreen-inverted-y: true
>> +  touchscreen-swapped-x-y: true
>> +  interrupt-controller: true
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      hycon-hy4633@1c {
> 
> touchscreen@1c

Ok

>> +        compatible = "hycon,hycon-hy4633";
>> +        reg = <0x1c>;
>> +        interrupt-parent = <&gpio2>;
>> +        interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
>> +        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
>> +      };
>> +    };
>> +
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c80ad735b384..d022ff09e609 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8243,6 +8243,12 @@ S:	Maintained
>>   F:	mm/hwpoison-inject.c
>>   F:	mm/memory-failure.c
>>   
>> +HYCON HY46XX TOUCHSCREEN SUPPORT
>> +M:	Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +L:	linux-input@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>> +
>>   HYGON PROCESSOR SUPPORT
>>   M:	Pu Wen <puwen@hygon.cn>
>>   L:	linux-kernel@vger.kernel.org
>> -- 
>> 2.25.1
>>

Thank you

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
