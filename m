Return-Path: <linux-input+bounces-373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E700A800CCB
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 15:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0F3B28175C
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 14:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717463C475;
	Fri,  1 Dec 2023 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stL7FE/1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F543B792
	for <linux-input@vger.kernel.org>; Fri,  1 Dec 2023 14:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240B3C433CA;
	Fri,  1 Dec 2023 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701439390;
	bh=7X5mlH1FhTlTWpG02lqQC92oSHhlD5sS209SMgQyx6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stL7FE/1UdRHQoA4JD28o4m8ZZAhui6Ys2h0U+lWV8hdxzUvKwpowl/6zDD1ZWtWg
	 +MY8LZ1/GMi3f5z6nJ4L165KRJQiaqDfapf9GBxlu+w8w5m8vy1KQvtPGz/gN/ckPj
	 hULoLTtnG3iAvDTTpaUaXuUiu/3iQGUZE1KM3ojoKkMZS83LqJJxor9k95eqhJWqpN
	 J6kXBVPMJLcs1X2S4rUistazhuiLhCiHUZGJW1db7MEbtjXAH9MVMkm3GnKyMkWFAB
	 mUkSVsIhtNoln+r6hu18pvK9WVVa0GiIUs6GrukiWTloWtTvNL8/aUwX0Zo+ogX5/D
	 92UBll4+mxDFg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r947N-0002Bi-2q;
	Fri, 01 Dec 2023 15:03:45 +0100
Date: Fri, 1 Dec 2023 15:03:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pxrc - simplify mutex handling with guard macro
Message-ID: <ZWnnwfzqHlfjSqFK@hovoldconsulting.com>
References: <20231201-pxrc-guard-v1-1-38937e657368@gmail.com>
 <ZWnfsjIukIbAvQ-l@hovoldconsulting.com>
 <ZWnkFjFeEV7y9tUr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RvzoCxPxgrfnamj4"
Content-Disposition: inline
In-Reply-To: <ZWnkFjFeEV7y9tUr@gmail.com>


--RvzoCxPxgrfnamj4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 02:48:06PM +0100, Marcus Folkesson wrote:
> On Fri, Dec 01, 2023 at 02:29:22PM +0100, Johan Hovold wrote:

> > Eh, this looks obviously broken. Did you not test this before
> > submitting? I assume lockdep would complain loudly too.
>=20
> Sorry, it is more that I'm not in the habit of using b4 for submitting
> patches yet, so things got wrong.
> There is a v2 out there.

Ah, good, you noticed yourself.

Johan

--RvzoCxPxgrfnamj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZWnnvQAKCRALxc3C7H1l
CF+ZAPUQtJxNLf02XShjHdKS6NdhEE7tjiBvw9T/Jojh4lZ7AQCdctKkAWxZaw8n
0jC/CUrBTqsPcu0LBukxRPzPePx3Ag==
=8Tt0
-----END PGP SIGNATURE-----

--RvzoCxPxgrfnamj4--

