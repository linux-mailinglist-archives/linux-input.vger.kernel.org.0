Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3303BAA290
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2019 14:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389189AbfIEMDz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Sep 2019 08:03:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35163 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730872AbfIEMDy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Sep 2019 08:03:54 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so1626197pfw.2
        for <linux-input@vger.kernel.org>; Thu, 05 Sep 2019 05:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aai7vMHcDPZtNFz3aO3i4nNt8bejCBiPZk07jBpgR2w=;
        b=WTcKN/e2WDwsfZRb1ZPCK72rhmmq1i4MgNfFiMwmgX5EGjjROA4kusvu55uNFp1LBO
         /uxRGx4Kayu9ebfdeUxNnP6bYiADt13UMJIKX6L+ZZjCmoWp2e0nHouJX6HE3lRpTTTU
         TIBSeFBYHps1uGMozAJdlXex02DUv14fDyEtrhShlEKELzWoONBOpQva3epcqzSXMyJX
         /tx017mSIhp4ZvDpsNuXNjJqQ97lJZI1Ly+ljw3udSBplBSStERPMX9+8FpCY0IgiuWP
         TZv1uzAo1OFPuUkMUY1EvY6x/d2ZUI1Ox+0kF1tL9GXD0w+EBB4bNXObcdZu15DpMDu+
         Vf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aai7vMHcDPZtNFz3aO3i4nNt8bejCBiPZk07jBpgR2w=;
        b=ThH0llQgcgvs3jj9TsSCSXOKcieqVvDvyF2RO9tTGuWfoaaU8IDvC2vpXnXsuJMLke
         X1msDJl13RTut7l3qQWIUT2M2M17zU4m9o3besJw40AePS86lusDoipeo5RWGQ7A8XJx
         CSfWL9fkvuE2/gWLPJKw334wbcLDUErr47KTnlSyFq9pdURdA52N20V7GOM91Q2cAKwn
         p+eMnl+VyomP5vJIW/YBAL0629xxgqDCWYJE2lSId8qxxnHcS5DatRhLnHaJEIff4m5M
         Hf/sR3/FnMuSjFq6d3ao8O9U7yNJZrPBFv1xn5LApT1xsIguI7GT04682Emig5e6wCzE
         EZFQ==
X-Gm-Message-State: APjAAAUwdfwXiaEF7kmrch2rcebb3PdvB+hwEXFeHnHuZGHkNVy/BAQ4
        d3RKpxRzppO9U7I7MyUad82yxLGfVwYNofh1TgG3xA==
X-Google-Smtp-Source: APXvYqyu8Win4to5U0SdZSHj6aVFd0Dn+v68b8PT7F4Jr4rllD6ZMBJGxv+/R/yW6QiPhDN64x5fnxAluKnbs/Aue7A=
X-Received: by 2002:aa7:8bcc:: with SMTP id s12mr3295908pfd.93.1567685032809;
 Thu, 05 Sep 2019 05:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000490d4c058e8047e6@google.com>
In-Reply-To: <000000000000490d4c058e8047e6@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 5 Sep 2019 14:03:41 +0200
Message-ID: <CAAeHK+wq3M=75R=yjM0ECO4eoPjA1aOknHaE=nX48gidURD0wA@mail.gmail.com>
Subject: Re: WARNING: ODEBUG bug in __free_pages_ok
To:     syzbot <syzbot+6ff9bba63b987471b8be@syzkaller.appspotmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 25, 2019 at 2:08 PM syzbot
<syzbot+6ff9bba63b987471b8be@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=10d72ef0600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> dashboard link: https://syzkaller.appspot.com/bug?extid=6ff9bba63b987471b8be
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144edb68600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14cd0e64600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+6ff9bba63b987471b8be@syzkaller.appspotmail.com
>
> usb 1-1: USB disconnect, device number 2
> ------------[ cut here ]------------
> ODEBUG: free active (active state 0) object type: timer_list hint:
> hid_retry_timeout+0x0/0xd0 drivers/hid/usbhid/hid-core.c:716
> WARNING: CPU: 1 PID: 21 at lib/debugobjects.c:325
> debug_print_object+0x160/0x250 lib/debugobjects.c:325
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.2.0-rc6+ #15
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   panic+0x292/0x6c9 kernel/panic.c:219
>   __warn.cold+0x20/0x4b kernel/panic.c:576
>   report_bug+0x262/0x2a0 lib/bug.c:186
>   fixup_bug arch/x86/kernel/traps.c:179 [inline]
>   fixup_bug arch/x86/kernel/traps.c:174 [inline]
>   do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
>   do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
>   invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:986
> RIP: 0010:debug_print_object+0x160/0x250 lib/debugobjects.c:325
> Code: dd e0 16 ba 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48
> 8b 14 dd e0 16 ba 85 48 c7 c7 c0 0c ba 85 e8 db c7 33 ff <0f> 0b 83 05 03
> 6e 86 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
> RSP: 0018:ffff8881d9eff710 EFLAGS: 00010086
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff8127ef3d RDI: ffffed103b3dfed4
> RBP: 0000000000000001 R08: ffff8881d9e36000 R09: ffffed103b663ed7
> R10: ffffed103b663ed6 R11: ffff8881db31f6b7 R12: ffffffff86b04760
> R13: ffffffff812db3c0 R14: ffffffff88f4bae8 R15: ffff8881d0e1a8c8
>   __debug_check_no_obj_freed lib/debugobjects.c:785 [inline]
>   debug_check_no_obj_freed+0x2a3/0x42e lib/debugobjects.c:817
>   free_pages_prepare mm/page_alloc.c:1140 [inline]
>   __free_pages_ok+0x215/0x1bb0 mm/page_alloc.c:1366
>   usbhid_disconnect+0x98/0xd0 drivers/hid/usbhid/hid-core.c:1414
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1081 [inline]
>   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1112
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
>   device_del+0x460/0xb80 drivers/base/core.c:2274
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2199
>   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x13bd/0x3550 drivers/usb/core/hub.c:5441
>   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x30b/0x410 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> ======================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

#syz dup: WARNING: ODEBUG bug in usbhid_disconnect (2)
