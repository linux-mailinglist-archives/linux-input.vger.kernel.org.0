Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710603AAC74
	for <lists+linux-input@lfdr.de>; Thu, 17 Jun 2021 08:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhFQGhW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Jun 2021 02:37:22 -0400
Received: from mout01.posteo.de ([185.67.36.65]:53817 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229616AbhFQGhW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Jun 2021 02:37:22 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 890A0240029
        for <linux-input@vger.kernel.org>; Thu, 17 Jun 2021 08:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1623911713; bh=Rix5p6l8HyutxEZr8GYcwxQSpTiMNmdvzeXhAkc/AME=;
        h=Subject:From:To:Cc:Date:From;
        b=EDrws93aNSb3qb7Jqr9jusfmok/e8fMoF1w3EZxbPb2GkEZX1M25vIywS6S3FU2Xu
         XU+aoAdXmDkTu+yat+MZs/fvr4WzW09v0AtGxR4U6fbLrzXRCAun6M+0InOk4jkbad
         oIQj+r7UqADZF35h7x8z3qP0gSpveEGmKhvUOy6joYx+hisZ9TU4tF/bh2QY6Vn+7c
         8ceDwYY+qBs4YM7PoyiPHCy51XUgLysjwkd181r0vDcqFP4aB5DUudHVYnyfmTOhbr
         nbwXtR7rgp3/W5ohzO0cb1O2r2G4Zi65KAaY1nlSS1rpfhUoXQGCDifWzH2yEr+suQ
         qRK+vjnn45PYw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4G5C3N2bGNz6tm9;
        Thu, 17 Jun 2021 08:35:12 +0200 (CEST)
Message-ID: <4765dc6042a4c9fad7c33ffde9e802bcbace6282.camel@posteo.de>
Subject: Re: [PATCH] dt-bindings: input: touchscreen: st1232: Convert to
 json-schema
From:   Martin Kepplinger <martink@posteo.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bastian Hecht <hechtb@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Date:   Thu, 17 Jun 2021 06:35:02 +0000
In-Reply-To: <fbba650cff07780c28ad6dd8dbef5cc1451b7762.1623418065.git.geert+renesas@glider.be>
References: <fbba650cff07780c28ad6dd8dbef5cc1451b7762.1623418065.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Freitag, dem 11.06.2021 um 15:30 +0200 schrieb Geert Uytterhoeven:
> Convert the Sitronix st1232/st1633 touchscreen controller Device Tree
> binding documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../input/touchscreen/sitronix,st1232.yaml    | 50
> +++++++++++++++++++
>  .../input/touchscreen/sitronix-st1232.txt     | 28 -----------
>  2 files changed, 50 insertions(+), 28 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.y
> aml
>  delete mode 100644
> Documentation/devicetree/bindings/input/touchscreen/sitronix-
> st1232.txt
> 
> diff --git
> a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232
> .yaml
> b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232
> .yaml
> new file mode 100644
> index 0000000000000000..1d8ca19fd37ae3fc
> --- /dev/null
> +++
> b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232
> .yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id:
> http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix st1232 or st1633 touchscreen controller
> +
> +maintainers:
> +  - Bastian Hecht <hechtb@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sitronix,st1232
> +      - sitronix,st1633
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpios:
> +    description: A phandle to the reset GPIO
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            touchscreen@55 {
> +                    compatible = "sitronix,st1232";
> +                    reg = <0x55>;
> +                    interrupts = <2 0>;
> +                    gpios = <&gpio1 166 0>;
> +            };
> +    };
> diff --git
> a/Documentation/devicetree/bindings/input/touchscreen/sitronix-
> st1232.txt
> b/Documentation/devicetree/bindings/input/touchscreen/sitronix-
> st1232.txt
> deleted file mode 100644
> index 019373253b28c08c..0000000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/sitronix-
> st1232.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Sitronix st1232 or st1633 touchscreen controller
> -
> -Required properties:
> -- compatible: must contain one of
> -  * "sitronix,st1232"
> -  * "sitronix,st1633"
> -- reg: I2C address of the chip
> -- interrupts: interrupt to which the chip is connected
> -
> -Optional properties:
> -- gpios: a phandle to the reset GPIO
> -
> -For additional optional properties see: touchscreen.txt
> -
> -Example:
> -
> -       i2c@00000000 {
> -               /* ... */
> -
> -               touchscreen@55 {
> -                       compatible = "sitronix,st1232";
> -                       reg = <0x55>;
> -                       interrupts = <2 0>;
> -                       gpios = <&gpio1 166 0>;
> -               };
> -
> -               /* ... */
> -       };

Acked-by: Martin Kepplinger <martink@posteo.de>

thank you!

