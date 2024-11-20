Return-Path: <linux-input+bounces-8163-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D69D35AE
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 09:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF5CAB22B5F
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 08:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D4616DEB5;
	Wed, 20 Nov 2024 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VECQN232"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A1E15B115;
	Wed, 20 Nov 2024 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732092107; cv=none; b=i9IDWrBfiDg4UOWdp9TyMQe38sRCBg0djyMWb9V+0NccZ7WhffoPVRHl7ZXIfKpqud6AQI4pmpf+CFmArLCTl58AKqrI4mzAPhEjJyuay8Xj6QQtVWvm2Kr7Z9YeLBbp4Kw79FpxFGDgzN84txFOU2JYSjhVqqHLCZuzrNp0IhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732092107; c=relaxed/simple;
	bh=4rfnlRucQnUgzLpd0n5nAO1dDQNhlvEJVooFv39keHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jbn/67n8DIO8Vmh5H5HAaA3m4TAnxU07QAh4pEQ4a/Zy9NUWPKDdqyiQC6m1mGg23YO3DwEMO3mM+vCAQydOMKRR/gQT4gjd67VwdMJ1LjK7m+l4f3C36+Q4mEgox4mC+cfrellw8KalwRTnXQwqBhEoBVaziFM7aN3yk4/nuoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VECQN232; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CE1C4CECD;
	Wed, 20 Nov 2024 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732092106;
	bh=4rfnlRucQnUgzLpd0n5nAO1dDQNhlvEJVooFv39keHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VECQN232ULMNimccmpdbW1C1om6Kf4R7RvMR84F0yabWNow5lQfMHwQ/B6A/cjjh/
	 UTmHEGpksoGNB/8wgoqDIzJJCbZYoeQwWe1tHY4n1GhQIWdzN9vQHhUe9pnYv2EXBI
	 04Va3NGM4V+Z9XdwOoGO4GvfIvRBH3Yp4ZV1fCPvieTBvJIGpUd0qALi7JnI5WJe7y
	 IN2N//7VtZGwQBw8ViTaIssdg459szyR6JkL2rT0D6zpKKahEL3Mb5l8zhxKn5bm1V
	 kfaZcCnx0AsUpe5LmLvnv5gspYU6GRVNzfEqeoIz7N9GDVsF8CcW/GAFywkDJUYziB
	 NFfsHLsgZJJhw==
Date: Wed, 20 Nov 2024 09:41:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ming-Jen Chen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com, 
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <ql6m6qrdokwfu4iizn6wmvovawuc7kgg6jfzxebkmac5muz66e@myrjvq5jm7gg>
References: <20241119025954.4161-1-mjchen0829@gmail.com>
 <20241119025954.4161-2-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119025954.4161-2-mjchen0829@gmail.com>

On Tue, Nov 19, 2024 at 02:59:53AM +0000, Ming-Jen Chen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..9ccd81a2574d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

Filename matching compatible. You got this comment already.


> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Keypad
> +
> +maintainers:
> +  - Ming-jen Chen <mjchen0829@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-kpi
> +
> +  debounce-delay-ms:
> +    description: Debounce delay time in milliseconds.
> +    maxItems: 1
> +
> +  scan-interval-ms:
> +    description: Scan interval time in milliseconds.
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1

Keep the same order of properties as in required: block.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - linux,keymap
> +  - keypad,num-rows
> +  - keypad,num-columns
> +  - debounce-delay-ms
> +  - scan-interval-ms
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad@404A0000 {

Lowercase hex

> +      compatible = "nuvoton,ma35d1-kpi";
> +      reg = <0x404A0000 0x10000>;

Lowercase hex

Best regards,
Krzysztof


