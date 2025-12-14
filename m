Return-Path: <linux-input+bounces-16561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52241CBB989
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 11:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F0313003BFF
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 10:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2290228CF50;
	Sun, 14 Dec 2025 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXaMNbeB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA172FBF6;
	Sun, 14 Dec 2025 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765708703; cv=none; b=HuRaWApJCdqBIGmV2cCEb9x80TkVSwko7jQ6pe21GClTL0FPt9kMzrO4N0933KtL3Lf77/YRKiMzDLn6JIt6P7wEY93B6jC9UnagVACuMrM5KtApV7llW3lHTQNfFn+uwUmRMgnA68zhdrlIBOVWYK5uPqDAVpYUTqUr4f6Hzz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765708703; c=relaxed/simple;
	bh=80olQ6vOco0mlqqftd4nCKQJWTfx+IFvRdHC+Jad9jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNKv+N9zkesiOjyrFcaP66wzziAbEhrw86pSmFF63M037zjcUEpEmd3SNJfWk0kaStkPTeqSfb3X1ps9FclMaL5r9br2my3jNunB0FDfBTwlm3fBe1jlLbWo07UaryvjVwtwHkPD37In4Y9N1qmH8MoJql8kF+dUbgJCupBjcMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXaMNbeB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688FBC4CEF1;
	Sun, 14 Dec 2025 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765708702;
	bh=80olQ6vOco0mlqqftd4nCKQJWTfx+IFvRdHC+Jad9jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SXaMNbeB/47ggq8hUaqv8Fbxdfu0gxoxfRsxEd4s5R39dniVaWdZIFlcyK+PXtIzy
	 3EsPTiaZrYV6GRsUGtB5BYV32aPeMXtP1hch7tq48eaCi/eL4PV2fsidaFa8/yU+cx
	 U9QF49e/rKXKgUPtPt7/IuE3IbigqlPA/iO0xoDBbI3PLJiMTMQD1RFTJSLJSKhXhq
	 F0j37od6aJTVLzP0SLsP4mxQZeomfCAnC+nFSiKIPjUc6u+GUQNX4HbVNmGAkEQOJw
	 vrdi8nvChGljgiHBHelZ67cX7lZUmlsjVcdRtHkt4toxTKjPhzaEgp8y+wB1FyeF6Q
	 1qq4ejhclXouQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 730141AC5687; Sun, 14 Dec 2025 19:38:19 +0900 (JST)
Date: Sun, 14 Dec 2025 19:38:19 +0900
From: Mark Brown <broonie@kernel.org>
To: harindhu007 <harikrs0905@gmail.com>
Cc: dmitry.torokhov@gmail.com, support.opensource@diasemi.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: sound: Fix comment typos in apbps2 and codecs
Message-ID: <aT6Tm4r1jiYn0AkM@sirena.co.uk>
References: <20251214102008.10582-1-harikrs0905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DSPvND38Xp/Pay8w"
Content-Disposition: inline
In-Reply-To: <20251214102008.10582-1-harikrs0905@gmail.com>
X-Cookie: Think big.  Pollute the Mississippi.


--DSPvND38Xp/Pay8w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 03:20:08AM -0700, harindhu007 wrote:
> Fix spelling mistakes and minor wording in comments in apbps2, da732x, an=
d spdif_receiver drivers.
>=20
> Signed-off-by: harindhu007 <harikrs0905@gmail.com>
> ---
>  drivers/input/serio/apbps2.c      | 2 +-
>  sound/soc/codecs/da732x.c         | 2 +-
>  sound/soc/codecs/spdif_receiver.c | 2 +-

Please don't send patches to multiple subsystems in a single patch
unless there is a strong reason to, send one (or more) patch per
subsystem.

--DSPvND38Xp/Pay8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk+k5oACgkQJNaLcl1U
h9Bk6Af/ZVSmOOws2qhE6gt3jzTeMXq4HskJyJDhI1HTqAOhSBNBZpoH9sX26G1v
lXFEAFMCOZnDgSRAm7Cvg6Lq6pCzsjVfKKPQRn8N3OnSwaocMgRVP6GiKnh5E4FX
PuIfGr35JychhI8jYS9420CliB6H/iX0j9PKrVO0nSgqIQhQMEWptjai2h0rByvy
ZIB2U2sQnhyxUPV4DNbb0pWE5cJWIoFI5GrJtfUMN1UobiULaY4jmZSy0dFJA5QO
xWuKehEABvajpwfpWhZ+xws7gdRstEvE6Q/i1eqPuMRIbRZpTgP5O/yXkkkb/U6E
mC6UiwZOkKB2Y0E1MTrsQJo7AaGBvQ==
=ua/R
-----END PGP SIGNATURE-----

--DSPvND38Xp/Pay8w--

