Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEDE17FF78
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 14:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgCJNtA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 09:49:00 -0400
Received: from orion.archlinux.org ([88.198.91.70]:53686 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgCJNtA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 09:49:00 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 8833519E7731B5;
        Tue, 10 Mar 2020 13:48:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.4
X-Spam-BL-Results: 
Received: from genesis (unknown [IPv6:2001:8a0:f254:2300:dad6:8c60:8394:88da])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Tue, 10 Mar 2020 13:48:56 +0000 (UTC)
Message-ID: <6c58685f039d329615d84e2df1cd2a155db73c61.camel@archlinux.org>
Subject: Re: [PATCH] add ALWAYS_POLL quirk to lenovo pixart mouse
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Tony Fischetti <tony.fischetti@gmail.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200304164700.11574-1-tony.fischetti@gmail.com>
References: <20200304164700.11574-1-tony.fischetti@gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-D18kH6Rv4f+uoa9OdL5O"
Date:   Tue, 10 Mar 2020 13:48:54 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.36.0 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-D18kH6Rv4f+uoa9OdL5O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-03-04 at 11:47 -0500, Tony Fischetti wrote:
> A lenovo pixart mouse (17ef:608d) is afflicted common the the malfunction
> where it disconnects and reconnects every minute--each time incrementing
> the device number. This patch adds the device id of the device and
> specifies that it needs the HID_QUIRK_ALWAYS_POLL quirk in order to
> work properly.
> ---
>  drivers/hid/hid-ids.h    | 1 +
>  drivers/hid/hid-quirks.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 3a400ce603c4..9e1dfc714ea8 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -726,6 +726,7 @@
>  #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
>  #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
>  #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
> +#define USB_DEVICE_ID_LENOVO_PIXART_USB_OPTICAL_MOUSE	0x608d

This ID is really ambiguous. Pixart makes the sensors for the big
majority of devices. Isn't there any other identifier you could use? If
there isn't, you could do USB_DEVICE_ID_LENOVO_MOUSE_608D.

>  #define USB_VENDOR_ID_LG		0x1fd2
>  #define USB_DEVICE_ID_LG_MULTITOUCH	0x0064
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 0e7b2d998395..247747d6d8cf 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -103,6 +103,7 @@ static const struct hid_device_id hid_quirks[] =3D {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_M912), =
HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406XE), =
HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MO=
USE_ID2), HID_QUIRK_ALWAYS_POLL },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_=
OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C007), =
HID_QUIRK_ALWAYS_POLL },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C077), =
HID_QUIRK_ALWAYS_POLL },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_KEYBOAR=
D_G710_PLUS), HID_QUIRK_NOGET },

--=20
Filipe La=C3=ADns

--=-D18kH6Rv4f+uoa9OdL5O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl5nmsIACgkQ+JPGdIFq
qV23mA//dSEx+nA96yLuiFEk1Qwyrsy9Zd7whEkUTLEXu5KFGfVl5htHPaMTBAw7
CgfR/w/sxnGjLgq3XRyDRjuPhyICNCkBuAb+X+bCXkFfA1ID+93dW/rEA5P+ZHvS
aSl6q2XuG7pKwpqBwlojm5tVMapo/QgKsOI6cBBD4pO3EehMBDc7/0TIeURkYUwx
vu1sLaF5yQZ8VdgNSRLm91NBPItRpPpY4txzBqAk87imfczF4AOPYjh58U1pvrz0
xJ/4HAC0zBrADYuc0BScXAiFLgfYOHEURPRuNnQjaULU6bY2icfc+dYMCvtQshaP
4UqXDDQ/d/cB89PazumCehSYOIMFUOQ6FEfFIGSc+doUqVoCze6W8nIa/r+B/+Py
kdv8Q1mZz70JXsoWzEQblK9q5cpKRkh7ZGV3RcCyjGreOjkD+g6LySsXW76nRCNc
r4h9jMoReILVQ0XAwUKq6p1qYbGxL7iege+C7bAs9rv/H1hBnt6cPNRBhU6nwwaw
pFLb6DSM00rjCaBtbp23x9I1ytymXYBmLJ4lbtzId/E/q3ZLGVGL7EL9733K0mbK
7okqPDppHrF8LDrk89aX840hzn7vxe4phfoD+4jElVeBO7HoHpY66FCLB2ScFZIF
ebBCzuGweSZAGTHm5SEvHAnu78rBIUA6+sFtkOBK+jeoy3JrFi8=
=p4bC
-----END PGP SIGNATURE-----

--=-D18kH6Rv4f+uoa9OdL5O--
