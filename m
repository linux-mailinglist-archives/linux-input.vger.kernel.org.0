Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F46B15C105
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 16:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbgBMPHW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 10:07:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26095 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726937AbgBMPHV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 10:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581606440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MvAF4ntzIGM6XZGJH0nyaPWEHYFjvNLg3Txb65/G6Gs=;
        b=f+v5RD0YO3hEgDZiGQimbTzyM0rsKgR9rdaPf8gQyh7F0vOgI2DHhwCR5jpoClhf3J2F6Q
        8ApeBwvQ8CYJcGnEXFrWJYOPGhE3K9iUSeeD/g89DZqydfv+tBX2rDULWAQKT1MddDXS0m
        hKyLkt8wfvag8z6ep5xZ1Lw9kpVUods=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-bstXNgkwPzC6-6Kvij9JhA-1; Thu, 13 Feb 2020 10:07:17 -0500
X-MC-Unique: bstXNgkwPzC6-6Kvij9JhA-1
Received: by mail-qk1-f199.google.com with SMTP id o22so3914940qko.2
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2020 07:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MvAF4ntzIGM6XZGJH0nyaPWEHYFjvNLg3Txb65/G6Gs=;
        b=lpwwBQR2Kb+dj37INIkvwfPhdTIFQpodPp2ebg3P7LWpzT1jHELJOc1UhnWrHZxXtj
         0gZnpIY8HhQf7LqJCWuTdMJdad2RjjoauoPAiocMvGWbDjYmftBxaSZCm3oGwmqPAing
         eMwKMeFGanTHiz2mlFEfrWbBrHtRCAnJsIIVpO+BfIA1V8cTii2ujZk/zDYohhRrKASc
         6z4sRTfsG1/z+9HtVPKhsZ7YnjKxijThD/2mQLF4QhN5MtXAyS7wfzcl5WmaqXIVSFjK
         lpzC2WFfbZK3KVgezyq75bzSa6UcGxFwT2U0eCdU3h9q8pagjK2pHZ/fxVop6e5EcOOR
         ji2g==
X-Gm-Message-State: APjAAAWqX2VWT1qcBsMsxRnB87DUY2NNT/NiVBGbljcL7zAEbV3Lv4Os
        Ia4HvaY5orWrDijtF0Lpob1LaIujLlQCGRJc3OwwoLC9JVW539Jdqb0+EP2Ugvh8vfJXL8CmHf8
        PLD/UeQ/kFeXy9qU80HBFBdA8RwMyxF8+aWRGLes=
X-Received: by 2002:a0c:b61c:: with SMTP id f28mr12172802qve.101.1581606436462;
        Thu, 13 Feb 2020 07:07:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2CxFvsm9F+PM/+8TzXR8uSXSE9q6dqi4wzRGkRkxeA5heAwXHeNdKsn9EQAvt7Z2IKbFlZYZwuoWwRpDeJK8=
X-Received: by 2002:a0c:b61c:: with SMTP id f28mr12172746qve.101.1581606435885;
 Thu, 13 Feb 2020 07:07:15 -0800 (PST)
MIME-Version: 1.0
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
 <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com> <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
 <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com> <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
 <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
 <80aaf01d-fd9f-49fe-44cf-67710a0d136c@redhat.com> <c92b913816366b8744ebcb3d067d968431cfffb2.camel@archlinux.org>
 <28244ac8-9b8d-2950-b282-4db5cf7bf9b2@redhat.com>
In-Reply-To: <28244ac8-9b8d-2950-b282-4db5cf7bf9b2@redhat.com>
From:   Benjamin Tissoires <btissoir@redhat.com>
Date:   Thu, 13 Feb 2020 16:07:04 +0100
Message-ID: <CAO-hwJJ3uLgwUGqEUJ7eUFvf+AfebOD4vRxvhUJkxS3+QBoXmQ@mail.gmail.com>
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        linux-input <linux-input@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[almost forgot about this thread]

On Thu, Feb 6, 2020 at 8:02 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/6/20 7:43 PM, Filipe La=C3=ADns wrote:
> > On Thu, 2020-02-06 at 18:45 +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 2/6/20 6:01 PM, Benjamin Tissoires wrote:
> >>> On Thu, Feb 6, 2020 at 4:42 PM Filipe La=C3=ADns <lains@archlinux.org=
> wrote:
> >>>> On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On 2/6/20 12:51 PM, Filipe La=C3=ADns wrote:
> >>>>>> On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
> >>>>>>> HI,
> >>>>>>>
> >>>>>>> On 2/6/20 12:14 PM, Filipe La=C3=ADns wrote:
> >>>>>>>> Hello,
> >>>>>>>>
> >>>>>>>> Right now the hid-logitech-dj driver will export one node for ea=
ch
> >>>>>>>> connected device, even when the device is not connected. That ca=
uses
> >>>>>>>> some trouble because in userspace we don't have have any way to =
know if
> >>>>>>>> the device is connected or not, so when we try to communicate, i=
f the
> >>>>>>>> device is disconnected it will fail.
> >>>>>>>
> >>>>>>> I'm a bit reluctant to make significant changes to how the
> >>>>>>> hid-logitech-dj driver works. We have seen a number of regression=
s
> >>>>>>> when it was changed to handle the non unifying receivers and I wo=
uld
> >>>>>>> like to avoid more regressions.
> >>>>>>>
> >>>>>>> Some questions:
> >>>>>>> 1. What is the specific use case where you are hitting this?
> >>>>>>
> >>>>>> For example, in libratbag we enumerate the devices and then probe =
them.
> >>>>>> Currently if the device is not connected, the communication fails.=
 To
> >>>>>> get the device to show up we need to replug it, so it it triggers =
udev,
> >>>>>> or restart the daemon.
> >>>>>
> >>>>> Thanks, that is exactly the sort of context to your suggested chang=
es
> >>>>> which I need.
> >>>>>
> >>>>>>> 2. Can't the userspace tools involved by modified to handle the e=
rrors
> >>>>>>> they are getting gracefully?
> >>>>>>
> >>>>>> They can, but the approaches I see are not optimal:
> >>>>>>      - Wait for HID events coming from the device, which could nev=
er
> >>>>>> happen.
> >>>>>>      - Poll the device until it wakes up.
> >>>>>
> >>>>> I guess we do get some (other or repeated?) event when the device d=
oes
> >>>>> actually connect, otherwise your suggested changes would not be pos=
sible.
> >>>>
> >>>> No, I was thinking to just send the HID++ version identification
> >>>> routine and see if the device replies.
> >>>
> >>> Hmm, to continue on these questions:
> >>> - yes, the current approach is to have the users of the HID++ device
> >>> try to contact the device, get an error from the receiver, then keep
> >>> the hidraw node open until we get something out of it, and then we ca=
n
> >>> start talking to it
> >>> - to your question Hans, when a device connects, it emits a HID++
> >>> notification, which we should be relaying in the hidraw node. If not,
> >>> well then starting to receive a key or abs event on the input node is
> >>> a pretty good hint that the device connected.
> >>>
> >>> So at any time, the kernel knows which devices are connected among
> >>> those that are paired, so the kernel knows a lot more than user space=
.
> >>
> >> Ack.
> >>
> >>> The main problem Filipe is facing here is that we specifically
> >>> designed libratbag to *not* keep the device nodes opened, and to not
> >>> poll on the input events. The reason being... we do not want libratba=
g
> >>> to be considered as a keylogger.
> >>
> >> Ack.
> >>
> >>>>> So how about if we trigger a udev change event on the hid device in=
stead
> >>>>> when this happens ? That seems like a less invasive change on the k=
ernel
> >>>>> side and then libratbag could listen for these change events?
> >>>>
> >>>> Yes, that is a good idea :) I did not know this was possible but it
> >>>> seems like a better approach.
> >>>
> >>> Not a big fan of that idea personally. This will add yet an other
> >>> kernel API that we have to maintain.
> >>> On Filipe's side, the hotplug support is something that has been
> >>> around for quite a long time now, so we can safely expect application=
s
> >>> to handle it properly.
> >>
> >> The suggested udev event change would just require a small change
> >> to the existing hotplug handling, currently it responds to udev
> >> "add" and "remove" events. With my suggested change in the "add"
> >> path it will get an error because the device is not connected and
> >> then stop adding the device. Combine this with treating "change"
> >> events as "add" events and that is all that has to change on the
> >> libratbag side.
> >>
> >> This assumes that duplicate add events are already filtered out,
> >> which one has to do anyways to avoid coldplug enumeration vs
> >> hotplug races.
> >>
> >> As for yet another kernel API to maintain, udev change events
> >> already are an existing kernel API, what would be new is the hidpp
> >> driver; and just the hidpp driver emitting them.
> >>
> >> All that is needed on the kernel side for this is to make the followin=
g
> >> call when we detect a device moves from the paired to the connected st=
ate:
> >>
> >>      kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
> >>
> >> And there even seems to be a precedent for this, drivers/hid/hid-wiimo=
te-core.c
> >> already does this for what seems to be similar reasons.

Oooh, so yes, that would be an elegant way of solving this. We don't
use KOBJ_CHANGE in the input stack, so there should be no harm in
using it for that purpose.

> >>
> >>
> >>>>>>> 3. Is there a bugreport open about this somewhere?
> >>>>>>
> >>>>>> Yes, https://github.com/libratbag/libratbag/issues/785
> >>>>>>
> >>>>>>>> The reason we do this is because otherwise we would loose the fi=
rst
> >>>>>>>> packets when the device is turned on by key press. When a device=
 is
> >>>>>>>> turned on we would have to create the device node, and the packe=
ts
> >>>>>>>> received while we are creating the device node would be lost.
> >>>>>>>
> >>>>>>> I don't believe that this is the reason, we only create hid child
> >>>>>>> devices for devices reported by the receiver, but some of the non
> >>>>>>> unifying hid receiver send a list of all devices paired, rather
> >>>>>>> then the ones which are actually connected at that time.
> >>>>>>
> >>>>>> IIRC from my chats with Benjamin and Peter this is the reason, but
> >>>>>> please correct me if I'm wrong.
> >>>
> >>> Filipe is correct here.
> >>>
> >>> For unifying devices, we can have up to 6 devices paired to a
> >>> receiver, 3 can be used at the same time (connected).
> >>> For the cheap receivers, we can enumerate 2 paired devices, but they
> >>> are not necessarily connected too.
> >>>
> >>> Historically, when I first wrote the hid-logitech-hidpp driver, I
> >>> wanted to not export a non connected device. But as mentioned by
> >>> Filipe, this was posing issues mainly for keyboards, because generall=
y
> >>> the first thing you type on a keyboard is your password, and you don'=
t
> >>> necessarily have the feedback to see which keys you typed.
> >>>
> >>> So we (Nestor and I) decided to almost always create the input nodes
> >>> when the device was not connected. The exceptions are when we need
> >>> some device communication to set up the input node: so just for the
> >>> touchpads.
> >>
> >> Ok.
> >>
> >>
> >>>>> Could be that we can distinguish between "paired" and "connected"
> >>>>> and that we are enumerating "paired" but not (yet) "connected"
> >>>>> devices already because of what you say, I've not touched this
> >>>>> code in a while.
> >>>
> >>> That is correct. Paired doesn't mean connected.
> >>>
> >>>> We create nodes for all paired devices, no matter if they are connec=
ted
> >>>> or not.
> >>>>
> >>>>>>>> This could solved by buffering those packets, but that is a bad =
solution as
> >>>>>>>> it would mess up the timings.
> >>>>>>>>
> >>>>>>>> At the moment the created node includes both normal HID and vend=
or
> >>>>>>>> usages. To solve this problem, I propose that instead of creatin=
g a
> >>>>>>>> single device node that contains all usages, we create one for n=
ormal
> >>>>>>>> HID, which would exist all the time, and one for the vendor usag=
e,
> >>>>>>>> which would go away when the device disconnects. >
> >>>>>>>> This slight behavior change will affect userspace. Two hidraw no=
des
> >>>>>>>> would be created instead of one. We need to make sure the curren=
t
> >>>>>>>> userspace stacks interfacing with this would be able to properly=
 handle
> >>>>>>>> such changes.
> >>>>>>>>
> >>>>>>>> What do you think of this approach? Anyone has a better idea?
> >>>>>>>
> >>>>>>> The suggested approach sounds fragile and like it adds complexity=
 to
> >>>>>>> an already not simple driver.
> >>>
> >>> OTOH, this is what we have been trying to do in the kernel for years
> >>> now: have one single node per application/usage, so we can rely on
> >>> some valid data from the user space.
> >>>
> >>> I don't think the complexity of the driver should be a problem here.
> >>> Yes, it's a complex one, but introducing a new API for that is a no
> >>> from me.
> >>
> >> udev change events are not "adding a new API" there are a well known
> >> API using e.g. for monitor plug/unplug in the drm subsys, etc. Yes
> >> using them in the HID subsys this way is somewhat new.

OK. Would be using the KOBJ_CHANGE for "the device connected"
something in line with what is done in the drm  subsystem?

> >>
> >>>>>> I understand, that is totally reasonable. I am working on a CI for=
 the
> >>>>>> driver if that helps.
> >>>>>>
> >>>>>>> It would be helpful to first describe the actual problem you are =
trying
> >>>>>>> to fix (rather then suggesting a solution without clearly definin=
g the
> >>>>>>> problem) and then we can see from there.
> >>>>>>
> >>>>>> I though I described it good enough in the first paragraph but I g=
uess
> >>>>>> not, sorry. You should be able to get it from my comments above, i=
f not
> >>>>>> please let me know :)
> >>>>>
> >>>>> No problem, I have enough context now. I personally like my udev ch=
ange
> >>>>> event idea, which seems more KISS. But ultimately this is Benjamin'=
s call.
> >>>>
> >>>> Yes, I don't know about the application details (I'll have to find o=
ut
> >>>> :P) but it makes more sense to me. It avoids breaking the userspace
> >>>> behavior.
> >>>
> >>> The udev change doesn't "break" userspace, but it is a new API. And
> >>> that means nightmare from the application point of view:
> >>> How do they know that the new API will be used? There is a high chanc=
e
> >>> they won't, so for backward compatibility they will start listening t=
o
> >>> the hidraw node to match the current kernel behavior, and then we
> >>> would just have added a new API for nothing.
> >>
> >> I agree that finding out if the udev change events are supported
> >> is a bit of a challenge from userspace.
> >>
> >> But if I understood you correctly, then libratbag currently does
> >> not keep listening to detect the connect, but rather atm this just
> >> does not work, in which case it does not need to know if the new API
> >> is there it can just assume; and even if it does need to know it
> >> check the kernel-version number for that. Not pretty but that is
> >> e.g. what libusb does to detect if certain "undetectable" features
> >> are there, which admittedly is not ideal.
> >
> > Actually, since the latest release, libratbag would not require any
> > changes. Please note that the proposal is to split the current hidraw
> > node in two, one with just normal HID events, and one with just HID++.
> > In 26c534cc742dfdbb14a889287f7771063be834cc (libratbag) we started
> > parsing the report descriptors to find out the supported report IDs,
> > the node with the normal HID events will fail on hidpp20_device_new
> > because it won't support any HID++ reports.
> >
> >>>> Benjamin, what do you think?
> >>>
> >>> My point of view is:
> >>> - don't add a new kernel API
> >>
> >> Again I believe calling udev change events "a new kernel API"
> >> is exaggerating things a bit.
> >>
> >>> - rely on existing and supported user space behavior
> >>> - ultimately, teach user space how to deal with the current situation
> >>>
> >>> So right now I think Filipe's proposal is the best bad solution. I
> >>> would rank the udev event as worse than Filipe's solution because tha=
t
> >>> involves both userspace and kernel space changes.
> >>
> >> The udev solution might require changes on both sides, but they
> >> are very small easily reviewable changes. Anyways as I said this
> >> is your call.
> >>
> >>> However, the proposal to add/remove the HID++ hidraw node on
> >>> connect/disconnect really doesn't appeal to me because I am pretty
> >>> sure we will have the same kind of issues that we are facing with
> >>> keyboards. There might be an application that listens to the connect
> >>> HID++ notification and turns the light on in the room whenever the
> >>> mouse reconnects (and turns it off when the mouse disconnects because
> >>> that means you left the room).
> >>>
> >>> So right now, as I am writing this, I think we should split the HID++
> >>> node into its own hidraw node. This will allow application to listen
> >>> to this node without being a keylogger as we will be filtering the ke=
y
> >>> events in the actual input and the other hidraw nodes.
> >
> > Do we pass the HID connection notification to userspace? That is a
> > receiver notification, and I though the driver was only passing the
> > device packets.
> >
> > I don't understand why hotplugging is an issue? For me it's a feature.
> > The userspace stack should definitely be able to handle it, that's how
> > the corded devices work. By creating/removing the device node on device
> > connect/disconnect we get the same behavior as when plugging/unplugging
> > the mouse with a cable.
> >
> > Am I missing something here?
> >
> >> It took my a while to wrap my head around this, what you mean here
> >> is that each paired device gets 2 nodes:
> >>
> >> 1) A full hidraw node which gets send all events from that paired devi=
ce
> >
> > Like I said above, we want to split the node in two. One for the
> > standard HID events (mouse movement, key press, etc.) and one just for
> > HID++. From my understanding, this is also what Benjamin means.
>
> I see, so how would this work at the kernel level? AFAICT with the
> current kernel code this would require logitech-dj to create 2 devices
> under /sys/bus/hid/devices one for the HID++ descriptors + events
> and one for the rest. But how is the drivers/hid/hid-logitech-hidpp.c
> driver then supposed to work, AFAICT that needs access to both at
> the same time.

Hmm, this is yet to be decided, yes. But hid-logitech-hidpp already
deals with more than one hid device for a physical peripheral, because
in the corded case, we might have 2 or 3 HID endpoints for one device.

>
> Or is the plan to modify the hidraw driver for this somehow?

Nope, no changes in hidraw.

>
> I guess how this will work on the kernel side is mostly a question for Be=
njamin.
>
> I do see how this nicely solves the problem for userspace though,
> it is a bit weird to have hidraw devices with fake descriptors and
> which do not get all events, but we already have that with the
> hidraw devices created for the devices behind the receiver, so I see
> no harm in splitting these "fake" hidraw devices into 2 fake devices
> each.

Yeah, the idea is to have a clean userspace implementation. OTOH, if
the udev change is sufficient, we might never implement this split
until the next need.

Cheers,
Benjamin

>
> If someone wants to e.g. capture the full stream for debugging they
> can use the hidraw of the receiver for that. So I guess that this is
> an elegant solution to the problem.
>
> Regards,
>
> Hans
>

