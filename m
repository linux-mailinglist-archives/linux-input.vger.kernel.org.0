Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB001229A1
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 12:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfLQLQC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 06:16:02 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36562 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfLQLQC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 06:16:02 -0500
Received: by mail-pl1-f196.google.com with SMTP id d15so5959393pll.3
        for <linux-input@vger.kernel.org>; Tue, 17 Dec 2019 03:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+awUKio9p4Gf8NY2FGLOxx315Fg31QJAQkkFLDdf2qk=;
        b=vhLu684VYkAnZb2xIOi86+7krc1q5YZ391ygeuZ9ZFGk8CW9UIuDfYWehfwbeiDZJs
         zE8jqRSy1XKVmGfPq3vfOcQRs72krLoF9Ph8WhX9lmNXeq70KSxDB7TthL4yy0iJg2oT
         2wfVzqz0V6Hv95ZE2bceCFg06TNpytRoAdLARpOfOHgM4MD+jWg64x7Gwp5vw9P+ge6K
         AXguuUV8/aAHK7qC5AO4XjFMnxSuqzcC+tNIBYFrKESHtXVtd7fjxGWcWe1orSEY1KAQ
         XEH9KzcETJBV6kmE4rdCGYaLK69z0UhCnNjlv3v3cT6zgX5DYuVfaY1EItVtJvaFF093
         HY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+awUKio9p4Gf8NY2FGLOxx315Fg31QJAQkkFLDdf2qk=;
        b=q3XmSc/OWQkYnQg4yfxBC7LbWxSuDldeZUWR1yLqMSkA+fPVJ5/7eXbVH7rH4tobsY
         51J9ywy0vMo2YBpUU5f9hLJDUpsW3XTbDWg3uqziUIQ1o9ALLxcEmPsWxmfBiNDaX0Pu
         r1DbtpPbZih2pxxgB2o1FZX/uFaOp1/qwe2tVtLeIPmcxsP06NTCgxiZu5FIff89VUA2
         vYhgXp9s3HaudF15QPwJ/yKY1vp8Zxg2q9dKMLVD2HaYSbODlofAy/i8v3F8C+cyWLTZ
         4AbgiEfBZBiU4eFTuBNdVGwuwUvxZov1UtMCF6yCBPU33jal9kMbpAza+kuqjStKWIMm
         C7bQ==
X-Gm-Message-State: APjAAAUN1i2xFGYnOOi92U4UJeR6KtzKH4gksUlFjEzh+68Z1ehVevjO
        MIlnN8DwMVn7cmTuo6oc0vzzrWYu4MKpKtB2fr/a4jBTudoxQg==
X-Google-Smtp-Source: APXvYqw1BghZmCWqP60myjxjEs6YuRq3Mo3lYtfOqhdxaPe8CxHGvSNj0WzKtKxsdl9oPTsLP3S4j8Jna1S2/v9ahic=
X-Received: by 2002:a17:90b:150:: with SMTP id em16mr5195492pjb.123.1576581361710;
 Tue, 17 Dec 2019 03:16:01 -0800 (PST)
MIME-Version: 1.0
References: <95e7a12ac909e7de584133772efc7ef982a16bbb.1576170740.git.andreyknvl@google.com>
 <Pine.LNX.4.44L0.1912121313030.1352-100000@iolanthe.rowland.org>
 <CAAeHK+yOBcNz_iopRs6PEu=1-rZn6Gkm+Urq+iVBFQeSjSXqNA@mail.gmail.com> <CACT4Y+aN20NXxXhe9qv_WRLntAHbL98Shj8NAvg0WafDw8C=jA@mail.gmail.com>
In-Reply-To: <CACT4Y+aN20NXxXhe9qv_WRLntAHbL98Shj8NAvg0WafDw8C=jA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 17 Dec 2019 12:15:50 +0100
Message-ID: <CAAeHK+xyVh6QkbUp6z+fLrv5f9sODkgFuvmBU1jB8borQ9M65g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] kcov: collect coverage from interrupts
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 17, 2019 at 12:00 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Dec 13, 2019 at 1:09 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Thu, Dec 12, 2019 at 7:15 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Thu, 12 Dec 2019, Andrey Konovalov wrote:
> > >
> > > > This change extends kcov remote coverage support to allow collecting
> > > > coverage from interrupts in addition to kernel background threads.
> > > >
> > > > To collect coverage from code that is executed in interrupt context, a
> > > > part of that code has to be annotated with kcov_remote_start/stop() in a
> > > > similar way as how it is done for global kernel background threads. Then
> > > > the handle used for the annotations has to be passed to the
> > > > KCOV_REMOTE_ENABLE ioctl.
> > > >
> > > > Internally this patch adjusts the __sanitizer_cov_trace_pc() compiler
> > > > inserted callback to not bail out when called from interrupt context.
> > > > kcov_remote_start/stop() are updated to save/restore the current per
> > > > task kcov state in a per-cpu area (in case the interrupt came when the
> > > > kernel was already collecting coverage in task context). Coverage from
> > > > interrupts is collected into pre-allocated per-cpu areas, whose size is
> > > > controlled by the new CONFIG_KCOV_IRQ_AREA_SIZE.
> > > >
> > > > This patch also cleans up some of kcov debug messages.
> > > >
> > > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > > ---
> > >
> > > > diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> > > > index 4c9d1e49d5ed..faf84ada71a5 100644
> > > > --- a/drivers/usb/gadget/udc/dummy_hcd.c
> > > > +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> > > > @@ -38,6 +38,7 @@
> > > >  #include <linux/usb/gadget.h>
> > > >  #include <linux/usb/hcd.h>
> > > >  #include <linux/scatterlist.h>
> > > > +#include <linux/kcov.h>
> > > >
> > > >  #include <asm/byteorder.h>
> > > >  #include <linux/io.h>
> > >
> > > That's the only change to this driver.  As such, it doesn't appear to
> > > be needed, judging by the patch description.
> >
> > Right, will fix in the next version, thanks!
>
> Please also post a github or gerrit link. These small scraps of
> changes without context and better visualisation are extremely hard to
> review meaningfully.

The link is in the cover letter:

https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2224/1
