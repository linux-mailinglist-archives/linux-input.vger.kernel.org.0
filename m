Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6C328D098
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 16:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389127AbgJMOqA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 10:46:00 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:32825 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389034AbgJMOpz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 10:45:55 -0400
Received: by mail-oo1-f67.google.com with SMTP id r7so3773029ool.0;
        Tue, 13 Oct 2020 07:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NW3Dp8tSp1XFOQyuV/GinrTN5xWOBlun1+/qXZiv0S0=;
        b=LNtpsXUDE41oF2E66/XC7EDcG6nR9WZVjnVVQqgPJ1y9qFKIOq33ENvkjgKvrZ6I/u
         Z5CVG8z8aCIvzofzhSL1ObRSMAwtW6iZfCVkP4SyCmP+XU++UjfA/wtlpNBm8nRkECiI
         khD9cQy82PbKmSFI3UXAkgpBmYLDHdB0nCDmalbB9viy0n3gzL/ERzDTHXEyJA/D1fRq
         b2T11eVZ92P6WfFvX0GKhIpbnS8jz3FW5yJsFrj5SQXsQRIF8777deZZq3IyrgXACyLx
         IU6ZmHD2wiSqnwN6tHmiaI31ni7s7vsMvEaYZe55hR7V1EpSWCiCx5IiX3E7L/3sHmiM
         qU6A==
X-Gm-Message-State: AOAM5327G6LWFhbQVem2CIb0SHiRxDSwCyqmBNE1CcIjaZOTqvF1EPD6
        We1fcg1XEv0lf66XsHYCAQ==
X-Google-Smtp-Source: ABdhPJzNduhs8XWiKMxvXTbQVUIfF4BuJBAEJr7VR4OowQhrZRIayCNtSFAwWKYLQjs8KUXqPOhwOA==
X-Received: by 2002:a4a:e544:: with SMTP id s4mr22349438oot.74.1602600354126;
        Tue, 13 Oct 2020 07:45:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l138sm11111798oih.32.2020.10.13.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 07:45:53 -0700 (PDT)
Received: (nullmailer pid 3483418 invoked by uid 1000);
        Tue, 13 Oct 2020 14:45:52 -0000
Date:   Tue, 13 Oct 2020 09:45:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     dmitry.torokhov@gmail.com, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
Message-ID: <20201013144552.GA3477694@bogus>
References: <20201008181514.668548-1-kholk11@gmail.com>
 <20201008181514.668548-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008181514.668548-4-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 08, 2020 at 08:15:14PM +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add binding for the Novatek NT36xxx series touchscreen driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../input/touchscreen/novatek,nt36xxx.yaml    | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> new file mode 100644
> index 000000000000..e747cacae036
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/novatek,nt36xxx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36xxx series touchscreen controller Bindings
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>

This should be an owner for this device, not subsystem maintainers.

> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: novatek,nt36xxx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpio:

reset-gpios

> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Power supply regulator for VDD pin
> +
> +  vio-supply:
> +    description: Power supply regulator on VDD-IO pin
> +
> +additionalProperties: false

This won't work with the ref to touchscreen.yaml. Use 
'unevaluatedProperties: false' instead.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      touchscreen@62 {
> +        compatible = "novatek,nt36xxx";
> +        reg = <0x62>;
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <45 IRQ_TYPE_EDGE_RISING>;
> +        reset-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +      };
> +    };
> +
> +...
> -- 
> 2.28.0
> 
