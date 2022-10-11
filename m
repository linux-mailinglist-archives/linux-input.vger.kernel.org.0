Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEEDC5FB24C
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 14:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJKMUT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Oct 2022 08:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiJKMUR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 08:20:17 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E7C57275
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 05:20:16 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id cj27so8072356qtb.7
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YakFhNpLpumvOh5oHDunclA+gkTRZwRtWWXCJ8zRl8=;
        b=jhOz86q+hE4Tl/6wOHJGFEWqFbyw8x+EKAvrco08gfgBy80fcwjZipZU2w4+1Lk12g
         imuWft0S/KkaxjwCRHY1jWIUwzvF+UpZzGnnLYBSXOMalVKtYq8YMYcvNd5Bjz7Wa12s
         cATv6WR2Ib0WgHHUEdbDPxaYu5kCo/58kmY3tY7CAF01NjR/iOHwMCZNT0n7qKcf0mOs
         isz4f2ku3VuewEFctR0EF319aMwEaBLIXgZ7w8k+LGFKXHqhW0+6WAeYE5/bLm/t3Agy
         GLNkifIVQMprhorNHpNbmZKGst0y9Bbn13nDtpzP5VPLu964O02c8oZmng/MXZ39W1/8
         UejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YakFhNpLpumvOh5oHDunclA+gkTRZwRtWWXCJ8zRl8=;
        b=cb+GH7k8X6WI89tj1N/GuabJeW7UfeKdTEjp35J/R1RgM+Je/PzcpXPlsibWZ0lD+b
         XOFwQ8hwKGfvZ59Pzn7plawSlzE6Z+g3wnXE7VfUucSa9ocfHhscgDWsnrBPQ2F87/9l
         9yH7gLccwMOHMA3GBjeyedow03gCtbzVKPdHZ2K5m1yKRAB9jstKsMUWiOmoV9i5m0t5
         CMCshv5n+ZYqtPHcYIkYdgzK+dzo1nMzmuyHAT4hhdQi9DJbaz6vBZ3wCGuIDUcIRhDX
         2cmto2Hf1CGCftdj/xXpIJ4w94qpIhR98E6qO89HXWhrEXgans+mfSysg0TgUN4iL6xj
         mBug==
X-Gm-Message-State: ACrzQf1u0mtaRI0URArdXplja9T6Chvierf3OrudnUGpgY4OKdqbLhco
        coHmB5XKcNcXAmqy+CdusLzv5A==
X-Google-Smtp-Source: AMsMyM6fRbj6X+C2Y6tfih+FThJWoSnfBLJ6Ysf+7CiShQzNRCRB2RKBkJpFjOd2eRKG+uoLu3GezA==
X-Received: by 2002:ac8:7f4b:0:b0:35c:bfa2:8bd2 with SMTP id g11-20020ac87f4b000000b0035cbfa28bd2mr18401847qtk.644.1665490813776;
        Tue, 11 Oct 2022 05:20:13 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id dt39-20020a05620a47a700b006ec59941acasm7243990qkb.11.2022.10.11.05.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:20:13 -0700 (PDT)
Message-ID: <f479acd6-457c-5242-432b-10fec91f0c3b@linaro.org>
Date:   Tue, 11 Oct 2022 08:18:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 1/2] dt-bindings: input: document Qualcomm PMI8998
 haptics driver
Content-Language: en-US
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
References: <20221010162945.1325770-1-caleb@connolly.tech>
 <20221010162945.1325770-2-caleb@connolly.tech>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221010162945.1325770-2-caleb@connolly.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 10/10/2022 12:30, Caleb Connolly wrote:
> Add bindings for qcom PMIC PMI8998 haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/input/qcom,pmi8998-haptics.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> new file mode 100644
> index 000000000000..9f51c527595c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2020 Unisoc Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/qcom,pmi8998-haptics.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMI8998/PM660 Haptics
> +
> +maintainers:
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +description: |
> +  Qualcomm SPMI haptics is a peripheral on some QTI PMICs. It supports linear resonant
> +  actuators and eccentric rotating mass type haptics commonly found in mobile devices.
> +  It supports multiple sources of wave data such as an internal buffer, direct play
> +  (from kernel or userspace) as well as an audio output mode.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,pmi8998-haptics
> +          - qcom,pm660-charger
> +          - qcom,pmi8996-haptics
> +          - qcom,pmi8941-haptics
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: short
> +      - const: play
> +
> +  qcom,wave-play-rate-us:

s/rate/duration/
?

> +    description: |
> +      Wave sample duration in microseconds, 1/f where f
> +      is the resonant frequency of the actuator.
> +    minimum: 0
> +    maximum: 20475
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - qcom,wave-play-rate-us
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/interrupt-controller/irq.h>

Align it with -| above.

> +
> +      spmi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pmi8998_haptics: haptics@c000 {
> +          compatible = "qcom,pmi8998-haptics";
> +          reg = <0xc000>;
> +
> +          interrupts = <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
> +                      <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;

Align with previous <

> +          interrupt-names = "short", "play";
> +
> +          qcom,wave-play-rate-us = <4255>;
> +        };
> +      };
> --
> 2.38.0
> 
> 

Best regards,
Krzysztof

