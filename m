Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDD12154C69
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 20:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgBFTnk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 14:43:40 -0500
Received: from orion.archlinux.org ([88.198.91.70]:42830 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgBFTnk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 14:43:40 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id D98F218B57927A;
        Thu,  6 Feb 2020 19:43:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,LOCAL_FAKEBUSINESS=0.5,T_DMARC_POLICY_NONE=0.01,
        T_DMARC_TESTS_FAIL=0.01 autolearn=no autolearn_force=no version=3.4.3
X-Spam-BL-Results: 
Received: from localhost (dragon.archlinux.org [IPv6:2a01:4f8:13a:102a::2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Thu,  6 Feb 2020 19:43:35 +0000 (UTC)
Message-ID: <f4a1ab5c1c549d293a586529cd6f00ae3247f985.camel@archlinux.org>
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when
 the device disconnects
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
In-Reply-To: <28244ac8-9b8d-2950-b282-4db5cf7bf9b2@redhat.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
         <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
         <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
         <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
         <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
         <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
         <80aaf01d-fd9f-49fe-44cf-67710a0d136c@redhat.com>
         <c92b913816366b8744ebcb3d067d968431cfffb2.camel@archlinux.org>
         <28244ac8-9b8d-2950-b282-4db5cf7bf9b2@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-f2ucgOFAT9/V3PQE067K"
Date:   Thu, 06 Feb 2020 19:43:34 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-f2ucgOFAT9/V3PQE067K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-06 at 20:02 +0100, Hans de Goede wrote:
> Hi,
>=20
> On 2/6/20 7:43 PM, Filipe La=C3=ADns wrote:
> > On Thu, 2020-02-06 at 18:45 +0100, Hans de Goede wrote:
> > > Hi,
> > >=20
> > > On 2/6/20 6:01 PM, Benjamin Tissoires wrote:
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
> > > > > > >      - Wait for HID events coming from the device, which coul=
d never
> > > > > > > happen.
> > > > > > >      - Poll the device until it wakes up.
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
> > >=20
> > > Ack.
> > >=20
> > > > The main problem Filipe is facing here is that we specifically
> > > > designed libratbag to *not* keep the device nodes opened, and to no=
t
> > > > poll on the input events. The reason being... we do not want librat=
bag
> > > > to be considered as a keylogger.
> > >=20
> > > Ack.
> > >=20
> > > > > > So how about if we trigger a udev change event on the hid devic=
e instead
> > > > > > when this happens ? That seems like a less invasive change on t=
he kernel
> > > > > > side and then libratbag could listen for these change events?
> > > > >=20
> > > > > Yes, that is a good idea :) I did not know this was possible but =
it
> > > > > seems like a better approach.
> > > >=20
> > > > Not a big fan of that idea personally. This will add yet an other
> > > > kernel API that we have to maintain.
> > > > On Filipe's side, the hotplug support is something that has been
> > > > around for quite a long time now, so we can safely expect applicati=
ons
> > > > to handle it properly.
> > >=20
> > > The suggested udev event change would just require a small change
> > > to the existing hotplug handling, currently it responds to udev
> > > "add" and "remove" events. With my suggested change in the "add"
> > > path it will get an error because the device is not connected and
> > > then stop adding the device. Combine this with treating "change"
> > > events as "add" events and that is all that has to change on the
> > > libratbag side.
> > >=20
> > > This assumes that duplicate add events are already filtered out,
> > > which one has to do anyways to avoid coldplug enumeration vs
> > > hotplug races.
> > >=20
> > > As for yet another kernel API to maintain, udev change events
> > > already are an existing kernel API, what would be new is the hidpp
> > > driver; and just the hidpp driver emitting them.
> > >=20
> > > All that is needed on the kernel side for this is to make the followi=
ng
> > > call when we detect a device moves from the paired to the connected s=
tate:
> > >=20
> > > 	kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
> > >=20
> > > And there even seems to be a precedent for this, drivers/hid/hid-wiim=
ote-core.c
> > > already does this for what seems to be similar reasons.
> > >=20
> > >=20
> > > > > > > > 3. Is there a bugreport open about this somewhere?
> > > > > > >=20
> > > > > > > Yes, https://github.com/libratbag/libratbag/issues/785
> > > > > > >=20
> > > > > > > > > The reason we do this is because otherwise we would loose=
 the first
> > > > > > > > > packets when the device is turned on by key press. When a=
 device is
> > > > > > > > > turned on we would have to create the device node, and th=
e packets
> > > > > > > > > received while we are creating the device node would be l=
ost.
> > > > > > > >=20
> > > > > > > > I don't believe that this is the reason, we only create hid=
 child
> > > > > > > > devices for devices reported by the receiver, but some of t=
he non
> > > > > > > > unifying hid receiver send a list of all devices paired, ra=
ther
> > > > > > > > then the ones which are actually connected at that time.
> > > > > > >=20
> > > > > > > IIRC from my chats with Benjamin and Peter this is the reason=
, but
> > > > > > > please correct me if I'm wrong.
> > > >=20
> > > > Filipe is correct here.
> > > >=20
> > > > For unifying devices, we can have up to 6 devices paired to a
> > > > receiver, 3 can be used at the same time (connected).
> > > > For the cheap receivers, we can enumerate 2 paired devices, but the=
y
> > > > are not necessarily connected too.
> > > >=20
> > > > Historically, when I first wrote the hid-logitech-hidpp driver, I
> > > > wanted to not export a non connected device. But as mentioned by
> > > > Filipe, this was posing issues mainly for keyboards, because genera=
lly
> > > > the first thing you type on a keyboard is your password, and you do=
n't
> > > > necessarily have the feedback to see which keys you typed.
> > > >=20
> > > > So we (Nestor and I) decided to almost always create the input node=
s
> > > > when the device was not connected. The exceptions are when we need
> > > > some device communication to set up the input node: so just for the
> > > > touchpads.
> > >=20
> > > Ok.
> > >=20
> > >=20
> > > > > > Could be that we can distinguish between "paired" and "connecte=
d"
> > > > > > and that we are enumerating "paired" but not (yet) "connected"
> > > > > > devices already because of what you say, I've not touched this
> > > > > > code in a while.
> > > >=20
> > > > That is correct. Paired doesn't mean connected.
> > > >=20
> > > > > We create nodes for all paired devices, no matter if they are con=
nected
> > > > > or not.
> > > > >=20
> > > > > > > > > This could solved by buffering those packets, but that is=
 a bad solution as
> > > > > > > > > it would mess up the timings.
> > > > > > > > >=20
> > > > > > > > > At the moment the created node includes both normal HID a=
nd vendor
> > > > > > > > > usages. To solve this problem, I propose that instead of =
creating a
> > > > > > > > > single device node that contains all usages, we create on=
e for normal
> > > > > > > > > HID, which would exist all the time, and one for the vend=
or usage,
> > > > > > > > > which would go away when the device disconnects. >
> > > > > > > > > This slight behavior change will affect userspace. Two hi=
draw nodes
> > > > > > > > > would be created instead of one. We need to make sure the=
 current
> > > > > > > > > userspace stacks interfacing with this would be able to p=
roperly handle
> > > > > > > > > such changes.
> > > > > > > > >=20
> > > > > > > > > What do you think of this approach? Anyone has a better i=
dea?
> > > > > > > >=20
> > > > > > > > The suggested approach sounds fragile and like it adds comp=
lexity to
> > > > > > > > an already not simple driver.
> > > >=20
> > > > OTOH, this is what we have been trying to do in the kernel for year=
s
> > > > now: have one single node per application/usage, so we can rely on
> > > > some valid data from the user space.
> > > >=20
> > > > I don't think the complexity of the driver should be a problem here=
.
> > > > Yes, it's a complex one, but introducing a new API for that is a no
> > > > from me.
> > >=20
> > > udev change events are not "adding a new API" there are a well known
> > > API using e.g. for monitor plug/unplug in the drm subsys, etc. Yes
> > > using them in the HID subsys this way is somewhat new.
> > >=20
> > > > > > > I understand, that is totally reasonable. I am working on a C=
I for the
> > > > > > > driver if that helps.
> > > > > > >=20
> > > > > > > > It would be helpful to first describe the actual problem yo=
u are trying
> > > > > > > > to fix (rather then suggesting a solution without clearly d=
efining the
> > > > > > > > problem) and then we can see from there.
> > > > > > >=20
> > > > > > > I though I described it good enough in the first paragraph bu=
t I guess
> > > > > > > not, sorry. You should be able to get it from my comments abo=
ve, if not
> > > > > > > please let me know :)
> > > > > >=20
> > > > > > No problem, I have enough context now. I personally like my ude=
v change
> > > > > > event idea, which seems more KISS. But ultimately this is Benja=
min's call.
> > > > >=20
> > > > > Yes, I don't know about the application details (I'll have to fin=
d out
> > > > > :P) but it makes more sense to me. It avoids breaking the userspa=
ce
> > > > > behavior.
> > > >=20
> > > > The udev change doesn't "break" userspace, but it is a new API. And
> > > > that means nightmare from the application point of view:
> > > > How do they know that the new API will be used? There is a high cha=
nce
> > > > they won't, so for backward compatibility they will start listening=
 to
> > > > the hidraw node to match the current kernel behavior, and then we
> > > > would just have added a new API for nothing.
> > >=20
> > > I agree that finding out if the udev change events are supported
> > > is a bit of a challenge from userspace.
> > >=20
> > > But if I understood you correctly, then libratbag currently does
> > > not keep listening to detect the connect, but rather atm this just
> > > does not work, in which case it does not need to know if the new API
> > > is there it can just assume; and even if it does need to know it
> > > check the kernel-version number for that. Not pretty but that is
> > > e.g. what libusb does to detect if certain "undetectable" features
> > > are there, which admittedly is not ideal.
> >=20
> > Actually, since the latest release, libratbag would not require any
> > changes. Please note that the proposal is to split the current hidraw
> > node in two, one with just normal HID events, and one with just HID++.
> > In 26c534cc742dfdbb14a889287f7771063be834cc (libratbag) we started
> > parsing the report descriptors to find out the supported report IDs,
> > the node with the normal HID events will fail on hidpp20_device_new
> > because it won't support any HID++ reports.
> >=20
> > > > > Benjamin, what do you think?
> > > >=20
> > > > My point of view is:
> > > > - don't add a new kernel API
> > >=20
> > > Again I believe calling udev change events "a new kernel API"
> > > is exaggerating things a bit.
> > >=20
> > > > - rely on existing and supported user space behavior
> > > > - ultimately, teach user space how to deal with the current situati=
on
> > > >=20
> > > > So right now I think Filipe's proposal is the best bad solution. I
> > > > would rank the udev event as worse than Filipe's solution because t=
hat
> > > > involves both userspace and kernel space changes.
> > >=20
> > > The udev solution might require changes on both sides, but they
> > > are very small easily reviewable changes. Anyways as I said this
> > > is your call.
> > >=20
> > > > However, the proposal to add/remove the HID++ hidraw node on
> > > > connect/disconnect really doesn't appeal to me because I am pretty
> > > > sure we will have the same kind of issues that we are facing with
> > > > keyboards. There might be an application that listens to the connec=
t
> > > > HID++ notification and turns the light on in the room whenever the
> > > > mouse reconnects (and turns it off when the mouse disconnects becau=
se
> > > > that means you left the room).
> > > >=20
> > > > So right now, as I am writing this, I think we should split the HID=
++
> > > > node into its own hidraw node. This will allow application to liste=
n
> > > > to this node without being a keylogger as we will be filtering the =
key
> > > > events in the actual input and the other hidraw nodes.
> >=20
> > Do we pass the HID connection notification to userspace? That is a
> > receiver notification, and I though the driver was only passing the
> > device packets.
> >=20
> > I don't understand why hotplugging is an issue? For me it's a feature.
> > The userspace stack should definitely be able to handle it, that's how
> > the corded devices work. By creating/removing the device node on device
> > connect/disconnect we get the same behavior as when plugging/unplugging
> > the mouse with a cable.
> >=20
> > Am I missing something here?
> >=20
> > > It took my a while to wrap my head around this, what you mean here
> > > is that each paired device gets 2 nodes:
> > >=20
> > > 1) A full hidraw node which gets send all events from that paired dev=
ice
> >=20
> > Like I said above, we want to split the node in two. One for the
> > standard HID events (mouse movement, key press, etc.) and one just for
> > HID++. From my understanding, this is also what Benjamin means.
>=20
> I see, so how would this work at the kernel level? AFAICT with the
> current kernel code this would require logitech-dj to create 2 devices
> under /sys/bus/hid/devices one for the HID++ descriptors + events
> and one for the rest. But how is the drivers/hid/hid-logitech-hidpp.c
> driver then supposed to work, AFAICT that needs access to both at
> the same time.
>=20
> Or is the plan to modify the hidraw driver for this somehow?

I was not really thinking about that. I guess Benjamin could clarify on
how to proceed if we decide to do this.

> I guess how this will work on the kernel side is mostly a question for Be=
njamin.
>=20
> I do see how this nicely solves the problem for userspace though,
> it is a bit weird to have hidraw devices with fake descriptors and
> which do not get all events, but we already have that with the
> hidraw devices created for the devices behind the receiver, so I see
> no harm in splitting these "fake" hidraw devices into 2 fake devices
> each.

Yes, it's nothing far from what we are already doing. I like that both
wired and wireless devices would behave exactly the same.

> If someone wants to e.g. capture the full stream for debugging they
> can use the hidraw of the receiver for that. So I guess that this is
> an elegant solution to the problem.

Yes, the receiver node is always available if someone needs it.
Actually, some userspace apps use it instead of the hidraw nodes
exported by this driver.

Thank you,
Filipe La=C3=ADns

--=-f2ucgOFAT9/V3PQE067K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl48bFwACgkQ+JPGdIFq
qV0AjRAAtYJWAcnmd3d6FEfFolZ635eSpvivegMaT70wIHVw2tWCFBeTYZSipl+T
n5I9/hzNOZQsdBGafb1yZBguRa1Ol17OoJlnB3KrpyJwFGgdhc9JQZ47mQxUISjR
G1YHT+Fo6DPyVp6MqMonx9ZUE0wDBDtc70EGvMdb5pVP6m3rgeDY96/u07oXJhY4
zTEYKPocjDiXs91a0Zw03NXzbSmu3XdtHiAz26ZTkA6D69j+2riFpxNaJQODK6J8
h8lcrwYmfOSwaWTmRpyqL050XQ8DRR2yIbjWUG4F/PbsuvCtrcRcU/Fy842oy7Iz
uGpFNtoy71dQc80OJSBKCMqQG/UBWHTReHQpWfcj0XxWep6ickRHqf2TOaC1C2y/
DjRd7QfaZQRLGH4Zj+YX0D1Lr2wSf4raIVwSyFGogqInDWVtpLw/ykKmpnGyEs6R
BNg6cIeIkq6VqDH5Rh3StQt/NWtnGgHSSCV3/f1Sa77QKEXDTPmMpc3qLG3NR9Sa
brYXegkgWHQ3GzeKx4qLI9kKmQaK6b33CeZKEu6P4+kYpP8WuE2hVC0aHMTyR/8J
i+alxEYVwBM2naR4hgiNTWw/79dbFNR9CFbkX0FkcQDREMR93HHqaD0dLCaiY5CH
7sJKEsNsA6ZRyokkgSvR/NPSTXKqkyaNIvQ74K+As7GTDwqO8HQ=
=3UV/
-----END PGP SIGNATURE-----

--=-f2ucgOFAT9/V3PQE067K--
