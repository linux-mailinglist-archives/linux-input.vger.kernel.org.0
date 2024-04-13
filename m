Return-Path: <linux-input+bounces-2976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7008A3BE8
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 11:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E621DB2187C
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 09:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14F818B14;
	Sat, 13 Apr 2024 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ECqxAv46"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06CE556
	for <linux-input@vger.kernel.org>; Sat, 13 Apr 2024 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713000355; cv=none; b=b/ijCGhu9Z4Ank4c4g1hRsxlCNcFL8NWco2b9Kd7MYujS//DENZH+hzmTkXXIeus9LltHRooQgc27TkwZlnmmPnZrmQvg4UkqA5KDsdAY7uY7Km+m5d11R9bPzTD+Vb3SsQvIxYUYus6AXh6UQGqC9teoSRLlyktniv+8JPpTv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713000355; c=relaxed/simple;
	bh=3cWUkepjLvvIevvcwItDpyCPI8eUSKlux775wkW3//o=;
	h=Message-ID:Subject:From:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aD1KcW3c+OGD/9PwHUK7btyJ0j+QpbECBtTMTKtak2fRCGW4ccaJlJbHBiF5DyXb4U/kn3Ugrqx9q7C/IcxsD+n1nD7FeB8J+4T/2Ugdq+6E9ICuHe+Klr8VFeu8pBMhfOT5bhk2RA5/zAqCenqPqKYpCi0MgvohcizyGloZI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ECqxAv46; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VGp2Q3fvRz9v0j;
	Sat, 13 Apr 2024 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713000350; bh=3cWUkepjLvvIevvcwItDpyCPI8eUSKlux775wkW3//o=;
	h=Subject:From:To:In-Reply-To:References:Date:From;
	b=ECqxAv46J1UuUMJzpHn0cOy3asg4+AN8x6eASITMse2a4X7AXOB1W0sHdJpGOA7bZ
	 RjRCXvyxHad+e0trf0cVFN2IlMlOBW9j7LvJ5XTVDqDX36xdtefdxdWKUl6nvnayFE
	 CCtR7MLyVrP+5FDokBKh9HAugZx/VhLK2OdHrSjA=
X-Riseup-User-ID: 614AFFA75586479A4D471B8B1D0F2CD6EAD81988DCC31F55F62BDD7EB44947FF
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VGp2B5RBnzFsf5;
	Sat, 13 Apr 2024 09:25:38 +0000 (UTC)
Message-ID: <c14bded14f007e57314aed87720b9f20ab6a97d9.camel@riseup.net>
Subject: Re: hid-logitech-dj support for Anywhere 3SB
From: Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
To: Allan Sandfeld Jensen <kde@carewolf.com>, linux-input@vger.kernel.org
In-Reply-To: <10451816.nUPlyArG6x@twilight>
References: <4887001.GXAFRqVoOG@twilight> <6038382.lOV4Wx5bFT@twilight>
	 <7f829b15729acba79d24299da0c12cbfead175c5.camel@riseup.net>
	 <10451816.nUPlyArG6x@twilight>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QA4jpHedy9txkOaDic0E"
Date: Sat, 13 Apr 2024 10:25:36 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-QA4jpHedy9txkOaDic0E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2024-04-13 at 10:52 +0200, Allan Sandfeld Jensen wrote:
> On Saturday 13 April 2024 10:33:29 CEST Filipe La=C3=ADns wrote:
> > On Sat, 2024-04-13 at 10:20 +0200, Allan Sandfeld Jensen wrote:
> > > On Friday 12 April 2024 21:53:31 CEST Filipe La=C3=ADns wrote:
> > > > On Fri, 2024-04-12 at 11:10 +0200, Allan Sandfeld Jensen wrote:
> > > > > Hello,
> > > > >=20
> > > > > I am writing because you are listed as author of the hid-logitech=
-dj
> > > > > driver. I recently bought a Logitech Anywhere 3SB mouse, and foun=
d
> > > > > Linux
> > > > > didn't recognize it. Thinking it was a simple case of new IDs not
> > > > > recognized, I quickly added them to the logitch HID++ drivers (pa=
tch
> > > > > attached), both for USB with the new receiver and for the Bluetoo=
th
> > > > > direct connection.
> > > > >=20
> > > > > I have noticed however that the patch while causing them to be
> > > > > recognized
> > > > > and interacted with as HID++ devices, it has a flaw. The scroll w=
heel
> > > > > events are reported by the linux kernel as being in hires mode, w=
hile
> > > > > haven't actually enabled it on the mouse. You can fix that using
> > > > > Solaar,
> > > > > but some piece is missing to enable it correctly in the driver.=
=C2=A0 Since
> > > > > this is no longer a trivial fix. I wanted to reach out. Do you ha=
ve
> > > > > any
> > > > > suggestions?
> > > > >=20
> > > > > Best regards
> > > > > Allan
> > > >=20
> > > > Hi Allan,
> > > >=20
> > > > Thank you for reaching out.
> > > >=20
> > > > What likely is happening here is Solaar overwriting the configurati=
on
> > > > that
> > > > the kernel driver sets, as that would happen after the driver talks=
 to
> > > > the
> > > > device.
> > > >=20
> > > > The settings in question need support in both the kernel and the
> > > > userspace
> > > > input stack (libinput) for them to work appropriately, it's not lik=
e
> > > > configuring RGB or other sort setting on the device that works
> > > > standalone.
> > >=20
> > > We already have the support in the kernel and libinput. That is why I=
 am
> > > expanding it to recognize this new device id.(?)
> >=20
> > Yes, that sounds right.
> >=20
> > > > I have, multiple times now, asked for Solaar to not expose these lo=
w
> > > > level
> > > > settings that need support from other parts of the input stack, lea=
ving
> > > > them to the kernel to configure.
> > > > I have been inactive in the Solaar project for quite some time now,=
 so I
> > > > don't feel like yet again make a big deal out of this there, so tha=
t
> > > > this
> > > > decision is reconsidered. I have already spent a significant amount=
 of
> > > > effort there, and nowadays I barely have energy to go through my da=
y and
> > > > deal with my all my responsibilities and other OSS project involvem=
ents,
> > > > so
> > > > I sadly have no more energy to spare there.
> > > >=20
> > > > My recommendation is: disable Solaar from running at startup, resta=
rt
> > > > the
> > > > system, and see if that solves your problem. If it does, report thi=
s
> > > > issue
> > > > again to the Solaar upstream, then depending on that outcome, make =
a
> > > > decision on how to proceed. It may be that setting the high-resolut=
ion
> > > > settings in Solaar, which are expected by the driver, works, but it
> > > > might
> > > > not be super reliable, because since Solaar is overwriting the sett=
ings
> > > > configured by the kernel driver, if anything in the kernel driver
> > > > changes,
> > > > then the setting you have configured in Solaar might no longer be
> > > > correct.
> > > > There are alternatives to Solaar that do not have this issue, like
> > > > libratbag, but these generally are feature lacking on the productiv=
ity
> > > > line
> > > > of Logitech projects.
> > > >=20
> > > > Sorry I wasn't able to help much, but I hope that this clarifies th=
ings
> > > > a
> > > > bit, and helps you solve your problem.
> > >=20
> > > Thanks. You are right, it works with solaar uninstalled, I only insta=
lled
> > > it to check the details of a device not recognized by the kernel.
> > >=20
> > > So the patch as send to you before is then upstreamable. Is there any=
thing
> > > more I need to do, to facilitate the upstreaming?
> > >=20
> > > Best regards
> > > Allan
> >=20
> > Great to hear!
> >=20
> > The patch you sent seems pretty good for upstreaming, I would maybe jus=
t
> > split the Makefile changes into a separate patch and submit those
> > separately, if that's something you actually want to upstream.
> > Additionally, it seems to me like the mouse can work wired, so I would =
also
> > add the USB PID of the wired connection to the hidpp driver, that way
> > everything should work as expected on all interfaces.
> >=20
> Right. I thought I had remove those changes. I had the weirdest issue whe=
n=20
> building the kernel, where echo wouldn't terminate. It worked when I repl=
aced=20
> echo with another command, so I ended up using perl -e print. Still no id=
ea, I
> assume some interaction between my shell and the combination of quiet and=
 echo
> in a Makefile, but it doesnt matter, not part of the patch.
>=20
> It doesn't seem like the mouse communicates over the USB cable, only draw=
s=20
> power. This appears consistent with my old Anywhere 2S mouse.
>=20
> So where should I send the patch now? It has been at least 15 years since=
 I=20
> contributed anything to the kernel, and I understand sending patches to t=
he=20
> central mailing list is frowned upon now. Do you take if from here, or do=
 I=20
> need to send it to a submodule maintainer above you?
>=20
> Best regards
> Allan
>=20

The standard practice is to run scripts/get_maintainer.pl to find the
recipients. In your case:

$ scripts/get_maintainer.pl drivers/hid/hid-logitech-hidpp.c
"Filipe La=C3=ADns" <lains@riseup.net> (reviewer:HID LOGITECH DRIVERS)
Bastien Nocera <hadess@hadess.net> (reviewer:HID++ LOGITECH DRIVERS)
Jiri Kosina <jikos@kernel.org> (maintainer:HID CORE LAYER)
Benjamin Tissoires <benjamin.tissoires@redhat.com> (maintainer:HID CORE LAY=
ER)
linux-input@vger.kernel.org (open list:HID LOGITECH DRIVERS)
linux-kernel@vger.kernel.org (open list)
$ scripts/get_maintainer.pl drivers/hid/hid-logitech-dj.c
"Filipe La=C3=ADns" <lains@riseup.net> (reviewer:HID LOGITECH DRIVERS)
Jiri Kosina <jikos@kernel.org> (maintainer:HID CORE LAYER)
Benjamin Tissoires <benjamin.tissoires@redhat.com> (maintainer:HID CORE LAY=
ER)
linux-input@vger.kernel.org (open list:HID LOGITECH DRIVERS)
linux-kernel@vger.kernel.org (open list)

Then you can just git-send-mail to all the recipients listed there.

Cheers,
Filipe La=C3=ADns

--=-QA4jpHedy9txkOaDic0E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEzZzJfXA4H9kwnLT5KhDNV3fI85UFAmYaT48ACgkQKhDNV3fI
85WuUA//apozOtJrak20zfNyMRy+m+6Z6cjnkvpWL9+6N/UKcORQ+4B+NhX6JB6I
ECoYXecMFoluSpQE3Y/BE/DX6KjC9lBBYcO/d7M/VIIs4WjenNUWBWuNBmVe7Sqy
2AGOD6JZTmY+U5l4dnh4MmA9tDU7hADCqv8DwJ3GyZjBXKY5WTAKtPWKfWg/nZrs
BRWxfBb+Wfvc7YWD4d+qVXApfWy9tOLkyKCJ1knCDUt1sU6Fj0ZQAt+eCLTZwQsF
PZLPwnr/YqqqV6OafH53ROO+Vph6JPFKzMh4Kg3JDxDZyyxEDX7g9M+s9aaWrM5J
+qQFv++8ZUkOboONafGrTiu3FMdyKt3z4Zasee09A6tuFywGL3/9z/XsSYZGRy6r
QQ026vaUt8qRMCVIPuaFbTmNCbkdKxVnmSovP5dDXXqElmK8ZKZy/z4Weu2UH7fp
D0mkG1rMwSzaXckH6wa4AN4Q8nQfBC9OMkTYMO5BD4mi8oEEAGdsrxoiDbSOufSi
Dpt50Lul8DKb79/+z+ciVSgwolYTaZD8sn8c5veIe5lL63kg253INTJeb/qHybeC
Qf6J0iG4wVcvqgtsFn/uImeDqiGqGyCMX76YLW3BvlcHn5rYplZ9/IBLOY+/KoyF
tBICcVN5ZMGisSt2jbiyfawwQTqNMH9xaQGpaOHOAtSPZeyBowc=
=Wmm5
-----END PGP SIGNATURE-----

--=-QA4jpHedy9txkOaDic0E--

