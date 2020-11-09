Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7E42ABEB1
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 15:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbgKIO3w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 09:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57922 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726961AbgKIO3w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 09:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604932190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n42WBlnQROHy50cGLPzR4PY0eGgG01jFWeSWSJgDQh4=;
        b=JgPI2d2nKiF07pmtGxhFu6MLg0TopmkT5iHdhX5gYbLCjMly/xlkCZPOFvTuZLCGTlHlOi
        zwC8FbIzxwL5BvRIAU0WlaSLgi9gJZZY0RJW0UwOc/Lj36Yq9A0KzFIILepdpTZ8skJXa3
        Jx13L69z6xKT2wqMATFSvZqgqvqqrb8=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-_cDBs1N1NRWlwPjrPYJAfA-1; Mon, 09 Nov 2020 09:29:48 -0500
X-MC-Unique: _cDBs1N1NRWlwPjrPYJAfA-1
Received: by mail-pf1-f199.google.com with SMTP id y62so6672388pfg.13
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 06:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n42WBlnQROHy50cGLPzR4PY0eGgG01jFWeSWSJgDQh4=;
        b=MBDH4BBf1CclR8SLYy4pHLr218lr4GOr92fnpmlaWGYfzFcgKJ9zicyMQKg52nmhlK
         h0z1feXtlLEpx6wo+0PmYym6WgN6d6UeBxbuEWyvdEfVEqmOFvtLFjiwRnG8yG/xOb0Z
         qJXTFGXo8CZRsZBbU3Uu7hPpy1NKUDAQpZ2sYDDhU4dMUlwbKL4S4XlKXyVbu+dm2Vsj
         /+GPZngrzl7Chh8BchEm2o88/8P3puVFUVvOzpU2q9jpiiYmcyIZ8cqUA8ZmZ1dG+HkX
         VSGl9AhDDLzPIwF+HoEcaGUj7l2S3Bu1mTxL+4jwxPrcBJz5x/+1C81W8Eyalz1nPSTx
         DNdQ==
X-Gm-Message-State: AOAM532hpeZE8c+1bFUH58w7FeojbBr3jkzgRbhYdILM+dD+Tz6x45Dv
        Qquhm2ftnVMABiASiHZu2c7neQv0jCdA9ycVulQG65m7+BRUGxtCUmSLb3dQfyQH2lNGdSOf3Zz
        bYKEJSXQsLj2Ef3TW9SaE4ycjrkXvD/TOwsifT0M=
X-Received: by 2002:a17:90a:3d0f:: with SMTP id h15mr13358504pjc.234.1604932187210;
        Mon, 09 Nov 2020 06:29:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy0jUo/ZY5BuKQQiNyBfjsPhYO+WT23kOa0Ytjbt6MfQuc+B3C3RMVWuNXhi1t23Bg+wVLMAVJFgs2kLe5AxM=
X-Received: by 2002:a17:90a:3d0f:: with SMTP id h15mr13358472pjc.234.1604932186873;
 Mon, 09 Nov 2020 06:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20201104012929.3850691-1-dianders@chromium.org>
 <20201103172824.v4.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <ea8d8fa3-4e3e-3c56-cda3-c1f6b155018c@redhat.com> <CAD=FV=XLnL35Ltu0ZF2c_u262TDaJ+oZ_jiME_VUd8V+1P5Vaw@mail.gmail.com>
 <20283437-4166-b65e-c498-a650bf53cd8e@redhat.com>
In-Reply-To: <20283437-4166-b65e-c498-a650bf53cd8e@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 9 Nov 2020 15:29:36 +0100
Message-ID: <CAO-hwJ+C9M8zqaiiAW2CATZtng7B9QPOMBSMts6hPUHE9PmSCQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] HID: i2c-hid: Reorganize so ACPI and OF are subclasses
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

sorry for the delay. I have been heavily sidetracked and have a bunch
of internal deadlines coming in :/

On Mon, Nov 9, 2020 at 12:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/4/20 5:06 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Nov 4, 2020 at 4:07 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >>> +#include "i2c-hid.h"
> >>> +
> >>> +struct i2c_hid_acpi {
> >>> +     struct i2chid_subclass_data subclass;
> >>
> >> This feels a bit weird, we are the subclass so typically we would
> >> be embedding a base_class data struct here ...
> >>
> >> (more remarks below, note just my 2 cents you may want to wait
> >> for feedback from others).
> >>
> >>> +     struct i2c_client *client;
> >>
> >> You pass this to i2c_hid_core_probe which then stores it own
> >> copy, why not just store it in the subclass (or even better
> >> baseclass) data struct ?
> >
> > My goal was to avoid moving the big structure to the header file.
> > Without doing that, I think you need something more like the setup I
> > have.  I'll wait for Benjamin to comment on whether he'd prefer
> > something like what I have here or if I should move the structure.
>
> Ok, if Benjamin decides to keep things this way, can you consider
> renaming i2chid_subclass_data to i2chid_ops ?
>
> It just feels weird to have a struct with subclass in the name
> embedded inside as a member in another struct, usualy the kobject model
> works by having the the parent/base-class struct embedded inside
> the subclass data struct.
>
> This also avoids the need for a callback_priv_data pointer to the ops,
> as the ops get a pointer to the baseclass data struct as argument and
> you can then use container_of to get your own subclassdata struct
> since that encapsulates (contains) the baseclass struct.
>
> Note the dropping of the callback_priv_data pointer only works if you
> do move the entire struct to the header.

I am not sure my opinion is the best in this case. However, the one
thing I'd like us to do is knowing which use cases we are solving, and
this should hopefully help us finding the best approach:

- use case 1: fully upstream driver (like this one)
   -> the OEM sets up the DT associated with the embedded devices
   -> the kernel is compiled with the proper flags/configs
  -> the device works out of the box (yay!)

- use case 2: tinkerer in a garage
  -> assembly of a generic SoC + Goodix v-next panel (that needs
modifications in the driver)
  -> use of a generic (arm?) distribution
  -> the user compiles the new (changed) goodix driver
  -> the DT is populated (with overloads)
  -> the device works
  -> do we want to keep compatibility across kernel versions (not
recompile the custom module)

- use case 3: Google fixed kernel
  -> the kernel is built once for all platforms
  -> OEMs can recompile a few drivers if they need, but can not touch
the core system
  -> DT/goodix specific drivers are embedded
  -> device works
  -> do we want compatibility across major versions, and how "nice" we
want to be with OEM?

I understand that use case 2 should in the end become use case 1, but
having a possibility for casual/enthusiasts developers to fix their
hardware is always nice.

So to me, having the base struct in an external header means we are
adding a lot of ABI and putting a lot more weight to case 1.

Personally, I am not that much in favour of being too strict and I
think we also want to help these external drivers. It is true that
i2c-hid should be relatively stable from now on, but we can never
predict the future, so maybe the external header is not so much a good
thing (for me).

Anyway, if we were to extract the base struct, we would need to
provide allocators to be able to keep forward compatibility (I think).

Does that help a bit?

[mode bikeshedding on]
And to go back to Hans' suggestion, I really prefer i2chid_ops. This
whole architecture makes me think of a bus, not a subclass hierarchy.
In the same way we have the hid bus, we could have the i2c-hid bus,
with separate drivers in it (acpi, of, goodix).

Note that I don't want the i2c-hid to be converted into an actual bus,
but just rely on the concepts.
[bikeshedding off]

>
>
>
> >
> >
> >>> @@ -156,10 +152,10 @@ struct i2c_hid {
> >>>
> >>>       wait_queue_head_t       wait;           /* For waiting the interrupt */
> >>>
> >>> -     struct i2c_hid_platform_data pdata;
> >>> -
> >>>       bool                    irq_wake_enabled;
> >>>       struct mutex            reset_lock;
> >>> +
> >>> +     struct i2chid_subclass_data *subclass;
> >>>  };
> >>
> >> Personally, I would do things a bit differently here:
> >>
> >> 1. Just add the
> >>
> >>         int (*power_up_device)(struct i2chid_subclass_data *subclass);
> >>         void (*power_down_device)(struct i2chid_subclass_data *subclass);
> >>
> >> members which you put in the subclass struct here.
> >>
> >> 2. Move the declaration of this complete struct to drivers/hid/i2c-hid/i2c-hid.h
> >> and use this as the base-class which I described before (and store the client
> >> pointer here).
> >>
> >> 3. And then kzalloc both this baseclass struct + the subclass-data
> >> (only the bool "power_fixed" in the ACPI case) in one go in the subclass code
> >> replacing 2 kzallocs (+ error checking with one, simplifying the code and
> >> reducing memory fragmentation (by a tiny sliver).
> >
> > Sure, I'll do that if Benjamin likes moving the structure to the header.
> >
> >
> >> About the power_*_device callbacks, I wonder if it would not be more consistent
> >> to also have a shutdown callback and make i2c_driver.shutdown point to
> >> a (modified) i2c_hid_core_shutdown() function.
> >
> > Personally this doesn't seem cleaner to me, but I'm happy to do it if
> > folks like it better.  Coming up with a name for the callback would be
> > a bit awkward, which is a sign that this isn't quite ideal?  For the
> > power_up()/power_down() those are sane concepts to abstract out.  Here
> > we'd be abstracting out "subclass_shutdown_tail()" or something?
> > ...and if a subclass needs something at the head of shutdown, we'd
> > need to add a "subclass_shutdown_head()"?
>
> I have no real preference here either way.

If we are using i2chid_ops, we could just have `shutdown_tail()`.
Basically drop any "device" or "subclass" in the op name.
This would lead to better code IMO: "ihid->dev_ops->shutdown()" for example

Cheers,
Benjamin

>
> >> You may also want to consider pointing that shutdown callback to the power_off
> >> function in the of case (in a separate commit as that is a behavioral change).
> >
> > I don't think this is the point of shutdown, but I could be corrected.
> > Shutdown isn't really supposed to be the same as driver remove or
> > anything.  IIUC the main point of shutdown is to support kexec and the
> > goal is to quiesce DMA transactions.  Turning off power has never been
> > a requirement that I was aware of.  We don't want to jam too much
> > stuff in shutdown or else "shutdown" becomes as slow as boot for no
> > good reason, right?
>
> This sorta depends on if the regulators for the HID device are part of the
> PMIC or not. If they are part of the PMIC then on shutdown they will
> typically be turned off by the PMIC. But if they are separate they may
> stay enabled on shutdown.
>
> Anyways I again have no real preference here...
>
> Regards,
>
> Hans
>
>
>
>
>
>
> >
> >
> >>> diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
> >>> new file mode 100644
> >>> index 000000000000..e1838cdef0aa
> >>> --- /dev/null
> >>> +++ b/drivers/hid/i2c-hid/i2c-hid-of.c
> >>> @@ -0,0 +1,149 @@
> >>> +/*
> >>> + * HID over I2C Open Firmware Subclass
> >>> + *
> >>> + * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
> >>> + * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
> >>> + * Copyright (c) 2012 Red Hat, Inc
> >>
> >> <snip>
> >>
> >>> +MODULE_DESCRIPTION("HID over I2C OF driver");
> >>> +MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
> >>
> >> In case Benjamin misses this during his own review: I'm not sure if he
> >> will want to be set as AUTHOR of this, given that part of the plan is
> >> for someone else to be the primary point of contact for the of bits.
> >
> > I can stick myself in as the author if needed.  I'll wait for
> > Benjamin's feedback here.
> >
> >
> > -Doug
> >
>

