Return-Path: <linux-input+bounces-4951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A42E792D378
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 15:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F09F1F21ED6
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABF1194A6F;
	Wed, 10 Jul 2024 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkIZxIE9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3B6193449;
	Wed, 10 Jul 2024 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720619577; cv=none; b=YtzVHb6E1aPS5Om+ZbXZCdazoTdCvJF7iJeCQUadcAsVqE7LmM5zCZsOSJF0jK1Z0YsXNQX6tqe1pytsQR2s76qwez8TWJVb5+k6LeSNflSoJRmqxwOVymQrA0UHF6qJ9wlEmwxo9YXqFHVqlLyB/DT029Tk+DvzVxoPQqoBFNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720619577; c=relaxed/simple;
	bh=QhaNADKPWhmGoAiQ07UnKvQntsV5hpp5wAActCfsVSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX8MvLOT7COjDaTKwgQxcxk8900EvlDMV5zSC4L+Ory0qGZaf+VMJ3nXdNZ1zxOiEdJrAXje19YOTbRT07h/CDurajZsdxHaJ/Aq0HL4DfB5T8jQjMFnTSOMUuLYGrLRhG5J8J6NLyDa9kq6XMA1n3QWUt8j0IlSaOZ6/DONPF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkIZxIE9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85E4C32786;
	Wed, 10 Jul 2024 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720619576;
	bh=QhaNADKPWhmGoAiQ07UnKvQntsV5hpp5wAActCfsVSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkIZxIE9HFZpTFdTcF9Pn3T5CVGo0zmI+mKzMTlUtV32Ky5lpV5NTDQ1HxoU9e139
	 2CwfH8fja2VIo1DUzJvoO2VafelRm3DIBLrD6UuJj2vJSoOBNQ/FkgQ6E7xH9h8p6t
	 dUS8yHsHK0BTKJVfgAI/942cKxbbEom/uzbLDVbd0y8M7kZ+ml5TTdPvUSHGrGh5CK
	 mWN0glJls9YrvjxYiXKdMXiWre+n+LC1pBoQlQ5u1pueuD5jliY5iVv/n9ok20ZaQs
	 rFEYxyTu8IHy4vWFJQQus2Y5ReL10550An05mT2nACI3a+kyzuwrbPX44tudqgBFUU
	 r57+CplF1ng+w==
Date: Wed, 10 Jul 2024 14:52:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v3 1/2] dt-bindings: input: touchscreen: exc3000: add
 EXC81W32
Message-ID: <20240710-couch-creamed-11ff20becccd@spud>
References: <20240710-input-exc3000-exc81w32-v3-0-4272183628b4@pengutronix.de>
 <20240710-input-exc3000-exc81w32-v3-1-4272183628b4@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOyo+sROn9MECkm7"
Content-Disposition: inline
In-Reply-To: <20240710-input-exc3000-exc81w32-v3-1-4272183628b4@pengutronix.de>


--XOyo+sROn9MECkm7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 12:28:31PM +0200, Philipp Zabel wrote:
> Add compatible for EXC81W32 touchscreen controllers.
> They use the same protocol and have the same resolution as EXC80H84.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> v3: Mark exc81w32 as compatible with exc80h84.
> ---
>  .../devicetree/bindings/input/touchscreen/eeti,exc3000.yaml  | 12 ++++++=
++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc=
3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc300=
0.yaml
> index 9dc25d30a0a8..1c7ae05a8c15 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.ya=
ml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.ya=
ml
> @@ -14,10 +14,14 @@ allOf:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - eeti,exc3000
> -      - eeti,exc80h60
> -      - eeti,exc80h84
> +    oneOf:
> +      - const: eeti,exc3000
> +      - const: eeti,exc80h60
> +      - const: eeti,exc80h84

This portion could've remained an enum.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +      - items:
> +          - enum:
> +              - eeti,exc81w32
> +          - const: eeti,exc80h84
>    reg:
>      const: 0x2a
>    interrupts:
>=20
> --=20
> 2.39.2
>=20

--XOyo+sROn9MECkm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo6SNAAKCRB4tDGHoIJi
0vzYAQDcPRhGnxO6POKthGpu366MT1iGX+CXzGRY6KCZNAqyZQD+MjJES5StKWp4
KA+fWgMhbNa5geuwCYyoGQc+SxlnHwg=
=58jP
-----END PGP SIGNATURE-----

--XOyo+sROn9MECkm7--

