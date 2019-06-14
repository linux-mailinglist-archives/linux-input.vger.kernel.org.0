Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E284577A
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 10:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfFNI3j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 04:29:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:42818 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726259AbfFNI3j (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 04:29:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 399EFAF7D;
        Fri, 14 Jun 2019 08:29:38 +0000 (UTC)
Message-ID: <4bb29ccf9848d7147cf975d8ed1f7f649ed72be0.camel@suse.de>
Subject: Re: Regression post "HID: core: move Usage Page concatenation to
 Main item"
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Jean-Baptiste =?ISO-8859-1?Q?Th=E9ou?= <jb@essential.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 14 Jun 2019 10:29:36 +0200
In-Reply-To: <CAEXycp+Y-x7N_Yr==Xy_CT5K_a1DZYc85w1OUV+cKC5ZN+KB1g@mail.gmail.com>
References: <CAEXycp+Y-x7N_Yr==Xy_CT5K_a1DZYc85w1OUV+cKC5ZN+KB1g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-U9yRqFBIo6enOd/x5jVj"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-U9yRqFBIo6enOd/x5jVj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-06-14 at 09:01 +0900, Jean-Baptiste Th=C3=A9ou wrote:
> Hi,
>=20
> This patch (58e75155009cc800005629955d3482f36a1e0eec) is triggering a
> regression with the following descriptor (report not working as
> expected)
>=20
>=20
https://partner-android.googlesource.com/platform/cts/+/refs/heads/q-fs-rel=
ease/tests/tests/hardware/res/raw/asus_gamepad_register.json
>=20
> Didn't see anything obviously wrong with this gamepad descriptor, so
> not sure what's trigger the regression.
>=20

I'll have a look at it.

Do you have any more information on the regression? What exactly isn't work=
ing?

Regards,
Nicolas


--=-U9yRqFBIo6enOd/x5jVj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl0DWvAACgkQlfZmHno8
x/7FBAf+JzgyfKk2vvWqED/dX0TFOZmtkPT14VCNY/I1UISIYlrf68w0q0h5KR6d
Dx4KWGlQ9WcoLjB2cn4qkKs3SLdCRJ/wSKoJhRvMGJQvw3xjGN+aAyk7F0/y199E
Or65Ty5CbADBWKMyAt5yzxyn+NFNvkLkU3Au0WnUvRdBFwFVz72vqLUQd10UU6GD
yGi2e7rRzm+PUpj5npx/Vw3K1IVl1f0Xax7JvXY237ZNaobcktWLqv57nJKWyaQ4
hCjlChopG2mITmZFLuIXQ28qRpoAKNrzMS8hJ2knHN+CFDKzCl+gGMPkmVAmc7fl
wxGT+xw9cNMKi0iDWY2alW1SKyESCw==
=ZkvD
-----END PGP SIGNATURE-----

--=-U9yRqFBIo6enOd/x5jVj--

