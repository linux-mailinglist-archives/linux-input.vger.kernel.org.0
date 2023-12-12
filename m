Return-Path: <linux-input+bounces-727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE080F3C1
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 17:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B34771F216D0
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 16:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC42A7B3AE;
	Tue, 12 Dec 2023 16:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOPb+jNQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99037A22D;
	Tue, 12 Dec 2023 16:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79F0C433C8;
	Tue, 12 Dec 2023 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400237;
	bh=TgHYmk9iqQrgfTRXmZN7f9jKttmEsbZ20P4e6kUne2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOPb+jNQj+pifTS74tbWjcK0c7HWfbbgv534jvKIKCX/gLlZAVAq2tNmy952p9HSj
	 GmAD0fb6BU7iWXzp1RUYp/0Pe6hsi5363W17zkCEld+EjxTqHHESaLKuNHKpUQ+jPx
	 9tsCEDrtYyK6TGIfLIqQLYM/0rMgg0HDr71VirFqPJ6cy3XLvf8TwPfwyrLDB/MlV8
	 e3K+WVVgWSd1ipSEach6IHUGT3PxnDb7iZNtfxeGfuUl+kBAh9z3aKIHZZcOnjaEQq
	 xHIUlhTZUGaBB9KoIUg8k143F5fBIyRLYTEQRWCNf/AwULX5vSagfS3xbJ7epbIat9
	 FNz8KCRLd/HDA==
Date: Tue, 12 Dec 2023 16:57:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>,
	catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com, bartp@baasheep.co.uk,
	hannah.rossiter@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v5 2/3] dt-bindings: input: Add TouchNetix axiom
 touchscreen
Message-ID: <20231212-rework-bounce-f4d9d12362a4@spud>
References: <20231211121430.1689139-1-kamel.bouhara@bootlin.com>
 <20231211121430.1689139-3-kamel.bouhara@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UaIdxHTfrnxPNhdH"
Content-Disposition: inline
In-Reply-To: <20231211121430.1689139-3-kamel.bouhara@bootlin.com>


--UaIdxHTfrnxPNhdH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 01:14:28PM +0100, Kamel Bouhara wrote:
> Add the TouchNetix axiom I2C touchscreen device tree bindings
> documentation.
>=20
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  .../input/touchscreen/touchnetix,ax54a.yaml   | 64 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/t=
ouchnetix,ax54a.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchnet=
ix,ax54a.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchne=
tix,ax54a.yaml
> new file mode 100644
> index 000000000000..cbdf48fc538b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54=
a.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/touchnetix,ax54a.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TouchNetix Axiom series touchscreen controller
> +
> +maintainers:
> +  - Kamel Bouhara <kamel.bouhara@bootlin.com>
> +
> +allOf:
> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#

Weird, you add this ref here but do not actually allow any properties
=66rom it since you have "additionalProperties: false" below.

What's the point of its inclusion?

Cheers,
Conor.

> +  - $ref: /schemas/input/input.yaml#
> +
> +properties:
> +  compatible:
> +    const: touchnetix,ax54a
> +
> +  reg:
> +    const: 0x66
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description: Analog power supply regulator on VDDA pin
> +
> +  vddi-supply:
> +    description: I/O power supply regulator on VDDI pin
> +
> +  poll-interval: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdda-supply
> +  - vddi-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      touchscreen@66 {
> +        compatible =3D "touchnetix,ax54a";
> +        reg =3D <0x66>;
> +        interrupt-parent =3D <&gpio2>;
> +        interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> +        reset-gpios =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
> +        vdda-supply =3D <&vdda_reg>;
> +        vddi-supply =3D <&vddi_reg>;
> +        poll-interval =3D <20>;
> +      };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7608b714653f..4752d8436dbb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21431,6 +21431,12 @@ S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
>  F:	drivers/platform/x86/think-lmi.?
> =20
> +TOUCHNETIX AXIOM I2C TOUCHSCREEN DRIVER
> +M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.=
yaml
> +
>  THUNDERBOLT DMA TRAFFIC TEST DRIVER
>  M:	Isaac Hazan <isaac.hazan@intel.com>
>  L:	linux-usb@vger.kernel.org
> --=20
> 2.25.1
>=20

--UaIdxHTfrnxPNhdH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiQ5wAKCRB4tDGHoIJi
0p61AQDuO5fLGaE3qnBLRE7Yb2SlwrllyQnQEJ6VCaUxkZ/xVQD/eNd1ZcqIUMWN
sbNXReqN3/dm5vO8dznluM11EW1TugM=
=K8S0
-----END PGP SIGNATURE-----

--UaIdxHTfrnxPNhdH--

