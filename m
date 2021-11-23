Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64CBC45A7E4
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 17:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237763AbhKWQg7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 11:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34031 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236152AbhKWQgb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 11:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637685202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BoyA+jwxTvEgMZccNfuQx4wiO7nO6808AQhUNzYQlss=;
        b=DlrN9QEHI3v342mFuwm+SPIN8VPZEEcMzAI7nF1ugVMOStvaqCzpn4MjMEuENwnZ17kXjA
        iJogan/iOBvwfcqN/r38CMLTWFJE/9d8GADOXqACwRTo05Lxjhw+P/CGMihvc+WSd8tykV
        7e0Vgrg+qiXrWGyanW62n2mAV3EOsEc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-6RY8JeOrMhuc5aOcWpSeLA-1; Tue, 23 Nov 2021 11:33:21 -0500
X-MC-Unique: 6RY8JeOrMhuc5aOcWpSeLA-1
Received: by mail-pl1-f199.google.com with SMTP id n13-20020a170902d2cd00b0014228ffc40dso9229317plc.4
        for <linux-input@vger.kernel.org>; Tue, 23 Nov 2021 08:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BoyA+jwxTvEgMZccNfuQx4wiO7nO6808AQhUNzYQlss=;
        b=wf1L8H0xqznLPfEu83NAgc4MFhltRVGBadCYUanoFPhBV/5pmHPC+/SLAmKM03Ku7s
         VceRR/jr/5qjoFz7JH4mCdIrsn0NJpUJtmDgog/leoZYmEGaHo/q7gimWjBTH5Vwfk9n
         nIUyZxZrghbxgmzHwIUGAf0+TM2Hx+U0s0c+JaNIxvxR6l9ehOE4xtgkgHeYi33x1NqB
         67o9DchFO1CnRcPqeDDZyJlJ4SyrRXmnGILQE63csEJUakVEiCxyiqSMCTB1+ICLEFrv
         JGYAY+PBwdAgPQjLCiyxUxwjvyKLn35aIptlsBfGOoewHkAdNlnuinHmg6NJdN6Kjqa5
         VJ0A==
X-Gm-Message-State: AOAM533yQPyU0UTD1Fjc5WmPGbR+xjuvG2q1htDEKYLGRD2skhthedcX
        JkhDs/inQkq4idAv7+2IcD5BqWD/xTs77xNanGMvOqJAuUYUFFE6FKvJhzHKBs51oPFGQbc9c4r
        z6gITKwwBKoGir++bWSXU414FpGgxsW/8Zv0qn/I=
X-Received: by 2002:a63:6ece:: with SMTP id j197mr4684512pgc.11.1637685200014;
        Tue, 23 Nov 2021 08:33:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXZJPBcvp5/k5wSaRqBRCPhoBB9egRDjfddCQrdiQLgdRI3+bKNzOs50d/NfrCPbN5EVGT1gdDKDpU///ZUhw=
X-Received: by 2002:a63:6ece:: with SMTP id j197mr4684489pgc.11.1637685199716;
 Tue, 23 Nov 2021 08:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
 <20211114144842.72463ccc@Zen-II-x12.niklas.com> <20211114211435.GA87082@rowland.harvard.edu>
 <20211114220222.31755871@Zen-II-x12.niklas.com> <20211115160918.GB109771@rowland.harvard.edu>
 <20211117002359.03b36ec6@Zen-II-x12.niklas.com> <20211117170817.GD172151@rowland.harvard.edu>
 <20211119171915.6a8cac47@Zen-II-x12.niklas.com> <YZm03KTcWOwtMtCN@rowland.harvard.edu>
 <20211122112526.501c5f66@Zen-II-x12.niklas.com> <YZv55KMsuSYanfYp@rowland.harvard.edu>
 <667c2c8307e0e738ed54e34f6c83ea1df99c7528.camel@archlinux.org>
In-Reply-To: <667c2c8307e0e738ed54e34f6c83ea1df99c7528.camel@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 23 Nov 2021 17:33:08 +0100
Message-ID: <CAO-hwJJtQ_1S76HTaHK=oUeP1M24QnC6z1J5CvTuU7m=oZe6zg@mail.gmail.com>
Subject: Re: I need advice with UPS connection. (ping)
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        David Niklas <Hgntkwis@vfemail.net>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 22, 2021 at 10:35 PM Filipe La=C3=ADns <lains@archlinux.org> wr=
ote:
>
> On Mon, 2021-11-22 at 15:13 -0500, Alan Stern wrote:
> > On Mon, Nov 22, 2021 at 11:25:26AM -0500, David Niklas wrote:
> > > Ok, I first edited the kernel to return -ENOMEM like you suggested bu=
t
> > > the UPS still disconnected. I then edited it again to re-add the 1060
> > > byte request and the UPS still disconnected.
> > >
> > > I'm attaching the usbmon traces.
> > > If you need any additional info I'll do my best to provide it.
> >
> > Holy cow!  I just realized what's going on.  And these little changes
> > we've been messing around with have nothing to do with it.
> >
> > For the first time, I looked at the timestamps in the usbmon traces.  I=
t
> > turns out that the disconnects occur several seconds after the kernel
> > retrieves the HID report descriptor from the device.  Under normal
> > conditions we would expect to see report packets coming in from the
> > device, starting just a fraction of a second after the descriptor is
> > received.  But that isn't happening in the Linux traces, whereas it doe=
s
> > happen in the Windows pcap log.
> >
> > I would guess that the UPS is programmed to disconnect itself
> > electronically from the USB bus if it doesn't get any requests for
> > reports within a couple of seconds.  That certainly would explain what
> > you've been seeing.  I can't imagine why it would be programmed to
> > behave this way, but companies have been known to do stranger things.
> >
> > As for why the kernel doesn't try to get the reports...  That's a littl=
e
> > harder to answer.  Maybe Jiri or Benjamin will know something about it.

I am not sure exactly what is going on there.
There are a couple of things that come to my mind:
- for quite some time now, we don't fetch all reports whenever we
connect a new device. This was known to be problematic on some devices
(see all the devices with HID_QUIRK_NOGET or
HID_QUIRK_NO_INIT_REPORT), and the default to not poll input values on
plug for devices is actually safer. If you want to revert, we will
have to have a special driver for this one I guess
- HID_QUIRK_ALWAYS_POLL *might* be a way to force the device to stay
with a USB connection up.

> >
> > The UPS's vendor ID is 0d9f (POWERCOM) and the product ID is 0004.  Now=
,
> > the drivers/hid/hid-quirks.c file contains a quirk entry for 0d9f:0002
> > (product POWERCOM_UPS), which is probably an earlier model of the same
> > device, or a very similar device.  This quirk entry is in the
> > hid_ignore_list; it tells the HID core not to handle the device at all.
> >
> > I don't know why that quirk entry is present, and furthermore, it can't
> > directly affect what is happening with your device because the product
> > IDs are different.  Still, it is an indication that something strange i=
s
> > going on behind the scenes.
> >
> > Perhaps there is no kernel driver for these UPS devices?  Perhaps the
> > intention is that some user program will handle all the communication
> > when one of them is detected?  A quick search on Google turns up
> > usbhid-ups, part of Network USB Tools (NUT) -- maybe you need to
> > install that package in order to use the device.

I don't have enough experience with UPS here to be helpful,
unfortunately. But What Alan said made a lot of sense. Maybe the NUT
people will have a better insight.

> >
> > I don't know what the full story is.  With luck, Jiri or Benjamin can
> > help more.
> >
> > Alan Stern
>
> hid-generic should be able to handle these devices, but UPSes are much le=
ss
> tested than normal input peripherals, so it's not that surprising that th=
ere may
> be some unexpected weirdness. FWIW, I have two UPSes, one works OOTB and =
the
> other doesn't, I have been meaning to investigate the issue. However, Dav=
id's
> case seems to me like a hardware quirk, but that's just my guess.
>

Yep, that seems to validate the fact that this UPS needs some care...

Cheers,
Benjamin

