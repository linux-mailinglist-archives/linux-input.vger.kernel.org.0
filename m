Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF2A15048A
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 11:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgBCKsf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 05:48:35 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48691 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727102AbgBCKse (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Feb 2020 05:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580726914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4vl9t6G+rR4BEVeLAiNKfNbHtFriLKQ5FIXsIeC8dtI=;
        b=HgZRQXs2BuHMBegStLdjyVuf1cC+vZOOUvh8QF0Dzz9f08KOp/KFhXHZGBCWpDSDS6L5Ai
        Aqq9jwCgPjQvFPmxiJge6BPdXRdHl0SAYziqJGQK5qcCtANA/iQlzqnBft23StaqwbePU5
        HUUHv8V4hzd5P/hg34eG3Qs1GsxCoDc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-I67oDbcAPl2FM6Qy0KtFyQ-1; Mon, 03 Feb 2020 05:48:26 -0500
X-MC-Unique: I67oDbcAPl2FM6Qy0KtFyQ-1
Received: by mail-qv1-f69.google.com with SMTP id f17so9212142qvi.6
        for <linux-input@vger.kernel.org>; Mon, 03 Feb 2020 02:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4vl9t6G+rR4BEVeLAiNKfNbHtFriLKQ5FIXsIeC8dtI=;
        b=O30arS3NFLnmHqeUoYn0rv41w9NuRZYbbUM+6unobaopvMRyM3hj7KbmMNEZeDl8Jk
         ByjcVqUSnIUs89lbO2pY1B6FPEZHOcJcxAXQ4EW9qpvl3W8puXvouO8jjqvvZRkpas2H
         fETagFzU03/9VPYwJRh0U+FIh5q0zrPl+PrpyvuJi4d5y/03xRyWuDzwsxtj+f0JMV9U
         VsOf5RS4+UfAx8Niucd0Ivs7MiixIAaI6r+RYmflrO6yhN9Jz514/sQlm7h9RQLtpyfQ
         IoaIEcxEMtTIMeqmzj96r7udwPp/rPS7FEbroEXXl3mrlZUHm14AdfQxNDv+1DqJyGDl
         LsYg==
X-Gm-Message-State: APjAAAV8x2o65llQX5rXIO7BMkRKq1VI6jZNJuZqc+9MQKLdA++PsChW
        PleoFJs5GFVCu6Uv/qs736s1lxnzoYomJRAyF38b08XM5XwbiBUNYap1uqrVhi8tu/B/Fy+pvq2
        XbpFnJObS87cYKiusRyKsoFo/F7/pxjJQm0GEtsE=
X-Received: by 2002:a05:620a:782:: with SMTP id 2mr23117410qka.169.1580726906228;
        Mon, 03 Feb 2020 02:48:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqw57KilUvEJk+H5dJAZYGiDk0XG43+Td/Vmu8tcnt+BfPz8KNU+iEHA3MSmVGjSVNMCiuK60JC28Q8bOkYLWfE=
X-Received: by 2002:a05:620a:782:: with SMTP id 2mr23117385qka.169.1580726905695;
 Mon, 03 Feb 2020 02:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20200126194513.6359-1-martyn@welchs.me.uk> <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
 <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
 <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com> <nycvar.YFH.7.76.2002031100500.31058@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2002031100500.31058@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Feb 2020 11:48:14 +0100
Message-ID: <CAO-hwJ+k8fxULS1xC-28jHmhZLZVN5EGc=kY5sqNX1GCNKpt4A@mail.gmail.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Martyn Welch <martyn@welchs.me.uk>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Conn O'Griofa" <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 3, 2020 at 11:02 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 28 Jan 2020, Roderick Colenbrander wrote:
>
> > Let me explain the situation a little bit better from our angle. These
> > devices exist and from the Linux community perspective of course they
> > should see some level of support. And as I said since this is PS3
> > generation I don't have much of a concern.
> >
> > Where it becomes tricky for any company in our situation is the support
> > side. We don't know these devices and don't have access to datasheets or
> > anything, but when such code is in our "official driver" it means we
> > have to involve them in our QA process and support them in some manner
> > (kind of legitimizing their existence as well). We now support this
> > driver in a large capacity (pretty much all mobile devices will start
> > shipping it) it puts challenges on our partners (not a big issue since
> > just PS3 right now).
> >
> > As you can see this creates an awkward situation. I'm sure there other
> > such devices as well e.g. counterfeit Logitech keyboards, USB serial
> > adapters and other periperhals with similar challenges. In an ideal
> > world the support would live in another driver, but since in case of
> > this "fake" PS3 controller it "share" our product / vendor ids it is
> > tricky. At this point there is not a strong enough case yet to augment
> > the "hid-quirks" to do so, but perhaps if it became a serious issue
> > (e.g. for newer controllers) maybe we need to think of something.
>
> If this is a big issue for you, one possible way around it would be
> creating a module parameter which would tell the driver whether it should
> those "fake" devices, and you can then turn it off in your products (or we
> can of course start the "what should the default setting me" bikeshedding
> :) ).
>

I am definitely not in favour of that :(

The basic problem we have here is that some vendors are overriding
your VID/PIDs, and this is nasty. And I do not see any reasons why you
can't say: "well, we broke it, sorry, but we only support *our*
devices, not third party ones".

One thing that comes to my mind (probably not the best solution), is
to taint the kernel if you are facing a non genuine product. We do
that for nvidia, and basically, we can say: "well, supporting the
nvidia blob is done on a best effort case, and see with them directly
if you have an issue".
Tainting the kernel is a little bit rough, but maybe adding an info
message in the dmesg if you detect one of those can lead to a
situation were we can count on you for supporting the official
products, and you can get community support for the clones.

One last thing. Roderick, I am not sure if I mentioned that or not,
but I am heavily adding regression tests for HID in
https://gitlab.freedesktop.org/libevdev/hid-tools/
Given that hid-sony.ko seems to only use pure HID communication, it
should be easy enough to write regression tests for the devices, and
this way you can split up the QA in 2: automated and upstream tests
run by me for all devices handled by hid-sony, and your QA can focus
on the actual physical hardware, and ignore all of the clones.

Cheers,
Benjamin

