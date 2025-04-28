Return-Path: <linux-input+bounces-12024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBFFA9E7DA
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 07:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07E3618993F5
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 05:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA8119005E;
	Mon, 28 Apr 2025 05:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="ihutAaWU"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A1246B5;
	Mon, 28 Apr 2025 05:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745819567; cv=none; b=nFNIqrKCTH3IXC+7/nnwWs2GTygd8B+egblniKW6OzKjwX1rWZ9Bt12aDsj7eK5DH9WJFY7CyMOsZ1mxmY6hcRQP/SUasY1wKe5lNf5kcJBVlECD838/c19B+bsfavIh2gZpkHsplie2P+myJWoV2n4eP62zC7rH/+dIKPYRagI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745819567; c=relaxed/simple;
	bh=2rKfapVopBvDsA6n9yqJpzZ3qFpozfaL/k+gbAtmTKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wmnyx8nr4MBEyK6CGzpdXXZ1wkgtZEB9VCevoW/3RBASqjdtHBTXnngAzb0XoPaeA3AHjjhpKvZybKHO/gvPiPxGFClqvEJRhRdaLfggepI2Ypv+/C8ToMfynruorB0rpOyFksNRi46oFFymtcgebmJKZvdqozxfkgbv6fvZXMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=ihutAaWU; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id D223F1C00B2; Mon, 28 Apr 2025 07:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745819554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cWDY8YYG+M+2O3mP8COR4ygx7vfnxi0R/X6piVu3jXI=;
	b=ihutAaWUvYU1uv9S9L2jxDO3Ig51ZL6z1zwFAPKzwAtM5GHFCxBFfMIwH3ug6uo/y/wNw8
	L5ehLcgUGC3IkjcHyRADrTUmm23W/vC8ICqbmiQoSYzE+96rPyhd6B8YHoPTuAqFEQ0zCY
	cb1EEQmXf4qgEXM/RQUhWVFVxmcJUHY=
Date: Mon, 28 Apr 2025 07:52:34 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mario Limonciello <superm1@kernel.org>,
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
Message-ID: <aA8Xon5Yk1UtCNgD@duo.ucw.cz>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
 <aA0o2SWGtd/iMYM2@duo.ucw.cz>
 <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>
 <aA3KXNCKKH17mb+a@duo.ucw.cz>
 <63fbf7e7-8d61-4942-b401-51366705252b@kernel.org>
 <7tnn7sa654c3irqxprnqgbxawl6pnvuuonps3t5qkhso3h6fp6@fc3ph7fkukgm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qwFHA+QX4iiSvJJC"
Content-Disposition: inline
In-Reply-To: <7tnn7sa654c3irqxprnqgbxawl6pnvuuonps3t5qkhso3h6fp6@fc3ph7fkukgm>


--qwFHA+QX4iiSvJJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Sounds that should be fixed :-).
> >=20
> > GNOME is commonly known to try to have a very simplistic UX instead of
> > exposing more knobs and buttons.
> >=20
> > Adding support for multiple key combinations in a UX means convincing t=
he
> > GNOME design team to support this, followed by actual changes.
>=20
> So there is a simple and wrong way of fixing this (introducing a
> hardcoded combination for  shortcut du jour in the kernel) and
> complicated one of making one of poplar DEs behave better and be more
> flexible. We will not be adding the wrong one to the kernel.

Note that there's a way to fix that in GNOME without changing UI that
is still way nicer than kernel hacks:

KEY_SCREENLOCK always locks.

Whatever combination user selects in config dialog (META-L by default)
locks, too.

Best regards,
									Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--qwFHA+QX4iiSvJJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaA8XogAKCRAw5/Bqldv6
8junAKCV3eZECMoN+qDR61up1fg+XEMUjwCfcrY8Y2XOocZe/cyHER85WmXI8fw=
=YZ2i
-----END PGP SIGNATURE-----

--qwFHA+QX4iiSvJJC--

