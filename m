Return-Path: <linux-input+bounces-9004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D36ADA049EF
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A34218881C3
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F671F4710;
	Tue,  7 Jan 2025 19:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+qp9v0q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2451E9B11;
	Tue,  7 Jan 2025 19:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736276976; cv=none; b=m+TTrLX/9XH4gPJyqZXS5UhijG4jsItxgwwKwHobFEVotjG0NNWZ0LOqs/cjyptI0XK0DJj+6rHcx8HQcdA5nCePhkiYTgxBv9FgGgnKQlWaNNrccdFYZWmqwT76sOlU4ihfTiQyiJ1BvDF9IZD7MP/2dJ+843evAc+XaOFNCrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736276976; c=relaxed/simple;
	bh=1tBC7cJN7ZXqKDzDsNUCY9EcGMZKGNY1yIrIa5BgrK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6u82jR7U3V4u3FQspivlFmV9Q7f8mt/jInCv/ZwQCQIV4mP42/trnQmaBWU9zBqW2k8dmaYwZ2Ozp6QNsGxbbhJHSjNA5K60mZClGoLSATTLct6pFSSPndCa0KO3OeuAMSC7YEmNTl04D+iirq8znY0qnD885fSC1YekOL+LVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+qp9v0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69323C4CED6;
	Tue,  7 Jan 2025 19:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736276975;
	bh=1tBC7cJN7ZXqKDzDsNUCY9EcGMZKGNY1yIrIa5BgrK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+qp9v0qG6uMCzlcsc7WluJu6xVJ9mT4U/UQYUk+PF3sHZu5NPGLZzYvjVGV4m17p
	 m/uTWPkEHv4C2B9radDqVI3Sh2tt9+sJF3xwlZNB1zLpdjRIUK5EDYNV3MdyEdocBm
	 BWtSRVzH+XTOC4JCo9Nku7V9Bqc3zagJkZpJgi4l9GyFbTKsCpqii5D1+sPxDS3/PX
	 XPvqz3xBgykT/awJ9idowf+vVr/uAsGf1Y2sCW6arUxjc+Oc6p0i5EotaYyYmDfab+
	 VGyfLEwM71W6GFkUxawsHIK6/BQbBXAIw0R+EA8paYuCG94H+b6lVyYtmLOvIkyJrE
	 7oTxZhakAMa3A==
Date: Tue, 7 Jan 2025 13:09:34 -0600
From: Rob Herring <robh@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: input: matrix_keypad - convert to
 YAML
Message-ID: <20250107190934.GA1320081-robh@kernel.org>
References: <20250107135659.185293-1-markus.burri@mt.com>
 <20250107135659.185293-4-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107135659.185293-4-markus.burri@mt.com>

On Tue, Jan 07, 2025 at 02:56:55PM +0100, Markus Burri wrote:
> Convert the gpio-matrix-keypad bindings from text to DT schema.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> ---
>  .../bindings/input/gpio-matrix-keypad.txt     | 49 -----------
>  .../bindings/input/gpio-matrix-keypad.yaml    | 86 +++++++++++++++++++
>  .../bindings/power/wakeup-source.txt          |  2 +-
>  3 files changed, 87 insertions(+), 50 deletions(-)
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
> index 0000000..75975a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO matrix keypad
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@gmail.com>
> +
> +description:
> +  GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
> +  The matrix keypad supports multiple row and column lines, a key can be
> +  placed at each intersection of a unique row and a unique column. The matrix
> +  keypad can sense a key-press and key-release by means of GPIO lines and
> +  report the event using GPIO interrupts to the cpu.
> +
> +properties:
> +  compatible:
> +    const: gpio-matrix-keypad
> +
> +  row-gpios:
> +    description:
> +      List of GPIOs used as row lines. The gpio specifier for this property
> +      depends on the gpio controller to which these row lines are connected.
> +
> +  col-gpios:
> +    description:
> +      List of GPIOs used as column lines. The gpio specifier for this property
> +      depends on the gpio controller to which these column lines are connected.
> +
> +  linux,keymap:
> +    $ref: /schemas/input/matrix-keymap.yaml#/properties/linux,keymap

We generally don't reference individual properties. Instead, at the 
top-level you need:

allOf:
  - $ref: matrix-keymap.yaml#

And then here just: "linux,keymap: true"


> +
> +  linux,no-autorepeat:
> +    type: boolean
> +    description: Do not enable autorepeat feature.
> +
> +
> +  debounce-delay-ms:
> +    description: Debounce interval in milliseconds.
> +    default: 0
> +
> +  col-scan-delay-us:
> +    description:
> +      Delay, measured in microseconds, that is needed
> +      before we can scan keypad after activating column gpio.
> +    default: 0
> +
> +  drive-inactive-cols:
> +    type: boolean
> +    description:
> +      Drive inactive columns during scan,
> +      default is to turn inactive columns into inputs.
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
> diff --git a/Documentation/devicetree/bindings/power/wakeup-source.txt b/Documentation/devicetree/bindings/power/wakeup-source.txt
> index 27f1797..66bb016 100644
> --- a/Documentation/devicetree/bindings/power/wakeup-source.txt
> +++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
> @@ -23,7 +23,7 @@ List of legacy properties and respective binding document
>  
>  1. "gpio-key,wakeup"		Documentation/devicetree/bindings/input/gpio-keys{,-polled}.txt
>  2. "has-tpo"			Documentation/devicetree/bindings/rtc/rtc-opal.txt
> -3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
> +3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
>  				Documentation/devicetree/bindings/mfd/tc3589x.txt
>  				Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
>  4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
> -- 
> 2.39.5
> 

