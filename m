Return-Path: <linux-input+bounces-7040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD5598ED78
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 12:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BADB01C215CA
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543971527B1;
	Thu,  3 Oct 2024 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="SJmNfl48"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4AB14F9CC;
	Thu,  3 Oct 2024 10:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727953155; cv=none; b=Mw/OhjJ6S1awgttL4Ya/muYFy9iAfdIe5/GmJcP0aBdLYXE5+oaBdeF7dCODYk14pVW+VqLOkeUeQzF+OpGHobHWCHV9YMN9lnW50T73mQkzIVKApzbML6yHdMRsKolO5wpUiG0r/+v6uhTuSkpH6hca7UMl2DkJmD4LHTKSEXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727953155; c=relaxed/simple;
	bh=esEIiopxvu4RqUMwPjcTZMbZpMPxYKn535kaBtQ2zf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKCz6tWadKq0/Zxz3qzs2ftB+q72l7iiB/IM7bttRvEfARH01vYGh6ihEeQbM6coHOnLqjB7pedwsBGTV4762f0gx/TUZJrOXMpPY2QPCM1QkjIXbB30Ag3yijL9eywlRvCX/VBouSaEf2iOhvQl5vS9rAokKT09ijtaaRp0op4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=SJmNfl48; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 991B61C00B3; Thu,  3 Oct 2024 12:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1727953149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/bfZCOwhegcwnyT2obcKuSktcVz2rBrWrFEUUQ+irw=;
	b=SJmNfl48axJmFdl7O7L/FuqYwZA8cgIdWxnKbeHUuGoEn4rOsqFTH9L5Te9BM+fIXbpYQj
	xvDfDTKFjdZA2HwEZG4BUdwQQwgp6SK0XafkWSAS9oGWUBxnn4AP95k4UlrPpLhx6sYo8X
	BbFhHVcEcIAnpkDYeDWJGBxckZjHyJ8=
Date: Thu, 3 Oct 2024 12:59:09 +0200
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
Message-ID: <Zv54/T+6znqZB3X9@duo.ucw.cz>
References: <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
 <rdo2yyy5dxsxrfm7bweuuvsqjzjelyevo5xvufixuiyrdlf7pc@mprc7pzbpnla>
 <Zv0YI3qIEg88Dx4c@duo.ucw.cz>
 <hdahq2vfi3bnvaqswwdtave2kc2qm3ngvcwn6cgfiirfjfbqnz@zk77mbs3yktp>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y15lgMwvvcgXIkuL"
Content-Disposition: inline
In-Reply-To: <hdahq2vfi3bnvaqswwdtave2kc2qm3ngvcwn6cgfiirfjfbqnz@zk77mbs3yktp>


--Y15lgMwvvcgXIkuL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > (Hint: it is LEDs below regular keyboard.)
>=20
> Yes, I know, and if you read this email and the few others, you'll read
> that I own a few of them already (for a long time), and I worked on a
> cross vendor userspace API to configure them. So I know what I am
> talking about.

Ok.

> > > The positions of the pixels also depend on the physical layout of the
> > > keyboard itself. So with the same vendor ID/Product ID, you might have
> > > different pixel positions if the device is sold in Europe, or in the
> > > US.
> >=20
> > If vendor sells different hardware with same IDs, well 1) that's a
> > nono, a 2) that's what kernel parameters are for.
>=20
> This is already the case (hello hid-uclogic), and no, kernel parameters
> are not helping. In that case (uclogic), we ask the device a specific
> USB string which has the information, but is not part of HID. This is
> dumb, but we don't control hardware makers.

Well, good you find other solution. Kernel parameter would have worked
as a fallback.

> > > But that's just the "easy" part. We can define a kernel API, for sure,
> > > but then we need users. And there are several problems here:
> > >=20
> > > - first, users of this new kernel API need to be root to address the
> > >   LEDs. They probably won't, so they'll rely on a third party daemon =
for
> > >   that, or just use uaccess (yay!). But that part is easy
> >=20
> > Eventually, desktop environment should talk the interface. (Plus, how
> > does HID or BPF craziness help with his?)
>=20
> HID helps because we already have the case with game controllers. Steam
> and SDL (both widely use), put rules giving uaccess to hidraw nodes on
> those controllers. So we finally made the jump and now provide in v6.12
> a new hidraw ioctl to allow logind to revoke the hidraw node. This
> should allow us to not give uaccess to those hidraw nodes.
>=20
> So in the near future, there will be a portal available, that says
> "please give me a fd for this hidraw node", the compositor will then ask
> logind to open the file for it and then will pass that fd to the final
> application. Once there is a vt-switch, logind will revoke the fd,
> meaning that the application will not have access to the device.

Yes, you can work around kernel not providing abstractions. But you
should not have to.

> > > - but then, even if you make everyones happy, the GUI project is
> > >   actually cross-platform (OpenRGB is, Steam is, SDL is). And what is
> > >   done on Windows is simple: raw access to the HID device. And the
> > >   raw
> >=20
> > Yes, Windows is a mess. We don't want to emulate them.
> >=20
> > > I've been through this exact same process with Input and game
> > > controllers, and even for libratbag for configuring gaming devices. In
> > > the end, the kernel developer never wins, but the userspace
> >=20
> > Yes, we have been in this exact situation. Userland was directly
> > accessing mice. It was called "gpm" and we moved away from that for
> > good reasons.
>=20
> There is a slight difference between mouse support and LEDs on your
> keyboard. The former is actually required to bring up the machine and to
> use it, the latter is nice to have.

But that's not the difference that matters. Linux is not microkernel,
and is trying to provide hardware abstractions. (Except for printers,
I guess that's because printers are often network devices).

Besides, mouse was not required to bring up a machine "back then".

Besides,

1) using those keyboards in dark room without backlight is hard,
because their labels are translucent and not having enough contrast.

2) rainbow effects make people ill.

Note how we have drivers for audio, LEDs, cameras, dunno, iio sensors,
none of that is required to bring system up.

We need driver for the WMI stuff in kernel. And that point it should
be pretty clear proper driver/subsystem should be done.

> > > If you want a 100 lines of code program to control your keyboard, with
> > > LampArray, you can, as long as you don't require a GUI and don't requ=
ire
> > > to be generic. Just write the values directly on the hidraw device,
> > > and
> >=20
> > Haha, no. Kernel part was 400+ lines, no way you can parse that in 100
> > lines.
>=20
> I'm not saying "parsing", I mean adapt to your use case. If you know
> your device, your simple CLI is just writing a static array of bytes to
> the hidraw interface.

No. Hardware abstraction is kernel work, my application should work
everywhere.

> > What is relevant that these crazy arrays are not going to be merged,
> > and better solution is needed.
>=20
> Again, you seemn to miss the point: those crazy arrays should have been
> in the firmware from day one. They are not, so the idea is to convert
> proprietary protocol into a standard. Then we can start thinking what
> comes next.

Firmware is what it is and we have to deal with that.

(Not to mention that "standard" you are citing is not used by anyone
and is ugly as hell. So not even open hardware such as MNT Reform uses
it).

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Y15lgMwvvcgXIkuL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZv54/QAKCRAw5/Bqldv6
8mvEAJ90t/bBcNJepAXfDDkvWzvQzOEtjQCcCiHlH8ZSzrsmnDBnAYtTbKygirk=
=m8pr
-----END PGP SIGNATURE-----

--Y15lgMwvvcgXIkuL--

