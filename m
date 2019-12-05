Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E54E1138C2
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 01:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbfLEAZe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 19:25:34 -0500
Received: from onstation.org ([52.200.56.107]:54120 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbfLEAZM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Dec 2019 19:25:12 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C365E538A7;
        Thu,  5 Dec 2019 00:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1575505511;
        bh=i7HkDH1ZfxsGM5BNLmjhyt/xFiuhPUyxkAFjQ/5kcvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SMkq0c/v6VrHRvEm6ciVXDbp3+wcS9h6J2YrYww+vuguN/w4rgJlEc49fmeNHHAwD
         DzW+3BB6qLTsdsCeXsDvPx4IPhGrOz/fIcBPUJQ0WJ5C4Wj6EDu/LmPvgUmDkjnsXr
         b9OSmrbC0zjFlDpXS0fEKVT+TYKBpWnotHyNBr4U=
From:   Brian Masney <masneyb@onstation.org>
To:     sboyd@kernel.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 5/7] Input: introduce new clock vibrator driver
Date:   Wed,  4 Dec 2019 19:25:01 -0500
Message-Id: <20191205002503.13088-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205002503.13088-1-masneyb@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for clock-based vibrator devices where the speed can be
controlled by changing the duty cycle.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/input/misc/Kconfig        |  10 ++
 drivers/input/misc/Makefile       |   1 +
 drivers/input/misc/clk-vibrator.c | 245 ++++++++++++++++++++++++++++++
 3 files changed, 256 insertions(+)
 create mode 100644 drivers/input/misc/clk-vibrator.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index b56da7a5efb9..8c95b927bce6 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -425,6 +425,16 @@ config INPUT_YEALINK
 	  To compile this driver as a module, choose M here: the module will be
 	  called yealink.
 
+config INPUT_CLK_VIBRATOR
+	tristate "Clock vibrator driver"
+	select INPUT_FF_MEMLESS
+	help
+	  Support for clock-based vibrator devices where the speed can be
+	  controlled by changing the duty cycle.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called clk_vibrator.
+
 config INPUT_CM109
 	tristate "C-Media CM109 USB I/O Controller"
 	depends on USB_ARCH_HAS_HCD
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index e6768b61a955..ca8a33cd91a5 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_INPUT_ATI_REMOTE2)		+= ati_remote2.o
 obj-$(CONFIG_INPUT_ATLAS_BTNS)		+= atlas_btns.o
 obj-$(CONFIG_INPUT_ATMEL_CAPTOUCH)	+= atmel_captouch.o
 obj-$(CONFIG_INPUT_BMA150)		+= bma150.o
+obj-$(CONFIG_INPUT_CLK_VIBRATOR)	+= clk-vibrator.o
 obj-$(CONFIG_INPUT_CM109)		+= cm109.o
 obj-$(CONFIG_INPUT_CMA3000)		+= cma3000_d0x.o
 obj-$(CONFIG_INPUT_CMA3000_I2C)		+= cma3000_d0x_i2c.o
diff --git a/drivers/input/misc/clk-vibrator.c b/drivers/input/misc/clk-vibrator.c
new file mode 100644
index 000000000000..71b7bd0f9b42
--- /dev/null
+++ b/drivers/input/misc/clk-vibrator.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Clock vibrator driver
+ *
+ * Copyright (c) 2019 Brian Masney <masneyb@onstation.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/input.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+struct clk_vibrator {
+	struct input_dev *input;
+	struct mutex mutex;
+	struct work_struct worker;
+	struct regulator *vcc;
+	struct clk *clk;
+	u32 clk_rate;
+	struct gpio_desc *enable_gpio;
+	u16 magnitude;
+	bool enabled;
+};
+
+static int clk_vibrator_start(struct clk_vibrator *vibrator)
+{
+	int ret;
+
+	mutex_lock(&vibrator->mutex);
+
+	if (!vibrator->enabled) {
+		ret = clk_set_rate(vibrator->clk, vibrator->clk_rate);
+		if (ret) {
+			dev_err(&vibrator->input->dev,
+				"Failed to set clock rate: %d\n", ret);
+			goto unlock;
+		}
+
+		ret = clk_prepare_enable(vibrator->clk);
+		if (ret) {
+			dev_err(&vibrator->input->dev,
+				"Failed to enable clock: %d\n", ret);
+			goto unlock;
+		}
+
+		ret = regulator_enable(vibrator->vcc);
+		if (ret) {
+			dev_err(&vibrator->input->dev,
+				"Failed to enable regulator: %d\n", ret);
+			clk_disable(vibrator->clk);
+			goto unlock;
+		}
+
+		gpiod_set_value_cansleep(vibrator->enable_gpio, 1);
+
+		vibrator->enabled = true;
+	}
+
+	ret = clk_set_duty_cycle(vibrator->clk, vibrator->magnitude, 0xffff);
+
+unlock:
+	mutex_unlock(&vibrator->mutex);
+
+	return ret;
+}
+
+static void clk_vibrator_stop(struct clk_vibrator *vibrator)
+{
+	mutex_lock(&vibrator->mutex);
+
+	if (vibrator->enabled) {
+		gpiod_set_value_cansleep(vibrator->enable_gpio, 0);
+		regulator_disable(vibrator->vcc);
+		clk_disable(vibrator->clk);
+		vibrator->enabled = false;
+	}
+
+	mutex_unlock(&vibrator->mutex);
+}
+
+static void clk_vibrator_worker(struct work_struct *work)
+{
+	struct clk_vibrator *vibrator = container_of(work,
+						     struct clk_vibrator,
+						     worker);
+
+	if (vibrator->magnitude)
+		clk_vibrator_start(vibrator);
+	else
+		clk_vibrator_stop(vibrator);
+}
+
+static int clk_vibrator_play_effect(struct input_dev *dev, void *data,
+				    struct ff_effect *effect)
+{
+	struct clk_vibrator *vibrator = input_get_drvdata(dev);
+
+	mutex_lock(&vibrator->mutex);
+
+	if (effect->u.rumble.strong_magnitude > 0)
+		vibrator->magnitude = effect->u.rumble.strong_magnitude;
+	else
+		vibrator->magnitude = effect->u.rumble.weak_magnitude;
+
+	mutex_unlock(&vibrator->mutex);
+
+	schedule_work(&vibrator->worker);
+
+	return 0;
+}
+
+static void clk_vibrator_close(struct input_dev *input)
+{
+	struct clk_vibrator *vibrator = input_get_drvdata(input);
+
+	cancel_work_sync(&vibrator->worker);
+	clk_vibrator_stop(vibrator);
+}
+
+static int clk_vibrator_probe(struct platform_device *pdev)
+{
+	struct clk_vibrator *vibrator;
+	int ret;
+
+	vibrator = devm_kzalloc(&pdev->dev, sizeof(*vibrator), GFP_KERNEL);
+	if (!vibrator)
+		return -ENOMEM;
+
+	vibrator->input = devm_input_allocate_device(&pdev->dev);
+	if (!vibrator->input)
+		return -ENOMEM;
+
+	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
+	if (IS_ERR(vibrator->vcc)) {
+		if (PTR_ERR(vibrator->vcc) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get regulator: %ld\n",
+				PTR_ERR(vibrator->vcc));
+		return PTR_ERR(vibrator->vcc);
+	}
+
+	vibrator->enable_gpio = devm_gpiod_get(&pdev->dev, "enable",
+					       GPIOD_OUT_LOW);
+	if (IS_ERR(vibrator->enable_gpio)) {
+		if (PTR_ERR(vibrator->enable_gpio) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get enable gpio: %ld\n",
+				PTR_ERR(vibrator->enable_gpio));
+		return PTR_ERR(vibrator->enable_gpio);
+	}
+
+	vibrator->clk = devm_clk_get(&pdev->dev, "core");
+	if (IS_ERR(vibrator->clk)) {
+		if (PTR_ERR(vibrator->clk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Failed to lookup core clock: %ld\n",
+				PTR_ERR(vibrator->clk));
+		return PTR_ERR(vibrator->clk);
+	}
+
+	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
+				   &vibrator->clk_rate);
+	if (ret) {
+		dev_err(&pdev->dev, "Cannot read clock-frequency: %d\n", ret);
+		return ret;
+	}
+
+	vibrator->enabled = false;
+	mutex_init(&vibrator->mutex);
+	INIT_WORK(&vibrator->worker, clk_vibrator_worker);
+
+	vibrator->input->name = "clk-vibrator";
+	vibrator->input->id.bustype = BUS_HOST;
+	vibrator->input->close = clk_vibrator_close;
+
+	input_set_drvdata(vibrator->input, vibrator);
+	input_set_capability(vibrator->input, EV_FF, FF_RUMBLE);
+
+	ret = input_ff_create_memless(vibrator->input, NULL,
+				      clk_vibrator_play_effect);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to create ff memless: %d", ret);
+		return ret;
+	}
+
+	ret = input_register_device(vibrator->input);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register input device: %d", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, vibrator);
+
+	return 0;
+}
+
+static int __maybe_unused clk_vibrator_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct clk_vibrator *vibrator = platform_get_drvdata(pdev);
+
+	cancel_work_sync(&vibrator->worker);
+
+	if (vibrator->enabled)
+		clk_vibrator_stop(vibrator);
+
+	return 0;
+}
+
+static int __maybe_unused clk_vibrator_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct clk_vibrator *vibrator = platform_get_drvdata(pdev);
+
+	if (vibrator->enabled)
+		clk_vibrator_start(vibrator);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(clk_vibrator_pm_ops, clk_vibrator_suspend,
+			 clk_vibrator_resume);
+
+static const struct of_device_id clk_vibrator_of_match[] = {
+	{ .compatible = "clk-vibrator" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, clk_vibrator_of_match);
+
+static struct platform_driver clk_vibrator_driver = {
+	.probe	= clk_vibrator_probe,
+	.driver	= {
+		.name = "clk-vibrator",
+		.pm = &clk_vibrator_pm_ops,
+		.of_match_table = of_match_ptr(clk_vibrator_of_match),
+	},
+};
+module_platform_driver(clk_vibrator_driver);
+
+MODULE_AUTHOR("Brian Masney <masneyb@onstation.org>");
+MODULE_DESCRIPTION("Clock vibrator driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

