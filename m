Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70038156747
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2020 20:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgBHTIG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 8 Feb 2020 14:08:06 -0500
Received: from orion.archlinux.org ([88.198.91.70]:57682 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727442AbgBHTIG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 8 Feb 2020 14:08:06 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 1E77018C13328B;
        Sat,  8 Feb 2020 19:08:01 +0000 (UTC)
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
        Sat,  8 Feb 2020 19:08:00 +0000 (UTC)
Message-ID: <a6a6975b252fa3bbc195c9da1773e08bee2bbee0.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-dj: add support for the static device in
 the Powerplay mat/receiver
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200115201811.3271284-1-lains@archlinux.org>
References: <20200115201811.3271284-1-lains@archlinux.org>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-c9rqFbxXMbunNNfmVja8"
Date:   Sat, 08 Feb 2020 19:07:59 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-c9rqFbxXMbunNNfmVja8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-01-15 at 20:18 +0000, Filipe La=C3=ADns wrote:
> The Logitech G Powerplay has a lightspeed receiver with a static
> HID++
> device with ID 7 attached to it to. It is used to configure the led
> on
> the mat. For this reason I increased the max number of devices.
>=20
> Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-dj.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> logitech-dj.c
> index bb50d6e7745b..79294b873057 100644
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

Benjamin, is there any updates on this? Were you able to test it?

Thank you,
Filipe La=C3=ADns

--=-c9rqFbxXMbunNNfmVja8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl4/BwoACgkQ+JPGdIFq
qV1Cbg/+MeCEKsPnT0W21kdI41r2i3RpQ4xA0BU4QNtvbniTOGWJdfa/QgIZYxvl
OcVzF45pvRo6f9tXcrf42eKfbBagvH6n6vNzwwyvibRMLt2VAFepTImSUJ48z5/j
KexWVeLechB2D+LlIXTw2+cMW3iuVDk8NTfEjjNoTmXyNd4LJTnzAqMcTVJfWtME
tYWsHf57kU5p1K1R8Sj4wwSLssABuClnuSc4dCRhYAGnSvGPOf/ch/iB9QLws0b1
V2CN+PicZpo1CQZB6WhqZ83pRPnc/kgOZdiZlxzognLVRhkAIVhoHkKt9VrjV4hM
WKxmYgw3/tEkzobbHamG7L67neCA6wKU4RCLyF+FZ8vIPdSZUVuZhZJ6FV75sXhu
OVvb5gdjeyWoHI35WaDWk+Cb55C+P3h4khWJnBb26uQuhkxfBEXrO1mamGHZmb8J
A74Sq1BYea4aaDkq0t0nZ4AnfweojAqjymMpwYKgvaq+spo7cq5WJEPgGCq3VFKr
ua5WeSO45VW2hmkoE3Q+jVsYIz1nUYOMBAaqv6F9OS+g7bCDCspIkOPsERcz/pk3
fGye6ODJDL+PvMTNUJBMRGC2pUGFqIFHoh38RN/k15w7lLPAQQzkvBocQBvwhzwV
c+bS5wtWm6XzLN2KpXVW+tGn725PdmLlvDJMXUBjWH2mkwPLUcI=
=Zl2K
-----END PGP SIGNATURE-----

--=-c9rqFbxXMbunNNfmVja8--
