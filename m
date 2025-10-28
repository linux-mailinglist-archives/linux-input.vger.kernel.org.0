Return-Path: <linux-input+bounces-15772-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 432EDC135B9
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 08:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 095A0565DD0
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 07:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7158B29B224;
	Tue, 28 Oct 2025 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzEqqrCE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2244E86337;
	Tue, 28 Oct 2025 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761637131; cv=none; b=EM0RdkG6GcDUqg22Q9IgjBA+laBJ/HDqwi/3f306YWYjkIBI7eG05lQA+Dh2mil7oNSRPLA6mmiZ/URjJcFCVdancPEGpCWxKz0y1/qbhO8NU+B9a0U/7BQsBEcRQ3nJen+7CvDAWuvngZveG81EKDsNVbe/EOjFCe7cc+e0OFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761637131; c=relaxed/simple;
	bh=9mGaj0sbbdNrxuAO9crC1CuxjMpvcFqHIz84NURNSS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WW7ZUF09zkHHsNjLfMA9qlCm1KDbgwZQN/KJy4XS6jUUrRhrnMmr45euw+8gej6i2vKnYSVuCxM35V1FCv3U+DcslF06x9OB3TPWeyf3GIObghhXngtkxGPRs7rGIq7NBOjLc/IZSt5NP/PTKM2bqfA3cFsVhuY5sCCjCYyc/EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzEqqrCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF70C4CEE7;
	Tue, 28 Oct 2025 07:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761637130;
	bh=9mGaj0sbbdNrxuAO9crC1CuxjMpvcFqHIz84NURNSS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzEqqrCEYkYDhMPTFAIOuO2h/oq+tBfbJENgxk/s1/SY0jgJdhP56yb42Qsqz1o3A
	 ZBQ/AKLWy11BdWyZnpv0HNWb9cQr6IWl7inWbLxwwGE2OR7uqRzYNNhcs6O8pPCbE9
	 WwmbcFq1L6WoDFvnRl/PVgKyM4iSUSljgd9b8s0BYTd8FIFyWT3+2BDk4kPj3IiW5/
	 slWPRs+O1XszHouwLVgZsFJIrJnj9RPonYNqCaUtE7NmYcrsmyE6P6s1Kq/zOWVDo3
	 llEDlXmlWk8Gynftch+k3ImSRcvDJVL6ZLBeCzbAkfTfNdA/exKD6SxdfS5axmojdl
	 b0RlHdP2pGHSg==
Date: Tue, 28 Oct 2025 08:38:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hendrik Noack <hendrik-noack@gmx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Input: Add Wacom W9000-series penabled
 touchscreens
Message-ID: <20251028-hairy-caped-pronghorn-88d9b8@kuoka>
References: <20251027164050.113623-1-hendrik-noack@gmx.de>
 <20251027212535.4078-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027212535.4078-1-hendrik-noack@gmx.de>

On Mon, Oct 27, 2025 at 10:25:34PM +0100, Hendrik Noack wrote:
> Add bindings for two Wacom W9007 variants which can be found in tablets.
> 
> Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
> ---
>  .../input/touchscreen/wacom,w9000-series.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,w9000-series.yaml

Filename matching compatible,

> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,w9000-series.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,w9000-series.yaml
> new file mode 100644
> index 000000000000..93579ae0297e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,w9000-series.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/wacom,w9000-series.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Wacom W9000-series penabled I2C touchscreen driver

Driver as Linux driver? if so, then drop.

> +
> +description:
> +  The W9000-series are penabled touchscreen controllers by Wacom.
> +
> +maintainers:
> +  - Hendrik Noack <hendrik-noack@gmx.de>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - wacom,w9007a_lt03
> +      - wacom,w9007a_v1

None of the compatibles use underscores. Please do not come up with
entirely different coding style than existing kernel.

Also, nothing explain here differences - not commit msg, not
description.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description:
> +      Optional regulator for the VDD digital voltage.
> +
> +  pdct-gpios:
> +    maxItems: 1
> +    description:
> +      Optional GPIO specifier for the touchscreen's pdct pin.
> +
> +  flash-mode-gpios:
> +    maxItems: 1
> +    description:
> +      Optional GPIO specifier for the touchscreen's flash-mode pin.
> +
> +  pen-inserted-gpios:
> +    maxItems: 1
> +    description:
> +      Optional GPIO specifier for the touchscreen's pen-insert pin.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      digitizer@56 {
> +        compatible = "wacom,wacom,w9007a_v1";
> +        reg = <0x56>;
> +        interrupt-parent = <&gpx3>;
> +        interrupts = <5 IRQ_TYPE_EDGE_RISING>;
> +
> +        vdd-supply = <&stylus_reg>;
> +
> +        pdct-gpios = <&gpd1 2 GPIO_ACTIVE_HIGH>;
> +        flash-mode-gpios = <&gpd1 3 GPIO_ACTIVE_HIGH>;
> +        pen-inserted-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>;
> +
> +        touchscreen-x-mm = <262>;
> +        touchscreen-y-mm = <164>;

Never tested, after fixing compatible you will see errors. You need
unevaluatedProperties.

Best regards,
Krzysztof


