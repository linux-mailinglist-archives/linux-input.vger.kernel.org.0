Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F3232F427
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 20:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhCETmW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 14:42:22 -0500
Received: from mail.micronovasrl.com ([212.103.203.10]:51650 "EHLO
        mail.micronovasrl.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbhCETmC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 14:42:02 -0500
Received: from mail.micronovasrl.com (mail.micronovasrl.com [127.0.0.1])
        by mail.micronovasrl.com (Postfix) with ESMTP id 01F36B04A0C
        for <linux-input@vger.kernel.org>; Fri,  5 Mar 2021 20:34:38 +0100 (CET)
Authentication-Results: mail.micronovasrl.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)" header.d=micronovasrl.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=micronovasrl.com;
         h=content-transfer-encoding:content-language:content-type
        :content-type:in-reply-to:mime-version:user-agent:date:date
        :message-id:from:from:references:to:subject:subject; s=dkim; t=
        1614972877; x=1615836878; bh=40qqWWYiV8u0uDD13PgfVBrPGwJ3ra6RP9t
        mBK4Ri4k=; b=VFw1fJDe5Mfa5fPKcAjcKog0EkpuD/fOppubbcG1pB/GYeXIBlf
        hIuLLxe/z7hIOmT0EjLmjumxw8/ucNkYHoR1lz95wjVxTcAtTv3FzJ/ci8WFZzWf
        SC7x6JYnBen8JP2M4ZA3KI5rVoGCJ022Q8D7VDiCPHq+4p06O6j3gFoA=
X-Virus-Scanned: Debian amavisd-new at mail.micronovasrl.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=4.5
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, LOTS_OF_MONEY=0.001,
        NICE_REPLY_A=-0.001] autolearn=unavailable autolearn_force=no
Received: from mail.micronovasrl.com ([127.0.0.1])
        by mail.micronovasrl.com (mail.micronovasrl.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 1GC-uYWA7Xms for <linux-input@vger.kernel.org>;
        Fri,  5 Mar 2021 20:34:37 +0100 (CET)
Received: from [192.168.50.85] (146-241-168-111.dyn.eolo.it [146.241.168.111])
        by mail.micronovasrl.com (Postfix) with ESMTPSA id BD1F8B04814;
        Fri,  5 Mar 2021 20:34:36 +0100 (CET)
Subject: Re: [PATCH 2/3] dt-bindings: touchscreen: Add HY46XX bindings
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20210305163834.70924-1-giulio.benetti@benettiengineering.com>
 <20210305163834.70924-3-giulio.benetti@benettiengineering.com>
From:   Giulio Benetti <giulio.benetti@micronovasrl.com>
Message-ID: <a3e916f7-9c27-3ff9-d8df-4c145125fa09@micronovasrl.com>
Date:   Fri, 5 Mar 2021 20:34:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305163834.70924-3-giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: it
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding +CC Dmitry

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ¤ 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

Il 05/03/2021 17:38, Giulio Benetti ha scritto:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   .../input/touchscreen/hycon,hy46xx.yaml       | 130 ++++++++++++++++++
>   MAINTAINERS                                   |   6 +
>   2 files changed, 136 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> new file mode 100644
> index 000000000000..cddd5e5bae92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hycon-hy46xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: hyconon HY46XX series touchscreen controller Bindings
> +
> +description: |
> +             There are 6 variants of the chip for various touch panel sizes and coverl len material
> +              Glass: 0.3mm--4.0mm
> +              PET/PMMA: 0.2mm--2.0mm
> +               HY4613(B)-N048  < 6"
> +               HY4614(B)-N068  7" .. 10.1"
> +               HY4621-NS32  < 5"
> +               HY4623-NS48  5.1" .. 7"
> +              Glass: 0.3mm--8.0mm
> +              PET/PMMA: 0.2mm--4.0mm
> +               HY4633(B)-N048  < 6"
> +               HY4635(B)-N048  < 7" .. 10.1"
> +
> +maintainers:
> +  - Giulio Benetti <giulio.benetti@micronovasrl.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hycon,hycon-hy4613
> +      - hycon,hycon-hy4614
> +      - hycon,hycon-hy4621
> +      - hycon,hycon-hy4623
> +      - hycon,hycon-hy4633
> +      - hycon,hycon-hy4635
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vcc-supply: true
> +
> +  threshold:
> +    description: Allows setting the sensitivity in the range from 0 to 255.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +
> +  proximity-sensor-switch:
> +    description: Allows enabling or disabling the Proximity Sensor.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1
> +
> +  glove-enable:
> +    description: Allows enabling or disabling glove setting.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1
> +
> +  report-speed:
> +    description: Allows setting the report speed(i.e 0x64 => 100Hz).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +
> +  power-noise-enable:
> +    description: Allows enabling or disabling power noise filter.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1
> +
> +  filter-data:
> +    description: Allows setting the filtering data before reporting touch
> +                 in the range from 0 to 5.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 5
> +
> +  gain:
> +    description: Allows setting the sensitivity distance in the range from 0 to 5.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 5
> +
> +  edge-offset:
> +    description: Allows setting the edge compensation in the range from 0 to 16.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 16
> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-fuzz-x: true
> +  touchscreen-fuzz-y: true
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true
> +  interrupt-controller: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      hycon-hy4633@1c {
> +        compatible = "hycon,hy4633";
> +        reg = <0x1c>;
> +        interrupt-parent = <&gpio2>;
> +        interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
> +      };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d92f85ca831d..3f83daf6b2bf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8245,6 +8245,12 @@ S:	Maintained
>   F:	mm/hwpoison-inject.c
>   F:	mm/memory-failure.c
>   
> +HYCON HY46XX TOUCHSCREEN SUPPORT
> +M:	Giulio Benetti <giulio.benetti@micronovasrl.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> +
>   HYGON PROCESSOR SUPPORT
>   M:	Pu Wen <puwen@hygon.cn>
>   L:	linux-kernel@vger.kernel.org
> 
