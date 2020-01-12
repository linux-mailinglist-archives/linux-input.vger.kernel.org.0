Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9194138848
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2020 21:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732914AbgALUyc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jan 2020 15:54:32 -0500
Received: from orion.archlinux.org ([88.198.91.70]:34282 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732825AbgALUyc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jan 2020 15:54:32 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 5063E1813D7AE2;
        Sun, 12 Jan 2020 20:54:30 +0000 (UTC)
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
        Sun, 12 Jan 2020 20:54:29 +0000 (UTC)
Message-ID: <a69fce19ca3fe0c1f27c66b2444dc82891e8cf41.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for the Powerplay
 mat/receiver
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200112205021.3004703-1-lains@archlinux.org>
References: <20200112205021.3004703-1-lains@archlinux.org>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-lEnwmwvdKE79Ibcub5po"
Date:   Sun, 12 Jan 2020 20:54:22 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-lEnwmwvdKE79Ibcub5po
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-01-12 at 20:50 +0000, Filipe La=C3=ADns wrote:
> The Logitech G Powerplay has a lightspeed receiver with a static
> HID++
> device with ID 7 attached to it to. It is used to configure the led
> on
> the mat. For this reason I increased the max number of devices.
>=20
> I also marked all lightspeed devices as HID++ compatible. As the
> internal powerplay device does not have REPORT_TYPE_KEYBOARD or
> REPORT_TYPE_KEYBOARD it was not being marked as HID++ compatible in
  ^^^^^^^^^^^^^^^^^^^^
   REPORT_TYPE_MOUSE

Err, should I send another patch?

> logi_hidpp_dev_conn_notif_equad.
>=20
> Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-dj.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> logitech-dj.c
> index bb50d6e7745b..732380b55b15 100644
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
> @@ -971,7 +971,7 @@ static void logi_hidpp_recv_queue_notif(struct
> hid_device *hdev,
>  	case 0x0c:
>  		device_type =3D "eQUAD Lightspeed 1";
>  		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report,
> &workitem);
> -		workitem.reports_supported |=3D STD_KEYBOARD;
> +		workitem.reports_supported |=3D STD_KEYBOARD | HIDPP;
>  		break;
>  	case 0x0d:
>  		device_type =3D "eQUAD Lightspeed 1_1";
> @@ -1850,6 +1850,10 @@ static const struct hid_device_id
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

--=20
Filipe La=C3=ADns

--=-lEnwmwvdKE79Ibcub5po
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl4bh34ACgkQ+JPGdIFq
qV2a2hAAnJZ+LA8ZpZCF4ghG7ZaqqBWXAegZqy0G1DsIUSM+A+EY2/SC27oxadZC
S7uxGuvkIChGuVv4rYXnvYEaTwo1pw+nA7+Oe769yC1ggpMvmVHnge5K2zao6rQT
njnQ2QPvEj1nBTSPwq798r/bH2v0nYjejQ98yJ51wWLFWkZ22B7gwVeCYWzsfyPq
Wdt/Cf7XllqRrHo7+HqPZaMneCMlJVd//rI2TPjgVDDBKxWxBfgOiKE4VMHel2hj
PtQ+lFf/y+9y4s1VWVFRDEEx5rHT4Ws4eRkQ5WcC937pzIAa7g+eVUEME/0cFjiM
r8lj8HGXaINg1okLg0pgo4HG2aGpyMnaxTjQ5FKdkAlTAmyKhcpmbQgpKIr695xt
tks37HDRO39NAdIjVGwgrplPSvoHQMJ3S92qrfUAmFXDfNMN5099u4cAlT+tl3Wa
s05hatOsrlpzKxofvPPg1XoqpuITpt3jETmbLY+0xHx5l5PhaYWlVXqlX8d6AD/Q
h6PYDDWpJ4VyJU8iJxNJOla0mLoxD3/fIw90+9UN8rO8hkX853PqyHOad3Ri+NC0
yTa1EVV3d9P3xUOGHs1G9O7H5QTwtnnq4SFb3/C2wYePmSB1yTaDRkKeAtp/kchL
rR8hIzl8hTDLD/X/JjOixFuAL4SXf74YuXx1q0O9ugyNXmIj+gc=
=sU5W
-----END PGP SIGNATURE-----

--=-lEnwmwvdKE79Ibcub5po--
