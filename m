Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A5867CAF4
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 13:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236632AbjAZMcb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Jan 2023 07:32:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjAZMca (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Jan 2023 07:32:30 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2D149568
        for <linux-input@vger.kernel.org>; Thu, 26 Jan 2023 04:32:29 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso3140188wmn.5
        for <linux-input@vger.kernel.org>; Thu, 26 Jan 2023 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bNSq7yyd0Fn2CFk8JA2YspzkodNLpfvLBCK3Yp7urY=;
        b=oum0aFT6waydlwgkxuNblpIgYLzAffKOlwHZFRBf593vlK/BANnDrFdlUS89AZ4me7
         t7F6gSmf8fSgbwgpL7y/garFTLUp+3M6lFJC2LuvieLGCrmvohxqkdVOTmg15uiAdWSr
         u7PCpDbuD767PgolBOStee35yRZH1oW1CXAkmaD7K8ArEbklE/UhfaIKa2h5eUubSv3N
         MCjBVvk/gkImWs2O5/kFk+JCzaVIBCHPwuKnpx+btOXeAAtbhtIc+oO5Vafu7R2ZCKK9
         v38yuYW6hkPJLkKUBJSmgKVA6thZpcFaZhKFhp0Jtn16H6Ngnz9i7X4h/wBAgGzIFGWf
         Lw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bNSq7yyd0Fn2CFk8JA2YspzkodNLpfvLBCK3Yp7urY=;
        b=0+/SBvUuwUgAZqnESdQHH30kOVPZkpDzci8qzpk63Hq0s3WuDEqSSHDzyu258wI7AQ
         rTnXjMKCXcP71zy3WP9/bx2sbfAMxU0huxuqsknV2vv6GV4qRHAx2krv9UGA250BMNEY
         10GVA+YKQpQyAbLnAcHnVww84H/fFtOUo/53AiOwdozrHnuCTYfJezR6mPGU7bYdfMP/
         WfhcYukV7sjrVj7MIkvAMl+6wmR/08rulD5LxNgJ2xsI7NuRjlH3B0K/grZcTixB34/a
         oFRoyiJoQu6uL/Oxuu01HaugrD5IFnrhymU3+ceQWfsDsEzglT2mFkWz11nb0HwYz0Kt
         SQBQ==
X-Gm-Message-State: AFqh2krKHiPTuDdo/0oKG0/xvKPlJQap8o1kZJJcqpc5MkAMM5viDA9G
        NK4ZH0DqJVkCQQtEERxOsWIHsQ==
X-Google-Smtp-Source: AMrXdXv8WZZLPkrmDbdaf70Msw/d1T9RanynwxtPxW0TwnaFzZhcu526bILzcynC0l7mfwL8btwJWw==
X-Received: by 2002:a05:600c:3d14:b0:3da:f793:fff6 with SMTP id bh20-20020a05600c3d1400b003daf793fff6mr35093224wmb.16.1674736348297;
        Thu, 26 Jan 2023 04:32:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b003dc22ee5a2bsm2350815wmo.39.2023.01.26.04.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 04:32:27 -0800 (PST)
Message-ID: <4a02f9be-04df-352b-fe49-7990eba5dc2e@linaro.org>
Date:   Thu, 26 Jan 2023 13:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 1/5] dt-bindings: input: pwm-beeper: Convert txt
 bindings to yaml
Content-Language: en-US
To:     Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <20230126091825.220646-1-manuel.traut@mt.com>
 <20230126091825.220646-2-manuel.traut@mt.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126091825.220646-2-manuel.traut@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 26/01/2023 10:18, Manuel Traut wrote:
> Converts txt binding to new YAML format.
> 
> Signed-off-by: Manuel Traut <manuel.traut@mt.com>

Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/input/pwm-beeper.yaml b/Documentation/devicetree/bindings/input/pwm-beeper.yaml
> new file mode 100644
> index 000000000000..351df83d5cbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/pwm-beeper.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/input/pwm-beeper.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both. Apologies for not noticing it earlier.

> +
> +title: PWM beeper
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +description: Registers a PWM device as beeper.
> +
> +properties:
> +  compatible:
> +    const: pwm-beeper
> +
> +  pwms:
> +    maxItems: 1
> +
> +  amp-supply:
> +    description: >
> +      phandle to a regulator that acts as an amplifier for
> +      the beeper

Drop "phandle to a"

> +
> +  beeper-hz:
> +    description: bell frequency in Hz
> +
> +required:
> +  - compatible
> +  - pwms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    beeper_amp: amplifier {
> +      compatible = "fixed-regulator";
> +      gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +    };

Drop this device node, not related.

> +
> +    beeper {
> +      compatible = "pwm-beeper";
> +      pwms = <&pwm0>;
> +      amp-supply = <&beeper_amp>;
> +    };

Best regards,
Krzysztof

