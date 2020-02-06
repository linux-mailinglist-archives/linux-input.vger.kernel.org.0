Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D0C154B5F
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 19:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgBFSnz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 13:43:55 -0500
Received: from orion.archlinux.org ([88.198.91.70]:35266 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgBFSnz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 13:43:55 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 971D618B4F78A5;
        Thu,  6 Feb 2020 18:43:50 +0000 (UTC)
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
        Thu,  6 Feb 2020 18:43:49 +0000 (UTC)
Message-ID: <c92b913816366b8744ebcb3d067d968431cfffb2.camel@archlinux.org>
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
In-Reply-To: <80aaf01d-fd9f-49fe-44cf-67710a0d136c@redhat.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
         <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
         <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
         <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
         <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
         <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
         <80aaf01d-fd9f-49fe-44cf-67710a0d136c@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-MNTbVSqDRk8H4m3xbWXM"
Date:   Thu, 06 Feb 2020 18:43:48 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-MNTbVSqDRk8H4m3xbWXM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-06 at 18:45 +0100, Hans de Goede wrote:
> Hi,
>=20
> On 2/6/20 6:01 PM, Benjamin Tissoires wrote:
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
>=20
> Ack.
>=20
> > The main problem Filipe is facing here is that we specifically
> > designed libratbag to *not* keep the device nodes opened, and to not
> > poll on the input events. The reason being... we do not want libratbag
> > to be considered as a keylogger.
>=20
> Ack.
>=20
> > > > So how about if we trigger a udev change event on the hid device in=
stead
> > > > when this happens ? That seems like a less invasive change on the k=
ernel
> > > > side and then libratbag could listen for these change events?
> > >=20
> > > Yes, that is a good idea :) I did not know this was possible but it
> > > seems like a better approach.
> >=20
> > Not a big fan of that idea personally. This will add yet an other
> > kernel API that we have to maintain.
> > On Filipe's side, the hotplug support is something that has been
> > around for quite a long time now, so we can safely expect applications
> > to handle it properly.
>=20
> The suggested udev event change would just require a small change
> to the existing hotplug handling, currently it responds to udev
> "add" and "remove" events. With my suggested change in the "add"
> path it will get an error because the device is not connected and
> then stop adding the device. Combine this with treating "change"
> events as "add" events and that is all that has to change on the
> libratbag side.
>=20
> This assumes that duplicate add events are already filtered out,
> which one has to do anyways to avoid coldplug enumeration vs
> hotplug races.
>=20
> As for yet another kernel API to maintain, udev change events
> already are an existing kernel API, what would be new is the hidpp
> driver; and just the hidpp driver emitting them.
>=20
> All that is needed on the kernel side for this is to make the following
> call when we detect a device moves from the paired to the connected state=
:
>=20
> 	kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
>=20
> And there even seems to be a precedent for this, drivers/hid/hid-wiimote-=
core.c
> already does this for what seems to be similar reasons.
>
>
> > > > > > 3. Is there a bugreport open about this somewhere?
> > > > >=20
> > > > > Yes, https://github.com/libratbag/libratbag/issues/785
> > > > >=20
> > > > > > > The reason we do this is because otherwise we would loose the=
 first
> > > > > > > packets when the device is turned on by key press. When a dev=
ice is
> > > > > > > turned on we would have to create the device node, and the pa=
ckets
> > > > > > > received while we are creating the device node would be lost.
> > > > > >=20
> > > > > > I don't believe that this is the reason, we only create hid chi=
ld
> > > > > > devices for devices reported by the receiver, but some of the n=
on
> > > > > > unifying hid receiver send a list of all devices paired, rather
> > > > > > then the ones which are actually connected at that time.
> > > > >=20
> > > > > IIRC from my chats with Benjamin and Peter this is the reason, bu=
t
> > > > > please correct me if I'm wrong.
> >=20
> > Filipe is correct here.
> >=20
> > For unifying devices, we can have up to 6 devices paired to a
> > receiver, 3 can be used at the same time (connected).
> > For the cheap receivers, we can enumerate 2 paired devices, but they
> > are not necessarily connected too.
> >=20
> > Historically, when I first wrote the hid-logitech-hidpp driver, I
> > wanted to not export a non connected device. But as mentioned by
> > Filipe, this was posing issues mainly for keyboards, because generally
> > the first thing you type on a keyboard is your password, and you don't
> > necessarily have the feedback to see which keys you typed.
> >=20
> > So we (Nestor and I) decided to almost always create the input nodes
> > when the device was not connected. The exceptions are when we need
> > some device communication to set up the input node: so just for the
> > touchpads.
>=20
> Ok.
>=20
>=20
> > > > Could be that we can distinguish between "paired" and "connected"
> > > > and that we are enumerating "paired" but not (yet) "connected"
> > > > devices already because of what you say, I've not touched this
> > > > code in a while.
> >=20
> > That is correct. Paired doesn't mean connected.
> >=20
> > > We create nodes for all paired devices, no matter if they are connect=
ed
> > > or not.
> > >=20
> > > > > > > This could solved by buffering those packets, but that is a b=
ad solution as
> > > > > > > it would mess up the timings.
> > > > > > >=20
> > > > > > > At the moment the created node includes both normal HID and v=
endor
> > > > > > > usages. To solve this problem, I propose that instead of crea=
ting a
> > > > > > > single device node that contains all usages, we create one fo=
r normal
> > > > > > > HID, which would exist all the time, and one for the vendor u=
sage,
> > > > > > > which would go away when the device disconnects. >
> > > > > > > This slight behavior change will affect userspace. Two hidraw=
 nodes
> > > > > > > would be created instead of one. We need to make sure the cur=
rent
> > > > > > > userspace stacks interfacing with this would be able to prope=
rly handle
> > > > > > > such changes.
> > > > > > >=20
> > > > > > > What do you think of this approach? Anyone has a better idea?
> > > > > >=20
> > > > > > The suggested approach sounds fragile and like it adds complexi=
ty to
> > > > > > an already not simple driver.
> >=20
> > OTOH, this is what we have been trying to do in the kernel for years
> > now: have one single node per application/usage, so we can rely on
> > some valid data from the user space.
> >=20
> > I don't think the complexity of the driver should be a problem here.
> > Yes, it's a complex one, but introducing a new API for that is a no
> > from me.
>=20
> udev change events are not "adding a new API" there are a well known
> API using e.g. for monitor plug/unplug in the drm subsys, etc. Yes
> using them in the HID subsys this way is somewhat new.
>=20
> > > > > I understand, that is totally reasonable. I am working on a CI fo=
r the
> > > > > driver if that helps.
> > > > >=20
> > > > > > It would be helpful to first describe the actual problem you ar=
e trying
> > > > > > to fix (rather then suggesting a solution without clearly defin=
ing the
> > > > > > problem) and then we can see from there.
> > > > >=20
> > > > > I though I described it good enough in the first paragraph but I =
guess
> > > > > not, sorry. You should be able to get it from my comments above, =
if not
> > > > > please let me know :)
> > > >=20
> > > > No problem, I have enough context now. I personally like my udev ch=
ange
> > > > event idea, which seems more KISS. But ultimately this is Benjamin'=
s call.
> > >=20
> > > Yes, I don't know about the application details (I'll have to find ou=
t
> > > :P) but it makes more sense to me. It avoids breaking the userspace
> > > behavior.
> >=20
> > The udev change doesn't "break" userspace, but it is a new API. And
> > that means nightmare from the application point of view:
> > How do they know that the new API will be used? There is a high chance
> > they won't, so for backward compatibility they will start listening to
> > the hidraw node to match the current kernel behavior, and then we
> > would just have added a new API for nothing.
>=20
> I agree that finding out if the udev change events are supported
> is a bit of a challenge from userspace.
>=20
> But if I understood you correctly, then libratbag currently does
> not keep listening to detect the connect, but rather atm this just
> does not work, in which case it does not need to know if the new API
> is there it can just assume; and even if it does need to know it
> check the kernel-version number for that. Not pretty but that is
> e.g. what libusb does to detect if certain "undetectable" features
> are there, which admittedly is not ideal.

Actually, since the latest release, libratbag would not require any
changes. Please note that the proposal is to split the current hidraw
node in two, one with just normal HID events, and one with just HID++.
In 26c534cc742dfdbb14a889287f7771063be834cc (libratbag) we started
parsing the report descriptors to find out the supported report IDs,
the node with the normal HID events will fail on hidpp20_device_new
because it won't support any HID++ reports.

> > > Benjamin, what do you think?
> >=20
> > My point of view is:
> > - don't add a new kernel API
>=20
> Again I believe calling udev change events "a new kernel API"
> is exaggerating things a bit.
>=20
> > - rely on existing and supported user space behavior
> > - ultimately, teach user space how to deal with the current situation
> >=20
> > So right now I think Filipe's proposal is the best bad solution. I
> > would rank the udev event as worse than Filipe's solution because that
> > involves both userspace and kernel space changes.
>=20
> The udev solution might require changes on both sides, but they
> are very small easily reviewable changes. Anyways as I said this
> is your call.
>=20
> > However, the proposal to add/remove the HID++ hidraw node on
> > connect/disconnect really doesn't appeal to me because I am pretty
> > sure we will have the same kind of issues that we are facing with
> > keyboards. There might be an application that listens to the connect
> > HID++ notification and turns the light on in the room whenever the
> > mouse reconnects (and turns it off when the mouse disconnects because
> > that means you left the room).
> >=20
> > So right now, as I am writing this, I think we should split the HID++
> > node into its own hidraw node. This will allow application to listen
> > to this node without being a keylogger as we will be filtering the key
> > events in the actual input and the other hidraw nodes.

Do we pass the HID connection notification to userspace? That is a
receiver notification, and I though the driver was only passing the
device packets.

I don't understand why hotplugging is an issue? For me it's a feature.
The userspace stack should definitely be able to handle it, that's how
the corded devices work. By creating/removing the device node on device
connect/disconnect we get the same behavior as when plugging/unplugging
the mouse with a cable.

Am I missing something here?

> It took my a while to wrap my head around this, what you mean here
> is that each paired device gets 2 nodes:
>=20
> 1) A full hidraw node which gets send all events from that paired device

Like I said above, we want to split the node in two. One for the
standard HID events (mouse movement, key press, etc.) and one just for
HID++. From my understanding, this is also what Benjamin means.

> 2) A special HID++ node which only gets forwarded HID++ events
>=20
> And that second node is only present when the device is connected?
>=20
> Oh, I guess not, I guess you want them both to always be present, but
> now apps can safely keep the HID++ one open because that would not
> make the app a keylogger.
>=20
> > But then, applications will have to learn how to listen to the HID++
> > node, especially given that they are talking HID++ in the first place.
>=20
> So this:
> 1. Would still require changes to both the kernel and userspace side
> 2. Would require some magic way for the app to detect which hidraw node i=
s which
> 3. Would require some magic way for the app to detect that the kernel is =
new
>     enough to support the new spearate HID++ node to avoid waiting for it=
 to show
>     up indefinitely
> 4. Would use existing kernel API in a new way in the form of a special ty=
pe of
>     hidraw node which we did not have before.
>=20
> IOW AFAICT this has all the disadvantages of my udev change proposal.
>=20
> I guess the etxra hidraw node proposal does have the advantage that it wo=
uld give
> us a fd which is safe(r) (*) to pass around for doing HID++ things and wi=
th some
> filtering we might even make it completely safe, that would be a good rea=
son to
> go that route.
>=20
> *) safer, not entirely safe as HID++ can send at least the media keys thr=
ough HID++
> instead of the normal input reports, see e.g. the CONSUMER_VENDOR_KEYS ha=
ndling
> in hid-logitech-hidpp.c and if IIRC it might even be possible to request =
the
> normal keys to be send through HID++.

Thank you,
Filipe La=C3=ADns

--=-MNTbVSqDRk8H4m3xbWXM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl48XmAACgkQ+JPGdIFq
qV21bg//W9IxdY6QSThsE3T83imyxT2/1DVGZ6wvgSg1SiSZi+EOfVHCG0wotirI
0dIHglZ/CSs/efNVZfynBsnXQ4e1cZ7IKao9Ofx6Hl+lHJu4zllmy3xHPJaJ/E5r
TUH0KqAe1+zYNFLfztbQOJXMk9Jb9Uy3FRVOjn2ToUAXSbdXl2XQW1u2wcor07lx
MI9wEJAhv5q3ezHCAYzhfKyo0iol+XVDXqPJmbHRPSDnZqDab93BjDVPm8uBjn5y
63QjuHHxVkTBzeKeicpsZl67g4IUBPEnVtYuMlNoCwWcSGJ3kcgXU5vXQLzelOYr
WHMXYGMbFHrl5Fi2HXeCIs/qd3gts9rbpCdnTXqF5WCRDHs5964oZHpq6AmQeBHd
ynakvp0lMPaFfb01wTZjGg9edUAuIbk2wbQvSjqXl6o2Ut5QL4ucjJXMvOsLbEYv
HBX/zXkARkh0tfvf4nzcu1zo+Hwm5QhwXb7BuZ4ftngO+bmTh3N9+4gN/YIrAbb0
3SU2Fx4lijOc89XZTLG+jEleEb/+vAPMkmaeowXvIkCRALlWojRGjk1rfjHvOE1B
5w25aVvkBIJ+Mlpx2bZGiuFQW+4qweWW8krkbWdBQ5eyGkS1IRIA8abW+U8w0A7Z
Y1euvrZSgFf+/zOEYhWFAC9SAn4bQiHrM3IrWDXLHY77u48o6Cc=
=m9cO
-----END PGP SIGNATURE-----

--=-MNTbVSqDRk8H4m3xbWXM--
