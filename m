Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0AE15AA86
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 14:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgBLN5C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 08:57:02 -0500
Received: from orion.archlinux.org ([88.198.91.70]:38018 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbgBLN5C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 08:57:02 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id A3C6418E506C43;
        Wed, 12 Feb 2020 13:56:59 +0000 (UTC)
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
        Wed, 12 Feb 2020 13:56:59 +0000 (UTC)
Message-ID: <5a93677bd6238a9d7928e4fd16a8915faeb5f19e.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-dj: add support for the static device in
 the Powerplay mat/receiver
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
In-Reply-To: <nycvar.YFH.7.76.2002121449191.3144@cbobk.fhfr.pm>
References: <20200115201811.3271284-1-lains@archlinux.org>
         <nycvar.YFH.7.76.2002121449191.3144@cbobk.fhfr.pm>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-3P3g5JjKy5potOmOiHOS"
Date:   Wed, 12 Feb 2020 13:56:58 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-3P3g5JjKy5potOmOiHOS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-12 at 14:50 +0100, Jiri Kosina wrote:
> On Wed, 15 Jan 2020, Filipe La=C3=ADns wrote:
>=20
> > The Logitech G Powerplay has a lightspeed receiver with a static HID++
> > device with ID 7 attached to it to. It is used to configure the led on
> > the mat. For this reason I increased the max number of devices.
> >=20
> > Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> > ---
> >  drivers/hid/hid-logitech-dj.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-d=
j.c
> > index bb50d6e7745b..79294b873057 100644
> > --- a/drivers/hid/hid-logitech-dj.c
> > +++ b/drivers/hid/hid-logitech-dj.c
> > @@ -16,11 +16,11 @@
> >  #include <asm/unaligned.h>
> >  #include "hid-ids.h"
> > =20
> > -#define DJ_MAX_PAIRED_DEVICES			6
> > +#define DJ_MAX_PAIRED_DEVICES			7
> >  #define DJ_MAX_NUMBER_NOTIFS			8
> >  #define DJ_RECEIVER_INDEX			0
> >  #define DJ_DEVICE_INDEX_MIN			1
> > -#define DJ_DEVICE_INDEX_MAX			6
> > +#define DJ_DEVICE_INDEX_MAX			7
> > =20
> >  #define DJREPORT_SHORT_LENGTH			15
> >  #define DJREPORT_LONG_LENGTH			32
> > @@ -980,6 +980,11 @@ static void logi_hidpp_recv_queue_notif(struct hid=
_device *hdev,
> >  		break;
> >  	}
> > =20
> > +	/* custom receiver device (eg. powerplay) */
> > +	if (hidpp_report->device_index =3D=3D 7) {
> > +		workitem.reports_supported |=3D HIDPP;
> > +	}
> > +
>=20
> I guess we can't do anything else than to trust Logitech that they will=
=20
> not assign conflicting device_index ID in the future to something that=
=20
> will not be HID++, right?
>=20
> Or is this properly documented somewhere?
>=20
> Thanks,


CCing Nestor

Yes, we need to trust Logitech on this. There's isn't anything
documented regarding this AFAIK.

Even if Logitech released a device with index 7 that didn't support
HID++, it wouldn't be that big of an issue. We would just end up with a
hidraw node which would export a vendor page report descriptor but the
device wouldn't actually reply to anything.

Regards,
Filipe La=C3=ADns

--=-3P3g5JjKy5potOmOiHOS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl5EBCEACgkQ+JPGdIFq
qV2nixAApQh5cHidyCP6oi8asHrvYczpnT6bx0zNt8f8GQpzEi8YFdTojMdXe+XG
wqdXIYmB9EmpKi9IeQYwBPv3BUNB/Rwu47p99UKtytpWofHYFgdjaVCOg1sAA/Xr
zDtmryCP7OraUC95Ut86KrNx9Ez5wzJ7Jy8N4GxawSFtau9sxzCGotfdCqPKGaJ5
e+yk/8aioLA4qikMFl1UdDZdYFSr4CgAERheSQm1LciKoHXBty8i3NQYpGmtzeuS
3xZsgO8gfH6yJ8sW95uet6zUgbbij4kjaFAfkC+zSXNGnxF0luQy5N8ICM99LCUh
3SoqSQU9auHKF6DipQVSHTsZfF2L69lGK4mWwVN+Guzroh0Oj5NtfuiXUHIyVDYj
XhYKYCkwxftWOjK3u0u/6YFcVCScz25nEi/vPvTBxjXW6lvq5rg6O5T89zfqB0L/
R+P1EqwwhfJStSJ2GeqnR0NBAu2CXUw9NAuQ7EBY61hTGFTQANGJMcFb53BA1Buq
2ut36VnyJHtW8ZDJbPNm5Cp2vkU6PELWIOsRMHLSGjp0BR6xqocI0e2SB51RjZY7
dSxczOKEc8IeUh4Co2PISwYMfaoEkpu2nwwkz+PYBnG3tisDZRgLP8SDik3tCyYT
GV6Lpa0ZyiGbjXmrlZYU+p6AnpoXr3rsiG5Bu4Aui9AuZ4/nwjU=
=h22c
-----END PGP SIGNATURE-----

--=-3P3g5JjKy5potOmOiHOS--
