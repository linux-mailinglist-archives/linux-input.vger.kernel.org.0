Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01F038CA80
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 17:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbhEUP7s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 11:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbhEUP7r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 11:59:47 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EA2C061574;
        Fri, 21 May 2021 08:58:23 -0700 (PDT)
Received: from dellmb (unknown [IPv6:2001:1488:fffe:6:be02:5020:4be2:aff5])
        by mail.nic.cz (Postfix) with ESMTPSA id 1ACA2140E29;
        Fri, 21 May 2021 17:58:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1621612701; bh=vTP1ZRKxANCEzl2KOcODqwZKMYeAA3YkgbIqGcdhbMw=;
        h=Date:From:To;
        b=KV2BR2Vi9E+szbBrxVmM2obAofCbMNPb0jMY8Hzh5CTOnaTS62Op6WOUP1nFvv3hY
         MH21mF+xse4calU5IvtQX2ACnfhZSo9klWJAUYdJ+LPqpYAeElnkS0Y1NzD1Fu66QU
         0b2ojSJELO0a3sgCj0DkhpHOtjpviaJaxPcs2aQo=
Date:   Fri, 21 May 2021 17:57:18 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: Naming of HID LED devices
Message-ID: <20210521175718.39d932ae@dellmb>
In-Reply-To: <CAEc3jaCfS=DPQiSjh+_aVePbUXHe-M7WH1t+JtSLwqu0Vktnxw@mail.gmail.com>
References: <CAEc3jaCfS=DPQiSjh+_aVePbUXHe-M7WH1t+JtSLwqu0Vktnxw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 20 May 2021 22:47:08 -0700
Roderick Colenbrander <thunderbird2k@gmail.com> wrote:

> Hi Benjamin and Marek,
> 
> Earlier this year during review of the hid-playstation driver there
> was a discussion on the naming of LEDs exposed by HID drivers. Moving
> forward the preference from the LED maintainers was to follow the
> naming scheme "device:color:function" instead of the custom names used
> so far by HID drivers.
> 
> I would like to get some guidance on the naming direction not just for
> hid-playstation, but Daniel's hid-nintendo driver for which he posted
> a new revision today has the same problem.
> 
> The original discussion was on "why not use the input device name?"
> (e.g. input15). It was concluded that it wouldn't uniquely identify a
> HID device among reasons.
> 
> One suggested approach by Benjamin was to use the sysfs unique name
> with the bus, vid, pid.. but without ":" or ".":
> > > > The unique ID of HID devices (in /sys/bus/hid/devices) is in
> > > > the form `BUS:VID:PID.XXXX`. I understand the need to not have
> > > > colons, so could we standardize LEDs on the HID subsystem to be
> > > > named `hid-bus_vid_pid_xxxx:color:fun(-n)?`? That would allow a
> > > > mapping between the LED and the sysfs, and would also allow
> > > > users to quickly filter out the playstation ones.  
> 
> Another approach mentioned was to invent some new ID and use a name
> like "hidN":
> > > So you are saying that the fact that userspace cannot take the
> > > number from "hidN" string and simply do a lookup
> > > /sys/bus/hid/devices/hidN is the problem here.
> > >
> > > This is not a problem in my opinion, because userspace can simply
> > > access the parent HID device via
> > > /sys/class/leds/hidN:color:func/parent.  
> >
> > So in that case, there is no real point at keeping this ID in sync
> > with anything else? I would be more willing to accept a patch in HID
> > core that keeps this ID just for HID LEDs, instead of adding just an
> > ID with no meaning to all HID devices.  
> 
> I'm not sure which approach would be prefered. A "hidN" approach would
> have little meaning perhaps, but looks pretty. While the
> "hid-bus_vid_pid_xxxx" has a real meaning, but looks less nice. Unless
> there is another approach as well.
> 
> Then there is the question on how to best generate these names. The
> "hidN" approach could leverage the XXXX id an store it internally
> (though it doesn't have a real meaning). If we only want to allocate
> such an ID for devices with LEDs then some flag would need to be
> passed back to hid-core. Not sure what the best way would be (almost a
> call like hid_hw_start as part of connect_mask unless there is a
> better way).
> 
> A hid-bus string is easier to create. Though even there is a question
> on how to do it. It would be wasteful to store it for each hid_device.
> It could be generated using a helper function out of
> "dev_name(hdev->dev)", though personally I dislike any string
> manipulation kernel side if it can be avoided. I would probably
> suggest to store "XXXX" in each hid_device struct and have users (so
> far would only be hid-nintendo and hid-playstation) generate the
> strings themselves for now. Again also not nice unless a
> "hid_device_name()" helper is desired then...

Since it was some time ago I don't quite remember what the exact
problem was with the suggestion I had about using the ID from the id
variable in hid_add_device() function in hid-core.c.

The code does:

  int hid_add_device(struct hid_device *hdev)
  {
    static atomic_t id = ATOMIC_INIT(0);
    ...
    dev_set_name(&hdev->dev, "%04X:%04X:%04X.%04X", hdev->bus,
                 hdev->vendor, hdev->product, atomic_inc_return(&id));
    ...
  }

The id variable is static and atomic, so it is unique for every
hid_device. Why cannot we use this?

Marek
