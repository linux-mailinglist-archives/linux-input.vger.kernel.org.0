Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0855039DEE8
	for <lists+linux-input@lfdr.de>; Mon,  7 Jun 2021 16:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhFGOi0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Jun 2021 10:38:26 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:42977 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhFGOiZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Jun 2021 10:38:25 -0400
Received: by mail-vs1-f43.google.com with SMTP id l25so9014179vsb.9;
        Mon, 07 Jun 2021 07:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIEuZnR+0pmXVTw7szVUo35cG2jdA3wDrXhvKfhXtfw=;
        b=MYWo4n5/V0cE9jW9vhsOU3soporjzpABamtmErooD//Rm9pABY9QRuI7ccOvF64cFF
         l6qWRUOBCP9w50lrRSdVzH6S4in16tWiAs4IE6OCXiXs2dydkE0pp39OeW0VclJTB27p
         A8Zf8ZMbSg2OMmhX7p1/NN58feXXnmlD2vEK3xjxGAINKrlVUKEnImIKDm67I1U0qRK7
         aXv3O41NsLKhicogVYeK9STnYCsIUCe7P+XeqRA273/lpJ9oWsaGsiGqIGnDA7kdxfjt
         jS+Ayds4+U4UDaGcjw5k4chDIjk+SqIFKbrzzEM0Kdn/iWuiIEEN3Id0V+p9V3rQOxZk
         Y4Cw==
X-Gm-Message-State: AOAM532AJK2Pq/F2cm3E4/eT8y3zqBbeVRCVy6NzAKFY7th5PPv1u3Ki
        4L35muQMYkE9zuK2a2SbC80aqAIJvTQ7Zzs6y3g=
X-Google-Smtp-Source: ABdhPJyAB7LObhZVr6DP0FIXQJk11mzn8e1kVEmnHMYa9jjp3/mzqxniD/pQfzoaiVG47ccHD0gA31WHIrO2gUawgA8=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr4961726vss.18.1623076594247;
 Mon, 07 Jun 2021 07:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210527001251.8529-1-rdunlap@infradead.org> <CAMuHMdWxBDM6za4_zPrkPGja8K6vy47gfdzYMNjJ-i1n1ySsHA@mail.gmail.com>
 <YLcF8k71w1mhN9OX@google.com>
In-Reply-To: <YLcF8k71w1mhN9OX@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Jun 2021 16:36:23 +0200
Message-ID: <CAMuHMdUYDHQB2gv9sfbB+xt_9H9EwaOLnycORVRctbqPJGJzvA@mail.gmail.com>
Subject: Re: [PATCH v2] MOUSE_ATARI: fix kconfig unmet dependency warning
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Wed, Jun 2, 2021 at 6:15 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, May 27, 2021 at 08:56:30AM +0200, Geert Uytterhoeven wrote:
> > On Thu, May 27, 2021 at 2:12 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > Since the code for ATARI_KBD_CORE does not use drivers/input/keyboard/
> > > code, just move ATARI_KBD_CORE to arch/m68k/Kconfig.machine to remove
> > > this dependency.
> > >
> > > Removes this kconfig warning:
> > >
> > > WARNING: unmet direct dependencies detected for ATARI_KBD_CORE
> > >   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n]
> > >   Selected by [y]:
> > >   - MOUSE_ATARI [=y] && !UML && INPUT [=y] && INPUT_MOUSE [=y] && ATARI [=y]
> > >
> > > Fixes: c04cb856e20a ("m68k: Atari keyboard and mouse support.")
> > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > Cc: Michael Schmitz <schmitz@debian.org>
> > > Cc: Roman Zippel <zippel@linux-m68k.org>
> > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: linux-input@vger.kernel.org
> > > Cc: linux-m68k@lists.linux-m68k.org
> > > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Suggested-by: Michael Schmitz <schmitzmic@gmail.com>
> >
> > > ---
> > > v2: move the symbol outside of INPUT_KEYBOARD (Geert) -- all the way
> > >     to Kconfig.machine (Michael). Thanks.
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > I'm willing to queue this in the m68k for-v5.14 branch, if Dmitry agrees.
>
> Sure, works for me.
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks,  queue in the m68k for-v5.14 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
