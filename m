Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4853CC67E
	for <lists+linux-input@lfdr.de>; Sat, 17 Jul 2021 23:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhGQVll (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Jul 2021 17:41:41 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:56400 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbhGQVlk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Jul 2021 17:41:40 -0400
Date:   Sat, 17 Jul 2021 21:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1626557921;
        bh=LCLMKFnO7TvI6Bx3wiF64fZ45WT+b2LT5S9wOpPgDac=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=bxU2nGMqY/sv3aFzrw92jHVnGa1ELjGQJrVmZdMf+cqTN+0zGgfe+jC505pdmZ2ad
         USF53FQgEiSdwIprHGn47f6RhHk1LWFBWfyDJxs60QhJxU44arjjLX6JztSZsgJKpj
         5cS35qRrJ+5Q0Hkr1J/8f1eESw7KW1/Wtno3qlXM=
To:     Rob Herring <robh@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jami.kettunen@somainline.org,
        jo@jsfamily.in, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [RESEND PATCH v2 1/6] dt-bindings: input: add Qualcomm SPMI haptics driver
Message-ID: <25d5bce7-401f-f1d5-207f-784e0780c5e0@connolly.tech>
In-Reply-To: <20210622155837.GA3746854@robh.at.kernel.org>
References: <20210618175041.323495-1-caleb@connolly.tech> <20210618175041.323495-2-caleb@connolly.tech> <20210622155837.GA3746854@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

Thanks a lot for your feedback.

I'm still struggling a little to get my head around schema, would you
mind clarifying a few things?

On 22/06/2021 16:58, Rob Herring wrote:
> On Fri, Jun 18, 2021 at 05:51:03PM +0000, Caleb Connolly wrote:
>> Add bindings for qcom PMIC SPMI haptics driver.
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>>   .../bindings/input/qcom,spmi-haptics.yaml     | 128 ++++++++++++++++++
>>   include/dt-bindings/input/qcom,spmi-haptics.h |  32 +++++
>>   2 files changed, 160 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-h=
aptics.yaml
>>   create mode 100644 include/dt-bindings/input/qcom,spmi-haptics.h
>>
>> diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.y=
aml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>> new file mode 100644
>> index 000000000000..8ef9b4ec3a07
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>> @@ -0,0 +1,128 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright 2020 Unisoc Inc.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies Inc PMI8998 spmi haptics
>> +
>> +maintainers:
>> +  - Caleb Connolly <caleb@connolly.tech>
>> +
>> +description: |
>> +  Qualcomm SPMI haptics is a peripheral on some QTI PMICs. It supports =
linear resonant
>> +  actuators and eccentric rotating mass type haptics commonly found in =
mobile devices.
>> +  It supports multiple sources of wave data such as an internal buffer,=
 direct play
>> +  (from kernel or userspace) as well as an audio output mode.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +        - qcom,pmi8998-haptics
>> +        - qcom,pmi8996-haptics
>> +        - qcom,pmi8941-haptics
>> +      - const: qcom,spmi-haptics
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: short circuit interrupt
>> +      - description: play interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: short
>> +      - const: play
>> +
>> +  qcom,actuator-type:
>> +    description: |
>> +      The type of actuator attached to the hardware.
>> +      Allowed values are,
>> +        0 - HAP_TYPE_LRA
>> +        1 - HAP_TYPE_ERM
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [ 0, 1 ]
>> +    default: 0
>> +
>> +  qcom,wave-shape:
>> +    description: |
>> +      Selects the wave shape to use.
>> +      Allowed values are,
>> +        0 - HAP_WAVE_SINE
>> +        1 - HAP_WAVE_SQUARE
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [ 0, 1 ]
>> +    default: 0
>> +
>> +  qcom,play-mode:
>> +    description: |
>> +      Selects the play mode to use.
>> +      Allowed values are,
>> +        0 - HAP_PLAY_DIRECT
>> +        1 - HAP_PLAY_BUFFER
>> +        2 - HAP_PLAY_AUDIO
>> +        3 - HAP_PLAY_PWM
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [ 0, 1, 2, 3 ]
>> +    default: 2
>> +
>> +  qcom,wave-play-rate-us:
>> +    description: |
>> +      Wave sample durection in microseconds, 1/f where f
>> +      is the resonant frequency of the actuator.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> Don't need a type for standard units.
>
>> +    minimum: 0
>> +    maximum: 20475
>> +
>> +  qcom,brake-pattern:
>> +    minItems: 4
>> +    maxItems: 4
>> +    description: |
>> +      The brake pattern are the strengths of the pattern
>> +      used to brake the haptics. Allowed values are,
>> +        0 - 0V
>> +        1 - Vmax/4
>> +        2 - Vmax/2
>> +        3 - Vmax
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    default: [0x3, 0x3, 0x2, 0x1]
> To express the constraints on all items:
>
> items:
>    enum: [ 0, 1, 2, 3 ]
>
> (items is a schema here rather than a list)

Ah, that's exactly what I was looking for! Should I replace one of the
other properties with this?

Or should I just add it to the list?

>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - qcom,wave-play-rate-us
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/spmi/spmi.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/input/qcom,spmi-haptics.h>
>> +
>> +    pmi8998_lsid1: pmic@3 {
> Drop unused labels.
>
>> +      compatible =3D "qcom,pmi8998", "qcom,spmi-pmic";
> Really, this needs to be converted to schema first so we're not adding
> warnings.

Hmm, is it ok to leave this here? I had a look at converting the spmi-pmic

bindings to schema but it's a bit beyond me in all honestly.

>
>> +      reg =3D <0x3 SPMI_USID>;
>> +      #address-cells =3D <1>;
>> +      #size-cells =3D <0>;
>> +
>> +      pmi8998_haptics: haptics@c000 {
>> +        compatible =3D "qcom,pmi8998-haptics", "qcom,spmi-haptics";
>> +        reg =3D <0xc000>;
>> +
>> +        interrupts =3D <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
>> +                     <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
>> +        interrupt-names =3D "short", "play";
>> +
>> +        qcom,wave-shape =3D <HAP_WAVE_SINE>;
>> +        qcom,play-mode =3D <HAP_PLAY_BUFFER>;
>> +        qcom,brake-pattern =3D <0x3 0x3 0x2 0x1>;
>> +
>> +        status =3D "disabled";
> Don't show status in examples.
>
>> +      };
>> +    };
>> diff --git a/include/dt-bindings/input/qcom,spmi-haptics.h b/include/dt-=
bindings/input/qcom,spmi-haptics.h
>> new file mode 100644
>> index 000000000000..14a7e7d1471e
>> --- /dev/null
>> +++ b/include/dt-bindings/input/qcom,spmi-haptics.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> Dual license please. DT files are used elsewhere.
Will do.
>
>> +/*
>> + * This header provides constants for pmi8998 SPMI haptics options.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_
>> +#define _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_
>> +
>> +// Actuator types
>> +#define HAP_TYPE_LRA=09=090
>> +#define HAP_TYPE_ERM=09=091
>> +
>> +// LRA Wave type
>> +#define HAP_WAVE_SINE=09=090
>> +#define HAP_WAVE_SQUARE=09=091
>> +
>> +// Play modes
>> +#define HAP_PLAY_DIRECT=09=090
>> +#define HAP_PLAY_BUFFER=09=091
>> +#define HAP_PLAY_AUDIO=09=092
>> +#define HAP_PLAY_PWM=09=093
>> +
>> +#define HAP_PLAY_MAX=09=09HAP_PLAY_PWM
>> +
>> +// Auto resonance type
>> +#define HAP_AUTO_RES_NONE=090
>> +#define HAP_AUTO_RES_ZXD=091
>> +#define HAP_AUTO_RES_QWD=092
>> +#define HAP_AUTO_RES_MAX_QWD=093
>> +#define HAP_AUTO_RES_ZXD_EOP=094
>> +
>> +#endif /* _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_ */
>> --
>> 2.31.1
>>
>>
>>
Kind Regards,

Caleb


