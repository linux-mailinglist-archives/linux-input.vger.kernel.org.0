Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305273CA15
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 13:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389374AbfFKLdU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 07:33:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:35210 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389464AbfFKLdU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 07:33:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0A70CAFF2;
        Tue, 11 Jun 2019 11:33:18 +0000 (UTC)
Message-ID: <5214eeef4c307c84d8510661af2d9fa2d4e527f3.camel@suse.de>
Subject: Re: [PATCH] HID: input: fix a4tech horizontal wheel custom usage id
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Date:   Tue, 11 Jun 2019 13:33:11 +0200
In-Reply-To: <CAO-hwJJzYFQs_Jxc+3zYHzjM9G8zdTfBqdpO27hpKXRBKytvQA@mail.gmail.com>
References: <20190610185343.27614-1-nsaenzjulienne@suse.de>
         <CAO-hwJJzYFQs_Jxc+3zYHzjM9G8zdTfBqdpO27hpKXRBKytvQA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-4rAVG0h4mBn3Gg+1TvFj"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-4rAVG0h4mBn3Gg+1TvFj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-06-11 at 10:43 +0200, Benjamin Tissoires wrote:
> Hi Nicolas,
>=20
> On Mon, Jun 10, 2019 at 8:54 PM Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> > Some a4tech mice use the 'GenericDesktop.00b8' usage id to inform
> > whether the previous wheel report was horizontal or vertical. Before
> > c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key") this
> > usage id was being mapped to 'Relative.Misc'. After the patch it's
> > simply ignored (usage->type =3D=3D 0 & usage->code =3D=3D 0). Checking =
the HID
> > Usage Tables it turns out it's a reserved usage_id, so it makes sense t=
o
> > map it the way it was. Ultimately this makes hid-a4tech ignore the
> > WHEEL/HWHEEL selection event, as it has no usage->type.
> >=20
> > The patch reverts the handling of the usage id back to it's previous
> > behavior.
>=20
> Hmm, if A4Tech is using a reserved usage, we shouldn't fix this in
> hid-input.c but in hid-a4tech instead.
> Because you won't know when someone else in the HID consortium will
> remap this usage to some other random axis, and your mouse will be
> broken again.
>=20
> How about you add a .input_mapping callback in hid-a4tech and map this
> usage there to your needs? This way you will be sure that such a
> situation will not happen again.

I agree it would be a cleaner solution.

In summary the first report indicates the wheel relative value, the second =
the
orientation. The first report is already being mapped to REL_WHEEL and
REL_WHEEL (or the high-res versions), but what would be a correct code for =
the
second report? The way I see it, we shouldn't map it to anything. And then
catch both events in the custom driver to build the input_event() accordinl=
gy
(as it's almost being done already). Is this somewhat correct? I'll send a
followup patch anyway so we have something more tangible comment on.

> > Fixes: c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key=
")
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > ---
> >  drivers/hid/hid-input.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 63855f275a38..6a956d5a195e 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -671,7 +671,7 @@ static void hidinput_configure_usage(struct hid_inp=
ut
> > *hidinput, struct hid_fiel
> >                 if ((usage->hid & 0xf0) =3D=3D 0xb0) {      /* SC - Dis=
play */
> >                         switch (usage->hid & 0xf) {
> >                         case 0x05: map_key_clear(KEY_SWITCHVIDEOMODE);
> > break;
> > -                       default: goto ignore;
> > +                       default: goto unknown;
> >                         }
> >                         break;
> >                 }
> > --
> > 2.21.0
> >=20


--=-4rAVG0h4mBn3Gg+1TvFj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAlz/kXcACgkQlfZmHno8
x/7yNggAhChianjl/Aj2nDYja24vOxsTKbR2pRr9iV8RSrZ3PpMhssRedvqrRHIy
cTiGA3vEAnk+y6dNWffoPTceDlMpRobfqMueEHC87fFURtAaG2wE10tAKYnRdUq6
XmyNe34htcOxNtXrzoiJHo5gnv+S8K6YcfLiKIfn1wk3bSRII0I98nFpK9Du3FQD
oaL/2R9P07uXvdUW/Qb4FfQ8nkn5JpJmuaFMR1LFIg3BoPobWZ3SP46Ppgdo30iF
Kervp7QKAa1zGUaCsCZjgYRotX5oOKK1jxzPk9yzkA+mONVH2/bDX0vnfoz6c8qn
ZfTPaApBRZYaUd9kJr3Pe7FUqXCxrw==
=/mxz
-----END PGP SIGNATURE-----

--=-4rAVG0h4mBn3Gg+1TvFj--

