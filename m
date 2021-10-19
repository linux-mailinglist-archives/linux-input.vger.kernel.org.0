Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6C44340C5
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 23:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhJSVuW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 17:50:22 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:46928 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhJSVuV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 17:50:21 -0400
Received: by mail-ot1-f51.google.com with SMTP id x27-20020a9d459b000000b0055303520cc4so5806932ote.13;
        Tue, 19 Oct 2021 14:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kk4JJaI2+ZWVHR3qmBOUQ3+Cwe87UzzcR1lA2qLxmoE=;
        b=vLFAGpGoJLr+GvvEx6TDADCp5EX8QqHxF8E253gxJetcWQYLQXGaUqpx1sNmOJ690J
         iMVZcYr1BfwBiSS+110bJW1oCD+mBeak5KUeQbjB6fQR9O0fYXNEI7Eok7Iuu9V76CEd
         zb8d314+l5wThSk171TPDotWofXx2g7HCcKINYCsTzn1TBmxONw07ahkAT3rkeH3zEyM
         zqmqPR1ivWQ6YONUPF93E6qXLxlCqfqKdsPv4ifcbK4Gqm4kMoAVn98geYoCZD3OyLkb
         07RhEQd5cDkpHsRpyHSUCzHgprMtSiVkzjoyE/DcHdJMT//Q8cKzPf8KeiyAI27Z30lf
         OTZw==
X-Gm-Message-State: AOAM533Z8Z7upOJHUOV80eVNctdGePxbq0rU95v+BtVNns579V/Vl7ox
        jr4+3Ru6+0pzQ0zwerQrUw==
X-Google-Smtp-Source: ABdhPJyLHMnAFjhQ49+4BKJZb8Nmp39Xuf6bIEmlKF5GpgwCyCrQ6Ozd2pKV6vqMWY7kJMF6kIjhPg==
X-Received: by 2002:a05:6830:19c2:: with SMTP id p2mr7486872otp.27.1634680088305;
        Tue, 19 Oct 2021 14:48:08 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-67-78-118-34.sw.biz.rr.com. [67.78.118.34])
        by smtp.gmail.com with ESMTPSA id i18sm66516oot.27.2021.10.19.14.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:48:07 -0700 (PDT)
Received: (nullmailer pid 897146 invoked by uid 1000);
        Tue, 19 Oct 2021 21:48:05 -0000
Date:   Tue, 19 Oct 2021 16:48:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: input: mcs-touchkey: Convert txt bindings
 to yaml
Message-ID: <YW89FX52NQNBzQ/2@robh.at.kernel.org>
References: <20211009104837.46626-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009104837.46626-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 09, 2021 at 12:48:37PM +0200, David Heidelberg wrote:
> Convert MELFAS MCS-5000 touchscreen controller chip documentation to the YAML format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/mcs-touchkey.txt           | 26 ---------
>  .../bindings/input/mcs-touchkey.yaml          | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/mcs-touchkey.txt

I don't have this file in my tree.

>  create mode 100644 Documentation/devicetree/bindings/input/mcs-touchkey.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mcs-touchkey.txt b/Documentation/devicetree/bindings/input/mcs-touchkey.txt
> deleted file mode 100644
> index 545454112a43..000000000000
> --- a/Documentation/devicetree/bindings/input/mcs-touchkey.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -* mcs_touchkey MELFAS MCS5000/5080 controller
> -
> -Required properties:
> -- compatible: must be "mcs5000_touchkey" or "mcs5080_touchkey"
> -- reg : I2C address of the chip
> -- interrupts: interrupt to which the chop is connected
> -- key_maxval: size of keycode table
> -- interrupts: interrupt to which the chip is connected
> -- code: key code for this device
> -
> -Example:
> -
> -	i2c_touch_key: i2c-gpio-0 {
> -	       /* ... */
> -
> -	       touch_key@20 {
> -		       compatible = "mcs5080_touchkey";
> -		       reg = <0x20>;
> -		       interrupt-patrent = <gpj0>;
> -		       key_maxval = <2>;
> -		       linux, code = <0x0000009e
> -			              0x000000a9>;
> -	       };
> -
> -	       /* ... */
> -	};
> diff --git a/Documentation/devicetree/bindings/input/mcs-touchkey.yaml b/Documentation/devicetree/bindings/input/mcs-touchkey.yaml
> new file mode 100644
> index 000000000000..b56de0361ff8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mcs-touchkey.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/mcs-touchkey.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MELFAS MCS5000/5080 controller
> +
> +maintainers:
> +  - Rob Herring <robh+dt@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mcs5000_touchkey
> +      - mcs5080_touchkey
> +
> +  reg: true
> +  interrupts: true
> +  key_maxval:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: size of keycode table
> +
> +  linux,code:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: key code for this device
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - linux,code
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/tegra-gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c_touch_key: i2c-gpio-0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      melfas-touchkey@20 {
> +        compatible = "mcs5080_touchkey";
> +        reg = <0x20>;
> +        interrupt-parent = <&gpio>;
> +        interrupts = <TEGRA_GPIO(Q, 4) IRQ_TYPE_EDGE_FALLING>;
> +        key_maxval = <4>;
> +        linux,code = <139 102 158 217>;
> +      };
> +    };
> -- 
> 2.33.0
> 
> 
