Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909812B628A
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 14:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731563AbgKQN3c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 08:29:32 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8105 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731594AbgKQN3a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 08:29:30 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cb6Gn0jHFzLpDr;
        Tue, 17 Nov 2020 21:29:05 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 17 Nov 2020
 21:29:18 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <yangyingliang@huawei.com>
Subject: [PATCH] Input: sunkbd - fix UAF in sunkbd_reinit()
Date:   Tue, 17 Nov 2020 21:27:51 +0800
Message-ID: <20201117132751.14863-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According the PoC in link:
https://www.openwall.com/lists/oss-security/2020/11/05/2

Here is UAF log:
[  235.504246] ==================================================================
[  235.508297] BUG: KASAN: use-after-free in __lock_acquire+0x2c75/0x34e0
[  235.511906] Read of size 8 at addr ffff88812d4754f0 by task kworker/2:1/124
[  235.515752]
[  235.516641] CPU: 2 PID: 124 Comm: kworker/2:1 Not tainted 5.10.0-rc4 #1169
[  235.520390] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.0-48-gd9c812dda519-prebuilt.qemu.org 04/01/2014
[  235.526648] Workqueue: events sunkbd_reinit
[  235.528869] Call Trace:
[  235.530140]  dump_stack+0xe6/0x136
[  235.531881]  ? __lock_acquire+0x2c75/0x34e0
[  235.533954]  print_address_description.constprop.8+0x3e/0x60
[  235.536781]  ? rcu_read_lock_bh_held+0xc0/0xc0
[  235.539005]  ? vprintk_func+0xaf/0x1b0
[  235.540830]  ? __lock_acquire+0x2c75/0x34e0
[  235.542709]  ? __lock_acquire+0x2c75/0x34e0
[  235.544613]  kasan_report.cold.10+0x1f/0x37
[  235.546506]  ? __lock_acquire+0x2c75/0x34e0
[  235.548410]  __lock_acquire+0x2c75/0x34e0
[  235.550241]  ? lock_is_held_type+0xae/0xe0
[  235.552130]  ? rcu_read_lock_sched_held+0xaf/0xe0
[  235.554237]  ? rcu_read_lock_bh_held+0xc0/0xc0
[  235.556239]  lock_acquire+0x19c/0x8f0
[  235.557908]  ? prepare_to_wait_event+0x73/0x660
[  235.559946]  ? rcu_read_unlock+0x50/0x50
[  235.561715]  ? del_timer_sync+0xe3/0x130
[  235.563548]  ? schedule_timeout+0x43b/0x950
[  235.565278]  _raw_spin_lock_irqsave+0x43/0x60
[  235.567047]  ? prepare_to_wait_event+0x73/0x660
[  235.568910]  prepare_to_wait_event+0x73/0x660
[  235.570701]  ? __next_timer_interrupt+0x1b0/0x1b0
[  235.572647]  ? wait_woken+0x280/0x280
[  235.574187]  sunkbd_reinit+0x579/0x700
[  235.575744]  ? sunkbd_event+0x3d0/0x3d0
[  235.577189]  ? finish_wait+0x280/0x280
[  235.578623]  ? rcu_read_lock_bh_held+0xc0/0xc0
[  235.580303]  ? lockdep_hardirqs_on_prepare+0x294/0x3e0
[  235.582253]  process_one_work+0x8ef/0x1560
[  235.583815]  ? pwq_dec_nr_in_flight+0x330/0x330
[  235.585537]  ? do_raw_spin_lock+0x126/0x290
[  235.587133]  worker_thread+0x91/0xc30
[  235.588601]  ? process_one_work+0x1560/0x1560
[  235.590233]  kthread+0x37a/0x450
[  235.591487]  ? _raw_spin_unlock_irq+0x24/0x40
[  235.593131]  ? kthread_mod_delayed_work+0x190/0x190
[  235.594965]  ret_from_fork+0x22/0x30
[  235.596346]
[  235.596945] Allocated by task 85:
[  235.598200]  kasan_save_stack+0x19/0x40
[  235.599685]  __kasan_kmalloc.constprop.13+0xc1/0xd0
[  235.601389]  kmem_cache_alloc_trace+0x11b/0x1d0
[  235.602969]  sunkbd_connect+0xa7/0x10e0
[  235.604330]  serio_connect_driver+0x50/0x70
[  235.605810]  really_probe+0x287/0xd90
[  235.607102]  driver_probe_device+0x267/0x3d0
[  235.608611]  __device_attach_driver+0x1cc/0x280
[  235.610209]  bus_for_each_drv+0x154/0x1d0
[  235.611638]  __device_attach+0x234/0x3a0
[  235.612912]  bus_probe_device+0x1dd/0x290
[  235.614223]  device_add+0xc5f/0x1880
[  235.615415]  serio_handle_event+0x4ae/0x8f0
[  235.616788]  process_one_work+0x8ef/0x1560
[  235.618124]  worker_thread+0x91/0xc30
[  235.619351]  kthread+0x37a/0x450
[  235.620427]  ret_from_fork+0x22/0x30
[  235.621582]
[  235.622097] Freed by task 2609:
[  235.623130]  kasan_save_stack+0x19/0x40
[  235.624396]  kasan_set_track+0x1c/0x30
[  235.625612]  kasan_set_free_info+0x1b/0x30
[  235.626944]  __kasan_slab_free+0x111/0x160
[  235.628282]  slab_free_freelist_hook+0x5a/0x150
[  235.629754]  kfree+0xe5/0x660
[  235.630731]  serio_disconnect_driver+0x78/0xa0
[  235.632187]  serio_driver_remove+0x1a/0x20
[  235.633537]  device_release_driver_internal+0x239/0x520
[  235.635250]  serio_unregister_port+0x24/0x40
[  235.636634]  serport_ldisc_read+0x416/0x5f0
[  235.638008]  tty_read+0x17d/0x270
[  235.639096]  vfs_read+0x156/0x4c0
[  235.640203]  ksys_read+0x104/0x200
[  235.641318]  do_syscall_64+0x33/0x40
[  235.642475]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  235.644099]
[  235.644631] The buggy address belongs to the object at ffff88812d475400
[  235.644631]  which belongs to the cache kmalloc-512 of size 512
[  235.648610] The buggy address is located 240 bytes inside of
[  235.648610]  512-byte region [ffff88812d475400, ffff88812d475600)
[  235.652304] The buggy address belongs to the page:
[  235.653862] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x12d470
[  235.656841] head:(____ptrval____) order:3 compound_mapcount:0 compound_pincount:0
[  235.659232] flags: 0x2fffff80010200(slab|head)
[  235.660688] raw: 002fffff80010200 dead000000000100 dead000000000122 ffff8881000432c0
[  235.663141] raw: 0000000000000000 0000000000200020 00000001ffffffff 0000000000000000
[  235.665605] page dumped because: kasan: bad access detected
[  235.667390]
[  235.667898] Memory state around the buggy address:
[  235.669433]  ffff88812d475380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  235.671755]  ffff88812d475400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  235.674072] >ffff88812d475480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  235.676390]                                                              ^
[  235.678576]  ffff88812d475500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  235.680880]  ffff88812d475580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  235.683221] ==================================================================

After sunkbd->tq is added to workqueue, before scheduled work finish, sunkbd is
freed by sunkbd_disconnect(), when sunkbd is used in sunkbd_reinit(), it causes
a UAF. Fix this by calling flush_scheduled_work() before free sunkbd.

This fixes CVE-2020-25669.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/input/keyboard/sunkbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/sunkbd.c b/drivers/input/keyboard/sunkbd.c
index 27126e621eb6..b6222896acdf 100644
--- a/drivers/input/keyboard/sunkbd.c
+++ b/drivers/input/keyboard/sunkbd.c
@@ -316,6 +316,7 @@ static void sunkbd_disconnect(struct serio *serio)
 {
 	struct sunkbd *sunkbd = serio_get_drvdata(serio);
 
+	flush_scheduled_work();
 	sunkbd_enable(sunkbd, false);
 	input_unregister_device(sunkbd->dev);
 	serio_close(serio);
-- 
2.17.1

