Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2113E1EA100
	for <lists+linux-input@lfdr.de>; Mon,  1 Jun 2020 11:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbgFAJch (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jun 2020 05:32:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:28148 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbgFAJch (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Jun 2020 05:32:37 -0400
IronPort-SDR: ysZSCcUlU8uxigWQK6glvPiMIA/iQrKQFOrbbFzetgf9053pzqLB+pOdaTbwlhd/H72sPxIdmf
 H0ZURQC4BPHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 02:32:37 -0700
IronPort-SDR: nTif1mTtkHi87XZiGU70czwtX/SDkyvcmgJrttLqVCTKcoabc4BmuzI7P5TPPZVdLGzswEnEVZ
 hKGv+W/ALVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; 
   d="scan'208";a="470229744"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2020 02:32:34 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jfgo9-00AC72-GP; Mon, 01 Jun 2020 12:32:37 +0300
Date:   Mon, 1 Jun 2020 12:32:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Fengping Yu <fengping.yu@mediatek.com>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v13 1/3] dt-bindings: Add keypad devicetree documentation
Message-ID: <20200601093237.GB2428291@smile.fi.intel.com>
References: <20200601022548.18213-1-fengping.yu@mediatek.com>
 <20200601022548.18213-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601022548.18213-2-fengping.yu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 01, 2020 at 10:25:47AM +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> Add Mediatek matrix keypad dt-bindings doc as yaml schema.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I didn't review this.

> ---
>  .../devicetree/bindings/input/mtk-kpd.yaml    | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> new file mode 100644
> index 000000000000..586cd196dd00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> @@ -0,0 +1,95 @@
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
> +    maxItems: 16
> +
> +  pinctrl-0:
> +    description: Specify pin control groups used for this controller
> +    refs: devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +
> +  pinctrl-names:
> +    description: Names for optional pin modes
> +    maxItems: 1
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
> +    for each IC
> +
> +  keypad,num-rows:
> +    description: Number of row lines connected to the keypad controller, it is
> +    not equal to PCB rows number, instead you should add required value for each IC
> +
> +  mediatek,debounce-us:
> +    description: Debounce interval in microseconds
> +    maximum: 256000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - linux,keymap
> +  - pinctrl
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +
> +  keypad: kp@10010000 {
> +    compatible = "mediatek,mt6779-keypad";
> +    reg = <0 0x10010000 0 0x1000>;
> +    linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
> +    interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
> +    clocks = <&clk26m>;
> +    clock-names = "kpd";
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&kpd_gpios_def_cfg>;
> +  };
> -- 
> 2.18.0

-- 
With Best Regards,
Andy Shevchenko


