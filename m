Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7249BEF143
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 00:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbfKDXkm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 18:40:42 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:43230 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbfKDXkm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 18:40:42 -0500
Received: by mail-io1-f67.google.com with SMTP id c11so20490845iom.10;
        Mon, 04 Nov 2019 15:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+gtFDV+OpfwB0979knGRFYbNMfIw7O9jwwSuGq5+Zgs=;
        b=E7+DxgcyNVeFNVm9wYzr0ifdeLJ0jma+zZfBL808bD6j1A6qAJIgWcrMMhztO4TtLz
         5CZlM3kddrgAjiQjbO20gdwNZMPaxq+XFcJQa35vdtC05LIRl0iKbQffbczGy7vLwzCH
         vRLk3ISuZ46Zg3PksFT6HcxFiZEjRP8fpITChDIplBOxdQmCMN0pkeT1ilLrqpfC3lp0
         kmMwSnJXjwfhp8/CZtnFFwZkwzdLWlvoFZSTyYegCCFM99jq74OraA5VYkE3M1vGU8+l
         laaB1C1uUZl7kxzvIBlDQRg/7LBoO7meipORauv+K+C+rTKEOEBvNONZzU5Pj1nciBzi
         japg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+gtFDV+OpfwB0979knGRFYbNMfIw7O9jwwSuGq5+Zgs=;
        b=TKJM42KG8ja3Q/XcsKW5TFvq26BGffn3SOD0H/MBx7Tus3awfnVRy5wxjK6if7/EcN
         RcYoEAkEib8lIsHxCN3pn1zwZVMcasA+37cSawF/88b8m8pC2anc+oBWBiKH8/sivNmV
         uJYjnhpqtSpJP9JehdU85CedBICQiAmLvWgvuZatORy3XhceAmFtw5QDz8V8CMYPmchj
         Dqv4uVpE6w7Jy/suR2eX8ZxsQ8dud46Bcev8Pr8xVCfqE7F+cC7MA6K0d0IBmLn7Pxv6
         DqhYbsUeS3JgQ9UhKN/Sw8nj24kP/KY7ek54piMyMbRbhkvE0GIWJ3q4CJxs4pHEnTcU
         9pyw==
X-Gm-Message-State: APjAAAXlA+SO73d05AgBU5SeqgaQgsbb/l9yqXRhkUcxwF21sRqbdlDs
        I0C6ups0E/KUr4hJmcGmemgJq7pMnNbA8gFHFJI21Q==
X-Google-Smtp-Source: APXvYqxNSg/frjj6xHig5pnaf8JfCzeOaOBnqbSPp61Bf33M4W13Qld8bOjXR1x4ZZKAyJTG+AqWlMXa2kY5oJc/EtM=
X-Received: by 2002:a6b:6f16:: with SMTP id k22mr11789259ioc.205.1572910839803;
 Mon, 04 Nov 2019 15:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com> <20191104233621.GP57214@dtor-ws>
In-Reply-To: <20191104233621.GP57214@dtor-ws>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 4 Nov 2019 17:40:28 -0600
Message-ID: <CAHCN7x+=_FM32JTEKAb=5pPJNvim88cUFuEXgdGhMG9gdr0Emg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 5:36 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Nov 04, 2019 at 05:25:23PM -0600, Adam Ford wrote:
> > On Mon, Nov 4, 2019 at 3:43 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> > >
> > > Hi Adam,
> > >
> > > On Mon, Nov 4, 2019 at 4:28 PM Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > I am using IRQ_TYPE_EDGE_RISING for the 2117A.  Is that correct?  For
> > > > my touchscreen, the IRQ line is low until a touch is detected, so I
> > > > assume we want to capure on the rising edge.
> > >
> > > That is correct for the 2117A, as far as I know. I am using the same
> > > setting.
> > >
> > > >
> > > > Regarding Dmitry's patch,
> > > > Is it a good idea to use msleep in an IRQ?  It seems like using the
> > > > schedule_delayed_work() call seems like it will get in and get out of
> > > > the ISR faster.
> > > >
> > > > If we use msleep and scan again, isn't it possible to starve other processes?
> > >
> > > I believe using msleep() is ok because this is not a "real" interrupt handler,
> > > but a threaded one. It runs in a regular kernel thread, with its interrupt
> > > turned off (but all other interrupts remain enabled). Its interrupt is
> > > re-enabled automatically after the threaded handler returns.
> > >
> > > See
> > > https://elixir.bootlin.com/linux/latest/source/include/linux/interrupt.h#L50
> > >
> > > > > @@ -268,7 +278,7 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
> > > > >                 }
> > > > >
> > > > >                 touch = ili210x_report_events(priv, touchdata);
> > > > > -               keep_polling = touch || chip->continue_polling(touchdata);
> > > > > +               keep_polling = chip->continue_polling(touchdata, touch);
> > > > >                 if (keep_polling)
> > > >
> > > > Why not just check the value of touch instead of invoking the function
> > > > pointer which takes the value of touch in as a parameter?
> > > >
> > >
> > > The value of touch must be checked inside the callback, because
> > > some variants use it to decide if they should poll again, and
> > > some do not, such as the ili211x.
> >
> > That makes sense.
> > >
> > > If I have misinterpreted your suggestion, could you perhaps
> > > express it in C, so I can understand better?
> >
> > You explained it.
> > I'm good.
>
> OK, I refreshed the branch with fixes and a couple of new patches. It is
> on top of 5.3 now. If this works for you guys I will be merging it for
> 5.5.

I will test it tomorrow on a 2117a and reply with results.  I am very
excited to see this integrated.

adam
>
> Thanks.
>
> --
> Dmitry
