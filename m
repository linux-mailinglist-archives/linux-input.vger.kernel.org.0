Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90C0714A79B
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 16:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgA0P5U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 10:57:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33408 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729203AbgA0P5T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 10:57:19 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 0AB4C293D80
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
To:     Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
References: <20200114021934.178057-1-ikjn@chromium.org>
 <20200121074727.35893-1-ikjn@chromium.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6739cc32-9beb-ac0a-f500-db2d70bb8e22@collabora.com>
Date:   Mon, 27 Jan 2020 16:57:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200121074727.35893-1-ikjn@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ikjoon,

On 21/1/20 8:47, Ikjoon Jang wrote:
> Convert the ChromeOS EC bindings to json-schema.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> v3: node name changed in rpmsg example
> v2: cleanup description, fix typos, remove LPC, add add RPMSG example
> ---
>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ------------
>  .../devicetree/bindings/mfd/cros-ec.yaml      | 111 ++++++++++++++++++
>  2 files changed, 111 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml
> 

Still in mfd directory, this is not a MFD driver, please move to chrome/cros-ec.yaml

Thanks,
 Enric

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
> index 000000000000..6a5b87cebcfa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> @@ -0,0 +1,111 @@
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
> +  Google's ChromeOS EC is a microcontroller which talks to the AP and
> +  implements various functions such as keyboard and battery charging.
> +  The EC can be connected through various interfaces (I2C, SPI, and others)
> +  and the compatible string specifies which interface is being used.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          For implementations of the EC is connected through I2C.
> +        const: google,cros-ec-i2c
> +      - description:
> +          For implementations of the EC is connected through SPI.
> +        const: google,cros-ec-spi
> +      - description:
> +          For implementations of the EC is connected through RPMSG.
> +        const: google,cros-ec-rpmsg
> +
> +  google,has-vbc-nvram:
> +    description: |
> +      Some implementations of the EC include a small
> +      nvram space used to store verified boot context data.
> +      This boolean flag is used to specify whether this nvram is
> +      present or not.
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
> +            This property specifies the delay in usecs between the
> +            assertion of the CS and the first clock pulse.
> +        google,cros-ec-spi-msg-delay:
> +          description: |
> +            This property specifies the delay in usecs between messages.
> +      required:
> +        - reg
> +
> +examples:
> +  # Example for I2C
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cros-ec@1e {
> +            compatible = "google,cros-ec-i2c";
> +            reg = <0x1e>;
> +            interrupts = <6 0>;
> +            interrupt-parent = <&gpx1>;
> +        };
> +    };
> +  # Example for SPI
> +  - |
> +    spi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cros-ec@0 {
> +            compatible = "google,cros-ec-spi";
> +            reg = <0x0>;
> +            google,cros-ec-spi-msg-delay = <30>;
> +            interrupts = <99 0>;
> +            interrupt-parent = <&gpio7>;
> +            spi-max-frequency = <5000000>;
> +        };
> +    };
> +  # Example for RPMSG
> +  - |
> +    scp0 {
> +        cros-ec@0 {
> +            compatible = "google,cros-ec-rpmsg";
> +        };
> +    };
> +...
> 
