Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C6F1141F9
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 14:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbfLEN4Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 08:56:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:39286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729099AbfLEN4Y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Dec 2019 08:56:24 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41D1422525;
        Thu,  5 Dec 2019 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575554183;
        bh=SI5/UqDvOLdW/ebXgeRPP0F1wEDuikwE8BLTviwj7zI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yg7lntnXFYlbDO+rC98Zawl9736UXE/JoMSwLlGu7DSzz7ZIVo1Fn+kvVe5wFj8oX
         ORE1V1NZRCFe2OD/LgTnjmhjR3dknHNDXRNDSgqnudzCaVzxk3wXXypAPX4W9yBJo/
         IvY/jADxsCi/U5vhAWde20l3rRE8DKIdnpbdYnKY=
Received: by mail-qk1-f180.google.com with SMTP id g15so3351553qka.8;
        Thu, 05 Dec 2019 05:56:23 -0800 (PST)
X-Gm-Message-State: APjAAAXnxAyCdpUF/kT0rPEg9X/NRMCpzg9nVS5m0TdkobzL+7eVYT7R
        K4mWvs+KgtYlesl2KJcDMSb2LPvlcoSLOk0E9w==
X-Google-Smtp-Source: APXvYqxTieNjxwOysjbfDY0Jzt7u28n6wJ0i4JI/0Df2CY+8bRxVrS6cJAN5zimj0f/y7nSsmjIvD9YzQK49P9OeD5Y=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr8502354qkg.152.1575554182339;
 Thu, 05 Dec 2019 05:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20191205002503.13088-1-masneyb@onstation.org> <20191205002503.13088-5-masneyb@onstation.org>
In-Reply-To: <20191205002503.13088-5-masneyb@onstation.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 5 Dec 2019 07:56:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+jpz6_N18sChREC_xGYt9sSFZFtWr3omb_6o7+MFxuHg@mail.gmail.com>
Message-ID: <CAL_Jsq+jpz6_N18sChREC_xGYt9sSFZFtWr3omb_6o7+MFxuHg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: Input: introduce new clock vibrator bindings
To:     Brian Masney <masneyb@onstation.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 4, 2019 at 6:25 PM Brian Masney <masneyb@onstation.org> wrote:
>
> Add support for clock-based vibrator devices where the speed can be
> controlled by changing the duty cycle.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  .../bindings/input/clk-vibrator.yaml          | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/clk-vibrator.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/clk-vibrator.yaml b/Documentation/devicetree/bindings/input/clk-vibrator.yaml
> new file mode 100644
> index 000000000000..2103a5694fad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/clk-vibrator.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/input/clk-vibrator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock vibrator
> +
> +maintainers:
> +  - Brian Masney <masneyb@onstation.org>
> +
> +description: |
> +  Support for clock-based vibrator devices where the speed can be controlled
> +  by changing the duty cycle.
> +
> +properties:
> +  compatible:
> +    const: clk-vibrator
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description: output clock that controls the speed
> +    items:
> +      - const: core

No point in making up a name when there's only one clock, so drop.

> +
> +  clock-frequency: true

Given the frequency is variable, what does this mean in this case?

> +  enable-gpios:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: Regulator that provides power
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - clock-frequency

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    vibrator {
> +        compatible = "clk-vibrator";
> +
> +        vcc-supply = <&pm8941_l19>;
> +
> +        clocks = <&mmcc CAMSS_GP1_CLK>;
> +        clock-names = "core";
> +        clock-frequency = <24000>;
> +
> +        enable-gpios = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&vibrator_pin>;
> +    };
> --
> 2.21.0
>
