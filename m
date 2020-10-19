Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAED292B23
	for <lists+linux-input@lfdr.de>; Mon, 19 Oct 2020 18:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730549AbgJSQI0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 12:08:26 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41260 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730447AbgJSQI0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 12:08:26 -0400
Received: by mail-wr1-f65.google.com with SMTP id s9so334628wro.8;
        Mon, 19 Oct 2020 09:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zoO2hDHZETk3IyeB0Cl94Uv+82asuWViFYsWJmUXsmY=;
        b=M7s0WnuEMEbRcoFCLXp83U7kuz5sPJ8bGq4/OJMIO0F/KsQryhDvXoZHktR8j8fUe3
         MQ941POGhRvUJ2cyzgHJ+x6NZGw6dh/s6E4uRY6lybJHSa6MQIiuK3OguB6nC3mjvT+V
         RBbvfr6GQTjCrNRpXJ3jGNNEayHtCc6jOh30CHQ4ZQFGwR9RXlajbVX7RifbUtxh9P/R
         +zUqJD/I8/kzZxplHEXYsWoDmDKfsFZakdqlLjj4n/RhR1OSzhLBWNFob/pX3jTkLI5S
         2eYaE4ziVnYj3IgU7Y91rqsNRin/1RWTzZgOqJbH1r92C8D3vzczosk/L4Y3MP4xa9uY
         CX1A==
X-Gm-Message-State: AOAM532fso6b/S7HG7GMNbv2bO/ELHlYIPiO+2oGotFR9bn+rLTgWTVZ
        kUNODkI3EoKqRt/pUehmZ68=
X-Google-Smtp-Source: ABdhPJzn9211CyF1TlFXeRqXKkFp4steoLCXGDe3zss3JH2vfd8GJc4eMWny+D3BIHIjIfO5L0ip7A==
X-Received: by 2002:adf:d84e:: with SMTP id k14mr266926wrl.251.1603123703705;
        Mon, 19 Oct 2020 09:08:23 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id f8sm201290wrw.85.2020.10.19.09.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 09:08:22 -0700 (PDT)
Date:   Mon, 19 Oct 2020 18:08:20 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     kholk11@gmail.com
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
Message-ID: <20201019160820.GB34785@kozik-lap>
References: <20201017190152.12780-1-kholk11@gmail.com>
 <20201017190152.12780-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201017190152.12780-4-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 17, 2020 at 09:01:52PM +0200, kholk11@gmail.com wrote:
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

reset-gpios

Best regards,
Krzysztof
