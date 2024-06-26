Return-Path: <linux-input+bounces-4651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95810918DF0
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 20:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 502E2287F56
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 18:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC520190075;
	Wed, 26 Jun 2024 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwEJkGaf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCCA18F2F9;
	Wed, 26 Jun 2024 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719425350; cv=none; b=XKjv+vmM6Um76b5HYQ2CrB7c77Nt29TCM16c903Fnw8B/3mnUfMLu0KIhy82g2VodxFl8bHuW7VHGKXg23UN8yfO90fumX3acshnJhtsfAxnjuy64r+l8/lsaHMRcAywMp31hG8tFvMoGp1OAUiyT5c9CXY9OJSq+BZ4/MMMbSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719425350; c=relaxed/simple;
	bh=OIkZs3VeZCuVNt3eHWozE2UzABo9DPlNoyZ+9Vp070c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+WG49rKF/e3GGdrsBfLzPBdrXrSyGvwEwT/4h9t9IqyEbClgzT0eM1cOBPZPsjEL6vr1rj+Fxgk5I1S+4+0IjgoLdz0FoTo9zfZFCrYqbO4Gr1pWDGanzEmWw0K95zBeMp0R5jr+fA5bjQ0AU5B3Z6SB7tS5kINd13RmuotQBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwEJkGaf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC48DC32782;
	Wed, 26 Jun 2024 18:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719425350;
	bh=OIkZs3VeZCuVNt3eHWozE2UzABo9DPlNoyZ+9Vp070c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwEJkGaf+PUD0GGvn7FveAj8khf4l8XN2CySBP0dr1NWvuziTaS0gJ2zTSm+oPa2S
	 Rc5ukM22Y4fLgjQlmtcELAzz/16F1TKIiiv9BnD+69sQBuR7JXfk2vuRUUMMJRKmVz
	 Un6pl+Y9nipd2IdSo92cgGK8IZKaab6cUv65sfCcW7Jf1SCeEr3YxMOiq8P4vkwnvd
	 QKlpk/DqQ2LYWm0f34r86lRnoh+G4uPPEKiEXkOoyC+o+yuwFIHy6ajew3hF1GWPx0
	 1GqsKO22cTzv99XMTltE9Bb30KtJwNmg5vkvPlCzGiG0FAuYO2pf9gDjcVAqYh4Q02
	 vc2BL+xiokCZg==
Date: Wed, 26 Jun 2024 19:09:03 +0100
From: Mark Brown <broonie@kernel.org>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, jeff@labundy.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v11 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Message-ID: <a85e09d6-d8eb-4c60-ae83-b4dbf875a926@sirena.org.uk>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
 <20240605135249.361082-6-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8mEJd0CHi+B3bZ3f"
Content-Disposition: inline
In-Reply-To: <20240605135249.361082-6-jogletre@opensource.cirrus.com>
X-Cookie: Results vary by individual.


--8mEJd0CHi+B3bZ3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2024 at 01:52:49PM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.

Reviewed-by: Mark Brown <broonie@kernel.org>

--8mEJd0CHi+B3bZ3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8WT4ACgkQJNaLcl1U
h9Bt+Af9HBe54X4RVb20Y7bnquKBQ+YbOooZVqnUN2dSa1l0HdCs7CJR0llcRrKd
BCA6oQIthd83emrxp01buNbaZ2pLOkZGIm+WAn9/jR8aHU8NcViLP3mSsaZf31Vz
AETFhx5lfmLZrLFcz0Xi1an+tLvKD3auLxHw7Uyt936Y7pSJXB8I4mhWthPQ2jdI
CRWT9/auz7Q8baFDr5ndlj8KznmUdL9a/8J1r/HhuXWmQg85GoxmhFJkFI/2SrPk
kILmByXe5j7g2cudStW0HnTKy2Yn9j3vo16tydcrshecP3TUwxK/ie9TVNhqxg+Y
amT1SSIWWnXdth5odVsUTo4ZnCMjSQ==
=LRDI
-----END PGP SIGNATURE-----

--8mEJd0CHi+B3bZ3f--

