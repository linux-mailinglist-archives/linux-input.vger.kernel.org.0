Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BBE368561
	for <lists+linux-input@lfdr.de>; Thu, 22 Apr 2021 19:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237972AbhDVRBN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Apr 2021 13:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236664AbhDVRBM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Apr 2021 13:01:12 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE3DC061756
        for <linux-input@vger.kernel.org>; Thu, 22 Apr 2021 10:00:37 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id s4so6541001qtw.3
        for <linux-input@vger.kernel.org>; Thu, 22 Apr 2021 10:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4NFW06ZWVVvB3Pa4IKaIF3Oq2NHOUsU574bdpGJ5vzc=;
        b=OpC9Dhbyh8h4V7kjnqAizEKHlJNtpC0Cby476Sbc9g0vcFCI5skCnvPSB1BrJtVLrJ
         ZuVOWh0yZrkxX4UcOJdaR7evFPa7xdYQhoNKDsP3kG7CG/1kImjdw0h1fMAWE+tkRhfy
         kyCojuJA0ITYGXMAqoVaUd6GruNeAa9WzVUSlj8EwQ/rcCavHCGHkknTG9RodeTCwVKo
         tCiMTn61Xjg9HZ0k1c0pavO0o+jxJa4FUQ5ekmsgomFTEO8ja+BZrlpG7S4fqPJUcYHa
         GMY5we84Z0XWpudDD3/2tmq1IT30iGa6x00RQ2+upz2/UpziqUmzGSw1Ns4OobUzVbHG
         TqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4NFW06ZWVVvB3Pa4IKaIF3Oq2NHOUsU574bdpGJ5vzc=;
        b=CTiS6iWIyHPBG1JA3kM611yzfpSzEfNJCi2n2kTC38cZDhiqCkoTrmjZ+EpGi/5EHn
         2LgEUGZGLk3I3Z8ucCk4DoedRpM0j4GYDpsiiD7FoDqM6HpRg2HFSJEnpwqiAH6GmM6P
         Pa36GjUCSpsGVGPIkSJAzIf/Q/g+malvZHM3aju7pIjtH/ah8rZQ2P5kyfMlmVlA4WpK
         ngc534jHFCmKabbHSj6hanT43ZKJG46BlXIXT9t+KXS5xQkyHRSjmdpAlGlFl4MjoSea
         gceABo9grF8RKz59cuxaqjQi4o6Z2FcCAMk6YiXaUHv/DCHXd5mUinkX2DXx6VeFQCfg
         ll6A==
X-Gm-Message-State: AOAM531X6AD5hYFIIy17vH1FkYArtwccp1l1mHM1tlpul263LgFm65Ea
        rGowhxnEUW2YcwZCSm+KQsKG2C2VsI7P7ND2d0wrCQ==
X-Google-Smtp-Source: ABdhPJwwGBdAMahWWP4Of3diwBUUp2pJ8fWrcqtryzZ/+ILUO95ZkaAPMEURjdpqL2eJ1C0SEsVuwthhGpE09widbCs=
X-Received: by 2002:ac8:5c92:: with SMTP id r18mr4130674qta.66.1619110836355;
 Thu, 22 Apr 2021 10:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000301a4d05bfe14b8f@google.com> <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
 <CA+fCnZcWEuYeOx6-0LY+cqtGVbMx2OiyhEELErdfwaHGcUWHbQ@mail.gmail.com>
 <b8162e95-fb2e-51f6-9d9b-a4d64873876e@i-love.sakura.ne.jp>
 <abcb019f-a78a-3c6d-e199-719176a394d6@i-love.sakura.ne.jp>
 <CACT4Y+ZvidVY5R4XqqW=b_j1Lbe2DnoKM2bPLgB4mS-CW10g1w@mail.gmail.com> <d829f5a8-95ba-1a17-c36a-21e23d382875@i-love.sakura.ne.jp>
In-Reply-To: <d829f5a8-95ba-1a17-c36a-21e23d382875@i-love.sakura.ne.jp>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 22 Apr 2021 19:00:25 +0200
Message-ID: <CACT4Y+aJ510rkgq6Y3A7KK53P+1N0nPyRJ=+hZg5MYyicV4xgg@mail.gmail.com>
Subject: Re: [syzbot] unexpected kernel reboot (4)
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Andrey Konovalov <andreyknvl@gmail.com>,
        syzbot <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 22, 2021 at 6:13 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2021/04/22 23:20, Dmitry Vyukov wrote:
> > I've prepared this syzkaller change:
> > https://github.com/google/syzkaller/pull/2550/files
>
> OK. Please merge and let's see whether syzkaller can find different ways.

Merge. Thanks for digging into this.

> In my environment, this problem behaves very puzzling. While the reproducer
> I use is single threaded, changing timing via CONFIG_DEBUG_KOBJECT=y or
> even https://syzkaller.appspot.com/x/patch.diff?x=13d69ffed00000 avoids
> this problem. I can't narrow down what is happening.

This:
- kill_cad_pid(SIGINT, 1);
suggests the change can help... I think... this is good.


> > Re hibernation/suspend configs, you said disabling them is not
> > helping, right? Does it still make sense to disable them?
> > If these configs are enabled, we can at least find some bugs in the
> > preparation for suspend code. However, as you noted, it will
> > immediately lead to "lost connection".
> > Ideally we somehow tweak hibernation/suspend to get to the
> > hibernation/suspend point and then immediately and automatically
> > resume.
>
> That will be one of disable-specific-functionality changes.
>
> >         This way we could test both suspend and unsuspend code, which
> > I assume can lead to bugs, and don't cause "lost connection" at the
> > same time. I guess such a mode does not exist today... and I am not
> > sure what happens with TCP connections after this.
>
> I don't know whether ssh sessions can survive 10 seconds of
> hibernation/suspend. But maybe disabling hibernation/suspend configs
> until disable-specific-functionality changes are accepted makes sense.

We would need to disable CONFIG_SUSPEND and CONFIG_HIBERNATION. I am
thinking if we will gain more than we lose... We will lose coverage of
these subsystems, but this will eliminate some of "lost connection"
crashes. Do you have any understanding as to how many "lost
connection"s this can prevent?
