Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC0045B27C
	for <lists+linux-input@lfdr.de>; Wed, 24 Nov 2021 04:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbhKXDP5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 22:15:57 -0500
Received: from smtp161.vfemail.net ([146.59.185.161]:35191 "EHLO
        smtp161.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235128AbhKXDP4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 22:15:56 -0500
Received: (qmail 5374 invoked from network); 24 Nov 2021 03:12:46 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 24 Nov 2021 03:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=IJ3maCvdDBep
        jC+VBuaf0rHuv1D9SuN0aOu4sfd9Jv4=; b=osAgjpo4m744VjIPhGLKafh+T+Im
        p4Fh3cZC90BZYEykSyF/eVJIatr+BWkgI3VAFH+XlnFn5lcAZkAIYngMd8fLP+k+
        zZOOlOQTtkaZKidiV/eA2qGKR3/xXFIoBiM7di0g+MfP9q7UGkEyG4ThAV9C/yTF
        Mzm8d1gIitOQt/0=
Received: (qmail 72259 invoked from network); 24 Nov 2021 03:12:16 -0000
Received: by simscan 1.4.0 ppid: 72241, pid: 72253, t: 0.4285s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 24 Nov 2021 03:12:15 -0000
Date:   Tue, 23 Nov 2021 22:12:41 -0500
From:   David Niklas <Hgntkwis@vfemail.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <20211123221241.3cdb4e66@Zen-II-x12.niklas.com>
In-Reply-To: <CAO-hwJJtQ_1S76HTaHK=oUeP1M24QnC6z1J5CvTuU7m=oZe6zg@mail.gmail.com>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
        <20211114144842.72463ccc@Zen-II-x12.niklas.com>
        <20211114211435.GA87082@rowland.harvard.edu>
        <20211114220222.31755871@Zen-II-x12.niklas.com>
        <20211115160918.GB109771@rowland.harvard.edu>
        <20211117002359.03b36ec6@Zen-II-x12.niklas.com>
        <20211117170817.GD172151@rowland.harvard.edu>
        <20211119171915.6a8cac47@Zen-II-x12.niklas.com>
        <YZm03KTcWOwtMtCN@rowland.harvard.edu>
        <20211122112526.501c5f66@Zen-II-x12.niklas.com>
        <YZv55KMsuSYanfYp@rowland.harvard.edu>
        <667c2c8307e0e738ed54e34f6c83ea1df99c7528.camel@archlinux.org>
        <CAO-hwJJtQ_1S76HTaHK=oUeP1M24QnC6z1J5CvTuU7m=oZe6zg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 23 Nov 2021 17:33:08 +0100
Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:

> On Mon, Nov 22, 2021 at 10:35 PM Filipe La=C3=ADns <lains@archlinux.org>
> wrote:
> >
> > On Mon, 2021-11-22 at 15:13 -0500, Alan Stern wrote: =20
> > > On Mon, Nov 22, 2021 at 11:25:26AM -0500, David Niklas wrote: =20
> > > > Ok, I first edited the kernel to return -ENOMEM like you
> > > > suggested but the UPS still disconnected. I then edited it again
> > > > to re-add the 1060 byte request and the UPS still disconnected.
> > > >
> > > > I'm attaching the usbmon traces.
> > > > If you need any additional info I'll do my best to provide it. =20
> > >
> > > Holy cow!  I just realized what's going on.  And these little
> > > changes we've been messing around with have nothing to do with it.
> > >
> > > For the first time, I looked at the timestamps in the usbmon
> > > traces.  It turns out that the disconnects occur several seconds
> > > after the kernel retrieves the HID report descriptor from the
> > > device.  Under normal conditions we would expect to see report
> > > packets coming in from the device, starting just a fraction of a
> > > second after the descriptor is received.  But that isn't happening
> > > in the Linux traces, whereas it does happen in the Windows pcap log.
> > >
> > > I would guess that the UPS is programmed to disconnect itself
> > > electronically from the USB bus if it doesn't get any requests for
> > > reports within a couple of seconds.  That certainly would explain
> > > what you've been seeing.  I can't imagine why it would be
> > > programmed to behave this way, but companies have been known to do
> > > stranger things.
> > >
> > > As for why the kernel doesn't try to get the reports...  That's a
> > > little harder to answer.  Maybe Jiri or Benjamin will know
> > > something about it. =20
>=20
> I am not sure exactly what is going on there.
> There are a couple of things that come to my mind:
> - for quite some time now, we don't fetch all reports whenever we
> connect a new device. This was known to be problematic on some devices
> (see all the devices with HID_QUIRK_NOGET or
> HID_QUIRK_NO_INIT_REPORT), and the default to not poll input values on
> plug for devices is actually safer. If you want to revert, we will
> have to have a special driver for this one I guess
> - HID_QUIRK_ALWAYS_POLL *might* be a way to force the device to stay
> with a USB connection up.
>=20
> > >
> > > The UPS's vendor ID is 0d9f (POWERCOM) and the product ID is 0004.
> > > Now, the drivers/hid/hid-quirks.c file contains a quirk entry for
> > > 0d9f:0002 (product POWERCOM_UPS), which is probably an earlier
> > > model of the same device, or a very similar device.  This quirk
> > > entry is in the hid_ignore_list; it tells the HID core not to
> > > handle the device at all.
> > >
> > > I don't know why that quirk entry is present, and furthermore, it
> > > can't directly affect what is happening with your device because
> > > the product IDs are different.  Still, it is an indication that
> > > something strange is going on behind the scenes.
> > >
> > > Perhaps there is no kernel driver for these UPS devices?  Perhaps
> > > the intention is that some user program will handle all the
> > > communication when one of them is detected?  A quick search on
> > > Google turns up usbhid-ups, part of Network USB Tools (NUT) --
> > > maybe you need to install that package in order to use the device. =20
>=20
> I don't have enough experience with UPS here to be helpful,
> unfortunately. But What Alan said made a lot of sense. Maybe the NUT
> people will have a better insight.
<snip>

I'll send a message their way.

Thanks,
David
