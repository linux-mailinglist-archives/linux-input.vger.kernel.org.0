Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609C331DE41
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhBQRdA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:33:00 -0500
Received: from [139.28.40.42] ([139.28.40.42]:46870 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S234146AbhBQRcs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:32:48 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 99A0336011D;
        Wed, 17 Feb 2021 18:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1613582544;
        bh=5WfzNG7IUI6eMlFOH38CcAl/0dszPETSZdLlIuk5Rf0=;
        h=Date:From:Cc:Subject:From;
        b=EWwMB5uk1waX6FJpQS+zXMzmuuaOllUv+K08VRedvR+UAnI8SzGAcbIC1jIuedhcT
         BEWxQhiwxT5aEEGLyk4fAf9+wN0l2B/0xh/3LKXe47ioMu1nwwjOjvwHxtbrk+yFX7
         aUrcDWfVbYCl/1YAL2KZRvBv1bgLZXirUCvdvk+HebY24omLgFoCqcERgsbGsG1SMt
         EpN6Z05TxAOwz7r/5EMfFdAGeJXfATLJNSeZaRrhdseJpFjMsB+qqU5m6j3N336Ul0
         x/hGQVNl98hzYSGwWx+j972MpmK2HHvNBEuXq0y4csGj5FS8vimYGeaDdm//9ZDGzV
         11hRQso7gNiIA==
Date:   Wed, 17 Feb 2021 18:22:23 +0100
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Stylus-on-touchscreen device support
Message-ID: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="as2a7ri2rx7w3ffl"
Content-Disposition: inline
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--as2a7ri2rx7w3ffl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patchset adds support for stylus-on-touchscreen devices as found on
the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among others;
with it, they properly behave like a drawing tablet.

Patches 2 and 4 funxionally depend on patch 1.
Patch 4 needs patch 3 to apply.

The output of this patchset and the need for a kernel, rather than
userspace, patch was previously discussed here:
  https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/558#not=
e_792834

Ahelenia Ziemia=C5=84ska (4):
  HID: multitouch: require Finger field to mark Win8 reports as MT
  HID: multitouch: set Stylus suffix for Stylus-application devices, too
  HID: input: replace outdated HID numbers+comments with macros
  HID: input: work around Win8 stylus-on-touchscreen reporting

 drivers/hid/hid-input.c      | 47 +++++++++++++++++++++++++++++++++---
 drivers/hid/hid-multitouch.c | 18 ++++++++------
 2 files changed, 55 insertions(+), 10 deletions(-)

--=20
2.20.1

--as2a7ri2rx7w3ffl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmAtUMsACgkQvP0LAY0m
WPEFARAAqFw6tyfU/2yLrXagcabPbSj4728gA+a4jCFUfuoYwI3q5+KLsi2CR3UI
dxU2RuoKJ2xm+47KDJyV6Ho2TkKL34gR1EVbco24/9UJlXUpp8AQirT0zaf0QpNH
exL0EVyOiNpL2jMaSX5s0k7eOh8J+e3lCwgNCvS1h1V4Ajm5cEhglAXZxvH8JgZR
XDI2dxtGT11xuDbyo+H/4HTRPYnhaiK+rL5xcLOTNoGej9g/9PjyrZnlfCu0OJwb
/Xpt3f3xtYqnNua+Z4wGl3rer5ANUOPcynWPP5aCx5J0+WFd48eC7cJDP4Esihvc
NmWMSUjVUfQ2kpz6hr4WEUMQZI7AxoQHXut1SmR0+IlDrwJgiiUKL5E1r+Au8hkY
pFqNa2CMu/QiNyLOhJ91qWITPIpbsdhBVlqKgcONrTDbcu5UpCoG2lZ9ffHOY1YK
Ge4hXI1bHkARvyrfKatDppCeGI3khl1bi/uv9fLgFx7Jh3ii2tklOCg4UZbo1OPD
GY2EWkUZGCaZuD69d0Wy8JoLXNVUiMGivvb9NnLlL3ZUmL0ajiZkUTfZCA8bqlEw
UMuHQANfpVuYeVV4Vb6Z0SFgptg5HPK+MZkno6yP7kH2gvnoI0E3/b7knQN6sG63
IAjiKr1VDB/2KYK3uZe7J4i66xCvhtnKFLK/4NDO4awjPyE6O7Y=
=J2mS
-----END PGP SIGNATURE-----

--as2a7ri2rx7w3ffl--
