Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C513113A9D9
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 13:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgANM6J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 07:58:09 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60534 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgANM6J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 07:58:09 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 269F628A277
Subject: Re: [PATCH] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
To:     Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>
References: <20200114021934.178057-1-ikjn@chromium.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <ad5b6728-2435-9f97-870a-7107f5cc805b@collabora.com>
Date:   Tue, 14 Jan 2020 13:58:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200114021934.178057-1-ikjn@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ikjoon,

cc'ing Gwendal who might be interested on participate on the discussion.

Many thanks for sending this upstream, some comments below ... I'd like to take
this opportunity to improve this part and a bit or rewording.

On 14/1/20 3:19, Ikjoon Jang wrote:
> Convert the ChromeOS EC bindings to json-schema.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ----------
>  .../devicetree/bindings/mfd/cros-ec.yaml      | 138 ++++++++++++++++++

This is not an mfd binding anymore, the old binding is in the wrong place,
please move to devicetree/bindings/chrome/google,cros-ec.yaml

>  2 files changed, 138 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
> deleted file mode 100644
> index 4860eabd0f72..000000000000
> --- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -ChromeOS Embedded Controller
> -
> -Google's ChromeOS EC is a Cortex-M device which talks to the AP and
> -implements various function such as keyboard and battery charging.
> -
> -The EC can be connect through various means (I2C, SPI, LPC, RPMSG) and the
> -compatible string used depends on the interface. Each connection method has
> -its own driver which connects to the top level interface-agnostic EC driver.
> -Other Linux driver (such as cros-ec-keyb for the matrix keyboard) connect to
> -the top-level driver.
> -
> -Required properties (I2C):
> -- compatible: "google,cros-ec-i2c"
> -- reg: I2C slave address
> -
> -Required properties (SPI):
> -- compatible: "google,cros-ec-spi"
> -- reg: SPI chip select
> -
> -Required properties (RPMSG):
> -- compatible: "google,cros-ec-rpmsg"
> -
> -Optional properties (SPI):
> -- google,cros-ec-spi-pre-delay: Some implementations of the EC need a little
> -  time to wake up from sleep before they can receive SPI transfers at a high
> -  clock rate. This property specifies the delay, in usecs, between the
> -  assertion of the CS to the start of the first clock pulse.
> -- google,cros-ec-spi-msg-delay: Some implementations of the EC require some
> -  additional processing time in order to accept new transactions. If the delay
> -  between transactions is not long enough the EC may not be able to respond
> -  properly to subsequent transactions and cause them to hang. This property
> -  specifies the delay, in usecs, introduced between transactions to account
> -  for the time required by the EC to get back into a state in which new data
> -  can be accepted.
> -
> -Required properties (LPC):
> -- compatible: "google,cros-ec-lpc"
> -- reg: List of (IO address, size) pairs defining the interface uses
> -
> -Optional properties (all):
> -- google,has-vbc-nvram: Some implementations of the EC include a small
> -  nvram space used to store verified boot context data. This boolean flag
> -  is used to specify whether this nvram is present or not.
> -
> -Example for I2C:
> -
> -i2c@12ca0000 {
> -	cros-ec@1e {
> -		reg = <0x1e>;
> -		compatible = "google,cros-ec-i2c";
> -		interrupts = <14 0>;
> -		interrupt-parent = <&wakeup_eint>;
> -		wakeup-source;
> -	};
> -
> -
> -Example for SPI:
> -
> -spi@131b0000 {
> -	ec@0 {
> -		compatible = "google,cros-ec-spi";
> -		reg = <0x0>;
> -		interrupts = <14 0>;
> -		interrupt-parent = <&wakeup_eint>;
> -		wakeup-source;
> -		spi-max-frequency = <5000000>;
> -		controller-data {
> -		cs-gpio = <&gpf0 3 4 3 0>;
> -		samsung,spi-cs;
> -		samsung,spi-feedback-delay = <2>;
> -		};
> -	};
> -};
> -
> -
> -Example for LPC is not supplied as it is not yet implemented.
> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.yaml b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> new file mode 100644
> index 000000000000..ea430f0a553b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/cros-ec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS Embedded Controller
> +
> +maintainers:
> +  - Benson Leung <bleung@chromium.org>
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +  - Guenter Roeck <groeck@chromium.org>
> +
> +description: |
> +  Google's ChromeOS EC is a Cortex-M device which talks to the AP and
> +  implements various function such as keyboard and battery charging.

I am not English native but I guess there are some typos. Lets take this
opportunity to rewrite fix some parts, please feel free to ignore them if I am
wrong.

typo: functions?

> +  The EC can be connect through various means (I2C, SPI, LPC, RPMSG)

typo: 'connected' or 'is connected'


I'd add '(I2C, SPI and others)' where other is RPMSG, ISHP, and future transport
layers.

> +  and the compatible string used depends on the interface.

on the communication interface?

> +  Each connection method has its own driver which connects to the
> +  top level interface-agnostic EC driver. Other Linux driver
> +  (such as cros-ec-keyb for the matrix keyboard) connect to the
> +  top-level driver.

Not sure this part is clear an accurate to the reality, I'd just remove it.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          For implementations of the EC is connected through I2C.

s/is/are connected/?

And the same change applies below.

> +        const: google,cros-ec-i2c
> +      - description:
> +          For implementations of the EC is connected through SPI.
> +        const: google,cros-ec-spi

> +      - description:
> +          For implementations of the EC is connected through LPC.
> +        const: google,cros-ec-lpc

This does not exist in mainline so remove it.

> +      - description:
> +          For implementations of the EC is connected through RPMSG.
> +        const: google,cros-ec-rpmsg
> +
> +  google,has-vbc-nvram:
> +    description: |
> +      Some implementations of the EC include a small
> +      nvram space used to store verified boot context data.
> +      This boolean flag is used to specify whether this nvram is present or not.
> +    type: boolean
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: google,cros-ec-i2c
> +    then:
> +      properties:
> +        reg:
> +          description: I2C slave address
> +          maxItems: 1
> +      required:
> +        - reg
> +  - if:
> +      properties:
> +        compatible:
> +          const: google,cros-ec-spi
> +    then:
> +      properties:
> +        reg:
> +          description: SPI chip select
> +          maxItems: 1
> +        google,cros-ec-spi-pre-delay:
> +          description: |
> +            Some implementations of the EC need a little time to wake up
> +            from sleep before they can receive SPI transfers
> +            at a high clock rate. This property specifies the delay,
> +            in usecs, between the assertion of the CS to the start of
> +            the first clock pulse.
> +        google,cros-ec-spi-msg-delay:
> +          description: |
> +            Some implementations of the EC require some additional
> +            processing time in order to accept new transactions.
> +            If the delay between transactions is not long enough
> +            the EC may not be able to respond properly to
> +            subsequent transactions and cause them to hang.
> +            This property specifies the delay, in usecs,
> +            introduced between transactions to account for the
> +            time required by the EC to get back into a state
> +            in which new data can be accepted.
> +      required:
> +        - reg
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: google,cros-ec-lpc
> +    then:
> +      properties:
> +        reg:
> +          description: |
> +            List of (IO address, size) pairs defining the interface uses
> +      required:
> +        - reg
> +

Remove the LPC part.

> +examples:
> +  - |+
> +    // Example for I2C

Use c style comments I guess

> +    i2c@12ca0000 {

i2c0 {

> +        #address-cells = <1>;
> +        #size-cells = <0>;

nit: Add an empty line here

> +        cros-ec@1e {
> +            reg = <0x1e>;
> +            compatible = "google,cros-ec-i2c";

The compatible on top

> +            interrupts = <14 0>;
> +            interrupt-parent = <&wakeup_eint>;
> +            wakeup-source;
> +        };

Just let's use an upstream example, i.e the snow one:

   cros-ec@1e {
        compatible = "google,cros-ec-i2c";
        reg = <0x1e>;
        interrupts = <6 IRQ_TYPE_NONE>;
        interrupt-parent = <&gpx1>;
   };

> +    };
> +  - |+
> +    // Example for SPI
> +    spi@131b0000 {

spi0 {

> +        #address-cells = <1>;
> +        #size-cells = <0>;

nit: Add an empty line here

> +        ec@0 {

Use cros-ec@0, same name as before to be coherent

> +            compatible = "google,cros-ec-spi";
> +            reg = <0x0>;
> +            interrupts = <14 0>;
> +            interrupt-parent = <&wakeup_eint>;

What about selecting a more simple example, without the controller-data to not
confuse the reader.

> +            wakeup-source;
> +            spi-max-frequency = <5000000>;
> +            controller-data {
> +                cs-gpio = <&gpf0 3 4 3 0>;
> +                samsung,spi-cs;
> +                samsung,spi-feedback-delay = <2>;
> +            };
> +        };
> +    };
> +

I propose the veyron one.

        cros-ec@0 {

                compatible = "google,cros-ec-spi";
                reg = <0>;
                google,cros-ec-spi-pre-delay = <30>;
                interrupt-parent = <&gpio7>;
                interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
                spi-max-frequency = <3000000>;
        };

> +...
> 

Could we have a RPMSG example too?

Thanks,
 Enric
