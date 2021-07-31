Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBFA3DC88F
	for <lists+linux-input@lfdr.de>; Sun,  1 Aug 2021 00:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbhGaWIT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 31 Jul 2021 18:08:19 -0400
Received: from mx1.riseup.net ([198.252.153.129]:42412 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhGaWIT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 31 Jul 2021 18:08:19 -0400
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4Gcdgc0xwSzF4FT;
        Sat, 31 Jul 2021 15:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1627769292; bh=F/rFKRmbOQq9ALjgMY+H9ZQfj+XBLIymkBXHGLS4rJQ=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
        b=P+4raG2q0Eu0b3412u5g+43WMYfmzjXFv2qLGNCTC4MoeoSkxkkH5eTYf7U4bfbXN
         +0daM0Srnmy5be55L2lsHav51LZ1VXwppBFpvSSYEDMq7YeIgJhe1sHqWsGwXLSGgi
         JCkI0Xz6fj92eyginsBwxaoBidfWHWzKUcTEw+RU=
X-Riseup-User-ID: DB4F723F64DE5F8C1128BAB35A63DD05743D9CC089447E8F30A909201F243FCF
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4GcdgZ3s0Xz5w7g;
        Sat, 31 Jul 2021 15:08:10 -0700 (PDT)
Message-ID: <084f4be8150e83f865b8a8c768ae9fea6d205330.camel@riseup.net>
Subject: Re: [PATCH v3] HID: logitech-hidpp: battery: provide CAPACITY
 property for newer devices
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
To:     Hamza Mahfooz <someguy@effective-light.com>
Cc:     linux-kernel@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
In-Reply-To: <86WPWQ.ODI6WUKUKD0N3@effective-light.com>
References: <20210723185720.29314-1-someguy@effective-light.com>
         <e3bdfa16584d7ec832414dcb854ee4d2582543b3.camel@riseup.net>
         <86WPWQ.ODI6WUKUKD0N3@effective-light.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-in/OeNRbjo+2DEid1fFH"
Date:   Sat, 31 Jul 2021 23:08:07 +0100
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-in/OeNRbjo+2DEid1fFH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-07-23 at 17:39 -0400, Hamza Mahfooz wrote:
>=20
> On Fri, Jul 23 2021 at 08:42:32 PM +0100, Filipe La=C3=ADns=20
> <lains@riseup.net> wrote:
> > That said, I think we should definitely have a comment here nothing=20
> > that, and
> > possible have some bounds checks for the reported voltage value=20
> > hinting that
> > there may be bug.
>=20
> Hey Filipe,
>=20
> Do you have any thoughts on what the bounds ought to be?
> 3500 mV seems like a rather safe lower bound, however the upper bound
> seems much more fuzzy.
>=20
>=20

Hi Hamza,

Sorry for the delay getting back to you! The most relevant bound would be t=
he
lower one, but I think 5000mV would be a good value.

Cheers,
Filipe La=C3=ADns

--=-in/OeNRbjo+2DEid1fFH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmEFyccACgkQ+JPGdIFq
qV2mMA/+OAq+BFtdGOobLYmDG6SQqixQLQe+UEJkZ0D+zN5QW+I9RIfaOYCzCUis
Q7exSbqvCwLsoYNDWosleKnNpGHLTnCPALeBYJracblZsipJdYt2WAVBuwAmnZSJ
uGAWiI2zwjpiYVqP8Y8aIPfH60YaAbrnp7rHuddx63Mx7XWz/l8PuMURsBkSgEOX
d69Dz55qA87TuxwffDv52mAizV2r9XVkX82ML0WGHA7JoubapsZhWRciJN6iknGX
EBdrtQECdivEelv0AHis1xpjLgUEVzkG0JYpzRbSdwC/wXxDHdWRFGzptQuI96Jx
WeW0V4PKB0P9kCFcWlq6fOgrYsWXVGszCZsvekL8DFNa80bHf+kPD0Xe0aMTiUA6
ZBq9B1yGL0fRyjn4NX7MznateFqWDvsF7ZXrcltkFIUZmWbrsA1W+fgRBMyxEIwz
kZoByRP8/2um9plPiK+ModmoZxLwL9EsIMU/9nnv7i2YT0S0H4t91TopRZJy/Upg
0Y2eYo0/5ZuK2bQuWGYyQeaNlERbMR7LIebkXB+C4KllHfaSL7Dr2FBuHI5jwbw1
9dUUpLBk1XyBgwFA6AYWRX+96O6AYMzOTACRJ3zaeHqVgoSc6scaoUf5YX/Xlb5v
elap2wQ3QocISISvw+/dkn40LFM7CRl6HwVHP58I/I/TRPrfegY=
=gKt5
-----END PGP SIGNATURE-----

--=-in/OeNRbjo+2DEid1fFH--

