Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CB33573BB
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 19:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355002AbhDGR5Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 13:57:24 -0400
Received: from smtpcmd03117.aruba.it ([62.149.158.117]:37513 "EHLO
        smtpcmd03117.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354998AbhDGR5X (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 13:57:23 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id UCQLlVtqOzPKKUCQMlNmK0; Wed, 07 Apr 2021 19:57:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617818229; bh=nwmThOXSC10gnNNTfexSz5aVrAbukhDIsh+yemnFx7E=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=V3HWJ8/CvuvzUnN7M81ZE5qAz4eheOzL3Qgq/wZuOQxxh+f0tzhntH3+x9LESLFD9
         wsrPDGNaGnWub4N8ZzFPNi4V0kOpn5faADY8ZMz5BK93VK2XBc10CnFAtvvpJHM4NW
         MRDV3NJqw32x48JXWvhi1qjk3YvDHIlWuKwX+UKYpOAYROVBk7JAZrtUc0Ko2d+K+s
         nVyiAfw6gEN+L+xOJt2C/0A6sGKTx140a8r+ldJ4aR6GcDaILcfoLvPyKWNziKTUVF
         X3TeGXxDPia9S1+los8THvBopnRxnt0tp5EocOfXaEO0G7LzXW1o0xIZiJ1Q5gaG5g
         cA/kryRw4WIKg==
Subject: Re: [PATCH v3 2/3] dt-bindings: touchscreen: Add HY46XX bindings
To:     Rob Herring <robh@kernel.org>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.ne@posteo.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <YGbc7Qbu6s659Mx4@latitude>
 <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
 <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
 <1617715445.154812.1674495.nullmailer@robh.at.kernel.org>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <937f75d4-6c2e-d476-f272-39f8ed2826f2@benettiengineering.com>
Date:   Wed, 7 Apr 2021 19:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617715445.154812.1674495.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKCqP0Nfxq3fxYo/ESnA/0fFCPkq2SZ5IupcmLZF0htN4+M5MaXJGTdOjdYX3NSWWJSQYSWQBBA9zJ1V2krvxSPXeaV1URaFUPrs+53KcEhGJbV7Utmj
 aCI2O0mLTTo6ii8gquYN4xBkZ8Gi6siYnjmH6vLiD+ST6Nnpm7ACT1vYdnyvqaRW29jkOHOjQ4F3Q7bIVxKXO4NCDHzhoQM5K0yk7OcN2BLgeiO4ZVhHIg2e
 NJNijppq4O+ommYFTSIq5okW3watBMle5P0Ip/UtBJeScn7AALqBVE5V/A/9PP+An68/9qH7hFOixXYDbOEY3OH2II0IwNETacdBF1t2apmnfb5S3z0HVybb
 qOIvSPi6CJ5eCpiqwFtzAMkN0iZNViK7R3ZR0pf1CyCBUw81IuNyhlWqz+5sUCqBrkBJ+0EMoXMPqVNqQQDR5S3QBDmLvQ==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Rob, All,

On 4/6/21 3:24 PM, Rob Herring wrote:
> On Fri, 02 Apr 2021 18:16:26 +0200, Giulio Benetti wrote:
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
>> ---
>>   .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.example.dt.yaml:0:0: /example-0/i2c/hycon-hy4633@1c: failed to match any schema with compatible: ['hycon,hy4633']
> 
> See https://patchwork.ozlabs.org/patch/1461797
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:

I've just send corrected patches.

Anyway I'd like to understand how to make dt_binding_check works correctly.

I've installed yamllint and 'make dt_binding_check' works but it still 
doesn't show that error up on compatible string.

yamllint I have is version 1.20.0

> pip3 install dtschema --upgrade

I've already tried with that too and dtschema version is:
1.3.8

I've read that dtc must be compiled with YAML output enabled and it 
seems to be so, since when I issue 'make dt_binding_check' from my file:
hycon,hy46xx.yaml(with compatible string wrong "hycon,hy4633")

these files are generated:
hycon,hy46xx.example.dts
```

/dts-v1/;
/plugin/; // silence any missing phandle references


/{
     compatible = "foo";
     model = "foo";
     interrupt-parent = <&foo>;
     #address-cells = <1>;
     #size-cells = <1>;



     example-0 {
         #address-cells = <1>;
         #size-cells = <1>;

         #include <dt-bindings/gpio/gpio.h>
         #include <dt-bindings/interrupt-controller/arm-gic.h>
         i2c {
           #address-cells = <1>;
           #size-cells = <0>;
           hycon-hy4633@1c {
             compatible = "hycon,hy4633";
             reg = <0x1c>;
             interrupt-parent = <&gpio2>;
             interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
             reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
           };
         };

     };
};

```

AND

hycon,hy46xx.example.dt.yaml
```
---
- compatible: ["foo"]
   model: ["foo"]
   interrupt-parent: [[!phandle 0xffffffff]]
   '#address-cells': [[0x1]]
   '#size-cells': [[0x1]]
   example-0:
     '#address-cells': [[0x1]]
     '#size-cells': [[0x1]]
     i2c:
       '#address-cells': [[0x1]]
       '#size-cells': [[0x0]]
       hycon-hy4633@1c:
         compatible: ["hycon,hy4633"]
         reg: [[0x1c]]
         interrupt-parent: [[!phandle 0xffffffff]]
         interrupts: [[0x5, 0x2]]
         reset-gpios: [[!phandle 0xffffffff, 0x6, 0x1]]
   __fixups__:
     foo: ["/:interrupt-parent:0"]
     gpio2: ["/example-0/i2c/hycon-hy4633@1c:interrupt-parent:0", 
"/example-0/i2c/hycon-hy4633@1c:reset-gpios:0"]
...
```

So I can't reproduce the problem, can you point me some documentation 
that I didn't see before?

Thank in advance
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
