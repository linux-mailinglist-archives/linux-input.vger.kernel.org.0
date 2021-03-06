Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0008B32FCD5
	for <lists+linux-input@lfdr.de>; Sat,  6 Mar 2021 20:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhCFTnH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Mar 2021 14:43:07 -0500
Received: from mail-pl1-f169.google.com ([209.85.214.169]:45870 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhCFTma (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Mar 2021 14:42:30 -0500
Received: by mail-pl1-f169.google.com with SMTP id u18so3019822plc.12;
        Sat, 06 Mar 2021 11:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4R36E9EdT6ETKf8115BEW/u8iSuuWBguPooeE6zkOa0=;
        b=eKl1o/l/0PgR/id9K0hbQLBV5ZAXWvuvJRixIqyuhc9g1AaWYj3m5NpUK3Eds3LpB6
         1cz4qRYj48MWy8x6/jAbDQTrtygbKY6A4VNyEQq3KVom+zB6yUmQ4SMlZXbkGk++hyc1
         SP6+22VRcFpIDcSXyu1Eq2wgn7HeYAgsj88SmnLN/s9B2MVEUdTOyeD1+1FJeCxG8fV3
         +EYej2JzQZOjicQtjt3FblgIJlyUgnx7sTlJ/99pb/YhUySFq/68kOqKMqRJ5447IWda
         p6Xl1rLw6aP3NSZOywrTTbT4IcnDP9h0NtJLYv2p3MuBoytrdnkHjBzIJRwBeTB+Fs5t
         4vDA==
X-Gm-Message-State: AOAM533Ey4UYQet36VhOLl5/ufxNHdf/hKZrZU1OYeLOzQS1e8dyTH5M
        Y/s/0BFk6WX4RoEEbtKSOw==
X-Google-Smtp-Source: ABdhPJwcv7WeclJXqsectBUh9xkZCoe2AlcgXv4w/qPpL9Fz17Zk8zWUctVTUKHK0sFEBZXf0Pydtw==
X-Received: by 2002:a17:903:3093:b029:e4:7e03:d618 with SMTP id u19-20020a1709033093b02900e47e03d618mr14203055plc.54.1615059750302;
        Sat, 06 Mar 2021 11:42:30 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id e22sm6102693pgk.56.2021.03.06.11.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 11:42:29 -0800 (PST)
Received: (nullmailer pid 1095132 invoked by uid 1000);
        Sat, 06 Mar 2021 19:41:20 -0000
Date:   Sat, 6 Mar 2021 13:41:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Giulio Benetti <giulio.benetti@micronovasrl.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Message-ID: <20210306194120.GA1075725@robh.at.kernel.org>
References: <20210305163834.70924-1-giulio.benetti@benettiengineering.com>
 <20210305163834.70924-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305163834.70924-3-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 05, 2021 at 05:38:33PM +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  .../input/touchscreen/hycon,hy46xx.yaml       | 130 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
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

Needs a vendor prefix here and all the custom properties.

One of the touchscreen properties doesn't already address this?

> +    description: Allows setting the sensitivity in the range from 0 to 255.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +
> +  proximity-sensor-switch:

Why a switch rather than enable or disable?

> +    description: Allows enabling or disabling the Proximity Sensor.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1

Is this a hardware config or something a user would want to change at 
runtime? The latter shouldn't be in DT.

What does not present mean? Unless there is a need for keeping the 
default setting, then this could be boolean instead.

Same questions for the rest of the properties.

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
>  F:	mm/hwpoison-inject.c
>  F:	mm/memory-failure.c
>  
> +HYCON HY46XX TOUCHSCREEN SUPPORT
> +M:	Giulio Benetti <giulio.benetti@micronovasrl.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> +
>  HYGON PROCESSOR SUPPORT
>  M:	Pu Wen <puwen@hygon.cn>
>  L:	linux-kernel@vger.kernel.org
> -- 
> 2.25.1
> 
