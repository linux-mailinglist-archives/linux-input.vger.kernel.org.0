Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0159180A19
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 22:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgCJVOk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 17:14:40 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:32846 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgCJVOk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 17:14:40 -0400
Received: by mail-ot1-f65.google.com with SMTP id g15so8564655otr.0;
        Tue, 10 Mar 2020 14:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JkykpUPy0GzuJ7bhjumSgmxVwtFhWeK9dyIcRUc31eA=;
        b=LofeS0NirTHwx4p684SUKQftOm7j2JBSq3uDlv7MR1XY1P54t2a5BjeNOrgzudy3du
         +tg5Ulhvd59BH56JDKvM2o49HUP2UJ/QqkIHR4FRuujIEPtDW7O7OSD0yNqXOPu2eErf
         cQ5jjTJ19G/Zl8vI7YSluS+aD6nWDcfDcLBFLUgihgou6VcjImLL9YqWHkjHn0RxXjOO
         QotaAK4CZH9eL+0sTbProV/BRjCDUXwPap27vZ/8bug42TQ6MpofhfXwtsIa5ERz/hLf
         PnpcNJb7kPvSvrJXOKKMcrDup15WZ0wyIpkMk+J/eKvLMpDksPcRYaJTzeboJc8K76E+
         rOwQ==
X-Gm-Message-State: ANhLgQ3P8437SYEHjzKCsfpNtewKEXGJrfRck/jhpwHS4a6bmCScGzdj
        NX27OdylkwU+U2Uq4c5BLQ==
X-Google-Smtp-Source: ADFU+vvbDlmZAk8CYnYnooNDyFeX270kBDYuqmR69w2h0Ee3Cw0SeOa3W21yFBeimSgKYKVluXsYhA==
X-Received: by 2002:a9d:4b0c:: with SMTP id q12mr19351298otf.77.1583874879261;
        Tue, 10 Mar 2020 14:14:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n6sm1646493otk.75.2020.03.10.14.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:14:38 -0700 (PDT)
Received: (nullmailer pid 2800 invoked by uid 1000);
        Tue, 10 Mar 2020 21:14:37 -0000
Date:   Tue, 10 Mar 2020 16:14:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     devicetree@vger.kernel.org, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, enric.balletbo@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com
Subject: Re: [PATCH] dt-bindings: input: atmel_mxt_ts: convert
 atmel,maxtouch.txt to yaml
Message-ID: <20200310211437.GA18992@bogus>
References: <20200303172533.30602-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303172533.30602-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 03, 2020 at 07:25:33PM +0200, Dafna Hirschfeld wrote:
> Convert the binding file atmel,maxtouch.txt to yaml format.
> Also change the file name in the MAINTAINERS file.
> 
> This was tested and verified on ARM and ARM64 with:
> 
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../bindings/input/atmel,maxtouch.txt         | 41 ------------
>  .../bindings/input/atmel,maxtouch.yaml        | 64 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 65 insertions(+), 42 deletions(-)
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
> index 000000000000..024dc4ded4f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/atmel,maxtouch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel maXTouch touchscreen/touchpad
> +
> +maintainers:
> +  - Nick Dyer <nick@shmanahar.org>
> +
> +description: |
> +  Atmel maXTouch touchscreen/touchpad
> +
> +properties:
> +  compatible:
> +    const: atmel,maxtouch
> +
> +  reg:
> +    description: The I2C address of the device
> +    maxItems: 1
> +
> +  interrupts:
> +    description: The sink for the touchpad's IRQ output

How many? Needs 'maxItems: 1'?

You can drop the description.

> +
> +  linux,gpio-keymap:
> +    description:
> +      When enabled, the SPT_GPIOPWN_T19 object sends messages
> +      on GPIO bit changes. An array of up to 8 entries can be provided
> +      indicating the Linux keycode mapped to each bit of the status byte,
> +      starting at the LSB. Linux keycodes are defined in
> +      <dt-bindings/input/input.h>.
> +      Note, the numbering of the GPIOs and the bit they start at varies between
> +      maXTouch devices. You must either refer to the documentation, or
> +      experiment to determine which bit corresponds to which input. Use
> +      KEY_RESERVED for unused padding values.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 8
> +
> +  reset-gpios:
> +    description: GPIO specifier for the touchscreen's reset pin (active low)
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: true

That's the default and we generally want this to be 'false'.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/tegra-gpio.h>
> +    i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          touch@4b {
> +                compatible = "atmel,maxtouch";
> +                reg = <0x4b>;
> +                interrupt-parent = <&gpio>;
> +                interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
> +          };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46fdb834d1fb..d553aa315734 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2877,7 +2877,7 @@ ATMEL MAXTOUCH DRIVER
>  M:	Nick Dyer <nick@shmanahar.org>
>  T:	git git://github.com/ndyer/linux.git
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> +F:	Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>  F:	drivers/input/touchscreen/atmel_mxt_ts.c
>  
>  ATMEL WIRELESS DRIVER
> -- 
> 2.17.1
> 
