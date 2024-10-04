Return-Path: <linux-input+bounces-7088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F739906E7
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 16:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF6C81C223F7
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 14:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739471D9A72;
	Fri,  4 Oct 2024 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBxKL3Ds"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C91D9A6D;
	Fri,  4 Oct 2024 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053900; cv=none; b=HA7f2rmiC0HASJEj5EzUWD35i1tLokB6QsJBqByqbsrLJvwsr4oyWmdKDD+fIPVWEsquT8qFkk2v9MmiXGrAg3kSm7nNmt923ZwApAx6LGkJ0q73R8soSFs+V/35n6V+fIY9yS208QzODMz+1kDGPbqgC73mKHihlnOmoom8sKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053900; c=relaxed/simple;
	bh=hdx+Nlnqh49HdIrn5ECqFiAYUAa+WEBCnBFbH03L0U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtsndAeGhjRaw3bW/h8hfDdU8/DQRLg3Vp+YHFOVvtFlTH18ez/NyJ2lbiBg2TSA7Ssqi3dbykO9b45Sq6CfX11WX+r7fhJvZanZm+h5ihgulwfl2UZenxGbJlCH2jMKPkHSiAxTYd7CU2rBsBYyBSUt3aFsFACb/xhfUAnR96Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBxKL3Ds; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FC3C4CEC6;
	Fri,  4 Oct 2024 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728053899;
	bh=hdx+Nlnqh49HdIrn5ECqFiAYUAa+WEBCnBFbH03L0U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBxKL3DsUpoP+JinPpudeiel+njsclMIT6jbhTpYmITwoloJRv9FKqNNiD5ph0hnu
	 5faD0whmMiBTR7Nz/88Ak18WYLsE52Q0uhymh0x7AxkJxDrgD8PCQ3S3QSiigRHpyF
	 W59ARwSudAfO8NEOcYPGa3y9zAaFpx4nwpjuHCIvSQDLrQJO9x2o+aMJRdbMuh/S09
	 1fKHViikT4dbYtVAl9zB50rJO6gMV60zYIamcgyGcXBMNEBz1ens/7gegntv9w9Y1V
	 Ab0tV7vj5FC6h4pWus2y3EcBzwyKUVPfPnck+Bab7BsyVIMAZCRO/XCJwQIMLh7gOP
	 yIJtfLjjUBOsA==
Date: Fri, 4 Oct 2024 15:58:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 00/14] Remove support for platform data from samsung
 keypad
Message-ID: <76d98587-3623-4ff2-89eb-a5fe8c535293@sirena.org.uk>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <803e3902-cec9-49ed-baff-d26e578a8ab7@app.fastmail.com>
 <Zv_vuSrJzpN9IvXV@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2O90PREKokAOuISY"
Content-Disposition: inline
In-Reply-To: <Zv_vuSrJzpN9IvXV@google.com>
X-Cookie: A bachelor is an unaltared male.


--2O90PREKokAOuISY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2024 at 06:38:01AM -0700, Dmitry Torokhov wrote:
> On Mon, Aug 19, 2024 at 11:40:56AM +0200, Arnd Bergmann wrote:

> > I had a (brief) look at the patches, everything looks fine to
> > me, thanks for working on this! Let's see what Mark and=20
> > Krzysztof think.

> Mark, were you able to give this a spin? Or should I address the DT
> binding comments from Krzysztof and Connor and resent for merge?

Sorry, no - I've been some combination of ill, travelling and super busy
since you posted it (sadly the bootloader for the board only supports
booting from SD card so until I port u-boot it's not in my board farm
and I need to specifically set it up on my desk whenver I want to do
anything with it, especially for this where I need to poke at the
keypad).  I've got one more week of travel next week and one of the
major sources of super busy just got better so I'm reasonably hopeful
I'll get to it week of the 14th but probably worth respinning.

--2O90PREKokAOuISY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcAAoYACgkQJNaLcl1U
h9CIyAf/UT+SvU5Yxhj17iZJ3+MFGVgNHn0JN6vrsQBXrossVlgZ1JP7vbl1RobZ
cw1/99nUqLGDjOHkNBSx/2/GjaZz1gEUDCbDeVaIMifsrGd4BbtoMTfwnclyCsp6
fvvMKx0WAzcRmvm+FdQ5KGgt6mzZDsT/u3Q15ZOJ5GHunnP+njEkRY8SzaRZZteP
EgGtc1FFI+tDVsoIQ6DNA23I0DVy2j/HZB23y/mYEOF1JiIspwhM+JjVUKJVgU57
piRknEy0k2sO3sJ26HhyngwWT30Zg+ud+oSB64uO4RqnGqP9B6coPbCzow4vvENE
zTfKRFshRCxw25+aDBoBxDxERSyLew==
=jObm
-----END PGP SIGNATURE-----

--2O90PREKokAOuISY--

