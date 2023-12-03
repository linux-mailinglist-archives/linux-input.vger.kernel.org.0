Return-Path: <linux-input+bounces-412-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6918022AA
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 12:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F8F01F2107C
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D340F9465;
	Sun,  3 Dec 2023 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNmBJZNv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A245A8833;
	Sun,  3 Dec 2023 11:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A2DC433C8;
	Sun,  3 Dec 2023 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701602375;
	bh=khbZlB+CudlpWOtcypC7aIzJI1JQViaEerLoXBkjgWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNmBJZNvjRJCnN+ObC8oLMUvyhaVt+0R8AseNwAN+iRBv99qvZeOI5D3CLwYyBTeh
	 cyPIuheJ9y1AxJv2ArZyfzVggoM+ipgiEP/QW82jYbzQJQ0qnLEs7uEAEnqoEk8lRb
	 V24AlYKPLAwcmAiQadAxTNx3wQvxfK3PDCz2uLyBiXA1krhcWSkc1+YBpUEIFs0Qcm
	 XRKOmTVe+rePAA/R/yQd/W49W94uF2BRpaF6G8yYh/tagnNCPf711ENN8oJWVyUklk
	 av0Y3/sDQjZyCRs1hn4AL9VNio5GtZ5R0bGo9R53BPMEI9NY0Ba+huHD+H7OIjRz7A
	 MkuYtYlpPmi/A==
Date: Sun, 3 Dec 2023 11:19:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Karel Balej <karelb@gimli.ms.mff.cuni.cz>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>
Subject: Re: [PATCH v3 4/5] dt-bindings: input/touchscreen: imagis: add
 compatible for IST3032C
Message-ID: <20231203-mundane-riches-b6e4ef157384@spud>
References: <20231202125948.10345-1-karelb@gimli.ms.mff.cuni.cz>
 <20231202125948.10345-5-karelb@gimli.ms.mff.cuni.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BTVe8SmajlARbciW"
Content-Disposition: inline
In-Reply-To: <20231202125948.10345-5-karelb@gimli.ms.mff.cuni.cz>


--BTVe8SmajlARbciW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 01:48:35PM +0100, Karel Balej wrote:
> From: Karel Balej <balejk@matfyz.cz>
>=20
> Document possible usage of the Imagis driver with the IST3032C
> touchscreen.

Please leave mention of the driver out of the binding patch (we deal
only with the hardware here) and instead describe what is incompatibly
different between these two devices.

Thanks,
Conor.

>=20
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
>  .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,i=
st3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,i=
st3038c.yaml
> index b5372c4eae56..2af71cbcc97d 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c=
=2Eyaml
> @@ -18,6 +18,7 @@ properties:
> =20
>    compatible:
>      enum:
> +      - imagis,ist3032c
>        - imagis,ist3038b
>        - imagis,ist3038c
> =20
> --=20
> 2.43.0
>=20

--BTVe8SmajlARbciW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxkQQAKCRB4tDGHoIJi
0uU4AQDTvFOKjE2bh6MzjfwEJnPy0DVF+pBxGiHPa9Xd1r4gMwEAyprc91Hn2MfG
eWzTwFa8NMflUIYdHWmrAXPq84fGVA8=
=7rqZ
-----END PGP SIGNATURE-----

--BTVe8SmajlARbciW--

