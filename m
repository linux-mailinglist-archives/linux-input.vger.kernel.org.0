Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B12A21578E
	for <lists+linux-input@lfdr.de>; Mon,  6 Jul 2020 14:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgGFMr1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 08:47:27 -0400
Received: from orion.archlinux.org ([88.198.91.70]:46772 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgGFMr1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 08:47:27 -0400
X-Greylist: delayed 422 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jul 2020 08:47:25 EDT
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 9E11B1D358CA74;
        Mon,  6 Jul 2020 12:40:21 +0000 (UTC)
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
        Mon,  6 Jul 2020 12:40:20 +0000 (UTC)
Message-ID: <22e627b3b9ebef768c50ab6519278e61217b8575.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech: Use HIDPP_RECEIVER_INDEX instead of 0xff
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Mazin Rezk <mnrzk@protonmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
In-Reply-To: <FW0Ps9vggIuA-9asmWgfQkNKSlcwuAhNfFXxK3QGSu4uJRAEykUGdoL5sbJsAlehWv__Eq4LKejp0QpxQRj5LYn5tOrVRDbjrcn3JVDGLAQ=@protonmail.com>
References: <FW0Ps9vggIuA-9asmWgfQkNKSlcwuAhNfFXxK3QGSu4uJRAEykUGdoL5sbJsAlehWv__Eq4LKejp0QpxQRj5LYn5tOrVRDbjrcn3JVDGLAQ=@protonmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-/WyPnc9eaHFQuRQ9WKqk"
Date:   Mon, 06 Jul 2020 13:40:09 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.36.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-/WyPnc9eaHFQuRQ9WKqk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-07-05 at 02:48 +0000, Mazin Rezk wrote:
> Some parts of hid-logitech-dj explicitly referred to 0xff for the
> receiver index. This patch changes those references to the
> HIDPP_RECEIVER_INDEX definition.
>=20
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> logitech-dj.c
> index 48dff5d6b605..a78c13cc9f47 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1153,7 +1153,7 @@ static int
> logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
>  	if (!dj_report)
>  		return -ENOMEM;
>  	dj_report->report_id =3D REPORT_ID_DJ_SHORT;
> -	dj_report->device_index =3D 0xFF;
> +	dj_report->device_index =3D HIDPP_RECEIVER_INDEX;
>  	dj_report->report_type =3D REPORT_TYPE_CMD_GET_PAIRED_DEVICES;
>  	retval =3D logi_dj_recv_send_report(djrcv_dev, dj_report);
>  	kfree(dj_report);
> @@ -1175,7 +1175,7 @@ static int
> logi_dj_recv_switch_to_dj_mode(struct dj_receiver_dev *djrcv_dev,
>=20
>  	if (djrcv_dev->type =3D=3D recvr_type_dj) {
>  		dj_report->report_id =3D REPORT_ID_DJ_SHORT;
> -		dj_report->device_index =3D 0xFF;
> +		dj_report->device_index =3D HIDPP_RECEIVER_INDEX;
>  		dj_report->report_type =3D REPORT_TYPE_CMD_SWITCH;
>  		dj_report->report_params[CMD_SWITCH_PARAM_DEVBITFIELD]
> =3D 0x3F;
>  		dj_report-
> >report_params[CMD_SWITCH_PARAM_TIMEOUT_SECONDS] =3D
> @@ -1204,7 +1204,7 @@ static int
> logi_dj_recv_switch_to_dj_mode(struct dj_receiver_dev *djrcv_dev,
>  	memset(buf, 0, HIDPP_REPORT_SHORT_LENGTH);
>=20
>  	buf[0] =3D REPORT_ID_HIDPP_SHORT;
> -	buf[1] =3D 0xFF;
> +	buf[1] =3D HIDPP_RECEIVER_INDEX;
>  	buf[2] =3D 0x80;
>  	buf[3] =3D 0x00;
>  	buf[4] =3D 0x00;
> --
> 2.27.0

This is correct :)

Reviewed-by: Filipe La=C3=ADns <lains@archlinux.org>

Cheers,
Filipe La=C3=ADns

--=-/WyPnc9eaHFQuRQ9WKqk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl8DG6kACgkQ+JPGdIFq
qV1UBg//eqSKIXFbyMjShmQQySiGxq0hVM4CoIrhhOm7inq2j5LBiXXAdDOgkCHa
jIxeN8hjrdkkt1wXNe0jq6jw2nPrhTCmocCuiWrQf0uzSYB3TLanQeoGr6JT05Rc
Ngu7+PL+ZgdeZrDf69C/0iSwH/OkIsoZXZAUOOHFAkFNHj1Rvfa0aN615Fywusye
f0DClrShi5P4NTjWbqwU3URCMAaQMg+/GpuuaZ/Txapel4WEX1Ky4EgjyHaYksWp
wTfxb9HmkuEavhNqhyWnu17x3OTolBFmdGI+4SRo2mqr4ToS3Sdy4V/4RDNrJ37R
/LS7cmqQyb0H+F4RY32OFLSW4prXURoaTzQDsvRdp1tsDwAykxZj91IgT9pDA2LK
HPLCcR10RKgs5KLhXM/tpQOj9ebr6ejzX1+yE53tedTb993c6WlKAjlVNRY6GtJf
gsnMAPBXHYfbBF19Zg+yNj1rMoByCPQ2KT/xing7bu7WkL0MkTLc8OQ1ZWh89yMK
lA+G9cLXlZytUBCNgiUdIseqX218h8CQ+KNRnAfdzxjk5oVcioJ57Y1gRJWirioo
hs3o0nXgJxkF2cwsVzhEaY03HVcvlwEpegSqMP+NuZY65hifbQnWuyOiTJHH8FcI
a4EgqvCh/ScAzn9aeLGCZNA7+bDR/HZi34h1gUyn5K2kuPfRoEw=
=16ci
-----END PGP SIGNATURE-----

--=-/WyPnc9eaHFQuRQ9WKqk--
