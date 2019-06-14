Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC7E74609B
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 16:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbfFNOZL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 10:25:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:37574 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727913AbfFNOZK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 10:25:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0C380AD05;
        Fri, 14 Jun 2019 14:25:09 +0000 (UTC)
Message-ID: <9ff9f804a2fa3abf1249a358f64c2d39a04c8ed1.camel@suse.de>
Subject: Re: [PATCH v2] HID: input: fix a4tech horizontal wheel custom usage
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>, wbauer1@a1.net
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Date:   Fri, 14 Jun 2019 16:25:07 +0200
In-Reply-To: <CAO-hwJ+Nm+i+ehGurAxD3EQBX8-TFQ7p4J-1rV55fVA=NazgAw@mail.gmail.com>
References: <20190611121320.30267-1-nsaenzjulienne@suse.de>
         <CAO-hwJLAiC1o-kZ5epZHtO2GK+zc5x28pYbZH-XsY4yAuBmHWw@mail.gmail.com>
         <5346893.KeHrH3GHoD@linux-lf90.site>
         <CAO-hwJ+Nm+i+ehGurAxD3EQBX8-TFQ7p4J-1rV55fVA=NazgAw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-S+XhxQRa2pi0efFdyb2D"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-S+XhxQRa2pi0efFdyb2D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-06-14 at 15:36 +0200, Benjamin Tissoires wrote:
> Hi Wolfgang,
>=20
> On Thu, Jun 13, 2019 at 1:49 PM Wolfgang Bauer <wbauer@tmo.at> wrote:
> > On Tuesday, 11. Juni 2019, 16:42:37 Benjamin Tissoires wrote:
> > > On Tue, Jun 11, 2019 at 2:13 PM Nicolas Saenz Julienne
> > >=20
> > > <nsaenzjulienne@suse.de> wrote:
> > > > NOTE: I CC'd Wolfgang as he's the one who can test this.
> > >=20
> > > I'll wait for Wolfram to confirm that the patch works before pushing =
then.
> >=20
> > My name is Wolfgang, not Wolfram... ;-)
>=20
> ouch, sorry for that (I am more used to talk to the I2C maintainer appare=
ntly)
>=20
> > But never mind.
> >=20
> > I tested the patch meanwhile on top of kernel 5.2.rc4, where the mouse =
wheel
> > actually worked.
>=20
> Actually, I am a little bit lost here.
>
> The patch mentions a fix of c01908a14bf73, which is in 5.1 final.
> So if your mouse works in 5.2.rc4, I am not sure how
> HID-a4tech-fix-horizontal-scrolling.patch could break it.
>=20
> Could you be slightly more specific in what "works" and what doesn't?

Hi Benjamin,

First of all here's the descriptor:
0x05, 0x01, /*  Usage Page (Desktop),               */
0x09, 0x02, /*  Usage (Mouse),                      */
0xA1, 0x01, /*  Collection (Application),           */
0x09, 0x01, /*      Usage (Pointer),                */
0xA1, 0x00, /*      Collection (Physical),          */
0x05, 0x09, /*          Usage Page (Button),        */
0x19, 0x01, /*          Usage Minimum (01h),        */
0x29, 0x08, /*          Usage Maximum (08h),        */
0x15, 0x00, /*          Logical Minimum (0),        */
0x25, 0x01, /*          Logical Maximum (1),        */
0x75, 0x01, /*          Report Size (1),            */
0x95, 0x08, /*          Report Count (8),           */
0x81, 0x02, /*          Input (Variable),           */
0x05, 0x01, /*          Usage Page (Desktop),       */
0x09, 0x30, /*          Usage (X),                  */
0x09, 0x31, /*          Usage (Y),                  */
0x09, 0x38, /*          Usage (Wheel),              */
0x09, 0xB8, /*          Usage (B8h),                */
0x15, 0x81, /*          Logical Minimum (-127),     */
0x25, 0x7F, /*          Logical Maximum (127),      */
0x75, 0x08, /*          Report Size (8),            */
0x95, 0x04, /*          Report Count (4),           */
0x81, 0x06, /*          Input (Variable, Relative), */
0xC0,       /*      End Collection,                 */
0xC0        /*  End Collection


Sorry for the confusion, I'll try to explain the situation:

In v5.2-rc4 without "HID-a4tech-fix-horizontal-scrolling.patch" the vertica=
l
wheel works out of luck as it's mapped to REL_WHEEL_HIGH_RES, which hid-a4t=
ech
ignores and lets hid-input process, the horizontal wheel is broken. On top =
of
that Usage(0xB8) is also ignored by both hid-a4tech and hid-input as it isn=
't
mapped to anything.

There are two distinct bugs here:
  - High resolution wheel processing in hid-a4tech not being implemented,
    breaking horizontal wheels.
  - hid-a4tech not taking care of Usage(0xB8) correctly as it depended on i=
t
    being mapped to "Rel.Misc". That behaviour changed in v5.1 with "HID:
    input: add mapping for "Toggle Display" key".

Once high resolution wheel reports are fixed and handled in hid-a4tech's cu=
stom
event, the mouse breaks as it's the processing of Usage(0xB8) that triggers=
 the
input_events, which is being ignored.

You'll probably ask how come we didn't see this when
"HID-a4tech-fix-horizontal-scrolling.patch" was merged. It's due to the fac=
t it
was tested on an older kernel, v5.0.15, that didn't contain "HID: input: ad=
d
mapping for "Toggle Display" key"[1].

So that's why I added that specific fix tag. For LTS kernels, it is possibl=
e
that "Toggle Display" support was back-ported but not the high resolution
wheels support.

Hope it made things more clear.
Regards,
Nicolas

[1]=20
https://lkml.kernel.org/lkml/nycvar.YFH.7.76.1906010028440.1962@cbobk.fhfr.=
pm/T/

>=20
> Do we have the report descriptors available somewhere?
> And if not, could you run hid-recorder from
> https://gitlab.freedesktop.org/libevdev/hid-tools and attach the logs
> when you move the horizontal wheel?
>=20
> Cheers,
> Benjamin
>=20
> > As the patch didn't apply cleanly (it's obviously based upon
> >=20
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3Dabf82e8f7e9af40a49e3d905187c662a43c96c8f
, called
> > "HID-
> > a4tech-fix-horizontal-scrolling.patch" below), I added that patch as we=
ll.
> >=20
> > My results:
> > kernel 5.2.rc4 works
> > kernel 5.2.rc4 + HID-a4tech-fix-horizontal-scrolling.patch is broken
> > kernel 5.2.rc4 + HID-a4tech-fix-horizontal-scrolling.patch +
> > HID-input-fix-a4tech-horizontal-wheel-custom-usage.patch (i.e. this pat=
ch)
> > works again
> >=20
> > kernel 5.2.rc4 + HID-input-fix-a4tech-horizontal-wheel-custom-usage.pat=
ch
> > works as well.
> >=20
> > So AFAICT this patch seems to be fine.
> >=20
> > For completeness, this is my mouse as listed by lsusb:
> > Bus 003 Device 002: ID 09da:000a A4Tech Co., Ltd. Optical Mouse Opto 51=
0D /
> > OP-620D
> >=20
> > Kind Regards,
> > Wolfgang
> >=20


--=-S+XhxQRa2pi0efFdyb2D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl0DrkMACgkQlfZmHno8
x/4PhQf/VKl28QsZ28oS87F3O6GGnTvIKyZK37shy8UhJIlnxT5r9PFiyAXcEmVA
edpL/1GrPjqtIGuw/iOVduGm808eOF7OogQ/gxJUCX3khJeEfViqOsqDmaymxsso
hySWYmAk4y6jJC6J9Qv9SXsphc+1fDl1EoDkSGcFswgqra9jQAOaCcO5RizhOhRn
n0EQZbZ1tVY80UE/9oDXXegb313QqV2GmDdHfBD+9waWez1eHssjV2desiF72ykB
l4/Jyi+VkfqzSJml7+Z/RjPrMbaldEPfFMwVnVZ/4c3dFRXfTrDdJi2zCbmREP7P
XFYFcMODIFjKEAzp20U7pj/V/EPicQ==
=X1K+
-----END PGP SIGNATURE-----

--=-S+XhxQRa2pi0efFdyb2D--

