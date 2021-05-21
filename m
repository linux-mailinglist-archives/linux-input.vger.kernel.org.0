Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0339E38CB0B
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 18:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236033AbhEUQcc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 12:32:32 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4575 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236020AbhEUQc2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 12:32:28 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FmsV52nN2zsSbs;
        Sat, 22 May 2021 00:28:13 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 22 May 2021 00:31:00 +0800
Received: from localhost (10.52.125.126) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 21 May
 2021 17:30:58 +0100
Date:   Fri, 21 May 2021 17:29:11 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, <kernel@pengutronix.de>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        David Jander <david@protonic.nl>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 5/8] dt-bindings: touchscreen: Convert
 resistive-adc-touch binding to json schema
Message-ID: <20210521172911.00001624@Huawei.com>
In-Reply-To: <20210521044525.7397-6-o.rempel@pengutronix.de>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
        <20210521044525.7397-6-o.rempel@pengutronix.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.126]
X-ClientProxiedBy: lhreml746-chm.china.huawei.com (10.201.108.196) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 May 2021 06:45:22 +0200
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> Convert the resistive-adc-touch binding to DT schema format using json-schema.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
Looks good to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  .../input/touchscreen/resistive-adc-touch.txt | 33 ---------
>  .../touchscreen/resistive-adc-touch.yaml      | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
> deleted file mode 100644
> index af5223bb5bdd..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Generic resistive touchscreen ADC
> -
> -Required properties:
> -
> - - compatible: must be "resistive-adc-touch"
> -The device must be connected to an ADC device that provides channels for
> -position measurement and optional pressure.
> -Refer to
> -https://github.com/devicetree-org/dt-schema/blob/master/schemas/iio/iio-consumer.yaml
> -for details
> -
> - - iio-channels: must have at least two channels connected to an ADC device.
> -These should correspond to the channels exposed by the ADC device and should
> -have the right index as the ADC device registers them. These channels
> -represent the relative position on the "x" and "y" axes.
> - - iio-channel-names: must have all the channels' names. Mandatory channels
> -are "x" and "y".
> -
> -Optional properties:
> - - iio-channels: The third channel named "pressure" is optional and can be
> -used if the ADC device also measures pressure besides position.
> -If this channel is missing, pressure will be ignored and the touchscreen
> -will only report position.
> - - iio-channel-names: optional channel named "pressure".
> -
> -Example:
> -
> -	resistive_touch: resistive_touch {
> -		compatible = "resistive-adc-touch";
> -		touchscreen-min-pressure = <50000>;
> -		io-channels = <&adc 24>, <&adc 25>, <&adc 26>;
> -		io-channel-names = "x", "y", "pressure";
> -	};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
> new file mode 100644
> index 000000000000..38b4cbee9429
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic resistive touchscreen ADC
> +
> +maintainers:
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: |
> +  Generic ADC based resistive touchscreen controller
> +  The device must be connected to an ADC device that provides channels for
> +  position measurement and optional pressure.
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: resistive-adc-touch
> +
> +  io-channels:
> +    minItems: 2
> +    items:
> +      - description: x
> +      - description: y
> +      - description: pressure (optional)
> +
> +  io-channel-names:
> +    oneOf:
> +      - items:
> +          - enum: [x, y]
> +          - enum: [x, y]
> +      - items:
> +          - enum: [x, y, pressure]
> +          - enum: [x, y, pressure]
> +          - enum: [x, y, pressure]
> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-fuzz-x: true
> +  touchscreen-fuzz-y: true
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true
> +  touchscreen-min-pressure: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - io-channels
> +  - io-channel-names
> +
> +examples:
> +  - |
> +    touchscreen {
> +      compatible = "resistive-adc-touch";
> +      io-channels = <&adc 24>, <&adc 25>;
> +      io-channel-names = "y", "x";
> +    };
> +  - |
> +    touchscreen {
> +      compatible = "resistive-adc-touch";
> +      touchscreen-min-pressure = <50000>;
> +      io-channels = <&adc 24>, <&adc 25>, <&adc 26>;
> +      io-channel-names = "y", "pressure", "x";
> +    };

