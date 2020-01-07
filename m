Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46CD11327DF
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 14:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgAGNi6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 08:38:58 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50349 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgAGNi6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jan 2020 08:38:58 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4704120009;
        Tue,  7 Jan 2020 13:38:54 +0000 (UTC)
Message-ID: <99576d0367241bff637e82dddca839c40f672d86.camel@hadess.net>
Subject: Re: [PATCH 2/2] dt-bindings: touchscreen: Convert Goodix
 touchscreen to json-schema
From:   Bastien Nocera <hadess@hadess.net>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yannick.fertre@st.com
Date:   Tue, 07 Jan 2020 14:38:53 +0100
In-Reply-To: <20200107130903.14421-3-benjamin.gaignard@st.com>
References: <20200107130903.14421-1-benjamin.gaignard@st.com>
         <20200107130903.14421-3-benjamin.gaignard@st.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-01-07 at 14:09 +0100, Benjamin Gaignard wrote:
> Convert the Goodix binding to DT schema format using json-schema

I don't have an opinion on the migration itself, but this really should
not lose any of the descriptions that were in the old text file.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/input/touchscreen/goodix.txt          | 50 ------------
> ----
>  .../bindings/input/touchscreen/goodix.yaml         | 69
> ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 50 deletions(-)
>  delete mode 100644
> Documentation/devicetree/bindings/input/touchscreen/goodix.txt
>  create mode 100644
> Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
> b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
> deleted file mode 100644
> index fc03ea4cf5ab..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Device tree bindings for Goodix GT9xx series touchscreen controller
> -
> -Required properties:
> -
> - - compatible		: Should be "goodix,gt1151"
> -				 or "goodix,gt5663"
> -				 or "goodix,gt5688"
> -				 or "goodix,gt911"
> -				 or "goodix,gt9110"
> -				 or "goodix,gt912"
> -				 or "goodix,gt927"
> -				 or "goodix,gt9271"
> -				 or "goodix,gt928"
> -				 or "goodix,gt967"
> - - reg			: I2C address of the chip. Should be
> 0x5d or 0x14
> - - interrupts		: Interrupt to which the chip is
> connected
> -
> -Optional properties:
> -
> - - irq-gpios		: GPIO pin used for IRQ. The driver uses the
> -			  interrupt gpio pin as output to reset the
> device.
> - - reset-gpios		: GPIO pin used for reset
> - - AVDD28-supply	: Analog power supply regulator on AVDD28 pin
> - - VDDIO-supply		: GPIO power supply regulator on VDDIO
> pin
> - - touchscreen-inverted-x
> - - touchscreen-inverted-y
> - - touchscreen-size-x
> - - touchscreen-size-y
> - - touchscreen-swapped-x-y
> -
> -The touchscreen-* properties are documented in touchscreen.txt in
> this
> -directory.
> -
> -Example:
> -
> -	i2c@00000000 {
> -		/* ... */
> -
> -		gt928@5d {
> -			compatible = "goodix,gt928";
> -			reg = <0x5d>;
> -			interrupt-parent = <&gpio>;
> -			interrupts = <0 0>;
> -
> -			irq-gpios = <&gpio1 0 0>;
> -			reset-gpios = <&gpio1 1 0>;
> -		};
> -
> -		/* ... */
> -	};
> diff --git
> a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> new file mode 100644
> index 000000000000..05b52d359ac5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Goodix GT9xx series touchscreen controller Bindings
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt1151
> +      - goodix,gt5663
> +      - goodix,gt5688
> +      - goodix,gt911
> +      - goodix,gt9110
> +      - goodix,gt912
> +      - goodix,gt927
> +      - goodix,gt9271
> +      - goodix,gt928
> +      - goodix,gt967
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  irq-gpios:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  AVDD28-supply:
> +    description: Analog power supply regulator on AVDD28 pin
> +
> +  VDDIO-supply:
> +    description: GPIO power supply regulator on VDDIO pin
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +- |
> +    i2c@00000000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      gt928@5d {
> +        compatible = "goodix,gt928";
> +        reg = <0x5d>;
> +        interrupt-parent = <&gpio>;
> +        interrupts = <0 0>;
> +        irq-gpios = <&gpio1 0 0>;
> +        reset-gpios = <&gpio1 1 0>;
> +      };
> +    };
> +
> +...

