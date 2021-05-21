Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D6F38CAAE
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 18:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237282AbhEUQN5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 12:13:57 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:60012 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237317AbhEUQN4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 12:13:56 -0400
Date:   Fri, 21 May 2021 16:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1621613550;
        bh=5RILEZs7S0CGicPXDq3h3atByy5bwQUtfEAV0r3rkmY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=k+TvfcskjzwV2gIDv07zVAyaEdsR0F+Ujgo4NrV4Q3YKaieW1QgCt/ZVYm573jyWQ
         FHyM+gqJxR/XLFrt44gmouBrz9rEuIQE8ObwSd3+s9VxZWF0l0qTq8urMQADJDIlat
         c3vHbJtEpguVyVUzlSQI5hjN2WyQdepOpN0CuT7w=
To:     =?utf-8?Q?Marek_Beh=C3=BAn?= <marek.behun@nic.cz>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: Naming of HID LED devices
Message-ID: <4B1i3b0Y36T-pcw4kf2a8nu0t1-JDIjIBvTbHRKCDkF9dLRnJeFUjQ3BN6nqkyHHdZlXqDLiGWlEdRaon9chcIG9oiHh4KJXavYVzazJPQY=@protonmail.com>
In-Reply-To: <20210521175718.39d932ae@dellmb>
References: <CAEc3jaCfS=DPQiSjh+_aVePbUXHe-M7WH1t+JtSLwqu0Vktnxw@mail.gmail.com> <20210521175718.39d932ae@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2021. m=C3=A1jus 21., p=C3=A9ntek 17:57 keltez=C3=A9ssel, Marek Beh=C3=
=BAn =C3=ADrta:

> On Thu, 20 May 2021 22:47:08 -0700
> Roderick Colenbrander <thunderbird2k@gmail.com> wrote:
>
> > Hi Benjamin and Marek,
> >
> > Earlier this year during review of the hid-playstation driver there
> > was a discussion on the naming of LEDs exposed by HID drivers. Moving
> > forward the preference from the LED maintainers was to follow the
> > naming scheme "device:color:function" instead of the custom names used
> > so far by HID drivers.
> >
> > I would like to get some guidance on the naming direction not just for
> > hid-playstation, but Daniel's hid-nintendo driver for which he posted
> > a new revision today has the same problem.
> >
> > The original discussion was on "why not use the input device name?"
> > (e.g. input15). It was concluded that it wouldn't uniquely identify a
> > HID device among reasons.
> >
> > One suggested approach by Benjamin was to use the sysfs unique name
> > with the bus, vid, pid.. but without ":" or ".":
> > > > > The unique ID of HID devices (in /sys/bus/hid/devices) is in
> > > > > the form `BUS:VID:PID.XXXX`. I understand the need to not have
> > > > > colons, so could we standardize LEDs on the HID subsystem to be
> > > > > named `hid-bus_vid_pid_xxxx:color:fun(-n)?`? That would allow a
> > > > > mapping between the LED and the sysfs, and would also allow
> > > > > users to quickly filter out the playstation ones.
> >
> > Another approach mentioned was to invent some new ID and use a name
> > like "hidN":
> > > > So you are saying that the fact that userspace cannot take the
> > > > number from "hidN" string and simply do a lookup
> > > > /sys/bus/hid/devices/hidN is the problem here.
> > > >
> > > > This is not a problem in my opinion, because userspace can simply
> > > > access the parent HID device via
> > > > /sys/class/leds/hidN:color:func/parent.
> > >
> > > So in that case, there is no real point at keeping this ID in sync
> > > with anything else? I would be more willing to accept a patch in HID
> > > core that keeps this ID just for HID LEDs, instead of adding just an
> > > ID with no meaning to all HID devices.
> >
> > I'm not sure which approach would be prefered. A "hidN" approach would
> > have little meaning perhaps, but looks pretty. While the
> > "hid-bus_vid_pid_xxxx" has a real meaning, but looks less nice. Unless
> > there is another approach as well.
> >
> > Then there is the question on how to best generate these names. The
> > "hidN" approach could leverage the XXXX id an store it internally
> > (though it doesn't have a real meaning). If we only want to allocate
> > such an ID for devices with LEDs then some flag would need to be
> > passed back to hid-core. Not sure what the best way would be (almost a
> > call like hid_hw_start as part of connect_mask unless there is a
> > better way).
> >
> > A hid-bus string is easier to create. Though even there is a question
> > on how to do it. It would be wasteful to store it for each hid_device.
> > It could be generated using a helper function out of
> > "dev_name(hdev->dev)", though personally I dislike any string
> > manipulation kernel side if it can be avoided. I would probably
> > suggest to store "XXXX" in each hid_device struct and have users (so
> > far would only be hid-nintendo and hid-playstation) generate the
> > strings themselves for now. Again also not nice unless a
> > "hid_device_name()" helper is desired then...
>
> Since it was some time ago I don't quite remember what the exact
> problem was with the suggestion I had about using the ID from the id
> variable in hid_add_device() function in hid-core.c.
>
> The code does:
>
>   int hid_add_device(struct hid_device *hdev)
>   {
>     static atomic_t id =3D ATOMIC_INIT(0);
>     ...
>     dev_set_name(&hdev->dev, "%04X:%04X:%04X.%04X", hdev->bus,
>                  hdev->vendor, hdev->product, atomic_inc_return(&id));
>     ...
>   }
>
> The id variable is static and atomic, so it is unique for every
> hid_device. Why cannot we use this?
>
> Marek


One point was put forward by Benjamin in the following email:

https://lore.kernel.org/linux-input/CAO-hwJ+=3D_fjHgenXvHv45sHgzwiG2z9vGeq7=
fmMqj2=3DBeYCF1Q@mail.gmail.com/


> Yes and no. This atomic_inc is only used to allow a sysfs tree,
> because you can have several HID devices below the same USB, I2C or
> UHID physical device. From the userspace, no-one cares about that ID,
> because all HID devices are exported as input, IIO or hidraw nodes.
>
> So using this "id" would not allow for a direct mapping HID device ->
> sysfs entry because users will still have to walk through the tree to
> find out which is which.


Regards,
Barnab=C3=A1s P=C5=91cze
