Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA9129F447
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 19:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgJ2Su5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 14:50:57 -0400
Received: from antispam.etsmtl.ca ([208.72.177.108]:59880 "EHLO
        antispam.etsmtl.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgJ2Su4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 14:50:56 -0400
X-ASG-Debug-ID: 1603996547-1241596aa004470003-vblZzk
Received: from relais.etsmtl.ca (relais.etsmtl.ca [142.137.1.25]) by antispam.etsmtl.ca with ESMTP id EQTtIKSM6rkNbPrs (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 29 Oct 2020 14:35:56 -0400 (EDT)
X-Barracuda-Envelope-From: Pascal.Giard@etsmtl.ca
X-Barracuda-Effective-Source-IP: relais.etsmtl.ca[142.137.1.25]
X-Barracuda-Apparent-Source-IP: 142.137.1.25
X-Gm-Message-State: AOAM530/FGn6LaxovhmnKKBBU5XtbI8jLTp6ntPRKxbXBtOU/gZ6775W
        Cw3Xb/RRHxiHgVrskLrZ6yaid5Rw9K4QAaGCN7s=
X-Google-Smtp-Source: ABdhPJwJ0HaSSS5Zj8Q3hIPin7+DS4vqj76gEmkcauU3lzqMME0xAKszLvhnZxHnJJ2rVR5cZ1W6oWuvFR8aeDYy/78=
X-Received: by 2002:a67:8b84:: with SMTP id n126mr4777766vsd.45.1603996546297;
 Thu, 29 Oct 2020 11:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201009022722.123943-1-pascal.giard@etsmtl.ca> <nycvar.YFH.7.76.2010291622380.18859@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2010291622380.18859@cbobk.fhfr.pm>
From:   Pascal Giard <pascal.giard@etsmtl.ca>
Date:   Thu, 29 Oct 2020 14:35:35 -0400
X-Gmail-Original-Message-ID: <CAJNNDmn1OBzRouNUcAmWSfj4piSHRFfc6V6gvb2D+2qYO1Ob7g@mail.gmail.com>
Message-ID: <CAJNNDmn1OBzRouNUcAmWSfj4piSHRFfc6V6gvb2D+2qYO1Ob7g@mail.gmail.com>
Subject: Re: [PATCH] HID: ghlive: support for ghlive ps3/wii u dongles
To:     Jiri Kosina <jikos@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH] HID: ghlive: support for ghlive ps3/wii u dongles
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Pascal Giard <pascal.giard@etsmtl.ca>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [142.137.250.50]
X-ClientProxiedBy: FacteurA.ad.etsmtl.ca (10.162.28.14) To
 FacteurB.ad.etsmtl.ca (10.162.28.15)
X-Barracuda-Connect: relais.etsmtl.ca[142.137.1.25]
X-Barracuda-Start-Time: 1603996554
X-Barracuda-Encrypted: ECDHE-RSA-AES256-GCM-SHA384
X-Barracuda-URL: https://antispam.etsmtl.ca:8100/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at etsmtl.ca
X-Barracuda-Scan-Msg-Size: 3491
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.2404 1.0000 -0.6219
X-Barracuda-Spam-Score: -0.62
X-Barracuda-Spam-Status: No, SCORE=-0.62 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=3.2 KILL_LEVEL=5.2 tests=INFO_TLD
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.85530
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.00 INFO_TLD               URI: Contains an URL in the INFO top-level domain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 29, 2020 at 11:26 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 8 Oct 2020, Pascal Giard wrote:
>
> > This commit introduces the Guitar Hero Live driver which adds support
> > for the PS3 and Wii U dongles.
>
> Pascal,
>
> thanks for the patch.
>

Dear Jiri,

thank you for reviewing my patch.

> [ ... snip ... ]
>
> > ---
> >  drivers/hid/Kconfig      |   6 ++
> >  drivers/hid/Makefile     |   1 +
> >  drivers/hid/hid-ghlive.c | 220 +++++++++++++++++++++++++++++++++++++++
>
> Would it make more sense (with respect to how we are structuring/naming
> the hid drivers) to incorporate this into hid-sony (irrespective of
> currently ongoing discussions about actually splitting that driver :) )?
>

I think it would be most appropriate, yes.

Note that there are 3 other dongles out there:
- the xbox360 dongle does not need any special treatment, it just
works with hid-generic;
- the ps4 dongle obviously makes sense to go into hid-sony (although
no one has reversed engineered that one (yet));
- the xboxone dongle: that's an unknown one to me. I don't have any
information about that one unfortunately and do not own one.

I wrote this as a separate hid driver as I saw that email [1] from
Roderick Colenbrander in which he expressed a preference for a
seperate driver in cases where the device is not from Sony proper.

> > +static void ghl_magic_poke(struct timer_list *t)
> > +{
> > +     struct ghlive_sc *sc = from_timer(sc, t, poke_timer);
> > +
> > +     int ret;
> > +     unsigned int pipe;
> > +     struct urb *urb;
> > +     struct usb_ctrlrequest *cr;
> > +     const u16 poke_size =
> > +             ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > +     u8 *databuf;
> > +
> > +     pipe = usb_sndctrlpipe(sc->usbdev, 0);
> > +
> > +     cr = kzalloc(sizeof(*cr), GFP_ATOMIC);
> > +     if (!cr)
> > +             goto resched;
> > +
> > +     databuf = kzalloc(poke_size, GFP_ATOMIC);
> > +     if (!databuf) {
> > +             kfree(cr);
> > +             goto resched;
> > +     }
> > +
> > +     urb = usb_alloc_urb(0, GFP_ATOMIC);
> > +     if (!urb) {
> > +             kfree(databuf);
> > +             kfree(cr);
> > +             goto resched;
>
>
> So if one of the allocations above succeeds and a subsequent one fails,
> you're going to try re-allocate all of them next time again, leaking the
> ones that previously succeeded, right?
>

I attempted to avoid such a case. IIUC there are 4 possible scenarios
tied to those 3 allocs (cr, databuf, and urb):
1) alloc of cr fails. nothing to be freed, we reschedule;
2) alloc of cr succeeds, alloc of databuf fails. we free cr and we reschedule;
3) allocs of cr and databuf succeed, alloc of urb fails. we free cr
and databuf, and we reschedule;
4) all allocs succeed, we submit the urb, and free urb. once the
control packet is sent, the callback is called and we free cr and
databuf.

Am I missing something? It's VERY possible that I am as this is my
first patch and I wrote this by looking at other peoples' code. The
only thing that comes to mind is if poke is called again before the
control packet actually gets sent (and the callback called), in which
case I'm not sure what would happen. But with a poke interval of 10
seconds, is that probability close enough to 0 to be ignored?

Thanks again for your valuable input, :-)

-Pascal
[1] https://marc.info/?l=linux-input&m=157273970001101&w=2
