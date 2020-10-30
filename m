Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AC529FDCA
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 07:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgJ3G1p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 02:27:45 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:40023 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3G1p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 02:27:45 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201030062742epoutp03a566442bc74f9bb7e0504d3de2da0180~CsTXzCxFR0475004750epoutp03y
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 06:27:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201030062742epoutp03a566442bc74f9bb7e0504d3de2da0180~CsTXzCxFR0475004750epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604039262;
        bh=wy+mweEvFF3VxmAY6EeQc5m5zCoxEggWPFod2Ta1xDc=;
        h=Subject:Reply-To:From:To:Date:References:From;
        b=H/APMDC1Buq9w+qDwRr8CqfQpGQhS3HJu1yhKbw5kenkt6y70q+foR8IW5/a/SIIg
         /kpxqL+4XO/dDyhUBvV8ZW4M0R+M1LuheDchJ3LeRkeqjcrKN1I8g/FRqYIQDK/qKt
         KdThYKV+1g2JpiqM+OWQB2noiutl7BVIvY0ZMYb4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20201030062742epcas1p3d41af59e1336779c8294cf263dc6a69d~CsTXXhF7-0383403834epcas1p3u;
        Fri, 30 Oct 2020 06:27:42 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.160]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4CMsms1G5vzMqYm1; Fri, 30 Oct
        2020 06:27:41 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-e2-5f9bb25d4a83
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        71.F3.10463.D52BB9F5; Fri, 30 Oct 2020 15:27:41 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] Input: add switch event(SW_EXT_PEN_ATTACHED)
Reply-To: hj2.im@samsung.com
Sender: HyungJae Im <hj2.im@samsung.com>
From:   HyungJae Im <hj2.im@samsung.com>
To:     HyungJae Im <hj2.im@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201030062740epcms1p614195fb639c807cd2db762d117cc69fc@epcms1p6>
Date:   Fri, 30 Oct 2020 15:27:40 +0900
X-CMS-MailID: 20201030062740epcms1p614195fb639c807cd2db762d117cc69fc
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBKsWRmVeSWpSXmKPExsWy7bCmrm7sptnxBq3LWC2aF69ns1gw3c7i
        5qdvrBaXd81hs7jb0slqceLbNCYHNo/Pq16xety5tofNY//cNewefVtWMXp83iQXwBqVY5OR
        mpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdICSQlliTilQ
        KCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8DQoECvODG3uDQvXS85P9fK0MDAyBSoMiEn4/jR
        28wF3R4VW/f4NDC22nQxcnJICJhING84xAxiCwnsYJS4fTWoi5GDg1dAUOLvDmGQsLCArcSj
        d92MIGEhARmJrj1GEGENiaUtnxlBbDYBNYnfa/awdTFycYgIXGeS2LjkKAvEeF6JGe1PoWxp
        ie3LtzJC2KISN1e/ZYex3x+bDxUXkWi9d5YZwhaUePBzNyNM79Iri5lAFkgItDNKXLz5ixXC
        aWGUWLD0MBtElb7Elf6ZTBAP+Ep8v1kOEmYRUJWY8G8u1CAXiR1TX4HZzALyEtvfzmEGKWcW
        0JRYv0sfokRRYufvuVAlfBLvvvawwvyyY94TJghbQWLjok9QW8UkZs27DfWjh8T2b5eYIMEZ
        KPH3/WzWCYxysxAhOgvJ4lkIixcwMq9iFEstKM5NTy02LDBBjsJNjOAkp2Wxg3Hu2w96hxiZ
        OBgPMUpwMCuJ8L4QnBkvxJuSWFmVWpQfX1Sak1p8iNEU6OWJzFKiyfnANJtXEm9oamRsbGxh
        YmZuZmqsJM77R7sjXkggPbEkNTs1tSC1CKaPiYNTqoFJq9tMcObiaxm2lq7lX9vVA49YbJv9
        Omr17qJdQtesNJ1TNzzptpznpd7wLbG4U5S/NefHyTvR+Ztt4qZ8ZXD5vMFp3eYjmdtP3W6b
        cv5VE1P1g6TNsXec53L8F1nXeWCthFzl68+ulyU9vtSdsp/wPpv5Rd21J6mWttEpB5938lWo
        JZssW/TmKA9jj1e+npx3qvet11YJSrKJ2h+1g0782pV2apo9p9ryla6SQpu47gbctO97YOLK
        mSR5eflSpTXllS5X1yU1BqYebxLS0fS7o73RWdaR8V7FS1n9lZnzF/Hfa057qTmjIMhqnbR/
        ZVy3qlEFi1DzTRZ5hr+3+Tnbtx+OfXPzpS9HSzCbthJLcUaioRZzUXEiAK5f/6f7AwAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201030062740epcms1p614195fb639c807cd2db762d117cc69fc
References: <CGME20201030062740epcms1p614195fb639c807cd2db762d117cc69fc@epcms1p6>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We need support to various accessories on the device,
some requiring switch does not exist in switch list.
So added switch for the following purpose.

SW_EXT_PEN_ATTACHED is for the checking the external pen
attached or not on the device. We also added driver
that uses such event.

Signed-off-by: Hyungjae Im <hj2.im@samsung.com>
---
 drivers/input/Kconfig                  |  12 ++
 drivers/input/Makefile                 |   1 +
 drivers/input/ext_pen_detect.c         | 237 +++++++++++++++++++++++++
 include/linux/mod_devicetable.h        |   2 +-
 include/uapi/linux/input-event-codes.h |   3 +-
 5 files changed, 253 insertions(+), 2 deletions(-)
 create mode 100644 drivers/input/ext_pen_detect.c

diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index ba5e7444c547..5d6d15c8f7e7 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -197,6 +197,18 @@ config INPUT_COVER_DETECT
 	  To compile this driver as a module, choose M here: the
 	  module will be called cover_detect.
 
+config INPUT_EXT_PEN_DETECT
+	tristate "Enable external pen attach detection"
+	help
+	  Say Y here to enable external pen detection
+	  and send a event when external pen is attached/detached.
+	  Active gpio state is low and active event value is 0.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ext_pen_detect.
+
 comment "Input Device Drivers"
 
 source "drivers/input/keyboard/Kconfig"
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index fc8dd9091821..0ccf02e34557 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_INPUT_APMPOWER)	+= apm-power.o
 obj-$(CONFIG_RMI4_CORE)		+= rmi4/
 
 obj-$(CONFIG_INPUT_COVER_DETECT)+= cover_detect.o
+obj-$(CONFIG_INPUT_EXT_PEN_DETECT)+= ext_pen_detect.o
diff --git a/drivers/input/ext_pen_detect.c b/drivers/input/ext_pen_detect.c
new file mode 100644
index 000000000000..9a0d106e49f8
--- /dev/null
+++ b/drivers/input/ext_pen_detect.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Support detection pen attachment externally on device
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
+struct ext_pen_detect_drvdata {
+	struct input_dev *input;
+	struct delayed_work ext_pen_detect_dwork;
+	struct wakeup_source *ws;
+	int gpio_ext_pen_detect;
+	int irq_ext_pen_detect;
+};
+
+static void ext_pen_detect_work(struct work_struct *work)
+{
+	struct ext_pen_detect_drvdata *ddata =
+		container_of(work, struct ext_pen_detect_drvdata,
+				ext_pen_detect_dwork.work);
+	bool ext_pen_status;
+
+	ext_pen_status = gpio_get_value(ddata->gpio_ext_pen_detect);
+
+	input_report_switch(ddata->input,
+			SW_EXT_PEN_ATTACHED, ext_pen_status);
+	input_sync(ddata->input);
+}
+
+static void __ext_pen_detect(struct ext_pen_detect_drvdata *ddata,
+				bool ext_pen_status)
+{
+	cancel_delayed_work_sync(&ddata->ext_pen_detect_dwork);
+	if (ext_pen_status) {
+		__pm_wakeup_event(ddata->ws, jiffies_to_msecs(HZ / 20));
+		schedule_delayed_work(&ddata->ext_pen_detect_dwork,
+					HZ * 1 / 100);
+	} else {
+		__pm_relax(ddata->ws);
+		schedule_delayed_work(&ddata->ext_pen_detect_dwork, 0);
+	}
+}
+
+static irqreturn_t ext_pen_detect_irq(int irq, void *dev_id)
+{
+	bool ext_pen_status;
+	struct ext_pen_detect_drvdata *ddata = dev_id;
+
+	ext_pen_status = gpio_get_value(ddata->gpio_ext_pen_detect);
+
+	__ext_pen_detect(ddata, ext_pen_status);
+
+	return IRQ_HANDLED;
+}
+
+static int ext_pen_detect_open(struct input_dev *input)
+{
+	struct ext_pen_detect_drvdata *ddata = input_get_drvdata(input);
+	/* update the current status */
+	schedule_delayed_work(&ddata->ext_pen_detect_dwork, HZ / 2);
+	/* Report current state of buttons that are connected to GPIOs */
+	input_sync(input);
+
+	return 0;
+}
+
+static void ext_pen_detect_close(struct input_dev *input)
+{
+}
+
+static void init_ext_pen_detect_irq(struct input_dev *input)
+{
+	struct ext_pen_detect_drvdata *ddata = input_get_drvdata(input);
+
+	int ret = 0;
+	int irq = ddata->irq_ext_pen_detect;
+
+	ret =	request_threaded_irq(
+		irq, NULL,
+		ext_pen_detect_irq,
+		IRQF_TRIGGER_RISING |
+		IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+		"ext_pen_detect", ddata);
+	if (ret < 0)
+		pr_err("keys: failed to request ext_pen detect irq %d gpio %d\n",
+				irq, ddata->gpio_ext_pen_detect);
+}
+
+#ifdef CONFIG_OF
+static int of_ext_pen_detect_data_parsing_dt(struct device *dev,
+					struct ext_pen_detect_drvdata *ddata)
+{
+	struct device_node *np = dev->of_node;
+	int gpio;
+	enum of_gpio_flags flags;
+
+	gpio = of_get_named_gpio_flags(np, "gpio_ext_pen_detect", 0, &flags);
+	ddata->gpio_ext_pen_detect = gpio;
+
+	ddata->irq_ext_pen_detect = gpio_to_irq(gpio);
+
+	return 0;
+}
+#endif
+
+static int ext_pen_detect_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ext_pen_detect_drvdata *ddata;
+	struct input_dev *input;
+	int error;
+	int wakeup = 0;
+
+	ddata = kzalloc(sizeof(struct ext_pen_detect_drvdata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+#ifdef CONFIG_OF
+	if (dev->of_node) {
+		error = of_ext_pen_detect_data_parsing_dt(dev, ddata);
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
+	ddata->ws = wakeup_source_register(NULL, "ext_pen_detect");
+
+	platform_set_drvdata(pdev, ddata);
+	input_set_drvdata(input, ddata);
+
+	input->name = "ext_pen_detect";
+	input->phys = "ext_pen_detect";
+	input->dev.parent = &pdev->dev;
+
+	input->evbit[0] |= BIT_MASK(EV_SW);
+	input_set_capability(input, EV_SW, SW_EXT_PEN_ATTACHED);
+
+	input->open = ext_pen_detect_open;
+	input->close = ext_pen_detect_close;
+
+	/* Enable auto repeat feature of Linux input subsystem */
+	__set_bit(EV_REP, input->evbit);
+
+	INIT_DELAYED_WORK(&ddata->ext_pen_detect_dwork, ext_pen_detect_work);
+
+	init_ext_pen_detect_irq(input);
+
+	if (ddata->gpio_ext_pen_detect != 0) {
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
+static int ext_pen_detect_remove(struct platform_device *pdev)
+{
+	struct ext_pen_detect_drvdata *ddata = platform_get_drvdata(pdev);
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
+static const struct of_device_id ext_pen_detect_dt_ids[] = {
+	{ .compatible = "ext_pen_detect" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ext_pen_detect_dt_ids);
+#endif /* CONFIG_OF */
+
+static struct platform_driver ext_pen_detect_device_driver = {
+	.probe		= ext_pen_detect_probe,
+	.remove		= ext_pen_detect_remove,
+	.driver		= {
+		.name	= "ext_pen_detect",
+		.owner	= THIS_MODULE,
+#if defined(CONFIG_OF)
+		.of_match_table	= ext_pen_detect_dt_ids,
+#endif /* CONFIG_OF */
+	}
+};
+
+static int __init ext_pen_detect_init(void)
+{
+	return platform_driver_register(&ext_pen_detect_device_driver);
+}
+
+static void __exit ext_pen_detect_exit(void)
+{
+	platform_driver_unregister(&ext_pen_detect_device_driver);
+}
+
+module_init(ext_pen_detect_init);
+module_exit(ext_pen_detect_exit);
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 2e6ae686555b..897f5a3e7721 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -320,7 +320,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x11
+#define INPUT_DEVICE_ID_SW_MAX		0x12
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 32e27732161c..8ca2acee1f92 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -890,7 +890,8 @@
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER	0x10  /* set = cover closed */
 #define SW_COVER_ATTACHED	0x11  /* set = cover attached */
-#define SW_MAX			0x11
+#define SW_EXT_PEN_ATTACHED	0x12  /* set = external pen attached */
+#define SW_MAX			0x12
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.17.1
