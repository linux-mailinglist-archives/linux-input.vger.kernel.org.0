Return-Path: <linux-input+bounces-3458-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD28BC1A0
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 17:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23AFF1F213D3
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 15:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BB336AE0;
	Sun,  5 May 2024 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/ELJ4Lr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760B91CD38;
	Sun,  5 May 2024 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714922105; cv=none; b=MdllWUOuVBq+U0j4qkQjkUZwJzAbsFzpXPZzWOoOYWog8n2KXHNUEJTPxChsEAv10XAUv0M2ghdGsqqWswjlbDVeA1xbG2bJx8X9tHqM7D3YJXWEL5z7Qpy699N4HDWnOXTp1ZUXTGGOdyaKBODe7gJkPIij+ZGkoNx8JrU9nPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714922105; c=relaxed/simple;
	bh=3Y6Ya7aQNSsFwpYMxH3lYUB7Xh+C9ZSem7RoTyTrDho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msz0VijYbOxRY2uLRyu0UkhT55+d6/LxcL51DqB018SjKGB8TTuuxnC7GbDiUst8LwlgmStavtCQOEOwGrkX+5+KnXjeV0OQw5AEy1uBU/KEexaNDjwdFrcOoASaVTz0ote1+KtzLfrmzRF67wggGTf4sIbwtzSirUpU22TZebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/ELJ4Lr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A44C113CC;
	Sun,  5 May 2024 15:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714922104;
	bh=3Y6Ya7aQNSsFwpYMxH3lYUB7Xh+C9ZSem7RoTyTrDho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/ELJ4LrM9ORUxUqlCfMupo9YSZBMJECkHdD9BMAJ61a8YQLlQovmZ9IG0suZpLdK
	 seN/esI+XuR80NrjWv46kFX+1WF5S6x1wHdvh6KWH2FwUn2p6lZc4GLKh72hQgv6yd
	 qYLulpsOSazFXaMtz7IphDmMB2iJ8zjbIMDHkZuKERPKqYjTYR4eNInve65ppqjuiz
	 g1FOnhJnfyCXdszGCw3/jKoYtDLyQIT9SpsVrBZR4TOl9DEZcBCOanqnLFVhCcHGPD
	 X5/BmO1i68hD6mi6Jn6RpxHmt6q4Ox5iRkQInwl0uRJnxQ0I984o/54Qpqe+K3GM+/
	 a3/ug+jEOxpKw==
Date: Mon, 6 May 2024 00:15:01 +0900
From: Mark Brown <broonie@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] regulator: add regulators driver for Marvell
 88PM886 PMIC
Message-ID: <ZjeidfoIbjvejphU@finisterre.sirena.org.uk>
References: <20240504194632.2456-1-balejk@matfyz.cz>
 <20240504194632.2456-4-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uRnS6SowswNDaOxE"
Content-Disposition: inline
In-Reply-To: <20240504194632.2456-4-balejk@matfyz.cz>
X-Cookie: lisp, v.:


--uRnS6SowswNDaOxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 04, 2024 at 09:37:06PM +0200, Karel Balej wrote:

> +static const struct regulator_ops pm886_ldo_ops = {
> +	.list_voltage = regulator_list_voltage_table,
> +	.map_voltage = regulator_map_voltage_iterate,
> +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> +	.enable = regulator_enable_regmap,
> +	.disable = regulator_disable_regmap,
> +	.is_enabled = regulator_is_enabled_regmap,
> +	.get_current_limit = pm886_regulator_get_ilim,

Do these regulators actually enforce this limit or is this just a spec
limit beyond which regulation may fail?  If it's just a spec limit I'd
not expect this operation to be provided, it's more for a hard limit
where the regulator will detect and act on issues.  I don't see an error
interrupt or anything and this would be an unusual feature for a LDO.

--uRnS6SowswNDaOxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY3onUACgkQJNaLcl1U
h9BvkQf/TjTKRxV/vksAq6WKXBKwSrc1pWsXIi51Exrv1IpdrCb58IvaAuFOykV8
NZABo6A/hS4k1XF7IppT4XInmZj31Og0LnSXgF0VMe3NsM+plc1Wd50KogVI6zQw
S4cyXayPYmuG1tr1MB2saXTsvKhmCLRsr3zfqcLrti77mX+qdr2Z35VC5zepXZdg
+Dmbu8mYqbX6uW1vOn8DS9msb1FXeVAQKiQUoFd1cMe7/3EpzgOGZKE+FdIzBy2D
Og0MXH689pniCS0lkbzTnnpq+q1GQqeIwgmqRXprHnnJKhbB6bOoRaK8+NAginEv
8MMfIZqNOxcXrhh08DXhuUEc5mGgbg==
=R4Zq
-----END PGP SIGNATURE-----

--uRnS6SowswNDaOxE--

