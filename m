Return-Path: <linux-input+bounces-413-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3076F8022B0
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 12:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3874B209FB
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 11:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441209473;
	Sun,  3 Dec 2023 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsqL7lj5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A22C8833;
	Sun,  3 Dec 2023 11:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7427C433C8;
	Sun,  3 Dec 2023 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701602443;
	bh=/NTGULGpy2g2ovireCjJM0D09EDli3mHSEMJDzchZ64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hsqL7lj5zCq6kpuOWvbc80hbFe2R9R4Eew4D7sxnfIoGDGpHUBk+SVFQMhPktTBq0
	 Zfz4bujycpGVLHNkQQRYfY2COEFAiSRF+EP/FztuNZwZs5/F5/mCyyqQiY024MiwZg
	 7iEjgR9d+cYiGKC8hbwUKXMEGJNFZ7jg865hM1VPdt4gPuMuRnHBpKOaIIcD8qv2D1
	 ZGCEWjbe8Ef7l7+0qhnIZPq8PIXJud4H4LdLMKAZZbLDoWHdznXkB9Vlf6xQdZX7Vc
	 aoTDiGLFEEBrEkLhVbbIZ4osX3p2Iq0NN4uugJ3JQ8OpshZ2DLWDG7heLNxzyFB/wW
	 O4mKXKLUfFzRA==
Date: Sun, 3 Dec 2023 11:20:37 +0000
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
Subject: Re: [PATCH v3 2/5] dt-bindings: input/touchscreen: Add compatible
 for IST3038B
Message-ID: <20231203-outskirts-reformat-e0a833903841@spud>
References: <20231202125948.10345-1-karelb@gimli.ms.mff.cuni.cz>
 <20231202125948.10345-3-karelb@gimli.ms.mff.cuni.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6caWOJCI2vW+9aPg"
Content-Disposition: inline
In-Reply-To: <20231202125948.10345-3-karelb@gimli.ms.mff.cuni.cz>


--6caWOJCI2vW+9aPg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 01:48:33PM +0100, Karel Balej wrote:
> From: Markuss Broks <markuss.broks@gmail.com>
>=20
> Imagis IST3038B is a variant (firmware?) of Imagis IST3038 IC,
> add the compatible for it to the IST3038C bindings.

This one is better, but would be well served by mentioning what
specifically is different (register addresses or firmware commands?)

Cheers,
Conor.

>=20
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
>  .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,i=
st3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,i=
st3038c.yaml
> index 0d6b033fd5fb..b5372c4eae56 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c=
=2Eyaml
> @@ -18,6 +18,7 @@ properties:
> =20
>    compatible:
>      enum:
> +      - imagis,ist3038b
>        - imagis,ist3038c
> =20
>    reg:
> --=20
> 2.43.0
>=20

--6caWOJCI2vW+9aPg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxkhQAKCRB4tDGHoIJi
0lSaAQCCXeTJp1KVWGirHD7j+2SSQbVzgYBH/OCml23PLQVLxgD/bg9V/Fb+ZhuK
eozhGuWxjThmtH5+WdaZmg3pMw6SXwg=
=RYnA
-----END PGP SIGNATURE-----

--6caWOJCI2vW+9aPg--

