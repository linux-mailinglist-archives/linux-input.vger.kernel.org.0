Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC601306CE
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2020 09:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgAEIff (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Jan 2020 03:35:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:53992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgAEIfe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 5 Jan 2020 03:35:34 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01EB12071A;
        Sun,  5 Jan 2020 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578213334;
        bh=ADADXtiRMJ8GY/BHNd1uS0UdQYNUUVQcEinoIdZJmYA=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=NNEg5KHjF6zAVzMLn6mv13ZVJzxC6EdeNGCm6nTv6mur+H8QltaU45h8qRKHg4I2Y
         5CnhBSgCqgZgDqp3fG1sCLsGIvaRWm1fCFN4BA40OQZlM8QLAdaVM+f1rmbjrkjvff
         LQ81wEA/lGHOy32ojqvGQ7lAkhKMyLkcIaXzISIE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191205002503.13088-5-masneyb@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org> <20191205002503.13088-5-masneyb@onstation.org>
Cc:     mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: Input: introduce new clock vibrator bindings
To:     Brian Masney <masneyb@onstation.org>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sun, 05 Jan 2020 00:35:33 -0800
Message-Id: <20200105083534.01EB12071A@mail.kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Brian Masney (2019-12-04 16:25:00)
> diff --git a/Documentation/devicetree/bindings/input/clk-vibrator.yaml b/=
Documentation/devicetree/bindings/input/clk-vibrator.yaml
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
> +  Support for clock-based vibrator devices where the speed can be contro=
lled
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
> +
> +  clock-frequency: true

Can you use assigned-clock-rates for this instead? Then the driver can
call clk_get_rate() if it wants to know the rate that was actually set
on the clk.

> +
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
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    vibrator {
> +        compatible =3D "clk-vibrator";
> +
> +        vcc-supply =3D <&pm8941_l19>;
> +
> +        clocks =3D <&mmcc CAMSS_GP1_CLK>;
> +        clock-names =3D "core";
> +        clock-frequency =3D <24000>;
> +
> +        enable-gpios =3D <&msmgpio 60 GPIO_ACTIVE_HIGH>;
> +
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&vibrator_pin>;

I'm still trying to wrap my head around this. I think we can have a pwm
provider in a clk controller node (so imagine &mmcc has #pwm-cells) and
then this 'clk-vibrator' binding wouldn't exist? Instead we would have
some sort of binding for a device that expects a pwm and whatever else
is required, like the enable gpio and power supply. Is there an actual
hardware block that is this way? Does it have a real product id and is
made by some company? Right now this looks a little too generic to not
just be a catch-all for something that buzzes.

