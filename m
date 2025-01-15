Return-Path: <linux-input+bounces-9256-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 863E6A12E6E
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 23:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3F647A1144
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1A91DD0C7;
	Wed, 15 Jan 2025 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gM5qtJ1F"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB060161321;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981173; cv=none; b=jaKpyEQb0PcNbcGGOvulsc2UNIfA6+SD3oMvOjWzCJxLB4/AwDPv1bXnfXoNQhErAAxvXG9anvtHAewQYB3MAyrp0bu19hw2sVTP1iEzDPUCnQT99Vb7tSGtYnepUh+zJ5aZJk0UhyR3sBX0dFy6eO2stOPC3tlHIKc9ebt/a/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981173; c=relaxed/simple;
	bh=dLRXYHpaUy1k4To1S+AMp8RCzOtLlwgu5P7jxOUWIeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IiHl+Q6dnW9p7OMtAdY5mpYzyZTjwQRShxOPzkHgY7914Etbdh1wG2RGtyMnGPdKz4cl9Bc9TOt+I2lwUejfn6QksHaD64zC/1+k0K7EEQx/gt6ZZReac6HEpKEoGbIYpOl2QK4p0c5Plqj2JPUkynQKGzkmPU+MVbakzUsMY+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gM5qtJ1F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5832C4CEE5;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736981172;
	bh=dLRXYHpaUy1k4To1S+AMp8RCzOtLlwgu5P7jxOUWIeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gM5qtJ1F5Nn8Yz2RxpDQPOYhYe2gkjJWEkoSUYckY+J7CxRIHi9lXk8zIipnGtDh+
	 oTHnhOIyMnJgNdk+yqFwwk7TQIRxugTVOncEYjNbMw078Rd+IaVIVPSi51YGPvnKV0
	 OmyDi7ALDrNqUqu6xm3gOVleim/aKTl0IXpsdCpsVCIScdDuEIYTzkIVYYkqTxrFAV
	 omyhF+0uZhMSyVfmbHxY5hpPpvC+LCQfisIR5azATwMC3q6js+FNfuKFp2ecfFAkJn
	 bzC6MCNB3SUpDkYwJuxgdKFxn5cWTxVNBIPwf2ghT8C23TsJlKI90zywKH9AXjFEgw
	 uO3D1xZfUgpoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9116DC02180;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 15 Jan 2025 23:46:06 +0100
Subject: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
In-Reply-To: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736981170; l=15768;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=93QMpNoVeVx64bXDds/UkIGKjo9AaHoBKTBBUP6jpdU=;
 b=HbGIDPSh2tVHEAbIWVXuZ5sB8U26O13XAPecEFvsujuF5EKQt5/lX5q6ubGS4oJzBqntFNUFT
 l6C+cmZvKyzDnZQuHU4WWMoBGXmuYM1luXnbsEEvbCUemfk9HstFSzv
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Adds a driver for Apple touchscreens using the Z2 protocol.

Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/input/touchscreen/Kconfig    |  13 +
 drivers/input/touchscreen/Makefile   |   1 +
 drivers/input/touchscreen/apple_z2.c | 454 +++++++++++++++++++++++++++++++++++
 3 files changed, 468 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1a03de7fcfa66c0f60768be17d776a79e36e570e..6c885cc58f323b3628538d41460248f8ab1dbf7d 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -103,6 +103,19 @@ config TOUCHSCREEN_ADC
 	  To compile this driver as a module, choose M here: the
 	  module will be called resistive-adc-touch.ko.
 
+config TOUCHSCREEN_APPLE_Z2
+	tristate "Apple Z2 touchscreens"
+	default ARCH_APPLE
+	depends on SPI
+	help
+	  Say Y here if you have an Apple device with
+	  a touchscreen or a touchbar.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called apple_z2.
+
 config TOUCHSCREEN_AR1021_I2C
 	tristate "Microchip AR1020/1021 i2c touchscreen"
 	depends on I2C && OF
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 82bc837ca01e2ee18c5e9c578765d55ef9fab6d4..97a025c6a3770fb80255246eb63c11688ebd79eb 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_TOUCHSCREEN_AD7879_I2C)	+= ad7879-i2c.o
 obj-$(CONFIG_TOUCHSCREEN_AD7879_SPI)	+= ad7879-spi.o
 obj-$(CONFIG_TOUCHSCREEN_ADC)		+= resistive-adc-touch.o
 obj-$(CONFIG_TOUCHSCREEN_ADS7846)	+= ads7846.o
+obj-$(CONFIG_TOUCHSCREEN_APPLE_Z2)	+= apple_z2.o
 obj-$(CONFIG_TOUCHSCREEN_AR1021_I2C)	+= ar1021_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_ATMEL_MXT)	+= atmel_mxt_ts.o
 obj-$(CONFIG_TOUCHSCREEN_AUO_PIXCIR)	+= auo-pixcir-ts.o
diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
new file mode 100644
index 0000000000000000000000000000000000000000..4a5ea252961a727e9fc1f8f335d0fb36f3263415
--- /dev/null
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Z2 touchscreen driver
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/spi/spi.h>
+#include <linux/unaligned.h>
+
+#define APPLE_Z2_NUM_FINGERS_OFFSET      16
+#define APPLE_Z2_FINGERS_OFFSET          24
+#define APPLE_Z2_TOUCH_STARTED           3
+#define APPLE_Z2_TOUCH_MOVED             4
+#define APPLE_Z2_CMD_READ_INTERRUPT_DATA 0xEB
+#define APPLE_Z2_HBPP_CMD_BLOB           0x3001
+#define APPLE_Z2_FW_MAGIC                0x5746325A
+#define LOAD_COMMAND_INIT_PAYLOAD        0
+#define LOAD_COMMAND_SEND_BLOB           1
+#define LOAD_COMMAND_SEND_CALIBRATION    2
+#define CAL_PROP_NAME                    "apple,z2-cal-blob"
+
+struct apple_z2 {
+	struct spi_device *spidev;
+	struct gpio_desc *reset_gpio;
+	struct input_dev *input_dev;
+	struct completion boot_irq;
+	bool booted;
+	int index_parity;
+	struct touchscreen_properties props;
+	const char *fw_name;
+	u8 *tx_buf;
+	u8 *rx_buf;
+};
+
+struct apple_z2_finger {
+	u8 finger;
+	u8 state;
+	__le16 unknown2;
+	__le16 abs_x;
+	__le16 abs_y;
+	__le16 rel_x;
+	__le16 rel_y;
+	__le16 tool_major;
+	__le16 tool_minor;
+	__le16 orientation;
+	__le16 touch_major;
+	__le16 touch_minor;
+	__le16 unused[2];
+	__le16 pressure;
+	__le16 multi;
+} __packed;
+
+struct apple_z2_hbpp_blob_hdr {
+	__le16 cmd;
+	__le16 len;
+	__le32 addr;
+	__le16 checksum;
+};
+
+struct apple_z2_fw_hdr {
+	__le32 magic;
+	__le32 version;
+};
+
+struct apple_z2_read_interrupt_cmd {
+	u8 cmd;
+	u8 counter;
+	u8 unused[12];
+	__le16 checksum;
+};
+
+static void apple_z2_parse_touches(struct apple_z2 *z2, char *msg, size_t msg_len)
+{
+	int i;
+	int nfingers;
+	int slot;
+	int slot_valid;
+	struct apple_z2_finger *fingers;
+
+	if (msg_len <= APPLE_Z2_NUM_FINGERS_OFFSET)
+		return;
+	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
+	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
+	for (i = 0; i < nfingers; i++) {
+		slot = input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
+		if (slot < 0) {
+			dev_warn(&z2->spidev->dev, "unable to get slot for finger\n");
+			continue;
+		}
+		slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
+			     fingers[i].state == APPLE_Z2_TOUCH_MOVED;
+		input_mt_slot(z2->input_dev, slot);
+		if (!input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid))
+			continue;
+		touchscreen_report_pos(z2->input_dev, &z2->props, le16_to_cpu(fingers[i].abs_x),
+				       le16_to_cpu(fingers[i].abs_y), true);
+		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MAJOR,
+				 le16_to_cpu(fingers[i].tool_major));
+		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MINOR,
+				 le16_to_cpu(fingers[i].tool_minor));
+		input_report_abs(z2->input_dev, ABS_MT_ORIENTATION,
+				 le16_to_cpu(fingers[i].orientation));
+		input_report_abs(z2->input_dev, ABS_MT_TOUCH_MAJOR,
+				 le16_to_cpu(fingers[i].touch_major));
+		input_report_abs(z2->input_dev, ABS_MT_TOUCH_MINOR,
+				 le16_to_cpu(fingers[i].touch_minor));
+	}
+	input_mt_sync_frame(z2->input_dev);
+	input_sync(z2->input_dev);
+}
+
+static int apple_z2_read_packet(struct apple_z2 *z2)
+{
+	struct apple_z2_read_interrupt_cmd *len_cmd = (void *)z2->tx_buf;
+	struct spi_transfer xfer;
+	int error;
+	size_t pkt_len;
+
+	memset(&xfer, 0, sizeof(xfer));
+	len_cmd->cmd = APPLE_Z2_CMD_READ_INTERRUPT_DATA;
+	len_cmd->counter = z2->index_parity + 1;
+	len_cmd->checksum =
+		cpu_to_le16(APPLE_Z2_CMD_READ_INTERRUPT_DATA + len_cmd->counter);
+	z2->index_parity = !z2->index_parity;
+	xfer.tx_buf = z2->tx_buf;
+	xfer.rx_buf = z2->rx_buf;
+	xfer.len = sizeof(*len_cmd);
+
+	error = spi_sync_transfer(z2->spidev, &xfer, 1);
+	if (error)
+		return error;
+
+	pkt_len = (get_unaligned_le16(z2->rx_buf + 1) + 8) & (-4);
+
+	error = spi_read(z2->spidev, z2->rx_buf, pkt_len);
+	if (error)
+		return error;
+
+	apple_z2_parse_touches(z2, z2->rx_buf + 5, pkt_len - 5);
+
+	return 0;
+}
+
+static irqreturn_t apple_z2_irq(int irq, void *data)
+{
+	struct spi_device *spi = data;
+	struct apple_z2 *z2 = spi_get_drvdata(spi);
+
+	if (unlikely(!z2->booted))
+		complete(&z2->boot_irq);
+	else
+		apple_z2_read_packet(z2);
+
+	return IRQ_HANDLED;
+}
+
+static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
+{
+	u16 len_words = (cal_size + 3) / 4;
+	size_t hdr_size = sizeof(struct apple_z2_hbpp_blob_hdr);
+	u32 checksum = 0;
+	u16 checksum_hdr = 0;
+	int i;
+	struct apple_z2_hbpp_blob_hdr *hdr;
+	int error;
+
+	hdr = (struct apple_z2_hbpp_blob_hdr *)data;
+	hdr->cmd = cpu_to_le16(APPLE_Z2_HBPP_CMD_BLOB);
+	hdr->len = cpu_to_le16(len_words);
+	hdr->addr = cpu_to_le32(address);
+
+	for (i = 2; i < 8; i++)
+		checksum_hdr += data[i];
+
+	hdr->checksum = cpu_to_le16(checksum_hdr);
+	error = device_property_read_u8_array(&z2->spidev->dev, CAL_PROP_NAME,
+					      data + hdr_size, cal_size);
+	if (error)
+		return error;
+
+	for (i = 0; i < cal_size; i++)
+		checksum += data[i + hdr_size];
+
+	put_unaligned_le32(checksum, data + cal_size + hdr_size);
+	return 0;
+}
+
+static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const char *data, u32 size, bool init)
+{
+	struct spi_message msg;
+	struct spi_transfer blob_xfer, ack_xfer;
+	int error;
+
+	z2->tx_buf[0] = 0x1a;
+	z2->tx_buf[1] = 0xa1;
+
+	spi_message_init(&msg);
+	memset(&blob_xfer, 0, sizeof(blob_xfer));
+	memset(&ack_xfer, 0, sizeof(ack_xfer));
+
+	blob_xfer.tx_buf = data;
+	blob_xfer.len = size;
+	blob_xfer.bits_per_word = init ? 8 : 16;
+	spi_message_add_tail(&blob_xfer, &msg);
+
+	ack_xfer.tx_buf = z2->tx_buf;
+	ack_xfer.len = 2;
+	spi_message_add_tail(&ack_xfer, &msg);
+
+	reinit_completion(&z2->boot_irq);
+	error = spi_sync(z2->spidev, &msg);
+	if (error)
+		return error;
+
+	/* Irq only happens sometimes, but the thing boots reliably nonetheless */
+	wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
+
+	return 0;
+}
+
+static int apple_z2_upload_firmware(struct apple_z2 *z2)
+{
+	const struct apple_z2_fw_hdr *fw_hdr;
+	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
+	int error;
+	u32 load_cmd;
+	u32 size;
+	u32 address;
+	char *data;
+	bool init;
+	size_t cal_size;
+
+	const struct firmware *fw __free(firmware) = NULL;
+	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);
+	if (error) {
+		dev_err(&z2->spidev->dev, "unable to load firmware");
+		return error;
+	}
+
+	fw_hdr = (const struct apple_z2_fw_hdr *)fw->data;
+	if (le32_to_cpu(fw_hdr->magic) != APPLE_Z2_FW_MAGIC || le32_to_cpu(fw_hdr->version) != 1) {
+		dev_err(&z2->spidev->dev, "invalid firmware header");
+		return -EINVAL;
+	}
+
+	/*
+	 * This will interrupt the upload half-way if the file is malformed
+	 * As the device has no non-volatile storage to corrupt, and gets reset
+	 * on boot anyway, this is fine.
+	 */
+	while (fw_idx < fw->size) {
+		if (fw->size - fw_idx < 8) {
+			dev_err(&z2->spidev->dev, "firmware malformed");
+			return -EINVAL;
+		}
+
+		load_cmd = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
+		fw_idx += sizeof(u32);
+		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
+			size = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
+			fw_idx += sizeof(u32);
+			if (fw->size - fw_idx < size) {
+				dev_err(&z2->spidev->dev, "firmware malformed");
+				return -EINVAL;
+			}
+			init = load_cmd == LOAD_COMMAND_INIT_PAYLOAD;
+			error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
+							    size, init);
+			if (error)
+				return error;
+			fw_idx += size;
+		} else if (load_cmd == LOAD_COMMAND_SEND_CALIBRATION) {
+			address = le32_to_cpu(*(u32 *)(fw->data + fw_idx));
+			fw_idx += sizeof(u32);
+			cal_size = device_property_count_u8(&z2->spidev->dev, CAL_PROP_NAME);
+			if (cal_size != 0) {
+				size = cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
+				data = kzalloc(size, GFP_KERNEL);
+				error = apple_z2_build_cal_blob(z2, address, cal_size, data);
+				if (!error)
+					error = apple_z2_send_firmware_blob(z2, data, size, 16);
+				kfree(data);
+				if (error)
+					return error;
+			}
+		} else {
+			dev_err(&z2->spidev->dev, "firmware malformed");
+			return -EINVAL;
+		}
+		if (fw_idx % 4 != 0)
+			fw_idx += 4 - (fw_idx % 4);
+	}
+
+
+	z2->booted = true;
+	apple_z2_read_packet(z2);
+	return 0;
+}
+
+static int apple_z2_boot(struct apple_z2 *z2)
+{
+	int timeout;
+	int error;
+
+	reinit_completion(&z2->boot_irq);
+	enable_irq(z2->spidev->irq);
+	gpiod_set_value(z2->reset_gpio, 0);
+	timeout = wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
+	if (timeout == 0)
+		return -ETIMEDOUT;
+
+	error = apple_z2_upload_firmware(z2);
+	if (error) {
+		gpiod_set_value(z2->reset_gpio, 1);
+		disable_irq(z2->spidev->irq);
+	}
+	return error;
+}
+
+static int apple_z2_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct apple_z2 *z2;
+	int error;
+
+	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
+	if (!z2)
+		return -ENOMEM;
+
+	z2->tx_buf = devm_kzalloc(dev, sizeof(struct apple_z2_read_interrupt_cmd), GFP_KERNEL);
+	z2->rx_buf = devm_kzalloc(dev, 4096, GFP_KERNEL);
+	if (!z2->tx_buf || !z2->rx_buf)
+		return -ENOMEM;
+
+	z2->spidev = spi;
+	init_completion(&z2->boot_irq);
+	spi_set_drvdata(spi, z2);
+
+	/* Reset the device on boot */
+	z2->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(z2->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(z2->reset_gpio), "unable to get reset");
+
+	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
+					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					"apple-z2-irq", spi);
+	if (error)
+		return dev_err_probe(dev, z2->spidev->irq, "unable to request irq");
+
+	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
+	if (error)
+		return dev_err_probe(dev, error, "unable to get firmware name");
+
+	z2->input_dev = devm_input_allocate_device(dev);
+	if (!z2->input_dev)
+		return -ENOMEM;
+	z2->input_dev->name = (char *)spi_get_device_id(spi)->driver_data;
+	z2->input_dev->phys = "apple_z2";
+	z2->input_dev->id.bustype = BUS_SPI;
+
+	/* Allocate the axes before setting from DT */
+	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
+	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
+	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
+	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
+	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MINOR, 0, 65535, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_ORIENTATION, -32768, 32767, 0, 0);
+
+	input_set_drvdata(z2->input_dev, z2);
+
+	error = input_mt_init_slots(z2->input_dev, 256, INPUT_MT_DIRECT);
+	if (error)
+		return dev_err_probe(dev, error, "unable to initialize multitouch slots");
+
+	error = input_register_device(z2->input_dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register input device");
+
+	/* Wait for device reset to finish */
+	usleep_range(5000, 10000);
+	error = apple_z2_boot(z2);
+	if (error)
+		return error;
+	return 0;
+}
+
+static void apple_z2_shutdown(struct spi_device *spi)
+{
+	struct apple_z2 *z2 = spi_get_drvdata(spi);
+
+	disable_irq(z2->spidev->irq);
+	gpiod_direction_output(z2->reset_gpio, 1);
+	z2->booted = false;
+}
+
+static int apple_z2_suspend(struct device *dev)
+{
+	apple_z2_shutdown(to_spi_device(dev));
+	return 0;
+}
+
+static int apple_z2_resume(struct device *dev)
+{
+	struct apple_z2 *z2 = spi_get_drvdata(to_spi_device(dev));
+
+	return apple_z2_boot(z2);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(apple_z2_pm, apple_z2_suspend, apple_z2_resume);
+
+static const struct of_device_id apple_z2_of_match[] = {
+	{ .compatible = "apple,j293-touchbar" },
+	{ .compatible = "apple,j493-touchbar" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, apple_z2_of_match);
+
+static struct spi_device_id apple_z2_of_id[] = {
+	{ .name = "j293-touchbar", .driver_data = (kernel_ulong_t)"MacBookPro17,1 Touch Bar" },
+	{ .name = "j493-touchbar", .driver_data = (kernel_ulong_t)"Mac14,7 Touch Bar" },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
+
+static struct spi_driver apple_z2_driver = {
+	.driver = {
+		.name	= "apple-z2",
+		.pm	= pm_sleep_ptr(&apple_z2_pm),
+		.of_match_table = apple_z2_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = apple_z2_of_id,
+	.probe    = apple_z2_probe,
+	.remove   = apple_z2_shutdown,
+};
+
+module_spi_driver(apple_z2_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_FIRMWARE("apple/dfrmtfw-*.bin");
+MODULE_DESCRIPTION("Apple Z2 touchscreens driver");

-- 
2.48.0



