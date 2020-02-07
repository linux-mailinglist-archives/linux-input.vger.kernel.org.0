Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1CE154FC8
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2020 01:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgBGAgx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 19:36:53 -0500
Received: from orion.archlinux.org ([88.198.91.70]:50814 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgBGAgw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 19:36:52 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 6D8FB18B660FB1;
        Fri,  7 Feb 2020 00:36:49 +0000 (UTC)
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
        Fri,  7 Feb 2020 00:36:48 +0000 (UTC)
Message-ID: <74339066fc673cf95c0306e3005239eeae60761c.camel@archlinux.org>
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when
 the device disconnects
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Peter Hutterer <peter.hutterer@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
In-Reply-To: <b867da88-991d-4a9b-7640-4a7994b7112a@redhat.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
         <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
         <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
         <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
         <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
         <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
         <b867da88-991d-4a9b-7640-4a7994b7112a@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Etvpn6BjVWmGaJPRkLPo"
Date:   Fri, 07 Feb 2020 00:36:47 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-Etvpn6BjVWmGaJPRkLPo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-02-07 at 10:03 +1000, Peter Hutterer wrote:
> On 7/2/20 3:01 am, Benjamin Tissoires wrote:
> > On Thu, Feb 6, 2020 at 4:42 PM Filipe La=C3=ADns <lains@archlinux.org> =
wrote:
> > > On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
> > > > Hi,
> > > >=20
> > > > On 2/6/20 12:51 PM, Filipe La=C3=ADns wrote:
> > > > > On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
> > > > > > HI,
> > > > > >=20
> > > > > > On 2/6/20 12:14 PM, Filipe La=C3=ADns wrote:
> > > > > > > Hello,
> > > > > > >=20
> > > > > > > Right now the hid-logitech-dj driver will export one node for=
 each
> > > > > > > connected device, even when the device is not connected. That=
 causes
> > > > > > > some trouble because in userspace we don't have have any way =
to know if
> > > > > > > the device is connected or not, so when we try to communicate=
, if the
> > > > > > > device is disconnected it will fail.
> > > > > >=20
> > > > > > I'm a bit reluctant to make significant changes to how the
> > > > > > hid-logitech-dj driver works. We have seen a number of regressi=
ons
> > > > > > when it was changed to handle the non unifying receivers and I =
would
> > > > > > like to avoid more regressions.
> > > > > >=20
> > > > > > Some questions:
> > > > > > 1. What is the specific use case where you are hitting this?
> > > > >=20
> > > > > For example, in libratbag we enumerate the devices and then probe=
 them.
> > > > > Currently if the device is not connected, the communication fails=
. To
> > > > > get the device to show up we need to replug it, so it it triggers=
 udev,
> > > > > or restart the daemon.
> > > >=20
> > > > Thanks, that is exactly the sort of context to your suggested chang=
es
> > > > which I need.
> > > >=20
> > > > > > 2. Can't the userspace tools involved by modified to handle the=
 errors
> > > > > > they are getting gracefully?
> > > > >=20
> > > > > They can, but the approaches I see are not optimal:
> > > > >     - Wait for HID events coming from the device, which could nev=
er
> > > > > happen.
> > > > >     - Poll the device until it wakes up.
> > > >=20
> > > > I guess we do get some (other or repeated?) event when the device d=
oes
> > > > actually connect, otherwise your suggested changes would not be pos=
sible.
> > >=20
> > > No, I was thinking to just send the HID++ version identification
> > > routine and see if the device replies.
> >=20
> > Hmm, to continue on these questions:
> > - yes, the current approach is to have the users of the HID++ device
> > try to contact the device, get an error from the receiver, then keep
> > the hidraw node open until we get something out of it, and then we can
> > start talking to it
> > - to your question Hans, when a device connects, it emits a HID++
> > notification, which we should be relaying in the hidraw node. If not,
> > well then starting to receive a key or abs event on the input node is
> > a pretty good hint that the device connected.
> >=20
> > So at any time, the kernel knows which devices are connected among
> > those that are paired, so the kernel knows a lot more than user space.
> >=20
> > The main problem Filipe is facing here is that we specifically
> > designed libratbag to *not* keep the device nodes opened, and to not
> > poll on the input events. The reason being... we do not want libratbag
> > to be considered as a keylogger.
>=20
> I'm wondering - can we really get around this long-term? Even if we have=
=20
> a separate HID++ node and/or udev change events and/or some other=20
> notification, in the end you still have some time T between that event=
=20
> and userspace opening the actual event node. Where the first key event=
=20
> wakes up the physical keyboard, you're now racing.

Yes but it doesn't really matter in this case. We would only be
potentially losing HID++ events, which are not that important, unlike
normal input events. In fact, libratbag does not care about HID++
events, they are just ignored.

We would still have the same issue, yes, except here we don't really
care.

> So the separate HID++ node works as long as libratbag *only* listens to=
=20
> that node, as soon as we need to start caring about a normal event it=20
> won't work any longer.

You mean when libratbag starts caring about normal input events? What
is the point of that? Why would we need to do that? Also, as Benjamin
pointed out, that would classify as a keylogger.

Cheers,
Filipe La=C3=ADns=20

--=-Etvpn6BjVWmGaJPRkLPo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl48sR8ACgkQ+JPGdIFq
qV2btxAArWCfxmeItacYztrHLGKs1Rf4AuGiukOVG50lygpTE3dSeb9A2N6RzCLN
2f2G25jwNMogt+wN8Z7mQH3JK+Y5N7vrfF9RjYevn0eI4gqjVGamgDIF6mFQvXls
SduZRJ1DnX354s3VjuMRl8/7ceXGZ38T+u6X+QildbWhPUyA2hwp2Ri4ifrznRRY
PIj5r7OpyqzYjsLx65D6FxR+QRoyPV9zQGfYYKmDSVMWIb5cIcpy8kcFlRhVXZ9g
jaE/a/QpijDBEBiaWooKrHpa+IWLt8OIHTetgUTrVDOT7NBLqwCx8BnKn60KRiVy
8kQCfqVoAd/gnAT2TRP66xWfTvgAwIr+/KV9pQU4s4f6VKPNmqM0YZxwY2eawkGF
BvmQlybdZzOfRE/o4FRHrbdZtbSN/M5nKV2BKtSU756++PFOXKKmX3kX9qd9VNWt
jyimCFj4eq/Sg4mfuLNTXr3mOvPM6NCWY8xOlfEt2bog4B3uGysSLPPK4Zta1A2f
HOBjv6z/cRCWUGXd2GGWiIn+kCYyrQWV6BZ/FmUqAy/Un/6n7Z8s1RqdZCUkp/4M
Ax25wNmZH3NveMgmIKyYb2mPyuL5VkhcEiuj6WQjgVdYGJv3kAt77EcwU5XFaHFp
3OqGpKhv8lP+DWmszR7NlFMieZYLZX5CuNcPON4AedsoAg4sU1s=
=+nfK
-----END PGP SIGNATURE-----

--=-Etvpn6BjVWmGaJPRkLPo--
