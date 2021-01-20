Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D912FC799
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 03:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbhATCQH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 21:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728558AbhATCP4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 21:15:56 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EB1C061575;
        Tue, 19 Jan 2021 18:15:16 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id b3so13565317pft.3;
        Tue, 19 Jan 2021 18:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t86zOVCwWzgu4PWQKZEkmVCHJX5AIPz+A3Um47DZWOw=;
        b=vNVDIc+e4UbO1gRMzm9W6dfBHVfwFeyLdI3uHKdXJW9K5PfRYV7iLqetgd3CQSIykq
         Z1jiYXZfJelriFV/cNJIbJCh53mPCKfs0R7cArAFM6wh/KDsltLkMfj2+4oC1vwLHpGL
         ytjEEiI5QgPJLspo48SNG67rzkApTlDHZXci2PRP7U2ULWiqrr9/XEehs/iqP7q3v9ZH
         Hx4lQgcT8dVwaJuWN802fUZjACw238p7LcP0Cy4yDYjbOiah+3s5yxmcq24mLs04ULU7
         iWENf8pkpX8fst2v2lntVSpoEcwITi4FhzNfMkbJozhcj4XVVwXBTD9URjyDNk0XJDmU
         VQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t86zOVCwWzgu4PWQKZEkmVCHJX5AIPz+A3Um47DZWOw=;
        b=CHAkAf05rM/M98CafZiz6Ij+hLw2siVC0s6k1iBFVJZhPzIUZY1VBCjEdsHU5s1jNk
         tUgaNeefRcTMuXIgSGOoRWMzMkYeFER9HlH7Z17wE0xrsGgNJ5JZ8+1X2w94t89GiMj8
         hW6FEIytEArt3wJHpGO/zIxm5nChWkuJDHqvVVtPIIR5YSQbbYsaEJsFKIJToaWqTXxt
         QrTcEm3qpcQ2nkS6WXWSd++I0KCpFrikvHc3SUwCo3u9KTlz3SAQQpQI/Ob42EbSF82Y
         j/qQqjEr5yTmERXgAloswmozeyAqq8RtPaNkLwcEtOyd7VcZUyZvg6OVYD3lioXtdWTD
         hgMg==
X-Gm-Message-State: AOAM533npj9LNV0Vl+4L6MG29o/4o/ZJhAy0Ttqzu3yWBIWtFOQFtXck
        idLwX55BIdUXA3jhAPhld48=
X-Google-Smtp-Source: ABdhPJzp6qEbuaVQ9fNJQM6Kg+zEeajRQN8Xf3fzZtJl6H7OGa6TXgoNwqOKEGCUNEE+xmUDZoXH7Q==
X-Received: by 2002:a63:2cc5:: with SMTP id s188mr7227921pgs.233.1611108915860;
        Tue, 19 Jan 2021 18:15:15 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id bk18sm242844pjb.41.2021.01.19.18.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 18:15:14 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:15:11 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH 1/3] devicetree/bindings: Initial commit of
 wacom,wacom-i2c
Message-ID: <YAeSL1PSo0vn7E/5@google.com>
References: <20210117042428.1497-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210117042428.1497-1-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Sat, Jan 16, 2021 at 08:24:26PM -0800, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../input/touchscreen/wacom,wacom-i2c.yaml    | 55 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> new file mode 100644
> index 000000000000..6b0e0034f836
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml
> @@ -0,0 +1,55 @@
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
> +  flip-tilt-x:
> +  flip-tilt-y:

Does the device support tilt? The driver does not, at least at the
moment. Also, does it make sense to flip tilt but not position?

> +  flip-pos-x:
> +  flip-pos-y:

This needs to use standard touchscreen properties. See
Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

> +  flip-distance:

I am having trouble understanding when this one would be useful.

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
> +                flip-tilt-x;
> +                flip-tilt-y;
> +                flip-pos-x;
> +                flip-pos-y;
> +                flip-distance;
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

Thanks.

-- 
Dmitry
