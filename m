Return-Path: <linux-input+bounces-7004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493C98D0C5
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3986B213F5
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55431E2033;
	Wed,  2 Oct 2024 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="loAw3P46"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79A1FA5;
	Wed,  2 Oct 2024 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863539; cv=none; b=TEWRH4xp6BAEktiy92G4z4P3i/fwuaAOr3bFZiYdNkFYcDWY+vyeg4XA97lwo8ndIKvafgO1lWelEkPN3tEhEsm0wPbOIfHRisb9nsH4jwCYvlVCPMbV9Mu+Sr+ioepGzi3Ds522bY6m6S4CF7NrQe3zjZ1JWdSaE/DiuxmqGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863539; c=relaxed/simple;
	bh=wSJKyNpdkL036dWEGykRExVdPXWTw4kCHTji2makNVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Imgqyq0ZlMn/tFpfFvk7JqLc4RxpvqgSdQZbO2o3BqOe0zPt+H0MyylklJ9XCI4jO/7VXYedCwWMmtt2UrjOsvYI0anc7P1WZk7Cu7vKVwd1Y+JoxMyThp9xwmLqrjO2fkw9/T5FWSxrwUFNICBqUrAwkBCzDGlSrcWtpxj96i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=loAw3P46; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 847221C00AB; Wed,  2 Oct 2024 12:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1727863535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VfuiRXRY0wqydTeH0MWxTZk7em8PH+gby0u5eY1neME=;
	b=loAw3P467BCPE5Xmcz+Cvm2i8cXLQNjKYOguqWLT1/a8DJaWWP/ZC13lXWSVUM20zOFEoF
	p+S9LPmrCK3eWvm7E35hH7fgBTjTH+FOPUsC8zPG7riywLgPRk29wK4EucUhx8I8Nqnh1w
	2ZBF/AdSECKVIHnzJ17VkehK06yfdKY=
Date: Wed, 2 Oct 2024 12:05:34 +0200
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
Message-ID: <Zv0a7pUQlZP44aB5@duo.ucw.cz>
References: <20241001180658.76396-1-wse@tuxedocomputers.com>
 <20241001180658.76396-2-wse@tuxedocomputers.com>
 <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
 <Zv0YlxQOFVGRS/DB@duo.ucw.cz>
 <c2694d50-db7c-84ee-288a-06802e10ca8d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/5H51XUMUCryMJ4/"
Content-Disposition: inline
In-Reply-To: <c2694d50-db7c-84ee-288a-06802e10ca8d@linux.intel.com>


--/5H51XUMUCryMJ4/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2024-10-02 13:01:05, Ilpo J=E4rvinen wrote:
> On Wed, 2 Oct 2024, Pavel Machek wrote:
>=20
> > Hi!
> >=20
> > > > +static struct wmi_driver tuxedo_nb04_wmi_ab_driver =3D {
> > > > +	.driver =3D {
> > > > +		.name =3D "tuxedo_nb04_wmi_ab",
> > > > +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > > > +	},
> > > > +	.id_table =3D tuxedo_nb04_wmi_ab_device_ids,
> > > > +	.probe =3D probe,
> > > > +	.remove =3D remove,
> > > > +	.no_singleton =3D true,
> > > > +};
> > > > +
> > > > +// We don't know if the WMI API is stable and how unique the GUID =
is for this ODM. To be on the safe
> > > > +// side we therefore only run this driver on tested devices define=
d by this list.
> > >=20
> > > Please limit comment length to 80 chars and since you need multiple l=
ines=20
> > > here anyway, use the usual /* */ multiline comment formatting.
> >=20
> > This driver needs to be split into generic part + hw specific part,
> > and reasonable kernel/user API needs to be defined for the generic
> > part. It is really too soon to tweak comment lengths.
>=20
> Coding style is not something you add on top of everything after=20
> everything else is done. It's much better to start with that right from=
=20
> the beginning.

And yes, this driver leaves something to be desired.

OTOH if you comment on coding style only, it leaves impression of
"everything else is ok with this", which easily leads to wasted work
and frustration.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--/5H51XUMUCryMJ4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZv0a7gAKCRAw5/Bqldv6
8jInAKCTO0pfGpRohULY7qmHpbryLYpGAgCgvtfw76lxVOS/qGSzcnI5XQM7r6c=
=nnrN
-----END PGP SIGNATURE-----

--/5H51XUMUCryMJ4/--

