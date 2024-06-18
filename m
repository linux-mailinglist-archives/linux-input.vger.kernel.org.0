Return-Path: <linux-input+bounces-4459-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AFC90DADA
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 19:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E6A1F21650
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 17:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92821145353;
	Tue, 18 Jun 2024 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRgzssJY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CBB143C4D;
	Tue, 18 Jun 2024 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718732603; cv=none; b=mR3apmHQcYuMEELVICSj5alifN9+V80/wHXlimrmAktzJVTYDP9B/B/gbSgwCeLvltF7XiM5tAWjZtTXOPYjXrzt+u+DH5YsM/GIqHPaaYAYOdXVjpbesNYALZIKn0cStmV18bZwK0veEEt7gkmZA0MkCLQ3z2dlrztGnpBBx8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718732603; c=relaxed/simple;
	bh=GWwyjFLchn+E7WR5x6dLMTSPxlYLUUbdMMdnUh8n06U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXpz6/hxzcNuLUQcsyjYVUACUCNd5SLHcZI11ivodMxasKyUOU2uEscmfVfwRhN7tWdu9OG91d+NWhODdgnA/uX5Fao61s/x96U49sUBUgbcW67AXhc/1v4trdWrXoH2545xSKnH6EY6MvWn5ig12DLc2rP1CLS5iA+jzQmV6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRgzssJY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D24BC3277B;
	Tue, 18 Jun 2024 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718732603;
	bh=GWwyjFLchn+E7WR5x6dLMTSPxlYLUUbdMMdnUh8n06U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRgzssJYFzCiDz+tnBb1nBG1YsvJsP63zDUD0WEXjx9i+dH82xjaQ3QUTN66OQlHj
	 agBsblRTVnTtwecixpjDPsk2Phrw+tzOEuimxwuR4hfbiITNxljzJ7tWWjv3UGP/PP
	 4Ugujn/bHjLtuo7NcV1/HaFdJ+oC6Uq+pMOx1kkcKfCLyIQIxvGigy+pUP90RbaGoV
	 lKRMqdMay77ZjZzk0sp0ZQ9GZ8gXuzEM0iZzXcz4BxVOvlb75ReTfgjimwUhtVVgDS
	 FOnaw6pT44PJ3wN2db1VIJA/EQ2JTiFVfDn2/g80/7VAHKjuHslJuB3Z/kT9CsNaGj
	 +78/8/nMv0I7g==
Date: Tue, 18 Jun 2024 18:43:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org, robh@kernel.org,
	dianders@chromium.org, krzk+dt@kernel.org, jikos@kernel.org,
	bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <20240618-affluent-unroasted-e6d5d34d1ea2@spud>
References: <20240618084455.1451461-1-charles.goodix@gmail.com>
 <20240618084455.1451461-3-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b2mnwhhJp1+h6YJB"
Content-Disposition: inline
In-Reply-To: <20240618084455.1451461-3-charles.goodix@gmail.com>


--b2mnwhhJp1+h6YJB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 04:44:54PM +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
>=20
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u.yaml        | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986=
u.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml =
b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> new file mode 100644
> index 000000000..25a26b4ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> @@ -0,0 +1,72 @@
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
> +description: Supports the Goodix GT7986U touchscreen.
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

The description here isn't needed, it's obvious :)

> +  goodix,hid-report-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |

This | is not needed, there's no formatting to preserve.

Those are nits:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +      The register address for retrieving HID report data.
> +      This address is related to the device firmware and may
> +      change after a firmware update.
> +
> +  spi-max-frequency: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +  - goodix,hid-report-addr
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
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
> +
> +...
> --=20
> 2.43.0
>=20

--b2mnwhhJp1+h6YJB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnHHNgAKCRB4tDGHoIJi
0pnZAQDBrH8CGjYVAnK86ReUnVo+hZqPoGqeJbVFbL8iWw74xgD4s0nX1GXmv1Ji
Zuxw1P4FItJU/A1IV1sh4S6ec1e/DA==
=5u54
-----END PGP SIGNATURE-----

--b2mnwhhJp1+h6YJB--

