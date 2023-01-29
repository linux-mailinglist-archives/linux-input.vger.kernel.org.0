Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB9067FE64
	for <lists+linux-input@lfdr.de>; Sun, 29 Jan 2023 12:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjA2LFI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Jan 2023 06:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjA2LFH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Jan 2023 06:05:07 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EB118154
        for <linux-input@vger.kernel.org>; Sun, 29 Jan 2023 03:05:05 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l8so6239701wms.3
        for <linux-input@vger.kernel.org>; Sun, 29 Jan 2023 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiVLjupI10W32FN6zRgbjuwHJO2w0ouPGEpHFld4b3I=;
        b=zuTBnIKju0/0f0zz7j0ZG5Thzl4Qs+TylYJYPceRa7+ZsMkiTrDIw6uKCr14JGKEuO
         VAq5wneOk/b7cYS8AHePZIGsS4UzXUBnPbEMtiBAFf9ojQs3q9qSRdEobx8vEPafqMC6
         Ah7crqCRG2Hu2VulKFOi3NoVtOd4gP9MkUVij/lnGj5cUAjOKi/iMxKiwKHlQT/PoKcV
         H7+lwAAKhTsKlBs7iNjL3DIFRVSoe4JbLhVzY5pGSRBs1Egp8oz3GJtGhvm3don84TDQ
         Giq02NCke+pdRVNcq0Ix8SPfY2dd3QxJM+Vg8h0pVk5bSRL3UgaH2v4n7FBbHtfPCyMu
         6IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TiVLjupI10W32FN6zRgbjuwHJO2w0ouPGEpHFld4b3I=;
        b=3XyuJ+/vfi8C83+jWv2VWow5OjdlVs0vZE9vkK3CjfWkNnQ5HQ3C/gAlcMUbUmpgti
         uuDQAOXeeGJKnK33h+YXVQU8d7Bgaj5lqtYru6BTm6p+K6+Qw/DvpjZZkevf1XNsTjQU
         pWw2Qd50Xfb4/j6m+lgHbkl3XR4tprk8onl/626z12RrAj23tMJVNK3ORXa12GEdO07P
         9K/r/J2o/kS9L2IbwFf/+GCNSDhyIRCfgvPw66MbUiUcwAsv7i+DKvN9bLoww6lf8rIP
         Sb8gGCpFG1GIPF8fnTHcE7yrVBmqKDJlJ1uizwULj2i/daSAFOYRfV43RiPCgdYb0RXk
         e8Bw==
X-Gm-Message-State: AFqh2krvoP+Iib8lm6A6PmFKHTf0uckYPO9toYxncnieDAArJ+slyqVp
        b/Vw9x4ihqNUH+hgip4OyoVoXvd5ZUWgTufw
X-Google-Smtp-Source: AMrXdXsWHPRhHdSwpiqdvjTgIRAOKcR+o+BeL3sG9irxD70qzbSvfn8iFkR7OlRMtpIqsccBhra9zA==
X-Received: by 2002:a05:600c:80f:b0:3d2:3d7b:6118 with SMTP id k15-20020a05600c080f00b003d23d7b6118mr45804156wmp.24.1674990303960;
        Sun, 29 Jan 2023 03:05:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v23-20020a05600c4d9700b003cfa81e2eb4sm9577459wmp.38.2023.01.29.03.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 03:05:03 -0800 (PST)
Message-ID: <fa320b2c-5cf5-c10a-ba63-17ccb5c992ad@linaro.org>
Date:   Sun, 29 Jan 2023 12:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] dt-bindings: hid: Add CP2112 HID USB to SMBus Bridge
Content-Language: en-US
To:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
References: <20230128202622.12676-1-kaehndan@gmail.com>
 <20230128202622.12676-2-kaehndan@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128202622.12676-2-kaehndan@gmail.com>
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

On 28/01/2023 21:26, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
Thank you for your patch. There is something to discuss/improve.

> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  .../bindings/hid/silabs,cp2112.yaml           | 82 +++++++++++++++++++

There is no "hid" directory, so I think such devices where going to
different place, didn't they?

>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml b/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
> new file mode 100644
> index 000000000000..49287927c63f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hid/silabs,cp2112.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CP2112 HID USB to SMBus/I2C Bridge
> +
> +maintainers:
> +  - Danny Kaehn <kaehndan@gmail.com>
> +
> +description:
> +  This is a USB HID device which includes an I2C controller and 8 GPIO pins.

s/This is/CP2112 is/

> +  While USB devices typically aren't described in DeviceTree, doing so with the
> +  CP2112 allows use of its i2c and gpio controllers with other DT nodes when
> +  the chip is expected to be found on a USB port.

Drop these three and replace with description of the hardware.

> +
> +properties:
> +  compatible:
> +    const: usb10c4,ea90

So this is an USB device, so I guess they all go to usb?

Missing blank line.

> +  reg:
> +    maxItems: 1
> +    description: The USB port number on the host controller

Blank line

> +  i2c:
> +    $ref: /schemas/i2c/i2c-controller.yaml#

This is not specific enough. What controller is there?

Missing unevaluatedProperties: false, anyway.

> +  gpio:
> +    $ref: /schemas/gpio/gpio.yaml#

Same comments.

> +
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
> +    usb1 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;

Drop, not related.

> +
> +      usb@1 {
> +        compatible = "usb424,2514";
> +        reg = <1>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        device@1 {	/* CP2112 I2C Bridge */
> +          compatible = "usb10c4,ea90";
> +          reg = <1>;
> +
> +          cp2112_i2c0: i2c {

Drop unneeded labels.

> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            /* Child I2C Devices can be described as normal here */
> +            temp@48 {
> +              compatible = "national,lm75";
> +              reg = <0x48>;
> +            };
> +          };
> +
> +          cp2112_gpio0: gpio {
> +            gpio-controller;
> +            interrupt-controller;
> +            #gpio-cells = <2>;
> +            gpio-line-names =
> +              "TEST0",
> +              "TEST1",
> +              "TEST2",
> +              "TEST3",
> +              "TEST4",
> +              "TEST5",
> +              "TEST6",
> +              "TEST7";
> +          };
> +        };
> +      };
> +    };

Best regards,
Krzysztof

