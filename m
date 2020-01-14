Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB8C139F2A
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 02:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgANBr2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 20:47:28 -0500
Received: from orion.archlinux.org ([88.198.91.70]:42476 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728838AbgANBr2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 20:47:28 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 015C5181900AAE;
        Tue, 14 Jan 2020 01:47:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.3
X-Spam-BL-Results: 
Received: from genesis (unknown [IPv6:2001:8a0:f254:2300:dad6:8c60:8394:88da])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Tue, 14 Jan 2020 01:47:24 +0000 (UTC)
Message-ID: <320e6e0d7f8968b3febb3422ba02a2b249e09f60.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-dj: add debug msg when exporting a HID++
 report descriptors
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
In-Reply-To: <CAO-hwJKkMv7T0e11XoYKh9GtsnNCfOztFsoU7JXgmxCvfROeZw@mail.gmail.com>
References: <20200113192300.2482096-1-lains@archlinux.org>
         <CAO-hwJKkMv7T0e11XoYKh9GtsnNCfOztFsoU7JXgmxCvfROeZw@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-XZpYMbjM2oNFIHaa2S3w"
Date:   Tue, 14 Jan 2020 01:47:23 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-XZpYMbjM2oNFIHaa2S3w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-01-14 at 11:24 +1000, Benjamin Tissoires wrote:
> Hi Filipe,
>=20
> On Tue, Jan 14, 2020 at 5:23 AM Filipe La=C3=ADns <lains@archlinux.org> w=
rote:
> > When exporting all other types of report descriptors we print a debug
> > message. Not doing so for HID++ descriptors makes unaware users think
> > that no HID++ descriptor was exported.
>=20
> Unless I am mistaken, those dbg_hid() calls are not displayed by
> default on any distribution. So I am not sure what is the benefit to
> add this one here when we are already not showing the rest to the
> users by default. There is a tiny improvement to have some code
> symmetry, but here, honestly, it doesn't feel that required.
>=20
> Cheers,
> Benjamin

Hi Benjamin,

As far as I know, they aren't. This was just a nitpick. As I already
had the code locally I decided to just go ahead and submit the patch.
But noted, I won't submit any more of this nitpick patches.

> > Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> > ---
> >  drivers/hid/hid-logitech-dj.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-d=
j.c
> > index cc7fc71d8b05..8f17a29b5a94 100644
> > --- a/drivers/hid/hid-logitech-dj.c
> > +++ b/drivers/hid/hid-logitech-dj.c
> > @@ -1368,6 +1368,8 @@ static int logi_dj_ll_parse(struct hid_device *hi=
d)
> >         }
> >=20
> >         if (djdev->reports_supported & HIDPP) {
> > +               dbg_hid("%s: sending a HID++ descriptor, reports_suppor=
ted: %llx\n",
> > +                       __func__, djdev->reports_supported);
> >                 rdcat(rdesc, &rsize, hidpp_descriptor,
> >                       sizeof(hidpp_descriptor));
> >         }
> > --
> > 2.24.1
> >=20

Thank you,
Filipe La=C3=ADns

--=-XZpYMbjM2oNFIHaa2S3w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl4dHaYACgkQ+JPGdIFq
qV06zQ//XmrOqe71XNz/hvtjcOSxohDk+tdLtCvBOwhJr7UKJLWvRDqYy245uO3h
4VOFKNQfbAFmuAJnGybxQSPlZp0qnqEaBj5OnycfLmpEfuhGP1afxv8dJxA0TNZF
FbBmjm+oj2tenrtgE4kQ4GyzrE/AWE3vkKp3FMR+5vILxUG8gd8VKwvYX553gO5r
sz46WGhkc4+skHscqKqqefRW+Z72kNmp1YuOKYntXeK6qomBmWPfN4xH4jM5R1je
03tnYOH45uT+swXczKSoLZXfPNuEVVK7SA0g7HQqrpRe0P7q4KDmbgTaEGec5Y8r
WZopYPDe822UwKukLR7h9EN2ilKdmg2/XwoVgnYofzy0f/0lAisAO9cNTNRwY3C6
ElftlSUZlrruwy9wDX4T3pN+a+ynEybPLRyQj4KwBwFI5Bh2IXwEh5YpHFvz6Odi
5qo0vtUE5cL6Du1Aomqk9WBcIvfPd8dxZojsQfUJJvFocmPk6WzO8CVSBRm8RZT3
nNoYzT5pLMU9A+VWkdIlIjd2wCZWMsV9KYIPNq11wfMYcbuc0XbJXKG/vq6D3Yue
vczfAaoWIDNY6zccimwYT67iF6ZZtogBmeNb4DAN6PlHA7L1I0OxQColmB9Zbke+
uYRmBGZO4yigaKsdj1892j4qaP4Xh5Qyf/mKCBOovzNpMqzrQdA=
=EY9x
-----END PGP SIGNATURE-----

--=-XZpYMbjM2oNFIHaa2S3w--
