Return-Path: <linux-input+bounces-8040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCA69C5FCC
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 19:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CB512856D7
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 18:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F0D215010;
	Tue, 12 Nov 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xv3yOpqb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB421442E;
	Tue, 12 Nov 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731434350; cv=none; b=aeoezTAT0WBW/fNcGDvwa06QVUL/PZ8XyP8PokJv6CSXZO5IGSAHqMIlGKi5WYqM1yh4gsTSJS7R3Nw0qBxgSH1Du+RspHRAx3u95ZNZxMpOvM9R6wa1vJ7m1u5Xtbp2izb1OGv9PFrkj+LC6arLpxKiFUmAlPnYnXPuZWAK5kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731434350; c=relaxed/simple;
	bh=nBqJQ+9Rz7LqvO8HNtJko2uMGpeDf0A8fllkrbNh13U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Latpfh7/W7Y2n2n5/sYkDEa2zqXj7024Fp3MchTtKAr5ET+fKFiz1AQ8Zg3qJY+dqkSajK/ES2CCr86gI96UMo0n5DWGh+GMxn7AZNbw8Yyh4fNLagFOOO2Cdpsjw3+KRuYeI2puStsGIX3umDOG60SLfm20uIKoji3OfxLlciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xv3yOpqb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D73DC4CECD;
	Tue, 12 Nov 2024 17:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731434350;
	bh=nBqJQ+9Rz7LqvO8HNtJko2uMGpeDf0A8fllkrbNh13U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xv3yOpqbU5jc8KCbzcJqp2C9IdPY824gNn7Xn1fLE3gMMO3O6Ku7iYI1DEATDxkXd
	 /WnJ6ytFAnJ4mkcnKYmlWJT0mBOUk1aweXSDKptnpUY4bL8kFA4AQIcjSeKZUfNhg1
	 zvM1eX4lJQhfBLJPbuH2ffxaq//pE7JWSUS0aY0yv1n8D5gsKWjhFKR0j/q8gHu2Hu
	 SlrvrLYHM1sGlUAXVB/d/5c1sIgwPCw4wpsF5Bm+knPeiANlml0PxjQYIiiKCcicZU
	 fYfhz5UKKQb/TZ1cbF7nAgLmVhfBXpAR3oo2HGlON4aqGWWwP4sGpDqMMLeDx6bw0/
	 YfnsCKbpv96IA==
Date: Tue, 12 Nov 2024 17:59:05 +0000
From: Conor Dooley <conor@kernel.org>
To: mjchen <mjchen0829@gmail.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sudeep.holla@arm.com, peng.fan@nxp.com,
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mjchen@nuvoton.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <20241112-fender-mug-8eb81a6727e0@spud>
References: <20241112053059.3361-1-mjchen0829@gmail.com>
 <20241112053059.3361-2-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k0rDWj3vLf/SiQCG"
Content-Disposition: inline
In-Reply-To: <20241112053059.3361-2-mjchen0829@gmail.com>


--k0rDWj3vLf/SiQCG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 05:30:58AM +0000, mjchen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
>=20
> Signed-off-by: mjchen <mjchen0829@gmail.com>
> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d=
1-keypad.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypa=
d.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..71debafc3890
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> @@ -0,0 +1,89 @@
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
> +  debounce-period:

Not a common property, so it needs a vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]
> +    description: |
> +      Key debounce period select, specified in terms of keypad IP clock =
cycles.
> +      Valid values include 0 (no debounce) and specific clock cycle valu=
es:
> +      8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
> +

> +  nuvoton,key-scan-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Set the time it takes to scan each key in the keypad, in clock cyc=
les of the IP.
> +      This parameter controls how frequently the keypad is scanned, adju=
sting the response time.
> +      The valid range is from 1 to 256 clock cycles.
> +    minimum: 1
> +    maximum: 256
> +
> +  nuvoton,key-scan-time-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Set a divider that adjusts the scan time for each key.
> +      This value scales the time it takes to scan each key
> +      by multiplying the key-scan-time by the specified factor.
> +      For example, if you set key-scan-time to 64 cycles and configure k=
ey-scan-time-div to 2,
> +      the scan time for each key will be increased to 128 cycles (64 cyc=
les * 2). time.
> +    minimum: 1
> +    maximum: 256

Why are both of these properties required? Why not just provide a single
value and let the driver figure it out (and why not use the standard
input property poll-interval)?

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
> +  - nuvoton,key-scan-time
> +  - nuvoton,key-scan-time-div
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad@404A0000 {
> +      compatible =3D "nuvoton,ma35d1-kpi";
> +      reg =3D <0x404A0000 0x10000>;
> +      interrupts =3D <79>;
> +      clocks =3D <&clk>;
> +      keypad,num-rows =3D <2>;
> +      keypad,num-columns =3D <2>;
> +
> +      linux,keymap =3D <
> +         MATRIX_KEY(0, 0, KEY_ENTER)
> +         MATRIX_KEY(0, 1, KEY_ENTER)
> +         MATRIX_KEY(1, 0, KEY_SPACE)
> +         MATRIX_KEY(1, 1, KEY_Z)
> +      >;
> +
> +      debounce-period =3D <8>;
> +      nuvoton,key-scan-time =3D <1>;
> +      nuvoton,key-scan-time-div =3D <24>;
> +    };
> --=20
> 2.25.1
>=20

--k0rDWj3vLf/SiQCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzOXaQAKCRB4tDGHoIJi
0pYPAQDDf02Gop88JjPTAhEapsw6Y2RsUuUw+y3t6GLs5WaYTQD6A9rBf5mY07HN
IdLXIMBrLZwIVIq8TP0uaaLeB9wcgQI=
=p5T+
-----END PGP SIGNATURE-----

--k0rDWj3vLf/SiQCG--

