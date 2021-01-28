Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC679308163
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 23:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhA1WmL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 17:42:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11615 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbhA1WmI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 17:42:08 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DRb5R4ctyz1612C;
        Fri, 29 Jan 2021 06:40:11 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.74) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 06:41:14 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <tglx@linutronix.de>, <dmitry.torokhov@gmail.com>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v4 01/12] genirq: add IRQF_NO_AUTOEN for request_irq
Date:   Fri, 29 Jan 2021 11:35:27 +1300
Message-ID: <20210128223538.20272-2-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20210128223538.20272-1-song.bao.hua@hisilicon.com>
References: <20210128223538.20272-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.203.74]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Many drivers don't want interrupts enabled automatically due to
request_irq(). So they are handling this issue by either way of
the below two:
(1)
irq_set_status_flags(irq, IRQ_NOAUTOEN);
request_irq(dev, irq...);
(2)
request_irq(dev, irq...);
disable_irq(irq);

The code in the second way is silly and unsafe. In the small time
gap between request_irq() and disable_irq(), interrupts can still
come.
The code in the first way is safe though we might be able to do it
in the generic irq code.

With this patch, drivers can request_irq with IRQF_NO_AUTOEN flag.
They will need neither irq_set_status_flags() nor disable_irq().
Hundreds of drivers with this problem will be handled afterwards.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 -v4: remove the irq_settings magic for NOAUTOEN

 include/linux/interrupt.h | 3 +++
 kernel/irq/manage.c       | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index bb8ff9083e7d..0f22d277078c 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -61,6 +61,8 @@
  *                interrupt handler after suspending interrupts. For system
  *                wakeup devices users need to implement wakeup detection in
  *                their interrupt handlers.
+ * IRQF_NO_AUTOEN - Don't enable IRQ automatically when users request it. Users
+ *                will enable it explicitly by enable_irq() later.
  */
 #define IRQF_SHARED		0x00000080
 #define IRQF_PROBE_SHARED	0x00000100
@@ -74,6 +76,7 @@
 #define IRQF_NO_THREAD		0x00010000
 #define IRQF_EARLY_RESUME	0x00020000
 #define IRQF_COND_SUSPEND	0x00040000
+#define IRQF_NO_AUTOEN		0x00080000
 
 #define IRQF_TIMER		(__IRQF_TIMER | IRQF_NO_SUSPEND | IRQF_NO_THREAD)
 
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index dec3f73e8db9..95014073bd2e 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1693,7 +1693,8 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
 		}
 
-		if (irq_settings_can_autoenable(desc)) {
+		if (!(new->flags & IRQF_NO_AUTOEN) &&
+		    irq_settings_can_autoenable(desc)) {
 			irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
 		} else {
 			/*
@@ -2086,10 +2087,15 @@ int request_threaded_irq(unsigned int irq, irq_handler_t handler,
 	 * which interrupt is which (messes up the interrupt freeing
 	 * logic etc).
 	 *
+	 * Also shared interrupts do not go well with disabling auto enable.
+	 * The sharing interrupt might request it while it's still disabled
+	 * and then wait for interrupts forever.
+	 *
 	 * Also IRQF_COND_SUSPEND only makes sense for shared interrupts and
 	 * it cannot be set along with IRQF_NO_SUSPEND.
 	 */
 	if (((irqflags & IRQF_SHARED) && !dev_id) ||
+	    ((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN)) ||
 	    (!(irqflags & IRQF_SHARED) && (irqflags & IRQF_COND_SUSPEND)) ||
 	    ((irqflags & IRQF_NO_SUSPEND) && (irqflags & IRQF_COND_SUSPEND)))
 		return -EINVAL;
-- 
2.25.1

