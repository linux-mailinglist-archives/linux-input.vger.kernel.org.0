Return-Path: <linux-input+bounces-5863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 202D695E53A
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 22:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC1E2816AC
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 20:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04522179647;
	Sun, 25 Aug 2024 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QkPM/xBM"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182F54D5BD;
	Sun, 25 Aug 2024 20:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724617979; cv=none; b=KG+Eka+Izda+5B7dIlbl3RhWKg89U2MTtz5Q8xduIB1tZv+Q45tUiaV9WUP/eF9713koxN9tqUmZMHFfcj/5OqZYXKZwljwNySaDRM/xAkuP4XXpodk/rZz/MoySU4xi0PR883yrPG6MSIsYucykwQ8+UXUjR3npPL9OefwhoIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724617979; c=relaxed/simple;
	bh=MpwvzhvgOaDrytoYEQnWPSuHKjx383ho/OaLqcZzFv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=an2cRy+KYmG1V/dVwrlAaPwRlha01Td7KWuNfZVT5K14bPkgFOlPLtITS9EaW/C6ffQCq/sFpMocZHjDArSyfd/OZzgCLSYPTCr5O60Jt43o8reRqQ7UAjkOiAnleY3tm4ev0OBudEWaxHgJ9b9phliFZC/ga6wJ3svmM217DQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QkPM/xBM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZFg9nq4Mz5BTGB9tCqxNQ5vxEapgnJXJdTITfa1daEw=; b=QkPM/xBMLOU7O943Lc004lB9+7
	xkqlhDvuCFggHxSXllW/BjGKXqWwaQecdKgqIyhc4AYD3llvSGpAJja2TKGCOQYMyibA00U3LjqHn
	069bE/6d4U2Tt7XRUShybG2GFCMrchI/xDk5480zCHo3gqmv730Qgsas2Ts/CfdOIItwk/rCHLmWT
	fQHpBCRRBJYmU5eXhROKF/Ta1hnDeztPGm63QqV7nEy/gfhfKF0iPThjW82HJow6JdnyMoR3vhwEz
	IdZTXbbpFu9957NyYPwigyfJBcslIJmiJ944AbqJ+q1lqxMHRME+QCK8UDWjc02k7JCbRMGZmvrrp
	sKJzANmw==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1siJul-0001cM-BO; Sun, 25 Aug 2024 22:32:43 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	heiko@sntech.de,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 4/7] Input: add driver for the input part of qnap-mcu devices
Date: Sun, 25 Aug 2024 22:32:32 +0200
Message-ID: <20240825203235.1122198-5-heiko@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240825203235.1122198-1-heiko@sntech.de>
References: <20240825203235.1122198-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MCU controls the power-button and beeper, so expose them as input
device. There is of course no interrupt line, so the status of the
power-button needs to be polled. To generate an event the power-button
also needs to be held for 1-2 seconds, so the polling interval does
not need to be overly fast.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 MAINTAINERS                         |   1 +
 drivers/input/misc/Kconfig          |  12 +++
 drivers/input/misc/Makefile         |   1 +
 drivers/input/misc/qnap-mcu-input.c | 153 ++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+)
 create mode 100644 drivers/input/misc/qnap-mcu-input.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dff0e237f22..a41906b3caa3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18657,6 +18657,7 @@ F:	drivers/media/tuners/qm1d1c0042*
 QNAP MCU DRIVER
 M:	Heiko Stuebner <heiko@sntech.de>
 S:	Maintained
+F:	drivers/input/misc/qnap-mcu-input.c
 F:	drivers/leds/leds-qnap-mcu.c
 F:	drivers/mfd/qnap-mcu.c
 F:	include/linux/qnap-mcu.h
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 6a852c76331b..13d135257e06 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -917,6 +917,18 @@ config INPUT_HISI_POWERKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called hisi_powerkey.
 
+config INPUT_QNAP_MCU
+	tristate "Input Support for QNAP MCU controllers"
+	depends on MFD_QNAP_MCU
+	help
+	  This option enables support for input elements available on
+	  embedded controllers used in QNAP NAS devices.
+
+	  This includes a polled power-button as well as a beeper.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qnap-mcu-input.
+
 config INPUT_RAVE_SP_PWRBUTTON
 	tristate "RAVE SP Power button Driver"
 	depends on RAVE_SP_CORE
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 4f7f736831ba..6d91804d0a6f 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)	+= pmic8xxx-pwrkey.o
 obj-$(CONFIG_INPUT_POWERMATE)		+= powermate.o
 obj-$(CONFIG_INPUT_PWM_BEEPER)		+= pwm-beeper.o
 obj-$(CONFIG_INPUT_PWM_VIBRA)		+= pwm-vibra.o
+obj-$(CONFIG_INPUT_QNAP_MCU)		+= qnap-mcu-input.o
 obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)	+= rave-sp-pwrbutton.o
 obj-$(CONFIG_INPUT_RB532_BUTTON)	+= rb532_button.o
 obj-$(CONFIG_INPUT_REGULATOR_HAPTIC)	+= regulator-haptic.o
diff --git a/drivers/input/misc/qnap-mcu-input.c b/drivers/input/misc/qnap-mcu-input.c
new file mode 100644
index 000000000000..b9b50520ccf7
--- /dev/null
+++ b/drivers/input/misc/qnap-mcu-input.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Driver for input events on QNAP-MCUs
+ *
+ * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
+ */
+
+#include <linux/input.h>
+#include <linux/mfd/qnap-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <uapi/linux/input-event-codes.h>
+
+/*
+ * The power-key needs to be pressed for a while to create an event,
+ * so there is no use for overly frequent polling.
+ */
+#define POLL_INTERVAL		500
+
+struct qnap_mcu_input_dev {
+	struct input_dev *input;
+	struct qnap_mcu *mcu;
+	struct device *dev;
+
+	struct work_struct beep_work;
+	int beep_type;
+};
+
+static void qnap_mcu_input_poll(struct input_dev *input)
+{
+	struct qnap_mcu_input_dev *idev = input_get_drvdata(input);
+	static const u8 cmd[] = { 0x40, 0x43, 0x56 };
+	u8 reply[4];
+	int state, ret;
+
+	/* poll the power button */
+	ret = qnap_mcu_exec(idev->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
+	if (ret)
+		return;
+
+	/* First bytes must mirror the sent command */
+	if (memcmp(cmd, reply, sizeof(cmd))) {
+		dev_err(idev->dev, "malformed data received\n");
+		return;
+	}
+
+	state = reply[3] - 0x30;
+	input_event(input, EV_KEY, KEY_POWER, state);
+	input_sync(input);
+}
+
+static void qnap_mcu_input_beeper_work(struct work_struct *work)
+{
+	struct qnap_mcu_input_dev *idev =
+		container_of(work, struct qnap_mcu_input_dev, beep_work);
+	const u8 cmd[] = { 0x40, 0x43, (idev->beep_type == SND_TONE) ? 0x33 : 0x32 };
+
+	qnap_mcu_exec_with_ack(idev->mcu, cmd, sizeof(cmd));
+}
+
+static int qnap_mcu_input_event(struct input_dev *input, unsigned int type,
+				unsigned int code, int value)
+{
+	struct qnap_mcu_input_dev *idev = input_get_drvdata(input);
+
+	if (type != EV_SND || (code != SND_BELL && code != SND_TONE))
+		return -EOPNOTSUPP;
+
+	if (value < 0)
+		return -EINVAL;
+
+	/* beep runtime is determined by the MCU */
+	if (value == 0)
+		return 0;
+
+	/* Schedule work to actually turn the beeper on */
+	idev->beep_type = code;
+	schedule_work(&idev->beep_work);
+
+	return 0;
+}
+
+static void qnap_mcu_input_close(struct input_dev *input)
+{
+	struct qnap_mcu_input_dev *idev = input_get_drvdata(input);
+
+	cancel_work_sync(&idev->beep_work);
+}
+
+static int qnap_mcu_input_probe(struct platform_device *pdev)
+{
+	struct qnap_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
+	struct qnap_mcu_input_dev *idev;
+	struct device *dev = &pdev->dev;
+	struct input_dev *input;
+	int ret;
+
+	idev = devm_kzalloc(dev, sizeof(*idev), GFP_KERNEL);
+	if (!idev)
+		return -ENOMEM;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return dev_err_probe(dev, -ENOMEM, "no memory for input device\n");
+
+	idev->input = input;
+	idev->dev = dev;
+	idev->mcu = mcu;
+
+	input_set_drvdata(input, idev);
+
+	input->name		= "qnap-mcu";
+	input->phys		= "qnap-mcu-input/input0";
+	input->id.bustype	= BUS_HOST;
+	input->id.vendor	= 0x0001;
+	input->id.product	= 0x0001;
+	input->id.version	= 0x0100;
+	input->event		= qnap_mcu_input_event;
+	input->close		= qnap_mcu_input_close;
+
+	input_set_capability(input, EV_KEY, KEY_POWER);
+	input_set_capability(input, EV_SND, SND_BELL);
+	input_set_capability(input, EV_SND, SND_TONE);
+
+	INIT_WORK(&idev->beep_work, qnap_mcu_input_beeper_work);
+
+	ret = input_setup_polling(input, qnap_mcu_input_poll);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to set up polling\n");
+
+	input_set_poll_interval(input, POLL_INTERVAL);
+
+	ret = input_register_device(input);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to register input device\n");
+
+	return 0;
+}
+
+static struct platform_driver qnap_mcu_input_driver = {
+	.probe = qnap_mcu_input_probe,
+	.driver = {
+		.name = "qnap-mcu-input",
+	},
+};
+module_platform_driver(qnap_mcu_input_driver);
+
+MODULE_ALIAS("platform:qnap-mcu-input");
+MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
+MODULE_DESCRIPTION("QNAP MCU input driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


