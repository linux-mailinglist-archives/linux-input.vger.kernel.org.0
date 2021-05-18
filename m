Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A38C387B9F
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 16:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbhEROsm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 May 2021 10:48:42 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:35591 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234550AbhEROsl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 May 2021 10:48:41 -0400
Received: by mail-ot1-f42.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so8849942otg.2;
        Tue, 18 May 2021 07:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i/3knGC4CpMEkTbYVCH3cvqb7hCOaLFy+F4QJW4cARQ=;
        b=VgIUTGjFIYEyx89OyA+x2eyprZkhbidxndWSDmGvKvsU2F/BjQhjZ37I0pcEaJ2UL+
         Yd4zuVIZhMXhbSwHeMfwTbx9vxw4viMRyS9NSzqMBDQDBWmrp/aGsdL/stQQb0qP3F+g
         yP1lkhXcn1ReYkYi+9TCyV1JkrkA0R9VX7nrK/DkvQDYIY3VIbhPbA2g94UooOs/wdz5
         lsFdHM+9iudcJkLw47shxd6g8ONYgOgqYW1gKGJz9vysYJhRcq5IkgWXGwrEATFerEBI
         ZwH6NE/9ITMiyBDfyJc6dZdI5s7kNcjUNff3V8Y3DWi5on/oZw7YtfrgYlYSeeRN4KI5
         aVZQ==
X-Gm-Message-State: AOAM533TChvvo9usaT6J3KEu6QzM2d7TUIGMb+2fcRqYDqE7AiG34h8Y
        SG0SWqjtmLfLOYU1/7qDP8gRvUttxA==
X-Google-Smtp-Source: ABdhPJwNmUr4/MF32fXbrpebVI1fsgUw9cKHKbmY3WR/0DiaZb3AQD49VP0j6t9aYWtsxn3SuKSE0w==
X-Received: by 2002:a05:6830:1284:: with SMTP id z4mr4599470otp.148.1621349243412;
        Tue, 18 May 2021 07:47:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v79sm3415081oia.14.2021.05.18.07.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:47:23 -0700 (PDT)
Received: (nullmailer pid 656643 invoked by uid 1000);
        Tue, 18 May 2021 14:47:22 -0000
Date:   Tue, 18 May 2021 09:47:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, David Jander <david@protonic.nl>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: touchscreen: Convert resistive-adc-touch
 binding to json schema
Message-ID: <20210518144722.GA617855@robh.at.kernel.org>
References: <20210517071825.20316-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517071825.20316-1-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 17, 2021 at 09:18:24AM +0200, Oleksij Rempel wrote:
> Convert the resistive-adc-touch binding to DT schema format using json-schema.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../input/touchscreen/resistive-adc-touch.txt | 33 ----------
>  .../touchscreen/resistive-adc-touch.yaml      | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 33 deletions(-)
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
> index 000000000000..53df21a6589e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
> @@ -0,0 +1,61 @@
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
> +    maxItems: 3

maxItems is implied by the 'items' length.

> +    items:
> +      - description: x
> +      - description: y
> +      - description: pressure (optional)
> +
> +  io-channel-names:

This needs minItems, too.

> +    items:
> +      - const: x
> +      - const: y
> +      - const: pressure
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
> +    resistive_touch {

touchscreen {

> +      compatible = "resistive-adc-touch";
> +      touchscreen-min-pressure = <50000>;
> +      io-channels = <&adc 24>, <&adc 25>, <&adc 26>;
> +      io-channel-names = "x", "y", "pressure";
> +    };
> -- 
> 2.29.2
> 
