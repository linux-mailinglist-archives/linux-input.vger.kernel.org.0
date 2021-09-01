Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448683FE3F3
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 22:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhIAUZp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 16:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhIAUZp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 16:25:45 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2B0C061575;
        Wed,  1 Sep 2021 13:24:48 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id f15so1116398ybg.3;
        Wed, 01 Sep 2021 13:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vYOiNPUtqV6gWrwDxZ1hlnrsiI6uPgU2OjLHJTwlE3U=;
        b=lf5Cmj3o8ckBPOz8vQB+RDSCM2fJA0K+UkPPqTB94lBjIr/O9OUqHyMgjfb3M5Avvp
         edqJuAVDsw9aIw6TJrwttH/GVMglizZ0G4FqUfFKewBUE5TMKdqx9iNpt5jcnic2yQcw
         ByfklQz7JpACmVJXmnnoe8Xy6JCC+Ujv5EZlbWeUidVq4kQFaop9llWGNY4XxgZlTTBj
         RBWwvjyorCZLK7Ryw+6x9iMB4ncjfb4ey6NYOsqBkWSrythF4SZDxmZXqz/zVmxFGVoT
         CjNPS36GfInR+aXVTYrslbQlCB+2472IGz7G9FJneFdhA+r1xl7qrz+qSTFEw229jOZr
         BukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vYOiNPUtqV6gWrwDxZ1hlnrsiI6uPgU2OjLHJTwlE3U=;
        b=i+G/TMXPwxMicslJQXkdvbYr2hM1hRdQm3IXrhJGk0VBCwghqk4G/6UV1ih2DGMu7G
         kWbtVTT3Np6zs/hchiWDGrqFRwac+aLlvc88ZU/ULAkQznAYImCXArxdOorbdWcZ1CU4
         AJsq4kOQQzVyEzZdf4jUEBzS2v9oeksCDMnQvMSAEm90hUtFyK6ZTAWnusbCNbNwL4SQ
         IOLivuh3oNrhwcUejnI+eC/4+AX72cweNDN6puIeNS/A7E1KRJ7PjdVhlXq9QFC9jdky
         6W+GUeYyHRg5zDVcMXNZxil7igiFmH87naLeO+Lh4xeNnNDQhuB+8vksmCwSbLf8KCky
         9Phw==
X-Gm-Message-State: AOAM5301419Ds5YiCxOO+O0X653uSa/dVMn/WXFr+YkSbLrzdV1VwGbL
        kD3nV8g2Oy7EdOq8PH5lOQX7xNZzUoyIVHjoAps=
X-Google-Smtp-Source: ABdhPJy+t5mga7ti8MlVsTjeXZuU8WCsKqDeQxi4jxTQb07eNjfDIOXGRKQ+hUiY5t1iHuNkNbHm+qEbFg0jByGi4us=
X-Received: by 2002:a25:c2c3:: with SMTP id s186mr1648024ybf.401.1630527887357;
 Wed, 01 Sep 2021 13:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210602061253.5747-1-roderick@gaikai.com> <20210602061253.5747-3-roderick@gaikai.com>
 <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm> <20210803221055.GA32527@amd>
 <CAEc3jaAoDfJD92q9q_HoFq3nsjkDqfZHu-VO+Ei8xSP8QrE8rg@mail.gmail.com>
 <CAEVj2tkfLjWKOaecY7t-idGaqjZ45wXhmjbUR87AoC2Dkm45vQ@mail.gmail.com>
 <nycvar.YFH.7.76.2108312109340.15313@cbobk.fhfr.pm> <20210901051938.GA6870@amd>
In-Reply-To: <20210901051938.GA6870@amd>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Wed, 1 Sep 2021 13:24:34 -0700
Message-ID: <CAEc3jaCFVpq=0t2CFY049ey+gniAQyZQ6f-mAXCwDT2dvhoBJw@mail.gmail.com>
Subject: Re: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs for
 game controllers.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Daniel Ogorchock <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pavel,

On Tue, Aug 31, 2021 at 10:19 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > Do you have any recommendations on what would be an appropriate
> > > function string for player indicator LEDs? Would some variant such as:
> > >   "status-x"
> > >   "player-status-x"
> > >   "indicator-x"
> > >   "player-indicator-x"
> > > be more suitable? It looks like the string "status" has been used for
> > > other existing LED names.
>
> I guess "player-x" would be suitable.
>
> > > I think we are pretty happy to use whatever naming scheme fits the
> > > standards of the led subsystem's userspace api for the Nintendo/Sony
> > > HID drivers, and any future game controller drivers featuring player
> > > LEDs could conform to that going forward.
> >
> > Pavel, could you please take a look here, so that we can proceed with the
> > patchset?
>
> So... leds tree has just been merged:
>
> > git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
> tags/leds-5.15-rc1
>
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/a998a62be9cdb509491731ffe81575aa09943a32
>
> It includes Documentation/leds/well-known-leds.txt file. Could a
> section describing proposed naming be added there (both device and
> function), with explanations what the LEDs do?
>

Sure let me write add a few lines for that file and resubmit. I guess
I should rebase based on Linus his tree then.. let me quickly start on
that. (I'm technically on vacation and far from home, but luckily
caught this and happen to have a break)

Thanks,
Roderick
