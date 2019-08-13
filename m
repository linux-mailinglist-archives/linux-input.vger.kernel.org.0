Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87DCD8BA99
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 15:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729034AbfHMNnK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 09:43:10 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35074 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbfHMNnJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 09:43:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id n4so9557241pgv.2
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2019 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hbroNosbT3jj3xT50Om4hklhf3qmqa0/vsPm2jM2OfA=;
        b=O4nqKWlZKZZ1e2LApPIoUKMRygbZDfvL7IojIg58Hvn6qF28yOQF8heQgsjZuYcyhd
         3jEyzNMv797LrLXq8SYPXsml5JBroCY+w56I2TUHkINPfTUUekQ1aFldgBiKLi7LTIPe
         02g6MCKcDznDloANBtkUBovWtBB3xDdHacz3wUAsnoYuH/ViOrtJQVmUWXw7zsRWtsNh
         thFQ2rW2sTwvJIWzvY6UZGEMsckWo3PFl2ecpAbhr9UvXobvCtMD8+CRAvekCdLK570F
         K9mWBIru76bQ5Ds+ruqLXDGvQ0avhvhVMyAxMpbtGFPLK7NZNTAxstZ22k0IPER8+JB5
         J/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hbroNosbT3jj3xT50Om4hklhf3qmqa0/vsPm2jM2OfA=;
        b=pFU4iiHBQJfA26WmJx2CW0lg7Xn+E6NV2wsZsXKxWHwoQHbMRSTy/N8+w9YlgyJcpl
         DNCCT0NMCQvkpTdFT1opzRr2JFBTmNhgeBGlaVW7MlhXBIT6Lfak1vOREKQAdgCWandM
         O2xKn4gz6lgBsM15PUNYusGPaX3hAi5jhv+Wac7uYAiDsOu8x5hZqddPQmzthgBPCOjo
         fMUOHyB3gT8oGpkji3hxdMFVIaC10iEU1S+Mb6NwIjkSTfls0BbkanxCvVTgC+uPiphF
         Bix4sfA0HWsENEVlWFqoa4iXFOy/VIp9mgZYJs8ZWMdM44KQnJ5PNIKw0lfGLmG2PAzG
         6ASA==
X-Gm-Message-State: APjAAAU+eQaVXdsxsXwkNAbySO5uzURhVI7LOQCoyqytVBJVozjpmxHP
        KkMlgupALHoeox0gesS58znYuonrDWXOJam/fqCpnA==
X-Google-Smtp-Source: APXvYqzEYicmEDBmYjcPR3bO5l0ihkY1ZO+rSWVZpQ9MlCT7RJwv+miC3Wni9hQ+HVHsK5m/N/ZMZ4J1DybPmYBKjUA=
X-Received: by 2002:aa7:9790:: with SMTP id o16mr3937688pfp.51.1565703788822;
 Tue, 13 Aug 2019 06:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000000de921058ee524e1@google.com>
In-Reply-To: <0000000000000de921058ee524e1@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 15:42:57 +0200
Message-ID: <CAAeHK+x9pZec1rJ=rpGvX-O9wmCic27zqd_8xKXgviSymy=ajQ@mail.gmail.com>
Subject: Re: KASAN: user-memory-access Read in hidraw_ioctl
To:     syzbot <syzbot+5a8c44432a51154ff6d5@syzkaller.appspotmail.com>
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

On Tue, Jul 30, 2019 at 2:28 PM syzbot
<syzbot+5a8c44432a51154ff6d5@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=13c21ab4600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> dashboard link: https://syzkaller.appspot.com/bug?extid=5a8c44432a51154ff6d5
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+5a8c44432a51154ff6d5@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: user-memory-access in _copy_to_user+0x124/0x150
> lib/usercopy.c:27
> Read of size 148 at addr 0000100000000000 by task syz-executor.2/19576
>
> CPU: 1 PID: 19576 Comm: syz-executor.2 Not tainted 5.3.0-rc2+ #23
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   __kasan_report.cold+0x5/0x33 mm/kasan/report.c:486
>   kasan_report+0xe/0x12 mm/kasan/common.c:612
>   check_memory_region_inline mm/kasan/generic.c:185 [inline]
>   check_memory_region+0x128/0x190 mm/kasan/generic.c:192
>   _copy_to_user+0x124/0x150 lib/usercopy.c:27
>   copy_to_user include/linux/uaccess.h:152 [inline]
>   hidraw_ioctl+0x39c/0xae0 drivers/hid/hidraw.c:392
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
>   ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x459829
> Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f6587cfbc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
> RDX: 0000000020005640 RSI: 0000000090044802 RDI: 0000000000000004
> RBP: 000000000075c070 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f6587cfc6d4
> R13: 00000000004c21db R14: 00000000004d5540 R15: 00000000ffffffff
> ==================================================================

#syz dup: BUG: bad usercopy in hidraw_ioctl

>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
