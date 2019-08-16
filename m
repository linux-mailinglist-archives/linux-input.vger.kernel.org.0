Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA5E8FE5E
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfHPIke (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:40:34 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1960 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfHPIiZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:25 -0400
IronPort-SDR: 4gzL5Cj/MXtPpSA9EvOy/iccVuutYVI44q2sqis7+glrCcAKQGu/wn9s9AChiiXFQWfetEnvzU
 L0sls6DV0kinmk75eDOgt81suO4Xnc9LRWYX5gyD7jmuaXU5n0jb9hANa2xulfrVM80hFIgXSS
 VWrmMFWqsd7G55iufhI+RxVT0uKTf+SwQDXXADg4r+SMbHldDHvF43DfY/HdMtGU7AekIudFyT
 3THmFPKwCqz9aqDuMdGOWkq1Ra3xKn30ERtC9xmWLr4ZxrnrwkRtMSIRDkARmGyRpiex70nm+8
 aU0=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484308"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:35:21 -0800
IronPort-SDR: 3f6OY2bjkIbVEFhk1mYWwAuOGf+wWqZM5xnHxKl1BnAKbr8cYvNzfOLPfszCPvuTXXVAZv11Dy
 e4rg1BIBuAeDt/qmSCr1nL3m6MxcylHCqcmnzodLiTA3r8ymfth1ywdBYFgQJigI4JtPqb/qoG
 KPEOvb3E//6Gg9SwZzxja5w87Ha/Tp1h7ez2tYpSpgOVmtuQhW6cBuB1+bHamWm7by7BiuAj6R
 VR6KkELOvxds1/VEImTGrPoA8cMRDAkV+f2oWPhyAPp2Uf6WinlB0iJZ0RpduVucGtcghu8ZJc
 gUs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 36/63] Input: atmel_mxt_ts - configure and use gpios as real gpios
Date:   Fri, 16 Aug 2019 17:34:58 +0900
Message-ID: <20190816083525.19071-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083525.19071-1-jiada_wang@mentor.com>
References: <20190816083525.19071-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Kautuk Consul <kautuk_consul@mentor.com>

The upstream Atmel mXT driver implementation seems to handle the
T19 GPIO/PWM object as a key pad. Keys can be defined in the
device tree ("linux,gpio-keymap") and will be transported as key
events to the Linux input device if GPIO state changes.

With our hardware, the GPIO pins of the touch controller are
connected to a PWM/backlight controller and used as supervision
inputs. We like to read the status of the pins by a script or an
application in the sysfs.

Adding newer sysfs entries which shall be placed in the input
class directory eg:
/sys/class/input/input<n>/backlight_error1

Signed-off-by: Kautuk Consul <kautuk_consul@mentor.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 .../bindings/input/atmel,maxtouch.txt         |  15 +++
 drivers/input/touchscreen/atmel_mxt_ts.c      | 120 ++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index d7db16920083..7afe12a93202 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -42,6 +42,9 @@ Optional properties for main touchpad device:
 
 - atmel,input_name: Override name of input device from the default.
 
+- atmel,gpios: Specify the GPIO input pins whose status will be read via the
+    /sys/class/input/input<n>/backlight_error<x> sysfs entries.
+
 Example:
 
 	touch@4b {
@@ -49,4 +52,16 @@ Example:
 		reg = <0x4b>;
 		interrupt-parent = <&gpio>;
 		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
+
+		atmel,gpios {
+			backlight_error1 {
+				gpio = <3 GPIO_ACTIVE_HIGH>; /* connected to
+							      * the GPIO3 pin of mXT input */
+			};
+
+			backlight_error2 {
+				gpio = <5 GPIO_ACTIVE_HIGH>; /* connected to
+							      * the GPIO5 pin of mXT input */
+			};
+		};
 	};
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 9cdb7754599c..a8e2b927bb12 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -414,6 +414,15 @@ struct mxt_data {
 
 	/* Indicates whether device is updating configuration */
 	bool updating_config;
+
+	unsigned long gpio_input_pin_status;
+	struct attribute_group gpio_attrs;
+	unsigned long gpio_input_pin_status_default;
+};
+
+struct mxt_gpio_attr {
+	struct device_attribute attr;
+	int bit_index;
 };
 
 struct mxt_vb2_buffer {
@@ -1381,6 +1390,7 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id == data->T19_reportid) {
 		mxt_input_button(data, message);
 		data->update_input = true;
+		data->gpio_input_pin_status = message[1];
 	} else if (report_id >= data->T15_reportid_min
 		   && report_id <= data->T15_reportid_max) {
 		mxt_proc_t15_messages(data, message);
@@ -2747,6 +2757,16 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 		goto err_free_mem;
 	}
 
+	if (data->gpio_attrs.attrs) {
+		error = sysfs_create_group(&input_dev->dev.kobj,
+					   &data->gpio_attrs);
+		if (error) {
+			dev_err(dev, "Failure %d creating sysfs group\n",
+				error);
+			goto err_free_mem;
+		}
+	}
+
 	data->input_dev = input_dev;
 
 	return 0;
@@ -3995,10 +4015,26 @@ static void mxt_input_close(struct input_dev *dev)
 		dev_err(&data->client->dev, "%s failed rc=%d\n", __func__, ret);
 }
 
+static ssize_t mxt_gpio_input_pin_read(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	struct mxt_gpio_attr *attr_p = container_of(attr, struct mxt_gpio_attr,
+						    attr);
+	int pin_status = test_bit(attr_p->bit_index,
+				  &data->gpio_input_pin_status);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", pin_status);
+}
+
 static int mxt_parse_device_properties(struct mxt_data *data)
 {
 	static const char keymap_property[] = "linux,gpio-keymap";
+	static const char gpios_property[] = "atmel,gpios";
 	struct device *dev = &data->client->dev;
+	struct device_node *np = dev ? dev->of_node : NULL;
+	struct device_node *np_gpio;
 	u32 *keymap;
 	int n_keys;
 	int error;
@@ -4036,7 +4072,89 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 
 	device_property_read_u32(dev, "atmel,suspend-mode", &data->suspend_mode);
 
+	np_gpio = of_get_child_by_name(np, gpios_property);
+	if (np_gpio) {
+		int gpio_pin;
+		struct mxt_gpio_attr *attr_p;
+		char *sysfs_gpio_file_name;
+		u8 num_gpio_pins = 0;
+
+		np_gpio = of_find_node_with_property(np_gpio, "gpio");
+		if (!np_gpio)
+			return -EINVAL;
+
+		data->gpio_attrs.attrs =
+			devm_kzalloc(dev,
+				     9 * sizeof(struct attribute *),
+				     GFP_KERNEL);
+		if (!data->gpio_attrs.attrs) {
+			error = -ENOMEM;
+			goto err_gpios_property_put;
+		}
+
+		do {
+			attr_p = devm_kmalloc(dev,
+					      sizeof(struct mxt_gpio_attr),
+					      GFP_KERNEL);
+			if (!attr_p) {
+				error = -ENOMEM;
+				goto err_gpios_property_put;
+			}
+
+			error = of_property_read_u32_index(np_gpio, "gpio", 0,
+							   &gpio_pin);
+			if (error) {
+				dev_warn(dev,
+					 "Couldn't read gpio property for node : %s\n",
+					 np_gpio->name);
+				error = -EINVAL;
+				goto err_gpios_property_put;
+			}
+
+			if (gpio_pin > 7) {
+				dev_warn(dev,
+					 "Incorrect GPIO pin index for node %s: %u\n",
+					 np_gpio->name, gpio_pin);
+				error = -EINVAL;
+				goto err_gpios_property_put;
+			}
+
+			sysfs_gpio_file_name =
+					devm_kmalloc(dev,
+						     strlen(np_gpio->name) + 1,
+						     GFP_KERNEL);
+			if (!sysfs_gpio_file_name) {
+				error = -ENOMEM;
+				goto err_gpios_property_put;
+			}
+
+			strcpy(sysfs_gpio_file_name, np_gpio->name);
+
+			sysfs_attr_init(&attr_p->attr.attr);
+
+			attr_p->attr.attr.name = sysfs_gpio_file_name;
+			attr_p->attr.attr.mode = 0444;
+			attr_p->attr.show = mxt_gpio_input_pin_read;
+			attr_p->attr.store = NULL;
+			attr_p->bit_index = gpio_pin;
+
+			data->gpio_input_pin_status_default |= BIT(gpio_pin);
+
+			data->gpio_attrs.attrs[num_gpio_pins++] =
+							&attr_p->attr.attr;
+		} while ((np_gpio =
+			  of_find_node_with_property(np_gpio, "gpio")) &&
+			 num_gpio_pins < 8);
+
+		if (np_gpio)
+			of_node_put(np_gpio);
+	}
+
 	return 0;
+
+err_gpios_property_put:
+	of_node_put(np_gpio);
+	return error;
 }
 
 static const struct dmi_system_id chromebook_T9_suspend_dmi[] = {
@@ -4106,6 +4224,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (error)
 		return error;
 
+	data->gpio_input_pin_status = data->gpio_input_pin_status_default;
+
 	if (data->pcfg_name)
 		mxt_update_file_name(&data->client->dev,
 				     &data->cfg_name,
-- 
2.19.2

