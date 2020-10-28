Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B6229D79A
	for <lists+linux-input@lfdr.de>; Wed, 28 Oct 2020 23:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733025AbgJ1WYo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 18:24:44 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55240 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732579AbgJ1WV4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 18:21:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EE19D1C0BB3; Wed, 28 Oct 2020 18:32:17 +0100 (CET)
Date:   Wed, 28 Oct 2020 18:32:17 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     dmitry.torokhov@gmail.com, vojtech@suse.cz,
        linux-input@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: Re: Proper support for Saitek X36F joystick
Message-ID: <20201028173217.GA25456@amd>
References: <20201027124235.GA27148@duo.ucw.cz>
 <nycvar.YFH.7.76.2010272006490.18859@cbobk.fhfr.pm>
 <20201027210732.GA4479@amd>
 <20201028162621.GA18184@amd>
 <nycvar.YFH.7.76.2010281728260.18859@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2010281728260.18859@cbobk.fhfr.pm>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-10-28 17:29:23, Jiri Kosina wrote:
> On Wed, 28 Oct 2020, Pavel Machek wrote:
>=20
> > So no, I can't even replace it with equivalent one. Perhaps hrdc got
> > decompilation wrong, or I'm doing something else wrong.
>=20
> You don't need to do any decompilation -- the descriptor can be obtained=
=20
> from /sys/kernel/debug/hid/<device>/rdesc (also lsusb in verbose enough=
=20
> mode should present it in case no driver is bound to the device).

I discovered problem in the meantime. hrdc (I was using to de-compile
and re-compile hid descriptors) was adding padding.

But thanks for the pointer. That is very useful:

This device has four hat switches... I declared two so far

     0x0b, 0x39, 0x00, 0x01, 0x00,  //     Usage (desktop.HatSwitch)
     0x35, 0x00,                    //     PhysicalMinimum (0)
     0x46, 0x3b, 0x01,              //     PhysicalMaximum (315)
     0x15, 0x01,                    //     LogicalMinimum (1)
     0x25, 0x08,                    //     LogicalMaximum (8)
     0x65, 0x14,                    //     Unit (Degree)
     0x55, 0x00,                    //     UnitExponent (0)
     0x95, 0x01,                    //     ReportCount (1)
     0x75, 0x04,                    //     ReportSize (4)
     0x81, 0x42,                    //     Input (Variable|NullState)

     0x95, 0x01,                    //     ReportCount (1)
     0x75, 0x02,                    //     ReportSize (2)
     0x81, 0x03,                    //     Input (Constant|Variable)
     0x0b, 0x39, 0x00, 0x01, 0x00,  //     Usage (desktop.HatSwitch)
     0x35, 0x00,                    //     PhysicalMinimum (0)
     0x46, 0x3b, 0x01,              //     PhysicalMaximum (315)
     0x15, 0x01,                    //     LogicalMinimum (1)
     0x25, 0x08,                    //     LogicalMaximum (8)
     0x65, 0x14,                    //     Unit (Degree)
     0x55, 0x00,                    //     UnitExponent (0)
     0x95, 0x01,                    //     ReportCount (1)
     0x75, 0x04,                    //     ReportSize (4)
     0x81, 0x42,                    //     Input (Variable|NullState)
     0xc0,                          // EndCollection

=2E..but Linux seems to only recognize first of them:

GenericDesktop.HatSwitch ---> Absolute.Hat0X
GenericDesktop.HatSwitch ---> Sync.Report

Is there way to get extra hats mapped as Hat1X, Hat2X and Hat3X?

(Plus, they may have different bit orders than hid expects...?)

I'm thinking that maybe I should ignore this hid stuff and just do
"normal" driver in C? Is there precedent/example for that?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+ZqyEACgkQMOfwapXb+vLxTACgmvMmM5SOmT2oxn4z9VHx2PTt
ndMAn3gIvY7zXJbVeyIiRlJQBcJlZuuf
=3dCK
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
