Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4767B15C777
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 17:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgBMQK7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 11:10:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22967 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727652AbgBMQKt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 11:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581610246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o+iEwLF14DE3VhPx8oQ1s5YrufxCmQv7bYflR0lGLvI=;
        b=S3vbwq2C+HknZgwNak8Kl4E1uikY45se0mVl/iI7Osx1vZX3POxcy75QQAGaMZbuatyUqG
        yZrk1mJv+m1IBJ6pIZ2OYvl03cKjcg5D3P1GaBsHrLsbyOgux5iLAH6Z6i/QmYVzqZ74fF
        9E2LvxhABawIx8dkcBXQkkDcUahTTdI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-GihNgo2aMZq83ZbQfbvT0w-1; Thu, 13 Feb 2020 11:10:44 -0500
X-MC-Unique: GihNgo2aMZq83ZbQfbvT0w-1
Received: by mail-qk1-f199.google.com with SMTP id y6so4025982qki.13
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2020 08:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o+iEwLF14DE3VhPx8oQ1s5YrufxCmQv7bYflR0lGLvI=;
        b=FZ2TY+NVgArPmbBwgxKjNJ4nHy/QAbPBFLZmSnB6ETconKIJSDI5621+KcaJ0Y+TL4
         3ngp3L2GXWolExbNIn9C+X0Z7BOE0sLO+gcgIIdgRD9alme+GDtKryuQTmwBXTK9UCK/
         MeD2LQ4TaUSSipyucRawO2rLqfqoy/YZwBd+dGroDaCRe9IUTypeET29KHy7gWbkPghP
         8nNLQiRZAxLFMaGShelkB8G8iTPOLXRUE1FZ0/LVXDurtfwwqOBxcL7QMJ6Ld23CekTD
         +pzAuvLLIkV67R6VmErrP12hpvsoOukXReKEjV8TGTCDjoZiaVSzCtdf5hTAdXnq7iqr
         7BFw==
X-Gm-Message-State: APjAAAWc53sbplM0JI2sFtnCRv7OAukDZq3qxELXPrVO3GQDjmNyBvSD
        Kp5qXs23fjdZTUGyaC061fzFR/9dBcGEnUB+FMLTmh7EAWkeY/lEyHLmd8ZTkrN34ANhJxDpcMs
        s8vBj8itjLOXrmkA21yRBqfWvlQ/cVfrx9VEOWrw=
X-Received: by 2002:a05:620a:545:: with SMTP id o5mr10496234qko.27.1581610243762;
        Thu, 13 Feb 2020 08:10:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuCpPdUzySzrQs5TM+3pCLei77Av6gpK9/AS1JGZoAjPx+U85tfC/xgaPrDsvy5iMs3wjdCpwCglvtU8ahE08=
X-Received: by 2002:a05:620a:545:: with SMTP id o5mr10496206qko.27.1581610243428;
 Thu, 13 Feb 2020 08:10:43 -0800 (PST)
MIME-Version: 1.0
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
 <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com> <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
 <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com> <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
 <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
 <b867da88-991d-4a9b-7640-4a7994b7112a@redhat.com> <74339066fc673cf95c0306e3005239eeae60761c.camel@archlinux.org>
 <CAO-hwJ+-Og-0OcNo2gWq+XKM6wjw9oWquZTzPCUhTOaMRYQGHg@mail.gmail.com> <b55426351a0853aa59e100a4f313df24323b0fa6.camel@archlinux.org>
In-Reply-To: <b55426351a0853aa59e100a4f313df24323b0fa6.camel@archlinux.org>
From:   Benjamin Tissoires <btissoir@redhat.com>
Date:   Thu, 13 Feb 2020 17:10:32 +0100
Message-ID: <CAO-hwJK=9z3TyONqHUp_9Qzwrn-y7kHkg+Uzk_k=YbPhNU=H_Q@mail.gmail.com>
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Peter Hutterer <peter.hutterer@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
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

On Thu, Feb 13, 2020 at 4:25 PM Filipe La=C3=ADns <lains@archlinux.org> wro=
te:
>
> On Thu, 2020-02-13 at 16:12 +0100, Benjamin Tissoires wrote:
> > On Fri, Feb 7, 2020 at 1:37 AM Filipe La=C3=ADns <lains@archlinux.org> =
wrote:
> > > On Fri, 2020-02-07 at 10:03 +1000, Peter Hutterer wrote:
> > > > On 7/2/20 3:01 am, Benjamin Tissoires wrote:
> > > > > On Thu, Feb 6, 2020 at 4:42 PM Filipe La=C3=ADns <lains@archlinux=
.org> wrote:
> > > > > > On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On 2/6/20 12:51 PM, Filipe La=C3=ADns wrote:
> > > > > > > > On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
> > > > > > > > > HI,
> > > > > > > > >
> > > > > > > > > On 2/6/20 12:14 PM, Filipe La=C3=ADns wrote:
> > > > > > > > > > Hello,
> > > > > > > > > >
> > > > > > > > > > Right now the hid-logitech-dj driver will export one no=
de for each
> > > > > > > > > > connected device, even when the device is not connected=
. That causes
> > > > > > > > > > some trouble because in userspace we don't have have an=
y way to know if
> > > > > > > > > > the device is connected or not, so when we try to commu=
nicate, if the
> > > > > > > > > > device is disconnected it will fail.
> > > > > > > > >
> > > > > > > > > I'm a bit reluctant to make significant changes to how th=
e
> > > > > > > > > hid-logitech-dj driver works. We have seen a number of re=
gressions
> > > > > > > > > when it was changed to handle the non unifying receivers =
and I would
> > > > > > > > > like to avoid more regressions.
> > > > > > > > >
> > > > > > > > > Some questions:
> > > > > > > > > 1. What is the specific use case where you are hitting th=
is?
> > > > > > > >
> > > > > > > > For example, in libratbag we enumerate the devices and then=
 probe them.
> > > > > > > > Currently if the device is not connected, the communication=
 fails. To
> > > > > > > > get the device to show up we need to replug it, so it it tr=
iggers udev,
> > > > > > > > or restart the daemon.
> > > > > > >
> > > > > > > Thanks, that is exactly the sort of context to your suggested=
 changes
> > > > > > > which I need.
> > > > > > >
> > > > > > > > > 2. Can't the userspace tools involved by modified to hand=
le the errors
> > > > > > > > > they are getting gracefully?
> > > > > > > >
> > > > > > > > They can, but the approaches I see are not optimal:
> > > > > > > >     - Wait for HID events coming from the device, which cou=
ld never
> > > > > > > > happen.
> > > > > > > >     - Poll the device until it wakes up.
> > > > > > >
> > > > > > > I guess we do get some (other or repeated?) event when the de=
vice does
> > > > > > > actually connect, otherwise your suggested changes would not =
be possible.
> > > > > >
> > > > > > No, I was thinking to just send the HID++ version identificatio=
n
> > > > > > routine and see if the device replies.
> > > > >
> > > > > Hmm, to continue on these questions:
> > > > > - yes, the current approach is to have the users of the HID++ dev=
ice
> > > > > try to contact the device, get an error from the receiver, then k=
eep
> > > > > the hidraw node open until we get something out of it, and then w=
e can
> > > > > start talking to it
> > > > > - to your question Hans, when a device connects, it emits a HID++
> > > > > notification, which we should be relaying in the hidraw node. If =
not,
> > > > > well then starting to receive a key or abs event on the input nod=
e is
> > > > > a pretty good hint that the device connected.
> > > > >
> > > > > So at any time, the kernel knows which devices are connected amon=
g
> > > > > those that are paired, so the kernel knows a lot more than user s=
pace.
> > > > >
> > > > > The main problem Filipe is facing here is that we specifically
> > > > > designed libratbag to *not* keep the device nodes opened, and to =
not
> > > > > poll on the input events. The reason being... we do not want libr=
atbag
> > > > > to be considered as a keylogger.
> > > >
> > > > I'm wondering - can we really get around this long-term? Even if we=
 have
> > > > a separate HID++ node and/or udev change events and/or some other
> > > > notification, in the end you still have some time T between that ev=
ent
> > > > and userspace opening the actual event node. Where the first key ev=
ent
> > > > wakes up the physical keyboard, you're now racing.
> > >
> > > Yes but it doesn't really matter in this case. We would only be
> > > potentially losing HID++ events, which are not that important, unlike
> > > normal input events. In fact, libratbag does not care about HID++
> > > events, they are just ignored.
> > >
> > > We would still have the same issue, yes, except here we don't really
> > > care.
> >
> > Well, I guess Peter's point is: "yes, you don't care *right now*, but
> > what if you care in the future, you will have the same race."
> >
> > > > So the separate HID++ node works as long as libratbag *only* listen=
s to
> > > > that node, as soon as we need to start caring about a normal event =
it
> > > > won't work any longer.
> > >
> > > You mean when libratbag starts caring about normal input events? What
> > > is the point of that? Why would we need to do that? Also, as Benjamin
> > > pointed out, that would classify as a keylogger.
> >
> > For now, I think we are:
> > - to solve the immediate user-space problem, implement the udev events
> > as suggested by Hans. This is minimal code change
>
> Okay, great. So, this would be step 1, it would fix the immediate
> problem with no breakage.
>
> > - to solve the "keylogger" issue, we can split the HID devices in 2.
>
> This can come later. libratbag should be able to handle this change
> perfectly fine but we need to check with the other projects. If needed,
> I will test the change on the impacted projects and try submit the
> required patches to handle the new behavior properly to the upstreams.
>
> Just to make sure: we want to actually split the devices, not just add
> another node for only HID++ or something like that.

I *think* splitting would make more sense. I might be wrong though :)

>
> Quick question: is there any way for us to make userspace able to tell
> the nodes apart without having to get the rdesc via an ioctl? Perhaps
> exporting that information via sysfs?

Nope, not sysfs please. We can have a udev builtin that opens the
rdesc once and tags the device if this is necessary, but the less in
the kernel for that the better.

Cheers,
Benjamin

