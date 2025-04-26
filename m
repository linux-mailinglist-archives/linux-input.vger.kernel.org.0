Return-Path: <linux-input+bounces-12017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C060A9DCC5
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 20:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D30B87B4275
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 18:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DC91EDA23;
	Sat, 26 Apr 2025 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="BICfrT6b"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4872D18991E;
	Sat, 26 Apr 2025 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745692896; cv=none; b=Tusz3uFidvuv9CytbBClFwoyzGvLIVUMxVrqzqHildtaYSjHzVdey3au2k+GakQRB1UYMW7ghu4o5o5QWW9J1jBbfqWV0LO3MAiNilS9h9nTjXG4Ju9X+D9vHxN7BjcHSKWAnRwdj534C8m1PKQd68B6z+LgyOFZ/vL52CrAwFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745692896; c=relaxed/simple;
	bh=cWWR0wPjTvKc8YdwgJuVjbWX6EEWZoqzcJztRbMXrv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poLHdGrdwTpm4aoNmw8LlEfO1i6/pbLk+23wm803EgV6x2VcLEWxrx8t/yWd92U958bX0s3LUBE6aonm2PIUIvpkIUlHCIaxsVTgajBwDewZRSRKyhmEJ9Hx7Ljz2TDcl/bwzur3ArOXDpyrI9dxfTS1ws5sw+pz9YK219rsUWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=BICfrT6b; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id B2A1C1C00B2; Sat, 26 Apr 2025 20:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745692889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+N3ikL+7LB9ZULui0uMCjjk+tz0nXeU8sd/76ilCcg=;
	b=BICfrT6bPQuvZEW/YMVE8V8V2L0vWZSdNwPe6QD9qKUQqzk+T5sWsxKlvv7Ub/w7YEJiR8
	C7KpnT3UaQ9jt8CpowQ6NgHdRU3a6Zt4ZfMB+C0sVVUlvlP4Svc9mm+7r5T9cSNCmmHwnk
	zZGg7mrJJ1psj4V3NS+QTGZfxjQZCRQ=
Date: Sat, 26 Apr 2025 20:41:29 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Mario Limonciello <superm1@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
Message-ID: <aA0o2SWGtd/iMYM2@duo.ucw.cz>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2piM8uojtVCsJ8y+"
Content-Disposition: inline
In-Reply-To: <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>


--2piM8uojtVCsJ8y+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
> > > to be. Modern versions of Windows [1], GNOME and KDE support "META" +=
 "L"
> > > to lock the screen. Modern hardware [2] also sends this sequence of
> > > events for keys with a silkscreen for screen lock.
> > >=20
> > > Introduced a new Kconfig option that will change KEY_SCREENLOCK when
> > > emitted by driver to META + L.
> >=20
> > Fix gnome and kde, do not break kernel...
>=20
> I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
>=20
> That's going to break modern hardware lockscreen keys.  They've all
> obviously moved to META+L because that's what hardware today uses.

Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
screen locking, no?

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--2piM8uojtVCsJ8y+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaA0o2QAKCRAw5/Bqldv6
8rGtAJwNrCGnvNF3FHcCSgpuIF8lM+a1CwCfev0NWDap259Nrt29hHFaErNz0nQ=
=c8R+
-----END PGP SIGNATURE-----

--2piM8uojtVCsJ8y+--

