Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F281C134853
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 17:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgAHQqa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 11:46:30 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34158 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgAHQq3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jan 2020 11:46:29 -0500
Received: by mail-ot1-f65.google.com with SMTP id a15so4229291otf.1
        for <linux-input@vger.kernel.org>; Wed, 08 Jan 2020 08:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=CkWGPmeVEEVzqEBeNOF39Am+w28soAd+AXNynQRs0bw=;
        b=aqKxc1kjbrObNrP5yzeGg88RswbQxGD7piL76HQtUBArqXOokkBHk0fE5kzbjLlMU2
         uURbLkD/2GJUvV3RSP06IpjrDwHhfsxPCUo6bjFxwL2GMvBGSnUbnsqh/3RH6qXVY7//
         1VZnd0qh7PNtnOBVBXvFRvMX4iqtc6ysCYN46mbVng6Svd5DiddIKlKDuHifn/XqsaLO
         NxuZ0+U1CiMTvcZGaKDZYp6GjRLuXvf6/abtleyuZuq5ld7pNXTVw1lXwGQTsAhzKc3U
         r+oagdHiT/Zoj7+77LRkMuLI1xuoe3fP4wSjI4dXIqXUIqXJLVbXayqWAkVCFaXki+Zn
         YZ/Q==
X-Gm-Message-State: APjAAAVwJtVz4Q80mj1989QXT6SoR/mlOEmvjCy8w+XvGAwp4xrZTEfS
        A2wGV603yjVcr13aiph2HMFgogQ=
X-Google-Smtp-Source: APXvYqy5VxP6jbgzfKFkkotOa2gjkV2zp7pSdRy7DVfFPm4Qj1z1O6yNdeYWL54CneD7h6lA1p5Ktg==
X-Received: by 2002:a9d:68d1:: with SMTP id i17mr4674417oto.367.1578501988289;
        Wed, 08 Jan 2020 08:46:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p21sm1308232otc.21.2020.01.08.08.46.24
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:46:26 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:46:23 -0600
Date:   Wed, 8 Jan 2020 10:46:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-input@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Donggeun Kim <dg77.kim@samsung.com>,
        Minkyu Kang <mk7.kang@samsung.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Oskar Andero <oskar.andero@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v1] iio: light: Add DT bindings for GP2AP002
Message-ID: <20200108164623.GA18967@bogus>
References: <20191228201109.13635-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191228201109.13635-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 28, 2019 at 09:11:08PM +0100, Linus Walleij wrote:
> This adds device tree bindings for the GP2AP002 light
> and proximity sensor.
> 
> As with other early proximity sensors (~2010) the light
> sensor and proximity sensors were combined into a single
> component.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Donggeun Kim <dg77.kim@samsung.com>
> Cc: Minkyu Kang <mk7.kang@samsung.com>
> Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Cc: Jonathan Bakker <xc-racer2@live.ca>
> Cc: Oskar Andero <oskar.andero@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/iio/light/sharp,gp2ap002.yaml    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> new file mode 100644
> index 000000000000..27d129e76a8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp GP2AP002A00F and GP2AP002S00F proximity and ambient light sensors
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  Proximity and ambient light sensor with IR LED for the proximity
> +  sensing and an analog output for light intensity. The ambient light
> +  sensor output is not available on the GP2AP002S00F variant.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sharp,gp2ap002a00f
> +      - sharp,gp2ap002s00f
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: an interrupt for proximity, usually a GPIO line
> +
> +  vdd-supply:
> +    maxItems: 1

*-supply is always 1 item, so drop.

> +    description: VDD power supply a phandle to a regulator
> +
> +  vio-supply:
> +    maxItems: 1
> +    description: VIO power supply a phandle to a regulator
> +
> +  io-channels:
> +    maxItems: 1
> +    description: ALSOUT ADC channel to read the ambient light
> +
> +  io-channel-names:
> +    const: "alsout"

Drop quotes

> +
> +  sharp,proximity-far-hysteresis:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Hysteresis setting for "far" object detection, this setting is
> +      device-unique and adjust the optical setting for proximity detection
> +      of a "far away" object in front of the sensor.

0-2^32 is allowed?

default?

> +
> +  sharp,proximity-close-hysteresis:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Hysteresis setting for "close" object detection, this setting is
> +      device-unique and adjust the optical setting for proximity detection
> +      of a "close" object in front of the sensor.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - sharp,proximity-far-hysteresis
> +  - sharp,proximity-close-hysteresis
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      light-sensor@44 {
> +        compatible = "sharp,gp2ap002a00f";
> +        reg = <0x44>;
> +        interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
> +        vdd-supply = <&vdd_regulator>;
> +        vio-supply = <&vio_regulator>;
> +        io-channels = <&adc_channel>;
> +        io-channel-names = "alsout";
> +        sharp,proximity-far-hysteresis = <0x2f>;
> +        sharp,proximity-close-hysteresis = <0x0f>;
> +      };
> +    };
> +
> +...
> -- 
> 2.21.0
> 
