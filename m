Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC74E139EC5
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 02:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbgANBKz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 20:10:55 -0500
Received: from orion.archlinux.org ([88.198.91.70]:38100 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729088AbgANBKy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 20:10:54 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 670F81819008D2;
        Tue, 14 Jan 2020 01:10:52 +0000 (UTC)
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
        Tue, 14 Jan 2020 01:10:51 +0000 (UTC)
Message-ID: <b9a733496f4c56584281c7496bb66bef084b3973.camel@archlinux.org>
Subject: Re: [PATCH v2] HID: logitech-hidpp: add support for the Powerplay
 mat/receiver
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
In-Reply-To: <CAO-hwJJJYRc8_kRiGGu9E4Dx-WpSADro4b28D8QoE87FBUTnOA@mail.gmail.com>
References: <20200112220612.3448741-1-lains@archlinux.org>
         <CAO-hwJJJYRc8_kRiGGu9E4Dx-WpSADro4b28D8QoE87FBUTnOA@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-H9i3sQ2eRn8lTBV7X6Yc"
Date:   Tue, 14 Jan 2020 01:10:50 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-H9i3sQ2eRn8lTBV7X6Yc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-01-14 at 21:03 +1000, Benjamin Tissoires wrote:
> Hi Filipe,
>=20
> On Mon, Jan 13, 2020 at 8:07 AM Filipe La=C3=ADns <lains@archlinux.org> w=
rote:
> > The Logitech G Powerplay has a lightspeed receiver with a static HID++
> > device with ID 7 attached to it to. It is used to configure the led on
> > the mat. For this reason I increased the max number of devices.
> >=20
> > I also marked all lightspeed devices as HID++ compatible. As the
> > internal powerplay device does not have REPORT_TYPE_KEYBOARD or
> > REPORT_TYPE_MOUSE it was not being marked as HID++ compatible in
> > logi_hidpp_dev_conn_notif_equad.
> >=20
> > Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> > ---
> >  drivers/hid/hid-logitech-dj.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-d=
j.c
> > index bb50d6e7745b..732380b55b15 100644
> > --- a/drivers/hid/hid-logitech-dj.c
> > +++ b/drivers/hid/hid-logitech-dj.c
> > @@ -16,11 +16,11 @@
> >  #include <asm/unaligned.h>
> >  #include "hid-ids.h"
> >=20
> > -#define DJ_MAX_PAIRED_DEVICES                  6
> > +#define DJ_MAX_PAIRED_DEVICES                  7
> >  #define DJ_MAX_NUMBER_NOTIFS                   8
> >  #define DJ_RECEIVER_INDEX                      0
> >  #define DJ_DEVICE_INDEX_MIN                    1
> > -#define DJ_DEVICE_INDEX_MAX                    6
> > +#define DJ_DEVICE_INDEX_MAX                    7
> >=20
> >  #define DJREPORT_SHORT_LENGTH                  15
> >  #define DJREPORT_LONG_LENGTH                   32
> > @@ -971,7 +971,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_=
device *hdev,
> >         case 0x0c:
> >                 device_type =3D "eQUAD Lightspeed 1";
> >                 logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &wo=
rkitem);
> > -               workitem.reports_supported |=3D STD_KEYBOARD;
> > +               workitem.reports_supported |=3D STD_KEYBOARD | HIDPP;
>=20
> This feels wrong. The whole initial code was hack-ish, and now this is
> even more hack-ish.
>=20
> I don't have a simple solution right now (at a conference this week),
> but I will need to be convinced this is the only sane solution :/
>=20
> Cheers,
> Benjamin

Yeah, I understand. I just addressed this in a reply to the previous
patch:

On Tue, 2020-01-14 at 00:55 +0000, Filipe La=C3=ADns wrote:
> Okay, then is maybe better if I add HIDPP to reports_supported based
> on
> the device ID (7). This is the only product to my knowledge that
> exports a device with ID 7. It's a better solution than setting HIDPP
> on all lightspeed devices.
>=20
> I will send a new patch if you agree with this approach.

What do you think?

Maybe we will have to rework the driver but the method I proposed above
doesn't seem that hack-ish, at least considering the current code :P

> >                 break;
> >         case 0x0d:
> >                 device_type =3D "eQUAD Lightspeed 1_1";
> > @@ -1850,6 +1850,10 @@ static const struct hid_device_id
> > logi_dj_receivers[] =3D {
> >           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> >                 USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1
> > ),
> >          .driver_data =3D recvr_type_gaming_hidpp},
> > +       { /* Logitech powerplay mat/receiver (0xc539) */
> > +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> > +               0xc53a),
> > +        .driver_data =3D recvr_type_gaming_hidpp},
> >         { /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
> >           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> > USB_DEVICE_ID_MX3000_RECEIVER),
> >          .driver_data =3D recvr_type_27mhz},
> > --
> > 2.24.1
> >=20
--=20
Filipe La=C3=ADns

--=-H9i3sQ2eRn8lTBV7X6Yc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl4dFRUACgkQ+JPGdIFq
qV2FmhAAr5G57hFORS3d+Qiw7zl2SLYO/opxqwu6lWxXTnhhnBK3OoaknXTi3iyO
9GsS/113WIJT0zq1ixzjSJP3DMsom5Rx6CrXljRWCS/TolIeU1/VqQIJ+ANR1NHE
0k1XSGdRorgMRdZj6XukmSw9nwgC++AT5VrYAspo01M4cavEZNDnw2fwhzwPZFlt
RxnjhMwrBmVb5vAJLVXntz37wXdNS6O5+PzuF5IQ9ugp6hom7zz/Bfm6VLhPTrtB
taUvr/2EdxXqTP+csV2vwJLLXnRmFead3HM/NHlo8j8KOESmrzUuO+tvl/SOS00V
tj+uXvye2YqJVnPqGAgl2WW5tKQ5eqE7LMKDwC37tLJX0R3CQB2QkYkd43xPAUs2
n00tt7pS6k2b4TcusScjnLxTL1MtoBjESzK/qHF0N8XcX0Y4jgfyaKsr/sZYZcO0
mhj9tSjFKuRD5taY8F4BOnGyy3ex9iZNEHDWOo0UY5/0Lsugh9nlKKZ6Kmmfs6fL
ORVKzngZrIaHXGsBGNeXNe2oQVojxuqAaqCEon6l0MXIeJRS3HszO5aMsHvVfN0R
B1uTTunGWVJC9B5tVd9ZnqI8AA4URANNq9aWPgTZMv315duZTQwQAyt+0MVEhcDh
mqUat+cP48ZC3kVbFsY5ceABCdqLckg7RaMnj71/7JqAOXZiJQ4=
=f3MK
-----END PGP SIGNATURE-----

--=-H9i3sQ2eRn8lTBV7X6Yc--
