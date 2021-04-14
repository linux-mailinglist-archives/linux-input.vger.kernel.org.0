Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBBA35F7F6
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 17:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhDNPkD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 11:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352129AbhDNPjj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 11:39:39 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03655C061574;
        Wed, 14 Apr 2021 08:39:17 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id f8so24244577edd.11;
        Wed, 14 Apr 2021 08:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BWl/CswV5h5tF8gFnhbkOzCdOcdg+NiH7m6Zh/6/t0c=;
        b=UVSFdvOdbZaQsL7f5vWj1kxRhlLo+Ihnx1HdyGR2Rci3Uy8fkRjE33rcIQGcwUo/vz
         V5usTEzSvwWdQyHBd9dFhKrwBfKyvGEbp+LMQ8zl/yETPrA4hHgnlMxBzhFNZdmZC02W
         3nwFkklfyHSzKHUJ2I0P6T4V6AnocyohFn/14rHfeGr6LKbNHWBYyuLRiQZ9sBxliAar
         4N9zB7Y8KX7cMXnLlo3i8mE8x5cyusa9JbLbLunnqKPxiop8bP5Koc54Bm15l8HgYmfL
         63m3K9VLEuNXugFAjqYm0huwLwGt4yS9uasEkcgtjGN3KvIAYOK84Dn28TuU/BQVRvQL
         QL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BWl/CswV5h5tF8gFnhbkOzCdOcdg+NiH7m6Zh/6/t0c=;
        b=rD+8Rejz8MVCS1fe+JCeED8KY2AvrThs/Tv1c9tbVoXdbS/ons+ZmC3W451ykcBZEQ
         ot5/dnlwdIxxRyTBt7Lkwt+O/n35ZQcfHSTOe36gPQLWheZWpWh9UdDnaeYZiDdViPJt
         NZ7F2ioYDcoR5OdWiWup7d5XGulIR+LcCHgse4HMv/tPn19edDK0ufEzvbBozvx361pS
         gkrlr1qC6Q5+M8jUEQVxuVp5N4933YQVhUGvthagXOM3fSWEaNUP4FhArsVat5ysIoPh
         M/v5AG3d5+zk0OFabBWEIlM7AsdGiDzOVwHybZ+tStxnBYF9bMVhlLTT44FlkHfPPrXY
         jR1A==
X-Gm-Message-State: AOAM533TSesbOkm95OFCnjFFTmmT+k6Q9baZH54j/G/mJ9jOEno3VX1n
        fzsakG55SXomPHwk02mzXOuRtZcRin5CB/HkGIE=
X-Google-Smtp-Source: ABdhPJxhfLjhalre+GKyAEGDYbBlm7aBpXrHuEcJz9RhQp2Me0CbjXJmEFzEmorafW5Yb5Wy4siopM022TVMg34Ql0M=
X-Received: by 2002:a05:6402:22a6:: with SMTP id cx6mr41882587edb.55.1618414756602;
 Wed, 14 Apr 2021 08:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000301a4d05bfe14b8f@google.com> <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
In-Reply-To: <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@gmail.com>
Date:   Wed, 14 Apr 2021 17:39:06 +0200
Message-ID: <CA+fCnZcWEuYeOx6-0LY+cqtGVbMx2OiyhEELErdfwaHGcUWHbQ@mail.gmail.com>
Subject: Re: [syzbot] unexpected kernel reboot (4)
To:     Dmitry Vyukov <dvyukov@google.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     syzbot <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 14, 2021 at 7:45 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, Apr 13, 2021 at 11:27 PM syzbot
> <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    89698bec Merge tag 'm68knommu-for-v5.12-rc7' of git://git...
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1243fcfed00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=b234ddbbe2953747
> > dashboard link: https://syzkaller.appspot.com/bug?extid=9ce030d4c89856b27619
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=173e92fed00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1735da2ed00000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com
> >
> > output_len: 0x000000000e74eb68
> > kernel_total_size: 0x000000000f226000
> > needed_size: 0x000000000f400000
> > trampoline_32bit: 0x000000000009d000
> > Decompressing Linux... Parsing ELF... done.
> > Booting the kernel.
>
> +linux-input
>
> The reproducer connects some USB HID device and communicates with the driver.
> Previously we observed reboots because HID devices can trigger reboot
> SYSRQ, but we disable it with "CONFIG_MAGIC_SYSRQ is not set".
> How else can a USB device reboot the machine? Is it possible to disable it?
> I don't see any direct includes of <linux/reboot.h> in drivers/usb/*

This happens when a keyboard sends the Ctrl+Alt+Del sequence, see
fn_boot_it()->ctrl_alt_del() in drivers/tty/vt/keyboard.c.

There was a patchset by Tetsuo [1] to suppress this, but I think it
was abandoned.

(This reminds of a somewhat related syzkaller issue:
https://github.com/google/syzkaller/issues/1824; it relies on a
similar reproducer.)

[1] https://groups.google.com/g/syzkaller/c/7wCmrGlLgm0/m/5yG6HVtbBQAJ
