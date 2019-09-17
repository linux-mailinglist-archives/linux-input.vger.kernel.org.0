Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3051EB45B9
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 04:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389822AbfIQC5Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 22:57:25 -0400
Received: from inva021.nxp.com ([92.121.34.21]:49926 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729066AbfIQC5Z (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 22:57:25 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C7F3820062C;
        Tue, 17 Sep 2019 04:57:22 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2825E200637;
        Tue, 17 Sep 2019 04:57:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4620D402E6;
        Tue, 17 Sep 2019 10:56:47 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, olof@lixom.net,
        mripard@kernel.org, arnd@arndb.de, jagan@amarulasolutions.com,
        dinguyen@kernel.org, bjorn.andersson@linaro.org,
        marcin.juszkiewicz@linaro.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, cw00.choi@samsung.com,
        enric.balletbo@collabora.com, m.felsch@pengutronix.de,
        ping.bai@nxp.com, ronald@innovation.ch, stefan@agner.ch,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V5 2/5] input: keyboard: imx_sc: Add i.MX system controller key support
Date:   Tue, 17 Sep 2019 10:55:36 +0800
Message-Id: <1568688939-13649-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568688939-13649-1-git-send-email-Anson.Huang@nxp.com>
References: <1568688939-13649-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
inside, the system controller is in charge of controlling power,
clock and scu key etc..

Adds i.MX system controller key driver support, Linux kernel has
to communicate with system controller via MU (message unit) IPC
to get scu key's status.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V4:
	- reduce debounce time from 100mS to 30mS;
	- remove unnecessary delay_check for button release interrupt which is NOT existing at all;
	- using error instead of ret;
	- move pm_wakeup_event() to interrupt notify and ONLY calling pm_relax() when button is released;
	- remove unnecessary logic code of avoiding quick button press/release.
---
 drivers/input/keyboard/Kconfig      |   7 ++
 drivers/input/keyboard/Makefile     |   1 +
 drivers/input/keyboard/imx_sc_key.c | 184 ++++++++++++++++++++++++++++++++++++
 3 files changed, 192 insertions(+)
 create mode 100644 drivers/input/keyboard/imx_sc_key.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 8911bc2..00f8428 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -469,6 +469,13 @@ config KEYBOARD_IMX
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx_keypad.
 
+config KEYBOARD_IMX_SC_KEY
+	tristate "IMX SCU Key Driver"
+	depends on IMX_SCU
+	help
+	  This is the system controller key driver for NXP i.MX SoCs with
+	  system controller inside.
+
 config KEYBOARD_NEWTON
 	tristate "Newton keyboard"
 	select SERIO
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 9510325..f5b1752 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_KEYBOARD_HIL)		+= hil_kbd.o
 obj-$(CONFIG_KEYBOARD_HIL_OLD)		+= hilkbd.o
 obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
 obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
+obj-$(CONFIG_KEYBOARD_IMX_SC_KEY)	+= imx_sc_key.o
 obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
 obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
 obj-$(CONFIG_KEYBOARD_LKKBD)		+= lkkbd.o
diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
new file mode 100644
index 0000000..173e377
--- /dev/null
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 NXP.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/firmware/imx/sci.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+
+#define DEBOUNCE_TIME	30
+#define REPEAT_INTERVAL	60
+
+#define SC_IRQ_BUTTON		1
+#define SC_IRQ_GROUP_WAKE	3
+#define IMX_SC_MISC_FUNC_GET_BUTTON_STATUS	18
+
+struct imx_key_drv_data {
+	int keycode;
+	bool keystate;  /* 1: pressed, 0: release */
+	struct delayed_work check_work;
+	struct input_dev *input;
+	struct imx_sc_ipc *key_ipc_handle;
+	struct notifier_block key_notifier;
+};
+
+struct imx_sc_msg_key {
+	struct imx_sc_rpc_msg hdr;
+	u8 state;
+};
+
+static int imx_sc_key_notify(struct notifier_block *nb,
+			     unsigned long event, void *group)
+{
+	struct imx_key_drv_data *priv =
+				 container_of(nb,
+					      struct imx_key_drv_data,
+					      key_notifier);
+
+	if ((event & SC_IRQ_BUTTON) && (*(u8 *)group == SC_IRQ_GROUP_WAKE)) {
+		schedule_delayed_work(&priv->check_work,
+				      msecs_to_jiffies(DEBOUNCE_TIME));
+		pm_wakeup_event(priv->input->dev.parent, 0);
+	}
+
+	return 0;
+}
+
+static void imx_sc_check_for_events(struct work_struct *work)
+{
+	struct imx_key_drv_data *priv =
+				 container_of(work,
+					      struct imx_key_drv_data,
+					      check_work.work);
+	struct input_dev *input = priv->input;
+	struct imx_sc_msg_key msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	bool state;
+	int error;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = IMX_SC_RPC_SVC_MISC;
+	hdr->func = IMX_SC_MISC_FUNC_GET_BUTTON_STATUS;
+	hdr->size = 1;
+
+	error = imx_scu_call_rpc(priv->key_ipc_handle, &msg, true);
+	if (error) {
+		dev_err(&input->dev, "read imx sc key failed, ret %d\n", ret);
+		return;
+	}
+
+	state = (bool)msg.state;
+
+	if (state ^ priv->keystate) {
+		priv->keystate = state;
+		input_event(input, EV_KEY, priv->keycode, state);
+		input_sync(input);
+		if (!priv->keystate)
+			pm_relax(priv->input->dev.parent);
+	}
+
+	if (state)
+		schedule_delayed_work(&priv->check_work,
+				      msecs_to_jiffies(REPEAT_INTERVAL));
+}
+
+static int imx_sc_key_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	static struct imx_key_drv_data *priv;
+	struct input_dev *input;
+	int error;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	error = imx_scu_get_handle(&priv->key_ipc_handle);
+	if (error)
+		return error;
+
+	if (of_property_read_u32(np, "linux,keycode", &priv->keycode)) {
+		dev_err(&pdev->dev, "missing KEY_POWER in DT\n");
+		return -EINVAL;
+	}
+
+	INIT_DELAYED_WORK(&priv->check_work, imx_sc_check_for_events);
+
+	input = devm_input_allocate_device(&pdev->dev);
+	if (!input) {
+		dev_err(&pdev->dev, "failed to allocate the input device\n");
+		return -ENOMEM;
+	}
+
+	input->name = pdev->name;
+	input->phys = "imx-sc-key/input0";
+	input->id.bustype = BUS_HOST;
+
+	input_set_capability(input, EV_KEY, priv->keycode);
+
+	error = input_register_device(input);
+	if (error) {
+		dev_err(&pdev->dev, "failed to register input device\n");
+		return error;
+	}
+
+	priv->input = input;
+	platform_set_drvdata(pdev, priv);
+
+	error = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, true);
+	if (error) {
+		dev_warn(&pdev->dev, "enable scu group irq failed\n");
+		return error;
+	}
+
+	priv->key_notifier.notifier_call = imx_sc_key_notify;
+	error = imx_scu_irq_register_notifier(&priv->key_notifier);
+	if (error) {
+		imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, false);
+		dev_warn(&pdev->dev, "register scu notifier failed\n");
+		return error;
+	}
+
+	return 0;
+}
+
+static int imx_sc_key_remove(struct platform_device *pdev)
+{
+	struct imx_key_drv_data *priv = platform_get_drvdata(pdev);
+
+	imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, false);
+	imx_scu_irq_unregister_notifier(&priv->key_notifier);
+	cancel_delayed_work_sync(&priv->check_work);
+
+	return 0;
+}
+
+static const struct of_device_id imx_sc_key_ids[] = {
+	{ .compatible = "fsl,imx-sc-key" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx_sc_key_ids);
+
+static struct platform_driver imx_sc_key_driver = {
+	.driver = {
+		.name = "imx-sc-key",
+		.of_match_table = imx_sc_key_ids,
+	},
+	.probe = imx_sc_key_probe,
+	.remove = imx_sc_key_remove,
+};
+module_platform_driver(imx_sc_key_driver);
+
+MODULE_AUTHOR("Anson Huang <Anson.Huang@nxp.com>");
+MODULE_DESCRIPTION("i.MX System Controller Key Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

