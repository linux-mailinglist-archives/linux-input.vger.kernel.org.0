Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63602AF1EE
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 14:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgKKNVO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 08:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgKKNVN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 08:21:13 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68ED1C0613D4
        for <linux-input@vger.kernel.org>; Wed, 11 Nov 2020 05:21:13 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id 7so1230856qtp.1
        for <linux-input@vger.kernel.org>; Wed, 11 Nov 2020 05:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=NlADkPeF/YZcmq6MXZpZOGFEMPUEHqqqbsTG2vEoP8g=;
        b=h6LMNerpgdJy4MB7Bei3GC+QiC9oJnWc/M4vBTWRLEBQFErKytWoJzbsk0rThbAhDy
         eE4UH6zjGPoNwRdRZJz1AAdvWMG8CzhXGb/7UaUrI4NJzUZyCy2beMOFh4zf7tGpQH4d
         cbj1CgZNvU3/0I3RxLu5vH/oMrNXvyIwlIQ9mY+ynt1Bjps10EUh9AUvJiCIBdSqeXLO
         DOJaQzM6M8rRMqJerHFQbexHksJZLR26gk8DYRCc9mJIR67lezN/rUCEsWlmvP/3WTrE
         m9gOkow9UKDZQVZNfvasHpoj91qJfDrP57kdC4W+C0u3qYnJfoZWaAeQLHfKXbLV0Iiz
         kJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NlADkPeF/YZcmq6MXZpZOGFEMPUEHqqqbsTG2vEoP8g=;
        b=PXBgufecJ7azaVUuXBrHZl3+fXp1W7PwpOO41ymaXuHtrYiAQRerpp+TZagcXA3CMO
         Bxk5XCdGwLCNd0JeSxVVkhuvkEQrlnr8NDZj4mwITGTCEqadOVB2SRNTtFXPzqKo/Xua
         KiZPgKan8Eg9YNE/AkIFBKTSJEbq5ykr95JnIIu5kCbbF1HI7R6IiT8ZTdUE5V5V72IC
         wyGom2ACWrxpjTPClQvHDGfXmrcsjDOxG3b5e7XREubYUDf19GjchQI/Vl5B4J4kqo7b
         MPKiD65qRHbUIkHsdaf1IsAQAjA7afLaZB63E4dVvAfTI9DuN20oOOqotFo2zlZe9TOF
         TBjA==
X-Gm-Message-State: AOAM533qQZaZhdD/fSa+aXIGxpDTvJs9rOO5FlFZRGz0Lt0zimGqe49r
        p48Kl3ldLfQNfKyE2VNA7cJgnceC6Q/lsvMY1Jsxqw==
X-Google-Smtp-Source: ABdhPJxcBEyPj+tDuFDmcKoMZziKSY9uwj771yemIf0qMp4iKQ2BGE5dQb4+/QfRpqpaTLdU73nN5VjbkIm23x9cGDM=
X-Received: by 2002:aed:2b47:: with SMTP id p65mr22002545qtd.337.1605100872289;
 Wed, 11 Nov 2020 05:21:12 -0800 (PST)
MIME-Version: 1.0
References: <000000000000ce8d2305a03b0988@google.com> <0000000000006a67f005b117a94a@google.com>
In-Reply-To: <0000000000006a67f005b117a94a@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 11 Nov 2020 14:21:01 +0100
Message-ID: <CACT4Y+aqGaM8cGJzqDML8XY49BLr+fa0e9zqKv246s5qmPfyzg@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in uhid_char_release
To:     syzbot <syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 7, 2020 at 7:01 PM syzbot
<syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit bce1305c0ece3dc549663605e567655dd701752c
> Author: Marc Zyngier <maz@kernel.org>
> Date:   Sat Aug 29 11:26:01 2020 +0000
>
>     HID: core: Correctly handle ReportSize being zero
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d19370500000
> start commit:   1127b219 Merge tag 'fallthrough-fixes-5.9-rc3' of git://gi..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=891ca5711a9f1650
> dashboard link: https://syzkaller.appspot.com/bug?extid=8357fbef0d7bb602de45
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=102c472e900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13081056900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: HID: core: Correctly handle ReportSize being zero
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: HID: core: Correctly handle ReportSize being zero
