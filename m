Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF46430096F
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 18:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbhAVP4O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 10:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbhAVPuI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 10:50:08 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FA3C06174A
        for <linux-input@vger.kernel.org>; Fri, 22 Jan 2021 07:49:27 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2yge-0000dL-Aj; Fri, 22 Jan 2021 16:49:24 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1l2ygd-0000WI-Ky; Fri, 22 Jan 2021 16:49:23 +0100
Date:   Fri, 22 Jan 2021 16:49:23 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, alistair23@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] devicetree/bindings: Initial commit of wacom,
 wacom-i2c
Message-ID: <20210122154923.zk3joqgdcmzijr3g@pengutronix.de>
References: <20210121065643.342-1-alistair@alistair23.me>
 <20210121065643.342-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121065643.342-2-alistair@alistair23.me>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:48:46 up 51 days,  5:55, 28 users,  load average: 0.13, 0.08,
 0.04
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

thnaks for the patch.

On 21-01-20 22:56, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../input/touchscreen/wacom,wacom-i2c.yaml    | 44 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +

This should be splitted into two patches.

Regards,
  Marco


>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> new file mode 100644
> index 000000000000..b36d22cd20a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/wacom,wacom-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Wacom I2C Controller
> +
> +maintainers:
> +  - Alistair Francis <alistair@alistair23.me>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: wacom,wacom-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
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
> +    #include "dt-bindings/interrupt-controller/irq.h"
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        digitiser@9 {
> +                compatible = "wacom,wacom-i2c";
> +                reg = <0x9>;
> +                interrupt-parent = <&gpio1>;
> +                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 041ae90b0d8f..5bca22f035a3 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1202,6 +1202,8 @@ patternProperties:
>      description: Vision Optical Technology Co., Ltd.
>    "^vxt,.*":
>      description: VXT Ltd
> +  "^wacom,.*":
> +    description: Wacom Co., Ltd
>    "^wand,.*":
>      description: Wandbord (Technexion)
>    "^waveshare,.*":
> -- 
> 2.29.2
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
