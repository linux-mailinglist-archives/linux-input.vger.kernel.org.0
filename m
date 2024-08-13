Return-Path: <linux-input+bounces-5551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE36895099C
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 17:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2C81C220C9
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 15:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00721A08D7;
	Tue, 13 Aug 2024 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtxqIEeo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33EC1A08C2;
	Tue, 13 Aug 2024 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723564684; cv=none; b=OlS/bwX7NIo9UrBhs7bGlsxQmh0ky/J8Wi2WYOndhMxGVFfjT618MOTkqRw9obgTzGZ+ONE/K0IGeYR1IhkC+wYwL0CxsrfNh2hrvQW26kctA7IPFEm3Tiv9EY6XdSbjLwKDP1bZS3Yjq0TxUE+WgauOrZYWuENe3abPF2WJuvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723564684; c=relaxed/simple;
	bh=qP371znJw8sls79s5vY7LeHFBVoyzLBn3QpPi93NjOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEKFFc9ms7KgRF8niR7ezRz+QnVFFqaKZB12ZJ2QDkS91Iz3ReycP6fBG5JpPedLAzwwmtN3Tksd0m2jSC0lxarXzlAca7rEonEfrk+sIl1lIxYW3FcZJESKJneWnYTAIp9GsibUErpR1petiF6hRrUvSOqlMrzKIdefYKG8cqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtxqIEeo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AEFC4AF0B;
	Tue, 13 Aug 2024 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723564684;
	bh=qP371znJw8sls79s5vY7LeHFBVoyzLBn3QpPi93NjOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtxqIEeobTkLl8l/vbORUlOHq2dCm0+y9XPI2O63gnMxswMUB7O4/T8KtIIONs/H8
	 QFRbWF9F/pq8jF/kqa1EY6XJ+BlBKGgRebbb85dn5rtD7iFIOUWIeyZJC4oveGegEg
	 iDzRw1bcVbqA42YsSwDJcCiWgHeKxT2nWaqwas8zxEmJgobMCaVmyQhvIrlUOdTRjX
	 ZiKLfVtoCl//UpwSi+/nkq+KZ15rkPLEQobIV5nl0DTN+M+/gYXnjwDRBEM2y7+Lt8
	 H6elqhFJq/aIwEkBMttRPL0kLva4QFVLpieTtfxyekYg08rYmu99bDeyRLSq7bewyj
	 c/PIPi+huT+Lw==
Date: Tue, 13 Aug 2024 16:58:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert
 colibri-vf50-ts.txt to yaml
Message-ID: <20240813-shakiness-encounter-1cca6a4c3fdf@spud>
References: <20240812231123.3838058-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fXLw8ZFuZxVd4QoL"
Content-Disposition: inline
In-Reply-To: <20240812231123.3838058-1-Frank.Li@nxp.com>


--fXLw8ZFuZxVd4QoL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 07:11:19PM -0400, Frank Li wrote:
> Convert binding doc colibri-vf50-ts.txt to yaml.
> Additional change:
> - add ref touchscreen.yaml.
> - remove standard pinctrl properties.
>=20
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /touchscreen:
>   failed to match any schema with compatible: ['toradex,vf50-touchscreen']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../input/touchscreen/colibri-vf50-ts.txt     | 34 ----------
>  .../input/touchscreen/toradex,vf50.yaml       | 68 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/c=
olibri-vf50-ts.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/t=
oradex,vf50.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/colibri-=
vf50-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/colibri-v=
f50-ts.txt
> deleted file mode 100644
> index ca304357c374a..0000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts=
=2Etxt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -* Toradex Colibri VF50 Touchscreen driver
> -
> -Required Properties:
> -- compatible must be toradex,vf50-touchscreen
> -- io-channels: adc channels being used by the Colibri VF50 module
> -    IIO ADC for Y-, X-, Y+, X+ connections
> -- xp-gpios: FET gate driver for input of X+
> -- xm-gpios: FET gate driver for input of X-
> -- yp-gpios: FET gate driver for input of Y+
> -- ym-gpios: FET gate driver for input of Y-
> -- interrupts: pen irq interrupt for touch detection, signal from X plate
> -- pinctrl-names: "idle", "default"
> -- pinctrl-0: pinctrl node for pen/touch detection, pinctrl must provide
> -    pull-up resistor on X+, X-.
> -- pinctrl-1: pinctrl node for X/Y and pressure measurement (ADC) state p=
inmux
> -- vf50-ts-min-pressure: pressure level at which to stop measuring X/Y va=
lues
> -
> -Example:
> -
> -	touchctrl: vf50_touchctrl {
> -		compatible =3D "toradex,vf50-touchscreen";
> -		io-channels =3D <&adc1 0>,<&adc0 0>,
> -				<&adc0 1>,<&adc1 2>;
> -		xp-gpios =3D <&gpio0 13 GPIO_ACTIVE_LOW>;
> -		xm-gpios =3D <&gpio2 29 GPIO_ACTIVE_HIGH>;
> -		yp-gpios =3D <&gpio0 12 GPIO_ACTIVE_LOW>;
> -		ym-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> -		interrupt-parent =3D <&gpio0>;
> -		interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> -		pinctrl-names =3D "idle","default";
> -		pinctrl-0 =3D <&pinctrl_touchctrl_idle>, <&pinctrl_touchctrl_gpios>;
> -		pinctrl-1 =3D <&pinctrl_touchctrl_default>, <&pinctrl_touchctrl_gpios>;
> -		vf50-ts-min-pressure =3D <200>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/toradex,=
vf50.yaml b/Documentation/devicetree/bindings/input/touchscreen/toradex,vf5=
0.yaml
> new file mode 100644
> index 0000000000000..6ff3ad1f9edfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/toradex,vf50.ya=
ml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/toradex,vf50.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toradex Colibri VF50 Touchscreen
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: toradex,vf50-touchscreen
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  io-channels:
> +    maxItems: 4
> +    description:
> +      adc channels being used by the Colibri VF50 module
> +      IIO ADC for Y-, X-, Y+, X+ connections
> +
> +  xp-gpios:
> +    description: FET gate driver for input of X+
> +
> +  xm-gpios:
> +    description: FET gate driver for input of X-
> +
> +  yp-gpios:
> +    description: FET gate driver for input of Y+
> +
> +  ym-gpios:
> +    description: FET gate driver for input of Y-
> +
> +  vf50-ts-min-pressure:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: pressure level at which to stop measuring X/Y values

What are the constraints on this value?

> +
> +required:
> +  - compatible

The text binding lists all of the properties as required.

> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    touchscreen {
> +        compatible =3D "toradex,vf50-touchscreen";
> +        interrupt-parent =3D <&gpio0>;
> +        interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> +        io-channels =3D <&adc1 0>,<&adc0 0>, <&adc0 1>,<&adc1 2>;

This line has inconsistent formatting.
Otherwise, the conversion looks good.

Thanks,
Conor.

> +        xp-gpios =3D <&gpio0 13 GPIO_ACTIVE_LOW>;
> +        xm-gpios =3D <&gpio2 29 GPIO_ACTIVE_HIGH>;
> +        yp-gpios =3D <&gpio0 12 GPIO_ACTIVE_LOW>;
> +        ym-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +        pinctrl-names =3D "idle", "default";
> +        pinctrl-0 =3D <&pinctrl_touchctrl_idle>, <&pinctrl_touchctrl_gpi=
os>;
> +        pinctrl-1 =3D <&pinctrl_touchctrl_default>, <&pinctrl_touchctrl_=
gpios>;
> +        vf50-ts-min-pressure =3D <200>;
> +    };
> +
> --=20
> 2.34.1
>=20

--fXLw8ZFuZxVd4QoL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZruCiAAKCRB4tDGHoIJi
0tqaAQD5CdxeOQqH/hmp6MhcCBakq3bmaEAd+pqX+zucPC/ifQEAkA4absn2lZbJ
I6LFB+z+X9vnpzTUQ9AtFKzEeH4nNwU=
=aVzJ
-----END PGP SIGNATURE-----

--fXLw8ZFuZxVd4QoL--

