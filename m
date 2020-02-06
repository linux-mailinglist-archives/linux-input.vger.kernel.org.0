Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930D7154846
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 16:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbgBFPmR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 10:42:17 -0500
Received: from orion.archlinux.org ([88.198.91.70]:46562 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbgBFPmQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 10:42:16 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id B1EC218B42A3C3;
        Thu,  6 Feb 2020 15:42:12 +0000 (UTC)
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
        Thu,  6 Feb 2020 15:42:11 +0000 (UTC)
Message-ID: <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
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
In-Reply-To: <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
         <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
         <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
         <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-7J1kTqeaNbi2mbOEj4ep"
Date:   Thu, 06 Feb 2020 15:42:10 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-7J1kTqeaNbi2mbOEj4ep
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
> Hi,
>=20
> On 2/6/20 12:51 PM, Filipe La=C3=ADns wrote:
> > On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
> > > HI,
> > >=20
> > > On 2/6/20 12:14 PM, Filipe La=C3=ADns wrote:
> > > > Hello,
> > > >=20
> > > > Right now the hid-logitech-dj driver will export one node for each
> > > > connected device, even when the device is not connected. That cause=
s
> > > > some trouble because in userspace we don't have have any way to kno=
w if
> > > > the device is connected or not, so when we try to communicate, if t=
he
> > > > device is disconnected it will fail.
> > >=20
> > > I'm a bit reluctant to make significant changes to how the
> > > hid-logitech-dj driver works. We have seen a number of regressions
> > > when it was changed to handle the non unifying receivers and I would
> > > like to avoid more regressions.
> > >=20
> > > Some questions:
> > > 1. What is the specific use case where you are hitting this?
> >=20
> > For example, in libratbag we enumerate the devices and then probe them.
> > Currently if the device is not connected, the communication fails. To
> > get the device to show up we need to replug it, so it it triggers udev,
> > or restart the daemon.
>=20
> Thanks, that is exactly the sort of context to your suggested changes
> which I need.
>=20
> > > 2. Can't the userspace tools involved by modified to handle the error=
s
> > > they are getting gracefully?
> >=20
> > They can, but the approaches I see are not optimal:
> >    - Wait for HID events coming from the device, which could never
> > happen.
> >    - Poll the device until it wakes up.
>=20
> I guess we do get some (other or repeated?) event when the device does
> actually connect, otherwise your suggested changes would not be possible.

No, I was thinking to just send the HID++ version identification
routine and see if the device replies.

> So how about if we trigger a udev change event on the hid device instead
> when this happens ? That seems like a less invasive change on the kernel
> side and then libratbag could listen for these change events?

Yes, that is a good idea :) I did not know this was possible but it
seems like a better approach.

> > > 3. Is there a bugreport open about this somewhere?
> >=20
> > Yes, https://github.com/libratbag/libratbag/issues/785
> >=20
> > > > The reason we do this is because otherwise we would loose the first
> > > > packets when the device is turned on by key press. When a device is
> > > > turned on we would have to create the device node, and the packets
> > > > received while we are creating the device node would be lost.
> > >=20
> > > I don't believe that this is the reason, we only create hid child
> > > devices for devices reported by the receiver, but some of the non
> > > unifying hid receiver send a list of all devices paired, rather
> > > then the ones which are actually connected at that time.
> >=20
> > IIRC from my chats with Benjamin and Peter this is the reason, but
> > please correct me if I'm wrong.
>=20
> Could be that we can distinguish between "paired" and "connected"
> and that we are enumerating "paired" but not (yet) "connected"
> devices already because of what you say, I've not touched this
> code in a while.

We create nodes for all paired devices, no matter if they are connected
or not.

> > > > This could solved by buffering those packets, but that is a bad sol=
ution as
> > > > it would mess up the timings.
> > > >=20
> > > > At the moment the created node includes both normal HID and vendor
> > > > usages. To solve this problem, I propose that instead of creating a
> > > > single device node that contains all usages, we create one for norm=
al
> > > > HID, which would exist all the time, and one for the vendor usage,
> > > > which would go away when the device disconnects. >
> > > > This slight behavior change will affect userspace. Two hidraw nodes
> > > > would be created instead of one. We need to make sure the current
> > > > userspace stacks interfacing with this would be able to properly ha=
ndle
> > > > such changes.
> > > >=20
> > > > What do you think of this approach? Anyone has a better idea?
> > >=20
> > > The suggested approach sounds fragile and like it adds complexity to
> > > an already not simple driver.
> >=20
> > I understand, that is totally reasonable. I am working on a CI for the
> > driver if that helps.
> >=20
> > > It would be helpful to first describe the actual problem you are tryi=
ng
> > > to fix (rather then suggesting a solution without clearly defining th=
e
> > > problem) and then we can see from there.
> >=20
> > I though I described it good enough in the first paragraph but I guess
> > not, sorry. You should be able to get it from my comments above, if not
> > please let me know :)
>=20
> No problem, I have enough context now. I personally like my udev change
> event idea, which seems more KISS. But ultimately this is Benjamin's call=
.

Yes, I don't know about the application details (I'll have to find out
:P) but it makes more sense to me. It avoids breaking the userspace
behavior.

Benjamin, what do you think?

> Regards,
>=20
> Hans

Thank you,
Filipe La=C3=ADns

--=-7J1kTqeaNbi2mbOEj4ep
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl48M8QACgkQ+JPGdIFq
qV0peA/9FPBHU+n3dNMZB3neL9ZICW5/RITBAHvX6JMobtQHRB7Uw2H13hSrUUbl
4BxlJPLxSP+SBMYMtmaRK59G7roy7pn8/uBCqHINTx+h3mfPbRY63weJjm7f4ylS
G5tcZcLG0noZPK6LMPQRwepVBw+6EK4KAQ4ACWrYL34UoGvhlPcRKhD1LOgUlANJ
V5JJyEOah0V1302Q5udYJK841fVpY8l7lO4gMGbT0gOh6mMDY/WztSWlWcrI7Sjp
nSUHqSahMS3Y888FSIv35FDqP/9GZ3QBSvYW0JHnlc8DK4Haex5G6Nlz6OvMz02H
w8EgD2B7msJhtJ7D6SohwphfbVwsCFn0moS9HVkZijE9761SQuyTKLoH6RobovAL
bqOCr/V5ttOzlCLBDRAJmjctZJM72rBrS/rPAdxwqypS9fyiOF3m93uD93V/6Hcm
f8OOkfhbvg7Ryheb+vntakZnUleNitc46e5xu+9VV9zcHA7Z3B7JcWuX77oGlZip
PsxG/wOAIkodUEBXD4sCJia22P/ecaCvKlEMHZu9b67XUe+HsCpDO+p1G08EomCX
YyFIsDj5dM2w3XuPhiQx3Gnuy2ZPTFuo88PhCSQt+B4vD6KVpysboazUizx+1G7X
hQB6uekCXzHWgosZdLYv65IIpXadsGvuxYmZB3JJJfN0aptM0e0=
=sne/
-----END PGP SIGNATURE-----

--=-7J1kTqeaNbi2mbOEj4ep--
