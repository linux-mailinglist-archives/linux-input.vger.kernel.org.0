Return-Path: <linux-input+bounces-14335-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70181B37C04
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 09:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC33D1BA136A
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 07:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9582318139;
	Wed, 27 Aug 2025 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="MIoeDUY0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF064317709;
	Wed, 27 Aug 2025 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280436; cv=none; b=eqOC3j1Ggky7bgzIlNWryY6fdIwadmfXbqyL+2ps8T/4Vpbof88DwuLxKcMcm7TDTEULfvznBTm8NcnR2qWFkhVg4806gSHyxGqZZTOVDYQjLKd3nQ7HdQSseG9sMx/MUrUz88+AJf3T0a6cHN1QJk+ttRN2RpCaB4qxyvghZ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280436; c=relaxed/simple;
	bh=rqPWaLDRg3bp/PAzP6w8uq+EP8F3u9Ob0SvOy41xlbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8oeZyhGhWxNsjcPNlqsvZOchtV/dtDVpvClTZVCV1BFQxW6/CP1oNjJLVPg+pCdhiNHyXrQRGSw2X97FlkrZKITFGIX7SzDYNpkZUc/Uy2XBqrqwpzhodUybsMwPTZGKk3neW+vOJrQZrix4PVT8geQO2lNHZgP+UBWZl28zVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=MIoeDUY0; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72CED1486D83;
	Wed, 27 Aug 2025 09:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756280425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qMxDqcO10CQjtqMyM0nhgxsy6XVaXNzX5ZNKBhwX5EE=;
	b=MIoeDUY0bHvT9/EGh+S8MX5ao+f4UgDTS15BKzwXl/CJi0KT0eUVTF55jYcJ4Bh2ONggfM
	ODcAIKfvYC/BlwBwywHeb4OKOKNcnzAziBkWJBu+nSBq4LA3Ba3XPv6itIupAmbc2ndOEI
	bL9eANLD5NJ5LHOHhDQ8cXbcutGI3hjmbX/fUaVgZjifWE9qo7D5LqmOjHxzsO0DguPnYy
	Ga83w5aiTOqVYF9qW4sc72gWPX4tj99WBPuttYp7iZoGofkPzMvH2sUM+wHZQp5YhWUhgo
	5N30Jf/kA0RrOUguoUW08kydVEG+Sv8HctxboELf+WFzJEqIQoNCGaY/b5ovNQ==
Date: Wed, 27 Aug 2025 09:40:17 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support
 for blue and red LEDs
Message-ID: <20250827-psychic-exclusive-be9758124693@thorsis.com>
Mail-Followup-To: Julien Massot <julien.massot@collabora.com>,
	kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
 <20250826-radxa-nio-12-l-gpio-v2-3-7f18fa3fbfc8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-radxa-nio-12-l-gpio-v2-3-7f18fa3fbfc8@collabora.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Julien,

Am Tue, Aug 26, 2025 at 04:01:54PM +0200 schrieb Julien Massot:
> The Radxa NIO 12L board has an RGB LED, of which only red and blue
> are controllable.
> 
> Red and blue LEDs: no need to choose, both are enabled.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index fd596e2298285361ad7c2fb828feec598d75a73e..12288ad4d2932b7f78c96c0efe366a046721f919 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>  #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>  #include <dt-bindings/spmi/spmi.h>
> @@ -73,6 +74,28 @@ button-volume-up {
>  		};
>  	};
>  
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-0 = <&gpio_leds_pins>;
> +		pinctrl-names = "default";
> +
> +		/*
> +		 * This board has a RGB LED, of which only R and B
> +		 * are controllable.
> +		 */
> +		led-0 {
> +			label = "rgb-blue";
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 6 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			label = "rgb-red";
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> +		};

The label property is deprecated, and if I'm not mistaken not
recommended for new boards.  Do you have a reason to set it?
If so, it might be worth adding in the commit message.

Greets
Alex

> +	};
> +
>  	wifi_vreg: regulator-wifi-3v3-en {
>  		compatible = "regulator-fixed";
>  		regulator-name = "wifi_3v3_en";
> @@ -647,6 +670,14 @@ pins {
>  		};
>  	};
>  
> +	gpio_leds_pins: gpio-leds-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>,
> +				 <PINMUX_GPIO7__FUNC_GPIO7>;
> +			output-low;
> +		};
> +	};
> +
>  	i2c2_pins: i2c2-pins {
>  		pins-bus {
>  			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
> 
> -- 
> 2.50.1
> 
> 

