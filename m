Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F8A1DA2DD
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 22:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgESUiP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 16:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgESUiP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 16:38:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF32C08C5C0;
        Tue, 19 May 2020 13:38:15 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 8B9612A2039
Subject: Re: [PATCHv2 1/5] dt-bindings: touchscreen: Convert EETI EXC3000
 touchscreen to json-schema
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20200519182447.73405-1-sebastian.reichel@collabora.com>
 <20200519182447.73405-2-sebastian.reichel@collabora.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <b52144ad-3123-5705-9489-1bf6994f462f@collabora.com>
Date:   Tue, 19 May 2020 22:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519182447.73405-2-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastian,

A minor thing.

On 19/5/20 20:24, Sebastian Reichel wrote:
> Convert the EETI EXC3000 binding to DT schema format using json-schema
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/input/touchscreen/exc3000.txt    | 26 ---------
>  .../bindings/input/touchscreen/exc3000.yaml   | 53 +++++++++++++++++++

The binding name should start with the vendor, aka eeti,exc3000.yaml

>  2 files changed, 53 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> deleted file mode 100644
> index 68291b94fec2..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -* EETI EXC3000 Multiple Touch Controller
> -
> -Required properties:
> -- compatible: must be "eeti,exc3000"
> -- reg: i2c slave address
> -- interrupts: touch controller interrupt
> -- touchscreen-size-x: See touchscreen.txt
> -- touchscreen-size-y: See touchscreen.txt
> -
> -Optional properties:
> -- touchscreen-inverted-x: See touchscreen.txt
> -- touchscreen-inverted-y: See touchscreen.txt
> -- touchscreen-swapped-x-y: See touchscreen.txt
> -
> -Example:
> -
> -	touchscreen@2a {
> -		compatible = "eeti,exc3000";
> -		reg = <0x2a>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> -		touchscreen-size-x = <4096>;
> -		touchscreen-size-y = <4096>;
> -		touchscreen-inverted-x;
> -		touchscreen-swapped-x-y;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
> new file mode 100644
> index 000000000000..5d2e7496d6dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/exc3000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EETI EXC3000 series touchscreen controller
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: eeti,exc3000
> +  reg:
> +    const: 0x2a
> +  interrupts:
> +    maxItems: 1
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/interrupt-controller/irq.h"
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        touchscreen@2a {
> +                compatible = "eeti,exc3000";
> +                reg = <0x2a>;
> +                interrupt-parent = <&gpio1>;
> +                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +                touchscreen-size-x = <4096>;
> +                touchscreen-size-y = <4096>;
> +                touchscreen-inverted-x;
> +                touchscreen-swapped-x-y;
> +        };
> +    };
> 
