Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FEC2D51D5
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 04:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730448AbgLJDpH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 22:45:07 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38104 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730376AbgLJDpE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 22:45:04 -0500
Received: by mail-oi1-f196.google.com with SMTP id o25so4268856oie.5;
        Wed, 09 Dec 2020 19:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fu6C4QffPD0sOdnGBmBWkf0xe4d39JgNdhCtih00fXk=;
        b=PLO+crZpFANXZp/nHa1OWgkUZejGP1bxzLPZTjoBOjoGPkw6ZC9TGVkmB96+cW8ETE
         MMwrVTQTV65h+JXYLxMuP7cyqxRypQntkMV1GL0a2gmBgeDPufem6UJ2GWPsyGAK+bh8
         7DoH/XqwvhWfQa64LuM4PF2gyct0DSDwrmI32ocn9LJTsu1F1yu7sjqqUNfTha/8MP7S
         viwrmgV8Yv1VfTS8Gu+fqwmghlgLZWN+kcBMjE69xoSLrPQZ8dQOmQ64R42Q7Z753/A7
         J+w/Unf2RMLDjFtauMOCvolO7pppbqVt2vtrDPUfzMZE5X0uN4NVcdBml0Dyi+rxTUiH
         zuDQ==
X-Gm-Message-State: AOAM531kWbC2VgNux9ih/JcmByEl74oQXT4fs/BKAS75zgu53vh9jQnL
        bleyqSdB0IF5RGh6FWb4iQ==
X-Google-Smtp-Source: ABdhPJz3gT186xFD11r4/H87QdtT5az1qJBQ/iAVgeJQCgY0qz0QsLhzOiYonLwdos+BNGeEIzHy+Q==
X-Received: by 2002:aca:d706:: with SMTP id o6mr4229937oig.28.1607571862751;
        Wed, 09 Dec 2020 19:44:22 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f201sm536070oig.21.2020.12.09.19.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:44:21 -0800 (PST)
Received: (nullmailer pid 1617044 invoked by uid 1000);
        Thu, 10 Dec 2020 03:44:20 -0000
Date:   Wed, 9 Dec 2020 21:44:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: input: atmel_mxt_ts: Document
 atmel,wakeup-method and wake-GPIO
Message-ID: <20201210034420.GA1615537@robh.at.kernel.org>
References: <20201206212217.6857-1-digetx@gmail.com>
 <20201206212217.6857-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206212217.6857-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 07, 2020 at 12:22:15AM +0300, Dmitry Osipenko wrote:
> Some Atmel touchscreen controllers have a WAKE line that needs to be
> asserted low in order to wake up controller from a deep sleep. Document
> the wakeup methods and the wake-GPIO properties.

wake-GPIO?

> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/input/atmel,maxtouch.yaml        | 29 +++++++++++++++++++
>  include/dt-bindings/input/atmel-maxtouch.h    | 10 +++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 include/dt-bindings/input/atmel-maxtouch.h
> 
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> index 8c6418f76e94..e6b03a1e7c30 100644
> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> @@ -39,6 +39,13 @@ properties:
>        (active low). The line must be flagged with
>        GPIO_ACTIVE_LOW.
>  
> +  wake-gpios:
> +    maxItems: 1
> +    description:
> +      Optional GPIO specifier for the touchscreen's wake pin
> +      (active low). The line must be flagged with
> +      GPIO_ACTIVE_LOW.
> +
>    linux,gpio-keymap:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: |
> @@ -53,6 +60,26 @@ properties:
>        or experiment to determine which bit corresponds to which input. Use
>        KEY_RESERVED for unused padding values.
>  
> +  atmel,wakeup-method:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The WAKE line is an active-low input that is used to wake up the touch
> +      controller from deep-sleep mode before communication with the controller
> +      could be started. This optional feature used to minimize current
> +      consumption when the controller is in deep sleep mode. This feature is
> +      relevant only to some controller families, like mXT1386 controller for
> +      example.
> +
> +      The WAKE pin can be connected in one of the following ways:
> +       1) left permanently low
> +       2) connected to the I2C-compatible SCL pin
> +       3) connected to a GPIO pin on the host
> +    enum:
> +      - 0 # ATMEL_MXT_WAKEUP_NONE
> +      - 1 # ATMEL_MXT_WAKEUP_I2C_SCL
> +      - 2 # ATMEL_MXT_WAKEUP_GPIO
> +    default: 0
> +
>  required:
>    - compatible
>    - reg
> @@ -63,6 +90,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/atmel-maxtouch.h>
>      #include <dt-bindings/gpio/gpio.h>
>      i2c {
>        #address-cells = <1>;
> @@ -75,6 +103,7 @@ examples:
>          reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
>          vdda-supply = <&ab8500_ldo_aux2_reg>;
>          vdd-supply = <&ab8500_ldo_aux5_reg>;
> +        atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
>        };
>      };
>  
> diff --git a/include/dt-bindings/input/atmel-maxtouch.h b/include/dt-bindings/input/atmel-maxtouch.h
> new file mode 100644
> index 000000000000..7345ab32224d
> --- /dev/null
> +++ b/include/dt-bindings/input/atmel-maxtouch.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _DT_BINDINGS_ATMEL_MAXTOUCH_H
> +#define _DT_BINDINGS_ATMEL_MAXTOUCH_H
> +
> +#define ATMEL_MXT_WAKEUP_NONE		0
> +#define ATMEL_MXT_WAKEUP_I2C_SCL	1
> +#define ATMEL_MXT_WAKEUP_GPIO		2
> +
> +#endif /* _DT_BINDINGS_ATMEL_MAXTOUCH_H */
> -- 
> 2.29.2
> 
