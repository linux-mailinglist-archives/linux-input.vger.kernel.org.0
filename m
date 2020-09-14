Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E5826843C
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 07:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgINFuZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 01:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgINFuY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 01:50:24 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8494DC06174A;
        Sun, 13 Sep 2020 22:50:40 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k15so11642023pfc.12;
        Sun, 13 Sep 2020 22:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SfP9QlXY9kgf1Z03tIPvju6GkCXCl3Lw/jAZiIByEus=;
        b=Scr91ke5PNeqlCWlVRyR2/HwCg5iv5/moRuDN2o7KPyyCX32e6J+1OguqMIBzd/VlN
         IqvCrv97oG8uCV6YzIhz/1DHocH729WeIx/E8rm0e4Ej5yx2zUCtewg0B8/DKnDMAWsR
         MgpkE1kXsn1ooRyixMPrJchBysVQFoA2iABre26Hj3RDECxT1DAZuI6+2eNuwUa3Lna+
         CTgXCPzkeHmPCQ2XHayvaqKkzT+yJUllRCOmfG+OQ/5UEhITfr3Kv717PrAsHa5T7tS+
         ilnYN5Q97/88503chkr66QiJc6b8vfrsWZs+STy7zs3bW8a8mV1SSZP8dDjszmRWVbwh
         z+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SfP9QlXY9kgf1Z03tIPvju6GkCXCl3Lw/jAZiIByEus=;
        b=aWnN81PoKMFbkAgVoV2R2p/7+/p7nBXJo+DMHPxvVzq/HcbLg7uU/umm+koPQ6BZs0
         nlbF7e7i/YdHTYcF2AYQbQvmSbH1M0ZSB3H73Z2W3wusBHIiSfiKtuBInDvvnLOiM5+G
         KmAVG76WCYTFU4cKk9utLdRAO2K3Wl9bosaY0P6zrWwQ2O25QCCzZhl5f8xL6E7C5rJs
         wPGINzNCXk4g1U4QAu339xC8GICelZO0YFdVHiSZtbW8mz/MH+in298Z3g38ZEVbbEDN
         slZMjTKa1lK/DbU1YC6mFjJuPh9hbJFvz1GYfsYdESXwkJAdlwg9W0vaeeKl8cLlVn5S
         gPwQ==
X-Gm-Message-State: AOAM533UuxrtEzBm+vt08Bn/7UCaFjaht8wOSummQvGf48zoJq04w1uh
        Qea8fWUJrnjqcuihCfuD3sf+GcS0tjM=
X-Google-Smtp-Source: ABdhPJzgldZCikLcCzokpFL4t5oOWqnDrHO2PdTuwRdclF2oNKQOlCTagPqQ5RKBiuYNlHNudnDiEA==
X-Received: by 2002:a17:902:7c96:: with SMTP id y22mr9044677pll.68.1600062639912;
        Sun, 13 Sep 2020 22:50:39 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z7sm3917406pgc.35.2020.09.13.22.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 22:50:38 -0700 (PDT)
Date:   Sun, 13 Sep 2020 22:50:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v18 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
Message-ID: <20200914055036.GI1665100@dtor-ws>
References: <20200909072159.14888-1-fengping.yu@mediatek.com>
 <20200909072159.14888-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909072159.14888-2-fengping.yu@mediatek.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

On Wed, Sep 09, 2020 at 03:21:58PM +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch add devicetree bindings for Mediatek matrix keypad driver.

I am generally happy with the driver itself, do you have any concerns
with the binding?

Thanks!

> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.yaml    | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> new file mode 100644
> index 000000000000..eda2c6efbfbf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> @@ -0,0 +1,83 @@
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
> +    description: Number of column lines connected to the keypad controller.
> +
> +  keypad,num-rows:
> +    description: Number of row lines connected to the keypad controller.
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
> +    compatible = "mediatek,kp";
> +    reg = <0 0x10010000 0 0x1000>;
> +    linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
> +    interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
> +    clocks = <&clk26m>;
> +    clock-names = "kpd";
> +  };
> -- 
> 2.18.0

-- 
Dmitry
