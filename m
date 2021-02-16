Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA6131D00C
	for <lists+linux-input@lfdr.de>; Tue, 16 Feb 2021 19:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhBPSQp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 13:16:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43200 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230381AbhBPSQo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 13:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613499306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uTD5BpOUpOBbg52rdm7ussGemaJf38VmmOMyJYfaTig=;
        b=adFRILvl1V+An9esSeMA2ZjEZ+zy0GlnZniE07p4J+AVLSgWF6VMVPE58QOxfu6K2R3oBs
        KUGCrU2y9JKnBCYyvpXy3FMFlLqrjrQF/+7HUShlYHjA03s2HVnvYluPtv7IquHsqAcacF
        pHUrlGiag+24UkwEZsaC6XypCw+rvv0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-c4rfHzZHNtqL9ZRdt1KO7w-1; Tue, 16 Feb 2021 13:15:01 -0500
X-MC-Unique: c4rfHzZHNtqL9ZRdt1KO7w-1
Received: by mail-pl1-f198.google.com with SMTP id w10so9622106plg.1
        for <linux-input@vger.kernel.org>; Tue, 16 Feb 2021 10:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTD5BpOUpOBbg52rdm7ussGemaJf38VmmOMyJYfaTig=;
        b=JehBp13VfnhiOYVrlCsaTjjBNHiIBArImNUu7jm1f/I6WpqABCbbYHBiR36QjCTX4P
         Q4WIUquUqLVnVRQNDlSDuzraoM1IJQ65spUpRFtmPv6jM7cQcIlToIIwHcYRZTh6svBa
         rFCAt+vmAVL076BMHfo43YBRwuUUCLlBKGccJC0yt7rXjSIFmxRz4SnxDszRFnOxJ+VA
         X+XMFS4YDneKAO+9DL/O3HERFbsmYg8OaWYXJ96II/Hf5eekNJS2QhwNs9DRc0mo0dGB
         2XIqiHBvoMucRzc+9j9hHdFtIXPtJTB31Cmpe+c4QROEWxTsSu2f8bJUbMM8y4lKzjl3
         Kcrw==
X-Gm-Message-State: AOAM530xXhmqurP2ecO9MnvP3FAIWEKqo+FRJ9TkmTRTGa57Ur7sapOH
        ecg+waBv+8VrVJG9Po45rWmj8rBLg0pjO87cGb5adKjGKgs9nH6B5PJxHeQ+uXE3ZlBsTfkVrB9
        RTS+X3swC/yklx33EhrlQ6vxcT7qOCAFw19y1+k4=
X-Received: by 2002:a63:5603:: with SMTP id k3mr6968329pgb.419.1613499300009;
        Tue, 16 Feb 2021 10:15:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9j6NaXytYtel/8CpqtkdCMjMvzHRJPO45gGGbR3znX1uYqRzcW7Rn1D/4NqUMKTtuoIWuoq7y/A1l6NiD0Bk=
X-Received: by 2002:a63:5603:: with SMTP id k3mr6968317pgb.419.1613499299762;
 Tue, 16 Feb 2021 10:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-2-roderick@gaikai.com>
 <20210215143144.060fdbe6@nic.cz> <CANndSKmSP7rdsrMuwRapQkDru75TxN9zbDUbvOj_5hrQpskmJg@mail.gmail.com>
 <20210215165518.16033bb6@nic.cz> <CANndSKkVAFJzf58CNYw_j0QY7hd4umOMn5Cs6U3JnK6TozWdEQ@mail.gmail.com>
 <20210215192124.7a6c8c9d@nic.cz> <CAO-hwJ+=_fjHgenXvHv45sHgzwiG2z9vGeq7fmMqj2=BeYCF1Q@mail.gmail.com>
 <20210216185602.48a980f6@nic.cz>
In-Reply-To: <20210216185602.48a980f6@nic.cz>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 16 Feb 2021 19:14:48 +0100
Message-ID: <CAO-hwJKS_jcuXP6fhYaOutDjGk=GF09Bni88xY1RprEFOCQ-Yg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] HID: playstation: add DualSense lightbar support
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 16, 2021 at 6:56 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Tue, 16 Feb 2021 18:29:46 +0100
> Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
>
> > > So all HIDs can be uniqely determined via this atomic_inc_return(&id),
> > > but it is only stored in string form as part of device name.
> >
> > Yes and no. This atomic_inc is only used to allow a sysfs tree,
> > because you can have several HID devices below the same USB, I2C or
> > UHID physical device. From the userspace, no-one cares about that ID,
> > because all HID devices are exported as input, IIO or hidraw nodes.
> >
> > So using this "id" would not allow for a direct mapping HID device ->
> > sysfs entry because users will still have to walk through the tree to
> > find out which is which.
>
> So you are saying that the fact that userspace cannot take the number
> from "hidN" string and simply do a lookup /sys/bus/hid/devices/hidN is
> the problem here.
>
> This is not a problem in my opinion, because userspace can simply
> access the parent HID device via /sys/class/leds/hidN:color:func/parent.

So in that case, there is no real point at keeping this ID in sync
with anything else? I would be more willing to accept a patch in HID
core that keeps this ID just for HID LEDs, instead of adding just an
ID with no meaning to all HID devices.

Honestly, I think the whole LED class creation API should be
revisited. I guess this is not the first time this problem arises, and
you must be tired of having to chase down users.

If I had to deal with that situation once for all, I would deprecate
the current led class creation API, and add a new API that doesn't
take a free-form string as the name but constrain the name to be
formed by your requirements. This would also send a clear message to
all subsystems because the changes have to be propagated, and then,
all the maintainers would know about this problem. Bonus point, if you
need only "subsystem", "color" and "function", that means that the ID
can be stored internally to the led class and you'll get happy users.

>
> In fact we did something similar for LEDs connected to ethernet PHYs.
> To summarize:
>   - ethernet PHYs are identified by long, sometimes crazy strings like
>       d0032004.mdio-mii:01
>     or even
>       /soc/internal-regs@d0000000/mdio@32004/switch0@10/mdio:08
>   - for the purposes of having a sane devicename part in LED names, I
>     sent this patch
>     https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2301470.html
>     which adds a simple incrementing integer ID to each PHY device.
>     (The code is not in upstream yet because there is other work needed
>      and because I decided that some functionality has to be available
>      via a different mechanism, but this part is complete and reviewed.)
>
> > An actual one-to-one mapping would using 'hidrawX' because there is a
> > one-to-one mapping between /dev/hidrawX for HID devices. However, this
> > means that we consider the bus to be hidraw which is plain wrong too.
> >
> > The unique ID of HID devices (in /sys/bus/hid/devices) is in the form
> > `BUS:VID:PID.XXXX`. I understand the need to not have colons, so could
> > we standardize LEDs on the HID subsystem to be named
> > `hid-bus_vid_pid_xxxx:color:fun(-n)?`? That would allow a mapping
> > between the LED and the sysfs, and would also allow users to quickly
> > filter out the playstation ones.
>
> As I wrote in other e-mail some minutes ago, this just means that we
> need to wait for other people's opinions. Please do not send this
> pull-request with the LED patches until this is resolved.
>

Yeah, I just asked Roderick to see if he can revert those patches
while keeping the functionality behind those. I am more concerned
about the micmute button, because we should really offer that feature
to users. The associated LED class has no real benefits for now, so
that code needs a little bit of care instead of a plain revert.

Cheers,
Benjamin

