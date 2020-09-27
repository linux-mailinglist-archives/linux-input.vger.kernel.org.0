Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0914427A0F0
	for <lists+linux-input@lfdr.de>; Sun, 27 Sep 2020 14:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgI0Mdu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Sep 2020 08:33:50 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:56444 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgI0Mdu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Sep 2020 08:33:50 -0400
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9C6D63A4B50
        for <linux-input@vger.kernel.org>; Sun, 27 Sep 2020 12:33:47 +0000 (UTC)
Received: from pc.localdomain (unknown [195.189.32.242])
        (Authenticated sender: contact@artur-rojek.eu)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6F0F0200009;
        Sun, 27 Sep 2020 12:33:21 +0000 (UTC)
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v10 2/2] input: joystick: Add ADC attached joystick driver.
Date:   Sun, 27 Sep 2020 14:33:02 +0200
Message-Id: <20200927123302.31062-2-contact@artur-rojek.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927123302.31062-1-contact@artur-rojek.eu>
References: <20200927123302.31062-1-contact@artur-rojek.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a driver for joystick devices connected to ADC controllers
supporting the Industrial I/O subsystem.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---

Changes:
    v8:  - respect scan index when reading channel data,
         - solve sparse warnings related to *_to_cpu calls,
         - simplify channel count logic,
         - drop the redundant comma from adc_joystick_of_match[]
    
    v9:  - use `dev_err_probe`,
         - add missing CR to error messages,
         - remove unnecessary line breaks in `adc_joystick_set_axes`,
         - remove redundant error code print from `adc_joystick_probe`,
         - no need to pass `dev.parent` to `dev_err` in `adc_joystick_open`,
         - print error code in `adc_joystick_open`,
    
    v10: - remove redundant parentheses around `==` in `adc_joystick_handle`,
         - use `get_unaligned` to hide explicit casts to restricted types,
         - change `err` label to `err_fwnode_put`,
         - change `ret` to `error` in `adc_joystick_set_axes`,
         - drop `dev_err_probe` usage per Dmitry's request,
         - remove redundant parentheses in channel storage size calculation

 drivers/input/joystick/Kconfig        |  10 +
 drivers/input/joystick/Makefile       |   1 +
 drivers/input/joystick/adc-joystick.c | 260 ++++++++++++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 drivers/input/joystick/adc-joystick.c

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index eb031b7a4866..b080f0cfb068 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -42,6 +42,16 @@ config JOYSTICK_A3D
 	  To compile this driver as a module, choose M here: the
 	  module will be called a3d.
 
+config JOYSTICK_ADC
+	tristate "Simple joystick connected over ADC"
+	depends on IIO
+	select IIO_BUFFER_CB
+	help
+	  Say Y here if you have a simple joystick connected over ADC.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called adc-joystick.
+
 config JOYSTICK_ADI
 	tristate "Logitech ADI digital joysticks and gamepads"
 	select GAMEPORT
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
index 8656023f6ef5..58232b3057d3 100644
--- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -6,6 +6,7 @@
 # Each configuration option enables a list of files.
 
 obj-$(CONFIG_JOYSTICK_A3D)		+= a3d.o
+obj-$(CONFIG_JOYSTICK_ADC)		+= adc-joystick.o
 obj-$(CONFIG_JOYSTICK_ADI)		+= adi.o
 obj-$(CONFIG_JOYSTICK_AMIGA)		+= amijoy.o
 obj-$(CONFIG_JOYSTICK_AS5011)		+= as5011.o
diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
new file mode 100644
index 000000000000..2ca0ada34a80
--- /dev/null
+++ b/drivers/input/joystick/adc-joystick.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Input driver for joysticks connected over ADC.
+ * Copyright (c) 2019-2020 Artur Rojek <contact@artur-rojek.eu>
+ */
+#include <linux/ctype.h>
+#include <linux/input.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/consumer.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include <asm/unaligned.h>
+
+struct adc_joystick_axis {
+	u32 code;
+	s32 range[2];
+	s32 fuzz;
+	s32 flat;
+};
+
+struct adc_joystick {
+	struct input_dev *input;
+	struct iio_cb_buffer *buffer;
+	struct adc_joystick_axis *axes;
+	struct iio_channel *chans;
+	int num_chans;
+};
+
+static int adc_joystick_handle(const void *data, void *private)
+{
+	struct adc_joystick *joy = private;
+	enum iio_endian endianness;
+	int bytes, msb, val, idx, i;
+	const u16 *data_u16;
+	bool sign;
+
+	bytes = joy->chans[0].channel->scan_type.storagebits >> 3;
+
+	for (i = 0; i < joy->num_chans; ++i) {
+		idx = joy->chans[i].channel->scan_index;
+		endianness = joy->chans[i].channel->scan_type.endianness;
+		msb = joy->chans[i].channel->scan_type.realbits - 1;
+		sign = tolower(joy->chans[i].channel->scan_type.sign) == 's';
+
+		switch (bytes) {
+		case 1:
+			val = ((const u8 *)data)[idx];
+			break;
+		case 2:
+			data_u16 = (const u16 *)data + idx;
+
+			/*
+			 * Data is aligned to the sample size by IIO core.
+			 * Call `get_unaligned_xe16` to hide type casting.
+			 */
+			if (endianness == IIO_BE)
+				val = get_unaligned_be16(data_u16);
+			else if (endianness == IIO_LE)
+				val = get_unaligned_le16(data_u16);
+			else /* IIO_CPU */
+				val = *data_u16;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		val >>= joy->chans[i].channel->scan_type.shift;
+		if (sign)
+			val = sign_extend32(val, msb);
+		else
+			val &= GENMASK(msb, 0);
+		input_report_abs(joy->input, joy->axes[i].code, val);
+	}
+
+	input_sync(joy->input);
+
+	return 0;
+}
+
+static int adc_joystick_open(struct input_dev *dev)
+{
+	struct adc_joystick *joy = input_get_drvdata(dev);
+	struct device *devp = &dev->dev;
+	int ret;
+
+	ret = iio_channel_start_all_cb(joy->buffer);
+	if (ret)
+		dev_err(devp, "Unable to start callback buffer: %d\n", ret);
+
+	return ret;
+}
+
+static void adc_joystick_close(struct input_dev *dev)
+{
+	struct adc_joystick *joy = input_get_drvdata(dev);
+
+	iio_channel_stop_all_cb(joy->buffer);
+}
+
+static void adc_joystick_cleanup(void *data)
+{
+	iio_channel_release_all_cb(data);
+}
+
+static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
+{
+	struct adc_joystick_axis *axes;
+	struct fwnode_handle *child;
+	int num_axes, error, i;
+
+	num_axes = device_get_child_node_count(dev);
+	if (!num_axes) {
+		dev_err(dev, "Unable to find child nodes\n");
+		return -EINVAL;
+	}
+
+	if (num_axes != joy->num_chans) {
+		dev_err(dev, "Got %d child nodes for %d channels\n",
+			num_axes, joy->num_chans);
+		return -EINVAL;
+	}
+
+	axes = devm_kmalloc_array(dev, num_axes, sizeof(*axes), GFP_KERNEL);
+	if (!axes)
+		return -ENOMEM;
+
+	device_for_each_child_node(dev, child) {
+		error = fwnode_property_read_u32(child, "reg", &i);
+		if (error) {
+			dev_err(dev, "reg invalid or missing\n");
+			goto err_fwnode_put;
+		}
+
+		if (i >= num_axes) {
+			error = -EINVAL;
+			dev_err(dev, "No matching axis for reg %d\n", i);
+			goto err_fwnode_put;
+		}
+
+		error = fwnode_property_read_u32(child, "linux,code",
+						 &axes[i].code);
+		if (error) {
+			dev_err(dev, "linux,code invalid or missing\n");
+			goto err_fwnode_put;
+		}
+
+		error = fwnode_property_read_u32_array(child, "abs-range",
+						       axes[i].range, 2);
+		if (error) {
+			dev_err(dev, "abs-range invalid or missing\n");
+			goto err_fwnode_put;
+		}
+
+		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
+		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
+
+		input_set_abs_params(joy->input, axes[i].code,
+				     axes[i].range[0], axes[i].range[1],
+				     axes[i].fuzz, axes[i].flat);
+		input_set_capability(joy->input, EV_ABS, axes[i].code);
+	}
+
+	joy->axes = axes;
+
+	return 0;
+
+err_fwnode_put:
+	fwnode_handle_put(child);
+	return error;
+}
+
+static int adc_joystick_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct adc_joystick *joy;
+	struct input_dev *input;
+	int bits, ret, i;
+
+	joy = devm_kzalloc(dev, sizeof(*joy), GFP_KERNEL);
+	if (!joy)
+		return -ENOMEM;
+
+	joy->chans = devm_iio_channel_get_all(dev);
+	if (IS_ERR(joy->chans)) {
+		ret = PTR_ERR(joy->chans);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Unable to get IIO channels");
+		return ret;
+	}
+
+	/* Count how many channels we got. NULL terminated. */
+	for (i = 0; joy->chans[i].indio_dev; ++i) {
+		bits = joy->chans[i].channel->scan_type.storagebits;
+		if (!bits || bits > 16) {
+			dev_err(dev, "Unsupported channel storage size\n");
+			return -EINVAL;
+		}
+		if (bits != joy->chans[0].channel->scan_type.storagebits) {
+			dev_err(dev, "Channels must have equal storage size\n");
+			return -EINVAL;
+		}
+	}
+	joy->num_chans = i;
+
+	input = devm_input_allocate_device(dev);
+	if (!input) {
+		dev_err(dev, "Unable to allocate input device\n");
+		return -ENOMEM;
+	}
+
+	joy->input = input;
+	input->name = pdev->name;
+	input->id.bustype = BUS_HOST;
+	input->open = adc_joystick_open;
+	input->close = adc_joystick_close;
+
+	ret = adc_joystick_set_axes(dev, joy);
+	if (ret)
+		return ret;
+
+	input_set_drvdata(input, joy);
+	ret = input_register_device(input);
+	if (ret) {
+		dev_err(dev, "Unable to register input device\n");
+		return ret;
+	}
+
+	joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
+	if (IS_ERR(joy->buffer)) {
+		dev_err(dev, "Unable to allocate callback buffer\n");
+		return PTR_ERR(joy->buffer);
+	}
+
+	ret = devm_add_action_or_reset(dev, adc_joystick_cleanup, joy->buffer);
+	if (ret)
+		dev_err(dev, "Unable to add action\n");
+
+	return ret;
+}
+
+static const struct of_device_id adc_joystick_of_match[] = {
+	{ .compatible = "adc-joystick", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adc_joystick_of_match);
+
+static struct platform_driver adc_joystick_driver = {
+	.driver = {
+		.name = "adc-joystick",
+		.of_match_table = adc_joystick_of_match,
+	},
+	.probe = adc_joystick_probe,
+};
+module_platform_driver(adc_joystick_driver);
+
+MODULE_DESCRIPTION("Input driver for joysticks connected over ADC");
+MODULE_AUTHOR("Artur Rojek <contact@artur-rojek.eu>");
+MODULE_LICENSE("GPL");
-- 
2.28.0

