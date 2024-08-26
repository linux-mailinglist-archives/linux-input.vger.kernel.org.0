Return-Path: <linux-input+bounces-5874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3174995F35C
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 15:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28FB281A16
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 13:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFDC187868;
	Mon, 26 Aug 2024 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taeqgAbA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD62FC08;
	Mon, 26 Aug 2024 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724680657; cv=none; b=XkF4a3zq4li56fPZmgmnDih4N8uX6Q2KOuRNIZJ3hp1HboLMFvKkAukfPM2ooGMd3aQen3jReqdvTHssGslBMJFeaTwuVewirJqXll+BW8Qlp8TSjdNQwA5grpeO6K7/TQxoBmxSGvQWLu1AfkuIoBTnvcSGF9Vna/9jWPzrWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724680657; c=relaxed/simple;
	bh=X//oeaSxSnvJgJjp5uLJev8fa/GTw+ktOEOTQx0Z4Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8v3dpwuQVK/wR1cNKWnd3DcyzAeOwZo3Li7y+jhTUWxH6s4G8X4YQkX8xz95cbEu+U8AkUSIMJoGDWSdalk67SBwLzpAC367TG7Ys2sKrNrKhR8IrKaa3nifru8ncckqdKkTlIIeX2nPuN9Xu20d/NyY9LO6zE3g8evRCnIOyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taeqgAbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DD7C52FC3;
	Mon, 26 Aug 2024 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724680656;
	bh=X//oeaSxSnvJgJjp5uLJev8fa/GTw+ktOEOTQx0Z4Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taeqgAbA652djiX3Rk5Gnh4x5kYkQ3BWcdJW9d5ai2S13BClGEiqbkpSLlwPKCj9b
	 YDm7tQrtiqlb/07Qc4ZbrhaFpvs1HHMZBnvxR1IVSIzzzpoySXbIOwwTFGyIsnULqT
	 vgF1Zk1r8EXlwbik1dJrKt5ULsyGqv5JwiN9FNMePPoe0qSzsto6cJ1U+OIhXKqtmd
	 mQ1qEgwzHoaRQ7jxDz/Y92G5yUhpWy2kCoFEcMtCuERcvPrbn+2LJLEFwmDRQgvd0b
	 xjs4jMOYFfSyDlv7RFYq7NKYEetITX7gVmSIJ8QFaZEej7ilUnRLiZIDYIUK2oBr/E
	 NJbn4JC4SiqmA==
Date: Mon, 26 Aug 2024 08:57:34 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marex@denx.de>, Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/1] dt-bindings: input: touchscreen: convert
 ads7846.txt to yaml
Message-ID: <20240826135734.GA63447-robh@kernel.org>
References: <20240820163710.448302-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820163710.448302-1-Frank.Li@nxp.com>

On Tue, Aug 20, 2024 at 12:37:03PM -0400, Frank Li wrote:
> Convert binding doc ads7846.txt to yaml format.
> Additional change:
> - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> - use common node name touchscreen.
> - sort ti properties alphabetically.
> - sort common properties alphabetically.
> - sort compatible string alphabetically.
> - remove vcc-supply from required list.
> - deprecated ti,x-min, ti,y,min

ti,y-min?

> 
> Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> 	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v4 to v5
> - Add Reviewed-by: Marek Vasut <marex@denx.de>
> - Start sentence with uppercase letter
> 
> Change from v3 to v4
> - new line for all descrptions
> - add . after sentense.
> 
> Change from v2 to v3
> - Remove u16(u32) in descriptions
> - deprecated ti,x-min and ti, y-min
> 
> Change from v1 to v2
> - sort properties, by 3 group:
>   1. General (compatible, reg, interrupt)
>   2. Common properties
>   3. ti properties
> - sort maintainers name alphabetically.
> - uint16 have to be kept because default is uint32
> - remove vcc-supply from required list
> - remove unfinished sentence "all mandatory properties described in"
> because it refer to /schemas/spi/spi-peripheral-props.yaml#
> - fix make refcheckdoc error
> ---
>  .../bindings/input/touchscreen/ads7846.txt    | 107 ----------
>  .../input/touchscreen/ti,ads7843.yaml         | 182 ++++++++++++++++++
>  .../bindings/power/wakeup-source.txt          |   2 +-
>  3 files changed, 183 insertions(+), 108 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml


> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
> new file mode 100644
> index 0000000000000..92d5e7d3b1ffd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI's SPI driven touch screen controllers.

Drop period.

> +
> +maintainers:
> +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +  - Marek Vasut <marex@denx.de>
> +
> +description:
> +  Device tree bindings for TI's ADS7843, ADS7845, ADS7846, ADS7873, TSC2046

Drop 'Device tree bindings for '.

> +  SPI driven touch screen controllers.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ads7843
> +      - ti,ads7845
> +      - ti,ads7846
> +      - ti,ads7873
> +      - ti,tsc2046
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  pendown-gpio:
> +    description:
> +      GPIO handle describing the pin the !PENIRQ line is connected to.

maxItems: 1

> +
> +  vcc-supply:
> +    description:
> +      A regulator node for the supply voltage.
> +
> +  wakeup-source: true
> +
> +  ti,debounce-max:
> +    deprecated: true
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Max number of additional readings per sample.
> +
> +  ti,debounce-rep:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Additional consecutive good readings required after the first two.
> +
> +  ti,debounce-tol:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Tolerance used for filtering.
> +
> +  ti,hsync-gpios:
> +    description:
> +      GPIO line to poll for hsync.

maxItems: 1

With those fixes,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

