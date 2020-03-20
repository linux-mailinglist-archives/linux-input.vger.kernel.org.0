Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA6D718D2B7
	for <lists+linux-input@lfdr.de>; Fri, 20 Mar 2020 16:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgCTPVy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Mar 2020 11:21:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39970 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgCTPVy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Mar 2020 11:21:54 -0400
Received: from [IPv6:2a02:810a:113f:ad1c:d59e:75b0:dca:337a] (unknown [IPv6:2a02:810a:113f:ad1c:d59e:75b0:dca:337a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9A4662975DA;
        Fri, 20 Mar 2020 15:21:51 +0000 (GMT)
Subject: Re: [PATCH] dt-bindings: input: atmel_mxt_ts: convert
 atmel,maxtouch.txt to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com
References: <20200303172533.30602-1-dafna.hirschfeld@collabora.com>
 <20200310211437.GA18992@bogus>
 <f612396e-e5e2-db76-6297-a108b53e4000@collabora.com>
 <CAL_JsqLTMdG-=_pTPsazspEO3LtDth=xm9s8sqzW+AswWttKJA@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <496a1e2d-a595-f6a6-0ce5-559453b15702@collabora.com>
Date:   Fri, 20 Mar 2020 16:21:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLTMdG-=_pTPsazspEO3LtDth=xm9s8sqzW+AswWttKJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 11.03.20 16:48, Rob Herring wrote:
> On Wed, Mar 11, 2020 at 10:23 AM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> Hi,
>> Thanks for the review
>>
>> On 10.03.20 22:14, Rob Herring wrote:
>>> On Tue, Mar 03, 2020 at 07:25:33PM +0200, Dafna Hirschfeld wrote:
>>>> Convert the binding file atmel,maxtouch.txt to yaml format.
>>>> Also change the file name in the MAINTAINERS file.
>>>>
>>>> This was tested and verified on ARM and ARM64 with:
>>>>
>>>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>>>> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>>>>
>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> ---
>>>>    .../bindings/input/atmel,maxtouch.txt         | 41 ------------
>>>>    .../bindings/input/atmel,maxtouch.yaml        | 64 +++++++++++++++++++
>>>>    MAINTAINERS                                   |  2 +-
>>>>    3 files changed, 65 insertions(+), 42 deletions(-)
>>>>    delete mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>>>>    create mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>>>> deleted file mode 100644
>>>> index c88919480d37..000000000000
>>>> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>>>> +++ /dev/null
>>>> @@ -1,41 +0,0 @@
>>>> -Atmel maXTouch touchscreen/touchpad
>>>> -
>>>> -Required properties:
>>>> -- compatible:
>>>> -    atmel,maxtouch
>>>> -
>>>> -    The following compatibles have been used in various products but are
>>>> -    deprecated:
>>>> -    atmel,qt602240_ts
>>>> -    atmel,atmel_mxt_ts
>>>> -    atmel,atmel_mxt_tp
>>>> -    atmel,mXT224
>>>> -
>>>> -- reg: The I2C address of the device
>>>> -
>>>> -- interrupts: The sink for the touchpad's IRQ output
>>>> -    See ../interrupt-controller/interrupts.txt
>>>> -
>>>> -Optional properties for main touchpad device:
>>>> -
>>>> -- linux,gpio-keymap: When enabled, the SPT_GPIOPWN_T19 object sends messages
>>>> -    on GPIO bit changes. An array of up to 8 entries can be provided
>>>> -    indicating the Linux keycode mapped to each bit of the status byte,
>>>> -    starting at the LSB. Linux keycodes are defined in
>>>> -    <dt-bindings/input/input.h>.
>>>> -
>>>> -    Note: the numbering of the GPIOs and the bit they start at varies between
>>>> -    maXTouch devices. You must either refer to the documentation, or
>>>> -    experiment to determine which bit corresponds to which input. Use
>>>> -    KEY_RESERVED for unused padding values.
>>>> -
>>>> -- reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
>>>> -
>>>> -Example:
>>>> -
>>>> -    touch@4b {
>>>> -            compatible = "atmel,maxtouch";
>>>> -            reg = <0x4b>;
>>>> -            interrupt-parent = <&gpio>;
>>>> -            interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
>>>> -    };
>>>> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>>>> new file mode 100644
>>>> index 000000000000..024dc4ded4f3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>>>> @@ -0,0 +1,64 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Atmel maXTouch touchscreen/touchpad
>>>> +
>>>> +maintainers:
>>>> +  - Nick Dyer <nick@shmanahar.org>
>>>> +
>>>> +description: |
>>>> +  Atmel maXTouch touchscreen/touchpad
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: atmel,maxtouch
>>>> +
>>>> +  reg:
>>>> +    description: The I2C address of the device
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    description: The sink for the touchpad's IRQ output
>>>
>>> How many? Needs 'maxItems: 1'>
>>> You can drop the description.
>>>
>>>> +
>>>> +  linux,gpio-keymap:
>>>> +    description:
>>>> +      When enabled, the SPT_GPIOPWN_T19 object sends messages
>>>> +      on GPIO bit changes. An array of up to 8 entries can be provided
>>>> +      indicating the Linux keycode mapped to each bit of the status byte,
>>>> +      starting at the LSB. Linux keycodes are defined in
>>>> +      <dt-bindings/input/input.h>.
>>>> +      Note, the numbering of the GPIOs and the bit they start at varies between
>>>> +      maXTouch devices. You must either refer to the documentation, or
>>>> +      experiment to determine which bit corresponds to which input. Use
>>>> +      KEY_RESERVED for unused padding values.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    maxItems: 8
>>>> +
>>>> +  reset-gpios:
>>>> +    description: GPIO specifier for the touchscreen's reset pin (active low)
>>>> +    maxItems: 1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +
>>>> +additionalProperties: true
>>>
>>> That's the default and we generally want this to be 'false'.
>> but many nodes has more properties not described here so I could not
>> set it to false.
> 
> Like touchscreen-* properties? Then you should reference
> touchscreen.yaml. And add 'unevaluatedProperties: false' here. That
> doesn't yet do anything, but will when the tools support the lastest
> json-schema release.

Hi, no it is other properties, these are the warnings:
arch/arm/boot/dts/s5pv210-goni.dt.yaml: tsp@4a: 'atmel,burst-length', 'atmel,orientation', 'atmel,threshold', 'atmel,x-line', 'atmel,x-size', 'atmel,y-line', 'atmel,y-size', 'vdd-supply' do not match any of the regexes: 'pinctrl-[0-9]+'

arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: touchscreen@4a: 'interrupt-names', 'wakeup-source' do not match any of the regexes: 'pinctrl-[0-9]+'

arch/arm/boot/dts/exynos5800-peach-pi.dt.yaml: trackpad@4b: 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'

Dafna

> 
> Rob
> 
