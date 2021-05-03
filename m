Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E664537133E
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 11:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhECJxv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 May 2021 05:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49025 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233168AbhECJxu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 May 2021 05:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620035577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KDs3pOIle+cRA8UpT3sOe31Wu1oBEmfY+Iy8YXU7Ks4=;
        b=S57tTLyFMRSI/CERUNUrWc6aiJv6dqlQhdtjTiqn4Ex7QZHgJX+jZzvRDA192j59XnUPtC
        FGAzMZ1Zg/n7b2R+PrkmOepppNUx8+JD7CcbF32oIhXKaKPYnbVaxaJzjThytWi7GTpTyR
        l6LljDD10CX3Pni89KCwqkodlYivFQU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-4WJv9sIxMVu1PpfnduDpqg-1; Mon, 03 May 2021 05:52:55 -0400
X-MC-Unique: 4WJv9sIxMVu1PpfnduDpqg-1
Received: by mail-pl1-f197.google.com with SMTP id 70-20020a170902054cb02900ee99f0f965so1322192plf.14
        for <linux-input@vger.kernel.org>; Mon, 03 May 2021 02:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KDs3pOIle+cRA8UpT3sOe31Wu1oBEmfY+Iy8YXU7Ks4=;
        b=C9+nh1OLkEupZTEAqCt5MKu9a+hVgMMNvDUZ8pmtBcwWwM/p+cnrRPfTAt4Fj0kYKs
         lCspnsPM6sRUty9gEwGVdtQ2teliFEafv35Zp9eXHKOfxLZ2x1Rqoat47UrJfA+iCyo1
         qWSKU6rJIro7IdfGy3p0FnDevNGAyXjD0LGqWQJzNa9W7R11fg+SSTfhc/+0WbkzGA7j
         b6JJ8GcuuVrMXp3e/4qTRTjoNgQk0SbVSldeJw7EJidrjBiOVnb81XvXCdjeUHPUoh39
         vD+DE5JBHn6jEeGgOyyQ16EbfNJmIQwtgqNvsWAg9hsBP6P6ro8l/rxYRtAKeXGg5fGH
         5zsw==
X-Gm-Message-State: AOAM5321eEyb1Ftdn7ajGNiePLBeVjhfJuEWMSPifW7dgefabzdjWQ0e
        uPmnn20Q0jT9lvFiXMxo5F/75exD19pgz2KYA0efR8tXkQyVfoc7mcR7LXrxTsSq3+QOapZhmlu
        KzrErpKGRC9IoMJR7BvjlYShgc6dAtzpkDbSecoo=
X-Received: by 2002:a17:90a:c28e:: with SMTP id f14mr20715021pjt.56.1620035574078;
        Mon, 03 May 2021 02:52:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR4iYp4dmuiAx5BnZBb8yV00vItIMRv8+Q1ihodUitpk8KCos4tRw1D/9aXSFpUI3bJ5wUsGxU26oSwwioyIQ=
X-Received: by 2002:a17:90a:c28e:: with SMTP id f14mr20715005pjt.56.1620035573837;
 Mon, 03 May 2021 02:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
 <20210420131741.kdgxquhwqureih7c@tarta.nabijaczleweli.xyz>
 <nycvar.YFH.7.76.2105031110480.28378@cbobk.fhfr.pm> <CAO-hwJ+HhKU7EzPZGOtPePT_h7OUaJ=QfWi7eAcxsfRaDtQuvg@mail.gmail.com>
In-Reply-To: <CAO-hwJ+HhKU7EzPZGOtPePT_h7OUaJ=QfWi7eAcxsfRaDtQuvg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 May 2021 11:52:43 +0200
Message-ID: <CAO-hwJKLYTqQ9qZ8LZGabze_NjNfwAq2_V-28LFewjOC=EK8rw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Stylus-on-touchscreen device support
To:     Jiri Kosina <jikos@kernel.org>
Cc:     =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 3, 2021 at 11:39 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Mon, May 3, 2021 at 11:11 AM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Tue, 20 Apr 2021, =D0=BD=D0=B0=D0=B1 wrote:
> >
> > > > This patchset adds support for stylus-on-touchscreen devices as fou=
nd on
> > > > the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among oth=
ers;
> > > > with it, they properly behave like a drawing tablet.
> > > >
> > > > Patches 2 and 4 funxionally depend on patch 1.
> > > > Patch 4 needs patch 3 to apply.
> > > >
> > > > The output of this patchset and the need for a kernel, rather than
> > > > userspace, patch was previously discussed here:
> > > >   https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests=
/558#note_792834
> > > >
> > > > Changes in v2:
> > > > Patch 4 now ANDs the secondary button with the tip switch,
> > > > since it's otherwise borderline useless to the user.
> > > >
> > > > Ahelenia Ziemia=C5=84ska (4):
> > > >   HID: multitouch: require Finger field to mark Win8 reports as MT
> > > >   HID: multitouch: set Stylus suffix for Stylus-application devices=
, too
> > > >   HID: input: replace outdated HID numbers+comments with macros
> > > >   HID: input: work around Win8 stylus-on-touchscreen reporting
> > > >
> > > >  drivers/hid/hid-input.c      | 54 ++++++++++++++++++++++++++++++++=
++--
> > > >  drivers/hid/hid-multitouch.c | 18 +++++++-----
> > > >  2 files changed, 62 insertions(+), 10 deletions(-)
> > > >
> > > > --
> > > > 2.20.1
> > >
> > > Bumping this after a monthish =E2=80=92 is it missing something? Am I=
?
> >
> > Benjamin had concerns about regressions and wanted to run a full batter=
y
> > of testing on it.
> >
> > Benjamin, is there any outcome of that, please?
> >
>
> Sorry, no real outcome here.
>
> I ran the test suite, and there were no errors, until I realized that
> there are no tests regarding tablets, so it can't detect any
> regressions here.
> And then, the usual happens, no time to actually work on the test suite..=
. :(
>
> I'll do a "normal" review soon (i.e. today)
>

So I did a quick pass at the patches:
- 1/4 -> I think this one is safe and could go as it is, maybe with
CC: stable on it. Any regressions should have been caught by the
testsuite, so that's a good one.
- 2/4 and 3/4 -> Ack on those 2 too, note stable material, but not
necessary v5.13 material
- 4/4 -> I honestly have no idea if the patch is correct or not. I
would hold on this one until we have proper tests for those.

Jiri, would you be ok to split the series as this?

=D0=BD=D0=B0=D0=B1, would you be OK to work on the test suite at
https://gitlab.freedesktop.org/libevdev/hid-tools so we can move
forward for your last patch?

The problem I see on the last patch is that it is touching a generic
path and is not trivial. So adding tests would have 3 benefits:
- we ensure we are doing the correct thing
- we ensure we are not breaking existing devices (to some extent,
given that the tests are non written for the tablets)
- we ensure we are not breaking that in the future.

Cheers,
Benjamin

