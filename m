Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E774ACD25D
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2019 17:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfJFPIM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Oct 2019 11:08:12 -0400
Received: from orion.archlinux.org ([88.198.91.70]:55626 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfJFPIL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Oct 2019 11:08:11 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 5E61215A9B9BEC;
        Sun,  6 Oct 2019 15:08:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre (unknown [79.140.127.125])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Sun,  6 Oct 2019 15:08:00 +0000 (UTC)
Message-ID: <c440435a1fb8a04a9fca83f17b7cc1ebb95bcc44.camel@archlinux.org>
Subject: Re: [PATCH v3 1/4] HID: logitech: Add MX Mice over Bluetooth
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Mazin Rezk <mnrzk@protonmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <l7xYjnA9EGfZe03FsrFhnH2aMq8qS8plWhHVvOtY_l4ShZ1NV6HA6hn9aI-jAzbLYUGFCIQCIKkx9z42Uoj4-AZDwBfRcAecYIn-0ZA5upE=@protonmail.com>
References: <l7xYjnA9EGfZe03FsrFhnH2aMq8qS8plWhHVvOtY_l4ShZ1NV6HA6hn9aI-jAzbLYUGFCIQCIKkx9z42Uoj4-AZDwBfRcAecYIn-0ZA5upE=@protonmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-4zPzoW7jzVovkqYvJJGf"
Date:   Sun, 06 Oct 2019 16:07:59 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.34.0 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-4zPzoW7jzVovkqYvJJGf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2019-10-06 at 01:04 +0000, Mazin Rezk wrote:
> This patch adds support for several MX mice over Bluetooth. The device ID=
s
> have been copied from the libratbag device database and their features
> have been based on their DJ device counterparts.
>=20
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 0179f7ed77e5..85fd0c17cc2f 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3773,6 +3773,24 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
>  	{ /* MX5500 keyboard over Bluetooth */
>  	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
>  	  .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
> +	{ /* MX Anywhere 2 mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
> +	  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
> +	  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ /* MX Anywhere 2S mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
> +	  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ /* MX Master mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
> +	  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
> +	  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> +	  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ /* MX Master 2S mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
> +	  .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>  	{}
>  };
>=20
> --
> 2.23.0

I think you should only add the mice you tested. We are not sure if
this devices actually do work properly with the current stack. I will
try to test some devices after Tuesday.

Filipe La=C3=ADns

--=-4zPzoW7jzVovkqYvJJGf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl2aA0UACgkQ+JPGdIFq
qV2tShAAmhubw9I/kSIhhapRmz2G0cNdy0pa2TS5Aai1RQulADup1aIHEAQpH+dW
WxeNSeNkuB0pFgGIw+weOmuvvV5H2M+J+K+dWxdfuM08lJmmXSIbJBXSkDy0FZLd
8Ausxvwg+RHVPmVhQg7h6pe3FpLEKEpM0T/D8cvyUGJmbbCNgBtz12sltY4XKyo/
tOJ0g0TU4STocg722fFYaQCh2MeBQzCj5qIMITM84Q7Wv7GUSIbVHmYfBHbC7EvY
wyJEkX2y12HQeJOsUVYPMArmzVX0xqe/v72V8m0lpNH55KUYzzy5HFqqzKzEq1v0
FTCJHdIZRoDIKz4rd85175v2hEnsdEju9dD0UmfGPbasvaMQb6qxYRMMlve7G+tg
bzblD6UgD7sU7jsmFdj/Cnu5gxQqZqT6GfENLtK7IFy6fFURtR5qxnGUZuxh6j3m
o8CyPDjp2dwt+k6jpOUmFXinMw0oqpUD0g1pJ3jkVy8XEiMRIsrMt141B+osmJYT
ZOHpRSARTh1WkTBxi7mfFNh9TOYxur+6llGIdReKYtfLTQyN73Ae+FQexjsf8beQ
4xB4/9C8e3tBV5ApxcHhDrt5EqOW84gMD54tDL93GeGsAVlLDTB6jvrrTIlW+GKk
A2I1ZQwChJYunDEIO8eXxqBePp2qPZSwu2SkUGIhLugDN8byS6s=
=QMFT
-----END PGP SIGNATURE-----

--=-4zPzoW7jzVovkqYvJJGf--
