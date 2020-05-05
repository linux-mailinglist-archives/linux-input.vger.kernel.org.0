Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF9B1C5744
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 15:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbgEENpN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 09:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728912AbgEENpN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 May 2020 09:45:13 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA26C061A10
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 06:45:12 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id j2so1614034qtr.12
        for <linux-input@vger.kernel.org>; Tue, 05 May 2020 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PpZGV2cFYdg509BirBHZ7UsYovRP7E9mXl70khXE+Yg=;
        b=oaB1Z5tAY1jA4cgdEhNqen4ZiSZ0IF7LyeOMXells7W87g5yIUHpfarJaZ/cEaPa/J
         HP/hdI1Hb1lXcUqCXlGiCFp4TfVFNcDffbI6X5ib62sLdNwloT5X/JFIXI/OAQwFP2Oh
         P/yLfXsjqI2+zMMTaqKwpfGqidgwOqTHNMwltC6NGSXGmHnLHX5vCn87BKhEu2jODPRD
         edLP/YNScbyqtBmPDy3aEQPAMRGeuhgiuswpuU9LQnNxMUq9s6ny2ibN//I4Tw9IOirm
         7/FUUe4PKtnl1QquB6uqIfnH4Es3LEqkKVFLF9zvOKSSfYjDS+m57uJaTkCDZif4snYS
         y2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PpZGV2cFYdg509BirBHZ7UsYovRP7E9mXl70khXE+Yg=;
        b=meDf9wHZdZDkfa6eLZqc4l6rGnKR6UW3ccQX9pdFv1SJ95O96tCo8Z1kw7Arf4FaLo
         E4xGKeLzGBBw13rXFX1mWr1Iifj86m0fhj30io4Ypg8U6naX+BHwGoDsPrGlTVP3vTYv
         58oTO+BcY13uMkli+9xeiDT0+kZj83fFrEnDxbByvlEDutNNVlczbnUjBj0I48CAcenO
         SzpUxKPCHZ09nS2PawDBu1P7XJIyYlaxH4q+7OwEft8a5HBEiz4kTBf8BA1aObt4IDGl
         HhkNgSovkBGqvVmYeYAtXD44B80KkSx5rzEiN92EvpNxtAN8D7Dehd/irIIBnLT1hv8X
         v4Aw==
X-Gm-Message-State: AGi0PuZxZ2QSiCb5xsyi/As/noDK1YphG4E1AU6QWMGxaMnsTyJArjz9
        G3efXFTOWjIZIc6CwxKo4ltMUcovVP9MPSdxcAWiMXlWl+g=
X-Google-Smtp-Source: APiQypIQnqlnKlTUwTz4stU5KhGXfg9rPA+FBzDsV7Uz9ztLly+3ic300+uRgn67dm2QVbQb4u+5SRDs7KZNqIQtvwI=
X-Received: by 2002:ac8:6c24:: with SMTP id k4mr2653777qtu.257.1588686311674;
 Tue, 05 May 2020 06:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000000610eb059e429abd@google.com> <1588684948.13662.11.camel@suse.com>
In-Reply-To: <1588684948.13662.11.camel@suse.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 5 May 2020 15:44:58 +0200
Message-ID: <CACT4Y+YqeYnH7ZynaAOhddCQF=yoV-=2QSV+doAA0sW6Nxe71w@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Write in betop_probe
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

,On Tue, May 5, 2020 at 3:23 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Montag, den 10.02.2020, 17:16 -0800 schrieb syzbot:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    e5cd56e9 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1517fed9e00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=8cff427cc8996115
> > dashboard link: https://syzkaller.appspot.com/bug?extid=07efed3bc5a1407bd742
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147026b5e00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1683b6b5e00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com
> >
> > betop 0003:20BC:5500.0001: unknown main item tag 0x0
> > betop 0003:20BC:5500.0001: hidraw0: USB HID v0.00 Device [HID 20bc:5500] on usb-dummy_hcd.0-1/input0
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in set_bit include/asm-generic/bitops/instrumented-atomic.h:28 [inline]
> > BUG: KASAN: slab-out-of-bounds in betopff_init drivers/hid/hid-betopff.c:99 [inline]
> > BUG: KASAN: slab-out-of-bounds in betop_probe+0x396/0x570 drivers/hid/hid-betopff.c:134
> > Write of size 8 at addr ffff8881d4f43ac0 by task kworker/1:2/94
> >
> > Freed by task 12:
> >  save_stack+0x1b/0x80 mm/kasan/common.c:72
> >  set_track mm/kasan/common.c:80 [inline]
> >  kasan_set_free_info mm/kasan/common.c:337 [inline]
> >  __kasan_slab_free+0x117/0x160 mm/kasan/common.c:476
> >  slab_free_hook mm/slub.c:1444 [inline]
> >  slab_free_freelist_hook mm/slub.c:1477 [inline]
> >  slab_free mm/slub.c:3024 [inline]
> >  kfree+0xd5/0x300 mm/slub.c:3976
> >  urb_destroy drivers/usb/core/urb.c:26 [inline]
> >  kref_put include/linux/kref.h:65 [inline]
> >
>
> Hi,
>
> this indicates that I am confused. Why are we getting an out-of-bounds
> on a freed region? Is this a strange way of reporting access
> to already freed memory?

Hi Oliver,

This is being tracked in:
https://bugzilla.kernel.org/show_bug.cgi?id=198425
