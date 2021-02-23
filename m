Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9ED0322778
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 10:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhBWJGv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 04:06:51 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:52064 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbhBWJFF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 04:05:05 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7C15A1C0B82; Tue, 23 Feb 2021 10:04:19 +0100 (CET)
Date:   Tue, 23 Feb 2021 10:04:18 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 7/7] HID: lenovo: Set default_triggers for the mute
 and micmute LEDs
Message-ID: <20210223090418.GF9750@amd>
References: <20210221112005.102116-1-hdegoede@redhat.com>
 <20210221112005.102116-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Content-Disposition: inline
In-Reply-To: <20210221112005.102116-8-hdegoede@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-02-21 12:20:05, Hans de Goede wrote:
> The mute and mic-mute LEDs should be automatically turned on/off based
> on the audio-card's mixer settings.
>=20
> Add the standardized default-trigger names for this, so that the alsa
> code can turn the LEDs on/off as appropriate (on supported audio cards).
>=20
> This brings the mute/mic-mute LED support inline with the thinkpad_acpi
> support for the same LEDs in keyboards directly connected to the
> laptop's embedded-controller.
>=20
> Reviewed-by: Marek Beh=FAn <kabel@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
http://www.livejournal.com/~pavelmachek

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0xRIACgkQMOfwapXb+vLvdwCeIGz9/rtuJzodaElzSwGR9fZu
Sk8AoLKq4LA0y2K9UTtNXmameN5/XWKP
=iQA0
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--
