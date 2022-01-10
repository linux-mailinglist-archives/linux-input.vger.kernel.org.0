Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A24648A050
	for <lists+linux-input@lfdr.de>; Mon, 10 Jan 2022 20:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243853AbiAJTnL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jan 2022 14:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243901AbiAJTnK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jan 2022 14:43:10 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BBF3C061748
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 11:43:10 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id p5so33729181ybd.13
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 11:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5WE5kxgKlxQok90BZHzEGg23pNqVw6gSb/pfspjUi0=;
        b=E+ov3M8uLyYaRC8iIb4HOHXHxGWRc9h9tyzIy5yhKGum/gaJnrDKIwapst5/axhOtj
         k8WP2R/Phhg4Qg7cmxbCYoTf9GQ/QuNDrNqHl6BijI26YO+rGwWBNGqfmYJAthDX0BGp
         F0AK3ILzZ0IVhaqzCTLNHlRkQOafQTnay27ViYgb3royV1rEOBffj2RSHaXOvFjXbBlI
         ChppeXbNBFqutL09+7sGBWl4IVr7io3v2OXNIalAmGiI8L9NGHVT180RRZ5gEta3Ze4P
         FdreMM+YbwHakbcZWIiHPi6N/P3/9FGQecB3TBieBGj/psWxWJSK0tIoQW4n/QPr64vo
         +HIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5WE5kxgKlxQok90BZHzEGg23pNqVw6gSb/pfspjUi0=;
        b=Oh1zqq8e5mDw97c+z+0vg23wR7iF/xjD54s6k35Evm+2Duk5fhw+vfNqj15NlJizNg
         ocPOJRdlf5IffS4+HCgPlb2bRfXQlS56g/CUA4wVTFoyxA8ri+Mbuz/tCfugzhA+fVe0
         zymj+vtIU06FWiY8juTZse8ONYPW1qRTApB3gwwS+gX27XV69P6WiyqP8oy30Oj28GWb
         kDw1DEXAlwgw0JlxfkwAYhcTgshIREvBOqyMVWywe6CE11V6EeGFXkqpR5JGJSK4KIPR
         w/fPG2+LQN6VGrtkTXX4LzmRiig/D0NdA/plgJzLH08Cmo72dm+4qgn/sXK+1quT83WP
         Qc0A==
X-Gm-Message-State: AOAM532vKln8U1pkx+gd9Fsg9KAuxewVj2Fr5mdCWqtJFGfrw1plKJrz
        xdd0JxzLko1LivHNWd8Pr0v40PZLinn7bnruo+0rDg==
X-Google-Smtp-Source: ABdhPJyWNMyDQcoWLk4JrtUeKKyFVhQKXWZLa6f8brtOXjEuS9lKYcuPozhDPWAWX9AsKSvEE5ugwdjuuGWTQfOYuak=
X-Received: by 2002:a25:287:: with SMTP id 129mr1548066ybc.670.1641843789209;
 Mon, 10 Jan 2022 11:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-5-acz@semihalf.com>
 <Ydi8HAdQWjEOn+Jj@google.com>
In-Reply-To: <Ydi8HAdQWjEOn+Jj@google.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Mon, 10 Jan 2022 20:42:56 +0100
Message-ID: <CAB4aORWG5_+qAdqVJh5wjBEWMiC8Z1Wuy=sRA-JwthOksrhkLw@mail.gmail.com>
Subject: Re: [PATCH 04/18] HID: haptic: introduce hid_haptic_device
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 7, 2022 at 11:18 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Dec 21, 2021 at 07:17:29PM +0000, Angela Czubak wrote:
> > Define a new structure that contains simple haptic device configuration
> > as well as current state.
> >
> > Signed-off-by: Angela Czubak <acz@semihalf.com>
> > ---
> >  drivers/hid/Kconfig      |  4 +++
> >  drivers/hid/Makefile     |  1 +
> >  drivers/hid/hid-haptic.c | 10 ++++++
> >  drivers/hid/hid-haptic.h | 68 ++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 83 insertions(+)
> >  create mode 100644 drivers/hid/hid-haptic.c
> >  create mode 100644 drivers/hid/hid-haptic.h
> >
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index a7c78ac96270..8d1eb4491a7f 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -89,6 +89,10 @@ config HID_GENERIC
> >
> >       If unsure, say Y.
> >
> > +config HID_HAPTIC
> > +     bool
> > +     default n
>
> 'n' is the default, no need to have it explicit.
>
Ack.
> > +
> >  menu "Special HID drivers"
> >       depends on HID
> >
> > diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> > index 55a6fa3eca5a..65d54ccd4574 100644
> > --- a/drivers/hid/Makefile
> > +++ b/drivers/hid/Makefile
> > @@ -4,6 +4,7 @@
> >  #
> >  hid-y                        := hid-core.o hid-input.o hid-quirks.o
> >  hid-$(CONFIG_DEBUG_FS)               += hid-debug.o
> > +hid-$(CONFIG_HID_HAPTIC)     += hid-haptic.o
> >
> >  obj-$(CONFIG_HID)            += hid.o
> >  obj-$(CONFIG_UHID)           += uhid.o
> > diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
> > new file mode 100644
> > index 000000000000..0910d8af9f38
> > --- /dev/null
> > +++ b/drivers/hid/hid-haptic.c
> > @@ -0,0 +1,10 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  HID Haptic support for Linux
> > + *
> > + *  Copyright (c) 2021 Angela Czubak
> > + */
> > +
> > +/*
> > + */
>
> What is this comment block for? Actually I do not see why this needs to
> be a separate patch.
>
I have seen this kind of comment block in both hid-multitouch.c and
hid-core.c, though I can remove it.
Just to be sure: is it OK to introduce all fields/structures at once
with path no 8 ("HID: haptic: initialize haptic device")? Or would you
prefer if I extend the structures as necessary?

> > +#include "hid-haptic.h"
> > diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
> > new file mode 100644
> > index 000000000000..41f19cd22f75
> > --- /dev/null
> > +++ b/drivers/hid/hid-haptic.h
> > @@ -0,0 +1,68 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + *  HID Haptic support for Linux
> > + *
> > + *  Copyright (c) 2021 Angela Czubak
> > + */
> > +
> > +/*
> > + */
> > +
> > +
> > +#include <linux/hid.h>
> > +
> > +#define HID_HAPTIC_ORDINAL_WAVEFORMNONE 1
> > +#define HID_HAPTIC_ORDINAL_WAVEFORMSTOP 2
> > +
> > +#define HID_HAPTIC_PRESS_THRESH 200
> > +#define HID_HAPTIC_RELEASE_THRESH 180
> > +
> > +#define HID_HAPTIC_MODE_DEVICE 0
> > +#define HID_HAPTIC_MODE_KERNEL 1
> > +
> > +struct hid_haptic_effect {
> > +     __u8 *report_buf;
>
> This is a matter of preference, but in kernel we normally use u8, s16,
> etc, and underscored versions are for headers that are part of uapi.
>
> > +     struct input_dev *input_dev;
> > +     struct work_struct work;
> > +     struct list_head control;
> > +     struct mutex control_mutex;
> > +};
> > +
> > +struct hid_haptic_effect_node {
> > +     struct list_head node;
> > +     struct file *file;
> > +};
> > +
> > +struct hid_haptic_device {
> > +     struct input_dev *input_dev;
> > +     struct hid_device *hdev;
> > +     struct hid_report *auto_trigger_report;
> > +     struct mutex auto_trigger_mutex;
> > +     struct workqueue_struct *wq;
> > +     struct hid_report *manual_trigger_report;
> > +     struct mutex manual_trigger_mutex;
> > +     size_t manual_trigger_report_len;
> > +     int pressed_state;
> > +     __s32 pressure_sum;
> > +     __s32 force_logical_minimum;
> > +     __s32 force_physical_minimum;
> > +     __s32 force_resolution;
> > +     __u32 press_threshold;
> > +     __u32 release_threshold;
> > +     __u32 mode;
> > +     __u32 default_auto_trigger;
> > +     __u32 vendor_page;
> > +     __u32 vendor_id;
> > +     __u32 max_waveform_id;
> > +     __u32 max_duration_id;
> > +     __u16 *hid_usage_map;
> > +     __u32 *duration_map;
> > +     __u16 press_ordinal_orig;
> > +     __u16 press_ordinal_cur;
> > +     __u16 release_ordinal_orig;
> > +     __u16 release_ordinal_cur;
> > +#define HID_HAPTIC_RELEASE_EFFECT_ID 0
> > +#define HID_HAPTIC_PRESS_EFFECT_ID 1
>
> Why these definitions are here?
>
I use them as indices in the effect array of effects below, though
they are actually mentioned in Sean O'Brien's kernel design proposal.
Please let me know if you would rather move them above. Perhaps it
should be even somehow exported via uapi (so that userspace does not
hardcode it separately).


> > +     struct hid_haptic_effect *effect;
> > +     struct hid_haptic_effect stop_effect;
> > +};
> > --
> > 2.34.1.307.g9b7440fafd-goog
> >
>
> Thanks.
>
> --
> Dmitry
