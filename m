Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E001229ECE6
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 14:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgJ2N15 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 09:27:57 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:53182 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgJ2N14 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 09:27:56 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201029132750epoutp03f7ad3ebfee20e1f301ff0aa740a37b4b~CeY6IIVmb2987329873epoutp03Q
        for <linux-input@vger.kernel.org>; Thu, 29 Oct 2020 13:27:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201029132750epoutp03f7ad3ebfee20e1f301ff0aa740a37b4b~CeY6IIVmb2987329873epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603978070;
        bh=z6xKE7X4wUyHi5WnCm+oRVAzMTbnQGKiQgnP8exGeVc=;
        h=Subject:Reply-To:From:To:CC:Date:References:From;
        b=nk64fEtQ/Ut5K1yL8tQxJpujfTKaBnSRdwxMXfXxPchbvXC10AB4fKxd0u/c+F+uw
         eVquB/LhGDMuJJaz54QLRpJXmxw1qn441hiTCRTuBZBpPIdq0ZVzaaCQg+B7+Ze4Dk
         lukn0nOzMSHvRWWAoqgBOSw3nuk7XIBnY4MiJkCc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20201029132749epcas1p35683de5659bf2516b417c88b77ca86fa~CeY49Cxn-2504125041epcas1p39;
        Thu, 29 Oct 2020 13:27:49 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.166]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4CMR841CnkzMqYkW; Thu, 29 Oct
        2020 13:27:48 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-7a-5f9ac354e21d
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        F5.0A.10463.453CA9F5; Thu, 29 Oct 2020 22:27:48 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH v2] input: add 2 kind of switch
Reply-To: hj2.im@samsung.com
Sender: HyungJae Im <hj2.im@samsung.com>
From:   HyungJae Im <hj2.im@samsung.com>
To:     HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>
CC:     Jungrae Kim <jryu.kim@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
Date:   Thu, 29 Oct 2020 22:27:47 +0900
X-CMS-MailID: 20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDKsWRmVeSWpSXmKPExsWy7bCmnm7I4VnxBntbWS2aF69ns1gw3c7i
        8LYJTBY3P31jtbi8aw6bxd2WTlaLE9+mMTmwe3xe9YrV4861PWwe++euYffo27KK0ePzJrkA
        1qgcm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygK5QU
        yhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BYYGBXrFibnFpXnpesn5uVaGBgZGpkCV
        CTkZJycFFexqZKw41/yCuYFxZXYXIyeHhICJxM/2ZyxdjFwcQgI7GCUeXDzJ3MXIwcErICjx
        d4cwSI2wgL7EyZVfWUDCQgIyEl17jCDCGhJLWz4zgthsAmoSv9fsYQMZIyJwnUmic/N5ZpAE
        M1Di6YF2RohdvBIz2p+yQNjSEtuXb4WKi0rcXP2WHcZ+f2w+VFxEovXeWWYIW1Diwc/djDC9
        S68sZgJZJiHQzihx8eYvVginhVFiwdLDbBBV+hJX+mcygdi8Ar4Sc+f9AtvAIqAqsXTTb6ht
        LhK7bu5jhbhUXmL72zlgzzMLaEqs36UPUaIosfP3XEaIEj6Jd197WGGe2THvCROErSCxcdEn
        qLViErPm3YZ60kNibfM7sFVCAoES8xpa2SYwys9CBO8sJItnISxewMi8ilEstaA4Nz212LDA
        BDlGNzGCk6GWxQ7GuW8/6B1iZOJgPMQowcGsJML7QnBmvBBvSmJlVWpRfnxRaU5q8SFGU6CX
        JzJLiSbnA9NxXkm8oamRsbGxhYmZuZmpsZI47x/tjnghgfTEktTs1NSC1CKYPiYOTqkGJp+d
        FjJPmFqOpJhFxfz9oJ+YVngl7EOivsLFe2cMRIX6P7OeehzEmKbT17F8o+KXoF3HJUI+zOud
        +/BTy0zVhXe4+WO5HRLsqyu/X1rJ4sy5tPjIQo28ZUurLmyWYlLfMsnwffEm9fX5lzboG2ft
        Kc7MvCLhPFd60+OpDVypPNvP6m8oedrHzqrRu3Gxl/nnjkwL588ZRd8/Nel03ZNIE9usZPnn
        yLenrWm8f0133lI3zva4elzU/ebyrIW/GuYZnP+QeUb33jbxl6tcK7rSP0WvtVa0sXdrXcDa
        N9nKLa9bKeG/pezSX3JzC1SEZZdXOOZa6324sdMuMtu8dQHDlIq30v052+M3NxjLObArsRRn
        JBpqMRcVJwIANc3ZxA8EAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf
References: <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "hj2.im" <hj2.im@samsung.com>
Date: Thu, 29 Oct 2020 22:11:24 +0900
Subject: [PATCH v2] input: add 2 kind of switch

We need support to various accessories on the device,
some switch does not exist in switch list.
So added switch for the following purpose.

SW_COVER_ATTACHED is for the checking the cover
attached or not on the device. SW_EXT_PEN_ATTACHED is for the
checking the external pen attached or not on the device

Signed-off-by: Hyungjae Im <hj2.im@samsung.com>
---
 drivers/input/Kconfig                  |  20 ++
 drivers/input/Makefile                 |   3 +
 drivers/input/cover_detect.c           | 242 ++++++++++++++++++++++++
 drivers/input/ext_pen_detect.c         | 243 +++++++++++++++++++++++++
 include/linux/mod_devicetable.h        |   2 +-
 include/uapi/linux/input-event-codes.h |   4 +-
 6 files changed, 512 insertions(+), 2 deletions(-)
 create mode 100644 drivers/input/cover_detect.c
 create mode 100644 drivers/input/ext_pen_detect.c

diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 1efd3154b68d..df902f4a549e 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -185,6 +185,26 @@ config INPUT_APMPOWER
 	  To compile this driver as a module, choose M here: the
 	  module will be called apm-power.
 
+config COVER_DETECT
+	tristate "Enable cover attach detection"
+	default n
+	help
+	  Say Y here to enable cover attach detection
+	  and send a event when cover is attached/detached.
+	  Active gpio state is low and active event value is 0.
+
+	  If unsure, say N.
+
+config EXT_PEN_DETECT
+	tristate "Enable external pen attach detection"
+	default n
+	help
+	  Say Y here to enable external pen attach detection
+	  and send a event when external pen is attached/detached.
+	  Active gpio state is low and active event value is 0.
+
+	  If unsure, say N.
+
 comment "Input Device Drivers"
 
 source "drivers/input/keyboard/Kconfig"
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index e35650930371..31ee1f2d2e21 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -29,3 +29,6 @@ obj-$(CONFIG_INPUT_MISC)	+= misc/
 obj-$(CONFIG_INPUT_APMPOWER)	+= apm-power.o
 
 obj-$(CONFIG_RMI4_CORE)		+= rmi4/
+
+obj-$(CONFIG_COVER_DETECT)	+= cover_detect.o
+obj-$(CONFIG_EXT_PEN_DETECT)	+= ext_pen_detect.o
diff --git a/drivers/input/cover_detect.c b/drivers/input/cover_detect.c
new file mode 100644
index 000000000000..4d3d68c616ec
--- /dev/null
+++ b/drivers/input/cover_detect.c
@@ -0,0 +1,242 @@
+/*
+ * Copyright (C) 2015 Samsung Electronics Co. Ltd. All Rights Reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
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
diff --git a/drivers/input/ext_pen_detect.c b/drivers/input/ext_pen_detect.c
new file mode 100644
index 000000000000..3595b967718b
--- /dev/null
+++ b/drivers/input/ext_pen_detect.c
@@ -0,0 +1,243 @@
+/*
+ * Copyright (C) 2015 Samsung Electronics Co. Ltd. All Rights Reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
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
index 5b08a473cdba..897f5a3e7721 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -320,7 +320,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x10
+#define INPUT_DEVICE_ID_SW_MAX		0x12
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 0c2e27d28e0a..8ca2acee1f92 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -889,7 +889,9 @@
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER	0x10  /* set = cover closed */
-#define SW_MAX			0x10
+#define SW_COVER_ATTACHED	0x11  /* set = cover attached */
+#define SW_EXT_PEN_ATTACHED	0x12  /* set = external pen attached */
+#define SW_MAX			0x12
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.17.1
