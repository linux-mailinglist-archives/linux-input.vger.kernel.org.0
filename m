Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBDAD3BCA
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 11:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfJKI7y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 04:59:54 -0400
Received: from orion.archlinux.org ([88.198.91.70]:41896 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfJKI7y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 04:59:54 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 7EF9715C23027B;
        Fri, 11 Oct 2019 08:59:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre (unknown [154.53.1.40])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Fri, 11 Oct 2019 08:59:47 +0000 (UTC)
Message-ID: <c35284f42e127a3bd276e85d9ae39a9ad1736faf.camel@archlinux.org>
Subject: Re: [PATCH v4 1/4] HID: logitech: Add MX Mice over Bluetooth
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Mazin Rezk <mnrzk@protonmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <CAO-hwJK+V=CE8_NjqRszPA6dbGq1yNJAtOAm2qmqVjgK_XzEHw@mail.gmail.com>
References: <uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPrxNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=@protonmail.com>
         <403b3e7f6d276e47c447e6ea56a3370b03c3298c.camel@archlinux.org>
         <CAO-hwJK+V=CE8_NjqRszPA6dbGq1yNJAtOAm2qmqVjgK_XzEHw@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-upEC0jVnkiha19KpY4hi"
Date:   Fri, 11 Oct 2019 09:59:46 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.34.1 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-upEC0jVnkiha19KpY4hi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-10-11 at 10:54 +0200, Benjamin Tissoires wrote:
> On Fri, Oct 11, 2019 at 10:49 AM Filipe La=C3=ADns <lains@archlinux.org>
> wrote:
> > On Fri, 2019-10-11 at 00:57 +0000, Mazin Rezk wrote:
> > > On Saturday, October 5, 2019 9:04 PM, Mazin Rezk <
> > > mnrzk@protonmail.com> wrote:
> > >=20
> > > > This patch adds support for several MX mice over Bluetooth. The
> > > > device IDs
> > > > have been copied from the libratbag device database and their
> > > > features
> > > > have been based on their DJ device counterparts.
> > >=20
> > > No changes have been made to this patch in v4. However, it should
> > > be
> > > noted
> > > that the only device that has been thoroughly tested in this
> > > patch is
> > > the
> > > MX Master (b01e). Further testing for the other devices may be
> > > required.
> > >=20
> > > Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> > > ---
> > >  drivers/hid/hid-logitech-hidpp.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >=20
> > > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> > > logitech-hidpp.c
> > > index 0179f7ed77e5..85fd0c17cc2f 100644
> > > --- a/drivers/hid/hid-logitech-hidpp.c
> > > +++ b/drivers/hid/hid-logitech-hidpp.c
> > > @@ -3773,6 +3773,24 @@ static const struct hid_device_id
> > > hidpp_devices[] =3D {
> > >       { /* MX5500 keyboard over Bluetooth */
> > >         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
> > >         .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
> > > +     { /* MX Anywhere 2 mouse over Bluetooth */
> > > +       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
> > > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > > +     { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
> > > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > > +     { /* MX Anywhere 2S mouse over Bluetooth */
> > > +       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
> > > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > > +     { /* MX Master mouse over Bluetooth */
> > > +       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
> > > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > > +     { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
> > > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > > +     { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> > > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > > +     { /* MX Master 2S mouse over Bluetooth */
> > > +       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
> > > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > >       {}
> > >  };
> > >=20
> > > --
> > > 2.23.0
> > >=20
> >=20
> > The series now looks great, thanks!
> >=20
> > Benjamin, I can confirm that up to now all BLE devices don't have
> > short
> > reports. I am not sure if you still want to only enable tested
> > devices
> > but from an architectural standpoint everything here should be
> > fine.
>=20
> Unfortunately yes, we need actual device tests:
> - this series enable 0x2121 on all of those devices (is it correct?)
> - we are not shielded from a FW error and something that goes wrong
> when enabling one of those mice with hid-logitech-hidpp.c. All of
> those mice works fine with hid-generic, and if we oversee one tiny
> bit, we'll regress for no good reasons.

Okay, makes sense :)

> Cheers,
> Benjamin
>=20
> > Mazin, you can have my
> >=20
> > Reviewed-by: Filipe La=C3=ADns <lains@archlinux.org>
> >=20
> > for the series.
> >=20
> > Thank you,
> > Filipe La=C3=ADns

--=20
Filipe La=C3=ADns

--=-upEC0jVnkiha19KpY4hi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJIBAABCAAyFiEEPc5R1gkw66R4WLpBRvYzy7DrS/IFAl2gRHUUHGxhaW5zQGFy
Y2hsaW51eC5vcmcACgkQRvYzy7DrS/Ka9BAAlb6C8hgBU1ygcDXeHmG1rnZQTZWW
yzM98dQB0IvG1PcuwVl6XKsejr9I2DHmu7BBydTT0GFSl+iTkIhaHcgqDn/rICN9
xyFZ/VeeT4gx+tg84KkwoUHNyuBcCIEeGgAqCmRgeKRn2N7Ax8uGeTaSnpUXkM0+
mHoONX/b2w73uOucayXfF29erDwT66gT5mYmXuMjAtB9U2CY+uZrm8WyBiqZxoaj
LqdgTMiIxmBRZElkDZBNz1s4n8zyMtwNZ9ehg7I8ZR7IwF+dxKV+go988rjPYVKC
Feemi/hwtVbUDxkfPDj8pdQPM5naFfiSxfTI0xGqGPQXkSqW+HU3dcyoicMs5dZa
CxKn9hfMHS+m9MRHJxHogQoKrFkAN8hK1l0LZSkKN7ncrOcKgdUexVR10Rb4nqju
YmoS4EmJkr3e0s2z1WuIPVOGjlMjjcMHzsX/lyah8JX/J2+d9om/WbThwQ4LPNqu
L8KwvFasH8BHrX0I3g4kOhataRRhxMEtR0VRFNqmRpSZlvL1Yv7NcLpcFDeihW1Z
Be/fwjB+vrvCwDEjEdte26usP6EQmx6TskFLBbtIiYtlU0DHu4Iwc2snH8OjUkVU
4e/kNOshmgirQsR7oUfpVoOQCZZ4nbCflzgBFh8dc3ezBhpysswQcIb4gzFBga3C
H9r/XCeE36cDxQs=
=qBlk
-----END PGP SIGNATURE-----

--=-upEC0jVnkiha19KpY4hi--
