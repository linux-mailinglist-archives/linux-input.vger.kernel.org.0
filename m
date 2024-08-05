Return-Path: <linux-input+bounces-5360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3898948220
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 21:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9067D1F2365A
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 19:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7348143C6E;
	Mon,  5 Aug 2024 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1XOg7lq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C55364AB;
	Mon,  5 Aug 2024 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722885445; cv=none; b=Dr1dUIlnG4txUwE+LdzBdFZu/p/OxrMcv682MIndDOafalEjaCy2EwuTOzRLz+MvtNhn8YYaAFuYd3G/HUqQ9K44RBzIBapKq72Je2HLRwBIu+7tuhOm9HGhUQhzfyDsixiwdeF2nxFp70b6EKDbWWg7hPjq1uxjjuW6Jcc9A7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722885445; c=relaxed/simple;
	bh=yIzYBRhu3FkCRao5W4ixWWwmAsOLTrfWSG9/9Ucrdsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kwc5j0iuUINwxUE7IfVx15u03yv0ie0pSMVgnRUWfdi7l3pP2LPOiOOiKrcYYwLQo0J2APARzGim8D7NtPar3fxVTtD9zZH/PJJL2i5BaIxqcYUdXjdzAUaDo5gB5o/R9af2Oh/YMDR3l3JS/LYr+93JnSj278rAgDc3myyvyHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1XOg7lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4DAC32782;
	Mon,  5 Aug 2024 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722885445;
	bh=yIzYBRhu3FkCRao5W4ixWWwmAsOLTrfWSG9/9Ucrdsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1XOg7lq5Gb+Iyutvrb8Ggq1n89ppsPewkZrwb13K7CWOXV1ARdNO+yQznlR51CJv
	 x9DjQkQdymtnwglT35Zr3AzKShlloIi9pbSBHhQ2EU+RLp0dmJCQ66l9NgegZpPZbx
	 S6QVW7Q46UxRi9amYrn3ZRfZGrXJhA1TeNTeXK3MCaIm6KiOVSgtIPPViJ783BI2A8
	 ue5GOs/Uyl1OXFptfdXDApl1bygdQuBO2dH64KCQBaI+qRFJnTycQlHXQnh88c93Uq
	 VD2po/oxeg5ZwuWR8jHjjzIzBSo6y1R5jMi6xF2A3CYcnDHnP1IVDk97wQl53JhHjK
	 36UJfSxOdj/Og==
Date: Mon, 5 Aug 2024 13:17:23 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
	dmitry.torokhov@gmail.com, pavel@ucw.cz, krzk+dt@kernel.org,
	conor+dt@kernel.org, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: add binding for qnap,ts433-mcu
 devices
Message-ID: <20240805191723.GA2636745-robh@kernel.org>
References: <20240731212430.2677900-1-heiko@sntech.de>
 <20240731212430.2677900-2-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731212430.2677900-2-heiko@sntech.de>

On Wed, Jul 31, 2024 at 11:24:24PM +0200, Heiko Stuebner wrote:
> These MCUs can be found in network attached storage devices made by QNAP.
> They are connected to a serial port of the host device and provide
> functionality like LEDs, power-control and temperature monitoring.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../bindings/mfd/qnap,ts433-mcu.yaml          | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml b/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
> new file mode 100644
> index 0000000000000..5ae19d8faedbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qnap,ts433-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: QNAP NAS on-board Microcontroller
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  QNAP embeds a microcontroller on their NAS devices adding system feature
> +  as PWM Fan control, additional LEDs, power button status and more.

Doesn't really look like the binding is complete.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qnap,ts433-mcu
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  cooling-levels:
> +    description: PWM duty cycle values corresponding to thermal cooling states.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      maximum: 255

These are fan properties and should be in a "fan" node referencing 
hwmon/fan-common.yaml.

Rob

