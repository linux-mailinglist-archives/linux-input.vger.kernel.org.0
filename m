Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0412E322772
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 10:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhBWJGN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 04:06:13 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:51980 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbhBWJEV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 04:04:21 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 28C731C0B7F; Tue, 23 Feb 2021 10:03:39 +0100 (CET)
Date:   Tue, 23 Feb 2021 10:03:38 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 4/7] HID: lenovo: Remove lenovo_led_brightness_get()
Message-ID: <20210223090338.GD9750@amd>
References: <20210221112005.102116-1-hdegoede@redhat.com>
 <20210221112005.102116-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline
In-Reply-To: <20210221112005.102116-5-hdegoede@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-02-21 12:20:02, Hans de Goede wrote:
> The led_classdev already contains a cached value of the last set
> brightness, the brightness_get callback is only meant for LED drivers
> which can read back the actual / current brightness from the hardware.
>=20
> Since lenovo_led_brightness_get() just returns the last set value
> it does not add any functionality, so we can just remove it.
>=20
> Reviewed-by: Marek Beh=FAn <kabel@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
http://www.livejournal.com/~pavelmachek

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0xOoACgkQMOfwapXb+vI2YQCffXWN1Q76lOUIi4u3BzFXtjsS
ssIAoMIrCl+41jFRTKAuYJVV1dCnMTCS
=LKiG
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
