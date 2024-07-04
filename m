Return-Path: <linux-input+bounces-4866-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3527E927ADE
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 18:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2926B227DF
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 16:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86821B150D;
	Thu,  4 Jul 2024 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2pgep8T"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9637E1AED45;
	Thu,  4 Jul 2024 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109531; cv=none; b=fQ5CjwOf+g74DrxLtVykLneDJ19V6pymYtecXBJyMNytMN18fNBDpdMz6ahVOdKNF+4LJR42aHXlXqYYScUvJ5gUs4c4MPBc1KfncHorx661aSfXXIBcAe8TmGrZCB3tsytvi4RSCVavbhNqNrh/XEYWFNQkX+aMob2YJ4V/AlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109531; c=relaxed/simple;
	bh=CYxifX6Yhm0+JAKQZbOubcWktzgmWp29CWPQj081j7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqgRSmHVBTbx+Qf/8bfjiDEWvwNyhwj9SeD4wbUKNY2VumCqhPskdIonoMSdNKqNdfHJ2ZJGo/9xCpBy9elas3n7VOpxXtosiA0nF3DfC9INOnuXTU3kx0mOjrGglhExp8JfBr14+kUPUo+zbEUNnE593i3EnPQiYxT6QtNMM5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2pgep8T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7272BC3277B;
	Thu,  4 Jul 2024 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720109531;
	bh=CYxifX6Yhm0+JAKQZbOubcWktzgmWp29CWPQj081j7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2pgep8Tpy148dUOc5xlDu4lHLGn1TU8+v0vG6pM5I25X3DZDIFsmsON5ZjCMyN3V
	 OX145YGUSOi6tUDEOOyVzKRQQ8otPhGRihHApZISWpPhjhH9TkPcKWjNrXFHNAvBfi
	 wVJsJnhstt8pkmZEI9trNzyUkfmXPUf3sybir9cpDAiXK41Tgv9qhe1gN/W3iMKNds
	 xOFOVEJ7Qqf5gat2harn554g9LXI8nkKIDh0KyDAzIvV5SBKZR4gyImQ5ZSpwYazHE
	 qdYrvs1frbsK2u/89AM7nzfvXl1XyPr9Po0weIgNZ2D6+im0BCgiD+YwyKXaraAwn/
	 gfOVDbNm8yjxw==
Date: Thu, 4 Jul 2024 17:12:06 +0100
From: Conor Dooley <conor@kernel.org>
To: utsav.agarwal@analog.com
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Oliver Gaskell <oliver.gaskell@analog.com>
Subject: Re: [PATCH v8 3/3] dt-bindings: input: Update dtbinding for adp5588
Message-ID: <20240704-frown-salvation-bc3ab3a9ca25@spud>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
 <20240704-adp5588_gpio_support-v8-3-208cf5d4c2d6@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W8BlEMzrN+B/YFAs"
Content-Disposition: inline
In-Reply-To: <20240704-adp5588_gpio_support-v8-3-208cf5d4c2d6@analog.com>


--W8BlEMzrN+B/YFAs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 03:26:32PM +0100, Utsav Agarwal via B4 Relay wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
>=20
> Updating dt bindings for adp5588. Since the device can now function in a
> purely gpio mode, the following keypad specific properties are now made
> optional:
> 	- interrupts
> 	- keypad,num-rows
> 	- keypad,num-columns
> 	- linux,keymap
>=20
> However the above properties are required to be specified when
> configuring the device as a keypad, dependencies have been added
> such that specifying either one would require the remaining as well.
>=20
> Note that interrupts are optional, but required when the device has been
> configured in keypad mode.
>=20
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--W8BlEMzrN+B/YFAs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobJ1gAKCRB4tDGHoIJi
0lpCAP48MkPdu7ZsEOOfbEdEZq0UmulakHv/2VxMQWMgqIwsswD8Dq+q4gHvtaXu
myfGYb/D1LVg/3Ovg4YSZLLIfErF+gs=
=6eJf
-----END PGP SIGNATURE-----

--W8BlEMzrN+B/YFAs--

