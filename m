Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7C23C61C6
	for <lists+linux-input@lfdr.de>; Mon, 12 Jul 2021 19:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhGLRYM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jul 2021 13:24:12 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:37518 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235514AbhGLRYL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jul 2021 13:24:11 -0400
Received: by mail-io1-f51.google.com with SMTP id l18so18654973iow.4;
        Mon, 12 Jul 2021 10:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=po5Mrb+fjJQ2Xn5LewDjFuCzmgPRfNYcYqBaBw+bAEI=;
        b=UDN0L6oXuFupvyZt5i8DgIYJAkjcsbeu/HR9wEPJwZpyhmotJkeplP7r2P/wgmG4ex
         R+RRMI36ySvYHid2eIdk5FPqODBPB0Ok1Imy8RHKbSvJJIww5MHRzkp7vN4kAYBfQs01
         0trW3fMv++MjS7ru1pZfSoM+vzRP1v7MLYhgnpTLvszRRaUpbC/BiYnUD1FOSkpN60+s
         twyCogLnM1K5jJHu9y37S+tGi3587jOK+1hZVrI2ZlrmbJbk9cqPpzCaM905b0gR4kRm
         GrVNNCWwgvpVl+NFyR8TmEULp33HUEGlUjzoosqd+06By00QB7QYoMk8Afk+vQGR6a+Z
         pMFg==
X-Gm-Message-State: AOAM533LZ2S6IyjdPodZeRBKOqauM9Rh4KdAxlHlJcLGOtlovvLksVzs
        XEVk56xiIhK0bC+V4d4eWw==
X-Google-Smtp-Source: ABdhPJw0K3bLJnLUad1dDRzKcmvCLK2WB8ZmWMg9QqX77L909j5Xy50vEAUVr847MaDWxAzlmcMKgA==
X-Received: by 2002:a5d:8198:: with SMTP id u24mr4396ion.81.1626110482359;
        Mon, 12 Jul 2021 10:21:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b21sm3872375iot.35.2021.07.12.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 10:21:21 -0700 (PDT)
Received: (nullmailer pid 2141274 invoked by uid 1000);
        Mon, 12 Jul 2021 17:21:16 -0000
Date:   Mon, 12 Jul 2021 11:21:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com, linux-kernel@vger.kernel.org,
        alistair23@gmail.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/9] dt-bindings: touchscreen: Initial commit of
 wacom,i2c
Message-ID: <20210712172116.GA2137814@robh.at.kernel.org>
References: <20210708115853.281-1-alistair@alistair23.me>
 <20210708115853.281-3-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708115853.281-3-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 08, 2021 at 09:58:46PM +1000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../input/touchscreen/wacom,generic.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> new file mode 100644
> index 000000000000..48c611d63bd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/wacom,generic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Wacom I2C Controller
> +
> +maintainers:
> +  - Alistair Francis <alistair@alistair23.me>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#

If you use properties from here...

> +
> +properties:
> +  compatible:
> +    const: wacom,i2c-30
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Power Supply
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false

then this needs to be 'unevaluatedProperties: false' instead. 

> +
> +examples:
> +  - |
> +    #include "dt-bindings/interrupt-controller/irq.h"
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        digitiser@9 {
> +                compatible = "wacom,i2c-30";
> +                reg = <0x9>;
> +                interrupt-parent = <&gpio1>;
> +                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +                vdd-supply = <&reg_touch>;
> +        };
> +    };
> -- 
> 2.31.1
> 
> 
