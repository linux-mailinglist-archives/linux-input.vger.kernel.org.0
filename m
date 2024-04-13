Return-Path: <linux-input+bounces-2973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A27698A3BA6
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 10:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 070F5B21643
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 08:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650BF366;
	Sat, 13 Apr 2024 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="dY7u7enB"
X-Original-To: linux-input@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD19802
	for <linux-input@vger.kernel.org>; Sat, 13 Apr 2024 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712997220; cv=none; b=CtZMimsxmgyelJC3iqdySclb7KGPSJFcAEAiwmsLJ42vMldOL/kN81sD2b+blg8bRRmnCAL+R7fU0U2IF9MyKZzmdpfYSD4IunMq2BGfh471iSdZN36AiDjrE94xS/iHSFyxloLEClJVXURDFjcYXjuHmOaWGhdQyOHVAZKb82Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712997220; c=relaxed/simple;
	bh=4rNbwn+qRwc67i+4LKjscuZ0pD5zI2b4x0xBm0X8yfU=;
	h=Message-ID:Subject:From:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qP5ywRecXK6wcwS/Qq/vOdp6KrNkzBpuLtY4Ku4q9YGtS234oozYcHMtt+YTDjQvncOaVqKa149oupLnGW3Y7ShszQYmAyLSoG5aJGADG7cJQLMbM7qvpqerE6xbKBN9hVaunppBPPd8AGIrtag58dd/ep1OWtO5QXYY74Y2VTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=dY7u7enB; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VGmt44gWKzDq8y;
	Sat, 13 Apr 2024 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712997212; bh=4rNbwn+qRwc67i+4LKjscuZ0pD5zI2b4x0xBm0X8yfU=;
	h=Subject:From:To:In-Reply-To:References:Date:From;
	b=dY7u7enB/d95z8fb9FMLagA0mvImwPIA9LXOtXbvYC44L1hqKJCzywpf57i5l/drq
	 dXjuE0TzzjUibAkYzGkg5yiTSchem62YTUvRZm82piZcvAOpk6chfXKMRj7sssiH+i
	 8J7CbdCnCyHG2hkqD0TGAWZ5mLfd2hvrLdGPQhIQ=
X-Riseup-User-ID: 625A9C05CA6C934C990A82C3B93F9FA0C969E997F17619CE438341EC021ABECC
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VGmt36T7nzJrmC;
	Sat, 13 Apr 2024 08:33:31 +0000 (UTC)
Message-ID: <7f829b15729acba79d24299da0c12cbfead175c5.camel@riseup.net>
Subject: Re: hid-logitech-dj support for Anywhere 3SB
From: Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
To: Allan Sandfeld Jensen <kde@carewolf.com>, linux-input@vger.kernel.org
In-Reply-To: <6038382.lOV4Wx5bFT@twilight>
References: <4887001.GXAFRqVoOG@twilight>
	 <fade9f2881f9b69c0bb3f3b63463c8e9b7656871.camel@riseup.net>
	 <6038382.lOV4Wx5bFT@twilight>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-iCVCNZ4AcrDgFM8hydtx"
Date: Sat, 13 Apr 2024 09:33:29 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-iCVCNZ4AcrDgFM8hydtx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2024-04-13 at 10:20 +0200, Allan Sandfeld Jensen wrote:
> On Friday 12 April 2024 21:53:31 CEST Filipe La=C3=ADns wrote:
> > On Fri, 2024-04-12 at 11:10 +0200, Allan Sandfeld Jensen wrote:
> > > Hello,
> > >=20
> > > I am writing because you are listed as author of the hid-logitech-dj
> > > driver. I recently bought a Logitech Anywhere 3SB mouse, and found Li=
nux
> > > didn't recognize it. Thinking it was a simple case of new IDs not
> > > recognized, I quickly added them to the logitch HID++ drivers (patch
> > > attached), both for USB with the new receiver and for the Bluetooth
> > > direct connection.
> > >=20
> > > I have noticed however that the patch while causing them to be recogn=
ized
> > > and interacted with as HID++ devices, it has a flaw. The scroll wheel
> > > events are reported by the linux kernel as being in hires mode, while
> > > haven't actually enabled it on the mouse. You can fix that using Sola=
ar,
> > > but some piece is missing to enable it correctly in the driver.=C2=A0=
 Since
> > > this is no longer a trivial fix. I wanted to reach out. Do you have a=
ny
> > > suggestions?
> > >=20
> > > Best regards
> > > Allan
> >=20
> > Hi Allan,
> >=20
> > Thank you for reaching out.
> >=20
> > What likely is happening here is Solaar overwriting the configuration t=
hat
> > the kernel driver sets, as that would happen after the driver talks to =
the
> > device.
> >=20
> > The settings in question need support in both the kernel and the usersp=
ace
> > input stack (libinput) for them to work appropriately, it's not like
> > configuring RGB or other sort setting on the device that works standalo=
ne.
> We already have the support in the kernel and libinput. That is why I am=
=20
> expanding it to recognize this new device id.(?)

Yes, that sounds right.

> > I have, multiple times now, asked for Solaar to not expose these low le=
vel
> > settings that need support from other parts of the input stack, leaving=
 them
> > to the kernel to configure.
> > I have been inactive in the Solaar project for quite some time now, so =
I
> > don't feel like yet again make a big deal out of this there, so that th=
is
> > decision is reconsidered. I have already spent a significant amount of
> > effort there, and nowadays I barely have energy to go through my day an=
d
> > deal with my all my responsibilities and other OSS project involvements=
, so
> > I sadly have no more energy to spare there.
> >=20
> > My recommendation is: disable Solaar from running at startup, restart t=
he
> > system, and see if that solves your problem. If it does, report this is=
sue
> > again to the Solaar upstream, then depending on that outcome, make a
> > decision on how to proceed. It may be that setting the high-resolution
> > settings in Solaar, which are expected by the driver, works, but it mig=
ht
> > not be super reliable, because since Solaar is overwriting the settings
> > configured by the kernel driver, if anything in the kernel driver chang=
es,
> > then the setting you have configured in Solaar might no longer be corre=
ct.
> > There are alternatives to Solaar that do not have this issue, like
> > libratbag, but these generally are feature lacking on the productivity =
line
> > of Logitech projects.
> >=20
> > Sorry I wasn't able to help much, but I hope that this clarifies things=
 a
> > bit, and helps you solve your problem.
> >=20
> Thanks. You are right, it works with solaar uninstalled, I only installed=
 it=20
> to check the details of a device not recognized by the kernel.
>=20
> So the patch as send to you before is then upstreamable. Is there anythin=
g=20
> more I need to do, to facilitate the upstreaming?
>=20
> Best regards
> Allan=20

Great to hear!

The patch you sent seems pretty good for upstreaming, I would maybe just sp=
lit
the Makefile changes into a separate patch and submit those separately, if
that's something you actually want to upstream. Additionally, it seems to m=
e
like the mouse can work wired, so I would also add the USB PID of the wired
connection to the hidpp driver, that way everything should work as expected=
 on
all interfaces.

Let me know if you need anything else.

Cheers,
Filipe La=C3=ADns

--=-iCVCNZ4AcrDgFM8hydtx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEzZzJfXA4H9kwnLT5KhDNV3fI85UFAmYaQ1gACgkQKhDNV3fI
85V3PxAAokU+D6FH9Xn97ruVoxBFf8Yy6/FwyWMCFhNmJiSYNwNwcGOYycZeOA6r
zLe8penujh381+WaEYYWihaIwiui8+o3wDAaGaY+KeWfbvOHwGda2CMh0o8vMJ2j
L6O3Ufy9UYboFfFWUh1dMqVdkIaFzox3L+UPNmAPbVzXTI/G8pPuh0x1sKfdPa84
jW8dZG5TY9sdmIj5qy8RaNz61kt6YN7Bdm9HE4Z9toSjC+0KEcxh00M8OtT6/xTR
xMM5iffU2l5DXsLpT6L92/K1bLaAnmfpXPYk6gthZRbat5jeMBPUZFmQCXGp0G0G
7iHECgBz4wvlD5Gyo804GLWa5Agso62J9dZdj0EfLFruB+rJ6j2PctjYnz0OSdJn
HrjeqAeTTQpcHqukO6wOpjAFD4NnkRkVmH3ZleA81ZFDRjkot1zoKd/Wyr/L6pvV
MJTSh5ZqBSgTKYNwab9COXNxxGcqA8mDge8MovruRcMBQSDiZE1HU3Aot/JUG3jA
keIdiLJSzYuPL+VLmA1C9kiNk1WXUMuTZz1YL7eIimu7umD++xJCutItrpQcRTRw
zcWegSUHn39tfjB6YKahWuT8TfuJAjwmf3F/reuUaq1RFxS2Y32HFKf4w0uGHgGf
5ge5FeuCX+rpfhDRe8vw/5Ll2kMFIOd6X/+uQ+ZSTNeEjgToNao=
=Rpns
-----END PGP SIGNATURE-----

--=-iCVCNZ4AcrDgFM8hydtx--

