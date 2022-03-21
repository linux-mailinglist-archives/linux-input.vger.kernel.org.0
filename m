Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF3FD4E308E
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 20:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351229AbiCUTLk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 15:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234996AbiCUTLj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 15:11:39 -0400
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032DC5AED7;
        Mon, 21 Mar 2022 12:10:14 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id q189so17250234oia.9;
        Mon, 21 Mar 2022 12:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fCI7rHE9L1PrAM4ZCrX2I59gmG0an3eQUijS0NkATio=;
        b=455LIp+7i686YlHZ9z0wfyHVfFBmbjwpvWSrzJTsBsfSI6oBmFwcypcdJjzpp+wVMy
         L3exgEPhrYDDBPZuTdLyEmN2SI/n4UwPm/ss98O+tEB5vw9I78d5g8hyr6t+9v5E+58k
         jLUyaJ/I5llWScC/tDKa8j6vfcH7GsmNl50hy2+0oelHIPJN4i2icWc1Gw+pCCtFqeiF
         9H8yATiv6q+GK0I83805yMcpbjDRiv+PnbfEEf3q4JBiDEfVPtSKKU7hTg5bbEW3HI5H
         H58dvJUhEHKV40CawmZxGoFvWk+q+5ZKg8RSNn2H7aWFqH2urVYQcnfBYB7YogqJQhd6
         Hwnw==
X-Gm-Message-State: AOAM530u/KyN3u1jFDfeIqDoGMYzuIEhzNO/fAwk4EKLPKhx3/2OsYS7
        FJDVG+bzLxBRhYzN1SpsPA==
X-Google-Smtp-Source: ABdhPJwMxOzJN5YGD0N6C6rVZFmD+ykTOB9u9GciZBFzUYbHTt5j1TTTpN0Ji6mocc2o5o05MqOWhw==
X-Received: by 2002:a54:4402:0:b0:2ec:c2ab:50a9 with SMTP id k2-20020a544402000000b002ecc2ab50a9mr309491oiw.229.1647889813222;
        Mon, 21 Mar 2022 12:10:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m23-20020a4add17000000b0032489ab619esm2012326oou.45.2022.03.21.12.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 12:10:12 -0700 (PDT)
Received: (nullmailer pid 383411 invoked by uid 1000);
        Mon, 21 Mar 2022 19:10:11 -0000
Date:   Mon, 21 Mar 2022 14:10:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: input: Add bindings for Immersion
 ISA1200
Message-ID: <YjjNkyChcJcaJi11@robh.at.kernel.org>
References: <20220315233528.1204930-1-linus.walleij@linaro.org>
 <20220315233528.1204930-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315233528.1204930-2-linus.walleij@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 16, 2022 at 12:35:27AM +0100, Linus Walleij wrote:
> This adds device tree bindings for the Immersion ISA1200
> haptic feedback unit.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/input/immersion,isa1200.yaml     | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/immersion,isa1200.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/immersion,isa1200.yaml b/Documentation/devicetree/bindings/input/immersion,isa1200.yaml
> new file mode 100644
> index 000000000000..e6bbefce74a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/immersion,isa1200.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/immersion,isa1200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Immersion ISA1200 Haptic Feedback Unit
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description:
> +  The Immersion ISA1200 is a haptic feedback chip using two motors of
> +  LRA or ERM type. It can generate a PWM signal to control the motors from
> +  a fixed input clock, or it can amplify and modify an existing PWM
> +  input. It is communicating with the host system using I2C.
> +
> +properties:
> +  compatible:
> +    description: One compatible per product using this chip. Each product
> +      need deliberate custom values for things such as LRA resonance
> +      frequency and these are not stored in the device tree, rather we
> +      let the operating system look up the appropriate parameters from a
> +      table.
> +    enum:
> +      - immersion,isa1200-janice
> +      - immersion,isa1200-gavini

Same device, different boards. I think I would put necessary properties 
in the DT.

> +
> +  reg:
> +    description: I2C address for the ISA1200
> +
> +  hen-gpios:
> +    description: GPIO line that drives the HEN (Motor Hardware Enable) pin
> +      on the chip.
> +    maxItems: 1
> +
> +  len-gpios:
> +    description: GPIO line that drives the LEN (LDO Enable) pin on the chip.
> +    maxItems: 1
> +
> +  clocks:
> +    description: Clock that drives the chip if using the chip to generate a
> +      PWM from a clock. Either clocks or pwms must be defined.
> +    maxItems: 1
> +
> +  pwms:
> +    description: PWM that drives the chip if using an external PWM generator.
> +      Either pwms or clocks must be defined.

That can be expressed as:

oneOf:
 - required: [ clocks ]
 - required: [ pwms ]

(or 'anyOf' if you want to allow both)

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - hen-gpios
> +  - len-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      haptic@49 {
> +        compatible = "immersion,isa1200-janice";
> +        reg = <0x49>;
> +        hen-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>;
> +        len-gpios = <&gpio6 3 GPIO_ACTIVE_HIGH>;
> +        clocks = <&clkout_clk>;
> +      };
> +    };
> -- 
> 2.35.1
> 
> 
