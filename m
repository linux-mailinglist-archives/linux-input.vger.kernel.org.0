Return-Path: <linux-input+bounces-7636-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 689929AC1EB
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 10:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9718D1C250E1
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 08:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFC915A85A;
	Wed, 23 Oct 2024 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVe91hxx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E185158853;
	Wed, 23 Oct 2024 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672844; cv=none; b=O7va1qwdRTkt2xMv5DEfQDLd5R3jtK/+ZprwbgjvPextxg8MAuAqtgeXP6+qyMOnPXWWVh8cB9R1qdRnPmK8QUdCHL90sFQKUQOwpvgW66xQMIyJLUdsskJ8SPSGynTPXzgkRJGaXl97MXmclbbUQGBbfxAGsDP7/bvu8FozmWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672844; c=relaxed/simple;
	bh=4H0UsMMCB9JmXCIXGi6MOZ2ghoBeo+pJlx+1NAUoIE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njMfjXjOa4q+kn5fX8kkNU+J0NXp8us5W08jjcecgQWgRZPFzAPOcDSBmuj5rJT5dDZ9vgJghiP9p/4DahDUPjnJv27LM8wJR1PJfCUvfNc06TMx2lgwkbZaR3aTTlutEe1SuT/dBLPjhyrLFeOz0I9rY7mUeOaFQbNe/Lulo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVe91hxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D07C4CEC6;
	Wed, 23 Oct 2024 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672844;
	bh=4H0UsMMCB9JmXCIXGi6MOZ2ghoBeo+pJlx+1NAUoIE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVe91hxxIAj5lgLDqV3KLSD503KzeVxHdgwyPek9j+R3hPC4ysAw2q+78VZuDW4Di
	 HKjvz+zuaejEfSonQmlXo9YbCwTqADZxaUULGvURgtSmpoZcAdeOtwFgc83QeKJHKE
	 bELolJUT8cVHRDa+rE63dvfTgz6Bggp0NLjWgpwD7bB5aeFMpKTGUrwEVLb21ipj5d
	 MMS2QVkP5HxgB2x+B4vmqV5B2ZGfWZgf8k0Ri7r4Hw3rsMmw29Xtk3BOuKFOAF+1Fx
	 Hr6OHoLiW6pDSJZx5pX2zgd8sXtjUBXinYooAJRH14s6qfmDWk6cCmlWMSXED+UvXe
	 POwLXW/I5FBew==
Date: Wed, 23 Oct 2024 10:40:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mjchen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mjchen@nuvoton.com, 
	peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-2-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022063158.5910-2-mjchen0829@gmail.com>

On Tue, Oct 22, 2024 at 06:31:57AM +0000, mjchen wrote:
> From: mjchen <mjchen@nuvoton.com>
> 
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: mjchen <mjchen@nuvoton.com>
> ---
>  .../bindings/input/nvt,ma35d1-keypad.yaml     | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
> 

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> diff --git a/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
> new file mode 100755
> index 000000000000..3d9fc26cc132
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml

Filename based on compatible. There is no nvt prefix. Entire filename is
somehowdifferent than compatible.

> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nvt,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVT MA35D1 Keypad

NVT? Nuvoton?

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
> +  debounce-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Missing vendor prefix... or why are you not using existing properties?

> +    description: |
> +      key debounce period select

select? or clock cycles? I don't understand this. Say something useful
here.


> +      0  = 0 clock
> +      1  = 0 clock
> +      2  = 0 clock

Heh? So this is just 0

> +      3  = 8 clocks

This is 8

> +      4  = 16 clocks

16, not 4

> +      5  = 32 clocks
> +      6  = 64 clocks
> +      7  = 128 clocks
> +      8  = 256 clocks
> +      9  = 512 clocks
> +      10 = 1024 clocks
> +      11 = 2048 clocks
> +      12 = 4096 clocks
> +      13 = 8192 clocks

Use proper enum


> +
> +  per-scale:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Row Scan Cycle Pre-scale Value (1 to 256).

Missing constraints

> +
> +  per-scalediv:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Per-scale divider (1 to 256).

Missing constraints

Both properties are unexpected... aren't you duplicating existing
properties?

> +
> +  reg:
> +    maxItems: 1
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
> +  - debounce-period
> +  - per-scale
> +  - per-scalediv
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad: keypad@404A0000 {

Lowercase hex and drop the unused label

> +      compatible = "nuvoton,ma35d1-kpi";
> +      reg = <0x404A0000 0x10000>;

Lowercase hex

Best regards,
Krzysztof


