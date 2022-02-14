Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82FB14B5D3A
	for <lists+linux-input@lfdr.de>; Mon, 14 Feb 2022 22:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiBNVtj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 16:49:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbiBNVti (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 16:49:38 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17ECB1954CD
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 13:49:30 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E3EEE3FFE9
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644875368;
        bh=JIs1xiYNpUGWLEtymgYGm7pSCxeAjzoS3yDzGjJPXvE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=v7i+HWzp/SG+jQLd5DXdr1rQI8aPb3l7Oy7QWXEqrhR25RcMQu8a0wjdAWu5G3ySf
         hqTv1Zt9l2nDlnOMbDv64uEyaYZeCZXi08DxEScRP/p+LXWty2NPBrAlZiBQqiToQi
         PM7QhQrVxOJHtvfjqBVOhparCEuiS/z10Uc4QjOLcNLWydCuPW7zpd8GW5eDjxnArl
         S/sjZW+BVt9Zq9B/KFcaJ7jfMqHLNriKTXVU1qM+ZlFNfIIgapNv+aNTdQGd6t0ybK
         hbnc6qfFVo3l7FTQvIih0kA8rdi26Lykd4RgjlSf5XMVkjSM8DjPBHZX7dZAkT5/xx
         Jaa/jBgYx4TRQ==
Received: by mail-wm1-f71.google.com with SMTP id a8-20020a7bc1c8000000b0037bc4c62e97so166799wmj.0
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 13:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JIs1xiYNpUGWLEtymgYGm7pSCxeAjzoS3yDzGjJPXvE=;
        b=s1ELa0+WuewxeZRbmN4M9lY/hidtTfgLqbPt7cW1kSeL6R8VsKlEY84OKuA4nisyfu
         47+1Ygn6kjqiwBSauUJSEC4q/pu8durhrYRfNb8c8sD1WheCB6bMZqnh5hMkYhtO0a3Q
         n9EE8j1FU/0yXXnfY9dveyq4dOm1PkTu29o8g/LPdKZ4yMTVjGhAXxNP+VO+w9jKhDz2
         NGzOW0cnxK1yRI7kolyDwDEAsx77PFXoexsHsl0OhSSo5OMzS1rgyG0dXpGdslMc1D2x
         I6oqVNIVIKy6Y7gtnMCoWnOiB/TwVB17/Nf2Wp1d1QfVKgthFA4KJAoDI0bXWQBsGfXN
         fMnw==
X-Gm-Message-State: AOAM5303+N9BrcDJG6xb+EFoeQf9DMdXj6MUmZiu87hbDwvqNGAyKCiK
        tXWzUjQvSpNuDf0Lp/mi67COMPEYRSdwV0xuaLdCD75qeLarA86Qq7CIbxpi62p15EwjTWjXE38
        U1WixyqQoirCaKenS/orZPSz3eEHq4n2jlw7bBm79
X-Received: by 2002:a05:600c:1c11:: with SMTP id j17mr606091wms.138.1644875368525;
        Mon, 14 Feb 2022 13:49:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKWcCqlvzOjQU6wfJEEKTCLPSGNxu0cNkLUzJsJZwJjpWyaSQuWK0i7UTurbPojjOb5bxVfA==
X-Received: by 2002:a05:600c:1c11:: with SMTP id j17mr606079wms.138.1644875368292;
        Mon, 14 Feb 2022 13:49:28 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id n7sm12982487wmd.30.2022.02.14.13.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 13:49:27 -0800 (PST)
Message-ID: <cf4e21e8-1ba8-a137-6063-00e1cee8e035@canonical.com>
Date:   Mon, 14 Feb 2022 22:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: ps2-gpio: convert binding to json-schema
Content-Language: en-US
To:     Danilo Krummrich <danilokrummrich@dk-develop.de>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org
References: <20220211233137.99624-1-danilokrummrich@dk-develop.de>
 <20220211233137.99624-2-danilokrummrich@dk-develop.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220211233137.99624-2-danilokrummrich@dk-develop.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/02/2022 00:31, Danilo Krummrich wrote:
> Convert the ps2-gpio dt-binding documentation to DT schema format using
> the json-schema.
> 
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
> ---
>  .../devicetree/bindings/serio/ps2-gpio.txt    | 23 --------
>  .../devicetree/bindings/serio/ps2-gpio.yaml   | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serio/ps2-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/serio/ps2-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serio/ps2-gpio.txt b/Documentation/devicetree/bindings/serio/ps2-gpio.txt
> deleted file mode 100644
> index 7b7bc9cdf986..000000000000
> --- a/Documentation/devicetree/bindings/serio/ps2-gpio.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Device-Tree binding for ps/2 gpio device
> -
> -Required properties:
> -	- compatible = "ps2-gpio"
> -	- data-gpios: the data pin
> -	- clk-gpios: the clock pin
> -	- interrupts: Should trigger on the falling edge of the clock line.
> -
> -Optional properties:
> -	- write-enable: Indicates whether write function is provided
> -	to serio device. Possibly providing the write fn will not work, because
> -	of the tough timing requirements.
> -
> -Example nodes:
> -
> -ps2@0 {
> -	compatible = "ps2-gpio";
> -	interrupt-parent = <&gpio>;
> -	interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
> -	data-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
> -	clk-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
> -	write-enable;
> -};
> diff --git a/Documentation/devicetree/bindings/serio/ps2-gpio.yaml b/Documentation/devicetree/bindings/serio/ps2-gpio.yaml
> new file mode 100644
> index 000000000000..ec6fa7b40851
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serio/ps2-gpio.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serio/ps2-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for GPIO based PS/2
> +
> +maintainers:
> +  - Danilo Krummrich <danilokrummrich@dk-develop.de>
> +
> +properties:
> +  compatible:
> +    items:

Hi,

I think you do not expect more compatibles, so skip "items".

> +      - const: ps2-gpio
> +
> +  data-gpios:
> +    description:
> +      the gpio used for the data signal
> +    maxItems: 1
> +
> +  clk-gpios:
> +    description:
> +      the gpio used for the clock signal
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      The given interrupt should trigger on the falling edge of the clock line.
> +    maxItems: 1
> +
> +  write-enable:

This does not look like a standard property. You need "type: boolean".

> +    description:
> +      Indicates whether write function is provided to serio device. Possibly
> +      providing the write function will not work, because of the tough timing
> +      requirements.
> +
> +required:

Also: compatible

> +  - data-gpios
> +  - clk-gpios
> +  - interrupts
> +
> +examples:
> +  - |
> +    ps2@0 {

Does it compile cleanly? You used an unit-address but there is no reg.

> +        compatible = "ps2-gpio";
> +        interrupt-parent = <&gpio>;
> +        interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
> +        data-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
> +        clk-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
> +        write-enable;
> +    };


Best regards,
Krzysztof
