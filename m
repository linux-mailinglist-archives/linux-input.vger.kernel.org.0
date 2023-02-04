Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A601568A9A0
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 12:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbjBDLTp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Feb 2023 06:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjBDLTo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Feb 2023 06:19:44 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF57233476
        for <linux-input@vger.kernel.org>; Sat,  4 Feb 2023 03:19:42 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so5610095wms.1
        for <linux-input@vger.kernel.org>; Sat, 04 Feb 2023 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFLVmJs14hLKoOKK4RzzAgFSVlGJPyQOH8cvPR5VmRs=;
        b=Sp7/JmWNtxvZcDbrZBcfcfddXobLIB0bVVZzH+aOSatmt98a29P0/SfkclaZJA6sD2
         JsQn72xkg1mY1gfDw39mUHtgjdvSPZkjE852mcZn8HQCjPHJNAuksa5NvqmptxCiTS3M
         YAGVWAksyOPYB/Bnsy+d14GpH5bmj+kBl4YZAaMFWkfJE6mEZrTZWg5ACGKttAeQ8a0d
         0WffaO3iCcMQnDPztToBKcnXSzNSipOE9vh5PmN34FdBO8ZtUprUKhNwBOFrTqPIocTz
         2lGTIsXh3v5yjScqkXS5qS6RYmz24aQrXRfMA/yBuffpn8vfZm/zH4CH1CPAWTZUA/rS
         NZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFLVmJs14hLKoOKK4RzzAgFSVlGJPyQOH8cvPR5VmRs=;
        b=07w1ZsLu3jUGOX+ecnnmz0aT5Ba7mVKXW8AT8yHyxtlz7IZETrxp8Q4dVrKJ01H2fq
         YnhI1CJzZfWFE7mrWGSsXx2ovJ/SSNoQFUlmf1uL84v2uPe6BC4m2qk2BLiADV6w+IL4
         8o0GFjpDYnnvGGZOmw0uwmVe8Dz+lINvRNaWBMKHjhEsKq3zVGsdUebcnO8mqMvnObz6
         bDsZCWxe3iCQ3nJmQySwU4etrbgQtsBKk5XgwohFOYcmFFKbGX7jbj3/51BlLK9JEb3u
         Afs/GL8S6EK2hUwJ1F503KvKeSZRgveAqlhfqQ7eYf2sZV4zJ/jfOi0aeFvtl9cOR9qu
         weOA==
X-Gm-Message-State: AO0yUKU6eQBUPbq1rAOoe7dEkDD7IHTxX5hOhqfvxdUeZ+Sl84QPsRcr
        PZ14Knn+AB5Dv87vLRePIi1nPg==
X-Google-Smtp-Source: AK7set9Kt3F+Gz5pT3PPlmhLg+4qMG3Ad83crwSJ/O2TO4V9r5iKRMnlZN9tFP33bVtDhjiaJa8DDw==
X-Received: by 2002:a05:600c:a41:b0:3dc:5b79:2dbb with SMTP id c1-20020a05600c0a4100b003dc5b792dbbmr12950113wmq.25.1675509581506;
        Sat, 04 Feb 2023 03:19:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c4f0800b003dec22de1b1sm5840305wmq.10.2023.02.04.03.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 03:19:41 -0800 (PST)
Message-ID: <5fa90015-9125-8bc0-9fc3-1460433be6c4@linaro.org>
Date:   Sat, 4 Feb 2023 12:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] dt-bindings: input: Add CP2112 HID USB to SMBus
 Bridge
Content-Language: en-US
To:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
References: <20230204044313.364-1-kaehndan@gmail.com>
 <20230204044313.364-2-kaehndan@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230204044313.364-2-kaehndan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 04/02/2023 05:43, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  .../bindings/input/silabs,cp2112.yaml         | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/silabs,cp2112.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/silabs,cp2112.yaml b/Documentation/devicetree/bindings/input/silabs,cp2112.yaml
> new file mode 100644
> index 000000000000..a8d7f8aea6c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/silabs,cp2112.yaml
> @@ -0,0 +1,114 @@
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

on this level: unevaluatedProperties: false

> +
> +    properties:
> +      clock-frequency:
> +        minimum: 10000
> +        default: 100000
> +        maximum: 400000
> +
> +  gpio:
> +    description: The GPIO controller node for the CP2112
> +    $ref: /schemas/gpio/gpio.yaml#

Drop it, it's always selected.

> +
> +    properties:
> +      interrupt-controller: true
> +      '#interrupt-cells':
> +        const: 2
> +
> +      gpio-controller: true
> +      "#gpio-cells":

Keep consistent quotes - either ' or "

> +        const: 2
> +
> +      ngpios:
> +        const: 8
> +
> +    patternProperties:
> +      "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +        type: object
> +        properties:
> +          gpio-hog: true
> +          gpios: true

minItems: 1
maxItems: 8

> +          input: true
> +          output-high: true
> +          output-low: true
> +          line-name: true
> +
> +        required:
> +          - gpio-hog
> +          - gpios
> +
> +        additionalProperties: false
> +
> +    unevaluatedProperties: false
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
> +          gpio-line-names =
> +            "TEST0",

Don't break it - should be with gpio-line-names. Align the rest of entries.

> +            "TEST1",
> +            "TEST2",
> +            "TEST3",
> +            "TEST4",
> +            "TEST5",
> +            "TEST6",
> +            "TEST7";
> +        };
> +      };
> +    };

Best regards,
Krzysztof

