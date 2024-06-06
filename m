Return-Path: <linux-input+bounces-4170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C538FF07F
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 17:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AB5A1C209F3
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 15:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA327195982;
	Thu,  6 Jun 2024 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evwJs330"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE11D688;
	Thu,  6 Jun 2024 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717687140; cv=none; b=Z5SEhnq4vLdg7tn8hk/yvjWTzQh2C7XWcmElmk0Udd4HEYfBS1Y0ru5qt4hewMEFrwPtpmvaI/8PWLTuXAD5ZVAK2T4uAmwh8sYDPT0S+iNJ4Ve3AI3WqFFKh6hX9bR7z0XPSidFUZgKhcr3kFhc0p3aRQbthB5buz/LnLlXMP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717687140; c=relaxed/simple;
	bh=7UYefwtU5tz5CPfD6xmMlI9qasys2DUoEvtMmr6DYCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mg9dv+OhPAGde9ztf13wUPB33ebHh8sZqfkoKWZ2f1ZTJXBezNlVcx/KtniJMzd701A74hel5gvLluuq9+9AVg+N1j1/MbNEK9W9Ff+wZ362ZBefD8LdbVauNU4bfat2zJwsnix3SmSoyTztiXlpN+rCM8zlh8ls05GBKuphGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evwJs330; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D80CC2BD10;
	Thu,  6 Jun 2024 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717687140;
	bh=7UYefwtU5tz5CPfD6xmMlI9qasys2DUoEvtMmr6DYCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evwJs330gueY65cPIi2rMor11W6UX3cbB527iBG2bnNQ508P+MiTDobzBmUo/NPWd
	 UfI3nJnSvwBm49YkfiZkjGgYP3YZiYxbGf1BFI8JQDz/rQVJSzd34wbGBfTI3LOlnQ
	 PDBUr7FzF5Wo9hf4Zpet/GlLXBXQnWYM7Qc0mE/foKBechlTHZhka7dy35SlRyfXNP
	 ZQtOn53x7HejnPWC56OjWvh3Rp7TQvF6pEVhv4GqvKGwYrrFeMrcqOZACP+Yz5zQrA
	 qU7nltGHYTnsfGFevytHWNqBF7oP4DJl/hpQZG1eHiHNRdW5erkVA1d7BOT9kW4fXn
	 HKJcTwY1Rlakw==
Date: Thu, 6 Jun 2024 09:18:59 -0600
From: Rob Herring <robh@kernel.org>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ethan Twardy <ethan.twardy@plexus.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <20240606151859.GA3605325-robh@kernel.org>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>

On Wed, Jun 05, 2024 at 06:12:44PM -0500, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is

There's no more gpio subnode.

> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
> ---
>  .../devicetree/bindings/i2c/silabs,cp2112.yaml     | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> new file mode 100644
> index 000000000000..0108f2e43c8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CP2112 HID USB to SMBus/I2C Bridge
> +
> +maintainers:
> +  - Danny Kaehn <danny.kaehn@plexus.com>
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

Or hub ports. Just drop 'on the host controller'.

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

These are because I2C can be on any of the pins? It's a bit odd if they 
aren't used as gpios. Probably should be pinmux, but that's overkill for 
2 pins.

> +
> +      clock-frequency:
> +        minimum: 10000
> +        default: 100000
> +        maximum: 400000
> +
> +  interrupt-controller: true
> +  "#interrupt-cells":
> +    const: 2

Where does the 
> +
> +  gpio-controller: true
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 8
> +
> +patternProperties:
> +  "-hog(-[0-9]+)?$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
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
> +      cp2112: device@1 {
> +        compatible = "usb10c4,ea90";
> +        reg = <1>;
> +
> +        i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          sda-gpios = <&cp2112 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +          scl-gpios = <&cp2112 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +
> +          temp@48 {
> +            compatible = "national,lm75";
> +            reg = <0x48>;
> +          };
> +        };
> +
> +        gpio-controller;
> +        interrupt-controller;
> +        #gpio-cells = <2>;
> +        gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
> +          "TEST3","TEST4", "TEST5", "TEST6";
> +
> +        fan-rst-hog {
> +            gpio-hog;
> +            gpios = <7 GPIO_ACTIVE_HIGH>;
> +            output-high;
> +            line-name = "FAN_RST";
> +        };
> +      };
> +    };
> 
> -- 
> 2.25.1
> 

