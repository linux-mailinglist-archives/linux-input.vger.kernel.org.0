Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB60320852
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 06:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhBUFEQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 00:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhBUFEP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 00:04:15 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73745C061574;
        Sat, 20 Feb 2021 21:03:35 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id g20so5648104plo.2;
        Sat, 20 Feb 2021 21:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wmAT/nF3hCWs8kL2KPVwpaKoz53MMzn+/0rULS6YBPg=;
        b=lzAfNRJgsr2uvmeK08qKmofZ57utdjQghWgCvRjRdT3YMcAomukF/QecaxpmdMPH5s
         DS0xmkGvqMCFLSzLGvxO2nABMEob4/SHEgAFrAtor7nYPOIlGcY00TuwUQ/ug+gp/YFI
         wzpKuRzQQNQ9zgxHZbnkE0i4+FlCkMrRLQYMzzI0LTEkUmgaCo+IWI54jh/k/Qj2dfRg
         8f7Yqhc9isCO1feZnXfTLDd8o2HWZ0lY01R4xTIiodAQk+vUic0XsuBYUUDhXzjCPlc6
         UoFZhfeRe2dz9lTGGYxyIIPp5evmgCZB8EMRff1swJzoH+5e3bWbqqek40vX+2PuDts2
         HAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wmAT/nF3hCWs8kL2KPVwpaKoz53MMzn+/0rULS6YBPg=;
        b=T73AquB6tvCy4qTIPy+4EI2xk9+g+g7A6b/NQTSOgsICOUHnTRKieU8z6qYCtvN+Wj
         TIfjGgSRNOZxq9Ir/801ivucfpVcS/YQCieHRk2JHdhzoyxadfNOVXJRohI8SS7ZhjvN
         8FqxwFhUjoojJfe5y76kmloitri4MjWX+3nlTVdPsI40pP3VMstT3S78kZvZVJFtTTwg
         QZn/MyyK5zxvG9joftlj+Uf1gQjxVBNGlXMUf2mYtIoV7waBNmB4rMZw/6ggzff+OJFI
         XePq1x4VEq7G2QXz88QMh3povq/rzVJkLvkwgVUVIcnoc1Mxy7732Xr8qggHPiLTMQPD
         TCag==
X-Gm-Message-State: AOAM533QR0e1Slu10xDzjDllMZpNu2KqsnuhuhVcuSdkLuQGvTUJqNYH
        V8CNWd2TEgd0b4+NG/QZ8JnjsCOrgmY=
X-Google-Smtp-Source: ABdhPJxIFWo2ZPCxKf30PInEjgd1AcXcb24sn8AoRGPavL6mafRYuRwCURJM8dS4G2lMunlFocpN9g==
X-Received: by 2002:a17:90a:b28a:: with SMTP id c10mr16801862pjr.39.1613883813688;
        Sat, 20 Feb 2021 21:03:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b993:3e9c:7cd5:5a8e])
        by smtp.gmail.com with ESMTPSA id r189sm14132563pgr.10.2021.02.20.21.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 21:03:32 -0800 (PST)
Date:   Sat, 20 Feb 2021 21:03:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Hung <joe_hung@ilitek.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, luca_hsu@ilitek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Message-ID: <YDHpoReQXjOvEXoH@google.com>
References: <20210218064435.1360483-1-joe_hung@ilitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218064435.1360483-1-joe_hung@ilitek.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Thu, Feb 18, 2021 at 02:44:34PM +0800, Joe Hung wrote:
> Add binding documentation for ILITEK touch devices.
> 
> Signed-off-by: Joe Hung <joe_hung@ilitek.com>
> ---
> Changes in v3:
>   - Add include header in examples, and pass the dt binding check
> 
> Changes in v2:
>   - Convert to DT schema format
>   - Using interrupts instead of irq-gpios
> 
>  .../input/touchscreen/ilitek_ts_i2c.yaml      | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
> new file mode 100644
> index 000000000000..5da9020ed272
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/ilitek_ts_i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek I2C Touchscreen Controller
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ilitek,ili2520
> +      - ilitek,ili2510
> +  reg:
> +    const: 0x41
> +  interrupts:
> +    maxItems: 1
> +  reset-gpios:
> +    maxItems: 1
> +
> +additionalProperties: false

I think you need to make sure that wakeup-source and various
touchscreen-* properties can be used in this binding.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        touchscreen@41 {
> +                compatible = "ilitek,ili2520";
> +                reg = <0x41>;
> +                interrupt-parent = <&gpio1>;
> +                interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +                reset-gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> --
> 2.25.1
> 
> 

Thanks.

-- 
Dmitry
