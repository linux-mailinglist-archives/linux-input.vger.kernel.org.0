Return-Path: <linux-input+bounces-12020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F029A9DF40
	for <lists+linux-input@lfdr.de>; Sun, 27 Apr 2025 08:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E08C17E271
	for <lists+linux-input@lfdr.de>; Sun, 27 Apr 2025 06:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C09122A80A;
	Sun, 27 Apr 2025 06:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="HcQk6BVv"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAE71C6FFA;
	Sun, 27 Apr 2025 06:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734242; cv=none; b=C4Kv3Fq+pWpbdqGYB0af5u/YBMO58RZlt9B60KkGOEbRway6t03NCalQhi9FUDEdvF3wPIUd3xjo0T3YXL5PCYXLhP/j2iHcddI0KxCYAAP0Fz6bbNb/BnSJH/OrlBEpZBNvPHSRh3cdxbcvcf/8Hbt9j6EsBjnUGfOH12IFmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734242; c=relaxed/simple;
	bh=vdsODpVoF4YdSqvnPZlYoCUv0rxMIVC7vPQyys2/Gmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Chn1WdskbjxBd0dlgIMyP+P9jHpMpaCqfbChmTAbpIe4L2Y7n8X1u80+PR7K3SuMrKsu89NSAZt/OjTwtiguUgYve0jQwoY4W/HKXfFOEwbfO7TSPxvILxVNS9V8/msnoBrZu4K3ZXRC6lvv7p0Jj5uzeoI25xlT1/eY26SyHQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=HcQk6BVv; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id D82CA1C00B2; Sun, 27 Apr 2025 08:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745734236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+UKRv0LlLVrHcnwlixHJZ6sKOpPhYxJTAue1dbgF+c=;
	b=HcQk6BVvvKqzpWi+/J0tKVsnymtnurbxjHdp+0v7xf8Ysju3AvAjVHS+rS/4q29KerAFZX
	sKPAr15OHMnn2vVa3nYJG8RKZE0d7EAVLx7XWOrX3WrXz3yNWP2kE/36Y4HZGmyNqBKZdh
	SL0393wmjzPULR4dC/7/Ozc37yUqjEA=
Date: Sun, 27 Apr 2025 08:10:36 +0200
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
Message-ID: <aA3KXNCKKH17mb+a@duo.ucw.cz>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
 <aA0o2SWGtd/iMYM2@duo.ucw.cz>
 <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DmgUZx/QP4T2HwRh"
Content-Disposition: inline
In-Reply-To: <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>


--DmgUZx/QP4T2HwRh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > > In the PC industry KEY_SCREENLOCK isn't used as frequently as it =
used
> > > > > to be. Modern versions of Windows [1], GNOME and KDE support "MET=
A" + "L"
> > > > > to lock the screen. Modern hardware [2] also sends this sequence =
of
> > > > > events for keys with a silkscreen for screen lock.
> > > > >=20
> > > > > Introduced a new Kconfig option that will change KEY_SCREENLOCK w=
hen
> > > > > emitted by driver to META + L.
> > > >=20
> > > > Fix gnome and kde, do not break kernel...
> > >=20
> > > I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
> > >=20
> > > That's going to break modern hardware lockscreen keys.  They've all
> > > obviously moved to META+L because that's what hardware today uses.
> >=20
> > Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
> > screen locking, no?
>=20
> This was actually the first path I looked down before I even started the
> kernel patch direction for this problem.
>=20
> GNOME doesn't support assigning more than one shortcut key for an action.

So if I want to start calculator on meta+c on internal keyboard, and
have calculator button on USB keyboard, I'm out of luck?

Sounds that should be fixed :-).

Alternatively, you can just turn KEY_SCREENLOCK into META+L inside
Gnome.

BR,
									Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--DmgUZx/QP4T2HwRh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaA3KXAAKCRAw5/Bqldv6
8s2IAJ9jY4h4zq6eODq20aJxzo1bXLE6/wCgmfoW2tJuEV1zMrev3d+6r4JZpX0=
=6yuk
-----END PGP SIGNATURE-----

--DmgUZx/QP4T2HwRh--

