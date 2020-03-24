Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0A8D1911CB
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 14:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgCXNqd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 09:46:33 -0400
Received: from orion.archlinux.org ([88.198.91.70]:36236 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727905AbgCXNqd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 09:46:33 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id D8F0A1A620D18C;
        Tue, 24 Mar 2020 13:46:29 +0000 (UTC)
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
        Tue, 24 Mar 2020 13:46:29 +0000 (UTC)
Message-ID: <b9a26e3bb00212afd960f98dba8f7bb58cdd49e5.camel@archlinux.org>
Subject: Re: [PATCH v2] HID: logitech-dj: issue udev change event on device
 connection
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <superm1@gmail.com>,
        Richard Hughes <hughsient@gmail.com>
In-Reply-To: <92f48f409e913299c12322d195c88792bb4e5c9c.camel@hadess.net>
References: <20200318161906.3340959-1-lains@archlinux.org>
         <20200318192721.390630-1-lains@archlinux.org>
         <92f48f409e913299c12322d195c88792bb4e5c9c.camel@hadess.net>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-A/3A7+H0RlrhmhZ/oncV"
Date:   Tue, 24 Mar 2020 13:46:27 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.36.0 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-A/3A7+H0RlrhmhZ/oncV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-24 at 11:20 +0100, Bastien Nocera wrote:
> On Wed, 2020-03-18 at 19:27 +0000, Filipe La=C3=ADns wrote:
> > As discussed in the mailing list:
> >=20
> > > Right now the hid-logitech-dj driver will export one node for each
> > > connected device, even when the device is not connected. That
> > > causes
> > > some trouble because in userspace we don't have have any way to
> > > know if
> > > the device is connected or not, so when we try to communicate, if
> > > the
> > > device is disconnected it will fail.
>=20
> Why is it a problem that user-space communication fails? Note that
> sending a signal without any way to fetch the state means that it's
> always going to be racy.

It failing is not the problem. The problem is knowing when the device
is available again. Right now the only way to do that is to listen for
events or periodically ping it.

We want to only export the HID++ hidraw node when the device is
available but that will take a while. We will have to test and sync up
userspace. I also want to write tests for the driver before, to make
sure there are no regressions. We had a thread discussing this, IIRC
you were in CC.

> > The solution reached to solve this issue is to trigger an udev change
> > event when the device connects, this way userspace can just wait on
> > those connections instead of trying to ping the device.
> >=20
> > Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> >=20
> > ---
> >=20
> > v2:
> >   - Issue udev change event on the connected hid device, not on the
> >   receiver
> >=20
> > ---
> >  drivers/hid/hid-logitech-dj.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> > logitech-dj.c
> > index 48dff5d6b605..282e57dd467d 100644
> > --- a/drivers/hid/hid-logitech-dj.c
> > +++ b/drivers/hid/hid-logitech-dj.c
> > @@ -1412,6 +1412,7 @@ static int logi_dj_dj_event(struct hid_device
> > *hdev,
> >  {
> >  	struct dj_receiver_dev *djrcv_dev =3D hid_get_drvdata(hdev);
> >  	struct dj_report *dj_report =3D (struct dj_report *) data;
> > +	struct dj_device *dj_dev;
> >  	unsigned long flags;
> > =20
> >  	/*
> > @@ -1447,7 +1448,9 @@ static int logi_dj_dj_event(struct hid_device
> > *hdev,
> > =20
> >  	spin_lock_irqsave(&djrcv_dev->lock, flags);
> > =20
> > -	if (!djrcv_dev->paired_dj_devices[dj_report->device_index]) {
> > +	dj_dev =3D djrcv_dev->paired_dj_devices[dj_report->device_index];
> > +
> > +	if (!dj_dev) {
> >  		/* received an event for an unknown device, bail out */
> >  		logi_dj_recv_queue_notification(djrcv_dev, dj_report);
> >  		goto out;
> > @@ -1464,6 +1467,8 @@ static int logi_dj_dj_event(struct hid_device
> > *hdev,
> >  		if (dj_report-
> > > report_params[CONNECTION_STATUS_PARAM_STATUS] =3D=3D
> >  		    STATUS_LINKLOSS) {
> >  			logi_dj_recv_forward_null_report(djrcv_dev,
> > dj_report);
> > +		} else {
> > +			kobject_uevent(&dj_dev->hdev->dev.kobj,
> > KOBJ_CHANGE);
> >  		}
> >  		break;
> >  	default:
--=20
Filipe La=C3=ADns

--=-A/3A7+H0RlrhmhZ/oncV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl56Dy4ACgkQ+JPGdIFq
qV28lQ/+NSEiN2ak+c4eI2g75OWoNEyUuXEzbh8FdlmGfAehqpKaVqNdHTyDb3rH
S5MxkU57wrXG5rDUx//lXRAcnzHN1gw++0CNaIPyhH3tJl1+MvuKv9jWsNRYWxfu
SQhxRmtcbsGO8eMNqSoLdK9IgsH0KWL2Fd7jK2I9dWCeGrqgyu56CL/VwjJHTSFK
1drDDBxlLuotL5+/O9ch+2M1bsVAxXcowjZv2yUcldipq3pyLPucTSmisCMdgqrj
VyfQuyvHUB0WeHjlx5g6cQG8iONuqsPqWMbR1EO8XWmFLDSoxI4X0j97q4Py46TM
YSHn8FxB2C64o0QkMeC89UCqhIybUvzDMM6oQC1d2/5A9w8Elro07cBq4R5UZk/V
Q2gino2Jl55/M/vZAAnwtoMx3BDYTaf0KLuz4ZF2pLV8V8BWqvvf78nWX1GMaiHZ
pTTsy4KF0lvW5EJOLK3/GV0OWd+IaM7veT1iENklCk38XVYOivm3cjWtekBsh6cj
EvK+37HihciTK6J/77JOkNu1AHrhVfPnLKPHRNjGkw7OqSCYRrtXJPnPKXvI6YVC
bnGJpW8n7RyDfMPm8R3vuQP/z7FtJ2646x6TktfLjsV88VFOeJI3mshV6BeAJS6b
lm4Bfda3gwWxkKAxVg4Mu+2PJ/Unz1hh8yKvv8KztPJfZT+ea/c=
=CVnb
-----END PGP SIGNATURE-----

--=-A/3A7+H0RlrhmhZ/oncV--
