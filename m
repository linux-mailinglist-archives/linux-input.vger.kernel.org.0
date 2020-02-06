Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2F49154382
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 12:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgBFLv4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 06:51:56 -0500
Received: from orion.archlinux.org ([88.198.91.70]:37742 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbgBFLv4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 06:51:56 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 5661E18B3236B1;
        Thu,  6 Feb 2020 11:51:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.3
X-Spam-BL-Results: 
Received: from localhost (dragon.archlinux.org [IPv6:2a01:4f8:13a:102a::2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Thu,  6 Feb 2020 11:51:53 +0000 (UTC)
Message-ID: <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when
 the device disconnects
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>
Cc:     Benjamin Tissoires <btissoir@redhat.com>,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
In-Reply-To: <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
         <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-LMkRqL892tDzlr3g3+WR"
Date:   Thu, 06 Feb 2020 11:51:52 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-LMkRqL892tDzlr3g3+WR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
> HI,
>=20
> On 2/6/20 12:14 PM, Filipe La=C3=ADns wrote:
> > Hello,
> >=20
> > Right now the hid-logitech-dj driver will export one node for each
> > connected device, even when the device is not connected. That causes
> > some trouble because in userspace we don't have have any way to know if
> > the device is connected or not, so when we try to communicate, if the
> > device is disconnected it will fail.
>=20
> I'm a bit reluctant to make significant changes to how the
> hid-logitech-dj driver works. We have seen a number of regressions
> when it was changed to handle the non unifying receivers and I would
> like to avoid more regressions.
>=20
> Some questions:
> 1. What is the specific use case where you are hitting this?

For example, in libratbag we enumerate the devices and then probe them.
Currently if the device is not connected, the communication fails. To
get the device to show up we need to replug it, so it it triggers udev,
or restart the daemon.

> 2. Can't the userspace tools involved by modified to handle the errors
> they are getting gracefully?

They can, but the approaches I see are not optimal:
  - Wait for HID events coming from the device, which could never
happen.
  - Poll the device until it wakes up.

> 3. Is there a bugreport open about this somewhere?

Yes, https://github.com/libratbag/libratbag/issues/785

> > The reason we do this is because otherwise we would loose the first
> > packets when the device is turned on by key press. When a device is
> > turned on we would have to create the device node, and the packets
> > received while we are creating the device node would be lost.
>=20
> I don't believe that this is the reason, we only create hid child
> devices for devices reported by the receiver, but some of the non
> unifying hid receiver send a list of all devices paired, rather
> then the ones which are actually connected at that time.

IIRC from my chats with Benjamin and Peter this is the reason, but
please correct me if I'm wrong.

> > This could solved by buffering those packets, but that is a bad solutio=
n as
> > it would mess up the timings.
> >=20
> > At the moment the created node includes both normal HID and vendor
> > usages. To solve this problem, I propose that instead of creating a
> > single device node that contains all usages, we create one for normal
> > HID, which would exist all the time, and one for the vendor usage,
> > which would go away when the device disconnects. >
> > This slight behavior change will affect userspace. Two hidraw nodes
> > would be created instead of one. We need to make sure the current
> > userspace stacks interfacing with this would be able to properly handle
> > such changes.
> >=20
> > What do you think of this approach? Anyone has a better idea?
>=20
> The suggested approach sounds fragile and like it adds complexity to
> an already not simple driver.

I understand, that is totally reasonable. I am working on a CI for the
driver if that helps.

> It would be helpful to first describe the actual problem you are trying
> to fix (rather then suggesting a solution without clearly defining the
> problem) and then we can see from there.

I though I described it good enough in the first paragraph but I guess
not, sorry. You should be able to get it from my comments above, if not
please let me know :)

> Regards,
>=20
> Hans

Cheers,=20
Filipe La=C3=ADns

--=-LMkRqL892tDzlr3g3+WR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl47/dQACgkQ+JPGdIFq
qV29Bg/+LiXQI0M4G5aboSDleuoOZ5jhaXi+FK1X/HGgMxnQeU4jR5FA4yyglNMC
DM5TFM6s0BEozaKgYIooAoAvBMCwOe7t3FvzHqSKNmX9nC5cyBg84Q9kHoy4iKHn
TyfvgKghHRFoMU0w/wpVTpmRM59ED2JKYWembqU+mKYn/GINEusrimsP76frXQiE
ngmq7gDM3yG4KMmK2b8WykAEt0nyAQUSGPOz6BfQ+1xvm9B0w85FDmRyT3ZGJknT
LC8oDZY+4SwosN6WW46MZi4mJV5AFXYjacLHTRY7ifMagIhamcHz/z9LQrQo+h8p
uc7f/GO6vrVVQ+qY9EXGsNVnWX1SZ56qdQxxdT1iVAd8uvwDVO0J0GGhxwaOEPNh
4Jk3+4BOveiLJ6m1ZMr1cZ0WGIjNYz9lcO7mZqnq7zsx8nr2J6nsMJogVbG0Utqi
kXxr0C4BOOYLXeZAlzRTgnHc1vp6/m84VRQkD+3k1FQ+bcD6XN4PZfXtkJ5YTH6G
kcOMsSwW+RzGF4rKvLaCEEv4BGPiEjpy4hPak7P+d5NwaQmQ36jJP5fbQFy+3qXK
4c45yENx8Engy09TGFc8PmMv4fBPIjh73XnnSBJXgh/CvTTR0BOarlxC2QPzAAPz
DYw4X0UEsjjASEgDaSEPYPdpzcvdjnE/lhMfKQb8Hxn+OYnY+bs=
=tR9p
-----END PGP SIGNATURE-----

--=-LMkRqL892tDzlr3g3+WR--
