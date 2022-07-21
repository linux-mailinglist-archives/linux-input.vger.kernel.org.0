Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C466557C99B
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 13:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbiGULMR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 07:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbiGULMR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 07:12:17 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8348212C
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 04:12:15 -0700 (PDT)
Received: from fsav414.sakura.ne.jp (fsav414.sakura.ne.jp [133.242.250.113])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26LBBmLF068482;
        Thu, 21 Jul 2022 20:11:49 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav414.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp);
 Thu, 21 Jul 2022 20:11:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26LBBm7R068470
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 21 Jul 2022 20:11:48 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <bae8fb53-969c-0e92-2e57-f602e4eb848e@I-love.SAKURA.ne.jp>
Date:   Thu, 21 Jul 2022 20:11:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johan Hovold <johan@kernel.org>
References: <000000000000ed47a705e2cbd347@google.com>
Cc:     rydberg@bitmath.org, syzkaller-bugs@googlegroups.com,
        syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <000000000000ed47a705e2cbd347@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello.

syzbot is reporting that iforce_close() from input_close_device() from
joydev_close_device() from joydev_release() forever sleeps at

	wait_event_interruptible(iforce->wait,
			!test_bit(IFORCE_XMIT_RUNNING, iforce->xmit_flags));

with dev->mutex held, which in turn prevents input_disconnect_device() from
__input_unregister_device() from input_unregister_device() from
iforce_usb_disconnect() from setting dev->going_away = true.

We somehow need to wake up this wait_event_interruptible() in iforce_close()
if iforce_usb_disconnect() is in progress. But iforce_usb_disconnect() does
not manipulate flags for waking up this wait_event_interruptible(). How can
we wake up this wait_event_interruptible()?



INFO: task kworker/0:0:6 blocked for more than 143 seconds.
      Not tainted 5.18.0-syzkaller-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:0     state:D stack:24464 pid:    6 ppid:     2 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5073 [inline]
 __schedule+0xa9a/0x4cc0 kernel/sched/core.c:6388
 schedule+0xd2/0x1f0 kernel/sched/core.c:6460
 schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:6519
 __mutex_lock_common kernel/locking/mutex.c:673 [inline]
 __mutex_lock+0xa32/0x12f0 kernel/locking/mutex.c:733
 input_disconnect_device drivers/input/input.c:784 [inline]
 __input_unregister_device+0x24/0x470 drivers/input/input.c:2236
 input_unregister_device+0xb4/0xf0 drivers/input/input.c:2431
 iforce_usb_disconnect+0x5e/0xf0 drivers/input/joystick/iforce/iforce-usb.c:261
 usb_unbind_interface+0x1d8/0x8e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:532 [inline]
 device_remove+0x11f/0x170 drivers/base/dd.c:524
 __device_release_driver drivers/base/dd.c:1200 [inline]
 device_release_driver_internal+0x4a3/0x680 drivers/base/dd.c:1223
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:529
 device_del+0x4f3/0xc80 drivers/base/core.c:3592
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1419
 usb_disconnect.cold+0x278/0x6ec drivers/usb/core/hub.c:2228
 hub_port_connect drivers/usb/core/hub.c:5207 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5507 [inline]
 port_event drivers/usb/core/hub.c:5665 [inline]
 hub_event+0x1e74/0x4680 drivers/usb/core/hub.c:5747
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 process_scheduled_works kernel/workqueue.c:2352 [inline]
 worker_thread+0x854/0x1080 kernel/workqueue.c:2438
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:298
 </TASK>
6 locks held by kworker/0:0/6:
 #0: ffff8881457f4138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff8881457f4138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff8881457f4138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1280 [inline]
 #0: ffff8881457f4138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:636 [inline]
 #0: ffff8881457f4138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:663 [inline]
 #0: ffff8881457f4138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x87a/0x1610 kernel/workqueue.c:2260
 #1: ffffc900000b7da8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x8ae/0x1610 kernel/workqueue.c:2264
 #2: ffff88801f817220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:767 [inline]
 #2: ffff88801f817220 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c1/0x4680 drivers/usb/core/hub.c:5693
 #3: ffff88814bc3b220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:767 [inline]
 #3: ffff88814bc3b220 (&dev->mutex){....}-{3:3}, at: usb_disconnect.cold+0x43/0x6ec drivers/usb/core/hub.c:2219
 #4: ffff88814bc3a1a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:767 [inline]
 #4: ffff88814bc3a1a8 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1033 [inline]
 #4: ffff88814bc3a1a8 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0xa0/0x680 drivers/base/dd.c:1220
 #5: ffff88807b7202c0 (&dev->mutex#2){+.+.}-{3:3}, at: input_disconnect_device drivers/input/input.c:784 [inline]
 #5: ffff88807b7202c0 (&dev->mutex#2){+.+.}-{3:3}, at: __input_unregister_device+0x24/0x470 drivers/input/input.c:2236

task:acpid           state:S stack:23384 pid: 2951 ppid:     1 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5073 [inline]
 __schedule+0xa9a/0x4cc0 kernel/sched/core.c:6388
 schedule+0xd2/0x1f0 kernel/sched/core.c:6460
 iforce_close+0x396/0x4b0 drivers/input/joystick/iforce/iforce-main.c:203
 input_close_device+0x156/0x1f0 drivers/input/input.c:734
 joydev_close_device drivers/input/joydev.c:223 [inline]
 joydev_release+0x222/0x290 drivers/input/joydev.c:252
 __fput+0x277/0x9d0 fs/file_table.c:317
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:169 [inline]
 exit_to_user_mode_prepare+0x23c/0x250 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:294
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f135bd3ffc3
RSP: 002b:00007ffe571c93d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 00007ffe571c9648 RCX: 00007f135bd3ffc3
RDX: 00007ffe571c8808 RSI: 000000000000001e RDI: 000000000000000a
RBP: 000000000000000a R08: 00007ffe571c965c R09: 00007ffe571c9548
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe571c9548
R13: 00007ffe571c9648 R14: 0000000000000020 R15: 0000000000000000
 </TASK>
2 locks held by acpid/2951:
 #0: ffff88807bd28158 (&joydev->mutex){+.+.}-{3:3}, at: joydev_close_device drivers/input/joydev.c:220 [inline]
 #0: ffff88807bd28158 (&joydev->mutex){+.+.}-{3:3}, at: joydev_release+0x187/0x290 drivers/input/joydev.c:252
 #1: ffff88807b7202c0 (&dev->mutex#2){+.+.}-{3:3}, at: input_close_device+0x42/0x1f0 drivers/input/input.c:726

On 2022/07/02 14:32, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a175eca0f3d7 Merge tag 'drm-fixes-2022-07-01' of git://ano..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17141c97f00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3a010dbf6a7af480
> dashboard link: https://syzkaller.appspot.com/bug?extid=deb6abc36aad4008f407
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> 
