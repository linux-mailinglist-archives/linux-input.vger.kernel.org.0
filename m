Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D696512C5E
	for <lists+linux-input@lfdr.de>; Thu, 28 Apr 2022 09:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244911AbiD1HLS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Apr 2022 03:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbiD1HLK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Apr 2022 03:11:10 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0137C9918E
        for <linux-input@vger.kernel.org>; Thu, 28 Apr 2022 00:07:56 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id b24so4413363edu.10
        for <linux-input@vger.kernel.org>; Thu, 28 Apr 2022 00:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mcc+I6jnZJRrJEbVP21ywHq/ZmNTJKsMTD4hOUbWzcQ=;
        b=hdH/3Kn8LZJ9CZjwIV7q4nqr/u4C7YR3WZCoXTP2SUOi3rvc350zdKbD5g8PUCg5PV
         cAvCzZdHGm5mop3PsfnIkcgZB6OV0VbPhGLYGuMAzjh6EnZRiEh3FK00dEBYvD4ewstY
         pTVGPN9MuUqJZdT3hreOn3HtL71fwDce1Xqdn8aFnGGL13y1C7e2cZNIxgcMm+wWgBEp
         3B/z+CvQ6wLL8vgj4pN27IUy67Dm4m5ef054PZUz4iKmJ0JdJdI50R6eazdrq3sn17En
         XCPLtOP5NFTNcizGfie2qRIkLex0565lsCnJXZpsTb1tm+LxSRcNmq6Tr0biS6m2jy8O
         qOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mcc+I6jnZJRrJEbVP21ywHq/ZmNTJKsMTD4hOUbWzcQ=;
        b=AtYkCvkIPz2P7ZE2/Tb9A5y4So8Q21HyDOCC2/HoG69Tw6PMpLF8c91Sv0pzXg4jdX
         CqKB02E8kr0Yxtc3o/Scrf+m0vvZJOPWCfHVIiPH/+2VmOASLq+hU38StTCMZUWV+7f2
         XrB1Yk+qGQh7nWbDbAxVSfknYDhB5sfMqJMZeAnAYZnZpniMuGfAc1FekvXHQoeEjmfw
         30u2fYwfCt6NDVpWM8ER34GllV/DSYmScofc3iYNLDUeMSRsCmqAUW5XC+6eC65qxOej
         HNHPNLb653da56NGmUToioADcWA6wYW+GjN/XAba1zPW4ZNpiEfGU9ceQ4+g5qoXkUSQ
         brwg==
X-Gm-Message-State: AOAM532Y0VM4BFL6sztatDpAcquUD/mhmqwA1eS+pobZT5+wrnIuXqmg
        W47aXrBisfVrIS4yuTilYUK8Mw==
X-Google-Smtp-Source: ABdhPJzqV0BQAJAyMiRYK4ZZ6ZDJEEcrxGgGzR26K+hw/8vfsIJLkEbCTmebsN6SqWLC7nNbrBiyZA==
X-Received: by 2002:a05:6402:3553:b0:426:2b19:a4b0 with SMTP id f19-20020a056402355300b004262b19a4b0mr1438296edd.66.1651129674531;
        Thu, 28 Apr 2022 00:07:54 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bm6-20020a170906c04600b006e89a5f5b8fsm8014191ejb.153.2022.04.28.00.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 00:07:54 -0700 (PDT)
Message-ID: <55574426-df20-cdd7-c97d-092726981a42@linaro.org>
Date:   Thu, 28 Apr 2022 09:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/11] dt-bindings: serio: add Arm PL050 DT schema
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-6-andre.przywara@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427112528.4097815-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27/04/2022 13:25, Andre Przywara wrote:
> The Arm PL050 "Keyboard/Mouse Interface" is an Arm system IP providing a
> PS/2 compatible serial interface.
> 
> Add a simple DT schema binding, based on the TRM[1], the existing DTs and
> the Linux driver.
> 
> [1] https://developer.arm.com/documentation/ddi0143/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/serio/amba-pl050.yaml | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serio/amba-pl050.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serio/amba-pl050.yaml b/Documentation/devicetree/bindings/serio/amba-pl050.yaml
> new file mode 100644
> index 0000000000000..9732a84550098
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serio/amba-pl050.yaml

Filename: vendor,device

> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serio/amba-pl050.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Ltd. PrimeCell PL050 PS/2 Keyboard/Mouse Interface
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +description:
> +  The Arm PrimeCell PS2 Keyboard/Mouse Interface (KMI) is an AMBA compliant
> +  peripheral that can be used to implement a keyboard or mouse interface that
> +  is IBM PS2 or AT compatible.
> +
> +# We need a select here so we don't match all nodes with 'arm,primecell'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: arm,pl050
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: arm,pl050
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: KMI reference clock, used to generate the bus timing
> +      - description: APB register access clock
> +
> +  clock-names:
> +    items:
> +      - const: KMIREFCLK

lowercase letters only

> +      - const: apb_pclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    kmi@70000 {

Generic node names, so "serio".

> +            compatible = "arm,pl050", "arm,primecell";
> +            reg = <0x070000 0x1000>;
> +            interrupts = <8>;
> +            clocks = <&mb_clk24mhz>, <&soc_smc50mhz>;
> +            clock-names = "KMIREFCLK", "apb_pclk";
> +    };
> +
> +...


Best regards,
Krzysztof
