Return-Path: <linux-input+bounces-7001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6623D98D088
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C87EEB22144
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 09:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AFD1E4113;
	Wed,  2 Oct 2024 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="KNX+jNh/"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB011A2561;
	Wed,  2 Oct 2024 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862826; cv=none; b=nXUKvUvKHOvNb3ibzyX+FDICSmb437wvsiFgvUh2BnvcDyTyq8ON5gvnloy3J0Gg+sqtSbpGzmjgbq3R5+W4pDOnf3zIt+1g25ZZgIMX/aTsVV7tsVrGdFHyR45Tjycrmacn5Q8iTMRIQbrwtbqRDUCN+6aiYv1B9qCzaVT0Opk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862826; c=relaxed/simple;
	bh=Pt/qWQnorb5ESMgNWHW2AqF0GiZq5dgk4y8rnPeAm7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmY7GlfGi3RXTJ/UF6btpZClZwbDzLeB5ihHmckiAQQHYHbdkqED1j2Q/tdHh4pIJhzZub6pJtBnxHyURU24QojjBmfK7oRPr/dPPKymezqhAGZzEiEEP5oZIa0HZfx64RjZkM2TWsSkqFGxYCl2FobO5tq582VwCGxYSaUI0yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=KNX+jNh/; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 35DF81C00AB; Wed,  2 Oct 2024 11:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1727862820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mjd+WDxM10aWlQvgr4bJ6M4L4L5FdQvo6Uw9F3yLZGg=;
	b=KNX+jNh/jyHeKZjvkrgU1/xyaHZ0s8yeI8qkxZUEWqly4KWW30zikeYF/frZy/TYUG67Tt
	R/d+s/5OsKownRyLD10TH57KwuNyXqsK4JVLjL0ta0pvF8sAjoxs+3KiXE4hVpBp8YLAkO
	6xHR3l2KBi7+cbLUKfCvh2eYTvWDmAE=
Date: Wed, 2 Oct 2024 11:53:39 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
	lee@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Zv0YI3qIEg88Dx4c@duo.ucw.cz>
References: <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
 <rdo2yyy5dxsxrfm7bweuuvsqjzjelyevo5xvufixuiyrdlf7pc@mprc7pzbpnla>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2r5plyNg3om/d59G"
Content-Disposition: inline
In-Reply-To: <rdo2yyy5dxsxrfm7bweuuvsqjzjelyevo5xvufixuiyrdlf7pc@mprc7pzbpnla>


--2r5plyNg3om/d59G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2024-10-02 10:13:10, Benjamin Tissoires wrote:
> On Oct 01 2024, Pavel Machek wrote:
> > Hi!
> >=20
> > > PPS: sorry for pushing that hard on HID-BPF, but I can see that it fi=
ts
> > > all of the requirements here:
> > > - need to be dynamic
> > > - still unsure of the userspace implementation, meaning that userspace
> > >   might do something wrong, which might require kernel changes
> > > - possibility to extend later the kernel API
> > > - lots of fun :)
> >=20
> > Please don't do this.
> >=20
> > We have real drivers for framebuffers. We don't make them emulate
> > USB-display devices.
>=20
> Except that they are not framebuffer for multiple reasons. I know you
> disagree, but the DRM maintainers gave a strong NACK already for a

Person not linking the DRM stuff was not a maintainer.

> DRM-like interface, and the auxdisplay would need some sort of tweaking
> that is going too far IMO (I'll explain below why I believe this).



> > Yes, this is a small display, and somewhat unusual with weird pixel
> > positions, but it is common enough that we should have real driver for
> > that, with real API.
>=20
> It's not just weird pixel positions. It's also weird shapes. How are you
> going to fit the space bar in a grid, unless you start saying that it
> spans accross several pixels. But then users will want to address
> individual "grouped" pixels, and you'll end up with a weird API. The
> Enter key on non US layouts is also a problem: is it 1 or 2 pixels wide?
> Is is 2 pixel in heights?

Have you seen one of those keyboards?

(Hint: it is LEDs below regular keyboard.)

> The positions of the pixels also depend on the physical layout of the
> keyboard itself. So with the same vendor ID/Product ID, you might have
> different pixel positions if the device is sold in Europe, or in the
> US.

If vendor sells different hardware with same IDs, well 1) that's a
nono, a 2) that's what kernel parameters are for.

> It's also luminance problem IIRC. Some keys might have a different range
> of luminance than others. I remember Bastien Nocera telling me we

Have you seen one of those keyboards?

> But that's just the "easy" part. We can define a kernel API, for sure,
> but then we need users. And there are several problems here:
>=20
> - first, users of this new kernel API need to be root to address the
>   LEDs. They probably won't, so they'll rely on a third party daemon for
>   that, or just use uaccess (yay!). But that part is easy

Eventually, desktop environment should talk the interface. (Plus, how
does HID or BPF craziness help with his?)

> - then, user sees a new kernel interface, and they have to implement it.
>   OK, fair enough, but more code to maintain

Yep. At least there's single interface to talk to.

> - but that new kernel API doesn't give enough information: all you have
>   is an approximation of the keyboard layout, which will not match
>   the

Have you seen OpenRGB? It already aproximates keyboard as a grid. Or
maybe we give them enough information.

Below you were just inventing problems.

> - but then, even if you make everyones happy, the GUI project is
>   actually cross-platform (OpenRGB is, Steam is, SDL is). And what is
>   done on Windows is simple: raw access to the HID device. And the
>   raw

Yes, Windows is a mess. We don't want to emulate them.

> I've been through this exact same process with Input and game
> controllers, and even for libratbag for configuring gaming devices. In
> the end, the kernel developer never wins, but the userspace

Yes, we have been in this exact situation. Userland was directly
accessing mice. It was called "gpm" and we moved away from that for
good reasons.

> If you want a 100 lines of code program to control your keyboard, with
> LampArray, you can, as long as you don't require a GUI and don't require
> to be generic. Just write the values directly on the hidraw device,
> and

Haha, no. Kernel part was 400+ lines, no way you can parse that in 100
lines.

> You might agree with me or not, but this is actually not relevant to the
> discussion here IMO: all what Werner is doing (with crazy arrays) is to
> take a proprietary protocol and convert into a HID standard. He is

Yes, we should never have had input subsystem. We should simply
convert all mice to PS/2 standard protocol. ... And yes, we have that,
that's /dev/mice, yet input layer is very useful.

What is relevant that these crazy arrays are not going to be merged,
and better solution is needed.

> I'm also under the impression that you are scared by BPF. BPF is just a
> tool here to "fix" the device with an easy path forward. BPF is
> safer

I should not need to run just-in-time compiler to get support for my
hardware. If you are not scared by BPF, take a look at modern CPU
design, with emphasis on speculation vulnerabilities such as Spectre
and Meltdown.


Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--2r5plyNg3om/d59G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZv0YIwAKCRAw5/Bqldv6
8smjAJ4lNCv72qKhGTERVtIausG0hdMhyACfWtXFkhfp36pMktpqOWe2qNu+tGw=
=aY9g
-----END PGP SIGNATURE-----

--2r5plyNg3om/d59G--

