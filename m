Return-Path: <linux-input+bounces-10447-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 503BEA4A21F
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 19:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5CCB172A74
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 18:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB3E277007;
	Fri, 28 Feb 2025 18:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiOlHKeh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D2277002;
	Fri, 28 Feb 2025 18:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740768574; cv=none; b=qxddl+szCpXsGr2J5iiaHrQ+nyhEhDvNx3iunuLWmU737RIrp7LZM7dNtKCyeH+bAMRiNSfgXal2+QlKK23ySs3UVi9EU0RzitpWCXWdcInGz12D/KzSyUbptCE3/JImrDoOkjq/Q2UqS5nhplaV0loEAlBy64sde3mMOLSM9aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740768574; c=relaxed/simple;
	bh=slRqAGP1stq5cwMr2TYEn2bRgdXt+WbSoArhBnp+B58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G42A+iOwhVc/f4BIlSg/xim9c11640lmVVeuJv+cl+ZvUAkTpmMllBFsBHijKgeaemr7SkyPM//fdtPi3cb/7e54cEeoo1SBW7WH7725zMIOQA0DnOk0oXRgZWtf28r/pP6cZRVQc3hkMvGBpKLYXD3WOedWmG/Rnra/0KP3sUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiOlHKeh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2933C4CED6;
	Fri, 28 Feb 2025 18:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740768573;
	bh=slRqAGP1stq5cwMr2TYEn2bRgdXt+WbSoArhBnp+B58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hiOlHKehccho/nhioyMk9PqEexMGOUf9yKGC67lnOpA6c7EhFROoAM0EGuK7BMBMC
	 q8zYr7Phoxn9Tu/ACZIueJT8jkVvia136RA2FfbwVGQYfPCUr38UsyZ1gfE32zY1gc
	 4ebdJbvKDoL2TN2g7qG0vl3nP6ZSRe7orcL49jSEd68dW+aJpYeQq/dbI+kWBiwv9u
	 lKrLr13DuIDJwm/TP2KoO5iiWbFD/sVXXmhI14uPun1hG6HfvmKjbofaUB6TmY0ay3
	 cDXxLNBMUL2oMWlshns1CD84Gk6zTbVhJ07N/ji+H7Gz0eHc9kZImv1sJCSArNJ8/p
	 uwBY1Dz+HupBg==
Date: Fri, 28 Feb 2025 18:49:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Markus Burri <markus.burri@mt.com>,
	Manuel Traut <manuel.traut@mt.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: matrix_keypad - add wakeup-source
 property
Message-ID: <20250228-lard-immodest-85ef8e18b52b@spud>
References: <Z8EMI9ALqYY72VBV@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CG18mM55ivi0d+O1"
Content-Disposition: inline
In-Reply-To: <Z8EMI9ALqYY72VBV@google.com>


--CG18mM55ivi0d+O1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 05:06:43PM -0800, Dmitry Torokhov wrote:
> The driver recognizes standard "wakeup-source" property and there are
> DTS files using it. Add the property to the binding.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502280105.REZ29MVg-lkp@i=
ntel.com/
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.y=
aml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> index 73bb153ed241..ebfff9e42a36 100644
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -68,6 +68,8 @@ properties:
>        Drive inactive columns during scan,
>        default is to turn inactive columns into inputs.
> =20
> +  wakeup-source: true
> +
>  required:
>    - compatible
>    - row-gpios
> @@ -96,4 +98,6 @@ examples:
>                          0x0001006A
>                          0x0101001C
>                          0x0201006C>;
> +
> +        wakeup-source;
>      };
> --=20
> 2.48.1.711.g2feabab25a-goog
>=20
>=20
> --=20
> Dmitry

--CG18mM55ivi0d+O1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IFOQAKCRB4tDGHoIJi
0uW6AP4sjiFIDI7Ec7ygR4PeEI5UGvqe+UwfRUGw4dMKHK94zgEAhfhxvyE2d4Xy
+1qRfqkmZUl/UA8O3Izbj/BT0zb2iQ0=
=/7xV
-----END PGP SIGNATURE-----

--CG18mM55ivi0d+O1--

