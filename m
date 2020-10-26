Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348102988EC
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 09:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772428AbgJZI6u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 04:58:50 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:45071 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1421379AbgJZI6t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 04:58:49 -0400
Received: by mail-ej1-f67.google.com with SMTP id dt13so12218963ejb.12;
        Mon, 26 Oct 2020 01:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hn9VYABYZTQaVzPUiES+tS13koBgi3MCBoJWKx2vDHY=;
        b=M66m0U8bn2MiT68pSMLmqCesjN5/IQqN866oYn2hSvEtYgFSAR4mtca6+mU7OJYwQK
         DuGw1P6QrPZIBywKGFt1gjK59GoSiOaV7f6GkRCLM9GTC6eYRC1xV+uMonmiANCh+yv1
         HtZEU+mjHUZ143pimuLSZUBj3kXVxEa+ND6t88Uyu4Ac0gW9OUH6srV8QvZxaI4HUFo+
         Q/734V3ab+kHQg3ne3OSSw8PwwCsmpVLvpSku1+KNAKyVs0gwqTdGHXg1Tyo+/qtTjih
         gCUU7VM0ELMyQUwO4b3mkbI6O7Ehm/zp2Dvl9GqSnxzGtDsHtR7r8KAANy5knl7+vFHO
         6luw==
X-Gm-Message-State: AOAM531zFQcn3qrUROueKcVn2NkmIQsEDpkQNDcWU7VibL3CIBJLi/Ky
        dQS8mbAxO+XUWoQw0qHWMbQ=
X-Google-Smtp-Source: ABdhPJwFY2jEGzM5/BGA63kSRmTXKmL5TjLrrM/cx/jzntKQsUdmlHCo3mHGhn/wAPX2xXacX0CFcg==
X-Received: by 2002:a17:906:857:: with SMTP id f23mr14493598ejd.3.1603702726697;
        Mon, 26 Oct 2020 01:58:46 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id t8sm5443910ejc.45.2020.10.26.01.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 01:58:45 -0700 (PDT)
Date:   Mon, 26 Oct 2020 09:58:43 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     kholk11@gmail.com
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com
Subject: Re: [PATCH v7 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
Message-ID: <20201026085843.GA8168@kozik-lap>
References: <20201024105111.15829-1-kholk11@gmail.com>
 <20201024105111.15829-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201024105111.15829-4-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 24, 2020 at 12:51:11PM +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add binding for the Novatek NT36xxx series touchscreen driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../bindings/input/touchscreen/nt36xxx.yaml   | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
> new file mode 100644
> index 000000000000..1486b20d6c49
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/nt36xxx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36xxx series touchscreen controller Bindings
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <kholk11@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: novatek,nt36525
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
> +  vdd-supply:
> +    description: Power supply regulator for VDD pin
> +
> +  vio-supply:
> +    description: Power supply regulator on VDD-IO pin
> +
> +unevaluatedProperties: false
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
> +        compatible = "novatek,nt36525";
> +        reg = <0x62>;
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <45 IRQ_TYPE_EDGE_RISING>;
> +        reset-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;

The same as for v5 - reset-gpios.

Best regards,
Krzysztof
