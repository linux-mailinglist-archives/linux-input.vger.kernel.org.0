Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B53358E3C
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 22:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhDHUVv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 16:21:51 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:36814 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbhDHUVv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 16:21:51 -0400
Received: by mail-ot1-f46.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso3586851otq.3;
        Thu, 08 Apr 2021 13:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NZK03VGL3VDmR5gE9NkY9ogiVrwv9YJIwF5/GzsBsPo=;
        b=iUzlsAYb/3XTZ/6cYljqPwq3VkDm3X6LSSfCcJSTpmIA7XTJTa8X4HGa60ndv5f5Yp
         6aVeVy7K7Xii6k4SxMazIyPK+p71UYtP2TjM3SzT76PrnpWAvpdc7FQT9ro1/ZNGxHJh
         Int9Sf/swV/L3ofO72StUOHXMMdr84TP1W/QxNj8vKtUbQLewKndAI+TdnrqIRBC6KoG
         fyduvI/MfnsHtZBdJuke1wJ2GYuM6T+HzSo2ktNTo/VaFxaGqrPWl6x0Li3TMwDcCcAG
         P/bExWhFrpsCXl6bBJ1mZ5uUMrJVNJJBrj2BWBhdAc8Pzvs8T6uzurmJs26nxIlgbONp
         KKvA==
X-Gm-Message-State: AOAM531z3sZF3lDUxtILpO9W/br6WWSF/PfDWJJqu1H7dxfuhAqyaNyJ
        LvP07WuWkp3JrcbKrbr2KQ==
X-Google-Smtp-Source: ABdhPJx1Ce8UviwE+BYESAWpewySwAqhw1vUls2A7geYvtKK44fsPnS0fzSbyjCwNCgQJdj7By+cjA==
X-Received: by 2002:a05:6830:908:: with SMTP id v8mr9621186ott.217.1617913299103;
        Thu, 08 Apr 2021 13:21:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y11sm99647ots.80.2021.04.08.13.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:21:38 -0700 (PDT)
Received: (nullmailer pid 1897309 invoked by uid 1000);
        Thu, 08 Apr 2021 20:21:37 -0000
Date:   Thu, 8 Apr 2021 15:21:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Message-ID: <20210408202137.GA1890401@robh.at.kernel.org>
References: <YGxkB6icZSJfx/VB@latitude>
 <20210407174909.1475150-1-giulio.benetti@benettiengineering.com>
 <20210407174909.1475150-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210407174909.1475150-3-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 07, 2021 at 07:49:08PM +0200, Giulio Benetti wrote:
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
> ---
>  .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> new file mode 100644
> index 000000000000..8860613a12ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> @@ -0,0 +1,120 @@
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
> +      - hycon,hycon-hy4613
> +      - hycon,hycon-hy4614
> +      - hycon,hycon-hy4621
> +      - hycon,hycon-hy4623
> +      - hycon,hycon-hy4633
> +      - hycon,hycon-hy4635

As suggested earlier, drop the 2nd 'hycon'.

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

If in Hertz, use standard unit suffix.

> +    $ref: /schemas/types.yaml#/definitions/uint32

And then you can drop this.

> +    minimum: 0

0Hz doesn't seem to useful?

> +    maximum: 255
> +
> +  hycon,power-noise-enable:

hycon,noise-filter-enable

No one wants to enable power noise. :)

> +    type: boolean
> +    description: Allows enabling power noise filter.
> +
> +  hycon,filter-data:
> +    description: Allows setting the filtering data before reporting touch
> +                 in the range from 0 to 5.

This is averaging samples? Sounds like something common perhaps.

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
> +      hycon-hy4633@1c {

touchscreen@1c

> +        compatible = "hycon,hycon-hy4633";
> +        reg = <0x1c>;
> +        interrupt-parent = <&gpio2>;
> +        interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
> +      };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c80ad735b384..d022ff09e609 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8243,6 +8243,12 @@ S:	Maintained
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
