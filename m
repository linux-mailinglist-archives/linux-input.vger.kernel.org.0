Return-Path: <linux-input+bounces-5666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3657956D98
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 16:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55C21C21B7C
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238F5176ABA;
	Mon, 19 Aug 2024 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="19fmF3nW"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD2517333D;
	Mon, 19 Aug 2024 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724078422; cv=none; b=J7Bd6VTCO9FOf+FLIYTI7VPeUS2hUPFcbt9UPgdjoxlDt8GW2DOXnABzguQRAyKGYavu9j03FsS6nUo4VriQv7Z3zsL9QhUiOiZAEds4TP21Qpl5hTSRGEvaREGqm+IjH5llg40F0NZwb+o8VdCXaVV0gsHhmeluQn5Cjl8PxQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724078422; c=relaxed/simple;
	bh=or3lpBruu36hgeVLQUcVHeZfGGklmFF2xyUl8RNqT6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgTgxVMmaGN0hLI6XHaKj2AuOItDY1exsB8zkMgET2UUR3DAfwxhLmtXGUBZ9Ns3j1HiT9ONV7ymFkkLTeei6lEJJWTZQcFz7fnf/0RcSq4T3BlpoNoxmID1zP1eaMHF1Bc8HQ0dNoAKv/q+KyOnPR6JoBc9Nuy8W4Spboo4K2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=19fmF3nW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6KzO4rM+z00foz+5MVM3DOFnZjYF4dMpH1rlapnvcjQ=; b=19fmF3nW6CWoqK0hbWwTGMt6iL
	0HeP8O8vT3F+BVSdUXTS92Q+SWHnOs8h0pDHag81b+eVZO8mdfZEf+FgavrZBltcMKWcfVosmVKXu
	Cmn9CCVl7aRGLveJlWeTFvqzli7xVwxv0zRTeiZzr128Oq3ARotyG2oDjC5kuuTxGSjawMrAuhlE6
	1h84DCdKtDkznsKcW7nBqMkk4ALxHa33QHpZscAmdVNdw1QjOYPNiXo2WWv1Rb0hRZeyBE1zJU2yC
	d3KbgxpF6OcafrSwGqR0bsYv9xwVN8t2mcS8UUZKnRPxLzo7kyX7Upyfkfvu7oe1PPTnUPh7DRIBu
	gtfWMhFA==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sg3YD-00014n-7j; Mon, 19 Aug 2024 16:40:05 +0200
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
Subject: [PATCH v5 2/7] mfd: add base driver for qnap-mcu devices
Date: Mon, 19 Aug 2024 16:39:55 +0200
Message-ID: <20240819144000.411846-3-heiko@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819144000.411846-1-heiko@sntech.de>
References: <20240819144000.411846-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These microcontroller units are used in network-attached-storage devices
made by QNAP and provide additional functionality to the system.

This adds the base driver that implements the serial protocol via
serdev and additionally hooks into the poweroff handlers to turn
off the parts of the system not supplied by the general PMIC.

Turning off (at least the TSx33 devices using Rockchip SoCs) consists of
two separate actions. Turning off the MCU alone does not turn off the main
SoC and turning off only the SoC/PMIC does not turn off the hard-drives.
Also if the MCU is not turned off, the system also won't start again until
it is unplugged from power.

So on shutdown the MCU needs to be turned off separately before the
main PMIC.

The protocol spoken by the MCU is sadly not documented, but was
obtained by listening to the chatter on the serial port, as thankfully
the "hal_app" program from QNAPs firmware allows triggering all/most
MCU actions from the command line.

The implementation of how to talk to the serial device got some
inspiration from the rave-sp servdev driver.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 MAINTAINERS                  |   6 +
 drivers/mfd/Kconfig          |  13 ++
 drivers/mfd/Makefile         |   2 +
 drivers/mfd/qnap-mcu.c       | 347 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/qnap-mcu.h |  27 +++
 5 files changed, 395 insertions(+)
 create mode 100644 drivers/mfd/qnap-mcu.c
 create mode 100644 include/linux/mfd/qnap-mcu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e7359ac005c..0fbd2d953da4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18654,6 +18654,12 @@ L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/media/tuners/qm1d1c0042*
 
+QNAP MCU DRIVER
+M:	Heiko Stuebner <heiko@sntech.de>
+S:	Maintained
+F:	drivers/mfd/qnap-mcu.c
+F:	include/linux/qnap-mcu.h
+
 QNX4 FILESYSTEM
 M:	Anders Larsen <al@alarsen.net>
 S:	Maintained
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index bc8be2e593b6..d43d2747ac4e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2362,6 +2362,19 @@ config MFD_INTEL_M10_BMC_PMCI
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_QNAP_MCU
+	tristate "QNAP microcontroller unit core driver"
+	depends on SERIAL_DEV_BUS
+	select MFD_CORE
+	help
+	  Select this to get support for the QNAP MCU device found in
+	  several devices of QNAP network attached storage devices that
+	  implements additional functionality for the device, like
+	  fan- and LED control.
+
+	  This driver implements the base serial protocol to talk to the
+	  device and provides functions for the other parts to hook into.
+
 config MFD_RSMU_I2C
 	tristate "Renesas Synchronization Management Unit with I2C"
 	depends on I2C && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 02b651cd7535..fc8b825725ff 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -286,5 +286,7 @@ obj-$(CONFIG_MFD_INTEL_M10_BMC_PMCI)   += intel-m10-bmc-pmci.o
 obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
 obj-$(CONFIG_MFD_ATC260X_I2C)	+= atc260x-i2c.o
 
+obj-$(CONFIG_MFD_QNAP_MCU)	+= qnap-mcu.o
+
 obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu_i2c.o rsmu_core.o
 obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
diff --git a/drivers/mfd/qnap-mcu.c b/drivers/mfd/qnap-mcu.c
new file mode 100644
index 000000000000..8abe1414da54
--- /dev/null
+++ b/drivers/mfd/qnap-mcu.c
@@ -0,0 +1,347 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Core driver for the microcontroller unit in QNAP NAS devices that is
+ * connected via a dedicated UART port.
+ *
+ * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/export.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/qnap-mcu.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reboot.h>
+#include <linux/serdev.h>
+#include <linux/slab.h>
+
+/* The longest command found so far is 5 bytes long */
+#define QNAP_MCU_MAX_CMD_SIZE		5
+#define QNAP_MCU_MAX_DATA_SIZE		36
+#define QNAP_MCU_CHECKSUM_SIZE		1
+
+#define QNAP_MCU_RX_BUFFER_SIZE		\
+		(QNAP_MCU_MAX_DATA_SIZE + QNAP_MCU_CHECKSUM_SIZE)
+
+#define QNAP_MCU_TX_BUFFER_SIZE		\
+		(QNAP_MCU_MAX_CMD_SIZE + QNAP_MCU_CHECKSUM_SIZE)
+
+#define QNAP_MCU_ACK_LEN		2
+#define QNAP_MCU_VERSION_LEN		4
+
+/**
+ * struct qnap_mcu_reply - Reply to a command
+ *
+ * @data:	Buffer to store reply payload in
+ * @length:	Expected reply length, including the checksum
+ * @received:	Received number of bytes, so far
+ * @done:	Triggered when the entire reply has been received
+ */
+struct qnap_mcu_reply {
+	u8 *data;
+	size_t length;
+	size_t received;
+	struct completion done;
+};
+
+/**
+ * struct qnap_mcu - QNAP NAS embedded controller
+ *
+ * @serdev:	Pointer to underlying serdev
+ * @bus_lock:	Lock to serialize access to the device
+ * @reply_lock:	Lock protecting @reply
+ * @reply:	Pointer to memory to store reply payload
+ * @variant:	Device variant specific information
+ * @version:	MCU firmware version
+ */
+struct qnap_mcu {
+	struct serdev_device *serdev;
+	struct mutex bus_lock;
+	struct qnap_mcu_reply reply;
+	const struct qnap_mcu_variant *variant;
+	u8 version[QNAP_MCU_VERSION_LEN];
+};
+
+/*
+ * The QNAP-MCU uses a basic XOR checksum.
+ * It is always the last byte and XORs the whole previous message.
+ */
+static u8 qnap_mcu_csum(const u8 *buf, size_t size)
+{
+	u8 csum = 0;
+
+	while (size--)
+		csum ^= *buf++;
+
+	return csum;
+}
+
+static int qnap_mcu_write(struct qnap_mcu *mcu, const u8 *data, u8 data_size)
+{
+	unsigned char tx[QNAP_MCU_TX_BUFFER_SIZE];
+	size_t length = data_size + QNAP_MCU_CHECKSUM_SIZE;
+
+	if (length > sizeof(tx)) {
+		dev_err(&mcu->serdev->dev, "data too big for transmit buffer");
+		return -EINVAL;
+	}
+
+	memcpy(tx, data, data_size);
+	tx[data_size] = qnap_mcu_csum(data, data_size);
+
+	return serdev_device_write(mcu->serdev, tx, length, HZ);
+}
+
+static size_t qnap_mcu_receive_buf(struct serdev_device *serdev, const u8 *buf, size_t size)
+{
+	struct device *dev = &serdev->dev;
+	struct qnap_mcu *mcu = dev_get_drvdata(dev);
+	struct qnap_mcu_reply *reply = &mcu->reply;
+	const u8 *src = buf;
+	const u8 *end = buf + size;
+
+	if (!reply->length) {
+		dev_warn(dev, "Received %zu bytes, we were not waiting for\n",
+			 size);
+		return size;
+	}
+
+	while (src < end) {
+		reply->data[reply->received] = *src++;
+		reply->received++;
+
+		if (reply->received == reply->length) {
+			complete(&reply->done);
+
+			/*
+			 * We report the consumed number of bytes. If there
+			 * are still bytes remaining (though there shouldn't)
+			 * the serdev layer will re-execute this handler with
+			 * the remainder of the Rx bytes.
+			 */
+			return src - buf;
+		}
+	}
+
+	/*
+	 * The only way to get out of the above loop and end up here
+	 * is through consuming all of the supplied data, so here we
+	 * report that we processed it all.
+	 */
+	return size;
+}
+
+static const struct serdev_device_ops qnap_mcu_serdev_device_ops = {
+	.receive_buf  = qnap_mcu_receive_buf,
+	.write_wakeup = serdev_device_write_wakeup,
+};
+
+int qnap_mcu_exec(struct qnap_mcu *mcu,
+		  const u8 *cmd_data, size_t cmd_data_size,
+		  u8 *reply_data, size_t reply_data_size)
+{
+	unsigned char rx[QNAP_MCU_RX_BUFFER_SIZE];
+	size_t length = reply_data_size + QNAP_MCU_CHECKSUM_SIZE;
+	struct qnap_mcu_reply *reply = &mcu->reply;
+	int ret;
+
+	if (length > sizeof(rx)) {
+		dev_err(&mcu->serdev->dev, "expected data too big for receive buffer");
+		return -EINVAL;
+	}
+
+	mutex_lock(&mcu->bus_lock);
+
+	/* Initialize reply fields */
+	reply->data = rx,
+	reply->length = length,
+	reply->received = 0,
+	reinit_completion(&reply->done);
+
+	qnap_mcu_write(mcu, cmd_data, cmd_data_size);
+
+	if (!wait_for_completion_timeout(&reply->done,
+					 msecs_to_jiffies(1000))) {
+		dev_err(&mcu->serdev->dev, "Command timeout\n");
+		ret = -ETIMEDOUT;
+	} else {
+		u8 crc = qnap_mcu_csum(rx, reply_data_size);
+
+		if (crc != rx[reply_data_size]) {
+			dev_err(&mcu->serdev->dev,
+				"Checksum 0x%02x wrong for data\n", crc);
+			ret = -EIO;
+		} else {
+			memcpy(reply_data, rx, reply_data_size);
+			ret = 0;
+		}
+	}
+
+	/* We don't expect any characters from the device now */
+	reply->length = 0;
+
+	mutex_unlock(&mcu->bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qnap_mcu_exec);
+
+int qnap_mcu_exec_with_ack(struct qnap_mcu *mcu,
+			   const u8 *cmd_data, size_t cmd_data_size)
+{
+	u8 ack[QNAP_MCU_ACK_LEN];
+	int ret;
+
+	ret = qnap_mcu_exec(mcu, cmd_data, cmd_data_size, ack, sizeof(ack));
+	if (ret)
+		return ret;
+
+	/* Should return @0 */
+	if (ack[0] != 0x40 || ack[1] != 0x30) {
+		dev_err(&mcu->serdev->dev, "Did not receive ack\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qnap_mcu_exec_with_ack);
+
+const struct qnap_mcu_variant *qnap_mcu_get_variant_data(struct qnap_mcu *mcu)
+{
+	return mcu->variant;
+}
+EXPORT_SYMBOL_GPL(qnap_mcu_get_variant_data);
+
+static int qnap_mcu_get_version(struct qnap_mcu *mcu)
+{
+	const u8 cmd[] = {
+		[0] = 0x25, /* % */
+		[1] = 0x56  /* V */
+	};
+	u8 rx[14];
+	int ret;
+
+	/* Reply is the 2 command-bytes + 4 bytes describing the version */
+	ret = qnap_mcu_exec(mcu, cmd, sizeof(cmd), rx, QNAP_MCU_VERSION_LEN + 2);
+	if (ret)
+		return ret;
+
+	memcpy(mcu->version, &rx[2], QNAP_MCU_VERSION_LEN);
+
+	return 0;
+}
+
+/*
+ * The MCU controls power to the peripherals but not the CPU.
+ *
+ * So using the pmic to power off the system keeps the MCU and hard-drives
+ * running. This also then prevents the system from turning back on until
+ * the MCU is turned off by unplugging the power-cable.
+ * Turning off the MCU alone on the other hand turns off the hard-drives,
+ * LEDs, etc while the main SoC stays running - including its network ports.
+ */
+static int qnap_mcu_power_off(struct sys_off_data *data)
+{
+	struct qnap_mcu *mcu = data->cb_data;
+	int ret;
+	const u8 cmd[] = {
+		[0] = 0x40, /* @ */
+		[1] = 0x43, /* C */
+		[2] = 0x30  /* 0 */
+	};
+
+	ret = qnap_mcu_exec_with_ack(mcu, cmd, sizeof(cmd));
+	if (ret) {
+		dev_err(&mcu->serdev->dev, "MCU poweroff failed %d\n", ret);
+		return NOTIFY_STOP;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static const struct qnap_mcu_variant qnap_ts433_mcu = {
+	.baud_rate = 115200,
+	.num_drives = 4,
+	.fan_pwm_min = 51,  /* Specified in original model.conf */
+	.fan_pwm_max = 255,
+	.usb_led = true,
+};
+
+static const struct of_device_id qnap_mcu_dt_ids[] = {
+	{ .compatible = "qnap,ts433-mcu", .data = &qnap_ts433_mcu },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, qnap_mcu_dt_ids);
+
+static const struct mfd_cell qnap_mcu_subdevs[] = {
+	{ .name = "qnap-mcu-input", },
+	{ .name = "qnap-mcu-leds", },
+	{ .name = "qnap-mcu-hwmon", }
+};
+
+static int qnap_mcu_probe(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct qnap_mcu *mcu;
+	int ret;
+
+	mcu = devm_kzalloc(dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	mcu->serdev = serdev;
+	dev_set_drvdata(dev, mcu);
+
+	mcu->variant = of_device_get_match_data(dev);
+	if (!mcu->variant)
+		return -ENODEV;
+
+	mutex_init(&mcu->bus_lock);
+	init_completion(&mcu->reply.done);
+
+	serdev_device_set_client_ops(serdev, &qnap_mcu_serdev_device_ops);
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return ret;
+
+	serdev_device_set_baudrate(serdev, mcu->variant->baud_rate);
+	serdev_device_set_flow_control(serdev, false);
+
+	ret = serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+	if (ret) {
+		dev_err(dev, "Failed to set parity\n");
+		return ret;
+	}
+
+	ret = qnap_mcu_get_version(mcu);
+	if (ret)
+		return ret;
+
+	ret = devm_register_sys_off_handler(dev,
+					    SYS_OFF_MODE_POWER_OFF_PREPARE,
+					    SYS_OFF_PRIO_DEFAULT,
+					    &qnap_mcu_power_off, mcu);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register poweroff handler\n");
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, qnap_mcu_subdevs,
+				   ARRAY_SIZE(qnap_mcu_subdevs), NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add child devices\n");
+
+	return 0;
+}
+
+static struct serdev_device_driver qnap_mcu_drv = {
+	.probe = qnap_mcu_probe,
+	.driver = {
+		.name = "qnap-mcu",
+		.of_match_table = qnap_mcu_dt_ids,
+	},
+};
+module_serdev_device_driver(qnap_mcu_drv);
+
+MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
+MODULE_DESCRIPTION("QNAP MCU core driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/qnap-mcu.h b/include/linux/mfd/qnap-mcu.h
new file mode 100644
index 000000000000..903b923537c7
--- /dev/null
+++ b/include/linux/mfd/qnap-mcu.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Core definitions for QNAP MCU MFD driver.
+ * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
+ */
+
+#ifndef _LINUX_QNAP_MCU_H_
+#define _LINUX_QNAP_MCU_H_
+
+struct qnap_mcu;
+
+struct qnap_mcu_variant {
+	u32 baud_rate;
+	int num_drives;
+	int fan_pwm_min;
+	int fan_pwm_max;
+	bool usb_led;
+};
+
+int qnap_mcu_exec(struct qnap_mcu *mcu,
+		  const u8 *cmd_data, size_t cmd_data_size,
+		  u8 *reply_data, size_t reply_data_size);
+int qnap_mcu_exec_with_ack(struct qnap_mcu *mcu,
+			   const u8 *cmd_data, size_t cmd_data_size);
+const struct qnap_mcu_variant *qnap_mcu_get_variant_data(struct qnap_mcu *mcu);
+
+#endif /* _LINUX_QNAP_MCU_H_ */
-- 
2.43.0


