Return-Path: <linux-input+bounces-14819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE5B819DD
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 21:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7541C3B55C8
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 19:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DE32FBE0A;
	Wed, 17 Sep 2025 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTLQ3dDy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD89734BA28;
	Wed, 17 Sep 2025 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758137237; cv=none; b=r/oaRvj9oBfbsKiHCHKljGDSi6PYYViqGsr4Ipkc5iy17Zx1QQ61GxII90r/NmVQnlxC04qWNO2I7k3bquQFWQSryfcv4krgjsugVUZZZcpHZVK/wipQe/HqOwNGNyisuR702Pekj1owji7rWrBDkW7E/z1v+okVGt2CU5D/Wp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758137237; c=relaxed/simple;
	bh=hYecWlwpLF5pcxqf8qo5BUboIUJ/izWfPJtqoE5fyPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJRf8ytfZ5M3s6SksJGzUXeyfqLjaRlD1wjvLmYs+aFi2T+sV4ke+KBRRtwW63a7DDiSVQVBv09nZ8YPMM2nJlYQNqn1uQMxSMtlkuY/onjkxHFzQKPWYBKxWKFjf6jxP+pPYtzj1ublj1iwGTcy8dnDpr5a0oZj91WHUmvJmh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTLQ3dDy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29754C4CEE7;
	Wed, 17 Sep 2025 19:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137236;
	bh=hYecWlwpLF5pcxqf8qo5BUboIUJ/izWfPJtqoE5fyPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTLQ3dDyLNEsrWaVpCGbcSecNcUdSC1YSlYQA/KH1KSYgRD1DmYdI4CaruN218UBW
	 6+9h6oHyxTFoV3iodtvtr9khDT57r5ozjtS4D3+I7r2YHF2555CHWBNXjWmlaF7MP1
	 vpMbxUdS+zkCDY9FMiEHH0sdF0+gDdob7w/+SxM+IQ8055yxB9NOEyOqEPn2xoWqb/
	 e7aKkzCbpZ0F/OLQDB+realjPhAl/y9pdmCQ/jM9Tmqbq+92KqnkBx+a1ujNgEX2mG
	 8GF4VwU+omyYMXHO0Ln3wPXOwhIPwWgpdhGe9pPCfd5hXXGrxtocVrtISjVZ6+9vKl
	 +PixRf6HPbGiQ==
Date: Wed, 17 Sep 2025 20:27:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v4 3/6] dt-bindings: touchscreen: add
 touchscreen-glitch-threshold-ns property
Message-ID: <20250917-uncapped-scavenger-bbf6af193c1e@spud>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-4-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4KbVf9V6PzgtCt0H"
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-4-dario.binacchi@amarulasolutions.com>


--4KbVf9V6PzgtCt0H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 10:05:08AM +0200, Dario Binacchi wrote:
> Add support for glitch threshold configuration. A detected signal is valid
> only if it lasts longer than the set threshold; otherwise, it is regarded
> as a glitch.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--4KbVf9V6PzgtCt0H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsLkAAKCRB4tDGHoIJi
0p8FAQCERhRFn3VnwkFuoMDEhnCGxVhmGYxRtLp+A810RmuIzAEAjUNCsixsFs2f
d4G/PU8PI1PMWN59yG4mamCUmD43pgc=
=F+or
-----END PGP SIGNATURE-----

--4KbVf9V6PzgtCt0H--

