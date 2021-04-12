Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3C935C918
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 16:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239506AbhDLOqo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 10:46:44 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:45654 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237806AbhDLOqo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 10:46:44 -0400
Received: by mail-oi1-f179.google.com with SMTP id d12so13620150oiw.12;
        Mon, 12 Apr 2021 07:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BBPuXYXDFAebMpO7hX78kRtpKa7xPH9e7ESb75jHFpU=;
        b=g5bjnB5Zk7Hwb1SzwSzQVPXxqQYtLN6fhfI1wTE1WYMSXIXFLUNb9hcttMAFB5tHfm
         ALcGMB8JsKRyrSFzVJhHU7YNmV3Zgo3iutk5NYfiLvSgbzWBo9CityBSqSx6ghvgYr3L
         qr7pUwDoYDxZ3Q54n1fxQcyHpi/UOI2PjrO/UZW2rtWn7gbnFxeARkNg8OdH0XNgk8SL
         3OLNwTzX6dhi8jTjlfHSALpvxhzFBIbDZI+33nab9+blXbgDQV4lI8UhCDcgjn19+lNQ
         MmWDLMmogQ7m/mMNntVpoSBoI64FnK652jLddS+yy5H25YqTgHc5pO8Y3bxMNGHDPNEY
         ajng==
X-Gm-Message-State: AOAM5312VM2uC+osgV3NxPQIAVlbD4+dDQ3WEOPVEE7F//c1p2X3gQN6
        xIuUiIh+aPDK70eS0MMuqA==
X-Google-Smtp-Source: ABdhPJyBHM/xFgKX+zWoqH+Q7DDfFP2U35vqrpxnyrF7eVNWQCgRqR9UptRKGv6Zpyj0RnSC3IAknQ==
X-Received: by 2002:a05:6808:94:: with SMTP id s20mr3914209oic.56.1618238786113;
        Mon, 12 Apr 2021 07:46:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k44sm4616ool.33.2021.04.12.07.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 07:46:25 -0700 (PDT)
Received: (nullmailer pid 3870762 invoked by uid 1000);
        Mon, 12 Apr 2021 14:46:24 -0000
Date:   Mon, 12 Apr 2021 09:46:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Message-ID: <20210412144624.GA3868831@robh.at.kernel.org>
References: <20210408202137.GA1890401@robh.at.kernel.org>
 <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
 <20210411114804.151754-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210411114804.151754-3-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 11, 2021 at 01:48:03PM +0200, Giulio Benetti wrote:
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> As suggested by Rob Herring:
> * fixed $id: address
> * added "hycon," in front of every custom property
> * changed all possible property to boolean type
> * removed proximity-sensor-switch property since it's not handled in driver
> V2->V3:
> As suggested by Jonathan Neuschäfer:
> * fixed some typo
> * fixed description indentation
> * improved boolean properties descriptions
> * improved hycon,report-speed description
> V3->V4:
> * fixed binding compatible string in example as suggested by Jonathan Neuschäfer
> V4->V5:
> As suggested by Rob Herring:
> * drop hycon- prefix from compatible
> * use Hertz unit suffix for hycon,report-speed instead of u32

hycon,report-speed-hz

> * set hycon,report-speed minimum to 1Hz, 0Hz make controller to do nothing
> * change hycon,power-noise-enable property name to hycon,noise-filter-enable
> * improve hycon,filter-data property description
> * use generic touchscreen node name in example
> ---
>  .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> new file mode 100644
> index 000000000000..ae792e3716ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hycon,hy46xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hycon HY46XX series touchscreen controller bindings
> +
> +description: |
> +  There are 6 variants of the chip for various touch panel sizes and cover lens material
> +   Glass: 0.3mm--4.0mm
> +    PET/PMMA: 0.2mm--2.0mm
> +    HY4613(B)-N048  < 6"
> +    HY4614(B)-N068  7" .. 10.1"
> +    HY4621-NS32  < 5"
> +    HY4623-NS48  5.1" .. 7"
> +   Glass: 0.3mm--8.0mm
> +    PET/PMMA: 0.2mm--4.0mm
> +    HY4633(B)-N048  < 6"
> +    HY4635(B)-N048  < 7" .. 10.1"
> +
> +maintainers:
> +  - Giulio Benetti <giulio.benetti@benettiengineering.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hycon,hy4613
> +      - hycon,hy4614
> +      - hycon,hy4621
> +      - hycon,hy4623
> +      - hycon,hy4633
> +      - hycon,hy4635
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
> +  hycon,threshold:
> +    description: Allows setting the sensitivity in the range from 0 to 255.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +
> +  hycon,glove-enable:
> +    type: boolean
> +    description: Allows enabling glove setting.
> +
> +  hycon,report-speed:
> +    description: Allows setting the report speed in Hertz.
> +    minimum: 1
> +    maximum: 255
> +
> +  hycon,noise-filter-enable:
> +    type: boolean
> +    description: Allows enabling power noise filter.
> +
> +  hycon,filter-data:
> +    description: Allows setting how many samples throw before reporting touch
> +                 in the range from 0 to 5.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 5
> +
> +  hycon,gain:
> +    description: Allows setting the sensitivity distance in the range from 0 to 5.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 5
> +
> +  hycon,edge-offset:
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
> +      touchscreen@1c {
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
> index 7fdc513392f4..18a50942c019 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8250,6 +8250,12 @@ S:	Maintained
>  F:	mm/hwpoison-inject.c
>  F:	mm/memory-failure.c
>  
> +HYCON HY46XX TOUCHSCREEN SUPPORT
> +M:	Giulio Benetti <giulio.benetti@benettiengineering.com>
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
