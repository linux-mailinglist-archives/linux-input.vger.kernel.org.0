Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AD935C926
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 16:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242501AbhDLOtf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 10:49:35 -0400
Received: from smtpcmd02102.aruba.it ([62.149.158.102]:57698 "EHLO
        smtpcmd15177.aruba.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S242491AbhDLOtf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 10:49:35 -0400
Received: from [192.168.50.171] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPA
        id VxsGlQS8HbsviVxsHlMzLC; Mon, 12 Apr 2021 16:49:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618238955; bh=DtvqunJIMLnObK3CWHs19N+ERCpLO1vA8LEbcYRlz3A=;
        h=Content-Type:From:Mime-Version:Subject:Date:To;
        b=BcTdvNP4CfJdFB27hSWzzkIPjQD2DiIaVDUNXR2Q7+iFso4wIuWaNCdDScmmzxxxm
         JSTUpMQkERzaUDuH+TWkN4m16Kcqtiew67ixIwZ1/CdLp8z6vLVswImZmFUmasmO1F
         wcHcKr6LzPsll71L5ARwOevyOMhK5awF2GOw1UOqYkB9/3OSG7ZgCtsVoo7ySod/+C
         OWdM8YtQhfOHNTHbRlx/hm11YlCMsp6r5Fa9fDKUZvAVJujVlrkzPk6uxsNAlCLTf2
         PAwvcD7W95ibNtHDZ9qyucQK0RgqRx4AIBnmrn02SFCtSUQl2szpm/q1MfxvJUKy09
         NPcYT3PSLAYrQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Mon, 12 Apr 2021 16:49:11 +0200
Message-Id: <20DE5539-FC22-4951-9DEE-33B4E2B42B48@benettiengineering.com>
References: <20210412144624.GA3868831@robh.at.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210412144624.GA3868831@robh.at.kernel.org>
To:     Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (18D70)
X-CMAE-Envelope: MS4wfGuG7kxRL3gxiyx/f8392YS2ehlMPJ3A1rOY0Qw0p1gdU4hPaAeFKkQ6HXN2g+k/5Zu3ypdDhXQ7jXak7sHH/UmJpwBuOfHTYIYPNiNn0ccL6hJhfzk0
 RHWCpHwG+BDh//1v0ZocbI/P6tqy4bq+EfTMOakst4fnLV3njCz/hpNcLVi2gFX9NeFOBWCZsUw7yxiRq20HVN0NYAloxK4t1BNqx677Ms9OcYjbAsFEOhLO
 6z62nA21TguHFGum1qdd/HoxHn8bTLokEOJHmPsKCN7ANI6zAUHKbFL3cY0PCDekw8qFEz3VQUO6k7waaEi3IwJEvJZbwKpyj1r7bX4kJparc282CEowUnbB
 iFP05l5YY0LESqqLh0Hp+had2Ht+MsLieQu0YYKPDa3GJKhS0d5i6cIf7t3fy/EK+9/1FH+L
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


> Il giorno 12 apr 2021, alle ore 16:46, Rob Herring <robh@kernel.org> ha sc=
ritto:
>=20
> =EF=BB=BFOn Sun, Apr 11, 2021 at 01:48:03PM +0200, Giulio Benetti wrote:
>> This adds device tree bindings for the Hycon HY46XX touchscreen series.
>>=20
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> As suggested by Rob Herring:
>> * fixed $id: address
>> * added "hycon," in front of every custom property
>> * changed all possible property to boolean type
>> * removed proximity-sensor-switch property since it's not handled in driv=
er
>> V2->V3:
>> As suggested by Jonathan Neusch=C3=A4fer:
>> * fixed some typo
>> * fixed description indentation
>> * improved boolean properties descriptions
>> * improved hycon,report-speed description
>> V3->V4:
>> * fixed binding compatible string in example as suggested by Jonathan Neu=
sch=C3=A4fer
>> V4->V5:
>> As suggested by Rob Herring:
>> * drop hycon- prefix from compatible
>> * use Hertz unit suffix for hycon,report-speed instead of u32
>=20
> hycon,report-speed-hz

Thank you, I=E2=80=99m going to send V6 series.

Giulio

>=20
>> * set hycon,report-speed minimum to 1Hz, 0Hz make controller to do nothin=
g
>> * change hycon,power-noise-enable property name to hycon,noise-filter-ena=
ble
>> * improve hycon,filter-data property description
>> * use generic touchscreen node name in example
>> ---
>> .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++++
>> MAINTAINERS                                   |   6 +
>> 2 files changed, 125 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hy=
con,hy46xx.yaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy=
46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx=
.yaml
>> new file mode 100644
>> index 000000000000..ae792e3716ff
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.ya=
ml
>> @@ -0,0 +1,119 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/touchscreen/hycon,hy46xx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Hycon HY46XX series touchscreen controller bindings
>> +
>> +description: |
>> +  There are 6 variants of the chip for various touch panel sizes and cov=
er lens material
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
>> +      - hycon,hy4613
>> +      - hycon,hy4614
>> +      - hycon,hy4621
>> +      - hycon,hy4623
>> +      - hycon,hy4633
>> +      - hycon,hy4635
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
>> +    description: Allows setting the sensitivity in the range from 0 to 2=
55.
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
>> +    minimum: 1
>> +    maximum: 255
>> +
>> +  hycon,noise-filter-enable:
>> +    type: boolean
>> +    description: Allows enabling power noise filter.
>> +
>> +  hycon,filter-data:
>> +    description: Allows setting how many samples throw before reporting t=
ouch
>> +                 in the range from 0 to 5.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 5
>> +
>> +  hycon,gain:
>> +    description: Allows setting the sensitivity distance in the range fr=
om 0 to 5.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 5
>> +
>> +  hycon,edge-offset:
>> +    description: Allows setting the edge compensation in the range from 0=
 to 16.
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
>> +      #address-cells =3D <1>;
>> +      #size-cells =3D <0>;
>> +      touchscreen@1c {
>> +        compatible =3D "hycon,hy4633";
>> +        reg =3D <0x1c>;
>> +        interrupt-parent =3D <&gpio2>;
>> +        interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;
>> +        reset-gpios =3D <&gpio2 6 GPIO_ACTIVE_LOW>;
>> +      };
>> +    };
>> +
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7fdc513392f4..18a50942c019 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8250,6 +8250,12 @@ S:    Maintained
>> F:    mm/hwpoison-inject.c
>> F:    mm/memory-failure.c
>>=20
>> +HYCON HY46XX TOUCHSCREEN SUPPORT
>> +M:    Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +L:    linux-input@vger.kernel.org
>> +S:    Maintained
>> +F:    Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.y=
aml
>> +
>> HYGON PROCESSOR SUPPORT
>> M:    Pu Wen <puwen@hygon.cn>
>> L:    linux-kernel@vger.kernel.org
>> --=20
>> 2.25.1
>>=20

