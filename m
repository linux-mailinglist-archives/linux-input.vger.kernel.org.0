Return-Path: <linux-input+bounces-3686-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0F88C364F
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2024 14:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FF64281620
	for <lists+linux-input@lfdr.de>; Sun, 12 May 2024 12:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50152208D0;
	Sun, 12 May 2024 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ucv4hU31"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9EAF9F7;
	Sun, 12 May 2024 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715515495; cv=none; b=kbsSgVACrhaL2/Ci32IPWEY8FHM15JS7TxIO2BZl5JyMRhb1jIQLOCR2+K+3GhhGZsP+SHvYbSf51/XUJeHyOfz5i+4BdVMj30zwDhSVhAIRlUhMm+k79ZoUjblu8Z4h1XG2LytVNpGE0L3kfGdws0bYy9VJ07zOc2w8FrL/4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715515495; c=relaxed/simple;
	bh=KJmHfyH6mlZJ/m0XwcieNIyf8Qx2hjId1Vn0YiHi4tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6Oy+FgXJJyhGdo3BSY1/tf3v/GPgR85foeHB4TRzXHkKAjj/byNcQg5NIqHLUh4mklEhsh9xMTxw5FdcxlscjYNGJeUjhlxLUZY3N2GpOeXlcfa/Q9LPG3TbOPOAwA68KMSQT0v4QOZDOY7e9P9FlT1PZc5cs30uUoaUKg/N30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ucv4hU31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B179FC116B1;
	Sun, 12 May 2024 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715515494;
	bh=KJmHfyH6mlZJ/m0XwcieNIyf8Qx2hjId1Vn0YiHi4tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ucv4hU319txPNUxw3tX8uYnMFOXqZ634eGAw6UzW3URMD2nFzveUY+gxIkPSkUuxd
	 pT+BfLdAIokszleGFrDGkUTPfvUpGz24sn7I7MkHqY1T/l1dTAkinPJQHVsZuwX3hL
	 1rF1pA7wEaCNJAoNjbkr9zTQ7azPjdJqpQTGyj1MCYHoOm4WQ2LxQLOJDeN6UHSuSe
	 HPZbdEH0t73ZN62oYeZ8k1+eIcaTFMXyow1ArJ8C0IuL8JhsQdLGY/pNy/UA447cFa
	 G56lWHkrpyg3wiJsUa4F2+ixU6hN5hUPm/DTWyzRX4ZrQke4KvZZvYfUjWU8yCZuZQ
	 kv5umxncG0TrA==
Date: Sun, 12 May 2024 13:04:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Kaechele <felix@kaechele.ca>
Cc: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: input: touchscreen: himax,hx83112b:
 add HX83100A
Message-ID: <20240512-trailing-wad-0b9553d03d30@spud>
References: <20240511121245.109644-1-felix@kaechele.ca>
 <20240511121245.109644-2-felix@kaechele.ca>
 <20240511-passage-obstruct-70e4c3b37dbd@spud>
 <dab1dddd-57ae-445e-bce7-879e8d73d809@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Zr+TJl8NhKVw3HF"
Content-Disposition: inline
In-Reply-To: <dab1dddd-57ae-445e-bce7-879e8d73d809@kaechele.ca>


--1Zr+TJl8NhKVw3HF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 11, 2024 at 10:10:08AM -0400, Felix Kaechele wrote:
> On 2024-05-11 08:38, Conor Dooley wrote:
> > On Sat, May 11, 2024 at 08:12:22AM -0400, Felix Kaechele wrote:
> > > Add a compatible string for the Himax HX83100A touch controller.
> > >=20
> > > Signed-off-by: Felix Kaechele <felix@kaechele.ca>
> >=20
> > Commit message should mention what makes this device incompatible with
> > the existing device.
>=20
> Thanks!
>=20
> I have added this note in the commit message which will be part of a v3,
> coming after I hopefully receive a few more comments on the other parts of
> this change:
>=20
> The HX83100A presents touch events on its internal bus rather than offeri=
ng
> a dedicated event register like the other chips in this family do.

Ye, that sounds good. W/ that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--1Zr+TJl8NhKVw3HF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkCwYgAKCRB4tDGHoIJi
0ukQAP4tdPpHCiS+aYv9tr4OD64LFywGL9bFq4elfXmGBza0bgD/fr8b5baNVflq
Fj62Y4D36caKcEeKcT6HFxA4nTFrRQ8=
=WlBl
-----END PGP SIGNATURE-----

--1Zr+TJl8NhKVw3HF--

