Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAB3150639
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 13:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgBCMfo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 07:35:44 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39356 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgBCMfn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Feb 2020 07:35:43 -0500
Received: by mail-wm1-f67.google.com with SMTP id c84so16814720wme.4;
        Mon, 03 Feb 2020 04:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xXa4goUYYVZ0ZTHIzT0gn35b1DItXYVERf7wIcsGJf0=;
        b=ufMDYop+TWcrUN5PJd7NvZEDF5imwwCAcqgeKMjaCZuFdd66qX+Py1aT1qsFGdWccg
         QN3jOvqajxFN59FrILXDscF2/igHsccRMMLopBqCk0fpNFoqbvNETD5dhrccXI0l66WK
         HxUtoUoB1JcFewc27XM9b8VoAxIjSg7S7Uv4gL6ChOL+SHS/ZVOnwmP/+eJORPOudrF2
         qf3ZOe0iG/TnSmuptCcTu89BQhBeucy5hCGK7BgWRjqF8a9rFkiMEiCFdKodFTrwKX4x
         2MgR4/BbqKCMfPVt9aGmY0q9+NpN8wQ5yUIZl7/0ZdFIFgBWM8ZoltrKsR1eDOYhmW/8
         dLrQ==
X-Gm-Message-State: APjAAAXhDne6CN4aje+JUA7gC1jWEuPpLujs0YvXcg3EZqOlRFyck/bQ
        zrzjYWIV7ZkB8zvodrj0E5Hv5p6txA==
X-Google-Smtp-Source: APXvYqwD7AkEk5EzolooJ7Or0i+TDQW2CUQRuKKaGWjXnRMaB//sjvTWOKVzvrjd6RQlRKk18jSjOw==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr30280639wme.133.1580733341113;
        Mon, 03 Feb 2020 04:35:41 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id l29sm1804725wrb.64.2020.02.03.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 04:35:40 -0800 (PST)
Received: (nullmailer pid 14680 invoked by uid 1000);
        Mon, 03 Feb 2020 12:35:39 -0000
Date:   Mon, 3 Feb 2020 12:35:39 +0000
From:   Rob Herring <robh@kernel.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        mark.rutland@arm.com, bleung@chromium.org,
        enric.balletbo@collabora.com, groeck@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com
Subject: Re: [PATCH v2] dt-bindings: convert cros-ec-keyb.txt to yaml
Message-ID: <20200203123539.GA26961@bogus>
References: <20200124104158.5008-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124104158.5008-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 24, 2020 at 11:41:58AM +0100, Dafna Hirschfeld wrote:
> Convert the binding file cros-ec-keyb.txt to yaml format.
> 
> This was tested and verified on ARM and ARM64 with:
> 
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> Changes from v1:
> add: "additionalProperties: false"
> 
>  .../bindings/input/cros-ec-keyb.txt           |  72 ------------
>  .../bindings/input/cros-ec-keyb.yaml          | 107 ++++++++++++++++++
>  2 files changed, 107 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/cros-ec-keyb.txt
>  create mode 100644 Documentation/devicetree/bindings/input/cros-ec-keyb.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/input/cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
> new file mode 100644
> index 000000000000..d414a2ad7c69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/cros-ec-keyb.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/cros-ec-keyb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS EC Keyboard
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +  - Rob Herring <robh+dt@kernel.org>

Again, should be a Google/Cros person (I'm assuming Dmitry is here as 
input maintainer). 

> +
> +description: |
> +  Google's ChromeOS EC Keyboard is a simple matrix keyboard implemented on
> +  a separate EC (Embedded Controller) device. It provides a message for reading
> +  key scans from the EC. These are then converted into keycodes for processing
> +  by the kernel. This binding is based on matrix-keymap.txt and extends it.
> +
> +properties:
> +  compatible:
> +    const: google,cros-ec-keyb
> +
> +  google,needs-ghost-filter:
> +    type: boolean
> +    description: |
> +      True to enable a ghost filter for the matrix keyboard.
> +      This is recommended if the EC does not have its own logic or
> +      hardware for this.
> +
> +  # properties from matrix-keymap.txt
> +  linux,keymap:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      an array of packed 1-cell entries containing the equivalent
> +      of row, column and linux key-code. The 32-bit big endian cell is packed
> +      as:
> +      row << 24 | column << 16 | key-code
> +
> +  keypad,num-rows:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of row lines connected to the keypad controller.
> +
> +  keypad,num-columns:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of column lines connected to the keypad controller.

matrix-keypad.txt should be converted to yaml and then referenced here.

Unless you have max sizes, then there's not any more to add here.

> +
> +required:
> +  - compatible
> +  - linux,keymap
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cros-ec-keyb {
> +        compatible = "google,cros-ec-keyb";
> +        keypad,num-rows = <8>;
> +        keypad,num-columns = <13>;
> +        google,needs-ghost-filter;
> +        /*
> +         * Keymap entries take the form of 0xRRCCKKKK where
> +         * RR=Row CC=Column KKKK=Key Code
> +         * The values below are for a US keyboard layout and
> +         * are taken from the Linux driver. Note that the
> +         * 102ND key is not used for US keyboards.
> +         */
> +        linux,keymap = <
> +                /* CAPSLCK F1         B          F10     */
> +                0x0001003a 0x0002003b 0x00030030 0x00040044
> +                /* N       =          R_ALT      ESC     */
> +                0x00060031 0x0008000d 0x000a0064 0x01010001
> +                /* F4      G          F7         H       */
> +                0x0102003e 0x01030022 0x01040041 0x01060023
> +                /* '       F9         BKSPACE    L_CTRL  */
> +                0x01080028 0x01090043 0x010b000e 0x0200001d
> +                /* TAB     F3         T          F6      */
> +                0x0201000f 0x0202003d 0x02030014 0x02040040
> +                /* ]       Y          102ND      [       */
> +                0x0205001b 0x02060015 0x02070056 0x0208001a
> +                /* F8      GRAVE      F2         5       */
> +                0x02090042 0x03010029 0x0302003c 0x03030006
> +                /* F5      6          -          \       */
> +                0x0304003f 0x03060007 0x0308000c 0x030b002b
> +                /* R_CTRL  A          D          F       */
> +                0x04000061 0x0401001e 0x04020020 0x04030021
> +                /* S       K          J          ;       */
> +                0x0404001f 0x04050025 0x04060024 0x04080027
> +                /* L       ENTER      Z          C       */
> +                0x04090026 0x040b001c 0x0501002c 0x0502002e
> +                /* V       X          ,          M       */
> +                0x0503002f 0x0504002d 0x05050033 0x05060032
> +                /* L_SHIFT /          .          SPACE   */
> +                0x0507002a 0x05080035 0x05090034 0x050B0039
> +                /* 1       3          4          2       */
> +                0x06010002 0x06020004 0x06030005 0x06040003
> +                /* 8       7          0          9       */
> +                0x06050009 0x06060008 0x0608000b 0x0609000a
> +                /* L_ALT   DOWN       RIGHT      Q       */
> +                0x060a0038 0x060b006c 0x060c006a 0x07010010
> +                /* E       R          W          I       */
> +                0x07020012 0x07030013 0x07040011 0x07050017
> +                /* U       R_SHIFT    P          O       */
> +                0x07060016 0x07070036 0x07080019 0x07090018
> +                /* UP      LEFT    */
> +                0x070b0067 0x070c0069>;
> +    };
> +...
> -- 
> 2.17.1
> 
