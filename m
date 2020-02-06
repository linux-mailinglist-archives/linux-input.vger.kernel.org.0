Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8F21549E2
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 18:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgBFRCU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 12:02:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36592 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727703AbgBFRCU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 12:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581008538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EPn5ga0PnTm77FqEzLEfHLut1HKjn492ATw6NqLbyoo=;
        b=dnbI3Ob8ICGHt1vTS5g8ZWqsYlPGIzGXi8Fs/KhZK8tx3yPzIXmH3ZmNfwS+zlqSHvYZmY
        9HpK1QOWGE5O88f1zPaozFiQS2KqJcxC/+XZbEjI+ZYTNf8vLq1pqnyanXdQn1RLvNZ9U9
        ixawaeE8iSaVGEAP1JjoV3e7yiQWgI0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-2ByqcPMSPpW2gjXcJ3iXIg-1; Thu, 06 Feb 2020 12:02:02 -0500
X-MC-Unique: 2ByqcPMSPpW2gjXcJ3iXIg-1
Received: by mail-qk1-f199.google.com with SMTP id p1so4025764qkh.3
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2020 09:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EPn5ga0PnTm77FqEzLEfHLut1HKjn492ATw6NqLbyoo=;
        b=kaIcmtMvClchOLfkbAFrvEDmTxsANo9958sJ5+THYiNO3nsIM4/ihvlgEzDvlQwCHw
         KnBi2l8a4h32M2QzlWGlLtVjM57udRBByMbM1snkVwmag7yHuLF19TphwLennE/FbB+K
         bPspznQKIEA/eTwh/OULTtQjaRrt0s0vy2nThozdNVeYbczLDreIDiCQlNg0DrEbn3a2
         EEChtOXuA03gslMA8bYjNBnd6FuYEiGu+1kbedahUORXfj7IcfACEl3plHoF9wazTLpJ
         dhKns+iJwT6QruVD7uuRiNy/tmF2rVGO3ncJbEkLsOht0gdEEBhtQshXo786Ka0cy5R9
         aSiw==
X-Gm-Message-State: APjAAAW/EWw0ijefQBEdGx2Yyb5kifWz486Q4PW/lJH/utvS6D+iJBQ7
        +ALMQNeeibDrYZ+pBS/UVSkEG7xeYRkp2bJ0QgGLmstKv8BjZTm1mFLml6mQsV0XU8IeOSkehPV
        foGmwysKRj3oZ8W3CCe+jGfmnt79Fj4LWRQIdbEw=
X-Received: by 2002:a37:9c0c:: with SMTP id f12mr2267708qke.170.1581008521542;
        Thu, 06 Feb 2020 09:02:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvrxZaIPalcC8Np77Yc0x9XkgoKtxXP/nE2wH26MyeP7MV369HgupMKyx6pFrLxf5xhN3V9fkmo5btvqfV/GY=
X-Received: by 2002:a37:9c0c:: with SMTP id f12mr2267654qke.170.1581008521085;
 Thu, 06 Feb 2020 09:02:01 -0800 (PST)
MIME-Version: 1.0
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
 <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com> <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
 <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com> <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
In-Reply-To: <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
From:   Benjamin Tissoires <btissoir@redhat.com>
Date:   Thu, 6 Feb 2020 18:01:49 +0100
Message-ID: <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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

On Thu, Feb 6, 2020 at 4:42 PM Filipe La=C3=ADns <lains@archlinux.org> wrot=
e:
>
> On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
> > Hi,
> >
> > On 2/6/20 12:51 PM, Filipe La=C3=ADns wrote:
> > > On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
> > > > HI,
> > > >
> > > > On 2/6/20 12:14 PM, Filipe La=C3=ADns wrote:
> > > > > Hello,
> > > > >
> > > > > Right now the hid-logitech-dj driver will export one node for eac=
h
> > > > > connected device, even when the device is not connected. That cau=
ses
> > > > > some trouble because in userspace we don't have have any way to k=
now if
> > > > > the device is connected or not, so when we try to communicate, if=
 the
> > > > > device is disconnected it will fail.
> > > >
> > > > I'm a bit reluctant to make significant changes to how the
> > > > hid-logitech-dj driver works. We have seen a number of regressions
> > > > when it was changed to handle the non unifying receivers and I woul=
d
> > > > like to avoid more regressions.
> > > >
> > > > Some questions:
> > > > 1. What is the specific use case where you are hitting this?
> > >
> > > For example, in libratbag we enumerate the devices and then probe the=
m.
> > > Currently if the device is not connected, the communication fails. To
> > > get the device to show up we need to replug it, so it it triggers ude=
v,
> > > or restart the daemon.
> >
> > Thanks, that is exactly the sort of context to your suggested changes
> > which I need.
> >
> > > > 2. Can't the userspace tools involved by modified to handle the err=
ors
> > > > they are getting gracefully?
> > >
> > > They can, but the approaches I see are not optimal:
> > >    - Wait for HID events coming from the device, which could never
> > > happen.
> > >    - Poll the device until it wakes up.
> >
> > I guess we do get some (other or repeated?) event when the device does
> > actually connect, otherwise your suggested changes would not be possibl=
e.
>
> No, I was thinking to just send the HID++ version identification
> routine and see if the device replies.

Hmm, to continue on these questions:
- yes, the current approach is to have the users of the HID++ device
try to contact the device, get an error from the receiver, then keep
the hidraw node open until we get something out of it, and then we can
start talking to it
- to your question Hans, when a device connects, it emits a HID++
notification, which we should be relaying in the hidraw node. If not,
well then starting to receive a key or abs event on the input node is
a pretty good hint that the device connected.

So at any time, the kernel knows which devices are connected among
those that are paired, so the kernel knows a lot more than user space.

The main problem Filipe is facing here is that we specifically
designed libratbag to *not* keep the device nodes opened, and to not
poll on the input events. The reason being... we do not want libratbag
to be considered as a keylogger.

>
> > So how about if we trigger a udev change event on the hid device instea=
d
> > when this happens ? That seems like a less invasive change on the kerne=
l
> > side and then libratbag could listen for these change events?
>
> Yes, that is a good idea :) I did not know this was possible but it
> seems like a better approach.

Not a big fan of that idea personally. This will add yet an other
kernel API that we have to maintain.
On Filipe's side, the hotplug support is something that has been
around for quite a long time now, so we can safely expect applications
to handle it properly.

>
> > > > 3. Is there a bugreport open about this somewhere?
> > >
> > > Yes, https://github.com/libratbag/libratbag/issues/785
> > >
> > > > > The reason we do this is because otherwise we would loose the fir=
st
> > > > > packets when the device is turned on by key press. When a device =
is
> > > > > turned on we would have to create the device node, and the packet=
s
> > > > > received while we are creating the device node would be lost.
> > > >
> > > > I don't believe that this is the reason, we only create hid child
> > > > devices for devices reported by the receiver, but some of the non
> > > > unifying hid receiver send a list of all devices paired, rather
> > > > then the ones which are actually connected at that time.
> > >
> > > IIRC from my chats with Benjamin and Peter this is the reason, but
> > > please correct me if I'm wrong.

Filipe is correct here.

For unifying devices, we can have up to 6 devices paired to a
receiver, 3 can be used at the same time (connected).
For the cheap receivers, we can enumerate 2 paired devices, but they
are not necessarily connected too.

Historically, when I first wrote the hid-logitech-hidpp driver, I
wanted to not export a non connected device. But as mentioned by
Filipe, this was posing issues mainly for keyboards, because generally
the first thing you type on a keyboard is your password, and you don't
necessarily have the feedback to see which keys you typed.

So we (Nestor and I) decided to almost always create the input nodes
when the device was not connected. The exceptions are when we need
some device communication to set up the input node: so just for the
touchpads.

> >
> > Could be that we can distinguish between "paired" and "connected"
> > and that we are enumerating "paired" but not (yet) "connected"
> > devices already because of what you say, I've not touched this
> > code in a while.

That is correct. Paired doesn't mean connected.

>
> We create nodes for all paired devices, no matter if they are connected
> or not.
>
> > > > > This could solved by buffering those packets, but that is a bad s=
olution as
> > > > > it would mess up the timings.
> > > > >
> > > > > At the moment the created node includes both normal HID and vendo=
r
> > > > > usages. To solve this problem, I propose that instead of creating=
 a
> > > > > single device node that contains all usages, we create one for no=
rmal
> > > > > HID, which would exist all the time, and one for the vendor usage=
,
> > > > > which would go away when the device disconnects. >
> > > > > This slight behavior change will affect userspace. Two hidraw nod=
es
> > > > > would be created instead of one. We need to make sure the current
> > > > > userspace stacks interfacing with this would be able to properly =
handle
> > > > > such changes.
> > > > >
> > > > > What do you think of this approach? Anyone has a better idea?
> > > >
> > > > The suggested approach sounds fragile and like it adds complexity t=
o
> > > > an already not simple driver.

OTOH, this is what we have been trying to do in the kernel for years
now: have one single node per application/usage, so we can rely on
some valid data from the user space.

I don't think the complexity of the driver should be a problem here.
Yes, it's a complex one, but introducing a new API for that is a no
from me.

> > >
> > > I understand, that is totally reasonable. I am working on a CI for th=
e
> > > driver if that helps.
> > >
> > > > It would be helpful to first describe the actual problem you are tr=
ying
> > > > to fix (rather then suggesting a solution without clearly defining =
the
> > > > problem) and then we can see from there.
> > >
> > > I though I described it good enough in the first paragraph but I gues=
s
> > > not, sorry. You should be able to get it from my comments above, if n=
ot
> > > please let me know :)
> >
> > No problem, I have enough context now. I personally like my udev change
> > event idea, which seems more KISS. But ultimately this is Benjamin's ca=
ll.
>
> Yes, I don't know about the application details (I'll have to find out
> :P) but it makes more sense to me. It avoids breaking the userspace
> behavior.

The udev change doesn't "break" userspace, but it is a new API. And
that means nightmare from the application point of view:
How do they know that the new API will be used? There is a high chance
they won't, so for backward compatibility they will start listening to
the hidraw node to match the current kernel behavior, and then we
would just have added a new API for nothing.

>
> Benjamin, what do you think?

My point of view is:
- don't add a new kernel API
- rely on existing and supported user space behavior
- ultimately, teach user space how to deal with the current situation

So right now I think Filipe's proposal is the best bad solution. I
would rank the udev event as worse than Filipe's solution because that
involves both userspace and kernel space changes.

However, the proposal to add/remove the HID++ hidraw node on
connect/disconnect really doesn't appeal to me because I am pretty
sure we will have the same kind of issues that we are facing with
keyboards. There might be an application that listens to the connect
HID++ notification and turns the light on in the room whenever the
mouse reconnects (and turns it off when the mouse disconnects because
that means you left the room).

So right now, as I am writing this, I think we should split the HID++
node into its own hidraw node. This will allow application to listen
to this node without being a keylogger as we will be filtering the key
events in the actual input and the other hidraw nodes.

But then, applications will have to learn how to listen to the HID++
node, especially given that they are talking HID++ in the first place.

Cheers,
Benjamin

