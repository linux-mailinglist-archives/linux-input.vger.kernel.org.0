Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB291133FEE
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 12:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgAHLLE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 06:11:04 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42265 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbgAHLLD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jan 2020 06:11:03 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip9Ei-0003Uw-Tn; Wed, 08 Jan 2020 12:10:52 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip9Eh-0005TU-6q; Wed, 08 Jan 2020 12:10:51 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, mripard@kernel.org,
        alexandre.belloni@bootlin.com, shawnguo@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v3 2/6] Input: edt-ft5x06 - alphabetical include reorder
Date:   Wed,  8 Jan 2020 12:10:46 +0100
Message-Id: <20200108111050.19001-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108111050.19001-1-m.felsch@pengutronix.de>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It seems that the include order is historical increased and no one takes
care of it. Fix this to align it with the common rule to be in a
alphabetical order.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index b87b1e074f62..e1b31fd525e2 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -13,22 +13,23 @@
  *    http://www.glyn.com/Products/Displays
  */
 
-#include <linux/module.h>
-#include <linux/ratelimit.h>
-#include <linux/irq.h>
-#include <linux/interrupt.h>
-#include <linux/input.h>
-#include <linux/i2c.h>
-#include <linux/kernel.h>
-#include <linux/uaccess.h>
-#include <linux/delay.h>
 #include <linux/debugfs.h>
-#include <linux/slab.h>
+#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
-#include <asm/unaligned.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/ratelimit.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#include <asm/unaligned.h>
 
 #define WORK_REGISTER_THRESHOLD		0x00
 #define WORK_REGISTER_REPORT_RATE	0x08
-- 
2.20.1

