Return-Path: <linux-input+bounces-5574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F35952308
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 21:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 752BA1C220D0
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 19:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA431BF31D;
	Wed, 14 Aug 2024 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Eniqi4OJ"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F151BD510;
	Wed, 14 Aug 2024 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723665582; cv=none; b=WAEPxnSCMnagMSwOtLtIerCpvfGZYWrRBN7u+aVEfR7c1Rob7QQu7rBwmxHkW67mM32tqBKz0qkjBKGAz5BlvntiMOoLzRWotuGXzpn4nzaKs3dsG46SzdLVmdJeSBtW8VqfnH1IRhDQ7/pufBXX5O3Pl5yc1myhm3fivFHouf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723665582; c=relaxed/simple;
	bh=GNV4tsHwSCmnO+Fg4jkmp7tkUCJGx/VdzsUl9ZVOIiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0hiG246U6SkRVckl6ACVzr8hySx3/NbItb7tCAyDGnFsB796FerUxxL1FG6JRsT7okp+iS3tqo7RBkAEHZjxWL3EDq3etIwMM0lSfetmWEgzkNXgIxp+JedTYpEkE3h+HIJHWui8DOWyyUTU/pDAJv/GOejhLZ2ascDkbzEoWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Eniqi4OJ; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E8AE188A11;
	Wed, 14 Aug 2024 21:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1723665578;
	bh=5Ru4zIkS1NojlSPj+uZnab0ukXQuEwASFRNgcpKvFKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Eniqi4OJy7BC4kh1kT+xXEHb+/sFTPF4u/b1qx+xXBn8+whHsxdrfdE90VNRF/PFo
	 HFI1gmWkJs69EufMecg7SmjdFoIM2p1Nwh8QjspIpSIqMQN2AhLhjUwL/ZrFDj2JSl
	 yeH+B+zMXNAU/QFrWhCf9XbeEikzmnjk+0kl6+aOKKgNGC9Qig64+aFkYzs7K/z2JQ
	 +SycMf0PaJZ8eZ6QEM0kc9hGztixvA1hCGHlQoJ5pdnh8sbpXWQj80vHIes0ZeehlZ
	 SJoQyMWwUSEdVbqBKEj8nQqCw4yxf7ePHpx8FpB8CNVR9yYcjTiSC9yyctrsauJj30
	 8xV+UtCzHdfyQ==
Message-ID: <e37da9ec-c730-466f-8a36-7cb91a82fb05@denx.de>
Date: Wed, 14 Aug 2024 21:58:36 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt
 to yaml
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Alexander Stein
 <alexander.stein@ew.tq-group.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20240814185140.4033029-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240814185140.4033029-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 8/14/24 8:51 PM, Frank Li wrote:

Hi,

> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
> new file mode 100644
> index 0000000000000..b8239491c747a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI's SPI driven touch screen controllers.
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +  - Marek Vasut <marex@denx.de>
> +  - Alexander Stein <alexander.stein@ew.tq-group.com>
>

Keep the list sorted alphabetically .

  +description:
> +  Device tree bindings for TI's ADS7843, ADS7845, ADS7846, ADS7873, TSC2046
> +  SPI driven touch screen controllers.
> +
> +  The node for this driver must be a child node of a SPI controller, hence
> +  all mandatory properties described in

... described in ... what/where ? I think part of the sentence is 
missing here.

> +properties:
> +  compatible:
> +    enum:
> +      - ti,tsc2046
> +      - ti,ads7843
> +      - ti,ads7845
> +      - ti,ads7846
> +      - ti,ads7873

Keep the list sorted alphabetically.

> +  interrupts:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: A regulator node for the supply voltage.
> +
> +  ti,vref-delay-usecs:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description: vref supply delay in usecs, 0 for external vref (u16).

Maybe the (u16) is duplicate of the $ref'd type ? Drop for all the rest 
below too ?

> +  ti,vref-mv:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      The VREF voltage, in millivolts (u16).
> +      Set to 0 to use internal references (ADS7846).
> +
> +  ti,keep-vref-on:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: set to keep vref on for differential measurements as well.

Vref , because V (voltage) is written with capitals ...

> +  ti,settle-delay-usec:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Settling time of the analog signals; a function of Vcc and the

... like Vcc here.

> +      capacitance on the X/Y drivers.  If set to non-zero, two samples are
> +      taken with settle_delay us apart, and the second one is used. ~150
> +      uSec with 0.01uF caps (u16).

[...]

> +  ti,pendown-gpio-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Platform specific debounce time for the pendown-gpio (u32).
> +
> +  pendown-gpio:
> +    description:
> +      GPIO handle describing the pin the !PENIRQ line is connected to.

I think the properties have to be sorted alphabetically too.

[...]

> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply

Is vcc-supply really required ?

> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi{
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        touchscreen@0 {
> +           compatible = "ti,tsc2046";
> +           reg = <0>;	/* CS0 */
> +           interrupt-parent = <&gpio1>;
> +           interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
> +           spi-max-frequency = <1000000>;
> +           pendown-gpio = <&gpio1 8 0>;
> +           vcc-supply = <&reg_vcc3>;

Sort please .

> +           ti,x-min = /bits/ 16 <0>;
> +           ti,x-max = /bits/ 16 <8000>;
> +           ti,y-min = /bits/ 16 <0>;
> +           ti,y-max = /bits/ 16 <4800>;
> +           ti,x-plate-ohms = /bits/ 16 <40>;
> +           ti,pressure-max = /bits/ 16 <255>;
> +
> +           wakeup-source;
> +       };
> +    };
> +

Thanks !

