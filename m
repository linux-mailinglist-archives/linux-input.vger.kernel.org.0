Return-Path: <linux-input+bounces-16046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F72AC54040
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 31C87346339
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 18:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F233431E9;
	Wed, 12 Nov 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGMPxhVJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C842609CC;
	Wed, 12 Nov 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762973603; cv=none; b=t2T2ppQw3zf9fQFB27j6ba/V9YADh0SZGpQrNJAoWaFFbZTCkxecVI/JvpBVvGMjEZ67MVX+1QP98stLSNfYKlwRKgXAwCUNe0Y/+Ap1s0XbIeV8WxVj8Bole0gtZmd40aUbqBzdaJ9rCZsedFFAajuXnaVJK7fIl3zstpqcdf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762973603; c=relaxed/simple;
	bh=NmwTU8zJvNtYHKTiM88UK4xK63z2LpBj81NDhhAvYBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQKhIjPCau4ymtHj7WzBky5suNe0yWaXT6p/NzvK3wFmX+nxG9McDkfQziHrF8SxytwSmYGg7X9KUvJN9mhUCFEasI51HC0CW5d0rytyE+2yfBj3jf5gTS14xMbFNELCNkgyMvMPn8qapoQi43mRYioERtpDP0XiGHUTiQdwLko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGMPxhVJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B0EC4CEF5;
	Wed, 12 Nov 2025 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762973602;
	bh=NmwTU8zJvNtYHKTiM88UK4xK63z2LpBj81NDhhAvYBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGMPxhVJ+TH4Uc4pbHRvNq/u7VnaYZQ2YQxHalx0drTKuMXUlysJunGnVroWJ9wCF
	 KGck6FPCoSynlUjI90ryJcVoUfjPOyCVcTsPaDhEAApnFvGiJvng4R/D9SSVkAirCR
	 N+z3+BaYdkHQtMbHCyGllmJ6RrE3KyKHyzG4lzkMHWvKSy74m1Bk7qHUvxEKcbzOWC
	 2XYUcYO6Vmw0SnCgDBbvtSfr+ghOXdGANJQQIG/9rmS/El5BUw001Gm295Wbdj1CME
	 hHRDwtPE24MqmMuMOakBXihYKlA+OvcfU9cs18z8A+6vba4ql7tJt0ftLiXVI05FQ2
	 An0b0ehkDpNsw==
Date: Wed, 12 Nov 2025 18:53:18 +0000
From: Conor Dooley <conor@kernel.org>
To: daniel_peng@pegatron.corp-partner.google.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech
 FT8112
Message-ID: <20251112-resume-engorge-3dafdc09c65d@spud>
References: <20251112195751.v3.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GMnzJIigDlxZPrWD"
Content-Disposition: inline
In-Reply-To: <20251112195751.v3.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>


--GMnzJIigDlxZPrWD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 07:59:04PM +0800, daniel_peng@pegatron.corp-partner=
=2Egoogle.com wrote:
> From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
>=20
> The FocalTech FT8112 touch screen chip same as Ilitek ili2901 controller
> has a reset gpio. The difference is that they have different
> post_gpio_reset_on_delay_ms.
> FocalTech FT8112 also uses 3.3V power supply.
>=20
> Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>

> - Modified the subject description.
> - Modified maintainers to myself of this binding file.
> - Fixed the extra '>' on section of "interrupts =3D <15 IRQ_TYPE_LEVEL_LO=
W>;" and confirm command 'make dt_binding_check' correctly.
> - Restored MAINTAINERS file.

The patch seems okay me me, other than this which a) should be below the
--- and also does not appear to even be accurate? The last bullet in
doesn't match the patch contents.
Move this out of the commit and then
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

Thanks,
Conor.

>=20
> ---
>=20
> (no changes since v1)
>=20
>  .../bindings/input/focaltech,ft8112.yaml      | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/focaltech,ft8=
112.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/focaltech,ft8112.yam=
l b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
> new file mode 100644
> index 000000000000..197f30b14d45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/focaltech,ft8112.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: FocalTech FT8112 touchscreen controller
> +
> +maintainers:
> +  - Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> +
> +description:
> +  Supports the FocalTech FT8112 touchscreen controller.
> +  This touchscreen controller uses the i2c-hid protocol with a reset GPI=
O.
> +
> +allOf:
> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - focaltech,ft8112
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  panel: true
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vcc33-supply: true
> +
> +  vccio-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vcc33-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      touchscreen@38 {
> +        compatible =3D "focaltech,ft8112";
> +        reg =3D <0x38>;
> +
> +        interrupt-parent =3D <&pio>;
> +        interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> +
> +        reset-gpios =3D <&pio 126 GPIO_ACTIVE_LOW>;
> +        vcc33-supply =3D <&pp3300_tchscr_x>;
> +      };
> +    };
> --=20
> 2.34.1
>=20

--GMnzJIigDlxZPrWD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTXngAKCRB4tDGHoIJi
0gcwAQCFRvbG2WpiVaqzpCyWTu50NSJQFPBvBj2SVOgBA07QVwD+JLSd+YR+202m
4TBxcI5dsrM9pj2kx9dPywB/b8aJIw4=
=faJR
-----END PGP SIGNATURE-----

--GMnzJIigDlxZPrWD--

