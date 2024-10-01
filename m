Return-Path: <linux-input+bounces-6987-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B237098C742
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 23:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E34F31C23E8C
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 21:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD841CF5CB;
	Tue,  1 Oct 2024 21:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="miQqc6uF"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2407E14F9F1;
	Tue,  1 Oct 2024 21:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727816617; cv=none; b=nePCKiXLF+MXx7yp9T5+7zAiMrrp+daMcqB5wM0t8AUEMSN2SZ0b4U2XJxqkZLDVUmqHNdKik1j4kQKRT/x4RTdtoey3jUcaI6v3RHVK8Ku7hQ5xkpLYmsUC+v8t9U72hy4/rywd4Smgk1XmNMukpFnq8fNOqzZGU8KuQf2JqGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727816617; c=relaxed/simple;
	bh=+CP/9q57+oary05EZYJHkS6VTDlkOVlJdLWDeR+9SqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPIBWTO18Vk8MtKE8hqx/WKKLpmWV/x7eiK4naPphb1ovb6EvDrb5MImBHwSXXgBBPBE5xpTz4FuB/2CM+bJa2OO/SZr2nfTWpwQCh4GZMFw0KK3jlLpSAdLZh8pQO8AlnPMKaDpMCYuiw1osc5UEJudf8BuKizCnOKQaG/Z3CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=miQqc6uF; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 530131C00B7; Tue,  1 Oct 2024 23:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1727816612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMJQ7Xdd/Czu1VGn1Tsno8aYplKs4QKTEfkVhGledB0=;
	b=miQqc6uFrbM49d5QxOIBu7eWTCvjXBRP5z40sKIJdMetB8K1bNq2wbhP48Y5Wo+O6rafkL
	m9OopvDTWSRqRUsKvdxhRPai0SkHGkDczjxd3QSmd+DD1fcUZG+tM6E2fHmRzJG46ukIYh
	/1N1tr69UEhTyENhmA1Qy1Cg6fYFAYE=
Date: Tue, 1 Oct 2024 23:03:31 +0200
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
Message-ID: <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
References: <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i2yKCeYKo7PAl3qJ"
Content-Disposition: inline
In-Reply-To: <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>


--i2yKCeYKo7PAl3qJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> all of the requirements here:
> - need to be dynamic
> - still unsure of the userspace implementation, meaning that userspace
>   might do something wrong, which might require kernel changes
> - possibility to extend later the kernel API
> - lots of fun :)

Please don't do this.

We have real drivers for framebuffers. We don't make them emulate
USB-display devices.

Yes, this is a small display, and somewhat unusual with weird pixel
positions, but it is common enough that we should have real driver for
that, with real API.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--i2yKCeYKo7PAl3qJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZvxjowAKCRAw5/Bqldv6
8h00AKCYdnZ7Jiu+V5omssu0osT4YWICWgCdGkyowiNz5O6AcmXFnusH8PKcqVY=
=8+yZ
-----END PGP SIGNATURE-----

--i2yKCeYKo7PAl3qJ--

