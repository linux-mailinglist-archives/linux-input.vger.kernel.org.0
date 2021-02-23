Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D8E322774
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 10:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbhBWJGT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 04:06:19 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:52012 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbhBWJEo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 04:04:44 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 166441C0B85; Tue, 23 Feb 2021 10:03:58 +0100 (CET)
Date:   Tue, 23 Feb 2021 10:03:56 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 5/7] HID: lenovo: Set LEDs max_brightness value
Message-ID: <20210223090356.GE9750@amd>
References: <20210221112005.102116-1-hdegoede@redhat.com>
 <20210221112005.102116-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline
In-Reply-To: <20210221112005.102116-6-hdegoede@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-02-21 12:20:03, Hans de Goede wrote:
> The LEDs can only by turned on/off, so max_brightness should be set to 1.
> Without this the max_brightness sysfs-attribute will report 255 which is
> wrong.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
http://www.livejournal.com/~pavelmachek

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0xPwACgkQMOfwapXb+vIxAACfcF/s3KwvdZ56OjVFvgOKfyaq
z9kAnA2/Ex7AO7WwInsgtlZEjZlGyxU4
=NTxy
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--
