Return-Path: <linux-input+bounces-14319-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C10B2B366A9
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 15:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C41E580BCF
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 13:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A05734AB0D;
	Tue, 26 Aug 2025 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEhvkCKa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548193469E3;
	Tue, 26 Aug 2025 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216002; cv=none; b=q9x3ZGVKI+/+1Rq3JbWNl1dJsY+pRwnRYBgWgGSpiGjWXFQof0NUQlth2/A1APG9G9RbAVMB5Y+Qf4eAFzuveZ3B9B3IcfnxLAcjt3QNlmDZfzDyaGyMpGGlQ4bxLUrUTEGxPX2ULY++ymRIqn/NlNGc4o2g7/F6/Zuil+NiyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216002; c=relaxed/simple;
	bh=e8tqXpBe33EP37rpAKaiTY6qWMS6bARYy+kyi3t+lnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qD3gNmlSWZ2Jr/p7f2seHCYEppteN/5y5krNDzktLsS/AR4dsP28cYs3sxahSXgt31yIvUR6JWoC3v1ogTHLcXN61TJPevDW9sat6MaoieonqTOFPt1O6BAECbdBBFzXYFvxkmHpisjjFYqknHRv5fBcEtE3i59HqLzfXxTcZDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEhvkCKa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6865C4CEF1;
	Tue, 26 Aug 2025 13:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756216002;
	bh=e8tqXpBe33EP37rpAKaiTY6qWMS6bARYy+kyi3t+lnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YEhvkCKaKTv/Vl3Yqacw8rRUCtGD3W9ueOe2xsKjJUInh5VtZfAoEbIEHYEX/mVRu
	 Bru2JfpnaMAw/Pgzi1GuMrz9QbJcC4fwuTy/yH1LAsLlbsnLNoB3Loiy4h7rxGcfqf
	 tM8HXJ+xmEpXYFWwphcJ/T+GKTT9kSCNVycHmDTGcmdedjZLFj9HbpIykvpkmxZHkL
	 8ogKp8Hs7eCKhhLiVrY1xYZ9dhQ/vvM7+kIYyj7olqO+2plJFa+i1gxy4Vj4QA8BU0
	 hxJ+IPDV1+kBXuE+L5dcwVM7pNwobSdrkZVE3kk1r1QNHqM/lGKdNLzrUYBCN1r9wC
	 B0tlAnJ+r302A==
From: Michael Walle <mwalle@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: jcormier@criticallink.com,
	Job Sava <jsava@criticallink.com>,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 1/3] input: tps6594-pwrbutton: Add power button functionality
Date: Tue, 26 Aug 2025 15:46:29 +0200
Message-Id: <20250826134631.1499936-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250826134631.1499936-1-mwalle@kernel.org>
References: <20250826134631.1499936-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Job Sava <jsava@criticallink.com>

TPS6594 defines two interrupts for the power button one for push and
one for release.

This driver is very simple in that it maps the push interrupt to a key
input and the release interrupt to a key release.

Signed-off-by: Job Sava <jsava@criticallink.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v2:
 - moved the mfd part into a seperate patch
---
 drivers/input/misc/Kconfig             |  10 ++
 drivers/input/misc/Makefile            |   1 +
 drivers/input/misc/tps6594-pwrbutton.c | 126 +++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 drivers/input/misc/tps6594-pwrbutton.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0fb21c99a5e3..cce51358242f 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -506,6 +506,16 @@ config INPUT_TPS65219_PWRBUTTON
 	  To compile this driver as a module, choose M here. The module will
 	  be called tps65219-pwrbutton.
 
+config INPUT_TPS6594_PWRBUTTON
+	tristate "TPS6594 Power button driver"
+	depends on MFD_TPS6594
+	help
+	  Say Y here if you want to enable power button reporting for
+	  TPS6594 Power Management IC devices.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called tps6594-pwrbutton.
+
 config INPUT_AXP20X_PEK
 	tristate "X-Powers AXP20X power button driver"
 	depends on MFD_AXP20X
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index d468c8140b93..bb12f883851c 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_INPUT_SPARCSPKR)		+= sparcspkr.o
 obj-$(CONFIG_INPUT_STPMIC1_ONKEY)  	+= stpmic1_onkey.o
 obj-$(CONFIG_INPUT_TPS65218_PWRBUTTON)	+= tps65218-pwrbutton.o
 obj-$(CONFIG_INPUT_TPS65219_PWRBUTTON)	+= tps65219-pwrbutton.o
+obj-$(CONFIG_INPUT_TPS6594_PWRBUTTON)	+= tps6594-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL4030_PWRBUTTON)	+= twl4030-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL4030_VIBRA)	+= twl4030-vibra.o
 obj-$(CONFIG_INPUT_TWL6040_VIBRA)	+= twl6040-vibra.o
diff --git a/drivers/input/misc/tps6594-pwrbutton.c b/drivers/input/misc/tps6594-pwrbutton.c
new file mode 100644
index 000000000000..cd039b3866dc
--- /dev/null
+++ b/drivers/input/misc/tps6594-pwrbutton.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * power button driver for TI TPS6594 PMICs
+ *
+ * Copyright (C) 2025 Critical Link LLC - https://www.criticallink.com/
+ */
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps6594.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+struct tps6594_pwrbutton {
+	struct device *dev;
+	struct input_dev *idev;
+	char phys[32];
+};
+
+static irqreturn_t tps6594_pb_push_irq(int irq, void *_pwr)
+{
+	struct tps6594_pwrbutton *pwr = _pwr;
+
+	input_report_key(pwr->idev, KEY_POWER, 1);
+	pm_wakeup_event(pwr->dev, 0);
+	input_sync(pwr->idev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t tps6594_pb_release_irq(int irq, void *_pwr)
+{
+	struct tps6594_pwrbutton *pwr = _pwr;
+
+	input_report_key(pwr->idev, KEY_POWER, 0);
+	input_sync(pwr->idev);
+
+	return IRQ_HANDLED;
+}
+
+static int tps6594_pb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tps6594_pwrbutton *pwr;
+	struct input_dev *idev;
+	int error;
+	int push_irq;
+	int release_irq;
+
+	pwr = devm_kzalloc(dev, sizeof(*pwr), GFP_KERNEL);
+	if (!pwr)
+		return -ENOMEM;
+
+	idev = devm_input_allocate_device(dev);
+	if (!idev)
+		return -ENOMEM;
+
+	idev->name = pdev->name;
+	snprintf(pwr->phys, sizeof(pwr->phys), "%s/input0",
+		 pdev->name);
+	idev->phys = pwr->phys;
+	idev->id.bustype = BUS_I2C;
+
+	input_set_capability(idev, EV_KEY, KEY_POWER);
+
+	pwr->dev = dev;
+	pwr->idev = idev;
+	device_init_wakeup(dev, true);
+
+	push_irq = platform_get_irq(pdev, 0);
+	if (push_irq < 0)
+		return -EINVAL;
+
+	release_irq = platform_get_irq(pdev, 1);
+	if (release_irq < 0)
+		return -EINVAL;
+
+	error = devm_request_threaded_irq(dev, push_irq, NULL,
+					  tps6594_pb_push_irq,
+					  IRQF_ONESHOT,
+					  pdev->resource[0].name, pwr);
+	if (error) {
+		dev_err(dev, "failed to request push IRQ #%d: %d\n", push_irq,
+			error);
+		return error;
+	}
+
+	error = devm_request_threaded_irq(dev, release_irq, NULL,
+					  tps6594_pb_release_irq,
+					  IRQF_ONESHOT,
+					  pdev->resource[1].name, pwr);
+	if (error) {
+		dev_err(dev, "failed to request release IRQ #%d: %d\n",
+			release_irq, error);
+		return error;
+	}
+
+	error = input_register_device(idev);
+	if (error) {
+		dev_err(dev, "Can't register power button: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id tps6594_pwrbtn_id_table[] = {
+	{ "tps6594-pwrbutton", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, tps6594_pwrbtn_id_table);
+
+static struct platform_driver tps6594_pb_driver = {
+	.probe = tps6594_pb_probe,
+	.driver = {
+		.name = "tps6594_pwrbutton",
+	},
+	.id_table = tps6594_pwrbtn_id_table,
+};
+module_platform_driver(tps6594_pb_driver);
+
+MODULE_DESCRIPTION("TPS6594 Power Button");
+MODULE_LICENSE("GPL");
-- 
2.39.5


