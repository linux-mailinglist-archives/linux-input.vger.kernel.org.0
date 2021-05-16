Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5156381C3A
	for <lists+linux-input@lfdr.de>; Sun, 16 May 2021 05:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhEPDcZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 May 2021 23:32:25 -0400
Received: from mx1.riseup.net ([198.252.153.129]:57008 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229983AbhEPDcZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 May 2021 23:32:25 -0400
X-Greylist: delayed 564 seconds by postgrey-1.27 at vger.kernel.org; Sat, 15 May 2021 23:32:25 EDT
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4FjSGy2jB2zDqBx;
        Sat, 15 May 2021 20:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1621135306; bh=sP43eVWynebfwBihX2/ys/iQvnGgohNWdF3hIhI1nCs=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
        b=M5ci2MyawVICKemBYYEJvXOXFnvvIpx7zcLt/FAlaNQ2bo1bJQ1fppMHmFlyxeaXt
         TI+wSfBE3KpxJpELXBoOA/GVTmtvqi++bbRDICmK+Bzv4fdVSLkhKNFd1TdABAmAM1
         f0KdisBaFbtacie3Eu0kgpM9B4yYYSePoSONCx4I=
X-Riseup-User-ID: 220F7C896E280F00979C15C618B9AC9419FDE8EE7A92CAF1AFD00F18033058BF
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4FjSGw5h4Rz5vbC;
        Sat, 15 May 2021 20:21:44 -0700 (PDT)
Message-ID: <a81900062b1e517ea20ecbf9324ddaf33e15f262.camel@riseup.net>
Subject: Re: [PATCH] HID: logitech-hidpp: initialize level variable
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
To:     trix@redhat.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        pedro@pedrovanzella.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210507191819.71092-1-trix@redhat.com>
References: <20210507191819.71092-1-trix@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-fLDJk6nGQs0oQ1YARwo0"
Date:   Sun, 16 May 2021 04:21:42 +0100
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-fLDJk6nGQs0oQ1YARwo0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-05-07 at 12:18 -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>=20
> Static analysis reports this representative problem
>=20
> hid-logitech-hidpp.c:1356:23: warning: Assigned value is
> =C2=A0 garbage or undefined
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hidpp->battery.level =3D level=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^ ~~~~~
>=20
> In some cases, 'level' is never set in hidpp20_battery_map_status_voltage=
()
> Since level is not available on all hw, initialize level to unknown.
>=20
> Fixes: be281368f297 ("hid-logitech-hidpp: read battery voltage from newer
> devices")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> =C2=A0drivers/hid/hid-logitech-hidpp.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-
> hidpp.c
> index 69670ca7e1e1..61635e629469 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -1265,6 +1265,7 @@ static int hidpp20_battery_map_status_voltage(u8
> data[3], int *voltage,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int status;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0long flags =3D (long) dat=
a[2];
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*level =3D POWER_SUPPLY_CAPACI=
TY_LEVEL_UNKNOWN;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (flags & 0x80)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0switch (flags & 0x07) {

Hi Tom,

Taking a look at how this function is used, it does make sense to initializ=
e the
level, thank you :)

Reviewed-by: Filipe La=C3=ADns <lains@riseup.net>

Cheers,
Filipe La=C3=ADns

--=-fLDJk6nGQs0oQ1YARwo0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmCgj8AACgkQ+JPGdIFq
qV3oUQ/9G7QHatZcjDaSjn47Fxji8z3AI+J8wPwEkY85lo+9Kv4j4CeFEOHfBDdl
fwmJPRA6TzrlzWqqa/5p6fI3i7LaaT5o3WGLF7mT7qR3tb6c7bNe8OifaDfXJHVl
6Cs08ZQiJMnRJayoPb0lkPWqdqPuy36pCuOp+E++YttOOLoPc0fvo//7wvdjl8oH
Xd50/5cMFqB55SrvOcWg1VAy3+lQZG9J4cj4uYMOa2GqjpnM0YV95SgrP1w26Zpx
8TdgUHdHv3uFFrrfDXOAirzo5WoyymUPkhf+I05E2XPsHG8IuB9qGOt1BSwgEqVa
Czbx7cc+hX7pW3iSoIamV7yKMdPwVJNR/TmCgVjSpKJK0Fo5DhCnsRuxAS1qZ7r5
kbpOuVubO6pBP+nxIPEYu15rWn8AR10502T7xbFa5Fl8j/0jNHSLfxwkn+b4CA2L
byjWaK90ruzyUmtMJafhFKu23drAd36mfzs9n6II7KLDghdzNFdAQXf4f8zLpNm1
oaHJzAU1QERiM9Qz4JIdFyDoD6x4CRVmGrS6Ua4NvrHX6zpuJKoM9TMTm9Lgawi+
Kq3bLbDbZVuvlBOZK5ahVZv8v+aDvZZapaX7aLdAhU/iO2cK5gSr4Hd4q3FoclJ4
MqZaWVsVaDzSyd7ufWKx7bwpG5hgrrXPd9vnFhbRSAnugAHTN8I=
=MSqh
-----END PGP SIGNATURE-----

--=-fLDJk6nGQs0oQ1YARwo0--

