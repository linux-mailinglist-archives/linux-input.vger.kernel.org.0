Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10686433363
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 12:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhJSKVb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 06:21:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20510 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235194AbhJSKV2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 06:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634638756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3UCiU1m2/Or9tbTy9ejs6DjDkEIphuEh6VcvFeyaK/U=;
        b=U3gbw8+RxLvjnvI0wAeXuraWNT/CQvIU6jEAs6SfqlW44GAXuMRccClhxXKLK0vWwCZ6TE
        x6l4Tqmy8+J6/lPd79NMq2lcJrHAWXpRAV3h1Lt9Q/ywIgB8HHG0+//pom55sYciMHJO5/
        G1dHtJvYPEKoLJtD6m+utk21r6xYkLk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-LlDgjaCUN3GFrnUMQoxmNg-1; Tue, 19 Oct 2021 06:19:12 -0400
X-MC-Unique: LlDgjaCUN3GFrnUMQoxmNg-1
Received: by mail-pg1-f197.google.com with SMTP id z7-20020a63c047000000b0026b13e40309so11352442pgi.19
        for <linux-input@vger.kernel.org>; Tue, 19 Oct 2021 03:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3UCiU1m2/Or9tbTy9ejs6DjDkEIphuEh6VcvFeyaK/U=;
        b=RBK705jO+H6q3nTKqB2xSlz3keLpCO+1iMw8yhjDwji+rNbGPSZ8xxKSoxqZ33cwiv
         pcIpbC0YeB5IQ7RwPTe6eGzDdLSt4Mbs1V/GUZ2Zj0d/Pgbd88v2WNTWsY0ec0oEeCfL
         Tvw7UEuYm/e+2XyTOu62ra8lYFwp5md2KoWOQ4PJ1qCWcTnRCX+9ML2levwV/8TjxiYF
         70D9U4rVNy8Xo7heXZvlmmWtHyf4YQ5uqxrIyXmEl3rY+YaLpcqLI20ShWt+0a2UnSp2
         4uqlv+kEH8C73TictH7G/J7goy8FWxX7Vj8IU3t1P5oYAJbCWXLcE2dUJvACrvckf4TK
         K7bg==
X-Gm-Message-State: AOAM530DPstbkluUHbArAsb4n2f/YEvJ2LlieHaCyHkkZvHwRqGNFgGH
        O1qIdGeyUEjAW0J8SswCn6r3ynkCBhOqcFy5Uu7Tlw6Re9HaqQ0LFFUaM8DjkG/LOj4VOfP8iv6
        qYhlJb0oy3r2yzBD2TTNsngBS+Ta5j19jrkkQmsA=
X-Received: by 2002:a17:903:1c2:b0:13f:2893:de99 with SMTP id e2-20020a17090301c200b0013f2893de99mr32420446plh.80.1634638751859;
        Tue, 19 Oct 2021 03:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv/1CNbCv76lE+bm/1vh1c7gZXIt6Os9XqUtUrA5LwEZTeTbNIjhdi3p9ecoxoAgxAWLRxbLjWS0QdgfDBS+M=
X-Received: by 2002:a17:903:1c2:b0:13f:2893:de99 with SMTP id
 e2-20020a17090301c200b0013f2893de99mr32420411plh.80.1634638751433; Tue, 19
 Oct 2021 03:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210911173639.5688-1-djogorchock@gmail.com> <nycvar.YFH.7.76.2110191054080.12554@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2110191142160.12554@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2110191142160.12554@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 19 Oct 2021 12:19:00 +0200
Message-ID: <CAO-hwJLACSdEFxA+KDCUFKwU_=zM-j6=UDT4GD4b5PY9jW8rjQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/16] HID: nintendo
To:     Jiri Kosina <jikos@kernel.org>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Billy Laws <blaws05@gmail.com>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        carmueller@gmail.com,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 19, 2021 at 11:44 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 19 Oct 2021, Jiri Kosina wrote:
>
> > > Rebased onto Linus' tree (sha 926de8c4326c14fcf35f1de142019043597a4fac)
> > > Depends on Roderick's patch to add the player LED defines:
> > > https://patchwork.kernel.org/project/linux-input/patch/20210908165539.3102929-3-roderick.colenbrander@sony.com/
> >
> > I just got Ack for the joydev part from Dmitry.
> >
> > v16 is now queued in hid.git#for-5.16/nintendo
>
> Benjamin noticed that I pushed wrong version of the branch -- the one that
> still doesn't contain the LED_FUNCTION_PLAYER[1-5] defines, which I've had
> staged here locally, waiting for Pavel's Ack (which is taking time,
> unfortunately).
>
> So please ignore this branch for now, I'll push v2 once that situation is
> cleared out.
>
> CCing Pavel as well here to make him aware of the issues this is causing
> all over the place (see .e.g my mail [1] from yesterday).
>
> [1] https://lore.kernel.org/all/nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm/
>

I am also jumping on this to raise a concern I recently had with all
of the work we do for HID devices in the kernel regarding game
controllers.

Foreword: this is definitely not a NACK on the series, but more trying
to open a discussion to take a step back.

The SDL developers recently took a hard turn in how they are handling
game controllers on Linux: libsdl now directly talks to hidraw or
libusb to handle the controllers in user space, bypassing the kernel
processing.
Which means that a game working on a recent SDL release already has
the PS5 player LEDs ready for instance.

I think that part of this work was the integration of the steam client
database, which already supports a lot of fix ups for game
controllers.

So I am starting to wonder if we are not adding dead code in the
kernel, because both steam and SDL will disable the input handling of
the controllers when they open the hidraw node (IIRC about what was
done in this series).

I know that Android/Chrome is interested in having actual input nodes
created, but are they the sole users of those now?
What is the benefit of having game controllers in the kernel?

I am opening the discussion and we probably want to bring in the SDL
folks here too. But I'd like to have some sort of confirmation that
these series which are adding game controllers are not just adding
dead code.

Cheers,
Benjamin

