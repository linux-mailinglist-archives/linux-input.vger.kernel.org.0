Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D863D1F9E7E
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 19:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729894AbgFORb7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 13:31:59 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37432 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbgFORb7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 13:31:59 -0400
Received: by mail-io1-f67.google.com with SMTP id r2so307673ioo.4;
        Mon, 15 Jun 2020 10:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l7CxLkTZyFjGvXTayzBNklewzd13q2JvFcKMk7C/FVo=;
        b=mOdB1a6ZYPatCxHxMdkNho+O9i4XLrUW3l6ubak1h9iNas+dlzcE2sDEibmLrxTD0o
         VG/rTTle8ZMWEkhQL/2n2m8oroIjSVT4Qbce+HTbKb7i3rjauWRWTvHIqOvfiXPRyTor
         EJXsVTkKrYUaBEI4cfB2B3kT5zOOtfse+mKYI2f1vjHQwWcvnQYyi87K16TNl8PhqtUq
         QQ15n33C/XTaCCBN5Y80SUEcY77OVt/+NpG5UTmkhxHyGvX/Elm4jRZxsp3JMbmgSjfU
         zUxfa6Rto2gadyRbcZ0HexMSKaOH4GWA29WpCAek9o0aM/Wuyp+E5aXibA7GpkXLJdAG
         X0sA==
X-Gm-Message-State: AOAM531JTf9m1A2NQlwDkLX9qiDmLzjtJ5lcDxHmuK/3LiwKdEQDrOjX
        3Y3TWSTG8yoKDzOEL3m1Bw==
X-Google-Smtp-Source: ABdhPJwhPLxwKGqwn+CxKhSRc+rrr/Ldt7bWE9QK9zxBtR6Pv5hjfN6xot/Ll2WA9gkGIimBCgOKAg==
X-Received: by 2002:a5e:8305:: with SMTP id x5mr28189275iom.47.1592242318025;
        Mon, 15 Jun 2020 10:31:58 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id a10sm8321063ilb.31.2020.06.15.10.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:31:57 -0700 (PDT)
Received: (nullmailer pid 2002134 invoked by uid 1000);
        Mon, 15 Jun 2020 17:31:56 -0000
Date:   Mon, 15 Jun 2020 11:31:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gnuiyl@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] dt-bindings: input: Convert imx keypad to json-schema
Message-ID: <20200615173156.GA1996893@bogus>
References: <1591253001-6497-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591253001-6497-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 04, 2020 at 02:43:21PM +0800, Anson Huang wrote:
> Convert the i.MX KEYPAD binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/input/imx-keypad.txt       | 53 -------------
>  .../devicetree/bindings/input/imx-keypad.yaml      | 89 ++++++++++++++++++++++
>  2 files changed, 89 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/imx-keypad.txt
>  create mode 100644 Documentation/devicetree/bindings/input/imx-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/imx-keypad.txt b/Documentation/devicetree/bindings/input/imx-keypad.txt
> deleted file mode 100644
> index 2ebaf7d..0000000
> --- a/Documentation/devicetree/bindings/input/imx-keypad.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* Freescale i.MX Keypad Port(KPP) device tree bindings
> -
> -The KPP is designed to interface with a keypad matrix with 2-point contact
> -or 3-point contact keys. The KPP is designed to simplify the software task
> -of scanning a keypad matrix. The KPP is capable of detecting, debouncing,
> -and decoding one or multiple keys pressed simultaneously on a keypad.
> -
> -Required SoC Specific Properties:
> -- compatible: Should be "fsl,<soc>-kpp".
> -
> -- reg: Physical base address of the KPP and length of memory mapped
> -  region.
> -
> -- interrupts: The KPP interrupt number to the CPU(s).
> -
> -- clocks: The clock provided by the SoC to the KPP. Some SoCs use dummy
> -clock(The clock for the KPP is provided by the SoCs automatically).
> -
> -Required Board Specific Properties:
> -- pinctrl-names: The definition can be found at
> -pinctrl/pinctrl-bindings.txt.
> -
> -- pinctrl-0: The definition can be found at
> -pinctrl/pinctrl-bindings.txt.
> -
> -- linux,keymap: The definition can be found at
> -bindings/input/matrix-keymap.txt.
> -
> -Example:
> -kpp: kpp@73f94000 {
> -	compatible = "fsl,imx51-kpp", "fsl,imx21-kpp";
> -	reg = <0x73f94000 0x4000>;
> -	interrupts = <60>;
> -	clocks = <&clks 0>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_kpp_1>;
> -	linux,keymap = <0x00000067	/* KEY_UP */
> -			0x0001006c	/* KEY_DOWN */
> -			0x00020072	/* KEY_VOLUMEDOWN */
> -			0x00030066	/* KEY_HOME */
> -			0x0100006a	/* KEY_RIGHT */
> -			0x01010069	/* KEY_LEFT */
> -			0x0102001c	/* KEY_ENTER */
> -			0x01030073	/* KEY_VOLUMEUP */
> -			0x02000040	/* KEY_F6 */
> -			0x02010042	/* KEY_F8 */
> -			0x02020043	/* KEY_F9 */
> -			0x02030044	/* KEY_F10 */
> -			0x0300003b	/* KEY_F1 */
> -			0x0301003c	/* KEY_F2 */
> -			0x0302003d	/* KEY_F3 */
> -			0x03030074>;	/* KEY_POWER */
> -};
> diff --git a/Documentation/devicetree/bindings/input/imx-keypad.yaml b/Documentation/devicetree/bindings/input/imx-keypad.yaml
> new file mode 100644
> index 0000000..a1350cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/imx-keypad.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/imx-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX Keypad Port(KPP) device tree bindings
> +
> +maintainers:
> +  - Liu Ying <gnuiyl@gmail.com>
> +
> +description: |
> +  The KPP is designed to interface with a keypad matrix with 2-point contact
> +  or 3-point contact keys. The KPP is designed to simplify the software task
> +  of scanning a keypad matrix. The KPP is capable of detecting, debouncing,
> +  and decoding one or multiple keys pressed simultaneously on a keypad.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx21-kpp
> +      - items:
> +          - enum:
> +            - fsl,imx25-kpp
> +            - fsl,imx27-kpp
> +            - fsl,imx31-kpp
> +            - fsl,imx35-kpp
> +            - fsl,imx51-kpp
> +            - fsl,imx53-kpp
> +            - fsl,imx50-kpp
> +            - fsl,imx6q-kpp
> +            - fsl,imx6sx-kpp
> +            - fsl,imx6sl-kpp
> +            - fsl,imx6sll-kpp
> +            - fsl,imx6ul-kpp
> +            - fsl,imx7d-kpp
> +          - const: fsl,imx21-kpp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  linux,keymap:
> +    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> +    description: |
> +      An array of packed 1-cell entries containing the equivalent of row,
> +      column and linux key-code. The 32-bit big endian cell is packed as:
> +      row << 24 | column << 16 | key-code

Can you please convert matrix-keymap.txt to a schema first and then 
include in here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - linux,keymap
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    keypad@73f94000 {
> +        compatible = "fsl,imx51-kpp", "fsl,imx21-kpp";
> +        reg = <0x73f94000 0x4000>;
> +        interrupts = <60>;
> +        clocks = <&clks 0>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_kpp_1>;
> +        linux,keymap = <0x00000067	/* KEY_UP */
> +                        0x0001006c	/* KEY_DOWN */
> +                        0x00020072	/* KEY_VOLUMEDOWN */
> +                        0x00030066	/* KEY_HOME */
> +                        0x0100006a	/* KEY_RIGHT */
> +                        0x01010069	/* KEY_LEFT */
> +                        0x0102001c	/* KEY_ENTER */
> +                        0x01030073	/* KEY_VOLUMEUP */
> +                        0x02000040	/* KEY_F6 */
> +                        0x02010042	/* KEY_F8 */
> +                        0x02020043	/* KEY_F9 */
> +                        0x02030044	/* KEY_F10 */
> +                        0x0300003b	/* KEY_F1 */
> +                        0x0301003c	/* KEY_F2 */
> +                        0x0302003d	/* KEY_F3 */
> +                        0x03030074>;	/* KEY_POWER */
> +    };
> -- 
> 2.7.4
> 
