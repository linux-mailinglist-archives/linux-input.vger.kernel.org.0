Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA5027F2C1
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 21:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgI3Tz7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 15:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28542 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725355AbgI3Tz6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 15:55:58 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601495756;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6u2R6NTvaJg7sMgc69KzwgORrXhbuyN6z6cFWEnnYP8=;
        b=Yj9D7blhcWFsZ8Vx3vXfP28hbDsnMw+QTAsPROc+lKpB3ayzZBgYFN+vhBs+3BMPxN4CPj
        IEv5V5wPkqzS1kQoMTaaImNR07SsNzp/P1JMBnu9Ojr+JXnmsCUT75TH4A5PLCOyXem1ju
        A955B1RprJ27KIaWPepXaBk8nUrXxZ8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-emDSx8HWO0C9cCXBtr03PA-1; Wed, 30 Sep 2020 15:55:55 -0400
X-MC-Unique: emDSx8HWO0C9cCXBtr03PA-1
Received: by mail-qk1-f200.google.com with SMTP id 196so1628043qkn.6
        for <linux-input@vger.kernel.org>; Wed, 30 Sep 2020 12:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=6u2R6NTvaJg7sMgc69KzwgORrXhbuyN6z6cFWEnnYP8=;
        b=NEktvvahVPmLkpo8BmGme2JJSXPiT6opfYV5crm6gz4m0Jxt9RDDvnrU2DTLRDVGlu
         cphVR7rABES+ivR2efk2AajZYmxLwsrjOv67UyF3ea7wVNDIRBjh0zS9EowM3yr++MD9
         W9LeZnpqPJ6VTIJo6vS/Kp0uc1kTO+7+G0y4DzUWDcz+OPK4f9qs2MKGe0HxxrUfw1qL
         6Nl5R0rENt8q9VoavJOAbwrVW6/SRL7jz/j5wekZvJlV8f2h12bzIO+OM5+TAYAPAm3B
         DdkJyROOS9yKP1sHvADNLoUTBwx9H7XlPU1L7JMKuev58WPOR5VwWBsnl36aXGd+BkTu
         WwRg==
X-Gm-Message-State: AOAM531lNUoSC3EzWuDMtiDSw1DFvgzPfEvAiVHliYTAOYzgRMU2oqNH
        xpg9uagTMBEUfcBQP10AzHVZ1B8RdNO36Uk1g9+ZJXS4yQs2/TaXkh/K0RgXkYg6R+AUhgVI7Xv
        eVTQ0+80Q/yEhX+VwqkfoVLU=
X-Received: by 2002:ac8:4d01:: with SMTP id w1mr4154282qtv.357.1601495754567;
        Wed, 30 Sep 2020 12:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMyZztN8712AjDf070emZz8pOm5vbMdoSpYnH9dJNe/sjDo1KYtZKtLCL0ceYIDKOoNzjk/A==
X-Received: by 2002:ac8:4d01:: with SMTP id w1mr4154259qtv.357.1601495754315;
        Wed, 30 Sep 2020 12:55:54 -0700 (PDT)
Received: from Whitewolf.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id q3sm3138806qkq.132.2020.09.30.12.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 12:55:53 -0700 (PDT)
Message-ID: <1f233aeab705d9dae33c0d3fc910a94420ddb5a7.camel@redhat.com>
Subject: Re: [PATCH v2] Input: synaptics - enable InterTouch for ThinkPad
 X1E/P1 2nd gen
From:   Lyude Paul <lyude@redhat.com>
Reply-To: lyude@redhat.com
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Date:   Wed, 30 Sep 2020 15:55:52 -0400
In-Reply-To: <CAHmME9rY6RkJ7JHN=-=e=QaN=FZtqbhMJ8NqTwBtwDCw7K1bEA@mail.gmail.com>
References: <CAHmME9pqrEW5CQbdSm6ckvB0b81ZBZ77CJC45BOqpiuZcgRnXQ@mail.gmail.com>
         <20200930112437.13705-1-Jason@zx2c4.com>
         <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
         <CAHmME9rY6RkJ7JHN=-=e=QaN=FZtqbhMJ8NqTwBtwDCw7K1bEA@mail.gmail.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-09-30 at 18:18 +0200, Jason A. Donenfeld wrote:
> On Wed, Sep 30, 2020 at 6:05 PM Lyude Paul <lyude@redhat.com> wrote:
> > Maybe correct the comment in smbus_pnp_ids to reflect this handles both the
> > X1
> > Extreme and P2 2nd Gen. Then I'd probably split the bootloader change into a
> > commit that comes before adding the new PnP IDs.
> 
> Okay, I'll submit a v3.
> 
> One thing I should note is that the sensitivity sysfs entry doesn't
> seem to do anything at all. push_to_click works, but not sensitivity.
> I don't know if this has bitrotted over the years and I shouldn't
> expect it to work, as it rarely does or something, but thought I
> should mention this.

Interesting-it's entirely possible that maybe the firmware on this trackpoint is
different from the previous ones (only mention this possibility since it looks
like at some point in time they switched over from using the legitimate IBM
trackpoint modules to getting other manufacturers to make them). I know the
sensitivity setting works on my laptop with PS/2 through RMI4 though.

Could you maybe enable rmi4 debugging by passing rmi_core.debug_flags=0xff when
you boot your machine and get me the dmesg output from that after you've tried
changing the sensitivity value? Not sure I could fix it, but it'd be interesting
to see what's happening on the ps/2 side here
> 
> Jason
> 
> > Otherwise though:
> > 
> > Acked-by: Lyude Paul <lyude@redhat.com>
> > 
> > Let's see what the folks from synaptics say
> > 
> > On Wed, 2020-09-30 at 13:24 +0200, Jason A. Donenfeld wrote:
> > > With the new RMI4 F3A support posted yesterday, this appears to maybe
> > > work, but requires us to add support for the newer bootloader, which
> > > this commit does.
> > > 
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > ---
> > >  drivers/input/mouse/synaptics.c | 1 +
> > >  drivers/input/rmi4/rmi_f34v7.c  | 7 +++++--
> > >  2 files changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/input/mouse/synaptics.c
> > > b/drivers/input/mouse/synaptics.c
> > > index 8a54efd6eb95..9d6fec84047b 100644
> > > --- a/drivers/input/mouse/synaptics.c
> > > +++ b/drivers/input/mouse/synaptics.c
> > > @@ -180,6 +180,7 @@ static const char * const smbus_pnp_ids[] = {
> > >       "LEN0096", /* X280 */
> > >       "LEN0097", /* X280 -> ALPS trackpoint */
> > >       "LEN0099", /* X1 Extreme 1st */
> > > +     "LEN0402", /* X1 Extreme 2nd */
> > >       "LEN009b", /* T580 */
> > >       "LEN200f", /* T450s */
> > >       "LEN2044", /* L470  */
> > > diff --git a/drivers/input/rmi4/rmi_f34v7.c
> > > b/drivers/input/rmi4/rmi_f34v7.c
> > > index 74f7c6f214ff..8cfaa2f19ed5 100644
> > > --- a/drivers/input/rmi4/rmi_f34v7.c
> > > +++ b/drivers/input/rmi4/rmi_f34v7.c
> > > @@ -1364,9 +1364,12 @@ int rmi_f34v7_probe(struct f34_data *f34)
> > >               f34->bl_version = 6;
> > >       } else if (f34->bootloader_id[1] == 7) {
> > >               f34->bl_version = 7;
> > > +     } else if (f34->bootloader_id[1] == 8) {
> > > +             f34->bl_version = 8;
> > >       } else {
> > > -             dev_err(&f34->fn->dev, "%s: Unrecognized bootloader
> > > version\n",
> > > -                             __func__);
> > > +             dev_err(&f34->fn->dev, "%s: Unrecognized bootloader version:
> > > %d (%c) %d (%c)\n",
> > > +                             __func__, f34->bootloader_id[0], f34-
> > > > bootloader_id[0],
> > > +                             f34->bootloader_id[1], f34-
> > > >bootloader_id[1]);
> > >               return -EINVAL;
> > >       }
> > > 
> > --
> > Cheers,
> >         Lyude Paul (she/her)
> >         Software Engineer at Red Hat
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

