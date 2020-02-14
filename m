Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0C715D607
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 11:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgBNKt5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 05:49:57 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22882 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726220AbgBNKt4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 05:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581677395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fSgEluaHGa8leFnsE9iqw+rk1Yo4kiBvDA+ooR2L+T4=;
        b=R3mUuLqNEnp3H6pdihFeQ1F3mBs+d6JkyV7Y+0Fs/r/HwGNXYJfchNLI3LSeBzBfwok7gF
        BXuQmylg7Sn2q47ty0foHgDxd50L3WN+XUR225ZgWHmQi/RYbkTK+KrZ6NiUAcdNw5ErCR
        5eeTRUo3hRjSCy1ZQ6LO7uIcrnEXrN8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-fD6o7rRZMhGLrY7IdMny3Q-1; Fri, 14 Feb 2020 05:49:45 -0500
X-MC-Unique: fD6o7rRZMhGLrY7IdMny3Q-1
Received: by mail-qt1-f199.google.com with SMTP id n4so5673369qtv.5
        for <linux-input@vger.kernel.org>; Fri, 14 Feb 2020 02:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fSgEluaHGa8leFnsE9iqw+rk1Yo4kiBvDA+ooR2L+T4=;
        b=FV2u+VXMLu1h/MNp544UGfRz/d4rU8bzPsHQYoUB00NraGULIJmv3+ew50pbg6tWW0
         2nuO2NdmkXxY0dFGfCuMqGO1zNsIygQ282DRT/gjlxeh+lI5sR/PObHB6wMIMdKL3lP8
         3aqC8EVqEdYKulTwgiWOQqEGAiRLGoDm6sGz2TmXONKTUVG6xsStBRUCVxaSXk+3ZYXr
         0XTzLNBR0G74gdGWSoYa2UQwU5cgUk/l2/Pvddv+z/x1vCFIeLqZImsPIr39ERTiNqsF
         I7jEbpob8WKId75m6DUulf6TpB3T6up7qaWN2uyRKlxpi6q/PfjC0y0JqdrlF7pemMv6
         PNAQ==
X-Gm-Message-State: APjAAAX0dWusleZOwL4l2qXvy1WAugBxCSvY+CiWES4+6bUhxbfhCRb+
        9o6JXXAMqUCkjubvUjgJtWXVjKtpCStFQ7V+2oZreGFkEwvGkNrmEaiqjhsK79KFZ+mmtn9HpDg
        Hzbu/2mboN1D2I7D2PRfRd0QfsogIzqWcM80b51g=
X-Received: by 2002:ac8:365c:: with SMTP id n28mr1951214qtb.260.1581677384805;
        Fri, 14 Feb 2020 02:49:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGgJRFy6veg67wjwjYwpy9jTbZD9mlVLCLZoGzId3sjpz1VR+IHf7fAA/LWUOzTgF9JEAPy3OOKOoGXjekTWQ=
X-Received: by 2002:ac8:365c:: with SMTP id n28mr1951188qtb.260.1581677384443;
 Fri, 14 Feb 2020 02:49:44 -0800 (PST)
MIME-Version: 1.0
References: <CAKsRvPOyPqxLaUx+gemCARq+gVeOO94iqyVMWspUEKXk==_wZg@mail.gmail.com>
 <7c767187-38a2-f3a7-faef-8e3d445607d9@cisco.com>
In-Reply-To: <7c767187-38a2-f3a7-faef-8e3d445607d9@cisco.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 14 Feb 2020 11:49:33 +0100
Message-ID: <CAO-hwJJsaB3XK631OMvTiPHz8MTHpCfj0zX98+6EpkbD5W2dQQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: truncate hid reports exceeding HID_MAX_BUFFER_SIZE
To:     "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
Cc:     js <sym.i.nem@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Armando Visconti <armando.visconti@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 4, 2020 at 6:10 PM Johan Korsnes (jkorsnes)
<jkorsnes@cisco.com> wrote:
>
> On 2/4/20 1:28 PM, js wrote:
> > Commit 8ec321e96e05 ("HID: Fix slab-out-of-bounds read in
> > hid_field_extract") introduced a regression bug that broke
> > hardware probes which request large report sizes.
> >
> > An example of this hardware is the ELON9038 digitizer on the
> > Microsoft Surface Go as per bug id 206259.
> > https://bugzilla.kernel.org/show_bug.cgi?id=206259
> >
> > To eliminate the regression, return 0 instead of -1 when a
> > large report size is requested, allowing the hardware to
> > probe properly while size error is output to kernel log.
> >
> > Commit 8ec321e96e05 does not enforce buffer size limitation
> > on the size of the incoming report.
> > Added enforcement by truncation to prevent buffer overflow in
> > hid_report_raw_event().
> >
> > Fixes: 8ec321e96e05 ("HID: Fix slab-out-of-bounds read in hid_field_extract")
> > Reported-and-tested-by: James Smith <sym.i.nem@gmail.com>
> > Signed-off-by: James Smith <sym.i.nem@gmail.com>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Armando Visconti <armando.visconti@st.com>
> > Cc: Jiri Kosina <jkosina@suse.cz>
> > Cc: Johan Korsnes <jkorsnes@cisco.com>
> > Cc: stable@vger.kernel.org
> > ---
> > Sorry about my earlier email, I'm new to this forum and am still
> > learning the conventions.
> >
> > At your suggestion, I examined the code more carefully and I think
> > that the previous patch (commit 8ec321e96e05) did not solve the buffer
> > overflow at all, it just killed a tranche of hardware of unknown size
> > which requests report sizes exceeding 4K.
> >
> > The problem, and why the previous patch didn't really address the
> > issue, is that the enforcement occurs at a declarative point in the
> > code, which is to say, the device is just describing itself, it is not
> > actually requesting memory or generating a report. A malicious device
> > could easily describe itself incorrectly then generate a report
> > exceeding both the size it indicated in hid_add_field() and
> > HID_MAX_BUFFER_SIZE, overflowing the buffer and causing unintended
> > behavior.
> >
> > The correct point to enforce a buffer size constraint is the point
> > where the report is taken from the device and copied into the hid
> > handling layer. From my examination of the code, this seems to be in
> > hid_report_raw_event(). Thus, I placed an enforcement constraint on
> > the report size in that method, took out the enforcement constraint in
> > hid_add_field(), because it was causing a hardware regression and not
> > properly enforcing the boundary constraint, and added user-facing
> > warnings to notify when hardware is going to be affected by the
> > introduced boundary constraints.
> >
> > I also Cc'd Johan Korsnes because he submitted a patch for a related problem.
> >
> > Thanks,
> >
> > js
> > ---
> >
> > --- a/drivers/hid/hid-core.c  2020-01-28 02:04:58.918309900 +0000
> > +++ b/drivers/hid/hid-core.c  2020-01-29 06:37:22.861190986 +0000
> > @@ -290,8 +290,12 @@ static int hid_add_field(struct hid_pars
> >
> >   /* Total size check: Allow for possible report index byte */
> >   if (report->size > (HID_MAX_BUFFER_SIZE - 1) << 3) {
> > -   hid_err(parser->device, "report is too long\n");
> > -   return -1;
> > +   hid_warn(parser->device,
> > +       "report is too long and will be truncated: %d > %d\n",
> > +       report->size,
> > +       (HID_MAX_BUFFER_SIZE - 1) << 3);
> > +   parser->global.report_size = report->size =
> > +     (HID_MAX_BUFFER_SIZE - 1) << 3;
> >   }
> >
> >   if (!parser->local.usage_index) /* Ignore padding fields */
> > @@ -1748,6 +1752,10 @@ int hid_report_raw_event(struct hid_devi
> >     dbg_hid("report %d is too short, (%d < %d)\n", report->id,
> >         csize, rsize);
> >     memset(cdata + csize, 0, rsize - csize);
>
> With your patch I assume we're still vulnerable to the off-by-one
> memset() for which I proposed a fix[0]. If so, I suggest my patch is
> applied first, or simply merged with this patch. With your patch we no
> longer abort at probe if a report is too long. We are therefore more
> likely to end up with a kernel Oops and ensuing crash if we receive a
> report with size greater than HID_MAX_BUFFER_SIZE.
>
> [0] https://lore.kernel.org/linux-usb/20200117120836.2354966-1-jkorsnes@cisco.com/

Hi Johan,

can you please fix your process to also include the linux-input ML and
myself to HID related patches?

It doesn't matter for this one, as I see it in the HID tree, but I
wasn't aware of it nor the other one ("HID: core: increase HID report
buffer size to 8KiB"). And I like being aware of HID patches :)

The main reason is that whenever a patch hit linux-input, I run a
series of test with https://gitlab.freedesktop.org/libevdev/hid-tools,
and the 2 fixes you sent are some very strong candidates for
regression tests.

Can you send me your report descriptors with the `hid-recorder` tool
in the hid-tools project, and I'll add your device in the test suite?

Cheers,
Benjamin

>
> Johan
>
> > + } else if (csize > rsize) {
> > +   hid_warn(hid, "report %d is too long, truncating (%d > %d)\n",
> > +       report->id, csize, rsize);
> > +   report->size = size = rsize;
> >   }
> >
> >   if ((hid->claimed & HID_CLAIMED_HIDDEV) && hid->hiddev_report_event)
> >
> >
> > On Tue, Jan 28, 2020 at 12:44 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, Jan 27, 2020 at 9:41 PM js <sym.i.nem@gmail.com> wrote:
> >>>
> >>> i'm bumping this bug because i haven't heard anything from the
> >>> maintainers for a week.
> >>
> >> Apologies for the delay. I have been in a conference the past 2 weeks
> >> in Australia, so couldn't handle much of upstream.
> >> Furthermore, we are currently in the merge window, which means we
> >> should not push patches to linux-next unless they are absolutely
> >> needed.
> >>
> >>> there's been no change in the git either.
> >>> what's going on guys? this is a tiny patch for a very simple bug.
> >>> it should be a fast review and commit to the kernel tree.
> >>
> >> Nope, that is not that simple:
> >>
> >> - please submit your patches following
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n340
> >> Our tools require the patches to not be attached in an email so we can
> >> process them
> >> - this patch affects the core of the HID subsystem, which means we
> >> should take extra care when dealing with it to not break other systems
> >> - this patch seems to paper over a security patch
> >> (8ec321e96e056de84022c032ffea253431a83c3c) by changing the return
> >> value from an error to "yeah, that's fine". So unless there is a proof
> >> that this is the correct way, it's going to be a nack from me until
> >> proven otherwise
> >> - this patch affects in the end hid-multitouch, and as mentioned in
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/hid-multitouch.c#n26
> >> I'd like to have a reproducer in
> >> https://gitlab.freedesktop.org/libevdev/hid-tools so we do not break
> >> those devices in the future.
> >>
> >> So I understand the frustration of having a HW regression, but this
> >> patch is clearly not the correct solution given what I have here, so I
> >> can not push it right now.
> >>
> >> Cheers,
> >> Benjamin
> >>
> >>>
> >>> js
> >>>
> >>> On Sun, Jan 19, 2020 at 1:14 PM js <sym.i.nem@gmail.com> wrote:
> >>>>
> >>>> i posted this bug to bugzilla with the attached patch.
> >>>> this email is to notify the maintainers.
> >>>> https://bugzilla.kernel.org/show_bug.cgi?id=206259
> >>>>
> >>>> thanks!
> >>>>
> >>>> js
> >>>> ----
> >>>>
> >>>> ELAN i2c digitizer on microsoft surface go fails to initialize and
> >>>> device is non-functional
> >>>>
> >>>> initialization fails on 4.19.96:
> >>>> ----
> >>>> [    5.507245] hid-generic 0018:04F3:261A.0005: report is too long
> >>>> [    5.507256] hid-generic 0018:04F3:261A.0005: item 0 1 0 8 parsing failed
> >>>> [    5.507290] hid-generic: probe of 0018:04F3:261A.0005 failed with error -22
> >>>> [    5.556409] hid-multitouch 0018:04F3:261A.0005: report is too long
> >>>> [    5.581641] hid-multitouch 0018:04F3:261A.0005: item 0 1 0 8 parsing failed
> >>>> [    5.618495] hid-multitouch: probe of 0018:04F3:261A.0005 failed
> >>>> with error -22
> >>>>
> >>>> initialization succeeds on 4.19.95:
> >>>> ----
> >>>> [    7.150887] hid-generic 0018:04F3:261A.0001: input,hidraw2: I2C HID
> >>>> v1.00 Device [ELAN9038:00 04F3:261A] on i2c-ELAN9038:00
> >>>> [    8.253077] input: ELAN9038:00 04F3:261A as
> >>>> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN9038:00/0018:04F3:261A.0001/input/input20
> >>>> [    8.253219] input: ELAN9038:00 04F3:261A Pen as
> >>>> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN9038:00/0018:04F3:261A.0001/input/input23
> >>>> [    8.253330] hid-multitouch 0018:04F3:261A.0001: input,hidraw0: I2C
> >>>> HID v1.00 Device [ELAN9038:00 04F3:261A] on i2c-ELAN9038:00
> >>>>
> >>>> problem seems to be due to this commit:
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.19.y&id=31d06cc8e7caec36bedeb4f90444920431462f61
> >>>
> >>
>

