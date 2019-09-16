Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973CDB409C
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 20:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730107AbfIPStp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 14:49:45 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:54124 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730129AbfIPStK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 14:49:10 -0400
Received: by mail-io1-f70.google.com with SMTP id l21so1092581iob.20
        for <linux-input@vger.kernel.org>; Mon, 16 Sep 2019 11:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=2XxfILjNqvgOnvsx3ytCFDxVQdXM6VVuZeypAV3t46k=;
        b=LdDHtc+F4I/yfkbmTAopdHup/mFxaymM7abdbaedTK499KJHaAmZCwLLBaspx9wh+j
         KyiaStjqfDf6ZpxrcDW7do0ohZDkQfwlhvs/TPOS8+oX7xaZLYPZ6j31USX+EVLwMYnJ
         YJnZDnLJl7glVTl8AZaqa+X5LsqdBUlyQe1uv6nVu/+o7B8REJaZ7DwJiJkUe06w0pBj
         VTB9hWq2Bc0Fdn9dI5hr3cvVbEljB56JYVV09gtgxqRgmiS5cKxW5JvimI64sX+0JGAE
         QZSH3A6a1jLUh7PZsd73HnRAjNNs6WaljtzvZ8W/99rINT2/UUWu4uIW6fFE4xSmiPvK
         Wlkw==
X-Gm-Message-State: APjAAAV2NeXEsKYxOCsZuTtutANYbk8nwqSx+31Cm7brBb7N7HcOu8pg
        i3q5rX+4F0Wsw7Zvk9UC5N+YXJ8yBWZBpwlDs9Wg3vX8Gpuw
X-Google-Smtp-Source: APXvYqxAYehskRVQgzFrr0XdVWHwzuwgpJNhn+ZxrlmyrvG4FhfWqX1sw21wt+LSz1OiL8vSN93vNtKXCpzyTEAWVtLie46dgvGd
MIME-Version: 1.0
X-Received: by 2002:a02:c8cd:: with SMTP id q13mr477547jao.133.1568659749937;
 Mon, 16 Sep 2019 11:49:09 -0700 (PDT)
Date:   Mon, 16 Sep 2019 11:49:09 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002b27c60592b00f38@google.com>
Subject: WARNING in implement
From:   syzbot <syzbot+38e7237add3712479d65@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=170b213e600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=38e7237add3712479d65
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16830dc1600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11f2d3fa600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+38e7237add3712479d65@syzkaller.appspotmail.com

keytouch 0003:0926:3333.0001: implement() called with too large value 32769  
(n: 1)! (kworker/0:1)
------------[ cut here ]------------
WARNING: CPU: 0 PID: 12 at drivers/hid/hid-core.c:1370  
implement.cold+0x40/0x81 drivers/hid/hid-core.c:1370
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events hidinput_led_worker
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2a3/0x6da kernel/panic.c:219
  __warn.cold+0x20/0x4a kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:implement.cold+0x40/0x81 drivers/hid/hid-core.c:1370
Code: 00 ef 01 00 48 c7 c2 a0 ac 52 86 48 c7 c6 c0 8a 52 86 4c 8d 88 70 06  
00 00 e8 3f 3b 1a fe 48 c7 c7 20 8b 52 86 e8 fc 4e d7 fc <0f> 0b 44 21 e5  
e9 06 3a ff ff e8 64 ad ec fc 49 8d bd 28 19 00 00
RSP: 0018:ffff8881da20fb88 EFLAGS: 00010082
RAX: 0000000000000024 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81288ddd RDI: ffffed103b441f63
RBP: 0000000000008001 R08: 0000000000000024 R09: ffffed103b643ee7
R10: ffffed103b643ee6 R11: ffff8881db21f737 R12: 0000000000000001
R13: ffff8881d28d8000 R14: 0000000000000001 R15: 0000000000000001
  hid_output_field drivers/hid/hid-core.c:1543 [inline]
  hid_output_report+0x2dc/0x4c0 drivers/hid/hid-core.c:1562
  __usbhid_submit_report drivers/hid/usbhid/hid-core.c:593 [inline]
  usbhid_submit_report+0x65c/0xde0 drivers/hid/usbhid/hid-core.c:638
  usbhid_request+0x3c/0x70 drivers/hid/usbhid/hid-core.c:1252
  hidinput_led_worker+0xbd/0x360 drivers/hid/hid-input.c:1495
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Shutting down cpus with NMI
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
