Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FA548A053
	for <lists+linux-input@lfdr.de>; Mon, 10 Jan 2022 20:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243916AbiAJTnm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jan 2022 14:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243901AbiAJTnl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jan 2022 14:43:41 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1F3C06173F
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 11:43:41 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id h14so23598239ybe.12
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 11:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X2dnMaSPm1/hrPmLaDD1dj1OeTbJ27Jl8UOYXE3SKtc=;
        b=OSGPICFJzBcK1PZq2UF9ay3eiacphngX07hotZEAPNwswjmKvGD9pSTJfxSWXZUwRU
         8wG7yiD2ANuvRe54SnhFY8FVqZXViSWIxxckY8qwF9yWkPxtZ9c29jvr0zLcXmhojbY6
         C9BzsvO2/I3V7+DYLqM0KaY/UwwUDb20QfrLFr2qwK5/P5zyKitNvyDfuGG/agtQtB8t
         YNo159PMmQ8HK5Zapa7ZasxMOgzfiFMI6CkLFz59Dv2NNQtfoCbfk/gj/COP0cioBdU1
         zvZqASgW1THP22TdIeDNoG2ld2sfKkY7aA23zvT27CfV+F9TwJBq11YrebAFHhtBb7hT
         eaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X2dnMaSPm1/hrPmLaDD1dj1OeTbJ27Jl8UOYXE3SKtc=;
        b=eb7Zsx9+ptyjrWpVMS+0sYmJDs7E8Je34Py1BrVMhtY0hHDANYOBgU2ZXFTOZl2z2r
         7Ym02f+Kz5qrAcw9kzy2hxNJ/30rV2oc7/UFK6BmFV0xCSBQWZCUF0+gDLpEb/4NTpSt
         7ud2JnZgVqI0HakL1iSsz0QIvYpXN4Dhu4R+ACDhuIXlj9hU2ZdL3ZuxgtTeujOvlKEt
         FrrizzzuMkXzWTD6geXhNYh49hDTmppG6zkMJWuB8dSfVNQ5lFwV06AvE5wlUIszjKk7
         aMOAdWEWYy+BpobL1doc1FDeCd/ka4HhWfEKYvWPSTcisSC75DyQ7zQwi9KgcdnhHy+4
         ImKw==
X-Gm-Message-State: AOAM532exgEAev4K5K2Qx098qzr0W/H9NJknPtimEoFBhJ45XJ4N3jA1
        cey7pBQXwQf65yRk8OLT3jeZVDzJIgnAoLVdVZFmOtd3NUY=
X-Google-Smtp-Source: ABdhPJwVxnJstfz7saqnGve1iNbPTgCIhEuXPVLb+3ohCol/0NHgJvwQL2StBvnGmEyH+Mn+3jPS7+YDORQb/yfjiOI=
X-Received: by 2002:a25:dfce:: with SMTP id w197mr1517064ybg.678.1641843820797;
 Mon, 10 Jan 2022 11:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-14-acz@semihalf.com>
 <Ydi4/xYdgTv9Umqh@google.com>
In-Reply-To: <Ydi4/xYdgTv9Umqh@google.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Mon, 10 Jan 2022 20:43:28 +0100
Message-ID: <CAB4aORUgGcPCLZ8iWAorCPbW53Q7c-YiDC4qau-w7G9sYjCvfg@mail.gmail.com>
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Fri, Jan 7, 2022 at 11:07 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Angela,
>
> On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> > Add a function to switch off ABS_PRESSURE generation if necessary.
> > This may be helpful in case drivers want to generate ABS_PRESSURE events
> > themselves from ABS_MT_PRESSURE.
>
> This needs better explanation for why it is needed. I assume this is to
> use ABS_PRESSURE to report "true force" for devices. If this is correct
> then I believe we should define a new flag for input_mt_init_slots()
> and check it here and also use it to calculate the force across contacts
> in input_mt_sync_frame().
>
> Or did I misunderstand the point?
>
I would say you understood it correctly, though to my mind it is not a
static behaviour,
i.e. we may want to switch this kind of calculation on and off.
Are flags intended to be modified at runtime?
For instance, if user decides to remove the release or press effect (previously
uploaded by them) and there is no default one per device, then we should switch
the haptic handling from kernel mode back to device mode. Currently it
also means
that the driver stops generating ABS_PRESSURE events on its own and so
input-mt layer may/should be used again (i.e. mt report pointer emulation).
Anyhow, if it would be actually better to calculate the true force in
input_mt_sync_frame()/input_mt_report_pointer_emulation()
> Thanks.

>
> --
> Dmitry
