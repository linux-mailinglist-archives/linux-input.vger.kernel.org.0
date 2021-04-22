Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A6C367E65
	for <lists+linux-input@lfdr.de>; Thu, 22 Apr 2021 12:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbhDVKRS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Apr 2021 06:17:18 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:50317 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhDVKRR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Apr 2021 06:17:17 -0400
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 13MAGWOa001659;
        Thu, 22 Apr 2021 19:16:32 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Thu, 22 Apr 2021 19:16:32 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 13MAGWPU001656
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 22 Apr 2021 19:16:32 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] unexpected kernel reboot (4)
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <000000000000301a4d05bfe14b8f@google.com>
 <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
 <CA+fCnZcWEuYeOx6-0LY+cqtGVbMx2OiyhEELErdfwaHGcUWHbQ@mail.gmail.com>
 <b8162e95-fb2e-51f6-9d9b-a4d64873876e@i-love.sakura.ne.jp>
Message-ID: <abcb019f-a78a-3c6d-e199-719176a394d6@i-love.sakura.ne.jp>
Date:   Thu, 22 Apr 2021 19:16:31 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b8162e95-fb2e-51f6-9d9b-a4d64873876e@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2021/04/15 1:16, Tetsuo Handa wrote:
> On 2021/04/15 0:39, Andrey Konovalov wrote:
>> On Wed, Apr 14, 2021 at 7:45 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>>>
>>> On Tue, Apr 13, 2021 at 11:27 PM syzbot
>>> <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    89698bec Merge tag 'm68knommu-for-v5.12-rc7' of git://git...
>>>> git tree:       upstream
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1243fcfed00000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=b234ddbbe2953747
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=9ce030d4c89856b27619
>>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=173e92fed00000
>>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1735da2ed00000
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>> Reported-by: syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com
>>>>
>>>> output_len: 0x000000000e74eb68
>>>> kernel_total_size: 0x000000000f226000
>>>> needed_size: 0x000000000f400000
>>>> trampoline_32bit: 0x000000000009d000
>>>> Decompressing Linux... Parsing ELF... done.
>>>> Booting the kernel.
>>>
>>> +linux-input
>>>
>>> The reproducer connects some USB HID device and communicates with the driver.
>>> Previously we observed reboots because HID devices can trigger reboot
>>> SYSRQ, but we disable it with "CONFIG_MAGIC_SYSRQ is not set".
>>> How else can a USB device reboot the machine? Is it possible to disable it?
>>> I don't see any direct includes of <linux/reboot.h> in drivers/usb/*
>>
>> This happens when a keyboard sends the Ctrl+Alt+Del sequence, see
>> fn_boot_it()->ctrl_alt_del() in drivers/tty/vt/keyboard.c.

Hmm, maybe the reproducer I use and "#syz test:" uses differs.
But since "#syz test:" did not trigger the problem if
https://syzkaller.appspot.com/x/patch.diff?x=14ba0851d00000 is applied,
can we add

        if (fork() == 0) {
                char buf[20] = { };
                int fd = open("/proc/sys/kernel/ctrl-alt-del", O_WRONLY);
                write(fd, "0\n", 2);
                close(fd);
                fd = open("/proc/sys/kernel/cad_pid", O_WRONLY);
                snprintf(buf, sizeof(buf) - 1, "%d\n", getpid());
                write(fd, buf, strlen(buf));
                close(fd);
        }

to the common setup function? This will serve as a temporary workaround
until Linus accepts disable-specific-functionality changes.

There is no need to keep the process referenced by /proc/sys/kernel/cad_pid alive,
for "struct pid" which can remain after the process terminates is saved there.
