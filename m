Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6724218A312
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 20:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgCRTXQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 15:23:16 -0400
Received: from orion.archlinux.org ([88.198.91.70]:43296 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgCRTXP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 15:23:15 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id E11721A33B3EAB;
        Wed, 18 Mar 2020 19:23:12 +0000 (UTC)
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
        Wed, 18 Mar 2020 19:23:11 +0000 (UTC)
Message-ID: <5404e421520419a8031593179798b95bd0970bd8.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-dj: issue udev change event on device
 connection
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <superm1@gmail.com>,
        Richard Hughes <hughsient@gmail.com>
In-Reply-To: <20200318161906.3340959-1-lains@archlinux.org>
References: <20200318161906.3340959-1-lains@archlinux.org>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-ciTeMDtrJBxBOS7lKYqJ"
Date:   Wed, 18 Mar 2020 19:23:10 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.36.0 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-ciTeMDtrJBxBOS7lKYqJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-03-18 at 16:19 +0000, Filipe La=C3=ADns wrote:
> As discussed in the mailing list:
>=20
> > Right now the hid-logitech-dj driver will export one node for each
> > connected device, even when the device is not connected. That
> > causes
> > some trouble because in userspace we don't have have any way to
> > know if
> > the device is connected or not, so when we try to communicate, if
> > the
> > device is disconnected it will fail.
>=20
> The solution reached to solve this issue is to trigger an udev change
> event when the device connects, this way userspace can just wait on
> those connections instead of trying to ping the device.
>=20
> Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-dj.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> logitech-dj.c
> index 48dff5d6b605..fcd481a0be1f 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1464,6 +1464,8 @@ static int logi_dj_dj_event(struct hid_device
> *hdev,
>  		if (dj_report-
> >report_params[CONNECTION_STATUS_PARAM_STATUS] =3D=3D
>  		    STATUS_LINKLOSS) {
>  			logi_dj_recv_forward_null_report(djrcv_dev,
> dj_report);
> +		} else {
> +			kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
>  		}
>  		break;
>  	default:

Just noticed I was issuing the udev event on the receiver instead of
the connected device. I will send a v2.

Filipe La=C3=ADns

--=-ciTeMDtrJBxBOS7lKYqJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl5ydR4ACgkQ+JPGdIFq
qV1RJBAAj8gSKs5gc9e2B7HN6c0ThwipBVm0xPCzfKpvXHga7vYi5ouUNcfCxQoo
wLEbEtbkUWjxh/ooQQEudjA5PBCDIkcjrNpxttxEZuVM2UPrGLYKvnRusV8cCxnR
o08Rgbx+882R0me5IMl1806TUfF8bPk3bhKXn7pry1sCAl0I2uYJGCoNU17e8DDC
Q0c8IZg4+Kd1vEOJ9GjmFV4Tx4lX4m8kqZsxZ0Ku0KDdjM4mM9CDAT4Zh0oRfcce
nfEs2I1w1a/aJRaIAI6VWFgaqXauSA+DTKeS/slit64tLdWhOhL6xbtOqCTqqPgv
hkDISj8IZ6BDfkTWAp5ttxvm79m9qI7iK8GVX6KqLzBtuFHm1Xm4OnTMLFZMu8vi
DrfqMrgezkoczFQja8PttcfITJQ/SaKTPt0rgxEXExt0JNDR2cuF1TPNkIaGI3DV
nRbKN5vRkq66d/BoG4UFHQGHjitUcoZdoo17dd9A5qcM6LXVXi2J4kWHP98aYzxX
CJmg+k8UlMUO8OuHQQXdAkYjfnZf/uDnxRGaRpfupeCh0PJp8bzBtmVNdhRFLa3s
Hksu0F75X+Ujx5NtH6RG10iyN9sJtBsvnbJn0iuxeYMEJJIK+3vGfU31E1EqDjtH
BUII0wcvBB/q9h23bkcIaNW+o7vW764gyEeDUZi0meA5eFEqNP4=
=gWhb
-----END PGP SIGNATURE-----

--=-ciTeMDtrJBxBOS7lKYqJ--
