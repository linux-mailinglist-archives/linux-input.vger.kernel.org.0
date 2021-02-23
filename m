Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF4E32275D
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 10:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhBWJAo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 04:00:44 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:51708 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhBWJAm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 04:00:42 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3208B1C0B85; Tue, 23 Feb 2021 10:00:00 +0100 (CET)
Date:   Tue, 23 Feb 2021 09:59:59 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/7] HID: lenovo: Use brightness_set_blocking callback
 for setting LEDs brightness
Message-ID: <20210223085959.GC9750@amd>
References: <20210220122438.21857-1-hdegoede@redhat.com>
 <20210220122438.21857-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline
In-Reply-To: <20210220122438.21857-2-hdegoede@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2021-02-20 13:24:32, Hans de Goede wrote:
> The lenovo_led_brightness_set function may sleep, so we should have the
> the led_class_dev's brightness_set_blocking callback point to it, rather
> then the regular brightness_set callback.
>=20
> When toggle through sysfs this is not a problem, but the brightness_set
> callback may be called from atomic context when using LED-triggers.
>=20
> Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard sup=
port")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pavel Machek <pavel@ucw.cz>				Pavel

--=20
http://www.livejournal.com/~pavelmachek

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0xA8ACgkQMOfwapXb+vJh4QCguJNZSG9GaVKowh+jJjCtEDfQ
04MAoK6hH6jZdSaulTwWF2RVp7Pz9Z2X
=L+UJ
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
