Return-Path: <linux-input+bounces-17162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AAD38E2A
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 12:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9B9F3007F3F
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 11:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C3130E0FD;
	Sat, 17 Jan 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fieo88oY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38412D1F64;
	Sat, 17 Jan 2026 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648927; cv=none; b=Rj03mWKkjOZ95XqCFGtxJb0DryoqsAeRp2i00U9P26VIkQz0gzCPB67nkNTnAYH6Ge4WIrpCdA9hahCbStdsAVuSkbUQdp3Z58oktWdvoeBEb95IIxGnNGoJl/NxLYHTiQH2lYhH8jcTJbdbYeehTj52pnM0Sa8dl2ujmycVwHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648927; c=relaxed/simple;
	bh=hYwB2vvwHRKxZQJkwK+Y1EVWEYEd4ISgWAGzdtYEy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stscbttnVvGQY76JYQqQKWHh37VJkFJ1bOm+cUIuLD90tA0JVtSHD1dMy+9/0iJyMJa4dabf4DMNKLCihfGs/NmlNL1+D6qqkTQkjgzqdnTxLtki9GDuk3GJ2F/42mlg/oJB/KWTVcD8BvpkMOFK/i5p43n1on8bTsdQeWQmb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fieo88oY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB7CC4CEF7;
	Sat, 17 Jan 2026 11:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648926;
	bh=hYwB2vvwHRKxZQJkwK+Y1EVWEYEd4ISgWAGzdtYEy+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fieo88oYAoHm7NqfjZqxl/SyL5ZrtdeOJupqHKaQKK+gB5U0bvqNy9IF3BvJLFc/u
	 cvpAIUGplEr4zxzzQ3dE24vGsOTAlsQQcaoW9IkrdB8Z/NIHhOHlnQiZMW3jmFaV9q
	 8Lfo/Z29IRPpMcTdF3xwtT1tV50osUpTTv7mz1Sudy2Q2AKRNpJ0bW1O6onV5B4HiW
	 Mn8ddhuQoD78q+Z1ajOuXX825fYTx0F7ap6Lto95c7qSQ18Acqkg3YI2JWnwPmty1c
	 s49OqfjIFUNRXZf0/xGKM1bAIC1uh3jvWnjaXVJuni+cmtjJHHd2VsezcpieZZSwIf
	 YpX/6xGIBmNhQ==
Date: Sat, 17 Jan 2026 12:22:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Job Noorman <job@noorman.info>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: touchscreen: trivial-touch: Drop
 'interrupts' requirement for old Ilitek
Message-ID: <20260117-grinning-heavy-crab-11f245@quoll>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>

On Sat, Jan 17, 2026 at 01:12:02AM +0100, Marek Vasut wrote:
> The old Ilitek touch controllers V3 and V6 can operate without
> interrupt line, in polling mode. Drop the 'interrupts' property
> requirement for those four controllers. To avoid overloading the
> trivial-touch, fork the old Ilitek V3/V6 touch controller binding
> into separate document.

One if: block is fine, so IMO, this should stay in original binding
especially that more devices like some azoteq or semtech might have same
rule of not requiring interrupt line. Anyway, no big deal.

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Job Noorman <job@noorman.info>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Fork the Ilitek V3/V6 bindings into separate document
> V3: Add RB from Frank
> V4: No change
> ---
>  .../input/touchscreen/ilitek,ili210x.yaml     | 51 +++++++++++++++++++
>  .../input/touchscreen/trivial-touch.yaml      |  4 --
>  2 files changed, 51 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
> new file mode 100644
> index 0000000000000..1d02aaba64f97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/ilitek,ili210x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI21xx/ILI251x V3/V6 touch screen controller with i2c interface
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ilitek,ili210x
> +      - ilitek,ili2117
> +      - ilitek,ili2120
> +      - ilitek,ili251x
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
> +  wakeup-source: true
> +
> +allOf:
> +  - $ref: touchscreen.yaml

allOf: should be placed after required: block.

With this one fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


