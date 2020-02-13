Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCBA15C5CA
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 17:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgBMPYy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 10:24:54 -0500
Received: from orion.archlinux.org ([88.198.91.70]:37806 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728814AbgBMPYx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 10:24:53 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 49FE118F151497;
        Thu, 13 Feb 2020 15:24:49 +0000 (UTC)
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
        Thu, 13 Feb 2020 15:24:48 +0000 (UTC)
Message-ID: <b55426351a0853aa59e100a4f313df24323b0fa6.camel@archlinux.org>
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when
 the device disconnects
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Benjamin Tissoires <btissoir@redhat.com>
Cc:     Peter Hutterer <peter.hutterer@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
In-Reply-To: <CAO-hwJ+-Og-0OcNo2gWq+XKM6wjw9oWquZTzPCUhTOaMRYQGHg@mail.gmail.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
         <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
         <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
         <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
         <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
         <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
         <b867da88-991d-4a9b-7640-4a7994b7112a@redhat.com>
         <74339066fc673cf95c0306e3005239eeae60761c.camel@archlinux.org>
         <CAO-hwJ+-Og-0OcNo2gWq+XKM6wjw9oWquZTzPCUhTOaMRYQGHg@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-/LNmCDHSO55bOaGBi7HV"
Date:   Thu, 13 Feb 2020 15:24:46 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-/LNmCDHSO55bOaGBi7HV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-13 at 16:12 +0100, Benjamin Tissoires wrote:
> On Fri, Feb 7, 2020 at 1:37 AM Filipe La=C3=ADns <lains@archlinux.org> wr=
ote:
> > On Fri, 2020-02-07 at 10:03 +1000, Peter Hutterer wrote:
> > > On 7/2/20 3:01 am, Benjamin Tissoires wrote:
> > > > On Thu, Feb 6, 2020 at 4:42 PM Filipe La=C3=ADns <lains@archlinux.o=
rg> wrote:
> > > > > On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On 2/6/20 12:51 PM, Filipe La=C3=ADns wrote:
> > > > > > > On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
> > > > > > > > HI,
> > > > > > > >=20
> > > > > > > > On 2/6/20 12:14 PM, Filipe La=C3=ADns wrote:
> > > > > > > > > Hello,
> > > > > > > > >=20
> > > > > > > > > Right now the hid-logitech-dj driver will export one node=
 for each
> > > > > > > > > connected device, even when the device is not connected. =
That causes
> > > > > > > > > some trouble because in userspace we don't have have any =
way to know if
> > > > > > > > > the device is connected or not, so when we try to communi=
cate, if the
> > > > > > > > > device is disconnected it will fail.
> > > > > > > >=20
> > > > > > > > I'm a bit reluctant to make significant changes to how the
> > > > > > > > hid-logitech-dj driver works. We have seen a number of regr=
essions
> > > > > > > > when it was changed to handle the non unifying receivers an=
d I would
> > > > > > > > like to avoid more regressions.
> > > > > > > >=20
> > > > > > > > Some questions:
> > > > > > > > 1. What is the specific use case where you are hitting this=
?
> > > > > > >=20
> > > > > > > For example, in libratbag we enumerate the devices and then p=
robe them.
> > > > > > > Currently if the device is not connected, the communication f=
ails. To
> > > > > > > get the device to show up we need to replug it, so it it trig=
gers udev,
> > > > > > > or restart the daemon.
> > > > > >=20
> > > > > > Thanks, that is exactly the sort of context to your suggested c=
hanges
> > > > > > which I need.
> > > > > >=20
> > > > > > > > 2. Can't the userspace tools involved by modified to handle=
 the errors
> > > > > > > > they are getting gracefully?
> > > > > > >=20
> > > > > > > They can, but the approaches I see are not optimal:
> > > > > > >     - Wait for HID events coming from the device, which could=
 never
> > > > > > > happen.
> > > > > > >     - Poll the device until it wakes up.
> > > > > >=20
> > > > > > I guess we do get some (other or repeated?) event when the devi=
ce does
> > > > > > actually connect, otherwise your suggested changes would not be=
 possible.
> > > > >=20
> > > > > No, I was thinking to just send the HID++ version identification
> > > > > routine and see if the device replies.
> > > >=20
> > > > Hmm, to continue on these questions:
> > > > - yes, the current approach is to have the users of the HID++ devic=
e
> > > > try to contact the device, get an error from the receiver, then kee=
p
> > > > the hidraw node open until we get something out of it, and then we =
can
> > > > start talking to it
> > > > - to your question Hans, when a device connects, it emits a HID++
> > > > notification, which we should be relaying in the hidraw node. If no=
t,
> > > > well then starting to receive a key or abs event on the input node =
is
> > > > a pretty good hint that the device connected.
> > > >=20
> > > > So at any time, the kernel knows which devices are connected among
> > > > those that are paired, so the kernel knows a lot more than user spa=
ce.
> > > >=20
> > > > The main problem Filipe is facing here is that we specifically
> > > > designed libratbag to *not* keep the device nodes opened, and to no=
t
> > > > poll on the input events. The reason being... we do not want librat=
bag
> > > > to be considered as a keylogger.
> > >=20
> > > I'm wondering - can we really get around this long-term? Even if we h=
ave
> > > a separate HID++ node and/or udev change events and/or some other
> > > notification, in the end you still have some time T between that even=
t
> > > and userspace opening the actual event node. Where the first key even=
t
> > > wakes up the physical keyboard, you're now racing.
> >=20
> > Yes but it doesn't really matter in this case. We would only be
> > potentially losing HID++ events, which are not that important, unlike
> > normal input events. In fact, libratbag does not care about HID++
> > events, they are just ignored.
> >=20
> > We would still have the same issue, yes, except here we don't really
> > care.
>=20
> Well, I guess Peter's point is: "yes, you don't care *right now*, but
> what if you care in the future, you will have the same race."
>=20
> > > So the separate HID++ node works as long as libratbag *only* listens =
to
> > > that node, as soon as we need to start caring about a normal event it
> > > won't work any longer.
> >=20
> > You mean when libratbag starts caring about normal input events? What
> > is the point of that? Why would we need to do that? Also, as Benjamin
> > pointed out, that would classify as a keylogger.
>=20
> For now, I think we are:
> - to solve the immediate user-space problem, implement the udev events
> as suggested by Hans. This is minimal code change

Okay, great. So, this would be step 1, it would fix the immediate
problem with no breakage.

> - to solve the "keylogger" issue, we can split the HID devices in 2.

This can come later. libratbag should be able to handle this change
perfectly fine but we need to check with the other projects. If needed,
I will test the change on the impacted projects and try submit the
required patches to handle the new behavior properly to the upstreams.

Just to make sure: we want to actually split the devices, not just add
another node for only HID++ or something like that.

Quick question: is there any way for us to make userspace able to tell
the nodes apart without having to get the rdesc via an ioctl? Perhaps
exporting that information via sysfs?

> This way, we do not have to deal with hotplug races, but can still get
> information from the connect event without reading the input events.
>=20
> Cheers,
> Benjamin
>=20
> > Cheers,
> > Filipe La=C3=ADns

Thanks,
Filipe La=C3=ADns

--=-/LNmCDHSO55bOaGBi7HV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl5FajgACgkQ+JPGdIFq
qV3KMw//cdX2CqLbPETnNxdDNyxCljjNbGljqPCj3fazNIWfOILf58++VdFBrFNJ
jCgB5pvOIu1LDZ0wBiFb8CbokUKA7o+k1jgrlKXNzUvbkbOp+s9MPBYCzHzHlV/u
ipIe7GMY3LuhKYv+CFybqvpw3s4LunusWOF5N9A+8UKiGzf0tqCOSC67X4sIDf3R
AffpGfA2ecniRxsABsQyWEynvNvgzZ96MAqKk3Psd0WQE71xAVTG1zGsbqVMPaVB
hvA7mbjasjPQwvEMBOQQ3Uq6UzgUC0loufz5FObnIMtyvWaoNpytGQ6sqt5sOGE3
KWy0yOoamk6BxGgE3Dg7ftTGPPX+4ypZdM+lqj9S1aqqUFL3RrryX/UgJ1j5eLRc
AJ1Cz2MTsTY8iB9ijjTttEX77TDY6ywwoqttt3WxiBJs0t+xgYAydvfLuw7hYlwM
cB6ksikvEBs6hfHj58O8lH2zWi3yy2cPlBpF91vFar6kOKG6kESjRyk3Rfi5EsKJ
9KqNeV+WBkit3wfjYV9IHZlwOYo3LDpyBJypH+qHNo70n1X0x7O+tSHlDdk2D5Wt
c3Y6TuCk0B9omIRBUk1OmYEsvosfyRSDrJU4Ipd19aiVZzoBDJQ85lKu3qBTMhOU
FLzvDqGmqsJ1D5QKWLz8gwxH63otA6zZs12KCq6FvKKXzos+WNQ=
=sF5d
-----END PGP SIGNATURE-----

--=-/LNmCDHSO55bOaGBi7HV--
