Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819792EEA7D
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 01:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbhAHAl0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 19:41:26 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10408 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbhAHAl0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 19:41:26 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DBkl71xR5z7Rb9;
        Fri,  8 Jan 2021 08:39:47 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.107) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 08:40:35 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH] input - mk712: fix the kernel crash while mk712 is selected
Date:   Fri, 8 Jan 2021 13:35:27 +1300
Message-ID: <20210108003527.25800-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.203.107]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While debugging other issues, I enabled mk712 then I got the below crash
during arm64 linux boot:
[    1.150412] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
[    1.150541] pc : logic_outb+0x3c/0xa8
[    1.150657] lr : mk712_init+0x74/0x1ec
[    1.150745] sp : ffff800011efbd40
[    1.150950] x29: ffff800011efbd40 x28: 0000000000000000
[    1.151098] x27: ffff800011681078 x26: ffff8000115d04b8
[    1.151192] x25: ffff8000116ff6b4 x24: ffff8000115bac10
[    1.151287] x23: ffff800011dfa000 x22: ffff800011b8dbe0
[    1.151421] x21: ffff800011eac000 x20: 0000000000000000
[    1.151527] x19: fffffbfffe800266 x18: 0000000000000000
[    1.151674] x17: ffff800010a7bc38 x16: ffff800010a7b0e0
[    1.151944] x15: 0000a0d665e7ee58 x14: 000000000000011a
[    1.152060] x13: 0000000000000001 x12: 0000000000000000
[    1.152149] x11: 0000000000000000 x10: 0000000000000a60
[    1.152291] x9 : 0000000000000000 x8 : ffff0000c0a2a480
[    1.152429] x7 : 0000000000000000 x6 : ffff0000c0b0c9b8
[    1.152522] x5 : 0000000000001000 x4 : ffff0000c03613b0
[    1.152614] x3 : 0000000000000267 x2 : 0000000000000260
[    1.152731] x1 : fffffbfffe800000 x0 : 0000000000ffbffe
[    1.153135] Call trace:
[    1.153342]  logic_outb+0x3c/0xa8
[    1.153434]  mk712_init+0x74/0x1ec
[    1.153571]  do_one_initcall+0x54/0x1b8
[    1.153705]  kernel_init_freeable+0x1d0/0x238
[    1.153860]  kernel_init+0x14/0x118
[    1.153960]  ret_from_fork+0x10/0x30
[    1.154304] Code: d2bfd001 f2df7fe1 f2ffffe1 8b010273 (39000274)
[    1.155013] ---[ end trace f9b157c311d20edd ]---
[    1.155854] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.156236] SMP: stopping secondary CPUs

The driver is very old and resources are totally hardcoded, no bus model.
It seems the simplest way to fix this issue is disabling it by parameter.
If someone really needs the old driver, it should enable the parameter
by cmdline.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/input/touchscreen/mk712.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/mk712.c b/drivers/input/touchscreen/mk712.c
index 753d9cc1de1f..8a3110f27ce7 100644
--- a/drivers/input/touchscreen/mk712.c
+++ b/drivers/input/touchscreen/mk712.c
@@ -53,6 +53,9 @@ static unsigned int mk712_irq = 10;	/* Also 12, 14, 15 */
 module_param_hw_named(irq, mk712_irq, uint, irq, 0);
 MODULE_PARM_DESC(irq, "IRQ of MK712 touchscreen controller");
 
+static bool mk712_enabled;
+module_param(mk712_enabled, bool, 0);
+
 /* eight 8-bit registers */
 #define MK712_STATUS		0
 #define MK712_X			2
@@ -149,6 +152,11 @@ static int __init mk712_init(void)
 {
 	int err;
 
+	if (!mk712_enabled) {
+		printk(KERN_WARNING "mk712: device is not enabled\n");
+		return -ENODEV;
+	}
+
 	if (!request_region(mk712_io, 8, "mk712")) {
 		printk(KERN_WARNING "mk712: unable to get IO region\n");
 		return -ENODEV;
-- 
2.25.1

