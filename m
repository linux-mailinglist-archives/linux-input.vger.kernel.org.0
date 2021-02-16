Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0A731D18C
	for <lists+linux-input@lfdr.de>; Tue, 16 Feb 2021 21:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhBPU2q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 15:28:46 -0500
Received: from mail.nic.cz ([217.31.204.67]:49012 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhBPU2q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 15:28:46 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 8C51E140BED;
        Tue, 16 Feb 2021 21:28:03 +0100 (CET)
Date:   Tue, 16 Feb 2021 21:28:03 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
Message-ID: <20210216212803.123ce325@nic.cz>
In-Reply-To: <CAO-hwJKS_jcuXP6fhYaOutDjGk=GF09Bni88xY1RprEFOCQ-Yg@mail.gmail.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
        <20210215004549.135251-2-roderick@gaikai.com>
        <20210215143144.060fdbe6@nic.cz>
        <CANndSKmSP7rdsrMuwRapQkDru75TxN9zbDUbvOj_5hrQpskmJg@mail.gmail.com>
        <20210215165518.16033bb6@nic.cz>
        <CANndSKkVAFJzf58CNYw_j0QY7hd4umOMn5Cs6U3JnK6TozWdEQ@mail.gmail.com>
        <20210215192124.7a6c8c9d@nic.cz>
        <CAO-hwJ+=_fjHgenXvHv45sHgzwiG2z9vGeq7fmMqj2=BeYCF1Q@mail.gmail.com>
        <20210216185602.48a980f6@nic.cz>
        <CAO-hwJKS_jcuXP6fhYaOutDjGk=GF09Bni88xY1RprEFOCQ-Yg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Feb 2021 19:14:48 +0100
Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:

> On Tue, Feb 16, 2021 at 6:56 PM Marek Behun <marek.behun@nic.cz> wrote:
> >
> > On Tue, 16 Feb 2021 18:29:46 +0100
> > Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> >  
> > > > So all HIDs can be uniqely determined via this atomic_inc_return(&id),
> > > > but it is only stored in string form as part of device name.  
> > >
> > > Yes and no. This atomic_inc is only used to allow a sysfs tree,
> > > because you can have several HID devices below the same USB, I2C or
> > > UHID physical device. From the userspace, no-one cares about that ID,
> > > because all HID devices are exported as input, IIO or hidraw nodes.
> > >
> > > So using this "id" would not allow for a direct mapping HID device ->
> > > sysfs entry because users will still have to walk through the tree to
> > > find out which is which.  
> >
> > So you are saying that the fact that userspace cannot take the number
> > from "hidN" string and simply do a lookup /sys/bus/hid/devices/hidN is
> > the problem here.
> >
> > This is not a problem in my opinion, because userspace can simply
> > access the parent HID device via /sys/class/leds/hidN:color:func/parent.  
> 
> So in that case, there is no real point at keeping this ID in sync
> with anything else? I would be more willing to accept a patch in HID
> core that keeps this ID just for HID LEDs, instead of adding just an
> ID with no meaning to all HID devices.

I think there was some misunderstanding.

If there are multiple LEDs on one joystick, all these LEDs should have
the same devicename part of the LED name. Different joysticks should
have different devicename parts of their LEDs names.

As another example think about keyboard LEDs if I have 2 keyboards
  input3:green:numlock
  input3:green:capslock
  input3:green:scrolllock
  input4:green:numlock
  input4:green:capslock
  input4:green:scrolllock

> Honestly, I think the whole LED class creation API should be
> revisited. I guess this is not the first time this problem arises, and
> you must be tired of having to chase down users.

I will not argue with you about this since it is true. The work is
slow though because lack of people and time. I too have some ideas for
the LED subsystem but I also have many other priorities in work. Pavel
has a TODO list in drivers/leds/TODO. The main thing probably is that
it would be great to have more input from other kernel people when
doing something in LEDs, but either not that many people subscribe to
linux-leds mailing list or we should be informing them via different
mechanisms...

> If I had to deal with that situation once for all, I would deprecate
> the current led class creation API, and add a new API that doesn't
> take a free-form string as the name but constrain the name to be
> formed by your requirements. This would also send a clear message to
> all subsystems because the changes have to be propagated, and then,
> all the maintainers would know about this problem. Bonus point, if you
> need only "subsystem", "color" and "function", that means that the ID
> can be stored internally to the led class and you'll get happy users.

As I mentioned in the example above, there can be multiple LEDs for one
devicename...

> >
> > In fact we did something similar for LEDs connected to ethernet PHYs.
> > To summarize:
> >   - ethernet PHYs are identified by long, sometimes crazy strings like
> >       d0032004.mdio-mii:01
> >     or even
> >       /soc/internal-regs@d0000000/mdio@32004/switch0@10/mdio:08
> >   - for the purposes of having a sane devicename part in LED names, I
> >     sent this patch
> >     https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2301470.html
> >     which adds a simple incrementing integer ID to each PHY device.
> >     (The code is not in upstream yet because there is other work needed
> >      and because I decided that some functionality has to be available
> >      via a different mechanism, but this part is complete and reviewed.)
> >  
> > > An actual one-to-one mapping would using 'hidrawX' because there is a
> > > one-to-one mapping between /dev/hidrawX for HID devices. However, this
> > > means that we consider the bus to be hidraw which is plain wrong too.
> > >
> > > The unique ID of HID devices (in /sys/bus/hid/devices) is in the form
> > > `BUS:VID:PID.XXXX`. I understand the need to not have colons, so could
> > > we standardize LEDs on the HID subsystem to be named
> > > `hid-bus_vid_pid_xxxx:color:fun(-n)?`? That would allow a mapping
> > > between the LED and the sysfs, and would also allow users to quickly
> > > filter out the playstation ones.  
> >
> > As I wrote in other e-mail some minutes ago, this just means that we
> > need to wait for other people's opinions. Please do not send this
> > pull-request with the LED patches until this is resolved.
> >  
> 
> Yeah, I just asked Roderick to see if he can revert those patches
> while keeping the functionality behind those. I am more concerned
> about the micmute button, because we should really offer that feature
> to users. The associated LED class has no real benefits for now, so
> that code needs a little bit of care instead of a plain revert.

Thank you.

Marek
