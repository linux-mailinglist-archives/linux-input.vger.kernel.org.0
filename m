Return-Path: <linux-input+bounces-8266-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA159DA422
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 09:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BCFAB2527F
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 08:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03C7186E46;
	Wed, 27 Nov 2024 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW/PkkEh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D460145FE4;
	Wed, 27 Nov 2024 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732697221; cv=none; b=NaE5bhBhRK5Oi828ZtbR1xpzlR7nuYuVPPxhLsG057Ge1R9ODK4BJKsBQAwCVPvmi3MdyaMsziBkdrH4MKYDuXy1xlhRHhPvQaMmLei9chadctSer/McXHy8Rn1reX6dsT6rXrxtnTTcinlVrUA+OTBiCCgtV8LtIkrKhFjtkuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732697221; c=relaxed/simple;
	bh=GTmcK6810k0tMqXrtwzmbmpxoBbVpNLZAlHC/hMJFhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIJNf6ZUsMvRuyFcp8x1iefoC+k34cEw8AI8Z54tDLzls/N+uiqcgPOQiC+HItSypXn9LgoC1RWG9/qr1lIAao+Grhbl8l/rAj0WBKR6AG9OqjumrYuJlY2opZHMsS0znDPMCZFjWUe/UG413Ovdl6Ra/qeDcwKun4Az9lBDRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW/PkkEh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFB8C4CECC;
	Wed, 27 Nov 2024 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732697221;
	bh=GTmcK6810k0tMqXrtwzmbmpxoBbVpNLZAlHC/hMJFhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW/PkkEhxp5ZHRTGvjhuw/czVQewAiY6e02kmJqmxaJ3n47pujQfy/d1F4yHIeGOR
	 kpk+bSMPob9Q+nwu8YFxutG8iWfoaR144RqCbK38xUJXKpWst1/crHlHsed6HJgEYE
	 zNArY5xupPABAHzY9T8fWdCUDHmTfg4tI5He5PR22LP7eennCYgzGAMsPYyI8GWsq6
	 UHfLdyWL4IpyljmyCer0rIYFuTUzV5WXlLCx+JXZG4u2px2j1TfKQqcluWwRZ4vpIg
	 hApqiKmkN9eu5sQN9Lo5dx7gClbPch7av5WAZe9CImNbUdzevzyCIX0D3fudZxrHjK
	 AendJd75mE/2Q==
Date: Wed, 27 Nov 2024 09:46:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Message-ID: <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-1-c43c4cc6200d@gmail.com>

On Tue, Nov 26, 2024 at 09:47:59PM +0100, Sasha Finkelstein wrote:
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,j293-touchbar
> +          - apple,j493-touchbar
> +      - const: apple,z2-touchbar
> +      - const: apple,z2-multitouch

What is the meaning of these two last compatibles in the list? What are
these devices?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  cs-gpios:
> +    maxItems: 1
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      J293 has a hardware quirk where the CS line is unusable and has
> +      to the be driven by a GPIO pin instead
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  label:
> +    maxItems: 1

Why is this needed? I think it is not part of common touchscreen schema.
Drop, devices do not need labels - node name and unit address identify
it. If this is needed for something else, then come with generic
property matching all touchscreens.

> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true

Drop these two

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reset-gpios
> +  - firmware-name
> +  - label
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        touchscreen@0 {
> +            compatible = "apple,j293-touchbar", "apple,z2-touchbar",
> +                         "apple,z2-multitouch";
> +            reg = <0>;
> +            spi-max-frequency = <11500000>;
> +            reset-gpios = <&pinctrl_ap 139 0>;
> +            cs-gpios = <&pinctrl_ap 109 0>;

Use proper GPIO bindings constants. You included header for this, I
guess.

> +            interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
> +            firmware-name = "apple/dfrmtfw-j293.bin";
> +            touchscreen-size-x = <23045>;
> +            touchscreen-size-y = <640>;
> +            label = "MacBookPro17,1 Touch Bar";
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.47.1
> 

