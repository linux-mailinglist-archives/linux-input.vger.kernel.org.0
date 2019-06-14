Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7967845CD5
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 14:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfFNM2i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 08:28:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:36462 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727544AbfFNM2i (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 08:28:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2C253ACEE;
        Fri, 14 Jun 2019 12:28:35 +0000 (UTC)
Message-ID: <65865f56882af2baf8389458c5e6f05096f36818.camel@suse.de>
Subject: Re: Regression post "HID: core: move Usage Page concatenation to
 Main item"
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Jean-Baptiste =?ISO-8859-1?Q?Th=E9ou?= <jb@essential.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 14 Jun 2019 14:28:33 +0200
In-Reply-To: <1ed66b4e9090b802259aa0fce5da1e22bcaeaafc.camel@suse.de>
References: <CAEXycp+Y-x7N_Yr==Xy_CT5K_a1DZYc85w1OUV+cKC5ZN+KB1g@mail.gmail.com>
         <CAEXycpKJvSsyDQjeCC4YqmtN5tpmO15g8D-_3mrunY-NL1w4Qw@mail.gmail.com>
         <1ed66b4e9090b802259aa0fce5da1e22bcaeaafc.camel@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-vXrEr9ftk5lzb+yWYfeB"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-vXrEr9ftk5lzb+yWYfeB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-06-14 at 10:52 +0200, Nicolas Saenz Julienne wrote:
> On Fri, 2019-06-14 at 09:02 +0900, Jean-Baptiste Th=C3=A9ou wrote:
> > Sorry - Please find the public link:
> >=20
> >=20
>=20
https://android.googlesource.com/platform/cts/+/master/tests/tests/hardware=
/res/raw/asus_gamepad_register.json
> > Best regards
> >=20
> > On Fri, Jun 14, 2019 at 9:01 AM Jean-Baptiste Th=C3=A9ou <jb@essential.=
com>
> > wrote:
> > > Hi,
> > >=20
> > > This patch (58e75155009cc800005629955d3482f36a1e0eec) is triggering a
> > > regression with the following descriptor (report not working as
> > > expected)
> > >=20
> > >=20
>=20
https://partner-android.googlesource.com/platform/cts/+/refs/heads/q-fs-rel=
ease/tests/tests/hardware/res/raw/asus_gamepad_register.json
> > > Didn't see anything obviously wrong with this gamepad descriptor, so
> > > not sure what's trigger the regression.
> > >=20
> > > Thanks a lot
> > >=20
> > > Best regards
>=20
> Added Benjamin to the mail thread.
>=20
> For the record here's the report descritor, I have the feeling the issue =
is
> related to the Usage Page being defined in the middle of the Usage
> ennumeration.
>=20
> 0x05, 0x01,         /*  Usage Page (Desktop),               */
> 0x09, 0x05,         /*  Usage (Gamepad),                    */
> 0xA1, 0x01,         /*  Collection (Application),           */
> 0x85, 0x01,         /*      Report ID (1),                  */
> 0x05, 0x09,         /*      Usage Page (Button),            */
> 0x0A, 0x01, 0x00,   /*      Usage (01h),                    */
> 0x0A, 0x02, 0x00,   /*      Usage (02h),                    */
> 0x0A, 0x04, 0x00,   /*      Usage (04h),                    */
> 0x0A, 0x05, 0x00,   /*      Usage (05h),                    */
> 0x0A, 0x07, 0x00,   /*      Usage (07h),                    */
> 0x0A, 0x08, 0x00,   /*      Usage (08h),                    */
> 0x0A, 0x0E, 0x00,   /*      Usage (0Eh),                    */
> 0x0A, 0x0F, 0x00,   /*      Usage (0Fh),                    */
> 0x0A, 0x0D, 0x00,   /*      Usage (0Dh),                    */
> 0x05, 0x0C,         /*      Usage Page (Consumer),          */
> 0x0A, 0x24, 0x02,   /*      Usage (AC Back),                */
> 0x0A, 0x23, 0x02,   /*      Usage (AC Home),                */
> 0x15, 0x00,         /*      Logical Minimum (0),            */
> 0x25, 0x01,         /*      Logical Maximum (1),            */
> 0x75, 0x01,         /*      Report Size (1),                */
> 0x95, 0x0B,         /*      Report Count (11),              */
> 0x81, 0x02,         /*      Input (Variable),               */
> 0x75, 0x01,         /*      Report Size (1),                */
> 0x95, 0x01,         /*      Report Count (1),               */
> 0x81, 0x03,         /*      Input (Constant, Variable),     */
> 0x05, 0x01,         /*      Usage Page (Desktop),           */
> 0x75, 0x04,         /*      Report Size (4),                */
> 0x95, 0x01,         /*      Report Count (1),               */
> 0x25, 0x07,         /*      Logical Maximum (7),            */
> 0x46, 0x3B, 0x01,   /*      Physical Maximum (315),         */
> 0x66, 0x14, 0x00,   /*      Unit (Degrees),                 */
> 0x09, 0x39,         /*      Usage (Hat Switch),             */
> 0x81, 0x42,         /*      Input (Variable, Null State),   */
> 0x66, 0x00, 0x00,   /*      Unit,                           */
> 0x09, 0x01,         /*      Usage (Pointer),                */
> 0xA1, 0x00,         /*      Collection (Physical),          */
> 0x09, 0x30,         /*          Usage (X),                  */
> 0x09, 0x31,         /*          Usage (Y),                  */
> 0x09, 0x32,         /*          Usage (Z),                  */
> 0x09, 0x35,         /*          Usage (Rz),                 */
> 0x05, 0x02,         /*          Usage Page (Simulation),    */
> 0x09, 0xC5,         /*          Usage (C5h),                */
> 0x09, 0xC4,         /*          Usage (C4h),                */
> 0x15, 0x00,         /*          Logical Minimum (0),        */
> 0x26, 0xFF, 0x00,   /*          Logical Maximum (255),      */
> 0x35, 0x00,         /*          Physical Minimum (0),       */
> 0x46, 0xFF, 0x00,   /*          Physical Maximum (255),     */
> 0x75, 0x08,         /*          Report Size (8),            */
> 0x95, 0x06,         /*          Report Count (6),           */
> 0x81, 0x02,         /*          Input (Variable),           */

Well as it was stated in 57e75155009 ("HID: core: move Usage Page concatena=
tion
to Main item"):

The spec is not pretty clear as 5.2.2.7 states "Any usage that follows
is interpreted as a Usage ID and concatenated with the Usage Page".
While 5.2.2.8 states "When the parser encounters a main item it
concatenates the last declared Usage Page with a Usage to form a
complete usage value." Being somewhat contradictory it was decided to
match Window's implementation, which follows 5.2.2.8.

This breaks the Report above as X, Y, Z and Rz will be concatenanted with t=
he
'Simulation' Usage Page as opposed to the 'Desktop' one.

Based on the USB IDs can't find much information on this Gamepad, is it a r=
eal
one? If so I guess the solution would be to fix the report descriptor in a
custom driver. Otherwise I'd suggest fixing the descriptors directly on the
test suite.

Regards,
Nicolas

> 0xC0,               /*      End Collection,                 */
> 0x85, 0x02,         /*      Report ID (2),                  */
> 0x05, 0x08,         /*      Usage Page (LED),               */
> 0x0A, 0x01, 0x00,   /*      Usage (01h),                    */
> 0x0A, 0x02, 0x00,   /*      Usage (02h),                    */
> 0x0A, 0x03, 0x00,   /*      Usage (03h),                    */
> 0x0A, 0x04, 0x00,   /*      Usage (04h),                    */
> 0x15, 0x00,         /*      Logical Minimum (0),            */
> 0x25, 0x01,         /*      Logical Maximum (1),            */
> 0x75, 0x01,         /*      Report Size (1),                */
> 0x95, 0x04,         /*      Report Count (4),               */
> 0x91, 0x02,         /*      Output (Variable),              */
> 0x75, 0x04,         /*      Report Size (4),                */
> 0x95, 0x01,         /*      Report Count (1),               */
> 0x91, 0x03,         /*      Output (Constant, Variable),    */
> 0xC0,               /*  End Collection,                     */
> 0x05, 0x0C,         /*  Usage Page (Consumer),              */
> 0x09, 0x01,         /*  Usage (Consumer Control),           */
> 0xA1, 0x01,         /*  Collection (Application),           */
> 0x85, 0x03,         /*      Report ID (3),                  */
> 0x05, 0x01,         /*      Usage Page (Desktop),           */
> 0x09, 0x06,         /*      Usage (Keyboard),               */
> 0xA1, 0x02,         /*      Collection (Logical),           */
> 0x05, 0x06,         /*          Usage Page (Device),        */
> 0x09, 0x20,         /*          Usage (20h),                */
> 0x15, 0x00,         /*          Logical Minimum (0),        */
> 0x26, 0xFF, 0x00,   /*          Logical Maximum (255),      */
> 0x75, 0x08,         /*          Report Size (8),            */
> 0x95, 0x01,         /*          Report Count (1),           */
> 0x81, 0x02,         /*          Input (Variable),           */
> 0x06, 0xBC, 0xFF,   /*          Usage Page (FFBCh),         */
> 0x0A, 0xAD, 0xBD,   /*          Usage (BDADh),              */
> 0x75, 0x08,         /*          Report Size (8),            */
> 0x95, 0x06,         /*          Report Count (6),           */
> 0x81, 0x02,         /*          Input (Variable),           */
> 0xC0,               /*      End Collection,                 */
> 0xC0                /*  End Collection                      */
>=20


--=-vXrEr9ftk5lzb+yWYfeB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl0DkvEACgkQlfZmHno8
x/4izwf/c+7uwRDjGYXX45ARiNxSrI2wzi5xiw2htXygT1ap2iK4tGg84xxNqIeV
62KH4whUUoWYSSY4Rjt7lpm9Fp/ItK0Ve5Qb1U636IsU7wFaKZ3vBGpmHHC3ZMEo
gqMlN6w8I1p0JuDuNAI4O274ld5IVaqNomiz/4EbFOqOJoTc08UOkm4Hf5issIPm
3TG2DuMd5tGpTxyOl391qRT8Ue8+OJtm27gp7WjNQuDOaWVOfAPt/TmIL8N9PCN1
+T2hmZb3OhqTZzRBu980W1HFGw20AuvOLc9ZP1hZ8OqLc64iWhRmI+PCjW5jvSUu
B0VOHJAG5MM1SyxYU8tJXlaV21AfBg==
=cMFj
-----END PGP SIGNATURE-----

--=-vXrEr9ftk5lzb+yWYfeB--

