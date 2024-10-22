Return-Path: <linux-input+bounces-7615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA499A9F0C
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 11:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C861E2841C1
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 09:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205991993B2;
	Tue, 22 Oct 2024 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="nH1wjtTA"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209618E02D;
	Tue, 22 Oct 2024 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590440; cv=none; b=Jde0+LXy9Sgh1RwoQ9e7yBy6Oh6mKeepf+xGLhggT58sZYNc+9eRZdNxLr8gQ3SFVVDlk2elV0ztUoB8gQamS1i++a3aANmr1++Zc29OeioIVxKgYe6m+qUGEt/cTjmDtVIaetDMb8BOyL7BcyN0cty7Xt1VykY241wCPCjNgQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590440; c=relaxed/simple;
	bh=y3d+vpZ5OIL31Ye8Fi+k/NP/hj+C+n9jcuCpILHGGag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ss5i+1a7ku+foSuPpAadLgP4c4dbv0KwFWbs1xFIsnsXjwC84VK8ccBrqdTmxmozT2sKjduRqlhjBbzcWYXYfKM3OMEB30BmvF7XQ8+EVI4+wyArO3tr4lj4sQaVZlaBK92ah/3o64Mn6+0jeI3DKqNq/exh6gdac4mezN+8r6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=nH1wjtTA; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 77B1F1C006B; Tue, 22 Oct 2024 11:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1729590434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSDlBFL2PfLrCn7v33SNOWjYPKjIXUgPATj3s3TfkA4=;
	b=nH1wjtTAj8yQYgCeyr1tt1HHFMgJGRTOPK0nYBPoQDvGWRsmWzZ+LatoIuhPpo7mXgbwMQ
	gWnEHoCWc9Bcj289IQUTt0vyHVQnOPGpn+WzPEP7UHJ5NUru96PIJHKMt9UwjpxPMgEeAB
	PB0MZmQIqC/FibFK/knAgmvJy76HwoU=
Date: Tue, 22 Oct 2024 11:47:14 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Werner Sembach <wse@tuxedocomputers.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
	lee@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
References: <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
 <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VyjLwRGdYiDTANtH"
Content-Disposition: inline
In-Reply-To: <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>


--VyjLwRGdYiDTANtH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Sorry for taking a bit long to respond.
> >=20
> > This "illumination" subsystem would (from my perspective) act like some=
 sort of LED subsystem
> > for devices with a high count of LEDs, like some RGB keyboards.
> >=20
> > This would allow us too:
> > - provide an abstract interface for userspace applications like OpenRGB
> > - provide an generic LED subsystem emulation on top of the illumination=
 device (optional)
> > - support future RGB controllers in a generic way
> >=20
> > Advanced features like RGB effects, etc can be added later should the n=
eed arise.
> >=20
> > I would suggest that we model it after the HID LampArray interface:
> >=20
> > - interface for querying:
> > =A0- number of LEDs
> > =A0- supported colors, etc of those LEDs
> > =A0- position of those LEDs if available
> > =A0- kind (keyboard, ...)
> > =A0- latency, etc
> > - interface for setting multiple LEDs at once
> > - interface for setting a range of LEDs at once

How are LEDs ordered? I don't believe range makes much sense.

> > I do not know if mixing sysfs (for controller attributes like number of=
 LEDs, etc) and IOCTL
> > (for setting/getting LED colors) is a good idea, any thoughts?
>=20
> I wonder what the advantage of this approach is over simply using HID Lam=
pArray
> (emulation), openRGB is already going to support HID LampArray and since =
Microsoft
> is pushing this we will likely see it getting used more and more.

There's nothing simple about "HID LampArray". Specification is long
ang ugly... and we don't want to be stuck with with OpenRGB (links to QT!).

> Using HID LampArray also has the advantage that work has landed and is la=
nding
> to allow safely handing over raw HID access to userspace programs or even
> individual graphical apps with the option to revoke that access when it is
> no longer desired for the app to have access.

HID raw is not suitable kernel interface.=20

> Personally I really like the idea to just emulate a HID LampArray device
> for this instead or rolling our own API.  I believe there need to be
> strong arguments to go with some alternative NIH API and I have not
> heard such arguments yet.

If you don't want "some alternative API", we already have perfectly
working API for 2D arrays of LEDs. I believe I mentioned it before
:-). Senzrohssre.

								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--VyjLwRGdYiDTANtH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZxd0ogAKCRAw5/Bqldv6
8m6sAJ0YT3KbWDAvOAdjM55GB5oXYxhp9ACdEtOhCVRhzSDt8MHjQdKfqxkRBy8=
=9vbl
-----END PGP SIGNATURE-----

--VyjLwRGdYiDTANtH--

