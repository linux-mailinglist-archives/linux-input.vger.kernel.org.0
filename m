Return-Path: <linux-input+bounces-4357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99C908EAB
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 17:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4C9C1C204AB
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 15:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900BB15ECD0;
	Fri, 14 Jun 2024 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGyqQvfg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614AA15ECCF;
	Fri, 14 Jun 2024 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378788; cv=none; b=VUBYqmBCIQhgjG635kNT7Rqz7Ws/XzXtAbzXan8XC0Yf6iADmO4+Q1jAdfsIaHMFm37M9axMcULYn4l/9amcU3pmXHQzkeodvsbAbOsm92t10umHkh5Af4YdZnPEj0p0DVOJnJkd1j3R+dTCoAflfKcJZ5vbdFrHV5D20KFEGfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378788; c=relaxed/simple;
	bh=4NLhjLagJehuTOmWaUKeGAJfqt2/4rzGpxd/ChCEB5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb3tviDNpeqqHp53bGboPbmEds70s5Ht/M3ZzTgYof8WFJR0ZHYx0UVw2WCkm31Z4Bm0xcOun/61ufMyCDqD9sEu0f6oayKlp1LmVdQ9MgovXr0w2tYs1FgOdCrPppzZsB8y+QEk7FsCIk8qWQOAvHBcWD92XW2Nyn7JKwKBR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGyqQvfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0A6C4AF51;
	Fri, 14 Jun 2024 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718378787;
	bh=4NLhjLagJehuTOmWaUKeGAJfqt2/4rzGpxd/ChCEB5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGyqQvfgCKL29czXdLpI26pg+vOmhaS4MR18JazX3SZMzYsUam/IWoTAfgbTupIAf
	 fpzu7hlTKxc78qkMSxp476JG5DD1XlI0o43+E4Ed9BTXHijTaHLn/S3lANfMuxGMlI
	 k72u7fp3PSi3NsI2+ZBl96yfgelboWNj7AquyRSkbzHrzF0lUD0a8vaJdZPqP2wN8f
	 DRKrLPoz2NEZOTCN4OoN3BpU1xST19LNQWAUv5NAC3XL65TsM0KOOaCbi5fKA7uJ2j
	 sc2T9qtK3i3tH9yfBzWPWBMCRF1OYxqoSVM6G50ltrWI3GepJgdg8fJOlXP+ApV9om
	 vDi4VotHx0TkQ==
Date: Fri, 14 Jun 2024 16:26:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org,
	dianders@chromium.org, robh@kernel.org, krzk+dt@kernel.org,
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <20240614-renewably-snowless-861ca2ab9c93@spud>
References: <20240614121538.236727-1-charles.goodix@gmail.com>
 <20240614121538.236727-3-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sIpVdyPJbqU7YAg0"
Content-Disposition: inline
In-Reply-To: <20240614121538.236727-3-charles.goodix@gmail.com>


--sIpVdyPJbqU7YAg0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 08:15:38PM +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
>=20
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986=
u.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml =
b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> new file mode 100644
> index 000000000..1c518d03b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GOODIX GT7986U SPI HID Touchscreen
> +
> +maintainers:
> +  - Charles Wang <charles.goodix@gmail.com>
> +
> +description:
> +  Supports the Goodix GT7986U touchscreen.
> +  This touch controller reports data packaged according to the HID proto=
col,
> +  but is incompatible with Microsoft's HID-over-SPI protocol.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt7986u
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: reset gpio the chip is connected to.
> +
> +  goodix,hid-report-addr:
> +    description: the register address for retrieving HID report data.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +additionalProperties: false

unevaluatedProperties: false.

Please test your binding w/ dt_binding_check.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - goodix,hid-report-addr
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      num-cs =3D <1>;
> +      cs-gpios =3D <&gpio 2 GPIO_ACTIVE_HIGH>;

cs-gpios shouldn't be needed for a basic example.

Blank line here before the child node please.

Thanks,
Conor.

> +      touchscreen@0 {
> +        compatible =3D "goodix,gt7986u";
> +        reg =3D <0>;
> +        interrupt-parent =3D <&gpio>;
> +        interrupts =3D <25 IRQ_TYPE_LEVEL_LOW>;
> +        reset-gpios =3D <&gpio1 1 GPIO_ACTIVE_LOW>;
> +        spi-max-frequency =3D <10000000>;
> +        goodix,hid-report-addr =3D <0x22c8c>;
> +      };
> +    };
> --=20
> 2.43.0
>=20
>=20

--sIpVdyPJbqU7YAg0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmxhHgAKCRB4tDGHoIJi
0jvDAQDDtZyVi/8NgabB8fDEa1enuIUIT8ggVNgMugIqpQnRNAEA+oBaBQsso5Pk
mO2mB6FIEIQiIEctAIhGz5QpwWq+aAQ=
=Ez+U
-----END PGP SIGNATURE-----

--sIpVdyPJbqU7YAg0--

