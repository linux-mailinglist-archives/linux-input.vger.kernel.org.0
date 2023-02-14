Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF16697221
	for <lists+linux-input@lfdr.de>; Wed, 15 Feb 2023 00:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjBNXxZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Feb 2023 18:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjBNXxY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Feb 2023 18:53:24 -0500
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D9983F8;
        Tue, 14 Feb 2023 15:53:23 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id o1so6485380ioo.10;
        Tue, 14 Feb 2023 15:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGLPHLPfRvOaYFTkFGj8OsIU5Yo/8b+0A5z0Cx47UN4=;
        b=xk2yp76/1o9toPVGOwJB+Ommcp7K8aDtEKc34g7UlUG8wldhoS2+s5AdXX6Sw108T0
         iRYVTuYlJOj1N77byEd9YRyrGxrUNpMytibInxC5ilPoIl8jc4qsJyac36wpXGOCfhd5
         rYsSgkDtd6NS3ev1TYx9IuZKzezzNHP3rK+UeaIrD5fi1w2XKq1vZr5WShp4Q304ig6s
         VHa/FxQUWs9VUQGOQIIhDEBDxt69lNDWVt0q7kc52uv/BnGG0gwpUxCk2QOOooWMG3Ct
         1CweddgltyY+g6K0V8Toss/otrphfe2HylQt9gl9yS8y4asggPYqruCDh84bzr2J9cHG
         7mig==
X-Gm-Message-State: AO0yUKU/+fw3UxyR0APm+HIWQ3eWXPNGAYNyCkQW+2nY91XEu4Cd04xa
        tm17UQ6bi83vu5xLoxNURg==
X-Google-Smtp-Source: AK7set/Li8aYPqZx69Mm1aIAUgsvYHZBw6JONoQ2/5FXs+0bEqk2nIfKfsG5E4c6niRL/jOuCHmDAQ==
X-Received: by 2002:a5d:8b5a:0:b0:735:99fa:e3bb with SMTP id c26-20020a5d8b5a000000b0073599fae3bbmr464671iot.10.1676418803101;
        Tue, 14 Feb 2023 15:53:23 -0800 (PST)
Received: from robh_at_kernel.org ([65.158.198.5])
        by smtp.gmail.com with ESMTPSA id d22-20020a02a496000000b00375783003fcsm5046238jam.136.2023.02.14.15.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 15:53:22 -0800 (PST)
Received: (nullmailer pid 50043 invoked by uid 1000);
        Tue, 14 Feb 2023 23:53:21 -0000
Date:   Tue, 14 Feb 2023 17:53:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bartosz.golaszewski@linaro.org,
        andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v5 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <20230214235321.GA45531-robh@kernel.org>
References: <20230210223638.12796-1-kaehndan@gmail.com>
 <20230210223638.12796-2-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210223638.12796-2-kaehndan@gmail.com>
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 10, 2023 at 04:36:36PM -0600, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> new file mode 100644
> index 000000000000..81eda01ebda5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
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
> +
> +    properties:
> +      sda-gpios:
> +        maxItems: 1
> +
> +      scl-gpios:
> +        maxItems: 1
> +
> +      clock-frequency:
> +        minimum: 10000
> +        default: 100000
> +        maximum: 400000
> +
> +  gpio:
> +    description: The GPIO controller node for the CP2112
> +    type: object
> +    unevaluatedProperties: false
> +
> +    properties:
> +      interrupt-controller: true
> +      "#interrupt-cells":
> +        const: 2
> +
> +      gpio-controller: true
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-line-names:
> +        minItems: 1
> +        maxItems: 8
> +
> +    patternProperties:
> +      "^(.+-hog(-[0-9]+)?)$":

This can be simplified to: '-hog(-[0-9]+)?$'

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
