Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2AB768C3D3
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 17:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjBFQvm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 11:51:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjBFQvj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 11:51:39 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8A414EBB;
        Mon,  6 Feb 2023 08:51:19 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id e21-20020a9d5615000000b006884e5dce99so3356744oti.5;
        Mon, 06 Feb 2023 08:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJjfaqQN07abmVZHr04x6j/pMfkMAkZRYidyFnb67BQ=;
        b=VA8+6u1wlMlC43nBAEknGT7Kn86z+9gUDaU4CFhmPsE7EfA+1Y4IUFX9neSCTXXokh
         V5J3UBxmTBFsuI6z2VHLeKaxXSgGFU3r9GSskrEqmF4x11rTtTvRjwKN5yuvibVw/eZ2
         gz8SbWb6C2k8Os3KFQdss8nFTc0KxMmE/kSQtQFhAgLFcOAMYnIEgvwHktqZC7mhzzro
         rlwP4cH3kEq3EoNAGzxSXeMq0d1HJ2gmFH0RynU09e7jKnvpD98DihtbGzyzIRvkC2Dl
         PrlZqp0ODlfGYog2ziZZC6RP5ReuW9xfa1XYHZGhTYXwFUdIfZW+PwOhi3bHcEWXS7h7
         lUDA==
X-Gm-Message-State: AO0yUKXeac0xtM2/cEM8BUO5jAQ72RxAXjmqyFqswfj3OBCOImSpCFtn
        0vAJSkRI9TnTczvU6n071A==
X-Google-Smtp-Source: AK7set9UFjLHrrtdIPxXFwDrC3Co4bVmsVQ8HFpyab0PSxoNOaqTv8RzB9oA1/XFZNcOEP8Fx7ajoA==
X-Received: by 2002:a05:6830:3903:b0:68b:cdd3:3b93 with SMTP id br3-20020a056830390300b0068bcdd33b93mr94004otb.26.1675702261490;
        Mon, 06 Feb 2023 08:51:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q21-20020a9d6555000000b0068bd922a244sm5206293otl.20.2023.02.06.08.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 08:51:01 -0800 (PST)
Received: (nullmailer pid 213128 invoked by uid 1000);
        Mon, 06 Feb 2023 16:51:00 -0000
Date:   Mon, 6 Feb 2023 10:51:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: Re: [PATCH v3 1/4] dt-bindings: input: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <20230206165100.GB182582-robh@kernel.org>
References: <20230205145450.3396-1-kaehndan@gmail.com>
 <20230205145450.3396-2-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205145450.3396-2-kaehndan@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Feb 05, 2023 at 08:54:47AM -0600, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  .../bindings/input/silabs,cp2112.yaml         | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/silabs,cp2112.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/silabs,cp2112.yaml b/Documentation/devicetree/bindings/input/silabs,cp2112.yaml
> new file mode 100644
> index 000000000000..eb2e89edb80a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/silabs,cp2112.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/silabs,cp2112.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CP2112 HID USB to SMBus/I2C Bridge
> +
> +maintainers:
> +  - Danny Kaehn <kaehndan@gmail.com>
> +
> +description:
> +  The CP2112 is a USB HID device which includes an integrated I2C controller
> +  and 8 GPIO pins. Its GPIO pins can each be configured as inputs, open-drain
> +  outputs, or push-pull outputs.
> +
> +properties:
> +  compatible:
> +    const: usb10c4,ea90
> +
> +  reg:
> +    maxItems: 1
> +    description: The USB port number on the host controller
> +
> +  i2c:
> +    description: The SMBus/I2C controller node for the CP2112
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      clock-frequency:
> +        minimum: 10000
> +        default: 100000
> +        maximum: 400000
> +
> +  gpio:
> +    description: The GPIO controller node for the CP2112
> +    type: object
> +    properties:
> +      interrupt-controller: true
> +      "#interrupt-cells":
> +        const: 2
> +
> +      gpio-controller: true
> +      "#gpio-cells":
> +        const: 2
> +
> +      ngpios:
> +        const: 8

If this can only be 1 value, then it doesn't need to be in DT.

> +
> +      gpio-line-names:
> +        minItems: 1
> +        maxItems: 8
> +
> +    patternProperties:
> +      "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":

Pick one naming scheme, not everything we allow.

> +        type: object
> +        properties:
> +          gpio-hog: true
> +          input: true
> +          output-high: true
> +          output-low: true
> +          line-name: true
> +          gpios:
> +            minItems: 1
> +            maxItems: 8
> +
> +        required:
> +          - gpio-hog
> +          - gpios
> +
> +        additionalProperties: false

You shouldn't need all this for the hog nodes, just need the following 
and the common schema will check the rest:

required:
  - gpio-hog 

> +
> +    unevaluatedProperties: false

Move this above 'properties'. Easier to read rather than after 
a long indented block.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    usb {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      device@1 {
> +        compatible = "usb10c4,ea90";
> +        reg = <1>;
> +
> +        i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          temp@48 {
> +            compatible = "national,lm75";
> +            reg = <0x48>;
> +          };
> +        };
> +
> +        gpio {
> +          gpio-controller;
> +          interrupt-controller;
> +          #gpio-cells = <2>;
> +          gpio-line-names = "TEST0", "TEST1", "TEST2",
> +            "TEST3", "TEST4", "TEST5", "TEST6", "TEST7";

Put a hog to test the schema.

> +        };
> +      };
> +    };
> -- 
> 2.25.1
> 
