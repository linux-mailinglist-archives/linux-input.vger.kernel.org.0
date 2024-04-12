Return-Path: <linux-input+bounces-2964-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7138A3694
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 21:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 361A9B234C1
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 19:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149B11509B9;
	Fri, 12 Apr 2024 19:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="NpuqSg0I"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C01509B7
	for <linux-input@vger.kernel.org>; Fri, 12 Apr 2024 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712951635; cv=none; b=nfifvn3YWz6VO9HAHlMMotFbtJcKOvClmUa/CyGQmpmg81g+MNotoOty9jRh7LGuhqTuYaDsr7I0pb6W9b0wPcO4SXbQaHCawFX5NyoFK1R/7cxFENWMyMPzCymh4KkVoa4uU5Iw5Kd5Qjl55HBn5319tUJ7HWi+I6ppl36waPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712951635; c=relaxed/simple;
	bh=0k+zQ2oHaJSsmVBvDBl9DPKcs99N8G9Zwv8t2JUGSvQ=;
	h=Message-ID:Subject:From:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cfLYUQbzUaXbvV06eI3tjtbX9X4Wd348k14KFOxso8AiKTWjgeonv6Qxj6uPWAlPdeTxMcp/+Bjf7je2tX8Nuo0GxPDKkToMC9V9ZsFFE+DXDFcqblWyZ2G88Rs4SgjgV7qBBcid2M8kSB2jeki8tD+TttLiP1llp3PwagHx3ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=NpuqSg0I; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VGS1Q5N3Dz9vwZ;
	Fri, 12 Apr 2024 19:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712951626; bh=0k+zQ2oHaJSsmVBvDBl9DPKcs99N8G9Zwv8t2JUGSvQ=;
	h=Subject:From:To:In-Reply-To:References:Date:From;
	b=NpuqSg0IfLNeZCJWnWHMYD9unYc0Kl8SJGCW2e9FhEIEyrqoeCYl12KpUR9kt98OC
	 TM4GWDKqY8Ukf5saURrLTxophs2Od90F/MFBAwUDODYEy4y2IvcCY9sirAj02/gWPB
	 a3HMKxxlsrFOw4438Ut2dTDFqdDtrIuevtAY0VYo=
X-Riseup-User-ID: 941E939B8A8E8A2474A041EC1CC7E07A6CB42DC651DE16A2F1E99C6D2329AF8F
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VGS1B6ZlhzJrv1;
	Fri, 12 Apr 2024 19:53:34 +0000 (UTC)
Message-ID: <fade9f2881f9b69c0bb3f3b63463c8e9b7656871.camel@riseup.net>
Subject: Re: hid-logitech-dj support for Anywhere 3SB
From: Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
To: Allan Sandfeld Jensen <kde@carewolf.com>, linux-input@vger.kernel.org
In-Reply-To: <4887001.GXAFRqVoOG@twilight>
References: <4887001.GXAFRqVoOG@twilight>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-REB6eg34rueHUCJP3OWU"
Date: Fri, 12 Apr 2024 20:53:31 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-REB6eg34rueHUCJP3OWU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-04-12 at 11:10 +0200, Allan Sandfeld Jensen wrote:
> Hello,
>=20
> I am writing because you are listed as author of the hid-logitech-dj driv=
er. I
> recently bought a Logitech Anywhere 3SB mouse, and found Linux didn't=20
> recognize it. Thinking it was a simple case of new IDs not recognized, I=
=20
> quickly added them to the logitch HID++ drivers (patch attached), both fo=
r USB
> with the new receiver and for the Bluetooth direct connection.
>=20
> I have noticed however that the patch while causing them to be recognized=
 and=20
> interacted with as HID++ devices, it has a flaw. The scroll wheel events =
are=20
> reported by the linux kernel as being in hires mode, while haven't actual=
ly=20
> enabled it on the mouse. You can fix that using Solaar, but some piece is=
=20
> missing to enable it correctly in the driver.=C2=A0 Since this is no long=
er a=20
> trivial fix. I wanted to reach out. Do you have any suggestions?
>=20
> Best regards
> Allan

Hi Allan,

Thank you for reaching out.

What likely is happening here is Solaar overwriting the configuration that =
the
kernel driver sets, as that would happen after the driver talks to the devi=
ce.

The settings in question need support in both the kernel and the userspace =
input
stack (libinput) for them to work appropriately, it's not like configuring =
RGB
or other sort setting on the device that works standalone.
I have, multiple times now, asked for Solaar to not expose these low level
settings that need support from other parts of the input stack, leaving the=
m to
the kernel to configure.

I have been inactive in the Solaar project for quite some time now, so I do=
n't
feel like yet again make a big deal out of this there, so that this decisio=
n is
reconsidered. I have already spent a significant amount of effort there, an=
d
nowadays I barely have energy to go through my day and deal with my all my
responsibilities and other OSS project involvements, so I sadly have no mor=
e
energy to spare there.

My recommendation is: disable Solaar from running at startup, restart the
system, and see if that solves your problem. If it does, report this issue =
again
to the Solaar upstream, then depending on that outcome, make a decision on =
how
to proceed. It may be that setting the high-resolution settings in Solaar, =
which
are expected by the driver, works, but it might not be super reliable, beca=
use
since Solaar is overwriting the settings configured by the kernel driver, i=
f
anything in the kernel driver changes, then the setting you have configured=
 in
Solaar might no longer be correct.
There are alternatives to Solaar that do not have this issue, like libratba=
g,
but these generally are feature lacking on the productivity line of Logitec=
h
projects.

Sorry I wasn't able to help much, but I hope that this clarifies things a b=
it,
and helps you solve your problem.

Cheers,
Filipe La=C3=ADns

--=-REB6eg34rueHUCJP3OWU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEzZzJfXA4H9kwnLT5KhDNV3fI85UFAmYZkToACgkQKhDNV3fI
85XGVw/+MAYnSyF6jZw3A6P+shY2iLb6HfvkupscHVp0dnej61rCyCqvQZxoy7xt
XVsvRjcYhG/PMuTmM41aSxJAEwEiKLTh6kvs5ICU/1gQ3p/96AouIofuZNyo0v0d
PTIcnf241vEtUzBiwuveleGAKawpV7wfz9kqSomS2R91bJl5E3RcfqH8dth+hajF
GWnXkGYw5F7YX/upTQATFlVottutLxXJuPeVocEVSoNE4GGpFht/5WCTTg/ONKR/
fwPWysQA+qDgYJqrXOlfxgh2VkI1tZhS+MVVl47WlmwSzvuZUl5zlGk54b9sS47z
DXCiTtY4A4ep5bKGvJDCCHlAVu8pqdXURoNM/5I5nbuVjRxYwuKIGJS+8yz3MJTO
PutrOu9tzxOOLWGBXtiFwJ9mBzNe1Nt5nL+vO3X9SUF/cJLoXBG6RNuqTEaWIRhE
TgyxN5cJ0Gp8xOMhlTFI6GH5HxnivYvnvLff1Krw+sWE1PMnJn1udx1KJ1RxRlDg
lqygIhPYHJ2JB76yWmTVF0podaKX+5LubkWAvnEVbJVrxSQPpT6ZidQXkNxfbmeP
Ifu5TKeaIaYzW2ALEUWtBwzAtaf9VHwrT4wzglfu9YBLA6Kk4QdURBOZTNjPBcAe
UBTYlL1FQI8LnjQjQASMQgSym88aNb60qQGJkOsX0yruDNyK1Hc=
=oK/F
-----END PGP SIGNATURE-----

--=-REB6eg34rueHUCJP3OWU--

