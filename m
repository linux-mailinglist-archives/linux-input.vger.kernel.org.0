Return-Path: <linux-input+bounces-7988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEA09C219C
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 17:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E674D1F21EC0
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 16:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8219126C0A;
	Fri,  8 Nov 2024 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4Ft/+80"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B989FA41;
	Fri,  8 Nov 2024 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731082202; cv=none; b=ND8BZvugZ/Z3F5grcG6fKMzRA4oep0ZUpjBybyYe71Fxa7caw39gkdSKj3IZp4UmDsnYcUNRHQKAg+8YoUvk2ytGb5fhwvFXe+kRTWa6Uqz7v4sl4xbrx3ywISUIZoDf1aMbiKBOXkuX1G8a00kpfPaeC12PaN9ECht0fap3lv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731082202; c=relaxed/simple;
	bh=DUCS5EkYjsqN1XXXFBeVXFHAS90/e4DckNM6O+xIYQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFxagdVj+X1oyI67WNv1L53vq8oZjBmuO0eNbO3CoYTooFP1+vahcs3tx12X6JwaFAzUP4XiLdkq1+2GAUqZps5MEs/n4Qz7qA8nAE5yGYWnvHC/pAGfkG3UuQUqqE1ENUEKRDqzf2QfuouppEn9P6JS10405pMyFQooOITr9+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4Ft/+80; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C711C4CECD;
	Fri,  8 Nov 2024 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731082202;
	bh=DUCS5EkYjsqN1XXXFBeVXFHAS90/e4DckNM6O+xIYQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4Ft/+80/GYQLEo67l5Grr+bXHYcj4pTs7C7yz9zfGdjnj3DuWoBelOi41BtV4Dae
	 npqLO7K1psSzduPzX3HP3upvFSReZejjKaQFzh4gHmyvOPktLf/AGhkKzVmRm78Aa0
	 GyP7Pe1+oDW4TuPW6TQiiwFgHqY+MdOaMSNqUgOjHoM0ay+bE6UbsKZdaVZf/uNP0I
	 R5m2FUb7JDQ9H9ueKiPPhFgENvcnj1gnmCP9DZ388rXN+0Is/6GiZXqgAdeyhwAHYT
	 DkCGkcNG70u3Wtv+wdLNg7tdeugQpLwXmDIohCnKilvbbxZMAQf80bLD1fnPB6CFfN
	 SUcmGh9iVnG5Q==
Date: Fri, 8 Nov 2024 10:10:00 -0600
From: Rob Herring <robh@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: krzk@kernel.org, hbarnor@chromium.org, dianders@chromium.org,
	conor.dooley@microchip.com, dmitry.torokhov@gmail.com,
	jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Goodix GT7986U SPI HID
 Touchscreen
Message-ID: <20241108161000.GA2270872-robh@kernel.org>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <20241108120311.87795-2-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108120311.87795-2-charles.goodix@gmail.com>

On Fri, Nov 08, 2024 at 08:03:10PM +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
> 
> NOTE: these bindings are distinct from the bindings used with the
> GT7986U when the chip is running I2C firmware. For some background,
> see discussion on the mailing lists in the thread:
> 
> https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.com
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u-spifw.yaml  | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> new file mode 100644
> index 000000000..8105b9ce2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/goodix,gt7986u-spifw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Goodix GT7986U SPI HID Touchscreen
> +
> +maintainers:
> +  - Charles Wang <charles.goodix@gmail.com>
> +
> +description: Supports the Goodix GT7986U touchscreen.

Move to next line.

> +  This touch controller reports data packaged according to the HID protocol
> +  over the SPI bus, but it is incompatible with Microsoft's HID-over-SPI protocol.
> +

If you want to maintain paragraphs you need '>' or '|' after 
'description:'. IIRC, it has to be '|' due to the "NOTE: " here:

> +  NOTE: these bindings are distinct from the bindings used with the
> +  GT7986U when the chip is running I2C firmware. This is because there's
> +  not a single device that talks over both I2C and SPI but rather
> +  distinct touchscreens that happen to be built with the same ASIC but
> +  that are distinct products running distinct firmware.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt7986u-spifw
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  goodix,hid-report-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The register address for retrieving HID report data.
> +
> +  spi-max-frequency: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +  - goodix,hid-report-addr
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      touchscreen@0 {
> +        compatible = "goodix,gt7986u-spifw";
> +        reg = <0>;
> +        interrupt-parent = <&gpio>;
> +        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
> +        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
> +        spi-max-frequency = <10000000>;
> +        goodix,hid-report-addr = <0x22c8c>;
> +      };
> +    };
> +
> +...
> -- 
> 2.43.0
> 

