Return-Path: <linux-input+bounces-1887-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6685349D
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 16:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 218F21F24D9E
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 15:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D575EE8C;
	Tue, 13 Feb 2024 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KujDgKyz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8948D5EE65;
	Tue, 13 Feb 2024 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707838108; cv=none; b=XAP5mX2Lj7rR1BSBUQNUDBDaEILwZnJi1CtXUDBADUIebXSx6af3+IxVnNg8SUU0HZofIeyQmIQFm1YADKGnp6CyRAl6MJd+fB6sF+ceWhZptwdRjhKvxlaRiExZBtfAsyT/5tPdrb6XuYmlRp6Am0kHhJ2nI4BfHd76SeXYFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707838108; c=relaxed/simple;
	bh=JrqaZlizsxiYiN/S5mVnXzenp7hN5D8pYj4WMfgoO1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKd+slXS2uPoAIx2ePFLH79iRdqcjr8g8+U4HXhXEkj41UyhrerYuMI+I2X8kPYTAzEgC+eYpHZ/kjmTyKGrgk8kWMCUs4hrWysNak8IX7K/fCHZfJTIbYHowxB1ofbPT3ww5MUpVaFZ321KNISlNKCKgTY2ZqSGni8u01Riq1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KujDgKyz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BACC43390;
	Tue, 13 Feb 2024 15:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707838108;
	bh=JrqaZlizsxiYiN/S5mVnXzenp7hN5D8pYj4WMfgoO1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KujDgKyztCud5A66vaNj3lszOZO813bwVlwt+N24vIc6P4AEFOOcKZ7DDH6hdp0ue
	 T9VTbV3eTZ9NLIX6s4uhoinqnKsVh6YNljTY94AnxsAyy+AGfL339xAN6/CHRygd2Z
	 OFCVWn/3zMGkGYAep6iEXY5biX3qGNygN07qmfVpWLqF3mUwwz9d2enpL9Lrg7yeDP
	 UPMm9eYK3TXI3KAh8xTXwyR7s+DJiJlcKTy6jxAUC3cnZJcAbVK3ayiaPJlch7PPZr
	 h///d7F95qGYALbWBgtL5ygdEzprAEMZM3mmMTnUJtwUo12OHY4nOWswA6R+2IsLhn
	 iwG+wd/cd2ziQ==
Date: Tue, 13 Feb 2024 09:28:25 -0600
From: Rob Herring <robh@kernel.org>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com,
	bentiss@kernel.org, jikos@kernel.org,
	bartosz.golaszewski@linaro.org, niyas.sait@linaro.org,
	dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: Re: [PATCH v10 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <20240213152825.GA1223720-robh@kernel.org>
References: <20240205170920.93499-1-danny.kaehn@plexus.com>
 <20240205170920.93499-2-danny.kaehn@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205170920.93499-2-danny.kaehn@plexus.com>

On Mon, Feb 05, 2024 at 11:09:20AM -0600, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
> ---
> 
> Note -- Reviewed-By tags have been removed as suggested by Benjamin, since
> 1. It has been 6+ months since this binding was reviewed, and a lot can
> change upstream in that time
> 2. There has been some contention between using named child nodes to
> identify i2c and gpio nodes, and also making the driver implementing this
> binding compatible with ACPI, since names aren't significant for ACPI
> nodes, and ACPI names are always automatically uppercased. It has been
> suggested that perhaps the DT binding should use child nodes with
> addressable `reg` properties to identify the child nodes, instead of by
> name [1].

'reg' only makes sense if there are values which relate to the h/w. If 
your addresses are indices, that will be suspect.

There's documented nodenames for specific device classes in DT. You have 
to use those whether there's 'reg' and a unit-address or not. I'm not 
really clear what the problem is.

> 
> Of course, I acknowledge that other firmware languages and kernel details
> shouldn't impact DT bindings, but it also seems that there should
> be some consistent way to specify sub-functions like this accross DT
> and ACPI. Some additional commentary / requests for comment about the
> seemingly missing glue here can be found in [2].

I have little interest in worrying about ACPI as I have limited 
knowledge in ACPI requirements, what I do know is the model for bindings 
are fundamentally differ, and no one has stepped up to maintain bindings 
from an ACPI perspective.

> Any comments from Rob/Krzysztof/other DT folks would be greatly appreciated
> 
> [1] https://lore.kernel.org/all/ZBhoHzTr5l38u%2FkX@smile.fi.intel.com/
> [2] https://lore.kernel.org/all/CAP+ZCCd0cD+q7=ngyEzScAte2VT9R00mqCQxB3K2TMbeg8UAfA@mail.gmail.com/
> 
>  .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> new file mode 100644
> index 000000000000..a27509627804
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CP2112 HID USB to SMBus/I2C Bridge
> +
> +maintainers:
> +  - Danny Kaehn <kaehndan@gmail.com>
> +
> +description:
> +  The CP2112 is a USB HID device which includes an integrated I2C controller
> +  and 8 GPIO pins. Its GPIO pins can each be configured as inputs, open-drain
> +  outputs, or push-pull outputs.
> +
> +properties:
> +  compatible:
> +    const: usb10c4,ea90
> +
> +  reg:
> +    maxItems: 1
> +    description: The USB port number on the host controller
> +
> +  i2c:
> +    description: The SMBus/I2C controller node for the CP2112
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      sda-gpios:
> +        maxItems: 1
> +
> +      scl-gpios:
> +        maxItems: 1

Why do you have GPIOs if this is a proper controller?

> +
> +      clock-frequency:
> +        minimum: 10000
> +        default: 100000
> +        maximum: 400000
> +
> +  gpio:
> +    description: The GPIO controller node for the CP2112

There's no need for a child node here. All these properties can be part 
of the parent.


> +    type: object
> +    unevaluatedProperties: false
> +
> +    properties:
> +      interrupt-controller: true
> +      "#interrupt-cells":
> +        const: 2
> +
> +      gpio-controller: true
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-line-names:
> +        minItems: 1
> +        maxItems: 8
> +
> +    patternProperties:
> +      "-hog(-[0-9]+)?$":
> +        type: object
> +
> +        required:
> +          - gpio-hog
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    usb {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      device@1 {
> +        compatible = "usb10c4,ea90";
> +        reg = <1>;
> +
> +        i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          sda-gpios = <&cp2112_gpio 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +          scl-gpios = <&cp2112_gpio 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +
> +          temp@48 {
> +            compatible = "national,lm75";
> +            reg = <0x48>;
> +          };
> +        };
> +
> +        cp2112_gpio: gpio {
> +          gpio-controller;
> +          interrupt-controller;
> +          #gpio-cells = <2>;
> +          gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
> +            "TEST3","TEST4", "TEST5", "TEST6";
> +
> +          fan-rst-hog {
> +              gpio-hog;
> +              gpios = <7 GPIO_ACTIVE_HIGH>;
> +              output-high;
> +              line-name = "FAN_RST";
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.25.1
> 

