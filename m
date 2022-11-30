Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3CD63D96C
	for <lists+linux-input@lfdr.de>; Wed, 30 Nov 2022 16:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiK3P3I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Nov 2022 10:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiK3P3H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Nov 2022 10:29:07 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710034F1B5
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 07:29:05 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id r133-20020a1c448b000000b003d076ee89d6so644542wma.0
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 07:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eQCpZrxqU0ZqG/1E2Wjcht6dOxw6xUsArEFbqi/+8ts=;
        b=0Dp90JwB/2ZIk2gWx0KqZMnNZC0AKQJWM5ZOueXBESuy8E3RzZLvr95qNZdP3WBMmp
         Dmy0CXN0YTD2jRyay0+Y/AQZQQppBhuIfFOF6BarptLwkA3i/OVnie9x6A11L3QmbgqC
         V7GjZsSjRdrjSZtwmApAUuNZOYoj4qs2D5/FOuG3PMBYC+8mzkoVDTBqb9n03GtHLjsp
         d5YpDl+QUOBdcsLBsUs/3FXWkKDJXyuOXwuAbdNuoupH7CW86z+SbtAf7ylFn7mQrevB
         4xlVD2izJVlJ/zwqD5I3DyaEpmtosMJgPjLpZqo0GA80Ea3szFrTHAH4wfTcelToOT3G
         9SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQCpZrxqU0ZqG/1E2Wjcht6dOxw6xUsArEFbqi/+8ts=;
        b=U0ys70I28gXudQ/VwryL01AOwCeaSbTkS7Rn8r0YAOEk+yvAdFSzmEf24+ukZxP4aT
         m8sAAlfNygvhvScf47fFdyjCQyEeNXLdjy++tntKmarorWjbfsYP3R+hK98WwCF9Z129
         Ayjq2bvhN8wHIgBuLfLW5hBZPOyNyIOdZYSnI/UuE8MLHropsskML64k9z9vVmWXVGGJ
         HRBjW41o3K0I8EJVRVJXiZF8NJXJeZ389bOC1RnkJDK8jrJYMRYjppgoVQxeD0EhQh6e
         FX4ytUR8RSHzvch+pE7fsjnzRYYI394J+YoaIkIziDheCEQN/Z7LwX8LdboaOzuEXN8Q
         al2g==
X-Gm-Message-State: ANoB5pm+S9w2m5Vj2nGEXBUWzuXyZfVfulb1iXHlEdyzEjHab1kfNb3F
        byw1RcLSwt4oSyDfqhKGbNXgKA==
X-Google-Smtp-Source: AA0mqf5q9pp4E8hM3VW/7izBhrDQJ55xiEwMWxY/lg0MlGr4j3c7kOQPB4CRcd4gyZiaLZkawD7y6Q==
X-Received: by 2002:a05:600c:2193:b0:3cf:a323:bfe6 with SMTP id e19-20020a05600c219300b003cfa323bfe6mr38289027wme.86.1669822143903;
        Wed, 30 Nov 2022 07:29:03 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id fn9-20020a05600c688900b003cf75213bb9sm5821176wmb.8.2022.11.30.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:29:03 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Fabio Estevam <festevam@gmail.com>, dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: input: gpio-beeper: Convert to yaml schema
In-Reply-To: <20221120012135.2085631-1-festevam@gmail.com>
References: <20221120012135.2085631-1-festevam@gmail.com>
Date:   Wed, 30 Nov 2022 16:29:02 +0100
Message-ID: <87o7sosbpd.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Nov 19, 2022 at 22:21, Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <festevam@denx.de>
>
> Convert the bindings from plain text to yaml schema.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Small nit below, but I don't think it matters, so:

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  .../devicetree/bindings/input/gpio-beeper.txt | 13 --------
>  .../bindings/input/gpio-beeper.yaml           | 33 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/gpio-beeper.txt
>  create mode 100644 Documentation/devicetree/bindings/input/gpio-beeper.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/gpio-beeper.txt b/Documentation/devicetree/bindings/input/gpio-beeper.txt
> deleted file mode 100644
> index a5086e37fce6..000000000000
> --- a/Documentation/devicetree/bindings/input/gpio-beeper.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -* GPIO beeper device tree bindings
> -
> -Register a beeper connected to GPIO pin.
> -
> -Required properties:
> -- compatible:	Should be "gpio-beeper".
> -- gpios:	From common gpio binding; gpio connection to beeper enable pin.
> -
> -Example:
> -	beeper: beeper {
> -		compatible = "gpio-beeper";
> -		gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/gpio-beeper.yaml b/Documentation/devicetree/bindings/input/gpio-beeper.yaml
> new file mode 100644
> index 000000000000..5fd57a8940df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/gpio-beeper.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/gpio-beeper.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO controlled beeper
> +
> +maintainers:
> +  - Fabio Estevam <festevam@denx.de>
> +
> +properties:
> +  compatible:
> +    const: gpio-beeper
> +
> +  gpios:
> +    maxItems: 1
> +    description:
> +      GPIO that drives the beeper.

We can join these lines:

description: GPIO that drives the beeper.

> +
> +required:
> +  - compatible
> +  - gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    beeper {
> +        compatible = "gpio-beeper";
> +        gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
> +    };
> -- 
> 2.25.1
