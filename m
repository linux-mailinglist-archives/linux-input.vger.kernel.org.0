Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C59C4679F51
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 17:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbjAXQ6r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Jan 2023 11:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbjAXQ6q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Jan 2023 11:58:46 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE8646088
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 08:58:44 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id o17-20020a05600c511100b003db021ef437so11432532wms.4
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 08:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cdb0oFoKxHwQ03DA8if5wSz8FjXcnpPwR7oP9X0TASQ=;
        b=e8rC3DOOpCpm/yKC3hjmG17ey445cYVbF6eMJloArv1j8eFrG4EnYNXPXSi4csB9X7
         5C8Ctf1eenyJHDLmzALfwZ2yurMC34RkHpb3joU2q+rKiiGP6kti9EURgnjGYiZVe/96
         XYvFHzv2LcwE5cYqB05xVQkWhdGVu4ncoc2O0jUDiLGQMPJIDzTPWPn34lx8xqhu9aYE
         D9pdao+/haCpENeGXtk1r4fXTVYTYEdiyl9ShHYyy/MvnA60DIbQW90lizwLRmhx68qK
         rMwllXHOG+2AVSwe3ctLIKQ2kKD50g+eL5CIanjtaKNaSWtd4X7x/KQ8EnDOjq5iTEly
         qrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cdb0oFoKxHwQ03DA8if5wSz8FjXcnpPwR7oP9X0TASQ=;
        b=ll3nd8+JT9RoigbEaUi8HAbmsUQc1I3fclmsCbHpXyvNTEWuzIemcLBYV/Lu7lkoxb
         eicMYWKIlRxgk5KEa9BxcqZMTQE8UtbQDNtDp+Xgvig9vLaWTGqJCXJP3fQqc+gceL66
         8b5K/rkZ9nMSLLHj4XgGI15z+DuPKCWjGVYxWi5YOZPQfVHFjx1IANxQ+fUSQRoMkDej
         9IAdjCCTzqQBtqJTPrmyPPmMdxwE8issIlSiFYV6Wir23wrFr00jDX3HYV5tjvtDyX6C
         1x88o7CzZ0Kok1D/l/q0JvGZ1GtSgU3A8Dj9KN/POkMb3xqRnpk1ljMV+apzI3q37F0I
         xJIA==
X-Gm-Message-State: AFqh2kpAp10mkW6re4bSpJ/YpMS7hkEvzGrGGBJlg66NPBVFzSGj0gVg
        /JUoQm6/598V9PzrplwxuUczVA==
X-Google-Smtp-Source: AMrXdXurcLhwij0yWeyiNpXqw2jGF3m1ReYrcuLOxgg4DHgZkk4BU95yF+abWjpf+ct5ZmUd7pYsjg==
X-Received: by 2002:a7b:ce15:0:b0:3da:2932:b61a with SMTP id m21-20020a7bce15000000b003da2932b61amr28492673wmc.18.1674579522994;
        Tue, 24 Jan 2023 08:58:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c511800b003d9de0c39fasm19046290wms.36.2023.01.24.08.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 08:58:42 -0800 (PST)
Message-ID: <50ecd96d-47e4-5140-faeb-d590f0656175@linaro.org>
Date:   Tue, 24 Jan 2023 17:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/5 v7] dt-bindings: input: pwm-beeper: Convert txt
 bindings to yaml
Content-Language: en-US
To:     Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <Y9AJ07zT1lpBLhPk@mt.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9AJ07zT1lpBLhPk@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 24/01/2023 17:39, Manuel Traut wrote:
> Converts txt binding to new YAML format.
> 
> Signed-off-by: Manuel Traut <manuel.traut@mt.com>
> ---
>  .../devicetree/bindings/input/pwm-beeper.txt  | 24 ----------
>  .../devicetree/bindings/input/pwm-beeper.yaml | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/pwm-beeper.txt
>  create mode 100644 Documentation/devicetree/bindings/input/pwm-beeper.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/pwm-beeper.txt b/Documentation/devicetree/bindings/input/pwm-beeper.txt
> deleted file mode 100644
> index 8fc0e48c20db..000000000000
> --- a/Documentation/devicetree/bindings/input/pwm-beeper.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -* PWM beeper device tree bindings
> -
> -Registers a PWM device as beeper.
> -
> -Required properties:
> -- compatible: should be "pwm-beeper"
> -- pwms: phandle to the physical PWM device
> -
> -Optional properties:
> -- amp-supply: phandle to a regulator that acts as an amplifier for the beeper
> -- beeper-hz:  bell frequency in Hz
> -
> -Example:
> -
> -beeper_amp: amplifier {
> -	compatible = "fixed-regulator";
> -	gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> -};
> -
> -beeper {
> -	compatible = "pwm-beeper";
> -	pwms = <&pwm0>;
> -	amp-supply = <&beeper_amp>;
> -};
> diff --git a/Documentation/devicetree/bindings/input/pwm-beeper.yaml b/Documentation/devicetree/bindings/input/pwm-beeper.yaml
> new file mode 100644
> index 000000000000..24a40f0f77c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/pwm-beeper.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2Does not look like you tested the bindings. Please run `make dt_binding_check` (see Documentation/devicetree/bindings/writing-schema.rst for instructions).
> +---
> +$id: "http://devicetree.org/schemas/input/pwm-beeper.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: PWM beeper device tree bindings

Drop: device tree bindings

> +
> +maintainers:
> +	- Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +description: Registers a PWM device as beeper.
> +
> +properties:
> +	compatible:
> +	const: pwm-beeper

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Start from scratch from example-schema. There are so many mistakes here
it should be seriously rework.

Best regards,
Krzysztof

