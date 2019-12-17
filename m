Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B19AB122963
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 12:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfLQLAQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 06:00:16 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43466 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLQLAQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 06:00:16 -0500
Received: by mail-qk1-f193.google.com with SMTP id t129so1663877qke.10
        for <linux-input@vger.kernel.org>; Tue, 17 Dec 2019 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mG99GA6/Xiwz9qwjNacdCgRQBNUN/DJm+EdzhM5zdJk=;
        b=ZKi2ffTW6CKhiLlUehhNua4oR+IQVrnfldGgSCvYobXyaxf4QGLMGV1ZZ6p4OBl2tI
         FkPzuoOceoPyusSCU5xvdzfD0Jr7XdnBsgcW7GlTB8qKVhWCSKtCBYlgVotmWsyfUHm2
         GL9Y+50K4eb6Wx3TwS6+mOVTAmbDmPtwNFU0USc1pvW0N98+98OXqgU/O1e0K/WRt0Hj
         q+4ovQ8zbfrAtOkcQotudiZmC2nGxboSBOmLjkpvV5f2Qu9PixHe4hYSngMd6J3ELeNH
         8pgdbSEjSs7FVMvOEIbXJ+gOTGPRFEGOfa1bVyhCWL92V8E5Moi4UQ7aOev0/NGOIhLz
         1ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mG99GA6/Xiwz9qwjNacdCgRQBNUN/DJm+EdzhM5zdJk=;
        b=jom8jeijUrpbb1KyLq+ytXQxmZKqJBcmc2B3/v9isbESHFRgQK8Pb5gZI7HnUls8r3
         FdwwQigdg9LjS/zcJaBDg3u9kFunImxzMpeoh0dXVr4K6rQZdI/qQJwcQZ/5jrJ/o1ic
         Fr5AQ+x7f1YUCFtf0rczPrKGwSzVVIrQl6Hp3WPoNVOzP2R+5M51S+aDT5w9dJDkDTmS
         qKDYEH4ntocj14YEE6Kc0S9GH7p8WC649TeS0VqsvqmDY35BKamnyyS3zyheaUHWRk93
         29FJ2g3EH2x4OcGcTXjZxL/KVuU6YuNKjpJxPLJo7Uj6TyZVDNUOBtbJOxxjGppt06mz
         dgCw==
X-Gm-Message-State: APjAAAWgVPFtXC46XiKcr58RQsxBQ5z2c9xmw6wzmtDwP8vjUKcYPvMH
        32j/PdqPlxHB/L5vPgnj51D864HAsIDwNUVc/RDT9YdSG4k=
X-Google-Smtp-Source: APXvYqywDIx8QZijrqsCgnbP1i8WSjZej+2z1QKYbvCx4iGWrKY4auHMIOJEyC9uciCsefBQ0G4vqX+E02yg22qADrU=
X-Received: by 2002:ae9:eb48:: with SMTP id b69mr4157084qkg.43.1576580415093;
 Tue, 17 Dec 2019 03:00:15 -0800 (PST)
MIME-Version: 1.0
References: <95e7a12ac909e7de584133772efc7ef982a16bbb.1576170740.git.andreyknvl@google.com>
 <Pine.LNX.4.44L0.1912121313030.1352-100000@iolanthe.rowland.org> <CAAeHK+yOBcNz_iopRs6PEu=1-rZn6Gkm+Urq+iVBFQeSjSXqNA@mail.gmail.com>
In-Reply-To: <CAAeHK+yOBcNz_iopRs6PEu=1-rZn6Gkm+Urq+iVBFQeSjSXqNA@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 17 Dec 2019 12:00:03 +0100
Message-ID: <CACT4Y+aN20NXxXhe9qv_WRLntAHbL98Shj8NAvg0WafDw8C=jA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] kcov: collect coverage from interrupts
To:     Andrey Konovalov <andreyknvl@google.com>
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

On Fri, Dec 13, 2019 at 1:09 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Thu, Dec 12, 2019 at 7:15 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, 12 Dec 2019, Andrey Konovalov wrote:
> >
> > > This change extends kcov remote coverage support to allow collecting
> > > coverage from interrupts in addition to kernel background threads.
> > >
> > > To collect coverage from code that is executed in interrupt context, a
> > > part of that code has to be annotated with kcov_remote_start/stop() in a
> > > similar way as how it is done for global kernel background threads. Then
> > > the handle used for the annotations has to be passed to the
> > > KCOV_REMOTE_ENABLE ioctl.
> > >
> > > Internally this patch adjusts the __sanitizer_cov_trace_pc() compiler
> > > inserted callback to not bail out when called from interrupt context.
> > > kcov_remote_start/stop() are updated to save/restore the current per
> > > task kcov state in a per-cpu area (in case the interrupt came when the
> > > kernel was already collecting coverage in task context). Coverage from
> > > interrupts is collected into pre-allocated per-cpu areas, whose size is
> > > controlled by the new CONFIG_KCOV_IRQ_AREA_SIZE.
> > >
> > > This patch also cleans up some of kcov debug messages.
> > >
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > ---
> >
> > > diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> > > index 4c9d1e49d5ed..faf84ada71a5 100644
> > > --- a/drivers/usb/gadget/udc/dummy_hcd.c
> > > +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> > > @@ -38,6 +38,7 @@
> > >  #include <linux/usb/gadget.h>
> > >  #include <linux/usb/hcd.h>
> > >  #include <linux/scatterlist.h>
> > > +#include <linux/kcov.h>
> > >
> > >  #include <asm/byteorder.h>
> > >  #include <linux/io.h>
> >
> > That's the only change to this driver.  As such, it doesn't appear to
> > be needed, judging by the patch description.
>
> Right, will fix in the next version, thanks!

Please also post a github or gerrit link. These small scraps of
changes without context and better visualisation are extremely hard to
review meaningfully.
