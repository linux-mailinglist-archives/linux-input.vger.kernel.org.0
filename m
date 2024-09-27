Return-Path: <linux-input+bounces-6801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACF198809A
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 10:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6741C21DA2
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 08:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71D7189B94;
	Fri, 27 Sep 2024 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CPKgnjtJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB53189B8C
	for <linux-input@vger.kernel.org>; Fri, 27 Sep 2024 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426564; cv=none; b=f6xejPyveFELWHs9DYKb2MLYMHo3qzxODVoy2iG9n3ev7zjUkRgCimWChfoljGzXjYhsVZ0pKRWUkGaJlxcccFYHfUC9jIHF7b4a54pqMU1e3dCTcg7mCVwoXpYok0OpzQNmJHEZckMeZ2j3kahgNruDt0Sr1/QkzAJArtV1UzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426564; c=relaxed/simple;
	bh=h1sNlgDb2eWjD+fgMUzJQ59c0HQ19jgGRC9eEzkMOHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLnSu4r2vpCt8ingOEskkxVo9vclBo7N7JMY7XW0VLnVfMkBVJsdQnLal33vkxxOkaYLsUBGk0OiLoO8+2rPgpBRmI8yv/uBSafnvga1nd1S7hAqbiAxK9jJhLrsV2JSxbO8o5MejtcLPB8WR5DIv0gISeGVms5mxhF2vPPOEJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CPKgnjtJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=h1sN
	lgDb2eWjD+fgMUzJQ59c0HQ19jgGRC9eEzkMOHw=; b=CPKgnjtJWfxb8SGUnRiO
	iKaclDzgp1DK1XJrJZyjspaJYY+C39JZvFvndsNjPwZnt6fRtcuwfoS+odR98kKU
	vkNo69WP4JxuVK2xIlT56gPV5LvEiZOOcxenyfTZISVoopWbJM5WqyzwYZcp2lmK
	H0qlAJvVSgLhp0DrXhKT8pohuG4XvrXUoVRZt+X3vTBaa9my27MldHJYl5/dEKef
	5fQaCqTpG+cNVTGGeoYZMwslWr8e9GbMYJNdgzl8p/3gznEvWLqKTCkbfYIctN2h
	i03XhZehNgrOox94xKrhp5knoU7pPgY8QXvqEPLLzo4kj6AJcRrfZh+0U1IBWy9b
	zg==
Received: (qmail 1261370 invoked from network); 27 Sep 2024 10:42:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2024 10:42:40 +0200
X-UD-Smtp-Session: l3s3148p1@3bGB1hUj3KEgAwDPXzRXADDuo30Z+IZ9
Date: Fri, 27 Sep 2024 10:42:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: gpio-keys: allow generic
 'interrupt-parent' for subnodes
Message-ID: <ZvZv-_y4lpkccKX3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20240927081757.7022-2-wsa+renesas@sang-engineering.com>
 <1762ec04-4dba-4de1-b380-73bf391462e5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lTwy7cWuWTCkCAC3"
Content-Disposition: inline
In-Reply-To: <1762ec04-4dba-4de1-b380-73bf391462e5@kernel.org>


--lTwy7cWuWTCkCAC3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> "Nodes that represent interrupt-generating devices contain an
> interrupt-parent property..."
>=20
> but gpio-keys node you marked as interrupt-parent does not generate
> interrupts, so I do not think this is correct.

Agreed. Thanks for the heads up.


--lTwy7cWuWTCkCAC3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb2b/cACgkQFA3kzBSg
Kbbd8xAAq1LThFNITwa0mC7rM2Q4rxeJS0aqTqHEZHnO2kVWd6mOqDe62WR2hoQk
jNWBMgzyRLoB2J/WOPRmPaCb24Y4w4EhivkuioEIzcrh+T+FNH4q+lH3SuHcT7t0
DAcrK/uv37YfZ5E3XYLm0Ci/hO3D/OJm9uI8NH09LnKVSIjjw+XFunQPxJ2rbBaO
4s6OfAj6yFvTPi5GSxy578szmpqmi5K4DesNjJe4DRYSviUbNRtaj8DYeu8nSHgN
BLqpDfwCOj5UmWjV4G2VFXvL4KgLlKZy3rqkobp8f4/pIUHWXqLKIyWcgSwq77ch
AYc9t0FszCO3M6MjZnPAx8yGGvOneORSy//g5Bd1k0hmqKSTKbGThj5+oPDazR/l
cwM4O23ajvAhaPbPoXnJkj9BbjBfUNH5ULsxIzkpTGjhdloEgUK/UhAbZ/mG6NU/
IX85wnMEFjqbIlsBKVDC4DOwrOF/DivxAXPl0lxfw/UJobwfAXsuJsJEkAwZX7vV
fx1vdsDg/bUkuFYggdOg/e1njWFKl9wPK0Xwkdlv3b8qZLM1ok0jlY5eB20WFrml
hS4kuNA/UDHq1rXuuJNeUMmzZDOkDwPjWBM4ajBtvFV9kElHkx+YrSbJQssNW8E6
Zt5ZM/XukO4kj7G+/XfCQmMdVBUaZzjTPGr51yaolE62A+3kSvw=
=T8V1
-----END PGP SIGNATURE-----

--lTwy7cWuWTCkCAC3--

