Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446103A86ED
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 18:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhFOQ4w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 12:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhFOQ4u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 12:56:50 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C63EC061574;
        Tue, 15 Jun 2021 09:54:45 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t9so11960912pgn.4;
        Tue, 15 Jun 2021 09:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t+MsHSWU7/eZbP0pqC9Vw3lLovz0oSCfu0wvrSX6ByU=;
        b=usWHGeCvTWYGMHfQCxgoj7eecX7Kmcr8286wVHz6C1bMTD2VrK38AMgFXnMUlydd17
         qFe86W2GMsLGTFyBExpUWtW7iWi/JEhL+X7FbPXq58dycwp2xO7CuAS+b6VTR/qGlIL4
         WLSHK6IFvfQC+NeWMcMSfS1QCtHDRHEM2FP2ye0gVi+OqmQ39R0EMS2E9W3i2TlH7Viq
         G2AnfjaE4pndBYQA83ZfFtj0ObkzxHJkSKVrwDW8dgqChtDDKEkbkmaoqCdPz+kUlj7M
         +ofW7RrqSEzjjfV68Wk4J84ttZTGabsviSC2n3NqgNqW1RPcphUN3t1mz/8fklTfturY
         eu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t+MsHSWU7/eZbP0pqC9Vw3lLovz0oSCfu0wvrSX6ByU=;
        b=qFH+xcat5kzj2yj3CQNE3GBQM3LK/Lc7SdKKJs7EYzj4vok/6CVHFSu215xe6zA22S
         Cnu+yf4c0mRPcX7KBSPGfHcLkfhJLPU0a1WxGlvS+iUrryGPMtRC2DrUHeusol6Lmk3X
         vpRtRpCMocsa7jQcFyIpgpb4UGpeVKC3wSGB7xG6h1nv88ie66UUX04apPSrFDUNXVYm
         sKF+d9qx/LI/XqHsm9/xawPOTeo59aRRjFvkPv4j2c+N1mUPyxrZJb54nOMWtWkULrZh
         lY+BoFfnj2y/EFdRPg9nxyzwGhcHV6qKflta9nVGhpDCJaoxvnOBU5SGKxZP/J09h9wj
         UyRg==
X-Gm-Message-State: AOAM532wQ/WJy+jMwHIfdwx/WR/FJvTUs2S6UuSBfA7FhGhwQhlRgQMf
        +5b3ek+TqFsv7vBBJLEl1AY=
X-Google-Smtp-Source: ABdhPJx62u4spQV+1V0HB5r7UbdLYLgpurPwrym1JVccRTXhftZOBUGw3oE1suD7usVaBA2OTNM5RA==
X-Received: by 2002:aa7:949d:0:b029:2ef:d1ca:ddd3 with SMTP id z29-20020aa7949d0000b02902efd1caddd3mr5237151pfk.39.1623776084808;
        Tue, 15 Jun 2021 09:54:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2a26:15ba:dc71:c4ba])
        by smtp.gmail.com with ESMTPSA id 92sm3045898pjo.28.2021.06.15.09.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:54:43 -0700 (PDT)
Date:   Tue, 15 Jun 2021 09:54:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        pinglinux@gmail.com, tatsunosuke.tobita@wacom.com,
        junkpainting@gmail.com, ping.cheng@wacom.com,
        linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 2/9] dt-bindings: touchscreen: Initial commit of
 wacom,generic
Message-ID: <YMjbUQLT+HMfO77+@google.com>
References: <20210615103014.798-1-alistair@alistair23.me>
 <20210615103014.798-3-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615103014.798-3-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Tue, Jun 15, 2021 at 08:30:07PM +1000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Please also send DT bindings to Rob Herring <robh+dt@kernel.org> and
devicetree@vger.kernel.org.

> ---
>  .../input/touchscreen/wacom,generic.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
> new file mode 100644
> index 000000000000..68f3f5271b77
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
> +
> +properties:
> +  compatible:
> +    const: wacom,generic

This is not an acceptable DT compatible. This needs to be a particular
model of the controller, preferably the first one that supports this
protocol.

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
> +
> +examples:
> +  - |
> +    #include "dt-bindings/interrupt-controller/irq.h"
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        digitiser@9 {
> +                compatible = "wacom,generic";
> +                reg = <0x9>;
> +                interrupt-parent = <&gpio1>;
> +                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +                vdd-supply = <&reg_touch>;
> +        };
> +    };
> -- 
> 2.31.1
> 

Thanks.

-- 
Dmitry
