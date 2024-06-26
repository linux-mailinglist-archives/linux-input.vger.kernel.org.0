Return-Path: <linux-input+bounces-4653-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3F918E9D
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 20:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 796241F27D8B
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 18:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5B6190056;
	Wed, 26 Jun 2024 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LE1p9Ura"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E514B6E611;
	Wed, 26 Jun 2024 18:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426816; cv=none; b=rNobE/ucDlaplC6JfWDaRW00fRICusqHOPKBHC6GynEPhMVraTZYI4jaD0ZP2akpHookju05YF085XEH7xdnnBQwh8Eecy5G+xbnlndjrJmAWcH2dRHRHbP/PrSNn32wKqk/2aFGjuR5zFPeZPWMJK+fUN7JWPeHr11Wdag6/rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426816; c=relaxed/simple;
	bh=o09GXnpjsFOG/B4MyelvtaeHS7etd7sZdVKlPp3iYpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9C4gstL6ZWzMKH05nmKFbele3yM2j+OGOFAd2i8TPxwsFhaqi3b7UMwcHGy1YmmBXMb9b/ao80w7S8bCOUXUUFtEdOMLLh/B9kZjNjKescfzeXTPmeEoCgX2uTIOZc+6gWD2jlcCHfNcYS8NGZo9fmy8/ftYKNTEFBISbt3+wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LE1p9Ura; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA98AC116B1;
	Wed, 26 Jun 2024 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719426815;
	bh=o09GXnpjsFOG/B4MyelvtaeHS7etd7sZdVKlPp3iYpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LE1p9UraOdoM7EHN0tXCR28oH36+Qt1/pOZ2UZf0JjjbXNwdUJBULMHzfU6+hmNrF
	 ZnJAfnl+GhbGQr0MXhq5ZxzLHYQwZucSCbUnilySKRfElv8OMFM1r3Ija+BG8xpDoz
	 QK9dtLSiJAExR7y0mr11lzBkviZC8SESK15YrBQ1eR5SJ5giM4CEjVUAaTwuwLj3nH
	 mKwg93MYBWizB5qkF7eI/14Rgvj9jAjzKmbL0IeLxUYXqtPbBuT+KNurAIvUiq2/1f
	 9FRzLkAubcaMbI0sMSApf7FJ/k/Bw+EtFdnzpoLDC8H2SOH3XH9IfpjniKWyajEaT5
	 SDyL8QUS+M4Ew==
Date: Wed, 26 Jun 2024 19:33:29 +0100
From: Mark Brown <broonie@kernel.org>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v11 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Message-ID: <d48eb42d-69a9-4a17-8b18-0294cb9fa9c7@sirena.org.uk>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
 <20240605135249.361082-6-jogletre@opensource.cirrus.com>
 <a85e09d6-d8eb-4c60-ae83-b4dbf875a926@sirena.org.uk>
 <D3F6F68D-5921-49A3-AFC3-E280597E7DE3@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xh2op0woHKopXM/o"
Content-Disposition: inline
In-Reply-To: <D3F6F68D-5921-49A3-AFC3-E280597E7DE3@cirrus.com>
X-Cookie: Results vary by individual.


--Xh2op0woHKopXM/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 26, 2024 at 06:25:12PM +0000, James Ogletree wrote:

> Thank you very much for the review.

> I believe I need your Ack on patch 1/5 of this series as well:

> https://lore.kernel.org/linux-input/20240620161745.2312359-2-jogletre@opensource.cirrus.com/

I don't see why?

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--Xh2op0woHKopXM/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8XvkACgkQJNaLcl1U
h9DwtQf/YQ/Vby2L69tzDGcijjycSn+Ot0kxxYByNY+7xPrkkvDTh7ovgHolqgXD
sedw/43IpoVxlgSN4YCc73Un6FrPPn9OhFrrlFurnWCDvGmzy4ynihvSBKHsrM6d
o8SJRWblgtg3bhCJfAkdLplBcNbNywx4nIiq/OEhC3dTYWyTW8krmvtRwiRF4i5i
4GgkCpji7SH1E0xR0TtoIOFJuM8xzyXORmVEHarOPf/nwDXaxLoE2OCDoqxyMJS2
AdjGPBED2llN+IpqvKQEOwfiUp8bYTU5UA3xwvam2SWRjUh9nHfmCTAvEI7Sx7Wz
HYdnsrRQ6uS9FpYOtKWIsSw3TH1g6A==
=1lFq
-----END PGP SIGNATURE-----

--Xh2op0woHKopXM/o--

