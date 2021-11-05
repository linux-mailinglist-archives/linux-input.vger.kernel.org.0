Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E129446858
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 19:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhKESZT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 14:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21409 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230145AbhKESZT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Nov 2021 14:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636136550;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MSxZAOJclkvtrf7ZNjR4+yUMBn6uV9v5VIW+Q0Lv0l4=;
        b=AuvDdLlRm22RcPtVP1xxbNRfSSWDfvCN78kDEPKf76ybZBEn8qd1GDnporZRbOcGO/Lzha
        zabAQi0TPTKqJx7L5gHdk8GDMTte5rJmw4fIyExzrCqxwSvHbxLKC4mUBVBui/ev7wgPE2
        brtasV2mhwZY842XjeVttB1JXDK9Org=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-7Co1k_DmOACvJ1iS55pahA-1; Fri, 05 Nov 2021 14:22:29 -0400
X-MC-Unique: 7Co1k_DmOACvJ1iS55pahA-1
Received: by mail-pj1-f70.google.com with SMTP id iq9-20020a17090afb4900b001a54412feb0so2828459pjb.1
        for <linux-input@vger.kernel.org>; Fri, 05 Nov 2021 11:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MSxZAOJclkvtrf7ZNjR4+yUMBn6uV9v5VIW+Q0Lv0l4=;
        b=SxrksE3oNPRRGALwTCiN/IcXXfLPr7CErig+xZYBMIdJjAnrOLdD90M2eItSwqq8cc
         l3h16MNFQoSMCcownoqSCQvm52AIPhzQnJdyFbJrLHPOhGOA1q5vbNDPgVJZttthjvFC
         0jcFCWD/3WFc2MbNIYH3EXOP584By/Xqi6In63vUFkoglus6WwImHHfgIO+7XmvqzUXU
         B/vMuMAcU2aa1VymqiQ1ojp7SrdULQGchwKevRnHVJwr7GaHYlsDDQMJTLtMFIMhfbVr
         qMapesoyPUGwfJEuI47qr20yxCDBC03TuNxTw+OGgtF7PGdr3ZKkzFc5rDRWYV8rzoLe
         4EZw==
X-Gm-Message-State: AOAM530h840HY3ZitDvCP+ZqZV/StWEAFy93TBJ4XGl0De/9xtvdPVIs
        etA9TRsSYKqnSpU4M0hZV0lGGIlSri2bNKPK4dm7xCojhMNdKBSxfTHU93WWCVgzCKnwgFqPXTi
        Rgl0tdwiuKWoCtdB/wvX5tLR0dGNhVWhy95h0rMA=
X-Received: by 2002:a05:6a00:1252:b0:494:e3:f8e0 with SMTP id u18-20020a056a00125200b0049400e3f8e0mr15236507pfi.83.1636136547922;
        Fri, 05 Nov 2021 11:22:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2i/OwsVRu3DmktZjs43kBLL5byX/OBKExli/7oqgb/cNhQ95oKDF7fg8sjslZm2YM2p4QtrRCbvM9z1jJpRo=
X-Received: by 2002:a05:6a00:1252:b0:494:e3:f8e0 with SMTP id
 u18-20020a056a00125200b0049400e3f8e0mr15236452pfi.83.1636136547470; Fri, 05
 Nov 2021 11:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
In-Reply-To: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 5 Nov 2021 19:22:16 +0100
Message-ID: <CAO-hwJ+=GL6MrJdh754bUF5_ciJqNvPxcLUstSLD+AfCH2VKdw@mail.gmail.com>
Subject: Re: [RFC 0/8] HID: add support for USI style pens
To:     Tero Kristo <tero.kristo@linux.intel.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Tero,

[just a quick note, I am supposed to be on holiday this week]

On Thu, Nov 4, 2021 at 2:38 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>
> Hi,
>
> This series is an RFC for USI (Universal Stylus Interface) style pen
> support. This is based on documentation from USB org describing the HID
> usage tables for digitizers (page 0x0D) and experimentation with actual
> USI capable controllers.
>
> This series introduces the USI support with a new HID driver, which
> applies the controller specific quirks. The most problematic part of the
> USI support is handling of the pen parameters (color, line width, line
> style), which are not immediately available from the controller from pen
> down event, but must be cached and queried separately from the controller.
> In addition to that, when a get-feature report is sent to the
> controller, there is a delay before the proper value is reported out; it
> is not part of the feature report coming back immediately.
> Most of the code in the driver is to handle this (otherwise we could
> just use hid-generic.)
>
> This also boils down to the reason why this series is an RFC, I would like
> to receive some feedback which option to pick for programming of the new
> values for the programmable pen parameters; whether to parse the input
> events so userspace can directly write the new values to the input event
> file handle, or whether to use IOCTL. Patches #7 / #8 are sort of optional
> choices towards this, but are there to show that both approaches can be
> done. Direct write to evdev causes some confusion on the driver level
> though, thus patch #7 is there to avoid some of that introducing new
> input events for writing the parameters. IOCTL might be the cleanest
> approach and I am slightly leaning towards that myself (see patch #8,
> this would need to be squashed and cleaned up a bit though but would
> effectively get rid of some code from patch #6 and completely rid patch #7.)

This series unfortunately raised quite a few red flags for me, and I
am glad this is just an RFC.
Let me enumerate them first and discuss a little bit more about those:
 1. USI is supposed to be generic, so why is there a new driver for it
instead of being handled by hid-input.c?
 2. new MSC_EVENTS are created without Dmitry or Peter being CC-ed
 3. new ioctls???
 4. direct write to evdev to write parameters
 5. patch 1/8 doesn't compile without 5/8
 6. no tests :)

1. new driver
After quickly reading the RFC, I think the main issue there is that we
are now having a transducer index which is incompatible with the way
input and evedev works nowadays. Yay, we have a new hid-multitouch for
pen :(

Wacom has been dealing with that situation for years by tweaking the
protocol and by just emitting a different serial number (roughly). I
think the safest approach would be to keep the existing protocol
running so that our user space can handle it properly.

I'd need to read the rest of the code more carefully, but if we could
have a basic generic handling (without the fancy features like
changing the pen style/color) I'd be happier.

2. MSC_* events
there is an issue with those: they are not cached like the ABS_* ones.
Meaning that each report will wake up userspace for something which
basically doesn't change.
I know ABS_* is saturated, but I'd like to have reviews from others on
what could be done here instead of just using MSC_* as a new ABS_*

3. ioctls
this is problematic to me. Any new kernel ABI is problematic to me,
and I'd much rather not add any new ones.

My new set of mind is because of the recent work I have been
conducting regarding eBPF.
Basically I managed to have eBPF programs handling the device
configuration and event processing in a local branch.
I should be able to push a WIP next week, but basically this should
allow me to not have to deal with new kernel APIs besides the generic
eBPF one.
We can imagine a generic hid-input.c processing for those tablets, and
have a new userspace component that loads an eBPF program with its own
userspace API which is capable of the fancy features.

For instance, my current playground is setting the haptic feedback of
the Surface Dial depending on the resolution I set on it.

Furthermore, ioctls on a new cdev means that the classic userspace
libraries will not have access to it without some heavy tuning in the
systemd space (libinput only has read/write access to
/dev/input/event*).

4. direct write to evdev

We enabled that once for LEDs, and it's a pain to maintain. Maybe we
can make a use case for it but given that you don't seem very
enthusiastic about it too, I wonder if this is not a dead end.

5. patch ordering doesn't compile
I guess this is just a rebase hiccup. Not an issue for an RFC

6. tests
For these kinds of new classes of devices, I'd like to have tests in
the https://gitlab.freedesktop.org/libevdev/hid-tools repository.
There is already an initial MR for tablet support (!115 in this
project), and we should extend it with more tests.

I'd happily help with those tests if you could share the report
descriptors and some device dumps made with the hid-recorder tool from
that repository.

>
> The driver has been tested with chromebooks that contain either Goodix
> or Elan manufactured USI capable touchscreen controllers in them.
>
> Any feedback appreciated!

I'll try to have a deeper look next week (though it seems a few bits
stacked up during my week off, sigh).

Cheers,
Benjamin

>
> -Tero
>
>

