Return-Path: <linux-input+bounces-7002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8A98D08E
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3B181F21BC8
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 09:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576B31E2038;
	Wed,  2 Oct 2024 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="B1s0I5yP"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9E1E202C;
	Wed,  2 Oct 2024 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862940; cv=none; b=EcqwWR/+VZkOk4ixcTUPUg9UQtY8nhMaQEh20Hn4Sw85wamYjRcmYK+/OJ5IB+PSlA/7yQQlNx7M6K+P0RHMwmiA1zB1pDzKQi74ZxPNdmC/y0jKnrAZeeo6ODjFInkty27xxkt1tDx3gUCVvyH59DjIdS5Mtcf/by9wklC6RWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862940; c=relaxed/simple;
	bh=BMrLC7TUbdKo7kjLWPAB8a8c8z64G6eVomQOmJXFnNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkA2S95cwyjFfeYPsQh8rNWjK3ZuAoQwxuOkdhHPe8PTt0l5Cx5fGTQfJ8IZY+fxR2lwib9RL2vy7vUqLBybzBKkuGb7fqIHNw0eCOU+Wzo+Veg5+ffzTYijQavVmpg1C1ZhefOFhTOm0eA4kkXBrIIJEPMvoE1THSvW2HkD+mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=B1s0I5yP; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 09E911C00AB; Wed,  2 Oct 2024 11:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1727862936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xVFQhl1IXGjm6FdN7IB9MwRQN5m8UNmBJeC5esI3Mos=;
	b=B1s0I5yPlzF/d6xsKvaj4iLqlUQ4x9YntyJ1Ek7CDFsjz+WTvoPMQLi2iQue/utjDMVgLv
	8LrHbMff704Y5pYOWpfKFaPwH8sXpoeI/zKfvPE4CD8Wxcs1GpL0hfEg5eYWDiq6yVndZP
	Bk8u5fhKxQEozgzogxP83uKYhV3ACU8=
Date: Wed, 2 Oct 2024 11:55:35 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org,
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
	lee@kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	onitake@gmail.com, cs@tuxedo.de,
	platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
Message-ID: <Zv0YlxQOFVGRS/DB@duo.ucw.cz>
References: <20241001180658.76396-1-wse@tuxedocomputers.com>
 <20241001180658.76396-2-wse@tuxedocomputers.com>
 <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uaKVhuXPT4+1FXsI"
Content-Disposition: inline
In-Reply-To: <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>


--uaKVhuXPT4+1FXsI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +static struct wmi_driver tuxedo_nb04_wmi_ab_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "tuxedo_nb04_wmi_ab",
> > +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	.id_table =3D tuxedo_nb04_wmi_ab_device_ids,
> > +	.probe =3D probe,
> > +	.remove =3D remove,
> > +	.no_singleton =3D true,
> > +};
> > +
> > +// We don't know if the WMI API is stable and how unique the GUID is f=
or this ODM. To be on the safe
> > +// side we therefore only run this driver on tested devices defined by=
 this list.
>=20
> Please limit comment length to 80 chars and since you need multiple lines=
=20
> here anyway, use the usual /* */ multiline comment formatting.

This driver needs to be split into generic part + hw specific part,
and reasonable kernel/user API needs to be defined for the generic
part. It is really too soon to tweak comment lengths.

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--uaKVhuXPT4+1FXsI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZv0YlwAKCRAw5/Bqldv6
8uc3AJ9YfvVjpyV7vAX/h5mxLaYK816TWgCfXnY6WH/URGZR58rYfQMlwSibVb4=
=GCLD
-----END PGP SIGNATURE-----

--uaKVhuXPT4+1FXsI--

