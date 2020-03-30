Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D89F71983F7
	for <lists+linux-input@lfdr.de>; Mon, 30 Mar 2020 21:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgC3TLm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Mar 2020 15:11:42 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41878 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgC3TLl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Mar 2020 15:11:41 -0400
Received: by mail-io1-f68.google.com with SMTP id b12so2820877ion.8;
        Mon, 30 Mar 2020 12:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=naEzHVNq1KsTafl3xqH4koGPBy3a41PHj0Hsijlhu9s=;
        b=V9XgwZMdMFb5UgUDyekxjidiupCOGMZ3G+RcgpWzgcqjrzIbE29RiQQwIVIx3kfOSH
         MuESVCaxjKFSdA4i4BAkMr9S87yNfZHf4+88rOg3S4QU9Onm4CsP5lOer6CB2CpnYcQN
         e5xCj9YXkQLqHJvSMqluWnJaBEnYoIJE9Pt6bhSWLGhVJaKnBIp9+dCcZRhKQLaV7uCF
         mwPpbSDCqw0WpF8F9Su6+UOXTy8FI02MXbSZsQ2SOrAJI3+tzS64nBcuZCdS6o8W7sMn
         zGB12rg+FIcmVOT8ubNboZPHMmfnaIBa4Qba5H2kOmFjtv02qjwuunxcGHa9uFQjjgUE
         feiA==
X-Gm-Message-State: ANhLgQ1HWaSk8NwcKXctBCl0DTzJjGpxocObElUSFnL2A0HRc4+qW91T
        opkoiVsDpgHx3W9I98h2KQ==
X-Google-Smtp-Source: ADFU+vsYIatZ1bjntaO5hjkGBwkqDPSOhoxi4SXRJcj+KJOdK7tBb4Gb0GLh/lVqM6oByQICfnINPw==
X-Received: by 2002:a6b:8dc9:: with SMTP id p192mr11427400iod.90.1585595498899;
        Mon, 30 Mar 2020 12:11:38 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id v80sm5125001ila.62.2020.03.30.12.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 12:11:37 -0700 (PDT)
Received: (nullmailer pid 6109 invoked by uid 1000);
        Mon, 30 Mar 2020 19:11:35 -0000
Date:   Mon, 30 Mar 2020 13:11:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: Update atmel,maxtouch.txt to YAML
Message-ID: <20200330191135.GA22010@bogus>
References: <20200315100416.14151-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315100416.14151-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 15, 2020 at 11:04:15AM +0100, Paul Cercueil wrote:
> Update atmel,maxtouch.txt to YAML. The new 'vdd-supply' property was
> added in the process.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/input/atmel,maxtouch.txt         | 41 -----------
>  .../bindings/input/atmel,maxtouch.yaml        | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>  create mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> deleted file mode 100644
> index c88919480d37..000000000000
> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Atmel maXTouch touchscreen/touchpad
> -
> -Required properties:
> -- compatible:
> -    atmel,maxtouch
> -
> -    The following compatibles have been used in various products but are
> -    deprecated:
> -	atmel,qt602240_ts
> -	atmel,atmel_mxt_ts
> -	atmel,atmel_mxt_tp
> -	atmel,mXT224
> -
> -- reg: The I2C address of the device
> -
> -- interrupts: The sink for the touchpad's IRQ output
> -    See ../interrupt-controller/interrupts.txt
> -
> -Optional properties for main touchpad device:
> -
> -- linux,gpio-keymap: When enabled, the SPT_GPIOPWN_T19 object sends messages
> -    on GPIO bit changes. An array of up to 8 entries can be provided
> -    indicating the Linux keycode mapped to each bit of the status byte,
> -    starting at the LSB. Linux keycodes are defined in
> -    <dt-bindings/input/input.h>.
> -
> -    Note: the numbering of the GPIOs and the bit they start at varies between
> -    maXTouch devices. You must either refer to the documentation, or
> -    experiment to determine which bit corresponds to which input. Use
> -    KEY_RESERVED for unused padding values.
> -
> -- reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
> -
> -Example:
> -
> -	touch@4b {
> -		compatible = "atmel,maxtouch";
> -		reg = <0x4b>;
> -		interrupt-parent = <&gpio>;
> -		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> new file mode 100644
> index 000000000000..1b138a9836bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Do you have rights to relicense?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel maXTouch touchscreen/touchpad DT bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,maxtouch
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Phandle to regulator providing power to the touchscreen
> +
> +  linux,gpio-keymap:
> +    minItems: 1
> +    maxItems: 8

Needs a type reference (uint32-array).

> +    description: >
> +      When enabled, the SPT_GPIOPWN_T19 object sends messages
> +      on GPIO bit changes. An array of up to 8 entries can be provided
> +      indicating the Linux keycode mapped to each bit of the status byte,
> +      starting at the LSB. Linux keycodes are defined in
> +      <dt-bindings/input/input.h>.
> +
> +      Note: the numbering of the GPIOs and the bit they start at varies between
> +      maXTouch devices. You must either refer to the documentation, or
> +      experiment to determine which bit corresponds to which input. Use
> +      KEY_RESERVED for unused padding values.
> +
> +  reset-gpios:
> +    description: GPIO specifier for the touchscreen's reset pin (active low)

maxItems: 1

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      mxt224-touchscreen@4a {

touchscreen@4a

> +        compatible = "atmel,maxtouch";
> +        reg = <0x4a>;
> +
> +        interrupt-parent = <&gpx0>;
> +        interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +
> +        vdd-supply = <&tsp_reg>;
> +      };
> +    };
> -- 
> 2.25.1
> 
