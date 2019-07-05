Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA8160473
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2019 12:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbfGEK2f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Jul 2019 06:28:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:43388 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727212AbfGEK2f (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Jul 2019 06:28:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 052CFB071;
        Fri,  5 Jul 2019 10:28:32 +0000 (UTC)
Message-ID: <a161110383396b4d51238bb375a7fd818c575eb3.camel@suse.de>
Subject: Re: [PATCH v2] HID: input: fix a4tech horizontal wheel custom usage
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>, wbauer1@a1.net
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Date:   Fri, 05 Jul 2019 12:28:03 +0200
In-Reply-To: <9ff9f804a2fa3abf1249a358f64c2d39a04c8ed1.camel@suse.de>
References: <20190611121320.30267-1-nsaenzjulienne@suse.de>
         <CAO-hwJLAiC1o-kZ5epZHtO2GK+zc5x28pYbZH-XsY4yAuBmHWw@mail.gmail.com>
         <5346893.KeHrH3GHoD@linux-lf90.site>
         <CAO-hwJ+Nm+i+ehGurAxD3EQBX8-TFQ7p4J-1rV55fVA=NazgAw@mail.gmail.com>
         <9ff9f804a2fa3abf1249a358f64c2d39a04c8ed1.camel@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-eqt0RDKAIGZzpzPNv9ma"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-eqt0RDKAIGZzpzPNv9ma
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-06-14 at 16:25 +0200, Nicolas Saenz Julienne wrote:
> On Fri, 2019-06-14 at 15:36 +0200, Benjamin Tissoires wrote:
> > Hi Wolfgang,
> >=20
> > On Thu, Jun 13, 2019 at 1:49 PM Wolfgang Bauer <wbauer@tmo.at> wrote:
> > > On Tuesday, 11. Juni 2019, 16:42:37 Benjamin Tissoires wrote:
> > > > On Tue, Jun 11, 2019 at 2:13 PM Nicolas Saenz Julienne
> > > >=20
> > > > <nsaenzjulienne@suse.de> wrote:
> > > > > NOTE: I CC'd Wolfgang as he's the one who can test this.
> > > >=20
> > > > I'll wait for Wolfram to confirm that the patch works before pushin=
g
> > > > then.
> > >=20
> > > My name is Wolfgang, not Wolfram... ;-)
> >=20
> > ouch, sorry for that (I am more used to talk to the I2C maintainer
> > apparently)
> >=20
> > > But never mind.
> > >=20
> > > I tested the patch meanwhile on top of kernel 5.2.rc4, where the mous=
e
> > > wheel
> > > actually worked.
> >=20
> > Actually, I am a little bit lost here.
> >=20
> > The patch mentions a fix of c01908a14bf73, which is in 5.1 final.
> > So if your mouse works in 5.2.rc4, I am not sure how
> > HID-a4tech-fix-horizontal-scrolling.patch could break it.
> >=20
> > Could you be slightly more specific in what "works" and what doesn't?
>=20
> Hi Benjamin,
>=20
> First of all here's the descriptor:
> 0x05, 0x01, /*  Usage Page (Desktop),               */
> 0x09, 0x02, /*  Usage (Mouse),                      */
> 0xA1, 0x01, /*  Collection (Application),           */
> 0x09, 0x01, /*      Usage (Pointer),                */
> 0xA1, 0x00, /*      Collection (Physical),          */
> 0x05, 0x09, /*          Usage Page (Button),        */
> 0x19, 0x01, /*          Usage Minimum (01h),        */
> 0x29, 0x08, /*          Usage Maximum (08h),        */
> 0x15, 0x00, /*          Logical Minimum (0),        */
> 0x25, 0x01, /*          Logical Maximum (1),        */
> 0x75, 0x01, /*          Report Size (1),            */
> 0x95, 0x08, /*          Report Count (8),           */
> 0x81, 0x02, /*          Input (Variable),           */
> 0x05, 0x01, /*          Usage Page (Desktop),       */
> 0x09, 0x30, /*          Usage (X),                  */
> 0x09, 0x31, /*          Usage (Y),                  */
> 0x09, 0x38, /*          Usage (Wheel),              */
> 0x09, 0xB8, /*          Usage (B8h),                */
> 0x15, 0x81, /*          Logical Minimum (-127),     */
> 0x25, 0x7F, /*          Logical Maximum (127),      */
> 0x75, 0x08, /*          Report Size (8),            */
> 0x95, 0x04, /*          Report Count (4),           */
> 0x81, 0x06, /*          Input (Variable, Relative), */
> 0xC0,       /*      End Collection,                 */
> 0xC0        /*  End Collection
>=20
>=20
> Sorry for the confusion, I'll try to explain the situation:
>=20
> In v5.2-rc4 without "HID-a4tech-fix-horizontal-scrolling.patch" the verti=
cal
> wheel works out of luck as it's mapped to REL_WHEEL_HIGH_RES, which hid-a=
4tech
> ignores and lets hid-input process, the horizontal wheel is broken. On to=
p of
> that Usage(0xB8) is also ignored by both hid-a4tech and hid-input as it i=
sn't
> mapped to anything.
>=20
> There are two distinct bugs here:
>   - High resolution wheel processing in hid-a4tech not being implemented,
>     breaking horizontal wheels.
>   - hid-a4tech not taking care of Usage(0xB8) correctly as it depended on=
 it
>     being mapped to "Rel.Misc". That behaviour changed in v5.1 with "HID:
>     input: add mapping for "Toggle Display" key".
>=20
> Once high resolution wheel reports are fixed and handled in hid-a4tech's
> custom
> event, the mouse breaks as it's the processing of Usage(0xB8) that trigge=
rs
> the
> input_events, which is being ignored.
>=20
> You'll probably ask how come we didn't see this when
> "HID-a4tech-fix-horizontal-scrolling.patch" was merged. It's due to the f=
act
> it
> was tested on an older kernel, v5.0.15, that didn't contain "HID: input: =
add
> mapping for "Toggle Display" key"[1].
>=20
> So that's why I added that specific fix tag. For LTS kernels, it is possi=
ble
> that "Toggle Display" support was back-ported but not the high resolution
> wheels support.

Hi,
Any thoughts on this?

Regards,
Nicolas


--=-eqt0RDKAIGZzpzPNv9ma
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl0fJjMACgkQlfZmHno8
x/78CQf/YcW+nGAU8CTPYU14v5EuJlIihtlFPJttPXpZxJGhrpKvBYakjV5ADC+m
eKzeONjJA7IwRNTL1QJtc+L56H8at/H9f0ny0+pc+N2cqWKNgYrzU9To1+wTtkpy
+wvsSTnPCuUhJMyCGYXukEOI1OdVUbtqixPAYNszLm/XPWGvAtMBy8kAwBYHmdJd
C3uWxuD7X7jNemBvniFBZDISwHjYK7CD9Zo0bjTQ0SZI5ZFdYMS8Kee9CUsytw/O
iwvCMiEqwKAKrCcLk+6XfYmGUHzBOnCe0gsAQ2cRMXeb2/xxwlYrl0mS3ALEbSJv
iMNIZbltK0rYSHqcsy3c6gdXtLr7OQ==
=PoYc
-----END PGP SIGNATURE-----

--=-eqt0RDKAIGZzpzPNv9ma--

