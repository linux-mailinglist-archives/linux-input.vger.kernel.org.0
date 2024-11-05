Return-Path: <linux-input+bounces-7881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C19BD474
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 19:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B731C22AE7
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 18:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264331E7664;
	Tue,  5 Nov 2024 18:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfHRrdt0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA097149C50;
	Tue,  5 Nov 2024 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730830961; cv=none; b=Jy2utFiDwwLBulSD3qi8I0RLCzGzGIEfcEeocfIB3f8UxQ0MlrztAQiPSvHlwkVaL9zpNj4mKc6HmUv3su+GRUcIvrkC6UfPtlsXrv+o+z4p+7RR8kTP2AOgjXYbBVpWSMPDuOnO/fipgrFj68d5H78F+mWn5MeHNrHocy8M7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730830961; c=relaxed/simple;
	bh=SMWUsT+0Le194DUQ8L7BmPc4+N+KYrC04gQ84CBgQbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaLcBobvwB4PJIxLHZVkI6WVEi5YbvImUv1vDYcHhqsLKKcJfq8skk+sLI+OdzE6htt9y23i4PXFZwdHK52+xGTBfx+W7iEkhQsSh2SmLZOlP2YMoFQeVEMbQR6wNkYN80Ev6+8gvTpSixWN4MGb1nip4LpP0dK0NqguJHmp+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfHRrdt0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F2CC4CECF;
	Tue,  5 Nov 2024 18:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830960;
	bh=SMWUsT+0Le194DUQ8L7BmPc4+N+KYrC04gQ84CBgQbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LfHRrdt0lANTIl30vpFxiQkahldVEgVbUzn3x8auOXYlzmhNOhjKD3oVWAVcsUbtA
	 oWZTzccVPzEgWG4MBTEy5Xm4vrViC79+IySPoE6Ms5toS5Nl0QybYwYSH8txMwfN+Z
	 zYCtIRvIzJD4APnQDOKKBZEsMR3slQJH3YoHdBKIOn1/387EWK8cU90i4ASFWeyGcy
	 pfwcsr30cxHQV2wLVHkli8IyFMX8qkMG5PowNS6JTv3mVHUTqV70sc2apumD6X07p+
	 YwM4+J6W29HOCi1fmaFGW9jDARQX/Aj/fd5IHW/eVToiKil+sdZ2p1RHySP3YI55Z3
	 UUh6a1p9qmU8Q==
Date: Tue, 5 Nov 2024 18:22:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <20241105-earpiece-swizzle-a3e36d50b9c6@spud>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
 <20241105130322.213623-5-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6mbsUAwJr5R/qiqr"
Content-Disposition: inline
In-Reply-To: <20241105130322.213623-5-markus.burri@mt.com>


--6mbsUAwJr5R/qiqr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 02:03:19PM +0100, Markus Burri wrote:
> Add missing property 'gpio-activelow' to DT schema.

What do you mean "missing property"? Why isn't it sufficient to mark the
GPIOs as GPIO_ACTIVE_LOW in the various -gpios properties?

>=20
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.y=
aml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> index 745652b..9ea66b3 100644
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -51,6 +51,11 @@ properties:
>        (Legacy property supported: "linux,wakeup")
>      default: false
> =20
> +  gpio-activelow:
> +    type: boolean
> +    description: The GPIOs are low active.
> +    default: false

What you want is a flag, not a boolean here btw. Flags you can check for
the presence of, booleans you cannot.

> +
>    debounce-delay-ms:
>      description: Debounce interval in milliseconds.
>      default: 0
> --=20
> 2.39.5
>=20

--6mbsUAwJr5R/qiqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypibAAKCRB4tDGHoIJi
0iEvAQC9YM3sB8CCIUOITtIZFsLlNA4XUyle+/+dcigsLhQRyAEAu5xxsl1rHSpF
0tCx7P/3n3R+eq2/U7T+JUfxaLuMLAA=
=poOS
-----END PGP SIGNATURE-----

--6mbsUAwJr5R/qiqr--

