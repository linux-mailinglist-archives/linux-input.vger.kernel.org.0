Return-Path: <linux-input+bounces-8252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A83BC9D9E86
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 21:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EF96168886
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 20:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8E61DFD8B;
	Tue, 26 Nov 2024 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUM340hT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601B01DF755;
	Tue, 26 Nov 2024 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732654094; cv=none; b=LMoyy71fI4CILh9ygYJyFPvYhv9+L3Ak1gZmfmYtshXbhU9bpYFY75b+ML5waVpAEvWG9cUX2MpscRfAkHSsYs3+dXwdk2XMKhhPoEUUTBdUfYsvK9gQ0xc5YrOq4S2kW6RgCmGE9NFKJRWNS0wUs/zfGM3PpDcv7vTXO2hzu0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732654094; c=relaxed/simple;
	bh=IXUq3AAJtkQSlXFZUixQqzh6OX6yIQbCqut41Fiwkxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjCSvKCvxFe5h9faW5ckGhrUXAo9qZxaZxSlRvEK9lp5qVZZNZQe3kF9Wv8gQEb2foMHX5IrsuZxtkpt/OULijHH5vQSjhXO4FZUtPknRkuLz40g/LbNIiMjcxB+Wx1m6VbZjupjKZ22VnhfGcydLdqrx1OLMQyS56Bw7ea0Jzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUM340hT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA721C4AF0B;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732654093;
	bh=IXUq3AAJtkQSlXFZUixQqzh6OX6yIQbCqut41Fiwkxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fUM340hT0tP4P3vYB6pK/pf7Uc7eaAhrQHBsWELxqoyGq3uF9kV2WhCtUMl0dAyAj
	 aaCPSpQIdDl4KKDcdMW/Vqs6jOrzMQZE4ZUEjF6m4knjVrv0LSViLie6AYEMGwHwbH
	 31DBDw5pJ9gnqohfQkd6YhMQr+4fLZ6oibpyWVvB1HBTHYVvovGj4OLtkbms+RxYza
	 tFsNtTWRl9NjE859Q3lmfxurl1BoM9/6iZqYqMGuaGleJri6ORL4DbmrFyvvZnNTj0
	 k/T+v714w9+SgquYAdcpnk79Ba8ufuSjVmo+NZ4jnc6AlJobfkpI0LtHQxuk9SG2E0
	 dWq6QJma4EIdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3EBD65556;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 26 Nov 2024 21:48:00 +0100
Subject: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732654092; l=15834;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=dfQEyh/UrvHG/pCLg4sh/Stvl6AtcY4Zz1IE5oS6Qu0=;
 b=OHf//pIesbOd98TXoUfeQJGjvQydWRLv3hCVMPMeRvOWncrk4zHXyvjNNpsv+dIIhv4XeK14i
 DLv2REOojY4DVd0YrNVCXALrtGPTb5jlpmqjRt/5lrL0x07NW9qlbNH
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Adds a driver for Apple touchscreens using the Z2 protocol.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/input/touchscreen/Kconfig    |  13 +
 drivers/input/touchscreen/Makefile   |   1 +
 drivers/input/touchscreen/apple_z2.c | 495 +++++++++++++++++++++++++++++++++++
 3 files changed, 509 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1ac26fc2e3eb94a4f62a49962c25ec853b567a43..4ad5002191f77a17414f9e1494b0afd6447355c0 100644
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
index 0000000000000000000000000000000000000000..9f57708b3d1749bf23db6132d25cbb47fd622a9f
--- /dev/null
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -0,0 +1,495 @@
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
+
+struct apple_z2 {
+	struct spi_device *spidev;
+	struct gpio_desc *cs_gpio;
+	struct gpio_desc *reset_gpio;
+	struct input_dev *input_dev;
+	struct completion boot_irq;
+	int booted;
+	int open;
+	int counter;
+	int y_size;
+	const char *fw_name;
+	const char *cal_blob;
+	int cal_size;
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
+	u16 cmd;
+	u16 len;
+	u32 addr;
+	u16 checksum;
+} __packed;
+
+struct apple_z2_fw_hdr {
+	u32 magic;
+	u32 version;
+} __packed;
+
+struct apple_z2_read_interrupt_cmd {
+	u8 cmd;
+	u8 counter;
+	u8 unused[12];
+	__le16 checksum;
+} __packed;
+
+static void apple_z2_parse_touches(struct apple_z2 *z2, char *msg, size_t msg_len)
+{
+	int i;
+	int nfingers;
+	int slot;
+	int slot_valid;
+	struct apple_z2_finger *fingers;
+
+	if (!z2->open)
+		return;
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
+		input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
+		if (!slot_valid)
+			continue;
+		input_report_abs(z2->input_dev, ABS_MT_POSITION_X,
+				 le16_to_cpu(fingers[i].abs_x));
+		input_report_abs(z2->input_dev, ABS_MT_POSITION_Y,
+				 z2->y_size - le16_to_cpu(fingers[i].abs_y));
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
+static int apple_z2_spi_sync(struct apple_z2 *z2, struct spi_message *msg)
+{
+	int error;
+
+	if (z2->cs_gpio)
+		gpiod_direction_output(z2->cs_gpio, 0);
+
+	error = spi_sync(z2->spidev, msg);
+
+	if (z2->cs_gpio)
+		gpiod_direction_output(z2->cs_gpio, 1);
+
+	return error;
+}
+
+static int apple_z2_read_packet(struct apple_z2 *z2)
+{
+	struct spi_message msg;
+	struct spi_transfer xfer;
+	struct apple_z2_read_interrupt_cmd len_cmd;
+	char len_rx[16];
+	size_t pkt_len;
+	char *pkt_rx;
+	int error;
+
+	spi_message_init(&msg);
+	memset(&xfer, 0, sizeof(xfer));
+	memset(&len_cmd, 0, sizeof(len_cmd));
+
+	len_cmd.cmd = APPLE_Z2_CMD_READ_INTERRUPT_DATA;
+	len_cmd.counter = z2->counter + 1;
+	len_cmd.checksum = cpu_to_le16(APPLE_Z2_CMD_READ_INTERRUPT_DATA + 1 + z2->counter);
+	z2->counter = 1 - z2->counter;
+	xfer.tx_buf = &len_cmd;
+	xfer.rx_buf = len_rx;
+	xfer.len = sizeof(len_cmd);
+
+	spi_message_add_tail(&xfer, &msg);
+	error = apple_z2_spi_sync(z2, &msg);
+	if (error)
+		return error;
+
+	pkt_len = (get_unaligned_le16(len_rx + 1) + 8) & (-4);
+	pkt_rx = kzalloc(pkt_len, GFP_KERNEL);
+	if (!pkt_rx)
+		return -ENOMEM;
+
+	spi_message_init(&msg);
+	memset(&xfer, 0, sizeof(xfer));
+	xfer.rx_buf = pkt_rx;
+	xfer.len = pkt_len;
+
+	spi_message_add_tail(&xfer, &msg);
+	error = apple_z2_spi_sync(z2, &msg);
+
+	if (!error)
+		apple_z2_parse_touches(z2, pkt_rx + 5, pkt_len - 5);
+
+	kfree(pkt_rx);
+	return error;
+}
+
+static irqreturn_t apple_z2_irq(int irq, void *data)
+{
+	struct spi_device *spi = data;
+	struct apple_z2 *z2 = spi_get_drvdata(spi);
+
+	if (!z2->booted)
+		complete(&z2->boot_irq);
+	else
+		apple_z2_read_packet(z2);
+
+	return IRQ_HANDLED;
+}
+
+static void apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, char *data)
+{
+	u16 len_words = (z2->cal_size + 3) / 4;
+	u32 checksum = 0;
+	u16 checksum_hdr = 0;
+	int i;
+	struct apple_z2_hbpp_blob_hdr *hdr;
+
+	hdr = (struct apple_z2_hbpp_blob_hdr *)data;
+	hdr->cmd = APPLE_Z2_HBPP_CMD_BLOB;
+	hdr->len = len_words;
+	hdr->addr = address;
+
+	for (i = 2; i < 8; i++)
+		checksum_hdr += data[i];
+
+	hdr->checksum = checksum_hdr;
+	memcpy(data + 10, z2->cal_blob, z2->cal_size);
+
+	for (i = 0; i < z2->cal_size; i++)
+		checksum += z2->cal_blob[i];
+
+	*(u32 *)(data + z2->cal_size + 10) = checksum;
+}
+
+static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const char *data, u32 size, u8 bpw)
+{
+	struct spi_message msg;
+	struct spi_transfer blob_xfer, ack_xfer;
+	char int_ack[] = {0x1a, 0xa1};
+	char ack_rsp[] = {0, 0};
+	int error;
+
+	spi_message_init(&msg);
+	memset(&blob_xfer, 0, sizeof(blob_xfer));
+	memset(&ack_xfer, 0, sizeof(ack_xfer));
+
+	blob_xfer.tx_buf = data;
+	blob_xfer.len = size;
+	blob_xfer.bits_per_word = bpw;
+	spi_message_add_tail(&blob_xfer, &msg);
+
+	ack_xfer.tx_buf = int_ack;
+	ack_xfer.rx_buf = ack_rsp;
+	ack_xfer.len = 2;
+	spi_message_add_tail(&ack_xfer, &msg);
+
+	reinit_completion(&z2->boot_irq);
+	error = apple_z2_spi_sync(z2, &msg);
+	if (error)
+		return error;
+	wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
+	return 0;
+}
+
+static int apple_z2_upload_firmware(struct apple_z2 *z2)
+{
+	const struct firmware *fw;
+	struct apple_z2_fw_hdr *fw_hdr;
+	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
+	int error;
+	u32 load_cmd;
+	u32 size;
+	u32 address;
+	char *data;
+	u8 bits_per_word;
+
+	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);
+	if (error) {
+		dev_err(&z2->spidev->dev, "unable to load firmware");
+		return error;
+	}
+
+	fw_hdr = (struct apple_z2_fw_hdr *)fw->data;
+	if (fw_hdr->magic != APPLE_Z2_FW_MAGIC || fw_hdr->version != 1) {
+		dev_err(&z2->spidev->dev, "invalid firmware header");
+		return -EINVAL;
+	}
+
+	while (fw_idx < fw->size) {
+		if (fw->size - fw_idx < 8) {
+			dev_err(&z2->spidev->dev, "firmware malformed");
+			error = -EINVAL;
+			goto error;
+		}
+
+		load_cmd = *(u32 *)(fw->data + fw_idx);
+		fw_idx += 4;
+		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
+			size = *(u32 *)(fw->data + fw_idx);
+			fw_idx += 4;
+			if (fw->size - fw_idx < size) {
+				dev_err(&z2->spidev->dev, "firmware malformed");
+				error = -EINVAL;
+				goto error;
+			}
+			bits_per_word = load_cmd == LOAD_COMMAND_SEND_BLOB ? 16 : 8;
+			error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
+							    size, bits_per_word);
+			if (error)
+				goto error;
+			fw_idx += size;
+		} else if (load_cmd == 2) {
+			address = *(u32 *)(fw->data + fw_idx);
+			fw_idx += 4;
+			if (z2->cal_size != 0) {
+				size = z2->cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
+				data = kzalloc(size, GFP_KERNEL);
+				apple_z2_build_cal_blob(z2, address, data);
+				error = apple_z2_send_firmware_blob(z2, data, size, 16);
+				kfree(data);
+				if (error)
+					goto error;
+			}
+		} else {
+			dev_err(&z2->spidev->dev, "firmware malformed");
+			error = -EINVAL;
+			goto error;
+		}
+		if (fw_idx % 4 != 0)
+			fw_idx += 4 - (fw_idx % 4);
+	}
+
+
+	z2->booted = 1;
+	apple_z2_read_packet(z2);
+ error:
+	release_firmware(fw);
+	return error;
+}
+
+static int apple_z2_boot(struct apple_z2 *z2)
+{
+	int timeout;
+
+	enable_irq(z2->spidev->irq);
+	gpiod_direction_output(z2->reset_gpio, 0);
+	timeout = wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
+	if (timeout == 0)
+		return -ETIMEDOUT;
+	return apple_z2_upload_firmware(z2);
+}
+
+static int apple_z2_open(struct input_dev *dev)
+{
+	struct apple_z2 *z2 = input_get_drvdata(dev);
+	int error;
+
+	/* Reset the device on boot */
+	gpiod_direction_output(z2->reset_gpio, 1);
+	usleep_range(5000, 10000);
+	error = apple_z2_boot(z2);
+	if (error) {
+		gpiod_direction_output(z2->reset_gpio, 1);
+		disable_irq(z2->spidev->irq);
+	} else
+		z2->open = 1;
+	return error;
+}
+
+static void apple_z2_close(struct input_dev *dev)
+{
+	struct apple_z2 *z2 = input_get_drvdata(dev);
+
+	disable_irq(z2->spidev->irq);
+	gpiod_direction_output(z2->reset_gpio, 1);
+	z2->open = 0;
+	z2->booted = 0;
+}
+
+static int apple_z2_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct apple_z2 *z2;
+	int error;
+	const char *label;
+	struct touchscreen_properties props;
+
+	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
+	if (!z2)
+		return -ENOMEM;
+
+	z2->spidev = spi;
+	init_completion(&z2->boot_irq);
+	spi_set_drvdata(spi, z2);
+
+	z2->cs_gpio = devm_gpiod_get_index(dev, "cs", 0, 0);
+	if (IS_ERR(z2->cs_gpio)) {
+		if (PTR_ERR(z2->cs_gpio) != -ENOENT) {
+			dev_err(dev, "unable to get cs");
+			return PTR_ERR(z2->cs_gpio);
+		}
+		z2->cs_gpio = NULL;
+	}
+
+	z2->reset_gpio = devm_gpiod_get_index(dev, "reset", 0, 0);
+	if (IS_ERR(z2->reset_gpio)) {
+		dev_err(dev, "unable to get reset");
+		return PTR_ERR(z2->reset_gpio);
+	}
+
+	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
+					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					"apple-z2-irq", spi);
+	if (error < 0) {
+		dev_err(dev, "unable to request irq");
+		return z2->spidev->irq;
+	}
+
+	error = device_property_read_string(dev, "label", &label);
+	if (error) {
+		dev_err(dev, "unable to get device name");
+		return error;
+	}
+
+	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
+	if (error) {
+		dev_err(dev, "unable to get firmware name");
+		return error;
+	}
+
+	z2->cal_blob = of_get_property(dev->of_node, "apple,z2-cal-blob", &z2->cal_size);
+	if (!z2->cal_blob) {
+		dev_warn(dev, "unable to get calibration, precision may be degraded");
+		z2->cal_size = 0;
+	}
+
+	z2->input_dev = devm_input_allocate_device(dev);
+	if (!z2->input_dev)
+		return -ENOMEM;
+	z2->input_dev->name = label;
+	z2->input_dev->phys = "apple_z2";
+	z2->input_dev->dev.parent = dev;
+	z2->input_dev->id.bustype = BUS_SPI;
+	z2->input_dev->open = apple_z2_open;
+	z2->input_dev->close = apple_z2_close;
+
+	/* Allocate the axes before setting from DT */
+	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
+	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
+	touchscreen_parse_properties(z2->input_dev, true, &props);
+	z2->y_size = props.max_y;
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
+	if (error < 0) {
+		dev_err(dev, "unable to initialize multitouch slots");
+		return error;
+	}
+
+	error = input_register_device(z2->input_dev);
+	if (error < 0)
+		dev_err(dev, "unable to register input device");
+
+	return error;
+}
+
+static const struct of_device_id apple_z2_of_match[] = {
+	{ .compatible = "apple,z2-multitouch" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, apple_z2_of_match);
+
+static struct spi_device_id apple_z2_of_id[] = {
+	{ .name = "j293-touchbar" },
+	{ .name = "j493-touchbar" },
+	{ .name = "z2-touchbar" },
+	{ .name = "z2-multitouch" },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
+
+static struct spi_driver apple_z2_driver = {
+	.driver = {
+		.name	= "apple-z2",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(apple_z2_of_match),
+	},
+	.id_table       = apple_z2_of_id,
+	.probe		= apple_z2_probe,
+};
+
+module_spi_driver(apple_z2_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_FIRMWARE("apple/dfrmtfw-*.bin");

-- 
2.47.1



