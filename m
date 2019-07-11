Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0076618E
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 00:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbfGKWYM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jul 2019 18:24:12 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:55951 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbfGKWYL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jul 2019 18:24:11 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45l9Zb6403z1rHc5;
        Fri, 12 Jul 2019 00:24:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45l9Zb5R2Vz1qqkM;
        Fri, 12 Jul 2019 00:24:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id W07NU2zEfu0s; Fri, 12 Jul 2019 00:24:06 +0200 (CEST)
X-Auth-Info: ilMAOnk96P1oETPru4Sxq5W2w+RjhYF43r2Q9IOM4UM=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 12 Jul 2019 00:24:06 +0200 (CEST)
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2 1/3] mfd: mc13xxx: Add mc34708 adc support
Date:   Fri, 12 Jul 2019 00:23:44 +0200
Message-Id: <20190711222346.5245-2-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190711222346.5245-1-lukma@denx.de>
References: <20190711222346.5245-1-lukma@denx.de>
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
Changes for v2:
- Change the return code patch when the mc13xxx ADC is performing conversion
- Introduce new include/linux/mfd/mc34708.h header file for mc34708 specific
  defines

Changes from the original patches:
- ADC conversion functions prototypes added to fix build error
- Adjustments to make checkpatch clean (-ENOSYS, line over 80 char)

This patch applies on top of v5.2 - SHA1: 0ecfebd2b52404ae0c54a878c872bb93363ada36
---
 drivers/mfd/mc13xxx-core.c  | 102 +++++++++++++++++++++++++++++++++++++++++++-
 drivers/mfd/mc13xxx.h       |   3 ++
 include/linux/mfd/mc34708.h |  37 ++++++++++++++++
 3 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/mfd/mc34708.h

diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 1abe7432aad8..01473d6fda21 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/core.h>
+#include <linux/mfd/mc34708.h>
 
 #include "mc13xxx.h"
 
@@ -45,6 +46,8 @@
 
 #define MC13XXX_ADC2		45
 
+#define MC13XXX_ADC_WORKING		(1 << 0)
+
 void mc13xxx_lock(struct mc13xxx *mc13xxx)
 {
 	if (!mutex_trylock(&mc13xxx->lock)) {
@@ -198,22 +201,30 @@ static void mc34708_print_revision(struct mc13xxx *mc13xxx, u32 revision)
 			maskval(revision, MC34708_REVISION_FAB));
 }
 
+static int mc13xxx_adc_conversion(struct mc13xxx *, unsigned int,
+				  unsigned int, u8, bool, unsigned int *);
+static int mc34708_adc_conversion(struct mc13xxx *, unsigned int,
+				  unsigned int, u8, bool, unsigned int *);
+
 /* These are only exported for mc13xxx-i2c and mc13xxx-spi */
 struct mc13xxx_variant mc13xxx_variant_mc13783 = {
 	.name = "mc13783",
 	.print_revision = mc13xxx_print_revision,
+	.adc_do_conversion = mc13xxx_adc_conversion,
 };
 EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13783);
 
 struct mc13xxx_variant mc13xxx_variant_mc13892 = {
 	.name = "mc13892",
 	.print_revision = mc13xxx_print_revision,
+	.adc_do_conversion = mc13xxx_adc_conversion,
 };
 EXPORT_SYMBOL_GPL(mc13xxx_variant_mc13892);
 
 struct mc13xxx_variant mc13xxx_variant_mc34708 = {
 	.name = "mc34708",
 	.print_revision = mc34708_print_revision,
+	.adc_do_conversion = mc34708_adc_conversion,
 };
 EXPORT_SYMBOL_GPL(mc13xxx_variant_mc34708);
 
@@ -249,7 +260,7 @@ static irqreturn_t mc13xxx_handler_adcdone(int irq, void *data)
 
 #define MC13XXX_ADC_WORKING (1 << 0)
 
-int mc13xxx_adc_do_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
+static int mc13xxx_adc_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
 		unsigned int channel, u8 ato, bool atox,
 		unsigned int *sample)
 {
@@ -358,6 +369,95 @@ int mc13xxx_adc_do_conversion(struct mc13xxx *mc13xxx, unsigned int mode,
 
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
+	return mc13xxx->variant->adc_do_conversion(mc13xxx, mode, channel, ato,
+			atox, sample);
+}
 EXPORT_SYMBOL_GPL(mc13xxx_adc_do_conversion);
 
 static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
diff --git a/drivers/mfd/mc13xxx.h b/drivers/mfd/mc13xxx.h
index ce6eec52e8eb..0a79fbb8bcb4 100644
--- a/drivers/mfd/mc13xxx.h
+++ b/drivers/mfd/mc13xxx.h
@@ -19,6 +19,9 @@ struct mc13xxx;
 struct mc13xxx_variant {
 	const char *name;
 	void (*print_revision)(struct mc13xxx *mc13xxx, u32 revision);
+	int (*adc_do_conversion)(struct mc13xxx *mc13xxx, unsigned int mode,
+		unsigned int channel, u8 ato, bool atox,
+		unsigned int *sample);
 };
 
 extern struct mc13xxx_variant
diff --git a/include/linux/mfd/mc34708.h b/include/linux/mfd/mc34708.h
new file mode 100644
index 000000000000..c812104dc53d
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
2.11.0

