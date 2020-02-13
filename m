Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D757615C11D
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 16:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgBMPMb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 10:12:31 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43226 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726937AbgBMPMa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 10:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581606748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=daxzcdmFCeB/bP5XQ4XlvJdih4p7UnMT4GXH3+chEgU=;
        b=C87oOxd0qJWek98kRQ1Jk0wLYjxKir+h8yxpNewfLq1LuVrzabnhi1sKoLJQ9DFz6anC3S
        Ps/3dGWA1G/v50JkKN22w0wuuL55ZgHwRA4i+EA3F02rD5TmikF4DKRLgXF5uEsZFdT/ft
        RnL8JmJBGXCz17dvh4FCsNmoiqfYsp0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-orJRJ95uMD-Y32-a3hEc8w-1; Thu, 13 Feb 2020 10:12:25 -0500
X-MC-Unique: orJRJ95uMD-Y32-a3hEc8w-1
Received: by mail-qk1-f199.google.com with SMTP id b23so3888134qkg.17
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2020 07:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=daxzcdmFCeB/bP5XQ4XlvJdih4p7UnMT4GXH3+chEgU=;
        b=MkFh3zV/hIfLT2qe8D+zr3y5PaB99HxknnerN+ePmkekaG3N63fg4DEEYa5Ron5CU6
         ozqw3pRjVmb/Y+MneVUBqiq4EDCBx+03s8PXGbnZ+Qw6fNh53x7g8cZjO3eWJ8xT5O7C
         SwvDyHnRNBh/qxEEuIS0R3Tir/YODK10sfotj36kvB1UbraR8p/a6FpXSj0VIED07l5r
         5KDSIOSj9gvT52B03kSG6LZVf5QcuCPBCgmQk0MQYU17NpCbGlp0fyH17IFS0nCD8He+
         8R62eBNfrGHJzaJ3A2bCHEQt1mhUdw30QXd43K87GO+El3TEMfHwiZpI7hkpJa3fzziy
         2gnw==
X-Gm-Message-State: APjAAAWCuhGC4ZLSIlLad7htERHF1shQ9f/HRFx13934z/3ozFP/s4CG
        T2zb2wIUX6ySGTO4UJXTRTWblN+JtVzngyja0aOZEhBN26EvOtdmeRUgol5bZDAt2gL6tUwTnFm
        mU/w7h7aLg8b0gZw+Y7fRmxkKIuR1QoiVirICmas=
X-Received: by 2002:a37:bc6:: with SMTP id 189mr15593697qkl.459.1581606745331;
        Thu, 13 Feb 2020 07:12:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJhZ1AdZcuig0uiu5p95oXjVmBzWUk84L7eyxik4o9TvtxV35XAvlEKKdkw6FAP1tMAbAbCbtJYRjy2UxJyjc=
X-Received: by 2002:a37:bc6:: with SMTP id 189mr15593669qkl.459.1581606745033;
 Thu, 13 Feb 2020 07:12:25 -0800 (PST)
MIME-Version: 1.0
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
 <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com> <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
 <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com> <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
 <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
 <b867da88-991d-4a9b-7640-4a7994b7112a@redhat.com> <74339066fc673cf95c0306e3005239eeae60761c.camel@archlinux.org>
In-Reply-To: <74339066fc673cf95c0306e3005239eeae60761c.camel@archlinux.org>
From:   Benjamin Tissoires <btissoir@redhat.com>
Date:   Thu, 13 Feb 2020 16:12:14 +0100
Message-ID: <CAO-hwJ+-Og-0OcNo2gWq+XKM6wjw9oWquZTzPCUhTOaMRYQGHg@mail.gmail.com>
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

On Fri, Feb 7, 2020 at 1:37 AM Filipe La=C3=ADns <lains@archlinux.org> wrot=
e:
>
> On Fri, 2020-02-07 at 10:03 +1000, Peter Hutterer wrote:
> > On 7/2/20 3:01 am, Benjamin Tissoires wrote:
> > > On Thu, Feb 6, 2020 at 4:42 PM Filipe La=C3=ADns <lains@archlinux.org=
> wrote:
> > > > On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
> > > > > Hi,
> > > > >
> > > > > On 2/6/20 12:51 PM, Filipe La=C3=ADns wrote:
> > > > > > On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
> > > > > > > HI,
> > > > > > >
> > > > > > > On 2/6/20 12:14 PM, Filipe La=C3=ADns wrote:
> > > > > > > > Hello,
> > > > > > > >
> > > > > > > > Right now the hid-logitech-dj driver will export one node f=
or each
> > > > > > > > connected device, even when the device is not connected. Th=
at causes
> > > > > > > > some trouble because in userspace we don't have have any wa=
y to know if
> > > > > > > > the device is connected or not, so when we try to communica=
te, if the
> > > > > > > > device is disconnected it will fail.
> > > > > > >
> > > > > > > I'm a bit reluctant to make significant changes to how the
> > > > > > > hid-logitech-dj driver works. We have seen a number of regres=
sions
> > > > > > > when it was changed to handle the non unifying receivers and =
I would
> > > > > > > like to avoid more regressions.
> > > > > > >
> > > > > > > Some questions:
> > > > > > > 1. What is the specific use case where you are hitting this?
> > > > > >
> > > > > > For example, in libratbag we enumerate the devices and then pro=
be them.
> > > > > > Currently if the device is not connected, the communication fai=
ls. To
> > > > > > get the device to show up we need to replug it, so it it trigge=
rs udev,
> > > > > > or restart the daemon.
> > > > >
> > > > > Thanks, that is exactly the sort of context to your suggested cha=
nges
> > > > > which I need.
> > > > >
> > > > > > > 2. Can't the userspace tools involved by modified to handle t=
he errors
> > > > > > > they are getting gracefully?
> > > > > >
> > > > > > They can, but the approaches I see are not optimal:
> > > > > >     - Wait for HID events coming from the device, which could n=
ever
> > > > > > happen.
> > > > > >     - Poll the device until it wakes up.
> > > > >
> > > > > I guess we do get some (other or repeated?) event when the device=
 does
> > > > > actually connect, otherwise your suggested changes would not be p=
ossible.
> > > >
> > > > No, I was thinking to just send the HID++ version identification
> > > > routine and see if the device replies.
> > >
> > > Hmm, to continue on these questions:
> > > - yes, the current approach is to have the users of the HID++ device
> > > try to contact the device, get an error from the receiver, then keep
> > > the hidraw node open until we get something out of it, and then we ca=
n
> > > start talking to it
> > > - to your question Hans, when a device connects, it emits a HID++
> > > notification, which we should be relaying in the hidraw node. If not,
> > > well then starting to receive a key or abs event on the input node is
> > > a pretty good hint that the device connected.
> > >
> > > So at any time, the kernel knows which devices are connected among
> > > those that are paired, so the kernel knows a lot more than user space=
.
> > >
> > > The main problem Filipe is facing here is that we specifically
> > > designed libratbag to *not* keep the device nodes opened, and to not
> > > poll on the input events. The reason being... we do not want libratba=
g
> > > to be considered as a keylogger.
> >
> > I'm wondering - can we really get around this long-term? Even if we hav=
e
> > a separate HID++ node and/or udev change events and/or some other
> > notification, in the end you still have some time T between that event
> > and userspace opening the actual event node. Where the first key event
> > wakes up the physical keyboard, you're now racing.
>
> Yes but it doesn't really matter in this case. We would only be
> potentially losing HID++ events, which are not that important, unlike
> normal input events. In fact, libratbag does not care about HID++
> events, they are just ignored.
>
> We would still have the same issue, yes, except here we don't really
> care.

Well, I guess Peter's point is: "yes, you don't care *right now*, but
what if you care in the future, you will have the same race."

>
> > So the separate HID++ node works as long as libratbag *only* listens to
> > that node, as soon as we need to start caring about a normal event it
> > won't work any longer.
>
> You mean when libratbag starts caring about normal input events? What
> is the point of that? Why would we need to do that? Also, as Benjamin
> pointed out, that would classify as a keylogger.

For now, I think we are:
- to solve the immediate user-space problem, implement the udev events
as suggested by Hans. This is minimal code change
- to solve the "keylogger" issue, we can split the HID devices in 2.

This way, we do not have to deal with hotplug races, but can still get
information from the connect event without reading the input events.

Cheers,
Benjamin

>
> Cheers,
> Filipe La=C3=ADns

