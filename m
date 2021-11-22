Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885E34596CA
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 22:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239261AbhKVVin (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 16:38:43 -0500
Received: from mail.archlinux.org ([95.216.189.61]:33920 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236375AbhKVVin (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 16:38:43 -0500
X-Greylist: delayed 333 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Nov 2021 16:38:40 EST
Received: from [IPv6:2001:8a0:f24a:dd00:f991:27cb:4afd:8a41] (unknown [IPv6:2001:8a0:f24a:dd00:f991:27cb:4afd:8a41])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.archlinux.org (Postfix) with ESMTPSA id 50B07AB0A72;
        Mon, 22 Nov 2021 21:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1637616594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=meP4Tbu+leAMTGnGKUFJCh9hUp7oUI+5clEcLqhvGJE=;
        b=Fg74LOjc31JwIP8xDRuyrJb6s3XU4vCzxjy1FT7DYGDQz4Ssp13hVnpw+Z2IGsRqKzFeA2
        G1J4+MhcPvqSVIzyN0oUnl5jB6eOMZkN3dqFDhhGUahMRUwV1I1rClq3SR0IUJZ181xjj0
        4aHwOBFyEOrU98Jyr2YDpANQ//1C98dBpMu89/I/9spBgfm6BEI6ZgsL0CrMUaIaurimH2
        +60sklSvanoeRl7izHQx7+RCKrb4gihHw1Ukse/+0U0W5nVaczxLZahrwGSKwkXkjlyhvZ
        JjajeMDKLZrckJf7X8pUKJm66FcO8JKH5pUMlXFRIOEOW98Cm3zrgUrbaVVsGkSr9JvIJ0
        wXhdcuTYWY8H+96tRTwzKuAEly/R7nPaD4eAFKgONDo/qoS2lESjFI5pmCEevM2lz2qViC
        UBe5I6vsGnQHv0zqgK6W+YhahcL5qDFtg9E/y9k8tbZtL8cUEV0pnOijTjEsMbRYNJXpVJ
        xKX5UmC+Z3ZxwegCfFsxazpyev98m3upZgd1TZfA3aKiDbnXD0sdM6DzcK6ke01lp9nWuW
        AufhKU4RydXTrEuqd65jjUSiWMk7Gy7lkY+j7//rRcvhPTrPW3BbI9SJ6q63r7pZWH5hmq
        HLTvf6PdGQ4IuGSCY9AZrpBrzu9egCQJI6ysepuHfHEDW7Xt92KMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1637616594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=meP4Tbu+leAMTGnGKUFJCh9hUp7oUI+5clEcLqhvGJE=;
        b=dLIGgVTAIykA0EtkJuF9Xeuhje2yEiDnLHEtVXPOFFt0IRi0JGux2GaIHQ0P0Ga44s+zJR
        p2nkO9lbS3tEweBA==
Message-ID: <667c2c8307e0e738ed54e34f6c83ea1df99c7528.camel@archlinux.org>
Subject: Re: I need advice with UPS connection. (ping)
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        David Niklas <Hgntkwis@vfemail.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
In-Reply-To: <YZv55KMsuSYanfYp@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
         <20211114144842.72463ccc@Zen-II-x12.niklas.com>
         <20211114211435.GA87082@rowland.harvard.edu>
         <20211114220222.31755871@Zen-II-x12.niklas.com>
         <20211115160918.GB109771@rowland.harvard.edu>
         <20211117002359.03b36ec6@Zen-II-x12.niklas.com>
         <20211117170817.GD172151@rowland.harvard.edu>
         <20211119171915.6a8cac47@Zen-II-x12.niklas.com>
         <YZm03KTcWOwtMtCN@rowland.harvard.edu>
         <20211122112526.501c5f66@Zen-II-x12.niklas.com>
         <YZv55KMsuSYanfYp@rowland.harvard.edu>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-fi0k6bOzQTeeNdwFMXY6"
Date:   Mon, 22 Nov 2021 21:29:47 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.42.1 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-fi0k6bOzQTeeNdwFMXY6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-11-22 at 15:13 -0500, Alan Stern wrote:
> On Mon, Nov 22, 2021 at 11:25:26AM -0500, David Niklas wrote:
> > Ok, I first edited the kernel to return -ENOMEM like you suggested but
> > the UPS still disconnected. I then edited it again to re-add the 1060
> > byte request and the UPS still disconnected.
> >=20
> > I'm attaching the usbmon traces.
> > If you need any additional info I'll do my best to provide it.
>=20
> Holy cow!=C2=A0 I just realized what's going on.=C2=A0 And these little c=
hanges=20
> we've been messing around with have nothing to do with it.
>=20
> For the first time, I looked at the timestamps in the usbmon traces.=C2=
=A0 It=20
> turns out that the disconnects occur several seconds after the kernel=20
> retrieves the HID report descriptor from the device.=C2=A0 Under normal=
=20
> conditions we would expect to see report packets coming in from the=20
> device, starting just a fraction of a second after the descriptor is=20
> received.=C2=A0 But that isn't happening in the Linux traces, whereas it =
does=20
> happen in the Windows pcap log.
>=20
> I would guess that the UPS is programmed to disconnect itself=20
> electronically from the USB bus if it doesn't get any requests for=20
> reports within a couple of seconds.=C2=A0 That certainly would explain wh=
at=20
> you've been seeing.=C2=A0 I can't imagine why it would be programmed to=
=20
> behave this way, but companies have been known to do stranger things.
>=20
> As for why the kernel doesn't try to get the reports...=C2=A0 That's a li=
ttle=20
> harder to answer.=C2=A0 Maybe Jiri or Benjamin will know something about =
it.=C2=A0=20
>=20
> The UPS's vendor ID is 0d9f (POWERCOM) and the product ID is 0004.=C2=A0 =
Now,=20
> the drivers/hid/hid-quirks.c file contains a quirk entry for 0d9f:0002=
=20
> (product POWERCOM_UPS), which is probably an earlier model of the same=
=20
> device, or a very similar device.=C2=A0 This quirk entry is in the=20
> hid_ignore_list; it tells the HID core not to handle the device at all.
>=20
> I don't know why that quirk entry is present, and furthermore, it can't=
=20
> directly affect what is happening with your device because the product=
=20
> IDs are different.=C2=A0 Still, it is an indication that something strang=
e is=20
> going on behind the scenes.
>=20
> Perhaps there is no kernel driver for these UPS devices?=C2=A0 Perhaps th=
e=20
> intention is that some user program will handle all the communication=20
> when one of them is detected?=C2=A0 A quick search on Google turns up=20
> usbhid-ups, part of Network USB Tools (NUT) -- maybe you need to=20
> install that package in order to use the device.
>=20
> I don't know what the full story is.=C2=A0 With luck, Jiri or Benjamin ca=
n=20
> help more.
>=20
> Alan Stern

hid-generic should be able to handle these devices, but UPSes are much less
tested than normal input peripherals, so it's not that surprising that ther=
e may
be some unexpected weirdness. FWIW, I have two UPSes, one works OOTB and th=
e
other doesn't, I have been meaning to investigate the issue. However, David=
's
case seems to me like a hardware quirk, but that's just my guess.

Cheers,
Filipe La=C3=ADns

--=-fi0k6bOzQTeeNdwFMXY6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmGcC8sACgkQ+JPGdIFq
qV1GyBAAhVtd8AeL/33vhVhzVoVsw9wEpuQ/3xMafErddgwnAXai1E8vTwj/36/X
NRSsqZq7SAfxS86ipCVgQZ6c+TXViIea9GnNOQoJpxZRkmpCjOYiMwbXXCrMJSWg
MN1tK7onaVSny9AnXb4PQohGUYZwnDQtiV287BbkaDawQl/c7ncBfOijkDUY+geY
bPNhc3kS2za0/e6ig2d3/TPbrlIdN/3smhGg57Nsm9VS6jfPJo+xmpgZS2cCf616
5GFWFmcQnojGfqtxKfJfF7lEHSir4+Nrpco7CT33r0ZAU75/7bJdVCc92jYXO7kT
F93lb6nu2C9MMkcUlLBzH/cOVj4olwYRmn54I6NQnBYpkrBLSyswmP2YrXqn79fL
SJd62Ipb0RhO/5yd+w3wnuVvRDeVsPVhA7364pyziApwN/j7KGcMeooNiCToGQit
wpQ3A34EbIBtttvr9s3Yln6Tafb8tEGBcud3UWABIzz8feu/NP4GD9Yo9o0O+hAx
7+gcIkPTaNR4gZGtCd+fQMLqHtxh2I+A9s67lHL0eHps7yoqio51dYO0iXN7Xg6N
/QTJ/NoyPXF/WxeXmOaPq6UQ3XdphqfsqgtS57ex++3UEw1lbbpsNVc9tAkWbTw6
p0ggXaVEXIHlxBO/2GgFPh/kD7PyNTCsi9b3FbyEZpOw2RwaHjc=
=5mtT
-----END PGP SIGNATURE-----

--=-fi0k6bOzQTeeNdwFMXY6--
