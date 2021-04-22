Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0814368259
	for <lists+linux-input@lfdr.de>; Thu, 22 Apr 2021 16:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbhDVOU7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Apr 2021 10:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237164AbhDVOU6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Apr 2021 10:20:58 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0911C06138C
        for <linux-input@vger.kernel.org>; Thu, 22 Apr 2021 07:20:23 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id o2so20475173qtr.4
        for <linux-input@vger.kernel.org>; Thu, 22 Apr 2021 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ApfMOAte0C127jwHR+Rs3V/gkRXkrllStqF0YgW+bds=;
        b=ewY3djZ7Yj9TRMXNThQvj1l8pcIa8qQSIZTdlgvtCYYmQMYwuJpPRVrXcw4c/2F54W
         9otM/uMBOgbFqcfWq9+6pTEqgxxxZ2StRn/K+jZ3876ajMuksrS3enO0Y/4XigyrgMoB
         y33e0ZHIWx4VmhHALFLfutQ4ifhzivpbv0iJtwO/1YCDQiAo/geAMcCMIoJkoB4zv5ay
         3jS0xI5jY8Wes+SrQy9LWs51KxU7pNLLuCPc0Tck1ogCqG7mC4+Ch9x05YQKAn8Qo5IB
         GVw8aCIiBnIbnrX7FvGcVnvci6Tq2lVB95eAjUOsZtv/x6yC7rFUUq3GDK/60+TZ4uHb
         R8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ApfMOAte0C127jwHR+Rs3V/gkRXkrllStqF0YgW+bds=;
        b=jw4zmC88pnqY+hpVM+bA285U47IW9TJArpv9MtogxS/XrQ9hLGgjqkZtxTuHs8q5hg
         fr+z9JKMRAkB2Q/FBonSMLGXx4NklgiwSonJuCCn/UsLoZl7f6J6+chMUQeNGpzqa+x3
         4+Yvq8Ux0PX9/Z85M1SR9AGT/Jornc+NUsF6D0i6OgVI9ElcftZBKMzjwGE3DRmUsZzk
         T3PHoluEgtE7m/sJ4yN9kRquh6yJmzcWpgeiwqpa6QERyFbS1YkSmBePVvkeuyzCivyC
         Il/uJPLtJpVJthY/qMa1xVcNEfaZDZrEIWwNnZtDTkVXpfBQBo1OnB+WfehGlN8pJGU8
         mmaw==
X-Gm-Message-State: AOAM533FHKXz/awTNriP0BHNDswFjSLCNyCAaeT1KgSAexlZ7BQjEj/H
        Tp/OYx/uLjHdB51pC+sZh1lSe8YiUKKoe9M0Cr4HpA==
X-Google-Smtp-Source: ABdhPJzA2yNa5ia2nyaegY1JUCPWCSgm77x71L2cMONiFDl2MZ0YNIOrbO9kKiEJrfQhLlmDqophIt5kPGXScZMy+NY=
X-Received: by 2002:a05:622a:5d0:: with SMTP id d16mr3357947qtb.290.1619101222962;
 Thu, 22 Apr 2021 07:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000301a4d05bfe14b8f@google.com> <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
 <CA+fCnZcWEuYeOx6-0LY+cqtGVbMx2OiyhEELErdfwaHGcUWHbQ@mail.gmail.com>
 <b8162e95-fb2e-51f6-9d9b-a4d64873876e@i-love.sakura.ne.jp> <abcb019f-a78a-3c6d-e199-719176a394d6@i-love.sakura.ne.jp>
In-Reply-To: <abcb019f-a78a-3c6d-e199-719176a394d6@i-love.sakura.ne.jp>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 22 Apr 2021 16:20:11 +0200
Message-ID: <CACT4Y+ZvidVY5R4XqqW=b_j1Lbe2DnoKM2bPLgB4mS-CW10g1w@mail.gmail.com>
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

On Thu, Apr 22, 2021 at 12:16 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2021/04/15 1:16, Tetsuo Handa wrote:
> > On 2021/04/15 0:39, Andrey Konovalov wrote:
> >> On Wed, Apr 14, 2021 at 7:45 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >>>
> >>> On Tue, Apr 13, 2021 at 11:27 PM syzbot
> >>> <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> syzbot found the following issue on:
> >>>>
> >>>> HEAD commit:    89698bec Merge tag 'm68knommu-for-v5.12-rc7' of git://git...
> >>>> git tree:       upstream
> >>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1243fcfed00000
> >>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=b234ddbbe2953747
> >>>> dashboard link: https://syzkaller.appspot.com/bug?extid=9ce030d4c89856b27619
> >>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=173e92fed00000
> >>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1735da2ed00000
> >>>>
> >>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>>> Reported-by: syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com
> >>>>
> >>>> output_len: 0x000000000e74eb68
> >>>> kernel_total_size: 0x000000000f226000
> >>>> needed_size: 0x000000000f400000
> >>>> trampoline_32bit: 0x000000000009d000
> >>>> Decompressing Linux... Parsing ELF... done.
> >>>> Booting the kernel.
> >>>
> >>> +linux-input
> >>>
> >>> The reproducer connects some USB HID device and communicates with the driver.
> >>> Previously we observed reboots because HID devices can trigger reboot
> >>> SYSRQ, but we disable it with "CONFIG_MAGIC_SYSRQ is not set".
> >>> How else can a USB device reboot the machine? Is it possible to disable it?
> >>> I don't see any direct includes of <linux/reboot.h> in drivers/usb/*
> >>
> >> This happens when a keyboard sends the Ctrl+Alt+Del sequence, see
> >> fn_boot_it()->ctrl_alt_del() in drivers/tty/vt/keyboard.c.
>
> Hmm, maybe the reproducer I use and "#syz test:" uses differs.
> But since "#syz test:" did not trigger the problem if
> https://syzkaller.appspot.com/x/patch.diff?x=14ba0851d00000 is applied,
> can we add
>
>         if (fork() == 0) {
>                 char buf[20] = { };
>                 int fd = open("/proc/sys/kernel/ctrl-alt-del", O_WRONLY);
>                 write(fd, "0\n", 2);
>                 close(fd);
>                 fd = open("/proc/sys/kernel/cad_pid", O_WRONLY);
>                 snprintf(buf, sizeof(buf) - 1, "%d\n", getpid());
>                 write(fd, buf, strlen(buf));
>                 close(fd);
>         }
>
> to the common setup function? This will serve as a temporary workaround
> until Linus accepts disable-specific-functionality changes.
>
> There is no need to keep the process referenced by /proc/sys/kernel/cad_pid alive,
> for "struct pid" which can remain after the process terminates is saved there.

I've prepared this syzkaller change:
https://github.com/google/syzkaller/pull/2550/files

Re hibernation/suspend configs, you said disabling them is not
helping, right? Does it still make sense to disable them?
If these configs are enabled, we can at least find some bugs in the
preparation for suspend code. However, as you noted, it will
immediately lead to "lost connection".
Ideally we somehow tweak hibernation/suspend to get to the
hibernation/suspend point and then immediately and automatically
resume. This way we could test both suspend and unsuspend code, which
I assume can lead to bugs, and don't cause "lost connection" at the
same time. I guess such a mode does not exist today... and I am not
sure what happens with TCP connections after this.
