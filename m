Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E82DAE05B
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2019 23:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391875AbfIIVpE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Sep 2019 17:45:04 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:49938 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbfIIVpE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Sep 2019 17:45:04 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46S1sn3hK8z1rJh3;
        Mon,  9 Sep 2019 23:45:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46S1sn30ypz1qqkC;
        Mon,  9 Sep 2019 23:45:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Uo1AXD3odEqt; Mon,  9 Sep 2019 23:45:00 +0200 (CEST)
X-Auth-Info: VL31DBZpNe6DmaUfr/0ypzHC8ZIDIaos77vCW/vqn44=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  9 Sep 2019 23:45:00 +0200 (CEST)
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v5 1/3] mfd: mc13xxx: Add mc34708 adc support
Date:   Mon,  9 Sep 2019 23:44:38 +0200
Message-Id: <20190909214440.30674-2-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190909214440.30674-1-lukma@denx.de>
References: <20190909214440.30674-1-lukma@denx.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sascha Hauer <s.hauer@pengutronix.de>

The mc34708 has an improved adc. The older variants will always convert
a fixed order of channels. The mc34708 can do up to eight conversions
in arbitrary channel order. Currently this extended feature is not
supported. We only support touchscreen conversions now, which will
be sampled in a data format compatible to the older chips in order
to keep the API between the mfd and the touchscreen driver.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v5:
- Remove adc_do_conversion() callbacks from struct mc13xxx_variant
- Remove duplicated MC13XXX_ADC_WORKING #define

Changes for v4:
- None

Changes for v3:
- None

Changes for v2:
- Change the return code patch when the mc13xxx ADC is performing conversion
- Introduce new include/linux/mfd/mc34708.h header file for mc34708 specific
  defines

Changes from the original patches:
- ADC conversion functions prototypes added to fix build error
- Adjustments to make checkpatch clean (-ENOSYS, line over 80 char)

This patch applies on top of Linux 5.3-rc8
SHA1: f74c2bb98776e2de508f4d607cd519873065118e
---
 drivers/mfd/mc13xxx-core.c  | 98 ++++++++++++++++++++++++++++++++++++-
 include/linux/mfd/mc34708.h | 37 ++++++++++++++
 2 files changed, 133 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/mfd/mc34708.h

diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 1abe7432aad8..b64c62366517 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/core.h>
+#include <linux/mfd/mc34708.h>
 
 #include "mc13xxx.h"
 
@@ -247,9 +248,9 @@ static irqreturn_t mc13xxx_handler_adcdone(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-#define MC13XXX_ADC_WORKING (1 << 0)
+#define MC13XXX_ADC_WORKING BIT(0)
 
-int mc13xxx_adc_do_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
+static int mc13xxx_adc_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
 		unsigned int channel, u8 ato, bool atox,
 		unsigned int *sample)
 {
@@ -358,6 +359,99 @@ int mc13xxx_adc_do_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
 
 	return ret;
 }
+
+static int mc34708_adc_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
+		unsigned int channel, u8 ato, bool atox,
+		unsigned int *sample)
+{
+	int ret, i;
+	u32 adc0, adc3, adc1, old_adc0;
+	struct mc13xxx_adcdone_data adcdone_data = {
+		.mc13xxx = mc13xxx,
+	};
+
+	switch (mode) {
+	case MC13XXX_ADC_MODE_TS:
+		adc0 = MC34708_ADC0_TSEN | MC34708_ADC0_TSSTART |
+			MC34708_ADC0_TSSTOP(7);
+
+		adc1 = MC34708_ADC1_TSDLY1(0xf) |
+			MC34708_ADC1_TSDLY2(0xf) |
+			MC34708_ADC1_TSDLY3(0xf);
+
+		adc3 = MC34708_ADC3_TSSEL(0, MC34708_TS_X) |
+			MC34708_ADC3_TSSEL(1, MC34708_TS_Y) |
+			MC34708_ADC3_TSSEL(2, MC34708_TS_X) |
+			MC34708_ADC3_TSSEL(3, MC34708_TS_Y) |
+			MC34708_ADC3_TSSEL(4, MC34708_TS_X) |
+			MC34708_ADC3_TSSEL(5, MC34708_TS_R) |
+			MC34708_ADC3_TSSEL(6, MC34708_TS_Y) |
+			MC34708_ADC3_TSSEL(7, MC34708_TS_R);
+		break;
+
+	case MC13XXX_ADC_MODE_SINGLE_CHAN:
+	case MC13XXX_ADC_MODE_MULT_CHAN:
+	default:
+		return -EINVAL;
+	}
+
+	init_completion(&adcdone_data.done);
+
+	mc13xxx_lock(mc13xxx);
+
+	if (mc13xxx->adcflags & MC13XXX_ADC_WORKING) {
+		mc13xxx_unlock(mc13xxx);
+		return -EBUSY;
+	}
+
+	mc13xxx->adcflags |= MC13XXX_ADC_WORKING;
+
+	mc13xxx_reg_read(mc13xxx, MC13XXX_ADC0, &old_adc0);
+
+	mc13xxx_irq_request(mc13xxx, MC34708_IRQ_TSDONE,
+			mc13xxx_handler_adcdone, __func__, &adcdone_data);
+	mc13xxx_irq_ack(mc13xxx, MC34708_IRQ_TSDONE);
+
+	mc13xxx_reg_write(mc13xxx, MC34708_ADC3, adc3);
+	mc13xxx_reg_write(mc13xxx, MC13XXX_ADC1, adc1);
+	mc13xxx_reg_write(mc13xxx, MC13XXX_ADC0, adc0);
+
+	mc13xxx_unlock(mc13xxx);
+
+	ret = wait_for_completion_interruptible_timeout(&adcdone_data.done, HZ);
+
+	mc13xxx_lock(mc13xxx);
+
+	mc13xxx_irq_free(mc13xxx, MC34708_IRQ_TSDONE, &adcdone_data);
+
+	if (!ret) {
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	for (i = 0; i < 4; i++)
+		mc13xxx_reg_read(mc13xxx, MC34708_ADC4 + i, &sample[i]);
+
+out:
+	ret = mc13xxx_reg_write(mc13xxx, MC13XXX_ADC0, old_adc0);
+
+	mc13xxx->adcflags &= ~MC13XXX_ADC_WORKING;
+	mc13xxx_unlock(mc13xxx);
+
+	return ret;
+}
+
+int mc13xxx_adc_do_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
+		unsigned int channel, u8 ato, bool atox,
+		unsigned int *sample)
+{
+	if (!strcmp(mc13xxx_get_chipname(mc13xxx), "mc34708"))
+		return mc34708_adc_conversion(mc13xxx, mode, channel, ato,
+					      atox, sample);
+	else
+		return mc13xxx_adc_conversion(mc13xxx, mode, channel, ato,
+					      atox, sample);
+}
 EXPORT_SYMBOL_GPL(mc13xxx_adc_do_conversion);
 
 static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
diff --git a/include/linux/mfd/mc34708.h b/include/linux/mfd/mc34708.h
new file mode 100644
index 000000000000..536e133f4f97
--- /dev/null
+++ b/include/linux/mfd/mc34708.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019
+ * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
+ */
+#ifndef __LINUX_MFD_MC34708_H
+#define __LINUX_MFD_MC34708_H
+
+#define MC34708_ADC3			46
+#define MC34708_ADC4			47
+
+#define MC34708_IRQ_TSDONE		1
+
+#define MC34708_ADC0_TSEN		BIT(12)
+#define MC34708_ADC0_TSSTART		BIT(13)
+#define MC34708_ADC0_TSCONT		BIT(14)
+#define MC34708_ADC0_TSHOLD		BIT(15)
+#define MC34708_ADC0_TSPENDETEN		BIT(20)
+
+#define MC34708_ADC0_TSMASK            (MC34708_ADC0_TSPENDETEN | \
+					MC34708_ADC0_TSEN |       \
+					MC34708_ADC0_TSSTART |    \
+					MC34708_ADC0_TSCONT |     \
+					MC34708_ADC0_TSHOLD)
+
+#define MC34708_ADC0_TSSTOP(x)		(((x) & 0x7) << 16)
+
+#define MC34708_ADC3_TSSEL(step, ch)	((ch) << (8 + 2 * (step)))
+#define MC34708_ADC1_TSDLY1(d)		((d) << 12)
+#define MC34708_ADC1_TSDLY2(d)		((d) << 16)
+#define MC34708_ADC1_TSDLY3(d)		((d) << 20)
+
+#define MC34708_TS_X			1
+#define MC34708_TS_Y			2
+#define MC34708_TS_R			3
+
+#endif /* __LINUX_MFD_MC34708_H */
-- 
2.20.1

