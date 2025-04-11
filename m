Return-Path: <linux-input+bounces-11739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0487A864AE
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 19:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA9AB1B86227
	for <lists+linux-input@lfdr.de>; Fri, 11 Apr 2025 17:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA102144AC;
	Fri, 11 Apr 2025 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="Cs2ZxRak"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1824A2367D0
	for <linux-input@vger.kernel.org>; Fri, 11 Apr 2025 17:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.21.196.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392292; cv=none; b=EtasX5rMemdGc3N1HrQZxP6wgS7pK/JyDDbRd7nYdVJn+h7kFqluLTvYIsYYcmtRSO7pwk8Q5D1nxugjvlzkctajsA2GH87pFejwtdoZIscKKPW1GjNlY63RwfDgcypeehipU69mX4M02LYoBZGtoIRviQ6egACo8EQ12uKvze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392292; c=relaxed/simple;
	bh=6pijVuiBPgQKDhrsoEAgdpkpsguz619NbfyTr5/svMM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r2j/37SxqvYuijkN0/3E06kVfbNY2ZB4LUILGCBjlRxY5xg+Yi8WNQsmlTcZHaPPfH+vl71wf/qEuuw2lTiNvT3vmkl7++gb77wI+3CTrT3HYaOXfZkW6kbe3H9pkgX8wMAHfJQU9pBEDoWaQ/xa0j+mzrP8HsHqiBVusBX+G2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=Cs2ZxRak; arc=none smtp.client-ip=72.21.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1744392291; x=1775928291;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gS1ItCL18FzBhTcRvyxwTEmEIdWPsDwlyJMpqJ3jd8s=;
  b=Cs2ZxRakCqf9zrfZudJ67Oa7aJ2KYtFvg0RnbZJDT2dselY/ENsGh3hD
   IjLd2+Bf3xgksxeiW7IiHimPjvoHkFWDnBOj3y8AsKENumOVU4ly8PcQz
   JDfo6jrXmFRo/pRhob5gIG09jIP56HdWtgmWXqA+NfWF3SaSxErV0RhcY
   c=;
X-IronPort-AV: E=Sophos;i="6.15,205,1739836800"; 
   d="scan'208";a="482371704"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 17:24:48 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:61186]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.57:2525] with esmtp (Farcaster)
 id 88ecf21d-3013-4244-8396-8b7c81b666b0; Fri, 11 Apr 2025 17:24:47 +0000 (UTC)
X-Farcaster-Flow-ID: 88ecf21d-3013-4244-8396-8b7c81b666b0
Received: from EX19D005ANA003.ant.amazon.com (10.37.240.150) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 11 Apr 2025 17:24:46 +0000
Received: from dev-dsk-wentongw-2c-56b4cf5c.us-west-2.amazon.com
 (10.189.228.83) by EX19D005ANA003.ant.amazon.com (10.37.240.150) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Fri, 11 Apr 2025
 17:24:44 +0000
From: Wentong Wu <wentongw@amazon.com>
To: <dmitry.torokhov@gmail.com>, <sakari.ailus@linux.intel.com>
CC: <linux-input@vger.kernel.org>, Calvin Fang <fangtianwen@huaqin.com>
Subject: [PATCH 1/1] input: misc: Add as1895 hall sensor driver
Date: Fri, 11 Apr 2025 17:23:56 +0000
Message-ID: <20250411172410.25406-1-wentongw@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWB001.ant.amazon.com (10.13.139.152) To
 EX19D005ANA003.ant.amazon.com (10.37.240.150)

The as1895 is designed for omnipolar detection hall-effect
application, such as cover switch, contactless switch, solid
state switch and lid close sensor etc battery operation.

When the magnetic flux density (B) is larger than operate
point (BOP), the output will be turned on (low), the output
is held until the magnetic flux density (B) is lower than
release point (BRP), then turn off (high). And the connected
GPIO will trigger interrupts to CPU according to the output
change of as1895.

This driver reports the magnetic field change of as1895 via
input subsystem to notify user space system suspend/resume
status. It can alse report the state change to the external
connectors via the Extcon (External Connector) subsystem.

Tested-by: Calvin Fang <fangtianwen@huaqin.com>
Signed-off-by: Wentong Wu <wentongw@amazon.com>
---
 drivers/input/misc/Kconfig  |   9 ++
 drivers/input/misc/Makefile |   1 +
 drivers/input/misc/as1895.c | 193 ++++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+)
 create mode 100644 drivers/input/misc/as1895.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 6a852c76331b..6ba26052354b 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -956,4 +956,13 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_AS1895
+	tristate "AS1895 hall sensor support"
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say Y here if you have a as1895 hall sensor connected to a GPIO pin.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called as1895.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 4f7f736831ba..38b364a6c8c1 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -92,3 +92,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
 obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
 obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
 obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
+obj-$(CONFIG_INPUT_AS1895)		+= as1895.o
diff --git a/drivers/input/misc/as1895.c b/drivers/input/misc/as1895.c
new file mode 100644
index 000000000000..d87318f1bda4
--- /dev/null
+++ b/drivers/input/misc/as1895.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ */
+
+#include <linux/extcon-provider.h>
+#include <linux/gpio.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_wakeup.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/* Timeout value for processing the wakeup event */
+#define AS1895_WAKEUP_TIMEOUT_MS 100
+
+#define AS1895_DRV_NAME "AMZN-AS1895"
+
+struct as1895_dev {
+	struct input_dev *input;
+	struct extcon_dev *edev;
+	struct wakeup_source *ws;
+
+	/* the connected gpio pin number */
+	int gpio_pin;
+	int irq;
+};
+
+static const unsigned int as1895_cable[] = {
+	EXTCON_MECHANICAL,
+	EXTCON_NONE,
+};
+
+static irqreturn_t as1895_irq_thread_handler(int irq, void *data)
+{
+	struct as1895_dev *as1895 = (struct as1895_dev *)data;
+	struct input_dev *input = as1895->input;
+	int gpio_val;
+
+	/* allow user space to consume the event */
+	__pm_wakeup_event(as1895->ws, AS1895_WAKEUP_TIMEOUT_MS);
+
+	gpio_val = gpio_get_value(as1895->gpio_pin);
+
+	extcon_set_state_sync(as1895->edev, EXTCON_MECHANICAL,
+			      gpio_val ? false : true);
+
+	input_report_switch(input, SW_LID, !gpio_val);
+
+	input_sync(input);
+
+	return IRQ_HANDLED;
+}
+
+static int as1895_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct as1895_dev *as1895;
+	unsigned long irqflags;
+	int ret, gpio_pin;
+	const char *name;
+
+	ret = of_property_read_string(node, "name", &name);
+	if (ret)
+		return ret;
+
+	gpio_pin = of_get_named_gpio(node, "int-gpio", 0);
+	if (!gpio_is_valid(gpio_pin))
+		return -EINVAL;
+
+	as1895 = devm_kzalloc(dev, sizeof(struct as1895_dev), GFP_KERNEL);
+	if (!as1895)
+		return -ENOMEM;
+
+	as1895->edev = devm_extcon_dev_allocate(dev, as1895_cable);
+	if (IS_ERR(as1895->edev))
+		return -ENOMEM;
+
+	/* register extcon device */
+	ret = devm_extcon_dev_register(dev, as1895->edev);
+	if (ret) {
+		dev_err(dev, "can't register extcon device: %d\n", ret);
+		return ret;
+	}
+
+	as1895->input = devm_input_allocate_device(dev);
+	if (!as1895->input)
+		return -ENOMEM;
+
+	as1895->input->name = name;
+	set_bit(EV_SW, as1895->input->evbit);
+	set_bit(SW_LID, as1895->input->swbit);
+
+	/* register input device */
+	ret = input_register_device(as1895->input);
+	if (ret) {
+		dev_err(dev, "can't register input device: %d\n", ret);
+		return ret;
+	}
+
+	as1895->ws = wakeup_source_register(NULL, name);
+	if (!as1895->ws)
+		return -ENOMEM;
+
+	as1895->gpio_pin = gpio_pin;
+	as1895->irq = gpio_to_irq(gpio_pin);
+
+	irqflags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
+
+	ret = request_threaded_irq(as1895->irq, NULL,
+				   as1895_irq_thread_handler,
+				   irqflags, name, as1895);
+	if (ret)
+		goto err_unregister_ws;
+
+	platform_set_drvdata(pdev, as1895);
+
+	device_init_wakeup(dev, true);
+
+	return 0;
+
+err_unregister_ws:
+	wakeup_source_unregister(as1895->ws);
+
+	return ret;
+}
+
+static void as1895_remove(struct platform_device *pdev)
+{
+	struct as1895_dev *as1895 = platform_get_drvdata(pdev);
+
+	device_init_wakeup(&pdev->dev, false);
+
+	free_irq(as1895->irq, as1895);
+
+	wakeup_source_unregister(as1895->ws);
+}
+
+static int as1895_suspend(struct device *dev)
+{
+	struct as1895_dev *as1895 = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(as1895->irq);
+
+	return 0;
+}
+
+static int as1895_resume(struct device *dev)
+{
+	struct as1895_dev *as1895 = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(as1895->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(as1895_pm_ops, as1895_suspend, as1895_resume);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id as1895_of_match[] = {
+	{ .compatible = "amazon,as1895-hall-sensor" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, as1895_of_match);
+#endif
+
+static struct platform_driver as1895_driver = {
+	.probe = as1895_probe,
+	.remove = as1895_remove,
+	.driver = {
+		.name = AS1895_DRV_NAME,
+		.pm = pm_sleep_ptr(&as1895_pm_ops),
+		.of_match_table = of_match_ptr(as1895_of_match),
+	}
+};
+
+module_platform_driver(as1895_driver);
+
+MODULE_AUTHOR("Wentong Wu <wentongw@amazon.com>");
+MODULE_AUTHOR("Zengjin Zhao <zzengjin@amazon.com>");
+MODULE_AUTHOR("Xinkai Liu <xinka@amazon.com>");
+MODULE_AUTHOR("Weihua Wu <wuweihua@amazon.com>");
+MODULE_DESCRIPTION("Amazon as1895 hall sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.47.1


