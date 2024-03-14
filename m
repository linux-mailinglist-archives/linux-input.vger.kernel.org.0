Return-Path: <linux-input+bounces-2380-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17AC87C12E
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 17:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8CC2B21F14
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 16:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5553073181;
	Thu, 14 Mar 2024 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2oWtcOz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B49399;
	Thu, 14 Mar 2024 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710433373; cv=none; b=DMYWHjcSmfBr5P9ssH4tET+hHhOowycXZ4nafh/UGeCSg7qqsA8z2hUrDn+vDbB9wowjekzKR+0ImRes4ND7K8BQMOhYH7lT8/MachZFF0lp60ayEgSCPj0pFJ+O03w/tLewdvTECHBRSzMliklGt/iGCtcVcdDH6JVWZfmB+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710433373; c=relaxed/simple;
	bh=iJdTVuwyvbvSY/XCCRTtEW4xWwIydPBTxRXPrxmDDRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKA6SEbiA2sSUsAyzKhnCbUhcqC9etmdJqGRSk3eimSGghXDWsbnWxvYHJlffBYH6uM9poNGH+ncAaxbKQcb2OVUa1AKbm+HX0T+pXq3jnCs4UW4x484jXgzEWEl+uufE6BAszAcjWBkocsNQoGpbysOnmZkEkyTNpGRjIYNtHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2oWtcOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E73DC433C7;
	Thu, 14 Mar 2024 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710433372;
	bh=iJdTVuwyvbvSY/XCCRTtEW4xWwIydPBTxRXPrxmDDRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2oWtcOz0h1l4iJKdKXwdNbfu3cYlM5e19QAWtBJZ+4JA3QOyL1wRqSxcURrgpkLJ
	 ZquMZo8t5Hix/D3B4f75T0wTjCbj4W8rkjeJlkFlxTIwXf7CGgqqKW9TyuQw+LxaVz
	 3TPWjATv8tMeD2La5M8uc+Venp7xfdLQobaj3NFJnpT2aBm9hyJ2HI5be2bwVOndvy
	 QIAbkix+WNHKqU3GHRMHXOBoDGGpiM6dLhw3R0paUKO9YOS5SjrlIEyQoUVJfhfVme
	 m5mX1cAGg46J3mMnC5gHLYG3uLN0sIxIDMWewRFU6OHU9wv7D3+QBAn71yVs9zyjew
	 E2KuJU50is7Hw==
Date: Thu, 14 Mar 2024 16:22:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff LaBundy <jeff@labundy.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Message-ID: <d612bc72-78e8-48a4-bd09-42d3dc9131da@sirena.org.uk>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-6-jogletre@opensource.cirrus.com>
 <ZfMgLc16lOTK62wa@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jg0Z45KUT4xMNSmL"
Content-Disposition: inline
In-Reply-To: <ZfMgLc16lOTK62wa@nixie71>
X-Cookie: WYSIWYG:


--jg0Z45KUT4xMNSmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 14, 2024 at 11:05:01AM -0500, Jeff LaBundy wrote:
> On Fri, Mar 08, 2024 at 10:24:21PM +0000, James Ogletree wrote:
> > Introduce support for Cirrus Logic Device CS40L50: a
> > haptic driver with waveform memory, integrated DSP,
> > and closed-loop algorithms.


Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// CS40L50 Advanced Haptic Driver with waveform memory,
> > +// integrated DSP, and closed-loop algorithms
> > +//
> > +// Copyright 2024 Cirrus Logic, Inc.
> > +//
> > +// Author: James Ogletree <james.ogletree@cirrus.com>

> Typically we see a // C++ style comment for the SPDX identifier, and then
> /* block comments */ for the rest, unless the maintainer has explicitly
> asked for this style for this specific subsystem. The introductory block
> in the rest of the series is much more common.

This is something I specifically request.

--jg0Z45KUT4xMNSmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXzJFcACgkQJNaLcl1U
h9AlqAf+KVdhckz2xCmQhzAfhdAR3HdZrYKDJR4CQ36IJzphPv8EANPPsT1wrKhJ
xX2FSnd/4PEH2m/vU74gZoqA8WRb4dVil39mJjigMYv+8O05q5x8+fGBNdfwybPj
W5fkq8magCYKoNh7x9XyWboGkdpCWjxTzO6zyV13225M/qyyWzMoAGiwSuor4Fbp
gj4dHLCWTWg9T3AuoXgnDSL0kx/qKzEx1+RIn29mnEb490RcA4xDXmHPh4N2DtaE
dvpiR4pZ9niey+yaE1Rq8+SaVlcOapc/GNGOzCVAKUlROCWvXc5f9Oki9sRI19Hl
XKW1RRsH+ef66wsRqrD84FFsTMLEog==
=98u5
-----END PGP SIGNATURE-----

--jg0Z45KUT4xMNSmL--

