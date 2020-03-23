Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAFDC190066
	for <lists+linux-input@lfdr.de>; Mon, 23 Mar 2020 22:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgCWVcl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Mar 2020 17:32:41 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:34084 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgCWVcl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Mar 2020 17:32:41 -0400
Received: by mail-il1-f193.google.com with SMTP id t11so4961556ils.1;
        Mon, 23 Mar 2020 14:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qFDFZEF2IE5G2XSanobwC6e4wfS266KN7sjR0GtTr3A=;
        b=GmpdE05cieHRUMaKwUAAG6jNyBcQnG/TCNfhh7DaKsLsvHaOzTYlExjeuFobjLCZ2z
         cbYRk/ztXVAfUrQpWbr76G+tJNP7eI7lI+AqZN5TaVqdQ8MUGYrNIhBgx7bKQ5KQ+oke
         b/M/OYpuxSrn1Gzf2u/4Hh2Y3A2InA8Ms1q0HmxMmf4Hm+dfUt+Ck/M3CDOON2qv8JaA
         xAACfTrQnKk+DlEyvY1nmPXQpDmxjV0eEN7nzNlGwxiXLdcpvNEYyZ2Wf5H8FDSK4r5d
         9Vkpty4T0FRL0GC6pk8QJB1TGpPmtWrWa8Q/87Dt18C6qlpPN7mya2q188gTURyiCJ5S
         x8gw==
X-Gm-Message-State: ANhLgQ1nz4prDEQ6Kj1j2xvMlr3pS0VJczwlUPceu4HMa59iswEVoL8n
        IqigQZ6kcgfAwLYnnbJozg==
X-Google-Smtp-Source: ADFU+vsdj+CL7qScZ2QMMXXFIpqS7PR2Aj0hpAbWGIXfavNyIOQeG6mSi5+SvWjx8/e821aDJWCPhg==
X-Received: by 2002:a92:d3d0:: with SMTP id c16mr7945343ilh.22.1584999158718;
        Mon, 23 Mar 2020 14:32:38 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k81sm5674964ilf.44.2020.03.23.14.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 14:32:38 -0700 (PDT)
Received: (nullmailer pid 29102 invoked by uid 1000);
        Mon, 23 Mar 2020 21:32:37 -0000
Date:   Mon, 23 Mar 2020 15:32:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Ferruh Yigit <fery@cypress.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH 1/2 v1] dt-bindings: touchscreen: Add CY8CTMA140 bindings
Message-ID: <20200323213237.GA20027@bogus>
References: <20200310142818.15415-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310142818.15415-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 10, 2020 at 03:28:17PM +0100, Linus Walleij wrote:
> This adds device tree bindings for the Cypress CY8CTMA140
> touchscreen.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Ferruh Yigit <fery@cypress.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../input/touchscreen/cypress,cy8ctma140.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
> new file mode 100644
> index 000000000000..66b488e48b74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma140.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/cypress,cy8ctma140.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cypress CY8CTMA140 series touchscreen controller bindings
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: cypress,cy8ctma140
> +
> +  reg:
> +    description: I2C client address, defined by hardware

Can drop this. That's every 'reg'.

> +    const: 0x20
> +
> +  clock-frequency:
> +    description: I2C client max frequency, defined by hardware
> +    const: 400000

What if I have a board which can't do 400k? Perhaps 'maximum: 400000' 
instead.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vcpin-supply:
> +    description: Analog power supply regulator on VCPIN pin
> +
> +  vdd-supply:
> +    description: Digital power supply regulator on VDD pin
> +
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-swapped-x-y: true
> +  touchscreen-max-pressure: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +  - touchscreen-max-pressure
> +
> +examples:
> +- |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c@00000000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      touchscreen@20 {
> +        compatible = "cypress,cy8ctma140";
> +        reg = <0x20>;
> +        touchscreen-size-x = <480>;
> +        touchscreen-size-y = <800>;
> +        touchscreen-max-pressure = <255>;
> +        interrupt-parent = <&gpio6>;
> +        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +        vdd-supply = <&ab8500_ldo_aux2_reg>;
> +        vcpin-supply = <&ab8500_ldo_aux2_reg>;
> +      };
> +    };
> +
> +...
> -- 
> 2.21.1
> 
