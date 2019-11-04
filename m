Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E676EF129
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 00:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729035AbfKDXZi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 18:25:38 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:46362 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbfKDXZi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 18:25:38 -0500
Received: by mail-il1-f194.google.com with SMTP id m16so16419898iln.13;
        Mon, 04 Nov 2019 15:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DKKd/VVOtZuRXftSRlB1c/gps6yTMEe9I9zF6w00nQk=;
        b=MpBo834oVRGxQDcEBSGplBlQ8zHMrwASct+FAlsJU7KSb8wB86sCY/q35fjS3462Ah
         4Pxtkm6zYdX43kOvDdx31ivzG38fLzH2PfkULwBiYwzf/4bXLsMCA/GGWRR1FYVKq/pu
         OIBxqklvmHI/CSIeDFCKOmSBBDbSvVyGYW6MneBkSf84JDtxEiMPZX9GZeqDWbxHFXnX
         +5QV/HHDnV0u/Ow+9sp6YBTZ8GqCtG9nGjJF01cO9iKwo8HFSqu39l6JeE/Y9n7+Nq89
         8vAmjXyyCmebedWGnlwje+8NKMSweldNHQsdZGxGjRHS4hQblMUsKepRJpd3ck85TYdy
         vwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKKd/VVOtZuRXftSRlB1c/gps6yTMEe9I9zF6w00nQk=;
        b=nK4xYuxwbzr4ogmbAWCvCvh3uYnBrvMJO2NLhO1C7mXAtxHPOA49Ar4tT6Ct/cpkpC
         W+dmg/BcXOqBdD5FbA8829O2KJ63Msf8eT/oB1lC4OaGalFqsbPWrfYgIu9Lh7Pt7oTt
         B/ap4EKFogqCIuz57fOU4oQmte5jY8BAzj+xqAP4Pu+FnycTFLV0pp2mjOURZkZamj0X
         fXj50lP0kbE8Ve/VkjepRe6wM+h1aEu3UrO+CcGKypM70S93KU4ewHCz3kVRWDiWKjwZ
         Ujsm+5LyVg+FIXWeUYtTBlzRnS3m+7tXrCOuKUX7FNTm6NCagGJSOkkJ5/2bRL7lnxzf
         yidQ==
X-Gm-Message-State: APjAAAWdka6ZIN/2y+ZyPwfSkZrGpoclpcB3omyeOWrv/nSs3ySvg6M9
        JhB1jjpuMUhgihh+GhfBfSNQ3gLCksgbkFDKr8o=
X-Google-Smtp-Source: APXvYqxfZ9QYVP30ka78WJXyiRcwbJElqvNzVLyv7+vyUnZuZv4v03SE/c1PmYMQ8EvYD117rtrv+SrCyg64kLeaCY0=
X-Received: by 2002:a92:cb84:: with SMTP id z4mr32745648ilo.78.1572909935500;
 Mon, 04 Nov 2019 15:25:35 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com> <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
In-Reply-To: <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 4 Nov 2019 17:25:23 -0600
Message-ID: <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 3:43 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> Hi Adam,
>
> On Mon, Nov 4, 2019 at 4:28 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > I am using IRQ_TYPE_EDGE_RISING for the 2117A.  Is that correct?  For
> > my touchscreen, the IRQ line is low until a touch is detected, so I
> > assume we want to capure on the rising edge.
>
> That is correct for the 2117A, as far as I know. I am using the same
> setting.
>
> >
> > Regarding Dmitry's patch,
> > Is it a good idea to use msleep in an IRQ?  It seems like using the
> > schedule_delayed_work() call seems like it will get in and get out of
> > the ISR faster.
> >
> > If we use msleep and scan again, isn't it possible to starve other processes?
>
> I believe using msleep() is ok because this is not a "real" interrupt handler,
> but a threaded one. It runs in a regular kernel thread, with its interrupt
> turned off (but all other interrupts remain enabled). Its interrupt is
> re-enabled automatically after the threaded handler returns.
>
> See
> https://elixir.bootlin.com/linux/latest/source/include/linux/interrupt.h#L50
>
> > > @@ -268,7 +278,7 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
> > >                 }
> > >
> > >                 touch = ili210x_report_events(priv, touchdata);
> > > -               keep_polling = touch || chip->continue_polling(touchdata);
> > > +               keep_polling = chip->continue_polling(touchdata, touch);
> > >                 if (keep_polling)
> >
> > Why not just check the value of touch instead of invoking the function
> > pointer which takes the value of touch in as a parameter?
> >
>
> The value of touch must be checked inside the callback, because
> some variants use it to decide if they should poll again, and
> some do not, such as the ili211x.

That makes sense.
>
> If I have misinterpreted your suggestion, could you perhaps
> express it in C, so I can understand better?

You explained it.
I'm good.

adam
