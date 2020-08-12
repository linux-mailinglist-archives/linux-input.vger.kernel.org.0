Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1492C2430EA
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 00:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgHLWjs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Aug 2020 18:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgHLWjs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Aug 2020 18:39:48 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2BAC061383;
        Wed, 12 Aug 2020 15:37:14 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x25so1755754pff.4;
        Wed, 12 Aug 2020 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M0mzyOw7T8Q1fOZrcOZc/fxVuVoJEqZckDUmqWvlGa0=;
        b=TZbiQ0EQZICBMmk6NGhb7VxPKZRs3HtXD+j4Ubk5CWG1QmywURlI+Wzc9vaTGIhB/M
         HIJnXe+HmLEUw3FMSzEJJp1YPass1Rf5lN4/yrguecl/epXEqF9xkgHOWbV7UBVIX8pC
         OX86kiv+kNHVhdNC3teOoGXnm0bRGlviA+VQqE6BU+x7QoomUPGP9T6LCWFU20MmLnRf
         pxfdUDuYnhKADovbKSp/LzgL4ruSl9j0WQvoFigxbcU6OsdqK4uP8Kt0ud7RHajmYvYZ
         0GTxHcNpSF9euS59CcHVdhNv+v/xcOElOtgGpS3AYEwy2RTeQHpBV0VXRsLzvdW9At/G
         r5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M0mzyOw7T8Q1fOZrcOZc/fxVuVoJEqZckDUmqWvlGa0=;
        b=f0xMpcMmzW0MWNte5EwV6Jv8ayU5o662qWYz2+oT9MjtpdPNe6f2IVYmKu+Xxpw/17
         FVyMaiIdcgDnp16mvYc8sp2YqI6Mcvkrtpg+eIqZKcXBZHcRAITbx7p2Q4HQwqzVkdg3
         T0bNocH2vSmQ3TiOmtWf7yOfwTQHN+HARRzhd0yVMjdXgrOk+4vgZQkVLy1hPQNBtIWf
         uly1nwCecxtzKGIYrspOy0E+hndQ3r8QrxgKfEHsqvdau80u9aexWFXSdYEv1yzsMTlQ
         Dz0w+FdLWSSqAMiaRErCOtHuyT1i/S4S6Vzud9LJSQkHW7oMUclUVVJ0K85xQu/hLzVL
         gH0Q==
X-Gm-Message-State: AOAM533Qn1jnl65zbu0avLEVoqbZvH3ygVM4G1rmD4qAQZCHOdas9BKK
        e3WWEnc8arkqIZUYDTrJrGE=
X-Google-Smtp-Source: ABdhPJy0Qr3vqJ++ena8fqbf5oBYsMHzL5MsqDW2HMeKTs13ehBPvCjo/9PjLs8r0sTBQMThjU8GnQ==
X-Received: by 2002:aa7:9f1b:: with SMTP id g27mr1548294pfr.215.1597271833977;
        Wed, 12 Aug 2020 15:37:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s6sm3361321pfb.50.2020.08.12.15.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:37:13 -0700 (PDT)
Date:   Wed, 12 Aug 2020 15:37:11 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fengping Yu <fengping.yu@mediatek.com>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
Message-ID: <20200812223711.GT1665100@dtor-ws>
References: <20200810064058.6467-1-fengping.yu@mediatek.com>
 <20200810064058.6467-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810064058.6467-2-fengping.yu@mediatek.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Aug 10, 2020 at 02:40:57PM +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch add devicetree bindings for Mediatek matrix keypad driver.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.yaml    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> new file mode 100644
> index 000000000000..d74dd8a6fbde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +version: 1
> +
> +$id: http://devicetree.org/schemas/input/mtk-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek's Keypad Controller device tree bindings
> +
> +maintainer:
> +  - Fengping Yu <fengping.yu@mediatek.com>
> +
> +description: |
> +  Mediatek's Keypad controller is used to interface a SoC with a matrix-type
> +  keypad device. The keypad controller supports multiple row and column lines.
> +  A key can be placed at each intersection of a unique row and a unique column.
> +  The keypad controller can sense a key-press and key-release and report the
> +  event using a interrupt to the cpu.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: "mediatek,mt6779-keypad"
> +      - const: "mediatek,mt6873-keypad"
> +
> +  clock-names:
> +    description: Names of the clocks listed in clocks property in the same order
> +    maxItems: 1
> +    items:
> +    	- const: kpd
> +
> +  clocks:
> +    description: Must contain one entry, for the module clock
> +    refs: devicetree/bindings/clocks/clock-bindings.txt for details.
> +
> +  interrupts:
> +    description: A single interrupt specifier
> +    maxItems: 1
> +
> +  linux,keymap:
> +    description: The keymap for keys as described in the binding document
> +    refs: devicetree/bindings/input/matrix-keymap.txt
> +    minItems: 1
> +
> +  reg:
> +    description: The base address of the Keypad register bank
> +    maxItems: 1
> +
> +  wakeup-source:
> +    description: use any event on keypad as wakeup event
> +    type: boolean
> +
> +  keypad,num-columns:
> +    description: Number of column lines connected to the keypad controller,
> +    it is not equal to PCB columns number, instead you should add required value
> +    for each IC. If not specified, the default value is 1.

What sets the default? matrix_keymap_parse_properties() will error out
if either property is not present....

> +
> +  keypad,num-rows:
> +    description: Number of row lines connected to the keypad controller, it is
> +    not equal to PCB rows number, instead you should add required value for each IC.
> +    If not specified, the default value is 1.
> +
> +  mediatek,debounce-us:
> +    description: Debounce interval in microseconds, if not specified, the default
> +    value is 16000
> +    maximum: 256000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - linux,keymap
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +
> +  kp@10010000 {
> +    compatible = "mediatek,mt6779-keypad";

Should we call the driver mt6779-keypad ?

> +    reg = <0 0x10010000 0 0x1000>;
> +    linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
> +    interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
> +    clocks = <&clk26m>;
> +    clock-names = "kpd";
> +  };
> -- 
> 2.18.0

Thanks.

-- 
Dmitry
