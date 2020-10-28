Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC6029D732
	for <lists+linux-input@lfdr.de>; Wed, 28 Oct 2020 23:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731661AbgJ1WV6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 18:21:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55244 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732583AbgJ1WV4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 18:21:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 277111C0BAF; Wed, 28 Oct 2020 17:26:22 +0100 (CET)
Date:   Wed, 28 Oct 2020 17:26:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     dmitry.torokhov@gmail.com, vojtech@suse.cz,
        linux-input@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: Re: Proper support for Saitek X36F joystick
Message-ID: <20201028162621.GA18184@amd>
References: <20201027124235.GA27148@duo.ucw.cz>
 <nycvar.YFH.7.76.2010272006490.18859@cbobk.fhfr.pm>
 <20201027210732.GA4479@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <20201027210732.GA4479@amd>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > This is from 4.19, but I doubt this changed recently.
> > >=20
> > > Saitek X36F+X35T combination is detected like this... in short one
> > > hat, no switches, and lot of buttons.
> > >=20
> > > In reality, combination has 4 four-way switches (hats?), 2 slider
> > > switches (three positions) and lot less buttons. Sliders and 3 of 4
> > > hats are detected as groups of buttons. Last hat is strange, I can't
> > > see anything that corresponds to it on evtest, and as long as it is
> > > pushed in any direction, all the other events stop. (It is also one
> > > I'd like to use).
> > >=20
> > > What needs to be done to get more useful mapping for userspace?
> >=20
> > It wouldn't be the first device produced by Saitek that has completely=
=20
> > bogus report descriptor.
> >=20
> > The most straightforward way would be to let hid-saitek module claim th=
e=20
> > device, and fix the report descriptor (saitek_report_fixup()) before it=
's=20
> > passed to hid parser so that it actually describes the events produced.
> >=20
> > You can either patch individual bytes (that's what saitek_report_fixup(=
)=20
> > is currently doing for another device), or replace the whole descriptor=
=20
> > completely (see e.g. hid-kye for inspiration how this is done).
>=20
> Thank you... replacing whole descriptors is rather easy.
>=20
> Coming up with descriptors that works ... not so :-(. I can replace
> descriptor with equivalent one, but things get horribly confused as
> soon as I really try to change anything.

So no, I can't even replace it with equivalent one. Perhaps hrdc got
decompilation wrong, or I'm doing something else wrong.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+Zm60ACgkQMOfwapXb+vKeoQCglfgu5nuSf3JaWDFX9ScEnLSw
GFQAn3Qiithsq1pt5hqlmHTehlQxPaPn
=gDX8
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
