Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD28374B46
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 00:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbhEEWeQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 18:34:16 -0400
Received: from mout02.posteo.de ([185.67.36.66]:56365 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234216AbhEEWeQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 18:34:16 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 43F092400FE
        for <linux-input@vger.kernel.org>; Thu,  6 May 2021 00:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1620253997; bh=d+MZ3M5ofwIO07iwMxuy4XLtX9nFR+ntHe40O3nLLz8=;
        h=Date:From:To:Cc:Subject:From;
        b=TBzpjjEreXHv3ipY1qqVq3iWprn9CdXgzoRLEmxOxZoWMQv/Mo/dUzMkAm6jBmnVk
         RX5anutFxM3x5Dxrpakgc0tyUBxGCnP6rZIbCsdLM5G48N+e9XWJ96Nw99MC3U1q/G
         MqTFFCESuNrQ5WwFRZafaCheCBwJ7o75UAimKrbiCxyi3szNNDnwHOZpSmdM5ffDXy
         pj+M7r/V3lI2j9z9EAYrsEgyZKINA4N6yudos/TWpHUM/NhpgMrAd/E9Q4dnJoB9ms
         EqkKnYDTZICCqO/BMoKIcRusC+aVXS6ykfVzTqFx2E5DL7Ut8xmc/P5CFPy3vKkhAd
         ONdWWtncR0FOA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4FbBLh1N4Dz9rxH;
        Thu,  6 May 2021 00:33:16 +0200 (CEST)
Date:   Wed,  5 May 2021 22:33:15 +0000
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] HID: wiiu-drc: Add a driver for this gamepad
Message-ID: <YJMdK8zQR7Al3wWC@latitude>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210502232836.26134-2-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UliBZUaNN8NDi4/o"
Content-Disposition: inline
In-Reply-To: <20210502232836.26134-2-linkmauve@linkmauve.fr>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--UliBZUaNN8NDi4/o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

some mostly trivial remarks and questions of curiosity below, because
I'm not very qualified to review the input subsystem side of things.


On Mon, May 03, 2021 at 01:28:32AM +0200, Emmanuel Gil Peyrot wrote:
> From: Ash Logan <ash@heyquark.com>
>=20
> This driver is for the DRC (wireless gamepad) when plugged to the DRH of
> the Wii=C2=A0U, a chip exposing it as a USB device.

s/plugged/wirelessly connected/, rather

>=20
> This first patch exposes the buttons and sticks of this device, so that
> it can act as a plain game controller.
>=20
> Signed-off-by: Ash Logan <ash@heyquark.com>
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---

Out of curiosity:

Do the HID reports travel over the wireless link from DRC to DRH, or are
they formed in DRH firmware?

Is there a reference of the device-specific HID format? I briefly looked
at https://libdrc.org/docs/index.html but couldn't find it there.


>  drivers/hid/Kconfig        |   7 +
>  drivers/hid/Makefile       |   1 +
>  drivers/hid/hid-ids.h      |   1 +
>  drivers/hid/hid-quirks.c   |   3 +
>  drivers/hid/hid-wiiu-drc.c | 270 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 282 insertions(+)
>  create mode 100644 drivers/hid/hid-wiiu-drc.c
>=20
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 4bf263c2d61a..01116c315459 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1105,6 +1105,13 @@ config HID_WACOM
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called wacom.
> =20
> +config HID_WIIU_DRC
> +	tristate "Nintendo Wii U gamepad over internal DRH"

                                 gamepad (DRC)

=2E.. so it's clearer where the "DRC" name comes from.

> +#if IS_ENABLED(CONFIG_HID_WIIU_DRC)
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_W=
IIU_DRH) },
> +#endif

Is the DRC connection the only USB function that the DRH provides?


> +++ b/drivers/hid/hid-wiiu-drc.c
> @@ -0,0 +1,270 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * HID driver for Nintendo Wii U gamepad, connected via console-internal=
 DRH

                                    gamepad (DRC)


> +static int drc_raw_event(struct hid_device *hdev, struct hid_report *rep=
ort,
> +	 u8 *data, int len)
> +{
> +	struct drc *drc =3D hid_get_drvdata(hdev);
> +	int i;
> +	u32 buttons;
> +
> +	if (len !=3D 128)
> +		return 0;

=46rom include/linux/hid.h:

 * raw_event and event should return negative on error, any other value will
 * pass the event on to .event() typically return 0 for success.

Not sure if returning 0 as you do above is appropriate.


> +static bool drc_setup_joypad(struct drc *drc,
> +		struct hid_device *hdev)
> +{
> +	struct input_dev *input_dev;
> +
> +	input_dev =3D allocate_and_setup(hdev, DEVICE_NAME " Joypad");

"Nintendo Wii U gamepad Joypad" looks a bit sub-optimal, but I'm not
sure about the conventions here.


> +
> +	/* These two buttons are actually TV control and Power. */
> +	set_bit(BTN_Z, input_dev->keybit);
> +	set_bit(BTN_DEAD, input_dev->keybit);

Hmm... from what I've deen the TV control button opens a menu on the
gamepad itself. Does it send the input event in addition to that?
Or is there a mode where it opens the TV menu, and a mode where it
forwards the button press to the Wii U?


> +MODULE_AUTHOR("Ash Logan <ash@heyquark.com>");

Since you're submitting the driver, rather than Ash, maybe adjust the
author field here? (totally your choice.)



Thanks,
Jonathan

--UliBZUaNN8NDi4/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmCTHSQACgkQCDBEmo7z
X9t++RAAwxOQRI2oNPSUdt7rAOrLcMc9ZeL6ypOzM/0lItKzqPAKcNcmQFmEvT0N
+HPm95oRc7qWZLpe68aIB+Nps9mXuAIb11UPAWHdX5f+8O3zmVoQG1COt+ogFXBH
D7Q/vUq506uiaIC0aIEP6HQ00UeZ6UdFBMQYMch/pi6CbcnVn7ff2eeUoDQtVV1A
nx9n+LNc9pyf3ordf7i3PjpHcb4v+AxU9uhkhq0RMA1Mfea78lrKgjpQxwLhO2xk
q5JMlcVf23AefWeHMvTTtuahkFYcPHSu3v8lX45Hl52trWqO0I1MiS0KV7AnZS4R
tICoumo6SlkYwEKnT2TNvPbhAK/1RWXL7n+SMcKWY7fgAO29E8e42pimO7rDeN7d
TWxilNm+hDgubY20XiMsKtmXb6/FjucXDYK9c55O6chcSg43JABmYN2YHF/8NL21
2KYcof5lVh0HUiB7p7qARvojGk10+8YlFotvzRrI5JLnFQVDCrFAwGc+V+J44I1B
Z6PB8W7ZTiPvmC/77G2gCm/OKnBdcP9MqhdZ9E4I+huUPv/c213EPNdj8aBljmAQ
GxTg1GjLX4BEE/rcuSdJGLZ3eXGkRSpwKOxuQHh5B+qz7Lv05JaouRGwr9fIRBOd
CDiDQpMrNO1LlYHQWJKlWuE3WjSL5WsykKA+hsuYpsxYsT7PF54=
=zEtj
-----END PGP SIGNATURE-----

--UliBZUaNN8NDi4/o--
