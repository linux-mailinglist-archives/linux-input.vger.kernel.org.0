Return-Path: <linux-input+bounces-7664-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189D9AD33B
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 19:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 418001C21F8F
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 17:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356561CEAD8;
	Wed, 23 Oct 2024 17:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="CFUVwxDN"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB971BD038;
	Wed, 23 Oct 2024 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705672; cv=none; b=f71wZ08z22Zx/ZXzl40DVhRqkv0xMuNTc1oxCAJzEOK6zubAFCr6L9U4rvDRNVmPgjNFyTizV6Ti2Wqp9/oGB5zdTfMvb9HDnkwmfDdsBjMXyk0zM4qfjrnzQ7NEvgwDLV2hLGgCW3jq6ybf56jmMNIckCU+XuOQ2113Mzojme4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705672; c=relaxed/simple;
	bh=KAUSLOsN0KAxGbYMY0+t7tPfjFlq0tlRgDTIp8mqDVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6LmDnhRGy8l65eB4tIL4yNoiUIF1kNmOls0P8CreZSUyN0IrwLwhTR8CZwAIib2KlP7/QfX/pSGb6WBj6v4xxUnSu4+Uipdl3keskErWb1hA25iFRLzi2IjpOF3JST7qScYW10RTc1tE8psOUhYtZ+FEWqZBUKn9wiJ9rwAIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=CFUVwxDN; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 0DE661C00A3; Wed, 23 Oct 2024 19:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1729705661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kU9n7eT3lhEsHYkrEomNkv21bTRvaegj4/JZP474ohU=;
	b=CFUVwxDNrqIWF0pGYifru9eA8xVj5v/SQhJMhHDLc04y1PIS8ujS+DOASUuR6IuJj9msOw
	M6HaXTedzm0tzRTkHGUtbWCa/FjQRlPvvy/rCbACsBSx4+oX4+BSPoscCA3EUp+zGI8/8r
	ltqqqQz4RjperDIJG/jatGa9I+lBWUo=
Date: Wed, 23 Oct 2024 19:47:40 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
	lee@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Zxk2vD5FHA2w2jTL@duo.ucw.cz>
References: <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
 <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
 <35a98b67-d1eb-4aa9-9d3f-025c94cd6b0f@gmx.de>
 <Zxf5u9jgmt9vpz2u@duo.ucw.cz>
 <c0791e1d-a63f-40fd-bcb8-5f2eec15c59e@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5GlMUOsLquiBPieb"
Content-Disposition: inline
In-Reply-To: <c0791e1d-a63f-40fd-bcb8-5f2eec15c59e@tuxedocomputers.com>


--5GlMUOsLquiBPieb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > > Personally I really like the idea to just emulate a HID LampArray=
 device
> > > > > for this instead or rolling our own API.  I believe there need to=
 be
> > > > > strong arguments to go with some alternative NIH API and I have n=
ot
> > > > > heard such arguments yet.
> > > > If you don't want "some alternative API", we already have perfectly
> > > > working API for 2D arrays of LEDs. I believe I mentioned it before
> > > > :-). Senzrohssre.
> > > We may have to support 3D arrays of LEDs, so using a simple framebuff=
er
> > > would likely cause trouble.
> > Do you have pointer for device that is 3D?
>=20
> The example from the spec is a keyboard with lightbars on the side, the we
> actually sell notebooks with similar led configurations (mostly on the fr=
ont
> and not on the side). Example is the Sirius I implemented which has a not
> yet implemented lightbar on the front.

I also have lightbar on the keyboard. Put it is still close-enough to
2D. As would be bars on side or bar in front.

> > OpenRGB manages to map keyboard into plane... so what I'd propose is
> > this:
> >=20
> > Framebuffer
> > Information for each pixel:
> > 	    present ? (displays with missing pixels are pretty common)
> > 	    list of keys related to this pixel
> > 	    width, height, length (if we know them)
> >=20
> > Pixels map to keys M:N.
>=20
> How would iso-enter be mapped here?

I guess it depends on number of LEDs under the enter. I have one LED
under it, so it would be one pixel.

> How would the q-key be mapped relative the the 1-key? (they are exactly
> halve a key offset)

That would have to be decided. I remember this from openrgb:

https://www.gamingonlinux.com/2022/01/openrgb-gets-greately-expanded-hardwa=
re-support-in-the-07-release/

and that's one option.

> ~,1,2
> tab,missing pixel,q

I'd go with this one. OpenRGB does it on one screenshot, but there are
other screenshots. Advantage is that if someone does TAB with two
LEDs, we'll have place for it.

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--5GlMUOsLquiBPieb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZxk2vAAKCRAw5/Bqldv6
8vmMAJsESJ1FBGkIBcQMWxWbEH5vkbx9OgCfVS7mQ1P/Vg76qa7u8w64nAfCKjg=
=h2uG
-----END PGP SIGNATURE-----

--5GlMUOsLquiBPieb--

