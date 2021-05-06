Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5ABD375201
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 12:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhEFKIL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 06:08:11 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:49506 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbhEFKIL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 06:08:11 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id C2EB0F4059A; Thu,  6 May 2021 12:07:05 +0200 (CEST)
Date:   Thu, 6 May 2021 12:07:05 +0200
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc:     linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] HID: wiiu-drc: Add a driver for this gamepad
Message-ID: <20210506100705.5bcpywy25kfqwgkn@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210502232836.26134-2-linkmauve@linkmauve.fr>
 <YJMdK8zQR7Al3wWC@latitude>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jtw7k5qsxufz3nus"
Content-Disposition: inline
In-Reply-To: <YJMdK8zQR7Al3wWC@latitude>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--jtw7k5qsxufz3nus
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 10:33:15PM +0000, Jonathan Neusch=C3=A4fer wrote:
> Hi,

Hi,

>=20
> some mostly trivial remarks and questions of curiosity below, because
> I'm not very qualified to review the input subsystem side of things.

Thanks for the questions anyway, I can probably make things clearer in
the patch thanks to them. :)

[=E2=80=A6]
> Out of curiosity:
>=20
> Do the HID reports travel over the wireless link from DRC to DRH, or are
> they formed in DRH firmware?

This HID report is a 1:1 copy of what the DRC sends, with no
modification that I could find.

>=20
> Is there a reference of the device-specific HID format? I briefly looked
> at https://libdrc.org/docs/index.html but couldn't find it there.

You were very close, the input report is described here:
https://libdrc.org/docs/re/sc-input.html

This project wrote a userland driver for using the DRC without the DRH,
but it requires a very specific wifi chip which makes it quite
cumbersome to use.

>=20
>=20
> >  drivers/hid/Kconfig        |   7 +
> >  drivers/hid/Makefile       |   1 +
> >  drivers/hid/hid-ids.h      |   1 +
> >  drivers/hid/hid-quirks.c   |   3 +
> >  drivers/hid/hid-wiiu-drc.c | 270 +++++++++++++++++++++++++++++++++++++
> >  5 files changed, 282 insertions(+)
> >  create mode 100644 drivers/hid/hid-wiiu-drc.c
> >=20
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index 4bf263c2d61a..01116c315459 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -1105,6 +1105,13 @@ config HID_WACOM
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called wacom.
> > =20
> > +config HID_WIIU_DRC
> > +	tristate "Nintendo Wii U gamepad over internal DRH"
>=20
>                                  gamepad (DRC)
>=20
> ... so it's clearer where the "DRC" name comes from.

Will do in v2.

>=20
> > +#if IS_ENABLED(CONFIG_HID_WIIU_DRC)
> > +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO=
_WIIU_DRH) },
> > +#endif
>=20
> Is the DRC connection the only USB function that the DRH provides?

As far as I know, yes.

But the DRC also sends microphone and camera data, which gets exposed by
the DRH, but juuuuuust not quite standard enough to work as is using
snd_usb_audio or uvcvideo.  There is also a NFC reader which no one has
reversed yet to my knowledge.

There are two DRCs exposed by the DRH, despite only one of them being
bundled with each Wii=C2=A0U, and no game ever making use of more.

>=20
>=20
> > +++ b/drivers/hid/hid-wiiu-drc.c
> > @@ -0,0 +1,270 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * HID driver for Nintendo Wii U gamepad, connected via console-intern=
al DRH
>=20
>                                     gamepad (DRC)

Ack, will be fixed in v2.

>=20
>=20
> > +static int drc_raw_event(struct hid_device *hdev, struct hid_report *r=
eport,
> > +	 u8 *data, int len)
> > +{
> > +	struct drc *drc =3D hid_get_drvdata(hdev);
> > +	int i;
> > +	u32 buttons;
> > +
> > +	if (len !=3D 128)
> > +		return 0;
>=20
> From include/linux/hid.h:
>=20
>  * raw_event and event should return negative on error, any other value w=
ill
>  * pass the event on to .event() typically return 0 for success.
>=20
> Not sure if returning 0 as you do above is appropriate.

Oops, thanks for noticing, this will be fixed in v2.

>=20
>=20
> > +static bool drc_setup_joypad(struct drc *drc,
> > +		struct hid_device *hdev)
> > +{
> > +	struct input_dev *input_dev;
> > +
> > +	input_dev =3D allocate_and_setup(hdev, DEVICE_NAME " Joypad");
>=20
> "Nintendo Wii U gamepad Joypad" looks a bit sub-optimal, but I'm not
> sure about the conventions here.

"Nintendo Wii U gamepad buttons and sticks" would be better I think.

>=20
>=20
> > +
> > +	/* These two buttons are actually TV control and Power. */
> > +	set_bit(BTN_Z, input_dev->keybit);
> > +	set_bit(BTN_DEAD, input_dev->keybit);
>=20
> Hmm... from what I've deen the TV control button opens a menu on the
> gamepad itself. Does it send the input event in addition to that?
> Or is there a mode where it opens the TV menu, and a mode where it
> forwards the button press to the Wii U?

It does draw a line of text near the bottom of the screen, saying =E2=80=9C=
TV
Remote can be configured in System Settings.=E2=80=9D, but also sends the b=
utton
as a normal button in the report.  It could be possible to change its
behaviour (in System Settings perhaps?) but so far I=E2=80=99ve been avoidi=
ng
interacting with the proprietary OS.

The power button also has a special behaviour: when it is held for four
seconds, it will power off the DRC.

>=20
>=20
> > +MODULE_AUTHOR("Ash Logan <ash@heyquark.com>");
>=20
> Since you're submitting the driver, rather than Ash, maybe adjust the
> author field here? (totally your choice.)

I=E2=80=99ll ask them, I=E2=80=99m perfectly fine with becoming the author,=
 but they
wrote most of that code, I only fixed the last few missing pieces and
did some cleanup.

>=20
>=20
>=20
> Thanks,
> Jonathan

Thanks!

--=20
Emmanuel Gil Peyrot

--jtw7k5qsxufz3nus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmCTv8AACgkQOWgfYkb2
LpCeaAf/X3dtreCXE5NVSLSA0zloCS5Y7WAPlshsE2Zc8NCVKcRPNamkHSFWtENf
+OkJ6mZyQ8dGBEwqlrxPMyn1mL8FnIgvZOeNfIzCbNcodpdfLoL+noM+7hrOQRUj
0vACbVkhCVYT3Gu9cDE9/2wQLHnvm/W1u4RWeWO2YLb+hjFzyWx4DmE2AdL2KeWw
gy9BDiH6eao3StD3p1mhuMtg9YQD5Dj6C+c0hvzNRx9933fS+CvBsEQqVNpCdczi
giGJ9vbngW83Y+OcRcfJIMwL4yKsI/ABngFwy6t4IWIN1lP73o5T56Kei6y0idlO
kBHFMKSy3SAq/MVOyBsUIhv871tnXw==
=F43R
-----END PGP SIGNATURE-----

--jtw7k5qsxufz3nus--
