Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C57372B21
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 15:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhEDNgW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 May 2021 09:36:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27167 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231127AbhEDNgV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 May 2021 09:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620135326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1esyjlWDDZ6g1mqcvxLgs907ppKN4y78vJLAEW1xlVU=;
        b=QFm9GBijSoLgRKLItEP9/F+QdalbWJjhlttcPJagd/5Xp5s4+r9dMxiDRcMgHqtMEhRlj2
        9Hrvrsi+nHiNNMA4amFpu/P8hB3wtPCYT6mAbS6h6577y4wMwKVjz8IyUO8l9zifF5Yygp
        HKIE5uB6/pX9giBHqcR4p6coTgFFhTw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-m1bpE4heMDaxB58h1TZWRg-1; Tue, 04 May 2021 09:35:24 -0400
X-MC-Unique: m1bpE4heMDaxB58h1TZWRg-1
Received: by mail-pg1-f199.google.com with SMTP id z19-20020a63e1130000b02901fcdcf0c5a3so5103895pgh.19
        for <linux-input@vger.kernel.org>; Tue, 04 May 2021 06:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1esyjlWDDZ6g1mqcvxLgs907ppKN4y78vJLAEW1xlVU=;
        b=Xts2QKQz6S/SOoGlzqiaZdSChoRvX5pv9BGxNKNioi3DCad0BWLcysV/XbXILcT0gl
         4usR6fua68BstMNWTGH4NpDZgfYu7VSo+4XIRUC/PojaaHHuRu11w7ebwH1ny+eEMs9n
         Q2DizWp1/jLvJxU+KUds+NstMg/Bb0MvLAWJP0O0dxfPGKFexzY5jcjt410r64VcdXLH
         K09zNVuGxSc/5/M1993RAxT0HXKI948rf9MhSchb57/MaBmFVwxgY2KOFxD4sJI/11Vp
         xie7j3ESQoOj+khe/3wF5gO0A931LfAVZSD98LCM/XJcpUKEjixnn0efR6v1xWReog5O
         CA8A==
X-Gm-Message-State: AOAM532jpfyg19wWQ1VcOx++Tlg9XO7JLvy0QC3euCAOFnOXQ48vATRb
        +Iv5bEYIltnQC4QVcJH+rY++j994DEydweiMX3TDn88W/DtkZxE9WO+9g1pTI5j/JR6Jb2clkxU
        t5jhwDWdqbloxsfyAcNF3xa8hPUSGO7rRyCDe+nk=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr28239501pjr.234.1620135322821;
        Tue, 04 May 2021 06:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvXnq+hEu0eaHHUrq6r/PYuNDcNF/Zk54+QK/BLkYR2HpKvds8yeQ9rk74C3zK9PCbHQUTMfjs2PcFmC4mnKQ=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr28239483pjr.234.1620135322603;
 Tue, 04 May 2021 06:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
 <20210420131741.kdgxquhwqureih7c@tarta.nabijaczleweli.xyz>
 <nycvar.YFH.7.76.2105031110480.28378@cbobk.fhfr.pm> <CAO-hwJ+HhKU7EzPZGOtPePT_h7OUaJ=QfWi7eAcxsfRaDtQuvg@mail.gmail.com>
 <CAO-hwJKLYTqQ9qZ8LZGabze_NjNfwAq2_V-28LFewjOC=EK8rw@mail.gmail.com> <20210503130015.d2qnahrrfyv3odqj@tarta.nabijaczleweli.xyz>
In-Reply-To: <20210503130015.d2qnahrrfyv3odqj@tarta.nabijaczleweli.xyz>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 4 May 2021 15:35:11 +0200
Message-ID: <CAO-hwJK31jSRrB4H39x980GVN6X0Stn3awohXn50d-gHp7XgzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Stylus-on-touchscreen device support
To:     =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 3, 2021 at 3:00 PM =D0=BD=D0=B0=D0=B1 <nabijaczleweli@nabijaczl=
eweli.xyz> wrote:
>
> On Mon, May 03, 2021 at 11:52:43AM +0200, Benjamin Tissoires wrote:
> > On Mon, May 3, 2021 at 11:39 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > On Mon, May 3, 2021 at 11:11 AM Jiri Kosina <jikos@kernel.org> wrote:
> > > >
> > > > On Tue, 20 Apr 2021, =D0=BD=D0=B0=D0=B1 wrote:
> > > >
> > > > > > This patchset adds support for stylus-on-touchscreen devices as=
 found on
> > > > > > the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among=
 others;
> > > > > > with it, they properly behave like a drawing tablet.
> > > > > >
> > > > > > Patches 2 and 4 funxionally depend on patch 1.
> > > > > > Patch 4 needs patch 3 to apply.
> > > > > >
> > > > > > The output of this patchset and the need for a kernel, rather t=
han
> > > > > > userspace, patch was previously discussed here:
> > > > > >   https://gitlab.freedesktop.org/libinput/libinput/-/merge_requ=
ests/558#note_792834
> > > > > >
> > > > > > Changes in v2:
> > > > > > Patch 4 now ANDs the secondary button with the tip switch,
> > > > > > since it's otherwise borderline useless to the user.
> > > > > >
> > > > > > Ahelenia Ziemia=C5=84ska (4):
> > > > > >   HID: multitouch: require Finger field to mark Win8 reports as=
 MT
> > > > > >   HID: multitouch: set Stylus suffix for Stylus-application dev=
ices, too
> > > > > >   HID: input: replace outdated HID numbers+comments with macros
> > > > > >   HID: input: work around Win8 stylus-on-touchscreen reporting
> > > > > >
> > > > > >  drivers/hid/hid-input.c      | 54 ++++++++++++++++++++++++++++=
++++++--
> > > > > >  drivers/hid/hid-multitouch.c | 18 +++++++-----
> > > > > >  2 files changed, 62 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > --
> > > > > > 2.20.1
> > > > >
> > > > > Bumping this after a monthish =E2=80=92 is it missing something? =
Am I?
> > > >
> > > > Benjamin had concerns about regressions and wanted to run a full ba=
ttery
> > > > of testing on it.
> > > >
> > > > Benjamin, is there any outcome of that, please?
> > > >
> > >
> > > Sorry, no real outcome here.
> > >
> > > I ran the test suite, and there were no errors, until I realized that
> > > there are no tests regarding tablets, so it can't detect any
> > > regressions here.
> > > And then, the usual happens, no time to actually work on the test sui=
te... :(
> > >
> > > I'll do a "normal" review soon (i.e. today)
> > >
> >
> > So I did a quick pass at the patches:
> > - 1/4 -> I think this one is safe and could go as it is, maybe with
> > CC: stable on it. Any regressions should have been caught by the
> > testsuite, so that's a good one.
> > - 2/4 and 3/4 -> Ack on those 2 too, note stable material, but not
> > necessary v5.13 material
> > - 4/4 -> I honestly have no idea if the patch is correct or not. I
> > would hold on this one until we have proper tests for those.
> >
> > Jiri, would you be ok to split the series as this?
>
> Splitting 2/4 away from 1/4 presents a minor cosmetic problem:
> since 1/4 no longer tags the stylus-on-touchscreen device as MT,
> the device name turns from "GXTP7386:00 27C6:0113 Stylus"
> to "GXTP7386:00 27C6:0113", so the user is left with
> two identically-named devices, the first of which corresponds
> to the touchscreen, and the second to the stylus.
>
> Granted, it might also append "Stylus" to names that could contain it,
> but I haven't managed to trace where hdev->name is born to determine if
> that's a concern.
>
> > =D0=BD=D0=B0=D0=B1, would you be OK to work on the test suite at
> > https://gitlab.freedesktop.org/libevdev/hid-tools so we can move
> > forward for your last patch?
> >
> > The problem I see on the last patch is that it is touching a generic
> > path and is not trivial. So adding tests would have 3 benefits:
> > - we ensure we are doing the correct thing
> > - we ensure we are not breaking existing devices (to some extent,
> > given that the tests are non written for the tablets)
> > - we ensure we are not breaking that in the future.
>
> I'd be more than happy to add tests of some sort, but reading the
> repository and tests/ under it has me positively stumped,
> not a clue where an entry-point would be, or how I'd instrument a
> reasonable test around my rdesc, so some sort of vague guidance
> to that end would be greatly appreciated.
>

Sorry, it was a little bit harsh to ask this from scratch.

I created an initial MR you can work on top of it:
https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/115

Basically, you need to add your device in `tests/test_tablet.py` (like
all the other devices). You probably also need to add more tests to
the two I added, to expose the bug.

Hopefully, just doing that should expose the bug. If not, you'll need
to subclass PenDigitizer and override the `event()` function to
actually match what is sent on the wire when you request a high level
`Pen()` event.

To run the test suite, we are using `pytest`, which means it is all
automagic: `sudo pytest -k 'tablet' -v` will run every `test_*` pytest
finds with the `tablet` string in it. You can be more specific by just
running your device by issuing `sudo pytest -k 'tablet and
VENDOR_VID_PID' -v` (replace VENDOR_VID_PID with the name of the
class).

Note also that the patch 2 here will probably make the `test_creation`
fail as this one checks for the name. We will need a separate MR for
this depending on how the patches end up being included in the kernel
tree.

Hope this helps.

Cheers,
Benjamin

