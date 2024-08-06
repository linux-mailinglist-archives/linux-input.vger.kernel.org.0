Return-Path: <linux-input+bounces-5380-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A0948BE4
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 11:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF5921C234D3
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 09:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777421BDA99;
	Tue,  6 Aug 2024 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGMT7lxQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE02146A6F;
	Tue,  6 Aug 2024 09:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722935047; cv=none; b=mcbhdznrMBZuILlu9uEMJdR+5vRjBfCzLvEzzj+mny2ukJf+0n8+Fq46ZTzN0DhMqhr7dVMlBPMyvMirdcBzWHkCbYQMpDATVR+Zpwg0PDV4DBlTudmjVnSEKRzZsCwEooUwvFsM8cHjAuUyKSP15D9HTe45T6aOr4ej3t9uq4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722935047; c=relaxed/simple;
	bh=BCz5alDXDrczbYyQPbsxtRfrt4U+bf2v3iwbwkAa38U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/Ubh1XVmBpb7LM+Kn4G0S/UbdrhPqLE5DBEPPL0fcNHuE8xDl8Hg20nENf/u4qnWBR92R60oeDNqKTYTG7yfpzRMJyAs74NI9UE/GpGWzikwHStPKEShqLTG17Tcj6RJmNBgUEc0XgknmbgcjPHJI8nZ/O1VRjEAFT6popafjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGMT7lxQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403A1C32786;
	Tue,  6 Aug 2024 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722935046;
	bh=BCz5alDXDrczbYyQPbsxtRfrt4U+bf2v3iwbwkAa38U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rGMT7lxQvCazpOBl+z3AIVM50STQBiRN6x6/ABmcdee2M/RwkXNBi9Fhegt9/C+oT
	 JTO471X8BXDPU6uNkQ7UzegCxvxFCOMSRRmbbJHibbPPTrGcssm+I2bruhUScb5tQ7
	 O+DwzAdHgqSuUVaqXTlvOYi6HfvUR1YKP/1x3tb9PqtFXZ+bsuUy54gwosU4VZnQVz
	 92TNnb7tZHsaCAHh1hU60C1MiHRJNtNv1/NY+YEVR9iX3+CJrLRA+6aWFdvJ4BxdjK
	 nxoBMNNwXplduUEYWJXjTMTpmUBQ1mC98lyHY7iQMmnq/N10sC7PbA6UdbY0ed5FjZ
	 RcSjABObQVZjQ==
Message-ID: <c230faec-d359-461e-a717-6708d2710e42@kernel.org>
Date: Tue, 6 Aug 2024 11:04:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] dt-bindings: input: Update dtbinding for adp5588
To: utsav.agarwal@analog.com, Michael Hennerich
 <michael.hennerich@analog.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Oliver Gaskell <oliver.gaskell@analog.com>
References: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
 <20240806-adp5588_gpio_support-v9-3-4d6118b6d653@analog.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240806-adp5588_gpio_support-v9-3-4d6118b6d653@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2024 10:48, Utsav Agarwal via B4 Relay wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
> 

A nit, subject: drop second/last, redundant "dtbinding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Subject: everything is an update. Be descriptive and specific.

> Updating dt bindings for adp5588. Since the device can now function in a
> purely gpio mode, the following keypad specific properties are now made

Hardware changed? How?

> optional:
> 	- interrupts
> 	- keypad,num-rows
> 	- keypad,num-columns
> 	- linux,keymap
> 
> However the above properties are required to be specified when
> configuring the device as a keypad, dependencies have been added
> such that specifying either one would require the remaining as well.
> 
> Note that interrupts are optional, but required when the device has
> either been configured in keypad mode or as an interrupt controller.
> 
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  .../devicetree/bindings/input/adi,adp5588.yaml     | 51 +++++++++++++++++++---
>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> index 26ea66834ae2..827d72ece54b 100644
> --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> @@ -49,7 +49,12 @@ properties:
>    interrupt-controller:
>      description:
>        This property applies if either keypad,num-rows lower than 8 or
> -      keypad,num-columns lower than 10.
> +      keypad,num-columns lower than 10. This property is optional if
> +      keypad,num-rows or keypad,num-columns are not specified since the
> +      device then acts as gpio only, during which interrupts may or may
> +      not be utilized. If specified however, interrupts must be also be
> +      provided as all interrupt communication is h

Don't repeat constraints in free form text.


andled via a single
> +      interrupt line.
>  
>    '#interrupt-cells':
>      const: 2
> @@ -65,13 +70,30 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +
> +dependencies:
> +  keypad,num-rows:
> +    - linux,keymap
> +    - keypad,num-columns
> +  keypad,num-columns:
> +    - linux,keymap
> +    - keypad,num-rows
> +  linux,keymap:
> +    - keypad,num-rows
> +    - keypad,num-columns
> +  interrupt-controller:
> +    - interrupts

How is this related to this patchset? Why? I don't understand what are
you trying to achieve here. Hardware changed? Are you fixing something?
How many issues are you fixing in one (!!!) commit?

> +
> +if:
> +  required:
> +    - linux,keymap
> +then:
> +  required:
> +    - interrupts
> +
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - keypad,num-rows
> -  - keypad,num-columns
> -  - linux,keymap
>  
>  unevaluatedProperties: false
>  
> @@ -108,4 +130,21 @@ examples:
>              >;
>          };
>      };
> -...
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/gpio/gpio.h>

Where do you use these headers?

> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        gpio@34 {
> +            compatible = "adi,adp5588";
> +            reg = <0x34>;
> +
> +            #gpio-cells = <2>;
> +            gpio-controller;
> +        };
> +    };
> +
> +.

Why this change?


Best regards,
Krzysztof


