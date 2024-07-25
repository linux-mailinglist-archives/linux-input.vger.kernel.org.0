Return-Path: <linux-input+bounces-5156-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C121393C907
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 21:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E43F01C21D8E
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 19:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD2B1442F6;
	Thu, 25 Jul 2024 19:46:17 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B422770E2;
	Thu, 25 Jul 2024 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936777; cv=none; b=sLYLSDJ0F8dMExekcrfmVQtMPR0uRRIhnDWT41Ti7jzdpQSjH2PipB6Gfcg+pXMr5tQgjppQLrdI280L5ab/7sLWYXbdPlY8QQ2Lhqc+kUqVlx+3MoYLhxarGR13MsOGg4rvfiirQZl4OuIXn0X8sqjzmGOWJtpDgfrzUFwuLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936777; c=relaxed/simple;
	bh=ZpyhApMQb22/GhpSoYCzLcrMtx4K1hIsSejEpr8rl3E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oH3CA7zx+BCOX6LcT8Vbci3G98TRiKsnBo7CkzwDy3BE/NIMSeyNfiBUv81xJayxI6iskrBeKG7rPUW2yCngGOg6NH8kkGoHJJ2RVkyij7yz7a4epJ2Zq9MUqNDfUvQ3N1pqEwP4ILEIyP7s/JKwa2l/y5ir5cUo/uUMZyPjqUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e860cdd.versanet.de ([94.134.12.221] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sX4PO-0001rD-Sf; Thu, 25 Jul 2024 21:45:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 2/7] mfd: add base driver for qnap-mcu devices
Date: Thu, 25 Jul 2024 21:45:34 +0200
Message-Id: <20240725194539.1780790-3-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240725194539.1780790-1-heiko@sntech.de>
References: <20240725194539.1780790-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These MCUs are used in network-attached-storage devices made by QNAP
and provide additional functionality to the system.

This adds the base driver that implements the serial protocol via
serdev and additionally hooks into the poweroff handlers to turn
off the parts of the system not supplied by the general PMIC.

Turning off (at least the TSx33 devices using Rockchip SoCs) is twofold.
Turning off the MCU does not turn off the SoC and turning off the SoC
does not turn off the hard-drives. And if the MCU is not turned off,
the system also won't start again until it is unplugged from power.

So on shutdown the MCU needs to be turned off before the general PMIC.

The protocol spoken by the MCU is sadly not documented, but was
obtained by listening to the chatter on the serial port, as thankfully
the "hal_app" program from QNAPs firmware allows triggering all/most
MCU actions from the command line.

The implementation of how to talk to the serial device got some
inspiration from the rave-sp servdev mfd.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/mfd/Kconfig          |  10 +
 drivers/mfd/Makefile         |   2 +
 drivers/mfd/qnap-mcu.c       | 356 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/qnap-mcu.h |  28 +++
 4 files changed, 396 insertions(+)
 create mode 100644 drivers/mfd/qnap-mcu.c
 create mode 100644 include/linux/mfd/qnap-mcu.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 266b4f54af603..bdd2d94d167cb 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2306,6 +2306,16 @@ config MFD_INTEL_M10_BMC_PMCI
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_QNAP_MCU
+	tristate "QNAP MCU core driver"
+	depends on SERIAL_DEV_BUS
+	help
+	  Select this to get support for the QNAP MCU device found in
+	  several devices of QNAP network attached storages.
+
+	  It implements the base serial protocol to talk to the device
+	  and provides functions for the other parts to hook into.
+
 config MFD_RSMU_I2C
 	tristate "Renesas Synchronization Management Unit with I2C"
 	depends on I2C && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c66f07edcd0e6..5c54ddd6b2f94 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -280,6 +280,8 @@ obj-$(CONFIG_MFD_INTEL_M10_BMC_PMCI)   += intel-m10-bmc-pmci.o
 obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
 obj-$(CONFIG_MFD_ATC260X_I2C)	+= atc260x-i2c.o
 
+obj-$(CONFIG_MFD_QNAP_MCU)	+= qnap-mcu.o
+
 rsmu-i2c-objs			:= rsmu_core.o rsmu_i2c.o
 rsmu-spi-objs			:= rsmu_core.o rsmu_spi.o
 obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu-i2c.o
diff --git a/drivers/mfd/qnap-mcu.c b/drivers/mfd/qnap-mcu.c
new file mode 100644
index 0000000000000..3a0f55ea41331
--- /dev/null
+++ b/drivers/mfd/qnap-mcu.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * MFD core driver for the MCU in Qnap NAS devices that is connected
+ * via a dedicated UART port
+ *
+ * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
+ */
+
+#include <linux/export.h>
+#include <linux/slab.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/qnap-mcu.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reboot.h>
+#include <linux/serdev.h>
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
+/**
+ * struct qnap_mcu_reply - Reply to a command
+ *
+ * @data:	Buffer to store reply payload in
+ * @length:	Expected reply length, including the checksum
+ * @received:	So far received number of bytes
+ * @done:	Reply received completely
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
+	struct mutex reply_lock;
+	struct qnap_mcu_reply *reply;
+	const struct qnap_mcu_variant *variant;
+	u8 version[4];
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
+static int qnap_mcu_write(struct qnap_mcu *sp, const u8 *data, u8 data_size)
+{
+	unsigned char tx[QNAP_MCU_TX_BUFFER_SIZE];
+	size_t length = data_size + QNAP_MCU_CHECKSUM_SIZE;
+
+	if (WARN_ON(length > sizeof(tx)))
+		return -ENOMEM;
+
+	memcpy(tx, data, data_size);
+	tx[data_size] = qnap_mcu_csum(data, data_size);
+
+	print_hex_dump_debug("qnap-mcu tx: ", DUMP_PREFIX_NONE,
+			     16, 1, tx, length, false);
+
+	return serdev_device_write(sp->serdev, tx, length, HZ);
+}
+
+static size_t qnap_mcu_receive_buf(struct serdev_device *serdev,
+				  const u8 *buf, size_t size)
+{
+	struct device *dev = &serdev->dev;
+	struct qnap_mcu *mcu = dev_get_drvdata(dev);
+	struct qnap_mcu_reply *reply = mcu->reply;
+	const u8 *src = buf;
+	const u8 *end = buf + size;
+
+	mutex_lock(&mcu->reply_lock);
+	if (!reply) {
+		dev_warn(dev, "received %lu bytes, we were not waiting for\n",
+			 size);
+		mutex_unlock(&mcu->reply_lock);
+		return size;
+	}
+
+	while (src < end) {
+		reply->data[reply->received] = *src++;
+		reply->received++;
+
+		if (reply->received == reply->length) {
+			complete(&reply->done);
+			mutex_unlock(&mcu->reply_lock);
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
+	mutex_unlock(&mcu->reply_lock);
+	return size;
+}
+
+static const struct serdev_device_ops qnap_mcu_serdev_device_ops = {
+	.receive_buf  = qnap_mcu_receive_buf,
+	.write_wakeup = serdev_device_write_wakeup,
+};
+
+int qnap_mcu_exec(struct qnap_mcu *mcu,
+		  u8 *cmd_data, size_t cmd_data_size,
+		  u8 *reply_data, size_t reply_data_size)
+{
+	unsigned char rx[QNAP_MCU_RX_BUFFER_SIZE];
+	size_t length = reply_data_size + QNAP_MCU_CHECKSUM_SIZE;
+	struct qnap_mcu_reply reply = {
+		.data     = rx,
+		.length   = length,
+		.received = 0,
+		.done     = COMPLETION_INITIALIZER_ONSTACK(reply.done),
+	};
+	int ret;
+
+	if (WARN_ON(length > sizeof(rx)))
+		return -ENOMEM;
+
+	mutex_lock(&mcu->bus_lock);
+
+	mutex_lock(&mcu->reply_lock);
+	mcu->reply = &reply;
+	mutex_unlock(&mcu->reply_lock);
+
+	qnap_mcu_write(mcu, cmd_data, cmd_data_size);
+
+	if (!wait_for_completion_timeout(&reply.done,
+					 msecs_to_jiffies(500))) {
+		dev_err(&mcu->serdev->dev, "Command timeout\n");
+		ret = -ETIMEDOUT;
+	} else {
+		u8 crc = qnap_mcu_csum(rx, reply_data_size);
+
+		print_hex_dump_debug("qnap-mcu rx: ", DUMP_PREFIX_NONE,
+				     16, 1, rx, length, false);
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
+	mutex_lock(&mcu->reply_lock);
+	mcu->reply = NULL;
+	mutex_unlock(&mcu->reply_lock);
+
+	mutex_unlock(&mcu->bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qnap_mcu_exec);
+
+int qnap_mcu_exec_with_ack(struct qnap_mcu *mcu,
+			   u8 *cmd_data,  size_t cmd_data_size)
+{
+	u8 ack[2];
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
+	u8 cmd[] = {
+		[0] = 0x25, /* % */
+		[1] = 0x56  /* V */
+	};
+	u8 rx[14];
+	int ret;
+
+	ret = qnap_mcu_exec(mcu, cmd, sizeof(cmd), rx, 6);
+	if (ret)
+		return ret;
+
+	memcpy(mcu->version, &rx[2], 4);
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
+	u8 cmd[] = {
+		[0] = 0x40, /* @ */
+		[1] = 0x43, /* C */
+		[2] = 0x30  /* 0 */
+	};
+
+	dev_dbg(&mcu->serdev->dev, "running MCU poweroff\n");
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
+	.fan_pwm_min = 51,  /* specified in original model.conf */
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
+	mutex_init(&mcu->reply_lock);
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
+					    SYS_OFF_PRIO_FIRMWARE,
+					    &qnap_mcu_power_off, mcu);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register poweroff handler\n");
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, qnap_mcu_subdevs,
+				   ARRAY_SIZE(qnap_mcu_subdevs), NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "adding qnap mfd devices failed\n");
+
+	return 0;
+}
+
+static struct serdev_device_driver qnap_mcu_drv = {
+	.probe			= qnap_mcu_probe,
+	.driver = {
+		.name		= "qnap-mcu",
+		.of_match_table	= qnap_mcu_dt_ids,
+	},
+};
+module_serdev_device_driver(qnap_mcu_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
+MODULE_DESCRIPTION("QNAP MCU core driver");
diff --git a/include/linux/mfd/qnap-mcu.h b/include/linux/mfd/qnap-mcu.h
new file mode 100644
index 0000000000000..a71d753705546
--- /dev/null
+++ b/include/linux/mfd/qnap-mcu.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
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
+		  u8 *cmd_data,  size_t cmd_data_size,
+		  u8 *reply_data, size_t reply_data_size);
+int qnap_mcu_exec_with_ack(struct qnap_mcu *mcu,
+			   u8 *cmd_data,  size_t cmd_data_size);
+const struct qnap_mcu_variant *qnap_mcu_get_variant_data(struct qnap_mcu *mcu);
+
+#endif /* _LINUX_QNAP_MCU_H_ */
-- 
2.39.2


