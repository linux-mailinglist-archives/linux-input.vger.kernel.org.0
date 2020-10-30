Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4A229FD8C
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 07:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgJ3GCz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 02:02:55 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:13569 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgJ3GCy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 02:02:54 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201030060206epoutp02a4245aa30acbfc00a8a6fdf9da84520e~Cr9BZK_fz3030430304epoutp021
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 06:02:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201030060206epoutp02a4245aa30acbfc00a8a6fdf9da84520e~Cr9BZK_fz3030430304epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604037726;
        bh=sfnfDN9oHZvJZ8SpDyvhPxBdPi/Wk7JCNN5ZgJCkFIg=;
        h=Subject:Reply-To:From:To:Date:References:From;
        b=Ayqpp2ASuQYvdtrfSp1A4QHZw2KSRmH7fKCKKbeCvY7jXMI2kEvD2SzC14sBIFTRb
         qiFJG0qNJTomy6QJpz74QmLHhbmp6NEW2O4I/wy1G/6l+DiaRWHHV33mYmowdtgSxh
         NIZWeT9EyhnLYgw3/F2OTyg3u18Tkh6VOtn8Edzo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201030060206epcas1p24dce25766763646e6ba67a8d2a1a7c0d~Cr9A9HCIc1643316433epcas1p28;
        Fri, 30 Oct 2020 06:02:06 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.166]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4CMsCK1Ht1zMqYkn; Fri, 30 Oct
        2020 06:02:05 +0000 (GMT)
X-AuditID: b6c32a36-6dfff7000000f7e2-29-5f9bac5d8609
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CD.8D.63458.D5CAB9F5; Fri, 30 Oct 2020 15:02:05 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] Input: add switch event(SW_COVER_ATTACHED)
Reply-To: hj2.im@samsung.com
Sender: HyungJae Im <hj2.im@samsung.com>
From:   HyungJae Im <hj2.im@samsung.com>
To:     HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201030060204epcms1p48c0c3d0b82d0304c6e1b296cb6ebc778@epcms1p4>
Date:   Fri, 30 Oct 2020 15:02:04 +0900
X-CMS-MailID: 20201030060204epcms1p48c0c3d0b82d0304c6e1b296cb6ebc778
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHKsWRmVeSWpSXmKPExsWy7bCmrm7smtnxBveOsFksmG5ncfPTN1aL
        y7vmsFncbelktTjxbRqTA6vH51WvWD3uXNvD5tG3ZRWjx+dNcgEsUTk2GamJKalFCql5yfkp
        mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
        pSWpChn5xSW2SqkFKTkFhgYFesWJucWleel6yfm5VoYGBkamQJUJORmrTs5kLZjnVnF55R72
        BsZ5Vl2MHBwSAiYSd39mdTFycQgJ7GCUWLnmCRtInFdAUOLvDuEuRk4OYQFriTc7TjKDhIUE
        ZCS69hhBhDUklrZ8ZgSx2QTUJH6v2cMGMkZEYBaTxNv5J8ASEgK8EjPan7JA2NIS25dvhYqL
        Stxc/ZYdxn5/bD5UXESi9d5ZZghbUOLBz92MML1LryxmAlkgIdDOKHHx5i9WCKeFUWLB0sNs
        EFX6Elf6ZzKB2LwCvhI/HpxiB7maRUBV4uQeaYh/XSTmzfMHqWAWkJfY/nYO2F/MApoS63fp
        QwxRlNj5ey4jRAmfxLuvPawwr+yY94QJwlaQ2LjoE9RSMYlZ825Dvegh8e3tF7AaIYFAiW9L
        77JNYJSbhQjQWUgWz0JYvICReRWjWGpBcW56arFhgRFyFG5iBCc0LbMdjJPeftA7xMjEwXiI
        UYKDWUmE94XgzHgh3pTEyqrUovz4otKc1OJDjKZAD09klhJNzgem1LySeENTI2NjYwsTM3Mz
        U2Mlcd4/2h3xQgLpiSWp2ampBalFMH1MHJxSDUx6ERKiZ05NzKwqZCrNVKv63Wlk1nr0/pI7
        nuvuaOb++MAWs/Dx08TPfpZuU4QnaU5dHW7ZtK31VF8Tj7reNn91QffWuc/mHGhi/TT1WIe+
        /6uZ9anuJV0bpt2U2LzDSG/yxB/nfBsstk04o3b43Pvj2jI1XCmn31ifr7FUTNrf+4ElRXvN
        tMTYv7sOz85227CfOT3Z6XC8w/KvmXrfVp8TZb9uf2phwek6ke/N6mJ/ZZfNzgnafJo7Z9dc
        Uf2U/Fld+85brN6+9dqvSewSyy+6GRknbtsgtPoSi8OGqcd7Kk/8alzQbmYQ9/Qpy7eViTlf
        uuw5C1Ybt8RJ8VSUiV+7Wnhl7i2zT580z0dOL/unxFKckWioxVxUnAgAnuSDqvEDAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201030060204epcms1p48c0c3d0b82d0304c6e1b296cb6ebc778
References: <CGME20201030060204epcms1p48c0c3d0b82d0304c6e1b296cb6ebc778@epcms1p4>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We need support to various accessories on the device,
some requiring switch does not exist in switch list.
So added switch for the following purpose.

SW_COVER_ATTACHED is for the checking the cover
attached or not on the device. We also added driver
that uses such event.

Signed-off-by: Hyungjae Im <hj2.im@samsung.com>
---
 drivers/input/Kconfig                  |  12 ++
 drivers/input/Makefile                 |   2 +
 drivers/input/cover_detect.c           | 236 +++++++++++++++++++++++++
 include/linux/mod_devicetable.h        |   2 +-
 include/uapi/linux/input-event-codes.h |   3 +-
 5 files changed, 253 insertions(+), 2 deletions(-)
 create mode 100644 drivers/input/cover_detect.c

diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 1efd3154b68d..ba5e7444c547 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -185,6 +185,18 @@ config INPUT_APMPOWER
 	  To compile this driver as a module, choose M here: the
 	  module will be called apm-power.
 
+config INPUT_COVER_DETECT
+	tristate "Enable cover attach detection"
+	help
+	  Say Y here to enable cover attach detection
+	  and send a event when cover is attached/detached.
+	  Active gpio state is low and active event value is 0.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called cover_detect.
+
 comment "Input Device Drivers"
 
 source "drivers/input/keyboard/Kconfig"
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index e35650930371..fc8dd9091821 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -29,3 +29,5 @@ obj-$(CONFIG_INPUT_MISC)	+= misc/
 obj-$(CONFIG_INPUT_APMPOWER)	+= apm-power.o
 
 obj-$(CONFIG_RMI4_CORE)		+= rmi4/
+
+obj-$(CONFIG_INPUT_COVER_DETECT)+= cover_detect.o
diff --git a/drivers/input/cover_detect.c b/drivers/input/cover_detect.c
new file mode 100644
index 000000000000..4a5947356d50
--- /dev/null
+++ b/drivers/input/cover_detect.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Support detection for cover attachment
+ *
+ * Copyright (C) 2020 Samsung Electronics Co. Ltd. All Rights Reserved.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/input.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+#include <linux/wakelock.h>
+
+struct cover_detect_drvdata {
+	struct input_dev *input;
+	struct delayed_work cover_detect_dwork;
+	struct wakeup_source *ws;
+	int gpio_cover_detect;
+	int irq_cover_detect;
+};
+
+static void cover_detect_work(struct work_struct *work)
+{
+	struct cover_detect_drvdata *ddata =
+		container_of(work, struct cover_detect_drvdata,
+				cover_detect_dwork.work);
+	bool cover_status;
+
+	cover_status = gpio_get_value(ddata->gpio_cover_detect);
+
+	input_report_switch(ddata->input,
+			SW_COVER_ATTACHED, cover_status);
+	input_sync(ddata->input);
+}
+
+static void __cover_detect(struct cover_detect_drvdata *ddata,
+				 bool cover_status)
+{
+	cancel_delayed_work_sync(&ddata->cover_detect_dwork);
+	if (cover_status) {
+		__pm_wakeup_event(ddata->ws, jiffies_to_msecs(HZ / 20));
+		schedule_delayed_work(&ddata->cover_detect_dwork, HZ * 1 / 100);
+	} else {
+		__pm_relax(ddata->ws);
+		schedule_delayed_work(&ddata->cover_detect_dwork, 0);
+	}
+}
+
+static irqreturn_t cover_detect_irq(int irq, void *dev_id)
+{
+	bool cover_status;
+	struct cover_detect_drvdata *ddata = dev_id;
+
+	cover_status = gpio_get_value(ddata->gpio_cover_detect);
+
+	__cover_detect(ddata, cover_status);
+
+	return IRQ_HANDLED;
+}
+
+static int cover_detect_open(struct input_dev *input)
+{
+	struct cover_detect_drvdata *ddata = input_get_drvdata(input);
+	/* update the current status */
+	schedule_delayed_work(&ddata->cover_detect_dwork, HZ / 2);
+	/* Report current state of buttons that are connected to GPIOs */
+	input_sync(input);
+
+	return 0;
+}
+
+static void cover_detect_close(struct input_dev *input)
+{
+}
+
+static void init_cover_detect_irq(struct input_dev *input)
+{
+	struct cover_detect_drvdata *ddata = input_get_drvdata(input);
+
+	int ret = 0;
+	int irq = ddata->irq_cover_detect;
+
+	ret =	request_threaded_irq(
+		irq, NULL,
+		cover_detect_irq,
+		IRQF_TRIGGER_RISING |
+		IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+		"cover_detect", ddata);
+	if (ret < 0)
+		pr_err("keys: failed to request cover detect irq %d gpio %d\n",
+			irq, ddata->gpio_cover_detect);
+}
+
+#ifdef CONFIG_OF
+static int of_cover_detect_data_parsing_dt(struct device *dev,
+					struct cover_detect_drvdata *ddata)
+{
+	struct device_node *np = dev->of_node;
+	int gpio;
+	enum of_gpio_flags flags;
+
+	gpio = of_get_named_gpio_flags(np, "gpio_cover_detect", 0, &flags);
+	ddata->gpio_cover_detect = gpio;
+
+	ddata->irq_cover_detect = gpio_to_irq(gpio);
+
+	return 0;
+}
+#endif
+
+static int cover_detect_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cover_detect_drvdata *ddata;
+	struct input_dev *input;
+	int error;
+	int wakeup = 0;
+
+	ddata = kzalloc(sizeof(struct cover_detect_drvdata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+#ifdef CONFIG_OF
+	if (dev->of_node) {
+		error = of_cover_detect_data_parsing_dt(dev, ddata);
+		if (error < 0) {
+			dev_err(dev, "fail to get the devicetree, error: %d\n",
+					error);
+			goto fail1;
+		}
+	}
+#endif
+
+	input = input_allocate_device();
+	if (!input) {
+		dev_err(dev, "failed to allocate state\n");
+		error = -ENOMEM;
+		goto fail1;
+	}
+
+	ddata->input = input;
+
+	ddata->ws = wakeup_source_register(NULL, "cover_detect");
+
+	platform_set_drvdata(pdev, ddata);
+	input_set_drvdata(input, ddata);
+
+	input->name = "cover_detect";
+	input->phys = "cover_detect";
+	input->dev.parent = &pdev->dev;
+
+	input->evbit[0] |= BIT_MASK(EV_SW);
+	input_set_capability(input, EV_SW, SW_COVER_ATTACHED);
+
+	input->open = cover_detect_open;
+	input->close = cover_detect_close;
+
+	/* Enable auto repeat feature of Linux input subsystem */
+	__set_bit(EV_REP, input->evbit);
+
+	INIT_DELAYED_WORK(&ddata->cover_detect_dwork, cover_detect_work);
+
+	init_cover_detect_irq(input);
+
+	if (ddata->gpio_cover_detect != 0) {
+		error = input_register_device(input);
+		if (error) {
+			dev_err(dev, "Unable to register input device, error: %d\n",
+				error);
+			goto fail1;
+		}
+	}
+
+	device_init_wakeup(&pdev->dev, wakeup);
+
+	return 0;
+
+ fail1:
+	kfree(ddata);
+
+	return error;
+}
+
+static int cover_detect_remove(struct platform_device *pdev)
+{
+	struct cover_detect_drvdata *ddata = platform_get_drvdata(pdev);
+	struct input_dev *input = ddata->input;
+
+	device_init_wakeup(&pdev->dev, 0);
+
+	input_unregister_device(input);
+
+	wakeup_source_unregister(ddata->ws);
+
+	kfree(ddata);
+
+	return 0;
+}
+
+#if defined(CONFIG_OF)
+static const struct of_device_id cover_detect_dt_ids[] = {
+	{ .compatible = "cover_detect" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, cover_detect_dt_ids);
+#endif /* CONFIG_OF */
+
+static struct platform_driver cover_detect_device_driver = {
+	.probe		= cover_detect_probe,
+	.remove		= cover_detect_remove,
+	.driver		= {
+		.name	= "cover_detect",
+		.owner	= THIS_MODULE,
+#if defined(CONFIG_OF)
+		.of_match_table	= cover_detect_dt_ids,
+#endif /* CONFIG_OF */
+	}
+};
+
+static int __init cover_detect_init(void)
+{
+	return platform_driver_register(&cover_detect_device_driver);
+}
+
+static void __exit cover_detect_exit(void)
+{
+	platform_driver_unregister(&cover_detect_device_driver);
+}
+
+module_init(cover_detect_init);
+module_exit(cover_detect_exit);
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b08a473cdba..2e6ae686555b 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -320,7 +320,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x10
+#define INPUT_DEVICE_ID_SW_MAX		0x11
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 0c2e27d28e0a..32e27732161c 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -889,7 +889,8 @@
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER	0x10  /* set = cover closed */
-#define SW_MAX			0x10
+#define SW_COVER_ATTACHED	0x11  /* set = cover attached */
+#define SW_MAX			0x11
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.17.1
