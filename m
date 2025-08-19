Return-Path: <linux-input+bounces-14132-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75034B2BA0D
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 09:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0B75245BC
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 07:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E158259CBC;
	Tue, 19 Aug 2025 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqU8qQ7k"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011C1E32C6;
	Tue, 19 Aug 2025 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755586856; cv=none; b=i0GpO5jwfhZIeGg88Q9JJ2reeSp7O8PNr/IJoo2I1YyqbtvVjJxfr68GhB2wQbRimwerm+j5TEIvGPnD2wo/ttPnfeZxf2pZT+Xz0ZTbHZX+fiypnNFpLKmCvvcgESw5YQWMnocTPv+bxPUghSYdXe6jNWxgTIGbOYbYnmwGQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755586856; c=relaxed/simple;
	bh=qPuOc9Ega1pffFKeTePKWI+Bzt1QmJwNdh8xyCSDZDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWPV3PxhcTnnIxw519U5B2zPABi4OTL7G6ryk7eGShFM/rL6nWPsE471lhV3nP1r6bIztzM10rAeF11Yog/6RnHr+Oq9iztCTmYnkQRtt5SRiYwAuXSa3WG1oYpPCcP9zsAnagTtUO9Ag9OvXlE/k1/x7UYyI0nIZnkjxyQi/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqU8qQ7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA93C4CEF1;
	Tue, 19 Aug 2025 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755586855;
	bh=qPuOc9Ega1pffFKeTePKWI+Bzt1QmJwNdh8xyCSDZDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqU8qQ7kdBtEx/UFQ684wBTsD0bLuXCgEuLRXQUIkWPIO7rxsD4U9iPjLVk88IDe6
	 8l0kN/IIj1kTXl9m0zBlMiI+O/AiNljWJL1bOSHYvl/RWXAQ2pfVeyXnhBLm5T/4vg
	 7OMNCmM7lBfuPlCiJiDn2Yuf7uRenQMKXXZ5Brm0vYkooMGNX/XnmB8NrAKkanGbeS
	 jfzLvQA9Q/wFjeQ4WqsBlaIWIZROh79tz4E4TA1/UvSjebrfT3oMT5sPRZn34OU12f
	 Tdv2IJJCfd6cVn95nFA/N/QQnlx6tzvDoOqztk8d07zwCB8IjW/qM5pAc61kGd4lGQ
	 BmQmlKmTzfMGQ==
Date: Tue, 19 Aug 2025 09:00:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, dianders@chromium.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: HID: i2c-hid: parade: Introduce
 bindings for Parade tc3408
Message-ID: <20250819-succinct-burgundy-doberman-09f29f@kuoka>
References: <20250819034852.1230264-1-yelangyan@huaqin.corp-partner.google.com>
 <20250819034852.1230264-2-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819034852.1230264-2-yelangyan@huaqin.corp-partner.google.com>

On Tue, Aug 19, 2025 at 11:48:51AM +0800, Langyan Ye wrote:
> The tc3408 touch screen chip same as Elan eKTH6915 controller
> has a reset gpio. The difference is that they have different
> post_power_delay_ms.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Just "Add foo bar"


> ---
>  .../bindings/input/parade,tc3408.yaml         | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/parade,tc3408.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/parade,tc3408.yaml b/Documentation/devicetree/bindings/input/parade,tc3408.yaml
> new file mode 100644
> index 000000000000..25db85e90b18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/parade,tc3408.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parade tc3408 touchscreen controller
> +
> +maintainers:
> +  - Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> +
> +description:
> +  Supports the Parade tc3408 touchscreen controller.

Describe the hardware, not what binding supports. You just repeated
title, BTW.

> +  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
> +
> +allOf:
> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: parade,tc3408
> +
> +  reg:
> +    const: 0x24
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  panel: true

Drop

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset GPIO.

Drop description, redundant.

> +
> +  vcc33-supply:
> +    description: The 3.3V supply to the touchscreen.
> +
> +  vccio-supply:
> +    description: The 1.8V supply to the touchscreen.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - panel
> +  - vcc33-supply
> +  - vccio-supply
> +
> +additionalProperties: false

unevaluatedProperties instead

Best regards,
Krzysztof


