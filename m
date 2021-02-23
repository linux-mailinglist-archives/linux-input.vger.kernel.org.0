Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE5A322788
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 10:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhBWJKL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 04:10:11 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:52380 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbhBWJJJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 04:09:09 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BF5921C0B7F; Tue, 23 Feb 2021 10:08:26 +0100 (CET)
Date:   Tue, 23 Feb 2021 10:08:25 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/3] HID: elan: Mute LED handling fixes and
 improvements
Message-ID: <20210223090825.GG9750@amd>
References: <20210221113029.103703-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="j2AXaZ4YhVcLc+PQ"
Content-Disposition: inline
In-Reply-To: <20210221113029.103703-1-hdegoede@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--j2AXaZ4YhVcLc+PQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Here is v2 of my series with mute LED handling fixes and improvements
> for the hid-elan driver.
>=20
> New in v2:
> - Add Marek Beh=FAn's Reviewed-by to all patches,thank you for all the
>   reviews Marek.
> - Improve error handling in patch 1/3 to return -EIO when ret !=3D 3 and =
>=3D 0

Series:

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
http://www.livejournal.com/~pavelmachek

--j2AXaZ4YhVcLc+PQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0xgkACgkQMOfwapXb+vJeEACfSNHriy6LUB+JawGv3uQFe8ut
4ckAn3oJ2ickVL3tHFHxBT+CwaHJ7S0I
=SMl5
-----END PGP SIGNATURE-----

--j2AXaZ4YhVcLc+PQ--
