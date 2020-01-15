Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A4A13CDEB
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 21:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgAOUPk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jan 2020 15:15:40 -0500
Received: from orion.archlinux.org ([88.198.91.70]:47854 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgAOUPk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jan 2020 15:15:40 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 19A2418211E593;
        Wed, 15 Jan 2020 20:15:37 +0000 (UTC)
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
        Wed, 15 Jan 2020 20:15:36 +0000 (UTC)
Message-ID: <872d1e2f7a96fab4375f00292526a5935d3ed88b.camel@archlinux.org>
Subject: Re: [PATCH v4] HID: logitech-dj: add full support for the
 Powerplay mat/receiver
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200115200818.3198848-1-lains@archlinux.org>
References: <20200115200818.3198848-1-lains@archlinux.org>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-1CeAtvBGWXpXxJrqnAER"
Date:   Wed, 15 Jan 2020 20:15:29 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-1CeAtvBGWXpXxJrqnAER
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-01-15 at 20:08 +0000, Filipe La=C3=ADns wrote:
> The Logitech G Powerplay has a lightspeed receiver with a static
> HID++
> device with ID 7 attached to it to. It is used to configure the led
> on
> the mat. For this reason I increased the max number of devices.
>=20
> Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> ---
>=20
> v4
>=20
> - Don't define the powerplay receiver (I forgot that we already did
> that
>   in a previous patch)
>=20
> ---
>  drivers/hid/hid-logitech-dj.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> logitech-dj.c
> index bb50d6e7745b..1009f741a11d 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -16,11 +16,11 @@
>  #include <asm/unaligned.h>
>  #include "hid-ids.h"
> =20
> -#define DJ_MAX_PAIRED_DEVICES			6
> +#define DJ_MAX_PAIRED_DEVICES			7
>  #define DJ_MAX_NUMBER_NOTIFS			8
>  #define DJ_RECEIVER_INDEX			0
>  #define DJ_DEVICE_INDEX_MIN			1
> -#define DJ_DEVICE_INDEX_MAX			6
> +#define DJ_DEVICE_INDEX_MAX			7
> =20
>  #define DJREPORT_SHORT_LENGTH			15
>  #define DJREPORT_LONG_LENGTH			32
> @@ -980,6 +980,11 @@ static void logi_hidpp_recv_queue_notif(struct
> hid_device *hdev,
>  		break;
>  	}
> =20
> +	/* custom receiver device (eg. powerplay) */
> +	if (hidpp_report->device_index =3D=3D 7) {
> +		workitem.reports_supported |=3D HIDPP;
> +	}
> +
>  	if (workitem.type =3D=3D WORKITEM_TYPE_EMPTY) {
>  		hid_warn(hdev,
>  			 "unusable device of type %s (0x%02x) connected
> on slot %d",
> @@ -1850,6 +1855,10 @@ static const struct hid_device_id
> logi_dj_receivers[] =3D {
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>  		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
>  	 .driver_data =3D recvr_type_gaming_hidpp},
> +	{ /* Logitech powerplay mat/receiver (0xc539) */
> +	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +		0xc53a),
> +	 .driver_data =3D recvr_type_gaming_hidpp},
>  	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
>  	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> USB_DEVICE_ID_MX3000_RECEIVER),
>  	 .driver_data =3D recvr_type_27mhz},

Please disregard this, I will send a renamed patch with everything
fixed. Sorry for littering the list, I will be more careful in the
future.

Regards,
Filipe La=C3=ADns

--=-1CeAtvBGWXpXxJrqnAER
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl4fcuAACgkQ+JPGdIFq
qV2xLw/9HK6TU7mYZ9ava/d6K3zMztYZBog0KyWZAXAJ6CI4+nzEiEyEd2YqtvIj
FC4SH3TJAZDRGwR1upUIHg2wwLhztYSknJbRh9REK0V/lXBBKqwWURG7isb/QxB/
MmeYH4DZDCn3fAoxd1nN0T1QRNyFoxueKrHE8TvPn250kCRLc8goe+y6+VuZpA4+
S2xncgx84FHoDnf3i8hgsNHW538Gps3vrfmHGfo8gP0nBV5QSeaEtrIpOYXag1Ky
xLsZd0NwwOwax30yq40Eg3/gadvRDVdRYtBChdxSohlb242iTrZ5xzi9aFhWKCWe
5aLkxRUNucabnfF9tKl9mj878doNX6RbWiOZfehdu3qRxhcR1pq+uPIcZAl/ucax
huGlnSAkcT6DIujNS8Bax8GS9BPLrhpOKZlr5tH76ltCpiMG1NEl8he+ThEaD8R2
LZOw0jH53XSVRicab2WVmp5zUaPbmHOszwh+nUxirCVEncRFSh1OX8p8hsyTEhhw
B5eKP46Z6S6pulB4jmc2g85X20OOsbrL/xRcYEXJn/opEm/1FX7EnFghNVTUhjZR
g8b8ZRhLRF3Amb5hwvtpI/+gsakunFL+mihEf2iZyuOOZOHyYkR+zIOfN6Q3nL/q
HpNhRO5bfxTXUAvA+iv1Z8PECN3K8Z9yYjdfC14YJKjb956Ld1U=
=qp+W
-----END PGP SIGNATURE-----

--=-1CeAtvBGWXpXxJrqnAER--
