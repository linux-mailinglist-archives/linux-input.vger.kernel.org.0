Return-Path: <linux-input+bounces-8024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F369C48B4
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 23:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC84DB2503D
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 21:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01AB1B3727;
	Mon, 11 Nov 2024 21:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8XPn4F2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09881AA7AF;
	Mon, 11 Nov 2024 21:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731361048; cv=none; b=c/q/+o4iSpuFb7IOafXuf3vEKuyOv9vZG/Yg9W36//EH7B8M4Cc17DR+6kkyq/mqqLBZJNtsQ4kpix356VUO2yT060lzoR8eJUJ6tZYqTilf1M9Rs8vmbvLNlYIhDj8TTIhrJQaAHwMOYK+8NQzSqeTNeNyn48UKvqeAw8aRtlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731361048; c=relaxed/simple;
	bh=jfJJy/bveNzXbnV53njoI+W6YmS83Ujoh1sYeNAwICo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgbTc5oaUzGErBGkPVC2/t1QkmnTVdGt1ZdF9bizq0XBr2vv3WaAZiqFod3qO6sX/V67OwbXl2wBN1C2U23avBx8dGiZf8t0T6TpmcjmoDnQ7KrWS0jCdrOqBfMntCNUVGCb3TzLYfdGPgKrpqyOCHULM9/pk5M2sfx/XNBNgto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8XPn4F2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE517C4CECF;
	Mon, 11 Nov 2024 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731361046;
	bh=jfJJy/bveNzXbnV53njoI+W6YmS83Ujoh1sYeNAwICo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8XPn4F28Hp7bIepuNcTeY47tPnJAnRk0lsYWTEbdGlgudyG0c9GfQRgCWnj4jUxK
	 fSno58VibNBHi+3dC8gxjIEb4UWRXYfm83LyCn6bTleIyRcajzfDrMAVDGugFM6Z90
	 /DXNpqS2sLyMKNVDyJbE5RF4g3H9RjX8Q3HfKH+gfmfCsZ69rmcmhW/ljuK96tUgU2
	 HMIDR+Y3B3R1D3gJgAwlNza61xmXf2E95oEL8OqomPJ0BPr0zeSWVF5ejt8uIgut+v
	 919o9M5MeWZMHsoeyl0MSPswjS5BnPK+oL1Es0HaeRMlkEn0Y836f9V1BRG4xFlplU
	 PFbCmtMcJyVdw==
Date: Mon, 11 Nov 2024 15:37:23 -0600
From: Rob Herring <robh@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: input: matrix_keypad - convert to
 YAML
Message-ID: <20241111213723.GA1976774-robh@kernel.org>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
 <20241105130322.213623-4-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105130322.213623-4-markus.burri@mt.com>

On Tue, Nov 05, 2024 at 02:03:18PM +0100, Markus Burri wrote:
> Convert the gpio-matrix-keypad bindings from text to DT schema.

Please don't thread new versions to previous thread.

> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  .../bindings/input/gpio-matrix-keypad.txt     | 49 ---------
>  .../bindings/input/gpio-matrix-keypad.yaml    | 99 +++++++++++++++++++
>  2 files changed, 99 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
>  create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> deleted file mode 100644
> index 570dc10..0000000
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -* GPIO driven matrix keypad device tree bindings
> -
> -GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
> -The matrix keypad supports multiple row and column lines, a key can be
> -placed at each intersection of a unique row and a unique column. The matrix
> -keypad can sense a key-press and key-release by means of GPIO lines and
> -report the event using GPIO interrupts to the cpu.
> -
> -Required Properties:
> -- compatible:		Should be "gpio-matrix-keypad"
> -- row-gpios:		List of gpios used as row lines. The gpio specifier
> -			for this property depends on the gpio controller to
> -			which these row lines are connected.
> -- col-gpios:		List of gpios used as column lines. The gpio specifier
> -			for this property depends on the gpio controller to
> -			which these column lines are connected.
> -- linux,keymap:		The definition can be found at
> -			bindings/input/matrix-keymap.txt
> -
> -Optional Properties:
> -- linux,no-autorepeat:	do no enable autorepeat feature.
> -- wakeup-source:	use any event on keypad as wakeup event.
> -			(Legacy property supported: "linux,wakeup")
> -- debounce-delay-ms:	debounce interval in milliseconds
> -- col-scan-delay-us:	delay, measured in microseconds, that is needed
> -			before we can scan keypad after activating column gpio
> -- drive-inactive-cols:	drive inactive columns during scan,
> -			default is to turn inactive columns into inputs.
> -
> -Example:
> -	matrix-keypad {
> -		compatible = "gpio-matrix-keypad";
> -		debounce-delay-ms = <5>;
> -		col-scan-delay-us = <2>;
> -
> -		row-gpios = <&gpio2 25 0
> -			     &gpio2 26 0
> -			     &gpio2 27 0>;
> -
> -		col-gpios = <&gpio2 21 0
> -			     &gpio2 22 0>;
> -
> -		linux,keymap = <0x0000008B
> -				0x0100009E
> -				0x02000069
> -				0x0001006A
> -				0x0101001C
> -				0x0201006C>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> new file mode 100644
> index 0000000..745652b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO matrix keypad
> +
> +description: |

Don't need '|' if no formatting.

> +  GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
> +  The matrix keypad supports multiple row and column lines, a key can be
> +  placed at each intersection of a unique row and a unique column. The matrix
> +  keypad can sense a key-press and key-release by means of GPIO lines and
> +  report the event using GPIO interrupts to the cpu.
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: gpio-matrix-keypad
> +
> +  row-gpios:
> +    description: |

Ditto.

> +      List of GPIOs used as row lines. The gpio specifier
> +      for this property depends on the gpio controller to
> +      which these row lines are connected.

Why the odd line length? Wrap at 80 char unless there's some exceptional 
reason to go to 100.

> +
> +  col-gpios:
> +    description: |
> +      List of GPIOs used as column lines. The gpio specifier
> +      for this property depends on the gpio controller to
> +      which these column lines are connected.

Is there some reasonable range of GPIOs? 1xN is in theory possible, but 
surely no one would use N+1 GPIOs for what could be done with N GPIOs? 
So 'minItems: 2'. A max is not so clear. Eventually, I guess you 
couldn't scan them fast enough. 64 or 128 seems like way more than 
anyone would do.

> +
> +  linux,keymap:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      An array of packed 1-cell entries containing the equivalent of row,
> +      column and linux key-code. The 32-bit big endian cell is packed as:
> +          row << 24 | column << 16 | key-code

If you are copying another schema, you are doing it wrong...

You need a $ref to matrix-keymap.yaml.

> +
> +  linux,no-autorepeat:
> +    type: boolean
> +    description: Do not enable autorepeat feature.
> +    default: false

Drop 'default'. Doesn't apply to booleans.

> +
> +  wakeup-source:
> +    description: |
> +      Use any event on keypad as wakeup event.
> +      (Legacy property supported: "linux,wakeup")

Not supported if it is not in the schema. I imagine that's been 
deprecated long enough, you can just drop mentioning it.

> +    default: false

Drop.

> +
> +  debounce-delay-ms:
> +    description: Debounce interval in milliseconds.
> +    default: 0
> +
> +  col-scan-delay-us:
> +    description: |
> +      Delay, measured in microseconds, that is needed
> +      before we can scan keypad after activating column gpio.
> +    default: 0
> +
> +  drive-inactive-cols:
> +    type: boolean
> +    description: |
> +      Drive inactive columns during scan,
> +      default is to turn inactive columns into inputs.
> +    default: false

Drop

> +
> +required:
> +  - compatible
> +  - row-gpios
> +  - col-gpios
> +  - linux,keymap
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    matrix-keypad {
> +        compatible = "gpio-matrix-keypad";
> +        debounce-delay-ms = <5>;
> +        col-scan-delay-us = <2>;
> +
> +        row-gpios = <&gpio2 25 0
> +                     &gpio2 26 0
> +                     &gpio2 27 0>;
> +
> +        col-gpios = <&gpio2 21 0
> +                     &gpio2 22 0>;
> +
> +        linux,keymap = <0x0000008B
> +                        0x0100009E
> +                        0x02000069
> +                        0x0001006A
> +                        0x0101001C
> +                        0x0201006C>;
> +    };
> -- 
> 2.39.5
> 

