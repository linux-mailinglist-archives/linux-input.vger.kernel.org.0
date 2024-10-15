Return-Path: <linux-input+bounces-7406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5599EA5C
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 14:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD09282F5C
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 12:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61FB1AF0A2;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlIevQ4r"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8791A1C07E0;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996812; cv=none; b=mGIzPoo0RJvMVCdsmLdxI6enocG47UcRklb7UIko640/7/NL/PYx8iXpQmFpwwDUDSr/tyN2hzKZHmqzRHOaTRux/0vk6Pnb5SZWpt+RJ8i7ECq1AZgw+3pxfb4gCLMltiy/qRxhueXLhwI00RmpZTKHg6htdigc+7ZyiOLJ/pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996812; c=relaxed/simple;
	bh=IDx+EVqsGXyGLT8dGiUWR61++nVkC8eWcKacQwSWIrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogj9tqkrAC11s0cMB6GVHUnL5bNDHWclFPaF7W/fMcEjzawfQ86I9vtZIWxpW0+td7n+ge5KNYgznkhAvXs65+k5J5zTE4bRfoVQgD1ge50Gx3EIgpuue5KRY2NLwRLkdDFajqojdn4Vf5xTlgxA+LipALmPViz738YV1Zc3FSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlIevQ4r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20A43C4CED0;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728996812;
	bh=IDx+EVqsGXyGLT8dGiUWR61++nVkC8eWcKacQwSWIrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mlIevQ4rheKOO79Ul17wdIIuecYJbUbF7hdQzQmwGl3Nu2i40TQ1ugN3MghtUxp1z
	 RytGllDQgUw/KjuQbWvPELN9k1NwMrpLM7OG+osWky3SaqUEq23m+0bcbz9DPJ/3UE
	 q6XPTnSY4R7m6YHhV/FIB+QUyCWgoGul4n/pER+dKC5YUuL4LtNXU2b75waLTTQtdL
	 wXw+Rhst8KuHMAjWP+jyHkmzrtaIbzwKJy3jf3KZPv8fpnIfLf8oFzusPCBIAywKUK
	 7O/cTYrd0xmB+LLlSXOicXPbz9N8HvKeKMfuwbA0RhSj5fr2cuRTM2aoSGtvFxqtMw
	 QMkHW10YGZWVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC40D21699;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Tue, 15 Oct 2024 20:53:30 +0800
Subject: [PATCH RFC/RFT 2/3] Input: Add Novatek NT36xxx touchscreen driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-nt36xxx-v1-2-3919d0bffee6@gmail.com>
References: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
In-Reply-To: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Del Regno <kholk11@gmail.com>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728996810; l=56382;
 i=gchan9527@gmail.com; s=20241015; h=from:subject:message-id;
 bh=+FF0n/qJDw0gKzT+err6CRYavmZ50RC/wgLfEpEOMNM=;
 b=Qw//vVYw5958Wo8w1lOSSDIHlJlFKlkF3BPsSWGittYO+OYWlyAA6IntRZiwue/QdkR1ykJ/K
 AbB1aTngdM6DyQ5irqYMr38ct5R04i3TY9f7ycP8cuec+CC+ufNL8bA
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=dscYWhT+BiQOBMpPE19NFQAjBBmcpipc6zdf2MTze/U=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20241015 with
 auth_id=248
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

This is a driver for the Novatek in-cell touch controller and
supports various chips from the NT36xxx family, currently
including below as listed:

- NT36525
- NT36672A
- NT36675
- NT36676F
- NT36772
- NT36870

Functionality like wake gestures and firmware flashing is not
included. Firmware loading at probe is supported.

This driver is lightly based on the downstream implementation [1].
[1] https://github.com/Rasenkai/caf-tsoft-Novatek-nt36xxx

And rewrite as standard i2c driver [2][3]
[2] https://lore.kernel.org/all/20201026173045.165236-4-kholk11@gmail.com/T/
[3] https://lore.kernel.org/lkml/20230808-topic-nt36xxx-v10-1-dd135dfa0b5e@linaro.org/T/

Then a new rewrite further happened for spi driver [4]
[4] https://github.com/99degree/linux/tree/nt36xxx

This driver referenced to goodix berlin driver spi ops that had
been in mainline kernel. Also, implementation included
panel-follower ops, pm_runtime ops as well as firmware download
ops that is added as spi driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Signed-off-by: George Chan <gchan9527@gmail.com>
---
 drivers/input/touchscreen/Kconfig        |   13 +
 drivers/input/touchscreen/Makefile       |    2 +
 drivers/input/touchscreen/nt36xxx.h      |  142 +++
 drivers/input/touchscreen/nt36xxx_core.c | 1422 ++++++++++++++++++++++++++++++
 drivers/input/touchscreen/nt36xxx_spi.c  |  256 ++++++
 5 files changed, 1835 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1ac26fc2e3..654877da4c 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -663,6 +663,19 @@ config TOUCHSCREEN_IMAGIS
 	  To compile this driver as a module, choose M here: the
 	  module will be called imagis.
 
+config TOUCHSCREEN_NT36XXX_SPI
+	tristate "Novatek NT36XXX In-Cell SPI touchscreen controller"
+	depends on SPI_MASTER
+	select REGMAP
+        help
+          Say Y here if you have a Novatek NT36xxx series In-Cell
+          touchscreen connected to your system over SPI.
+
+          If unsure, say N.
+
+          To compile this driver as a module, choose M here: the
+          module will be called nt36xxx_ts_spi.
+
 config TOUCHSCREEN_IMX6UL_TSC
 	tristate "Freescale i.MX6UL touchscreen controller"
 	depends on ((OF && GPIOLIB) || COMPILE_TEST) && HAS_IOMEM
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 82bc837ca0..6358a636a5 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -7,6 +7,7 @@
 
 wm97xx-ts-y := wm97xx-core.o
 goodix_ts-y := goodix.o goodix_fwupload.o
+nt36xxx_spi_ts-y := nt36xxx_spi.o nt36xxx_core.o
 
 obj-$(CONFIG_TOUCHSCREEN_88PM860X)	+= 88pm860x-ts.o
 obj-$(CONFIG_TOUCHSCREEN_AD7877)	+= ad7877.o
@@ -67,6 +68,7 @@ obj-$(CONFIG_TOUCHSCREEN_MSG2638)	+= msg2638.o
 obj-$(CONFIG_TOUCHSCREEN_MTOUCH)	+= mtouch.o
 obj-$(CONFIG_TOUCHSCREEN_MK712)		+= mk712.o
 obj-$(CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS)	+= novatek-nvt-ts.o
+obj-$(CONFIG_TOUCHSCREEN_NT36XXX_SPI)	+= nt36xxx_spi_ts.o
 obj-$(CONFIG_TOUCHSCREEN_HP600)		+= hp680_ts_input.o
 obj-$(CONFIG_TOUCHSCREEN_HP7XX)		+= jornada720_ts.o
 obj-$(CONFIG_TOUCHSCREEN_IPAQ_MICRO)	+= ipaq-micro-ts.o
diff --git a/drivers/input/touchscreen/nt36xxx.h b/drivers/input/touchscreen/nt36xxx.h
new file mode 100644
index 0000000000..7bf1f72290
--- /dev/null
+++ b/drivers/input/touchscreen/nt36xxx.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2010 - 2017 Novatek, Inc.
+ * Copyright (C) 2020 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ * Copyright (C) 2023-2024 George Chan <gchan9527@gmail.com>
+ */
+
+#ifndef NT36XXX_H
+#define NT36XXX_H
+
+#define NT36XXX_INPUT_DEVICE_NAME	"Novatek NT36XXX Touch Sensor"
+#define MAX_SPI_FREQ_HZ 5000000
+
+/* FW Param address */
+#define NT36XXX_FW_ADDR		0x01
+
+#define NT36XXX_TRANSFER_LEN	(63*1024)
+
+/* due to extra framework layer, the transfer trunk is as small as
+ * 128 otherwize dma error happened, all routed to spi_sync()
+*/
+
+/* Number of bytes for chip identification */
+#define NT36XXX_ID_LEN_MAX	6
+
+/* Touch info */
+#define TOUCH_DEFAULT_MAX_WIDTH  1080
+#define TOUCH_DEFAULT_MAX_HEIGHT 2246
+#define TOUCH_MAX_FINGER_NUM	 10
+#define TOUCH_MAX_PRESSURE	 1000
+
+/* Point data length */
+#define POINT_DATA_LEN		65
+
+/* Misc */
+#define NT36XXX_NUM_SUPPLIES	 4
+#define NT36XXX_MAX_RETRIES	 5
+#define NT36XXX_MAX_FW_RST_RETRY 50
+
+enum nt36xxx_chips {
+        NT36525_IC = 0x1,
+        NT36672A_IC,
+        NT36676F_IC,
+        NT36772_IC,
+        NT36675_IC,
+        NT36870_IC,
+        NTMAX_IC,
+};
+
+enum nt36xxx_cmds {
+	NT36XXX_CMD_ENTER_SLEEP = 0x11,
+	NT36XXX_CMD_BOOTLOADER_RESET = 0x69,
+};
+
+enum nt36xxx_events {
+        NT36XXX_EVT_REPORT              = 0x00,
+        NT36XXX_EVT_CRC                 = 0x35,
+        NT36XXX_EVT_HOST_CMD            = 0x50,
+        NT36XXX_EVT_HS_OR_SUBCMD        = 0x51, /* Handshake or subcommand byte */
+        NT36XXX_EVT_RESET_COMPLETE      = 0x60,
+        NT36XXX_EVT_FWINFO              = 0x78,
+        NT36XXX_EVT_READ_PID            = 0x80,
+        NT36XXX_EVT_PROJECTID           = 0x9a, /* Excess 0x80 write bit, messed trouble, ignored */
+};
+
+enum nt36xxx_fw_state {
+        NT36XXX_STATE_INIT = 0xa0,              /* IC Reset */
+        NT36XXX_STATE_REK = 0xa1,               /* ReK baseline */
+        NT36XXX_STATE_REK_FINISH = 0xa2,        /* Baseline is ready */
+        NT36XXX_STATE_NORMAL_RUN = 0xa3,        /* Firmware is running */
+        NT36XXX_STATE_MAX = 0xaf
+};
+
+struct nt36xxx_ts;
+
+struct nvt_fw_parse_data {
+	uint8_t partition;
+	uint8_t ilm_dlm_num;
+};
+
+struct nvt_ts_bin_map {
+	char name[12];
+	uint32_t bin_addr;
+	uint32_t sram_addr;
+	uint32_t size;
+	uint32_t crc;
+	uint32_t loaded;
+};
+
+struct nvt_ts_hw_info {
+	uint8_t carrier_system;
+	uint8_t hw_crc;
+};
+
+struct nt36xxx_abs_object {
+	u16 x;
+	u16 y;
+	u16 z;
+	u8 tm;
+};
+
+struct nt36xxx_fw_info {
+	u8 fw_ver;
+	u8 x_num;
+	u8 y_num;
+	u8 max_buttons;
+	u16 abs_x_max;
+	u16 abs_y_max;
+	u16 nvt_pid;
+};
+
+struct nt36xxx_chip_data {
+	const u32 *mmap;
+	const struct regmap_config *config;
+
+	const char* fw_name;
+	unsigned int max_x;
+	unsigned int max_y;
+	unsigned int abs_x_max;
+	unsigned int abs_y_max;
+	unsigned int max_button;
+	const struct input_id *id;
+};
+
+struct nt36xxx_trim_table {
+	u8 id[NT36XXX_ID_LEN_MAX];
+	u8 mask[NT36XXX_ID_LEN_MAX];
+	enum nt36xxx_chips mapid;
+	uint8_t carrier_system;
+	uint8_t hw_crc;
+};
+
+int nt36xxx_probe(struct device *dev, int irq, const struct input_id *id,
+			struct regmap *regmap);
+
+extern const struct dev_pm_ops nt36xxx_pm_ops;
+extern const u32 nt36675_memory_maps[];
+extern const u32 nt36672a_memory_maps[];
+extern const u32 nt36772_memory_maps[];
+extern const u32 nt36676f_memory_maps[];
+extern const u32 nt36525_memory_maps[];
+#endif
diff --git a/drivers/input/touchscreen/nt36xxx_core.c b/drivers/input/touchscreen/nt36xxx_core.c
new file mode 100644
index 0000000000..a27abe566b
--- /dev/null
+++ b/drivers/input/touchscreen/nt36xxx_core.c
@@ -0,0 +1,1422 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for Novatek NT36xxx series touchscreens
+ *
+ * Copyright (C) 2010 - 2018 Novatek, Inc.
+ * Copyright (C) 2020 XiaoMi, Inc.
+ * Copyright (C) 2020 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ * Copyright (C) 2023-2024 George Chan <gchan9527@gmail.com>
+ *
+ * Based on nt36xxx.c i2c driver from AngeloGioacchino Del Regno
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/devm-helpers.h>
+#include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/irqnr.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/printk.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+#include <drm/drm_panel.h>
+
+#include "nt36xxx.h"
+
+/* Main mmap to spi addr */
+enum {
+	MMAP_BASELINE_ADDR,
+	MMAP_BASELINE_BTN_ADDR,
+	MMAP_BLD_CRC_EN_ADDR,
+	MMAP_BLD_DES_ADDR,
+	MMAP_BLD_ILM_DLM_CRC_ADDR,
+	MMAP_BLD_LENGTH_ADDR,
+	MMAP_BOOT_RDY_ADDR,
+	MMAP_DIFF_BTN_PIPE0_ADDR,
+	MMAP_DIFF_BTN_PIPE1_ADDR,
+	MMAP_DIFF_PIPE0_ADDR,
+	MMAP_DIFF_PIPE1_ADDR,
+	MMAP_DLM_DES_ADDR,
+	MMAP_DLM_LENGTH_ADDR,
+	MMAP_DMA_CRC_EN_ADDR,
+	MMAP_DMA_CRC_FLAG_ADDR,
+	MMAP_ENG_RST_ADDR,
+	MMAP_EVENT_BUF_ADDR,
+	MMAP_G_DLM_CHECKSUM_ADDR,
+	MMAP_G_ILM_CHECKSUM_ADDR,
+	MMAP_ILM_DES_ADDR,
+	MMAP_ILM_LENGTH_ADDR,
+	MMAP_POR_CD_ADDR,
+	MMAP_RAW_BTN_PIPE0_ADDR,
+	MMAP_RAW_BTN_PIPE1_ADDR,
+	MMAP_RAW_PIPE0_ADDR,
+	MMAP_RAW_PIPE1_ADDR,
+	MMAP_READ_FLASH_CHECKSUM_ADDR,
+	MMAP_RW_FLASH_DATA_ADDR,
+	MMAP_R_DLM_CHECKSUM_ADDR,
+	MMAP_R_ILM_CHECKSUM_ADDR,
+	MMAP_SPI_RD_FAST_ADDR,
+	MMAP_SWRST_N8_ADDR,
+
+	/* below are magic numbers in source code */
+	MMAP_MAGIC_NUMBER_0X1F64E_ADDR,
+
+	/* this addr is not specific to */
+	MMAP_TOP_ADDR,
+	MMAP_MAX_ADDR = MMAP_TOP_ADDR,
+} nt36xxx_ts_mem_map;
+
+static struct drm_panel_follower_funcs nt36xxx_panel_follower_funcs;
+
+struct nt36xxx_ts {
+	struct regmap *regmap;
+
+	struct input_dev *input;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+        struct gpio_desc *irq_gpio;
+	int irq;
+	struct device *dev;
+
+	struct mutex lock;
+
+#define NT36XXX_STATUS_SUSPEND			BIT(0)
+#define NT36XXX_STATUS_DOWNLOAD_COMPLETE	BIT(1)
+#define NT36XXX_STATUS_DOWNLOAD_RECOVER		BIT(2)
+#define NT36XXX_STATUS_PREPARE_FIRMWARE		BIT(3)
+#define NT36XXX_STATUS_NEED_FIRMWARE      	BIT(4)
+
+	unsigned int status;
+
+	struct touchscreen_properties prop;
+	struct nt36xxx_fw_info fw_info;
+	struct nt36xxx_abs_object abs_obj;
+
+	struct drm_panel_follower panel_follower;
+
+	struct delayed_work work;
+
+	/* this is a duplicate with nt36xxx_chip_data and since the address might
+	 * change in boot/init/download stages so make it a copy of initial map and
+	 * update accordingly
+	 */
+	u32 *mmap;
+	u32 mmap_data[MMAP_MAX_ADDR];
+
+	struct nvt_fw_parse_data fw_data;
+	struct nvt_ts_bin_map *bin_map;
+
+	uint8_t hw_crc;
+
+	const char * fw_name;
+	struct firmware fw_entry; /* containing request fw data */
+	const struct nt36xxx_chip_data *data;
+};
+
+static const struct nt36xxx_trim_table trim_id_table[] = {
+	/* TODO: port and test all related module */
+	{
+		.id = { 0x0A, 0xFF, 0xFF, 0x72, 0x66, 0x03 },
+		.mask = { 1, 0, 0, 1, 1, 1 },
+		.mapid = NT36672A_IC,
+	},
+	{
+		.id = { 0x55, 0x00, 0xFF, 0x00, 0x00, 0x00 },
+		.mask = { 1, 1, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0x55, 0x72, 0xFF, 0x00, 0x00, 0x00 },
+		.mask = { 1, 1, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xAA, 0x00, 0xFF, 0x00, 0x00, 0x00 },
+		.mask = { 1, 1, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xAA, 0x72, 0xFF, 0x00, 0x00, 0x00 },
+		.mask = { 1, 1, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xFF, 0xFF, 0xFF, 0x72, 0x67, 0x03 },
+		.mask = { 0, 0, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xFF, 0xFF, 0xFF, 0x70, 0x66, 0x03 },
+		.mask = { 0, 0, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xFF, 0xFF, 0xFF, 0x70, 0x67, 0x03 },
+		.mask = { 0, 0, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xFF, 0xFF, 0xFF, 0x72, 0x66, 0x03 },
+		.mask = { 0, 0, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xFF, 0xFF, 0xFF, 0x25, 0x65, 0x03 },
+		.mask = { 0, 0, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xFF, 0xFF, 0xFF, 0x70, 0x68, 0x03 },
+		.mask = { 0, 0, 0, 1, 1, 1 },
+		.mapid = NT36772_IC,
+	},
+	{
+		.id = { 0xFF, 0xFF, 0xFF, 0x76, 0x66, 0x03 },
+		.mask = { 0, 0, 0, 1, 1, 1 },
+		.mapid = NT36676F_IC,
+	},
+	{
+		.id = { 0xFF, 0xFF, 0xFF, 0x75, 0x66, 0x03},
+		.mask = { 0, 0, 0, 1, 1, 1 },
+		.mapid = NT36675_IC,
+		.hw_crc = 2,
+	},
+	{ },
+};
+
+const u32 nt36675_memory_maps[] = {
+	[MMAP_EVENT_BUF_ADDR] = 0x22D00,
+	[MMAP_RAW_PIPE0_ADDR] = 0x24000,
+	[MMAP_RAW_PIPE1_ADDR] = 0x24000,
+	[MMAP_BASELINE_ADDR] = 0x21B90,
+	[MMAP_DIFF_PIPE0_ADDR] = 0x20C60,
+	[MMAP_DIFF_PIPE1_ADDR] = 0x24C60,
+	[MMAP_READ_FLASH_CHECKSUM_ADDR] = 0x24000,
+	[MMAP_RW_FLASH_DATA_ADDR] = 0x24002,
+	[MMAP_BOOT_RDY_ADDR] = 0x3F10D,
+	[MMAP_BLD_LENGTH_ADDR] = 0x3F138,
+	[MMAP_ILM_LENGTH_ADDR] = 0x3F118,
+	[MMAP_DLM_LENGTH_ADDR] = 0x3F130,
+	[MMAP_BLD_DES_ADDR] = 0x3F114,
+	[MMAP_ILM_DES_ADDR] = 0x3F128,
+	[MMAP_DLM_DES_ADDR] = 0x3F12C,
+	[MMAP_G_ILM_CHECKSUM_ADDR] = 0x3F100,
+	[MMAP_G_DLM_CHECKSUM_ADDR] = 0x3F104,
+	[MMAP_R_ILM_CHECKSUM_ADDR] = 0x3F120,
+	[MMAP_R_DLM_CHECKSUM_ADDR] = 0x3F124,
+	[MMAP_BLD_CRC_EN_ADDR] = 0x3F30E,
+	[MMAP_DMA_CRC_EN_ADDR] = 0x3F136,
+	[MMAP_BLD_ILM_DLM_CRC_ADDR] = 0x3F133,
+	[MMAP_DMA_CRC_FLAG_ADDR] = 0x3F134,
+
+	/* below are specified by dts, so it might change by project-based */
+	[MMAP_SPI_RD_FAST_ADDR] = 0x03F310,
+	[MMAP_SWRST_N8_ADDR] = 0x03F0FE,
+
+	[MMAP_ENG_RST_ADDR] = 0x7FFF80,
+	[MMAP_MAGIC_NUMBER_0X1F64E_ADDR] = 0x1F64E,
+
+	[MMAP_TOP_ADDR] = 0xffffff,
+};
+
+const u32 nt36672a_memory_maps[] = {
+	[MMAP_EVENT_BUF_ADDR] = 0x21C00,
+	[MMAP_RAW_PIPE0_ADDR] = 0x20000,
+	[MMAP_RAW_PIPE1_ADDR] = 0x23000,
+	[MMAP_BASELINE_ADDR] = 0x20BFC,
+	[MMAP_BASELINE_BTN_ADDR] = 0x23BFC,
+	[MMAP_DIFF_PIPE0_ADDR] = 0x206DC,
+	[MMAP_DIFF_PIPE1_ADDR] = 0x236DC,
+	[MMAP_RAW_BTN_PIPE0_ADDR] = 0x20510,
+	[MMAP_RAW_BTN_PIPE1_ADDR] = 0x23510,
+	[MMAP_DIFF_BTN_PIPE0_ADDR] = 0x20BF0,
+	[MMAP_DIFF_BTN_PIPE1_ADDR] = 0x23BF0,
+	[MMAP_READ_FLASH_CHECKSUM_ADDR] = 0x24000,
+	[MMAP_RW_FLASH_DATA_ADDR] = 0x24002,
+	/* Phase 2 Host Download */
+	[MMAP_BOOT_RDY_ADDR] = 0x3F10D,
+	/* BLD CRC */
+	[MMAP_BLD_LENGTH_ADDR] = 0x3F10E,    //0x3F10E ~ 0x3F10F     (2 bytes)
+	[MMAP_ILM_LENGTH_ADDR] = 0x3F118,    //0x3F118 ~ 0x3F119     (2 bytes)
+	[MMAP_DLM_LENGTH_ADDR] = 0x3F130,    //0x3F130 ~ 0x3F131     (2 bytes)
+	[MMAP_BLD_DES_ADDR] = 0x3F114,    //0x3F114 ~ 0x3F116     (3 bytes)
+	[MMAP_ILM_DES_ADDR] = 0x3F128,    //0x3F128 ~ 0x3F12A     (3 bytes)
+	[MMAP_DLM_DES_ADDR] = 0x3F12C,    //0x3F12C ~ 0x3F12E     (3 bytes)
+	[MMAP_G_ILM_CHECKSUM_ADDR] = 0x3F100,    //0x3F100 ~ 0x3F103     (4 bytes)
+	[MMAP_G_DLM_CHECKSUM_ADDR] = 0x3F104,    //0x3F104 ~ 0x3F107     (4 bytes)
+	[MMAP_R_ILM_CHECKSUM_ADDR] = 0x3F120,    //0x3F120 ~ 0x3F123 (4 bytes)
+	[MMAP_R_DLM_CHECKSUM_ADDR] = 0x3F124,    //0x3F124 ~ 0x3F127 (4 bytes)
+	[MMAP_BLD_CRC_EN_ADDR] = 0x3F30E,
+	[MMAP_DMA_CRC_EN_ADDR] = 0x3F132,
+	[MMAP_BLD_ILM_DLM_CRC_ADDR] = 0x3F133,
+	[MMAP_DMA_CRC_FLAG_ADDR] = 0x3F134,
+
+	/* below are specified by dts, so it might change by project-based */
+	[MMAP_SPI_RD_FAST_ADDR] = 0x03F310,
+	[MMAP_SWRST_N8_ADDR] = 0x03F0FE,
+
+	[MMAP_ENG_RST_ADDR] = 0x7FFF80,
+	[MMAP_MAGIC_NUMBER_0X1F64E_ADDR] = 0x1F64E,
+
+	[MMAP_TOP_ADDR] = 0xffffff,
+};
+
+const u32 nt36676f_memory_maps[] = {
+	[MMAP_EVENT_BUF_ADDR] = 0x11A00,
+	[MMAP_RAW_PIPE0_ADDR] = 0x10000,
+	[MMAP_RAW_PIPE1_ADDR] = 0x12000,
+	[MMAP_BASELINE_ADDR] = 0x10B08,
+	[MMAP_BASELINE_BTN_ADDR] = 0x12B08,
+	[MMAP_DIFF_PIPE0_ADDR] = 0x1064C,
+	[MMAP_DIFF_PIPE1_ADDR] = 0x1264C,
+	[MMAP_RAW_BTN_PIPE0_ADDR] = 0x10634,
+	[MMAP_RAW_BTN_PIPE1_ADDR] = 0x12634,
+	[MMAP_DIFF_BTN_PIPE0_ADDR] = 0x10AFC,
+	[MMAP_DIFF_BTN_PIPE1_ADDR] = 0x12AFC,
+	[MMAP_READ_FLASH_CHECKSUM_ADDR] = 0x14000,
+	[MMAP_RW_FLASH_DATA_ADDR] = 0x14002,
+
+	/* below are specified by dts, so it might change by project-based */
+	[MMAP_SPI_RD_FAST_ADDR] = 0x03F310,
+	[MMAP_SWRST_N8_ADDR] = 0x03F0FE,
+
+	[MMAP_ENG_RST_ADDR] = 0x7FFF80,
+	[MMAP_MAGIC_NUMBER_0X1F64E_ADDR] = 0x1F64E,
+
+	[MMAP_TOP_ADDR] = 0xffffff,
+};
+
+const u32 nt36772_memory_maps[] = {
+	[MMAP_EVENT_BUF_ADDR] = 0x11E00,
+	[MMAP_RAW_PIPE0_ADDR] = 0x10000,
+	[MMAP_RAW_PIPE1_ADDR] = 0x12000,
+	[MMAP_BASELINE_ADDR] = 0x10E70,
+	[MMAP_BASELINE_BTN_ADDR] = 0x12E70,
+	[MMAP_DIFF_PIPE0_ADDR] = 0x10830,
+	[MMAP_DIFF_PIPE1_ADDR] = 0x12830,
+	[MMAP_RAW_BTN_PIPE0_ADDR] = 0x10E60,
+	[MMAP_RAW_BTN_PIPE1_ADDR] = 0x12E60,
+	[MMAP_DIFF_BTN_PIPE0_ADDR] = 0x10E68,
+	[MMAP_DIFF_BTN_PIPE1_ADDR] = 0x12E68,
+	[MMAP_READ_FLASH_CHECKSUM_ADDR] = 0x14000,
+	[MMAP_RW_FLASH_DATA_ADDR] = 0x14002,
+	/* Phase 2 Host Download */
+	[MMAP_BOOT_RDY_ADDR] = 0x1F141,
+	[MMAP_POR_CD_ADDR] = 0x1F61C,
+	/* BLD CRC */
+	[MMAP_R_ILM_CHECKSUM_ADDR] = 0x1BF00,
+
+	/* below are specified by dts, so it might change by project-based */
+	[MMAP_SPI_RD_FAST_ADDR] = 0x03F310,
+	[MMAP_SWRST_N8_ADDR] = 0x03F0FE,
+
+	[MMAP_ENG_RST_ADDR] = 0x7FFF80,
+	[MMAP_MAGIC_NUMBER_0X1F64E_ADDR] = 0x1F64E,
+
+	[MMAP_TOP_ADDR] = 0xffffff,
+};
+
+const u32 nt36525_memory_maps[] = {
+	[MMAP_EVENT_BUF_ADDR] = 0x11A00,
+	[MMAP_RAW_PIPE0_ADDR] = 0x10000,
+	[MMAP_RAW_PIPE1_ADDR] = 0x12000,
+	[MMAP_BASELINE_ADDR] = 0x10B08,
+	[MMAP_BASELINE_BTN_ADDR] = 0x12B08,
+	[MMAP_DIFF_PIPE0_ADDR] = 0x1064C,
+	[MMAP_DIFF_PIPE1_ADDR] = 0x1264C,
+	[MMAP_RAW_BTN_PIPE0_ADDR] = 0x10634,
+	[MMAP_RAW_BTN_PIPE1_ADDR] = 0x12634,
+	[MMAP_DIFF_BTN_PIPE0_ADDR] = 0x10AFC,
+	[MMAP_DIFF_BTN_PIPE1_ADDR] = 0x12AFC,
+	[MMAP_READ_FLASH_CHECKSUM_ADDR] = 0x14000,
+	[MMAP_RW_FLASH_DATA_ADDR] = 0x14002,
+
+	/* Phase 2 Host Download */
+	[MMAP_BOOT_RDY_ADDR] = 0x1F141,
+	[MMAP_POR_CD_ADDR] = 0x1F61C,
+	/* BLD CRC */
+	[MMAP_R_ILM_CHECKSUM_ADDR] = 0x1BF00,
+
+	/* below are specified by dts, so it might change by project-based */
+	[MMAP_SPI_RD_FAST_ADDR] = 0x03F310,
+	[MMAP_SWRST_N8_ADDR] = 0x03F0FE,
+
+	[MMAP_ENG_RST_ADDR] = 0x7FFF80,
+	[MMAP_MAGIC_NUMBER_0X1F64E_ADDR] = 0x1F64E,
+
+	[MMAP_TOP_ADDR] = 0xffffff,
+};
+
+void __maybe_unused _debug_irq(struct nt36xxx_ts *ts, int line) {
+        struct irq_desc *desc;
+        desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
+        dev_info(ts->dev, "%d irq_desc depth=%d", line, desc->depth );
+}
+
+#define debug_irq(a) _debug_irq(a, __LINE__)
+
+static int nt36xxx_eng_reset_idle(struct nt36xxx_ts *ts)
+{
+	int ret;
+
+	if(!ts) {
+		dev_err(ts->dev, "%s %s empty", __func__, "nt36xxx_ts");
+		return -EINVAL;
+	}
+
+	if(!ts->mmap) {
+		dev_err(ts->dev, "%s %s empty", __func__, "ts->mmap");
+		return -EINVAL;
+	}
+
+	if(ts->mmap[MMAP_ENG_RST_ADDR] == 0) {
+		dev_err(ts->dev, "%s %s empty", __func__, "MMAP_ENG_RST_ADDR");
+		return -EINVAL;
+	}
+
+	/* HACK to output something without read */
+	ret = regmap_write(ts->regmap, ts->mmap[MMAP_ENG_RST_ADDR],
+					   0x5a);
+	if (ret) {
+		dev_err(ts->dev, "%s regmap write error\n", __func__);
+		return ret;
+	}
+
+	/* Wait until the MCU resets the fw state */
+	usleep_range(15000, 16000);
+
+	/* seemed not long enough */
+	msleep(30);
+	return ret;
+}
+
+/*
+ * nt36xxx_bootloader_reset - Reset MCU to bootloader
+ * @ts: Main driver structure
+ *
+ * Return: Always zero for success, negative number for error
+ */
+static int nt36xxx_bootloader_reset(struct nt36xxx_ts *ts)
+{
+	int ret = 0;
+
+	//in spi version, need to set page to SWRST_N8_ADDR
+	if (ts->mmap[MMAP_SWRST_N8_ADDR]) {
+		ret = regmap_write(ts->regmap, ts->mmap[MMAP_SWRST_N8_ADDR],
+			   NT36XXX_CMD_BOOTLOADER_RESET);
+	        if (ret)
+			return ret;
+	} else {
+		pr_info("plz make sure MMAP_SWRST_N8_ADDR is set!\n");
+		return -EINVAL;
+	}
+
+	/* MCU has to reboot from bootloader: this is the typical boot time */
+	msleep(35);
+
+	if (ts->mmap[MMAP_SPI_RD_FAST_ADDR]) {
+                ret = regmap_write(ts->regmap, ts->mmap[MMAP_SPI_RD_FAST_ADDR], 0);
+                if (ret)
+                        return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * nt36xxx_check_reset_state - Check the boot state during reset
+ * @ts: Main driver structure
+ * @fw_state: Enumeration containing firmware states
+ *
+ * Return: Always zero for success, negative number for error
+ */
+static int nt36xxx_check_reset_state(struct nt36xxx_ts *ts,
+				     enum nt36xxx_fw_state fw_state)
+{
+	u8 buf[8] = { 0 };
+	int ret = 0, retry = NT36XXX_MAX_FW_RST_RETRY;
+
+	do {
+		ret = regmap_raw_read(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR]
+				 | NT36XXX_EVT_RESET_COMPLETE, buf, 6);
+		if (likely(ret == 0) &&
+		    (buf[1] >= fw_state) &&
+		    (buf[1] <= NT36XXX_STATE_MAX)) {
+			ret = 0;
+			break;
+		}
+		usleep_range(10000, 11000);
+	} while (--retry);
+
+	if (!retry) {
+		dev_err(ts->dev, "Firmware reset failed.\n");
+		ret = -EBUSY;
+	}
+
+	return ret;
+}
+
+/**
+ * nt36xxx_report - Report touch events
+ * @ts: Main driver structure
+ *
+ * Return: Always zero for success, negative number for error
+ */
+static void nt36xxx_report(struct nt36xxx_ts *ts)
+{
+	struct nt36xxx_abs_object *obj = &ts->abs_obj;
+	struct input_dev *input = ts->input;
+	u8 input_id = 0;
+	u8 point[POINT_DATA_LEN + 1] = { 0 };
+	unsigned int ppos = 0;
+	int i, ret, finger_cnt = 0;
+	uint8_t press_id[TOUCH_MAX_FINGER_NUM] = {0};
+
+	ret = regmap_raw_read(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR],
+				point, sizeof(point));
+	if (ret < 0) {
+		dev_err(ts->dev,
+			"Cannot read touch point data: %d\n", ret);
+		goto xfer_error;
+	}
+
+	/* wdt recovery and esd check */
+	for (i = 0; i < 7; i++) {
+		if ((point[i] != 0xFD) && (point[i] != 0xFE) && (point[i] != 0x77)) {
+			break;
+		}
+
+		mutex_lock(&ts->lock);
+		ts->status |= NT36XXX_STATUS_DOWNLOAD_RECOVER;
+		mutex_unlock(&ts->lock);
+		goto xfer_error;
+	}
+
+	for (i = 0; i < TOUCH_MAX_FINGER_NUM; i++) {
+		ppos = 6 * i + 1;
+		input_id = point[ppos + 0] >> 3;
+
+		if ((input_id == 0) || (input_id > TOUCH_MAX_FINGER_NUM)) {
+			continue;
+		}
+
+		if (((point[ppos] & 0x07) == 0x01) ||
+		    ((point[ppos] & 0x07) == 0x02)) {
+			obj->x = (point[ppos + 1] << 4) +
+				 (point[ppos + 3] >> 4);
+			obj->y = (point[ppos + 2] << 4) +
+				 (point[ppos + 3] & 0xf);
+
+			if ((obj->x > ts->prop.max_x) ||
+			    (obj->y > ts->prop.max_y))
+				continue;
+
+			obj->tm = point[ppos + 4];
+			if (obj->tm == 0)
+				obj->tm = 1;
+
+			obj->z = point[ppos + 5];
+			if (i < 2) {
+				obj->z += point[i + 63] << 8;
+				if (obj->z > TOUCH_MAX_PRESSURE)
+					obj->z = TOUCH_MAX_PRESSURE;
+			}
+
+			if (obj->z == 0)
+				obj->z = 1;
+
+			press_id[input_id - 1] = 1;
+
+			input_mt_slot(input, input_id - 1);
+			input_mt_report_slot_state(input,
+						   MT_TOOL_FINGER, true);
+			touchscreen_report_pos(input, &ts->prop,
+						obj->x,
+						obj->y, true);
+
+			input_report_abs(input, ABS_MT_TOUCH_MAJOR, obj->tm);
+			input_report_abs(input, ABS_MT_PRESSURE, obj->z);
+
+			finger_cnt++;
+		}
+	}
+
+	input_mt_sync_frame(input);
+
+	input_sync(input);
+
+xfer_error:
+	return;
+}
+
+static irqreturn_t nt36xxx_irq_handler(int irq, void *dev_id)
+{
+	struct nt36xxx_ts *ts = dev_id;
+
+	if (!ts->mmap)
+		goto exit;
+
+	disable_irq_nosync(ts->irq);
+
+	nt36xxx_report(ts);
+
+	enable_irq(ts->irq);
+
+exit:
+	if (ts->status & NT36XXX_STATUS_DOWNLOAD_RECOVER) {
+		mutex_lock(&ts->lock);
+		ts->status &= ~NT36XXX_STATUS_DOWNLOAD_RECOVER;
+		mutex_unlock(&ts->lock);
+		/* TODO: other builtin eeprom model might have another reset
+		 * approach other than download, might add here afterward */
+		if (ts->fw_name)
+			schedule_delayed_work(&ts->work, 40000);
+	}
+
+	return IRQ_HANDLED;
+}
+
+
+/**
+ * nt36xxx_chip_version_init - Detect Novatek NT36xxx family IC
+ * @ts: Main driver structure
+ *
+ * This function reads the ChipID from the IC and sets the right
+ * memory map for the detected chip.
+ *
+ * Return: Always zero for success, negative number for error
+ */
+static int nt36xxx_chip_version_init(struct nt36xxx_ts *ts)
+{
+	u8 buf[32] = { 0 };
+	int retry = NT36XXX_MAX_RETRIES;
+	int sz = sizeof(trim_id_table) / sizeof(struct nt36xxx_trim_table);
+	int i, list, mapid, ret;
+
+	ret = nt36xxx_bootloader_reset(ts);
+	if (ret) {
+		dev_err(ts->dev, "Can't reset the nvt IC\n");
+		return ret;
+	}
+
+	do {
+		ret = regmap_raw_read(ts->regmap, ts->mmap[MMAP_MAGIC_NUMBER_0X1F64E_ADDR], buf, 7);
+
+		if (ret)
+			continue;
+
+		dev_dbg(ts->dev, "%s buf[0]=0x%02X, buf[1]=0x%02X, buf[2]=0x%02X, buf[3]=0x%02X, buf[4]=0x%02X, buf[5]=0x%02X, buf[6]=0x%02X sz=%d\n",
+			__func__, buf[0], buf[1], buf[2], buf[3], buf[4], buf[5], buf[6], sz);
+
+		/* Compare read chip id with trim list */
+		for (list = 0; list < sz; list++) {
+
+			/* Compare each not masked byte */
+			for (i = 0; i < NT36XXX_ID_LEN_MAX; i++) {
+				if (trim_id_table[list].mask[i] &&
+				    buf[i + 1] != trim_id_table[list].id[i])
+					break;
+			}
+
+			/* found and match with mask */
+			if (i == NT36XXX_ID_LEN_MAX) {
+				mapid = trim_id_table[list].mapid;
+				ret = 0;
+				ts->hw_crc = trim_id_table[list].hw_crc;
+
+				if (mapid == 0) {
+					dev_info(ts->dev, "NVT touch IC hw not found i=%d list=%d\n", i, list);
+					ret = -ENOENT;
+					goto exit;
+				}
+
+				WARN_ON(ts->hw_crc < 1);
+
+				dev_dbg(ts->dev, "hw crc support=%d\n", ts->hw_crc);
+
+				dev_info(ts->dev, "This is NVT touch IC, %06x, mapid %d", *(int*)&buf[4], mapid);
+				return 0;
+			}
+
+			ret = -ENOENT;
+		}
+
+		usleep_range(10000, 11000);
+	} while (--retry);
+
+exit:
+	return ret;
+}
+
+/*
+ * this function is nearly direct copy from vendor source
+*/
+static int32_t nvt_bin_header_parser(struct device *dev, int hw_crc, const u8 *fwdata, size_t fwsize, struct nvt_ts_bin_map **bin_map_ptr, uint8_t *partition_ptr, uint8_t ilm_dlm_num)
+{
+	uint8_t list = 0;
+	uint32_t pos = 0x00;
+	uint32_t end = 0x00;
+	uint8_t info_sec_num = 0;
+	uint8_t ovly_sec_num = 0;
+	uint8_t ovly_info = 0;
+	uint8_t partition;
+	struct nvt_ts_bin_map *bin_map;
+
+	/* Find the header size */
+	end = fwdata[0] + (fwdata[1] << 8) + (fwdata[2] << 16) + (fwdata[3] << 24);
+	pos = 0x30;	/* info section start at 0x30 offset */
+	while (pos < end) {
+		info_sec_num ++;
+		pos += 0x10;	/* each header info is 16 bytes */
+	}
+
+	/*
+	 * Find the DLM OVLY section
+	 * [0:3] Overlay Section Number
+	 * [4]   Overlay Info
+	 */
+	ovly_info = (fwdata[0x28] & 0x10) >> 4;
+	ovly_sec_num = (ovly_info) ? (fwdata[0x28] & 0x0F) : 0;
+
+	/*
+	 * calculate all partition number
+	 * ilm_dlm_num (ILM & DLM) + ovly_sec_num + info_sec_num
+	 */
+	*partition_ptr = partition = ilm_dlm_num + ovly_sec_num + info_sec_num;
+	dev_dbg(dev, "ovly_info = %d, ilm_dlm_num = %d, ovly_sec_num = %d, info_sec_num = %d, partition = %d\n",
+			ovly_info, ilm_dlm_num, ovly_sec_num, info_sec_num, partition);
+
+	/* allocated memory for header info */
+	*bin_map_ptr = bin_map = (struct nvt_ts_bin_map *)kzalloc((partition + 1) * sizeof(struct nvt_ts_bin_map), GFP_KERNEL);
+	if(bin_map == NULL) {
+		dev_err(dev, "kzalloc for bin_map failed!\n");
+		return -ENOMEM;
+	}
+
+	for (list = 0; list < partition; list++) {
+		/*
+		 * [1] parsing ILM & DLM header info
+		 * bin_addr : sram_addr : size (12-bytes)
+		 * crc located at 0x18 & 0x1C
+		 */
+		if (list < ilm_dlm_num) {
+			memcpy(&bin_map[list].bin_addr, &(fwdata[0 + list*12]), 4);
+			memcpy(&bin_map[list].sram_addr, &(fwdata[4 + list*12]), 4);
+			memcpy(&bin_map[list].size, &(fwdata[8 + list*12]), 4);
+			memcpy(&bin_map[list].crc, &(fwdata[0x18 + list*4]), 4);
+
+                        if (!hw_crc) {
+				dev_err(dev, "%s %d sw-crc not support", __func__, __LINE__);
+				return -EINVAL;
+			}
+
+			if (list == 0)
+				sprintf(bin_map[list].name, "ILM");
+			else if (list == 1)
+				sprintf(bin_map[list].name, "DLM");
+		}
+
+		/*
+		 * [2] parsing others header info
+		 * sram_addr : size : bin_addr : crc (16-bytes)
+		 */
+		if ((list >= ilm_dlm_num) && (list < (ilm_dlm_num + info_sec_num))) {
+
+			/* others partition located at 0x30 offset */
+			pos = 0x30 + (0x10 * (list - ilm_dlm_num));
+
+			memcpy(&bin_map[list].sram_addr, &(fwdata[pos]), 4);
+			memcpy(&bin_map[list].size, &(fwdata[pos+4]), 4);
+			memcpy(&bin_map[list].bin_addr, &(fwdata[pos+8]), 4);
+                        memcpy(&bin_map[list].crc, &(fwdata[pos+12]), 4);
+
+			if (!hw_crc) {
+				dev_info(dev, "ok, hw_crc not presents!");
+				return -EINVAL;
+			}
+
+			/* detect header end to protect parser function */
+			if ((bin_map[list].bin_addr == 0) && (bin_map[list].size != 0)) {
+				sprintf(bin_map[list].name, "Header");
+			} else {
+				sprintf(bin_map[list].name, "Info-%d", (list - ilm_dlm_num));
+			}
+		}
+
+		/*
+		 * [3] parsing overlay section header info
+		 * sram_addr : size : bin_addr : crc (16-bytes)
+		 */
+		if (list >= (ilm_dlm_num + info_sec_num)) {
+			/* overlay info located at DLM (list = 1) start addr */
+			pos = bin_map[1].bin_addr + (0x10 * (list- ilm_dlm_num - info_sec_num));
+
+			memcpy(&bin_map[list].sram_addr, &(fwdata[pos]), 4);
+			memcpy(&bin_map[list].size, &(fwdata[pos+4]), 4);
+			memcpy(&bin_map[list].bin_addr, &(fwdata[pos+8]), 4);
+			memcpy(&bin_map[list].crc, &(fwdata[pos+12]), 4);
+
+			if (!hw_crc) {
+                                dev_err(dev, "%s %d sw_crc not support", __func__, __LINE__);
+                                return -EINVAL;
+			}
+
+			sprintf(bin_map[list].name, "Overlay-%d", (list- ilm_dlm_num - info_sec_num));
+		}
+
+		/* BIN size error detect */
+		if ((bin_map[list].bin_addr + bin_map[list].size) > fwsize) {
+			dev_err(dev, "access range (0x%08X to 0x%08X) is larger than bin size!\n",
+					bin_map[list].bin_addr, bin_map[list].bin_addr + bin_map[list].size);
+			return -EINVAL;
+		}
+
+		dev_dbg(dev, "[%d][%s] SRAM (0x%08X), SIZE (0x%08X), BIN (0x%08X), CRC (0x%08X)\n",
+                              list, bin_map[list].name,
+                              bin_map[list].sram_addr, bin_map[list].size,  bin_map[list].bin_addr, bin_map[list].crc);
+	}
+
+	return 0;
+}
+
+static int32_t nt36xxx_download_firmware_hw_crc(struct nt36xxx_ts *ts) {
+	uint32_t list = 0;
+	uint32_t bin_addr, sram_addr, size;
+	struct nvt_ts_bin_map *bin_map = ts->bin_map;
+
+        nt36xxx_bootloader_reset(ts);
+
+	for (list = 0; list < ts->fw_data.partition; list++) {
+		int j;
+
+		/* initialize variable */
+		sram_addr = bin_map[list].sram_addr;
+		size = bin_map[list].size;
+		bin_addr = bin_map[list].bin_addr;
+
+		/* ignore reserved partition (Reserved Partition size is zero) */
+		if (!size) {
+			dev_dbg(ts->dev, "found empty part %d. skipping ", list);
+			continue;
+		} else {
+			size = size + 1;
+			dev_dbg(ts->dev, "found useful part %d. size 0x%x ", list, size);
+		}
+
+		bin_map[list].loaded = 1;
+
+		if (size / NT36XXX_TRANSFER_LEN)
+			dev_dbg(ts->dev, "%s %d paged write [%s] 0x%x, window 0x%x, residue 0x%x",
+					__func__, __LINE__, bin_map[list].name, size,
+					NT36XXX_TRANSFER_LEN, size % NT36XXX_TRANSFER_LEN);
+
+		for (j = 0; j < size; j += NT36XXX_TRANSFER_LEN) {
+			int window_size = ((size - j) / NT36XXX_TRANSFER_LEN) ? NT36XXX_TRANSFER_LEN :
+						((size - j) % NT36XXX_TRANSFER_LEN);
+
+			regmap_bulk_write(ts->regmap, sram_addr + j, &ts->fw_entry.data[bin_addr + j],
+							 window_size);
+		}
+
+	}
+
+	return 0;
+}
+
+static void nt36xxx_release_memory(void *data);
+static int _nt36xxx_boot_prepare_firmware(struct nt36xxx_ts *ts) {
+	int i, ret;
+	size_t fw_need_write_size = 0;
+	const struct firmware *fw_entry;
+	void *data;
+
+	WARN_ON(ts->hw_crc != 2);
+
+	/* add one more guard */
+	if (ts->status & NT36XXX_STATUS_PREPARE_FIRMWARE)
+		return 0;
+
+	/* supposed we need to load once and use many time */
+	if (ts->fw_entry.data)
+		return 0;
+
+	ret = request_firmware(&fw_entry, ts->fw_name, ts->dev);
+	if (ret) {
+		dev_err(ts->dev, "request fw fail name=%s\n", ts->fw_name);
+		return -ENOMEM;
+	}
+
+	/*
+	 * must allocate in DMA buffer otherwise fail spi tx DMA
+	 * so we need to manage our own fw struct
+	 * pm_resume need to re-upload fw for NT36675 IC
+	 *
+	 */
+	ts->fw_entry.data = data = kmemdup(fw_entry->data, fw_entry->size, GFP_KERNEL | GFP_DMA);
+
+	release_firmware(fw_entry);
+	if (!ts->fw_entry.data) {
+		dev_err(ts->dev, "memdup fw_data fail\n");
+		return -ENOMEM;
+	}
+	ts->fw_entry.size = fw_entry->size;
+
+	WARN_ON(ts->fw_entry.data[0] != fw_entry->data[0]);
+
+	for (i = (ts->fw_entry.size / 4096); i > 0; i--) {
+		if (strncmp(&ts->fw_entry.data[i * 4096 - 3], "NVT", 3) == 0) {
+			fw_need_write_size = i * 4096;
+			break;
+		}
+
+		if (strncmp(&ts->fw_entry.data[i * 4096 - 3], "MOD", 3) == 0) {
+			fw_need_write_size = i * 4096;
+			break;
+		}
+	}
+
+	if (fw_need_write_size == 0) {
+		dev_err(ts->dev, "fw parsing error\n");
+		kfree (data);
+		if (ts->bin_map) {
+			kfree(ts->bin_map);
+			ts->bin_map = NULL;
+		}
+		return -EIO;
+	}
+
+	if (*(ts->fw_entry.data + (fw_need_write_size - 4096)) + *(ts->fw_entry.data +
+						((fw_need_write_size - 4096) + 1)) != 0xFF) {
+		dev_err(ts->dev, "bin file FW_VER + FW_VER_BAR should be 0xFF!");
+		dev_err(ts->dev, "FW_VER=0x%02X, FW_VER_BAR=0x%02X\n",
+			*(ts->fw_entry.data+(fw_need_write_size - 4096)),
+			*(ts->fw_entry.data+(fw_need_write_size - 4096 + 1)));
+
+		kfree (data);
+		if (ts->bin_map) {
+			kfree(ts->bin_map);
+			ts->bin_map = NULL;
+		}
+		return -EIO;
+	}
+
+	ts->fw_data.ilm_dlm_num = 2;
+
+	ret = nvt_bin_header_parser(ts->dev, ts->hw_crc, ts->fw_entry.data, ts->fw_entry.size,
+			&ts->bin_map, &ts->fw_data.partition, ts->fw_data.ilm_dlm_num);
+	if (ret) {
+		kfree (data);
+		if(ret != -ENOMEM){
+			if (ts->bin_map) {
+				kfree(ts->bin_map);
+				ts->bin_map = NULL;
+			}
+		}
+
+		/* really dont let the tasklet re-enter since no needed for broken fw data */
+		ts->status |= NT36XXX_STATUS_DOWNLOAD_COMPLETE;
+		dev_err(ts->dev, "Parsing fw error, stop re-loading fw now on, ret=0x%x!", ret);
+		return ret;
+	}
+
+	ts->status |= NT36XXX_STATUS_PREPARE_FIRMWARE;
+
+	ret = devm_add_action_or_reset(ts->dev, nt36xxx_release_memory, ts);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int _nt36xxx_boot_download_firmware(struct nt36xxx_ts *ts) {
+        int i, ret, retry = 0;
+        u8 val[8 * 4] = {0};
+
+	if (!(ts->status & NT36XXX_STATUS_PREPARE_FIRMWARE))
+		return -EIO;
+
+	if (ts->hw_crc) {
+		ret = nt36xxx_download_firmware_hw_crc(ts);
+		if (ret) {
+			dev_err(ts->dev, "nt36xxx_download_firmware_hw_crc fail!");
+			return ret;
+		}
+
+	} else {
+		dev_err(ts->dev, "non-hw_crc model is not support yet!");
+		return -EIO;
+	}
+
+	/* set ilm & dlm reg bank */
+	for (i = 0; i < ts->fw_data.partition; i++) {
+		if (0 == strncmp(ts->bin_map[i].name, "ILM", 3)) {
+			regmap_raw_write(ts->regmap, ts->mmap[MMAP_ILM_DES_ADDR], &ts->bin_map[i].sram_addr, 3);
+			regmap_raw_write(ts->regmap, ts->mmap[MMAP_ILM_LENGTH_ADDR], &ts->bin_map[i].size, 3);
+
+			/* crc > 1 then len = 4, crc = 1 then len = 3 */
+			regmap_raw_write(ts->regmap, ts->mmap[MMAP_G_ILM_CHECKSUM_ADDR], &ts->bin_map[i].crc,
+						sizeof(ts->bin_map[i].crc));
+		}
+		if (0 == strncmp(ts->bin_map[i].name, "DLM", 3)) {
+			regmap_raw_write(ts->regmap, ts->mmap[MMAP_DLM_DES_ADDR], &ts->bin_map[i].sram_addr, 3);
+			regmap_raw_write(ts->regmap, ts->mmap[MMAP_DLM_LENGTH_ADDR], &ts->bin_map[i].size, 3);
+
+			/* crc > 1 then len = 4, crc = 1 then len = 3 */
+			regmap_raw_write(ts->regmap, ts->mmap[MMAP_G_DLM_CHECKSUM_ADDR], &ts->bin_map[i].crc,
+						sizeof(ts->bin_map[i].crc));
+		}
+	}
+
+	/* nvt_bld_crc_enable() */
+	/* crc enable */
+	regmap_raw_read(ts->regmap, ts->mmap[MMAP_BLD_CRC_EN_ADDR], val, 1);
+
+	val[0] |= 1 << 7;
+	regmap_raw_write(ts->regmap, ts->mmap[MMAP_BLD_CRC_EN_ADDR], val, 1);
+
+	/* enable fw crc */
+	val[0] = 0;
+	regmap_raw_write(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR] | NT36XXX_EVT_RESET_COMPLETE, val, 1);
+
+	val[0] = 0xae;
+	regmap_raw_write(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR] | NT36XXX_EVT_HOST_CMD, val, 1);
+
+	/* nvt_boot_ready() */
+	/* Set Boot Ready Bit */
+	val[0] = 0x1;
+	regmap_raw_write(ts->regmap, ts->mmap[MMAP_BOOT_RDY_ADDR], val, 1);
+
+	/* old logic 5ms, retention to 10ms */
+	usleep_range(10000, 11000);
+
+	/* nvt_check_fw_reset_state() */
+	ret = nt36xxx_check_reset_state(ts, NT36XXX_STATE_INIT);
+	if (ret)
+		return ret;
+
+check_fw:
+	/* nvt_get_fw_info() */
+	ret = regmap_raw_read(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR] | NT36XXX_EVT_FWINFO, val, 16);
+	if (ret)
+		return ret;
+
+	dev_dbg(ts->dev, "Get default fw_ver=%d, max_x=%d, max_y=%d, by default max_x=%d max_y=%d\n",
+				val[2], ts->prop.max_x, ts->prop.max_y, ts->data->max_x, ts->data->max_y);
+
+	if (val[0] != 0xff && retry < 5) {
+		dev_err(ts->dev, "FW info is broken! fw_ver=0x%02X, ~fw_ver=0x%02X\n", val[1], val[2]);
+		retry++;
+		goto check_fw;
+	}
+
+	dev_info(ts->dev, "Touch IC fw loaded ok");
+
+	ts->status |= NT36XXX_STATUS_DOWNLOAD_COMPLETE;
+
+	return 0;
+}
+
+static void nt36xxx_download_firmware(struct work_struct *work) {
+	struct nt36xxx_ts *ts = container_of(work, struct nt36xxx_ts, work.work);
+	int ret;
+
+	cancel_delayed_work(&ts->work);
+
+	mutex_lock(&ts->lock);
+	_nt36xxx_boot_prepare_firmware(ts);
+	mutex_unlock(&ts->lock);
+
+	if (!(ts->status & NT36XXX_STATUS_PREPARE_FIRMWARE))
+		goto exit;
+
+	/* so the pm resume might have code to enable regulators. */
+	ret = pm_runtime_resume_and_get(ts->dev);
+	if (ret) {
+		dev_err(ts->dev, "%s resume fail 0x%x", __func__, ret);
+		goto exit;
+	}
+
+	disable_irq_nosync(ts->irq);
+
+	mutex_lock(&ts->lock);
+
+	ret = nt36xxx_eng_reset_idle(ts);
+	if (ret) {
+		dev_err(ts->dev, "Failed to check chip version\n");
+		goto unlock;
+	}
+
+	/* Set memory maps for the specific chip version */
+	ret = nt36xxx_chip_version_init(ts);
+	if (ret) {
+		dev_err(ts->dev, "Failed to check chip version\n");
+		goto unlock;
+	}
+
+	dev_dbg(ts->dev, "ts->status=0x%x", ts->status);
+
+	_nt36xxx_boot_download_firmware(ts);
+unlock:
+	mutex_unlock(&ts->lock);
+	enable_irq(ts->irq);
+
+	pm_runtime_put(ts->dev);
+exit:
+	if (!(ts->status & NT36XXX_STATUS_DOWNLOAD_COMPLETE)) {
+		schedule_delayed_work(&ts->work, 4000);
+	}
+}
+
+static void nt36xxx_release_memory(void *data)
+{
+	struct nt36xxx_ts *ts = data;
+	kfree(ts->bin_map);
+	kfree(ts->fw_entry.data);
+}
+
+static void nt36xxx_disable_regulators(void *data)
+{
+	struct nt36xxx_ts *ts = data;
+
+	regulator_bulk_disable(NT36XXX_NUM_SUPPLIES, ts->supplies);
+}
+
+static int nt36xxx_input_dev_config(struct nt36xxx_ts *ts, const struct input_id *id)
+{
+	struct device *dev = ts->dev;
+	int ret;
+
+        ts->input = devm_input_allocate_device(dev);
+        if (!ts->input)
+                return -ENOMEM;
+
+	input_set_drvdata(ts->input, ts);
+
+	ts->input->phys = devm_kasprintf(dev, GFP_KERNEL,
+				     "%s/input0", dev_name(dev));
+	if (!ts->input->phys)
+		return -ENOMEM;
+
+	ts->input->name = "nt36xxx_spi_0";
+	ts->input->dev.parent = dev;
+	ts->input->id = *id;
+
+	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0,
+						 TOUCH_MAX_PRESSURE, 0, 0);
+	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
+	input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0,
+						 ts->data->abs_x_max - 1, 0, 0);
+	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0,
+						 ts->data->abs_y_max - 1, 0, 0);
+
+	touchscreen_parse_properties(ts->input, true, &ts->prop);
+
+	WARN_ON(ts->prop.max_x < 1);
+
+	ret = input_mt_init_slots(ts->input, TOUCH_MAX_FINGER_NUM,
+				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (ret) {
+		dev_err(dev, "Cannot init MT slots (%d)\n", ret);
+		return ret;
+	}
+
+	ret = input_register_device(ts->input);
+	if (ret) {
+		dev_err(dev, "Failed to register input device: %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int nt36xxx_of_compatible(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+
+	if (!of_device_is_compatible(np, "novatek,NVT-default-spi")) {
+		const char *path = "/chosen";
+		struct device_node *dt_node;
+		const char *bootargs;
+
+		dt_node = of_find_node_by_path(path);
+		if (!dt_node) {
+			dev_err(dev, "Failed to find device-tree node: %s\n", path);
+			return -ENODEV;
+		}
+
+		if (!of_property_read_string(dt_node, "bootargs", &bootargs))
+			if (!strstr(bootargs, "tianma") && !strstr(bootargs, "nt36"))
+				return -ENODEV;
+
+		dev_info(dev, "Try to probe novatek/tianma panel as specified in chosen/bootargs.");
+	}
+	return 0;
+}
+
+int nt36xxx_probe(struct device *dev, int irq, const struct input_id *id,
+			struct regmap *regmap)
+{
+	const struct nt36xxx_chip_data *chip_data;
+	const char *signed_fwname = NULL;
+	int ret;
+
+	struct nt36xxx_ts *ts = devm_kzalloc(dev, sizeof(struct nt36xxx_ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, ts);
+
+	chip_data = of_device_get_match_data(dev);
+	if(!chip_data)
+		return -EINVAL;
+
+	ts->dev = dev;
+	ts->regmap = regmap;
+	ts->irq = irq;
+
+	ts->data = chip_data;
+	memcpy(ts->mmap_data, chip_data->mmap, sizeof(ts->mmap_data));
+	ts->mmap = ts->mmap_data;
+
+	ts->supplies = devm_kcalloc(dev, NT36XXX_NUM_SUPPLIES,
+				    sizeof(*ts->supplies), GFP_KERNEL);
+	if (!ts->supplies)
+		return -ENOMEM;
+
+	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ts->reset_gpio))
+		return PTR_ERR(ts->reset_gpio);
+
+	gpiod_set_consumer_name(ts->reset_gpio, "nt36xxx_reset");
+
+	ts->irq_gpio = devm_gpiod_get_optional(dev, "irq", GPIOD_IN);
+	if (IS_ERR(ts->irq_gpio))
+		return PTR_ERR(ts->irq_gpio);
+
+	if (irq <= 0) {
+		ts->irq = gpiod_to_irq(ts->irq_gpio);
+		if (ts->irq <=0) {
+			dev_err(dev, "either need irq or irq-gpio specified in devicetree node!\n");
+			return -EINVAL;
+		}
+
+		dev_info(ts->dev, "irq %d", ts->irq);
+	}
+
+	gpiod_set_consumer_name(ts->irq_gpio, "nt36xxx_irq");
+
+	if (drm_is_panel_follower(dev))
+		goto skip_regulators;
+
+	/* These supplies are optional, also shared with LCD panel */
+	ts->supplies[0].supply = "vdd";
+	ts->supplies[1].supply = "vio";
+	ts->supplies[2].supply = "vio2";
+	ts->supplies[3].supply = "vio3";
+	ret = devm_regulator_bulk_get(dev,
+				      NT36XXX_NUM_SUPPLIES,
+				      ts->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Cannot get supplies: %d\n", ret);
+
+	ret = regulator_bulk_enable(NT36XXX_NUM_SUPPLIES, ts->supplies);
+	if (ret)
+		return ret;
+
+	usleep_range(10000, 11000);
+
+	ret = devm_add_action_or_reset(dev, nt36xxx_disable_regulators, ts);
+	if (ret)
+		return ret;
+
+skip_regulators:
+	mutex_init(&ts->lock);
+
+	ret = nt36xxx_eng_reset_idle(ts);
+        if (ret) {
+                dev_err(dev, "Failed to check chip version\n");
+                return ret;
+        }
+
+	/* Set memory maps for the specific chip version */
+	ret = nt36xxx_chip_version_init(ts);
+	if (ret) {
+		dev_err(dev, "Failed to check chip version\n");
+		return ret;
+	}
+
+	ret = nt36xxx_of_compatible(dev);
+	if (ret) {
+		return ret;
+	}
+
+	/* copy the const mmap into drvdata */
+	memcpy(ts->mmap_data, ts->data->mmap, sizeof(ts->mmap_data));
+	ts->mmap = ts->mmap_data;
+
+	ret = nt36xxx_input_dev_config(ts, ts->data->id);
+	if (ret) {
+		dev_err(dev, "failed set input device: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_request_threaded_irq(dev, ts->irq, NULL, nt36xxx_irq_handler,
+			IRQ_TYPE_EDGE_RISING | IRQF_ONESHOT, dev_name(dev), ts);
+	if (ret) {
+		dev_err(dev, "request irq failed: %d\n", ret);
+		return ret;
+	}
+
+	/* init with default name */
+	ts->fw_name = ts->data->fw_name;
+	/* support overriding fw name */
+	of_property_read_string_index(ts->dev->of_node, "firmware-name", 0, &signed_fwname);
+	if (signed_fwname)
+		ts->fw_name = signed_fwname;
+
+	if (drm_is_panel_follower(dev)) {
+		ts->panel_follower.funcs = &nt36xxx_panel_follower_funcs;
+		devm_drm_panel_add_follower(dev, &ts->panel_follower);
+	}
+
+	pm_runtime_enable(dev);
+
+	/* have to make sure this is first time schedule work, if devm_drm_panel_add_follower
+	 * called into internal resume with schedule_delay_work, then block it over there */
+	if (ts->fw_name) {
+		ts->status |= NT36XXX_STATUS_NEED_FIRMWARE;
+
+		/* make the driver sleep while waiting tasklet fw download */
+		pm_runtime_suspend(dev);
+
+		devm_delayed_work_autocancel(dev, &ts->work, nt36xxx_download_firmware);
+		schedule_delayed_work(&ts->work, 0);
+	}
+
+	dev_info(dev, "probe ok!");
+	return 0;
+}
+
+EXPORT_SYMBOL_GPL(nt36xxx_probe);
+
+static int __maybe_unused nt36xxx_internal_pm_suspend(struct device *dev)
+{
+	struct nt36xxx_ts *ts = dev_get_drvdata(dev);
+	int ret = 0;
+
+	mutex_lock(&ts->lock);
+	ts->status |= NT36XXX_STATUS_SUSPEND;
+	mutex_unlock(&ts->lock);
+
+	cancel_delayed_work_sync(&ts->work);
+
+	/* adding the mutex is to protect concurrent with download_task */
+	mutex_lock(&ts->lock);
+	if (ts->mmap[MMAP_EVENT_BUF_ADDR]) {
+		ret = regmap_write(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR], NT36XXX_CMD_ENTER_SLEEP);
+	}
+
+	if (ret)
+		dev_err(ts->dev, "Cannot enter suspend!\n");
+	mutex_unlock(&ts->lock);
+
+	return 0;
+}
+
+static int __maybe_unused nt36xxx_pm_suspend(struct device *dev)
+{
+	struct nt36xxx_ts *ts = dev_get_drvdata(dev);
+	int ret=0;
+
+	if (drm_is_panel_follower(dev))
+		return 0;
+
+	disable_irq_nosync(ts->irq);
+
+	regulator_bulk_disable(NT36XXX_NUM_SUPPLIES, ts->supplies);
+
+	ret = nt36xxx_internal_pm_suspend(dev);
+	return ret;
+}
+
+static int __maybe_unused nt36xxx_internal_pm_resume(struct device *dev)
+{
+	struct nt36xxx_ts *ts = dev_get_drvdata(dev);
+
+	mutex_lock(&ts->lock);
+	if(ts->status & (NT36XXX_STATUS_SUSPEND | NT36XXX_STATUS_DOWNLOAD_COMPLETE))
+                ts->status &= ~(NT36XXX_STATUS_SUSPEND | NT36XXX_STATUS_DOWNLOAD_COMPLETE);
+	mutex_unlock(&ts->lock);
+
+	if (ts->status & NT36XXX_STATUS_NEED_FIRMWARE)
+                schedule_delayed_work(&ts->work, 0);
+
+	return 0;
+}
+
+static int __maybe_unused nt36xxx_pm_resume(struct device *dev)
+{
+	struct nt36xxx_ts *ts = dev_get_drvdata(dev);
+	int ret=0;
+
+        if (drm_is_panel_follower(dev))
+                return 0;
+
+	enable_irq(ts->irq);
+
+	ret = regulator_bulk_enable(NT36XXX_NUM_SUPPLIES, ts->supplies);
+
+	ret = nt36xxx_internal_pm_resume(dev);
+	return ret;
+}
+
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(nt36xxx_pm_ops,
+			     nt36xxx_pm_suspend,
+			     nt36xxx_pm_resume);
+
+static int panel_prepared(struct drm_panel_follower *follower)
+{
+	struct nt36xxx_ts *ts = container_of(follower, struct nt36xxx_ts, panel_follower);
+
+	if (ts->status & NT36XXX_STATUS_SUSPEND)
+		enable_irq(ts->irq);
+
+	/* supposed to clear the flag here, but leave to internal_pm_resume
+	 * for greater purpose, then clear flag as:
+	 * ts->status &= ~NT36XXX_STATUS_SUSPEND;
+	 */
+	return nt36xxx_internal_pm_resume(ts->dev);
+}
+
+static int panel_unpreparing(struct drm_panel_follower *follower)
+{
+	struct nt36xxx_ts *ts = container_of(follower, struct nt36xxx_ts, panel_follower);
+
+	mutex_lock(&ts->lock);
+	ts->status |= NT36XXX_STATUS_SUSPEND;
+	mutex_unlock(&ts->lock);
+
+	disable_irq_nosync(ts->irq);
+
+	return nt36xxx_internal_pm_suspend(ts->dev);
+}
+
+static struct drm_panel_follower_funcs nt36xxx_panel_follower_funcs = {
+	.panel_prepared = panel_prepared,
+	.panel_unpreparing = panel_unpreparing,
+};
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("NT36XXX Touchscreen driver");
+MODULE_AUTHOR("AngeloGioacchino Del Regno <kholk11@gmail.com>");
+MODULE_AUTHOR("George Chan <gchan9527@gmail.com>");
diff --git a/drivers/input/touchscreen/nt36xxx_spi.c b/drivers/input/touchscreen/nt36xxx_spi.c
new file mode 100644
index 0000000000..21d2a4c79c
--- /dev/null
+++ b/drivers/input/touchscreen/nt36xxx_spi.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * NT36XXX SPI Touchscreen Driver
+ *
+ * Copyright (C) 2020 - 2021 Goodix, Inc.
+ * Copyright (C) 2023 Linaro Ltd.
+ * Copyright (C) 2023-2024 George Chan <gchan9527@gmail.com>
+ *
+ * Based on goodix_ts_berlin driver.
+ */
+#include <linux/input.h>
+#include <linux/input/touchscreen.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+#include <linux/unaligned.h>
+
+#include "nt36xxx.h"
+
+#define SPI_READ_PREFIX_LEN	1
+#define SPI_WRITE_PREFIX_LEN	1
+
+#define DEBUG 0
+
+/*
+ * there are two kinds of spi read/write:
+ * 	(a)spi_read()/spi_write()/spi_write_then_read(),
+ * 	(b)and the spi_sync itself.
+ *
+ * we have to choose one and stick together, cross-use otherwise caused problem.
+ * the addressing mode is | 0xff 0xXX 0xYY | 0xZ1 ... data1...| 0xZ2 ...data2... | ...
+ * 	0xXX is bit[23..16]
+ * 	0xYY is bit[15..7]
+ * above describe a 'page select' ops
+ * 	0xZ1 is bit[7..0], addr for read ops
+ *	0xZ2 is bit[7..0] | 0x80, addr for write ops
+ * there is no restriction on the read write order.
+*/
+static int nt36xxx_spi_write(void *dev, const void *data,
+                                   size_t len)
+{
+	struct spi_device *spi = to_spi_device((struct device *)dev);
+	int32_t ret;
+
+	void *data1 = kmemdup(data, len, GFP_KERNEL|GFP_DMA);
+	if (!data1)
+		return -ENOMEM;
+
+	u8 addr[4] = { 0xff, *(u32 *)data >> 15, *(u32 *)data >> 7,  (*(u32 *)data & 0x7f) | 0x80};
+	memcpy(data1, addr, 4);
+
+	dev_dbg(dev, "%s len=0x%lx", __func__, len);
+
+	spi_write(spi, data1, 3);
+	ret = spi_write(spi, data1 + 3, len - 3);
+	if (ret)
+		dev_err(dev, "transfer err %d\n ", ret);
+	else if (DEBUG) {
+
+		print_hex_dump(KERN_INFO, __func__, DUMP_PREFIX_OFFSET,
+			16, 1, data, 3, true);
+
+		print_hex_dump(KERN_INFO, __func__, DUMP_PREFIX_OFFSET,
+			16, 1, data + 3, (len - 3) > 0x20 ? 0x20 : len - 3 , true);
+	}
+
+	kfree(data1);
+	return ret;
+}
+
+static int nt36xxx_spi_read(void *dev, const void *reg_buf,
+                                  size_t reg_size, void *val_buf,
+                                  size_t val_size)
+{
+	struct spi_device *spi = to_spi_device(dev);
+	int ret;
+	u8 addr[4] = { 0xff, *(u32 *)reg_buf >> 15, *(u32 *)reg_buf >> 7,  *(u32 *)reg_buf & 0x7f };
+
+	ret = spi_write(spi, addr, 3);
+	if (ret) {
+		dev_err(dev, "transfer0 err %s %d ret=%d", __func__, __LINE__, ret);
+		return ret;
+	}
+
+	ret = spi_write_then_read(spi, &addr[3] , 1, val_buf, val_size);
+	if (ret) {
+		dev_err(dev, "transfer1 err %s %d ret=%d", __func__, __LINE__, ret);
+		return ret;
+	}
+
+	if (DEBUG) {
+		print_hex_dump(KERN_INFO, __func__, DUMP_PREFIX_OFFSET,
+			16, 1, addr, 3, true);
+
+		print_hex_dump(KERN_INFO, __func__, DUMP_PREFIX_OFFSET,
+			16, 1, addr, (val_size) > 0x20 ? 0x20 : val_size % 0x20 , true);
+
+		print_hex_dump(KERN_INFO, __func__, DUMP_PREFIX_OFFSET,
+			16, 1, val_buf, (val_size > 0x20) ? 0x20 : val_size % 0x20 , true);
+	}
+
+	return ret;
+}
+
+const struct regmap_config nt36xxx_regmap_config_32bit = {
+	.name = "nt36xxx_hw",
+	.reg_bits = 32,
+	.val_bits = 8,
+	.read = nt36xxx_spi_read,
+	.write = nt36xxx_spi_write,
+
+	.max_raw_read = NT36XXX_TRANSFER_LEN + 8,
+	.max_raw_write = NT36XXX_TRANSFER_LEN + 8,
+
+	.zero_flag_mask = true, /* this is needed to make sure addr is not write_masked */
+	.cache_type = REGCACHE_NONE,
+};
+
+static const struct input_id nt36xxx_spi_input_id = {
+	.bustype = BUS_SPI,
+};
+
+static int nt36xxx_spi_probe(struct spi_device *spi)
+{
+	struct regmap_config *regmap_config;
+	struct regmap *regmap;
+	size_t max_size;
+	int ret = 0;
+
+	dev_dbg(&spi->dev, "%s %d", __func__, __LINE__);
+
+	regmap_config = devm_kmemdup(&spi->dev, &nt36xxx_regmap_config_32bit,
+				     sizeof(*regmap_config), GFP_KERNEL);
+	if (!regmap_config) {
+		dev_err(&spi->dev, "memdup regmap_config fail\n");
+		return -ENOMEM;
+	}
+
+	spi->mode = SPI_MODE_0;
+	spi->bits_per_word = 8;
+	ret = spi_setup(spi);
+	if (ret) {
+		dev_err(&spi->dev, "SPI setup error %d\n", ret);
+		return ret;
+	}
+
+	/* don't exceed max specified SPI CLK frequency */
+	if (spi->max_speed_hz > MAX_SPI_FREQ_HZ) {
+		dev_err(&spi->dev, "SPI CLK %d Hz?\n", spi->max_speed_hz);
+		return -EINVAL;
+	}
+
+	max_size = spi_max_transfer_size(spi);
+	regmap_config->max_raw_read = max_size - SPI_READ_PREFIX_LEN;
+	regmap_config->max_raw_write = max_size - SPI_WRITE_PREFIX_LEN;
+
+	regmap = devm_regmap_init(&spi->dev, NULL, spi, regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return nt36xxx_probe(&spi->dev, spi->irq,
+				   &nt36xxx_spi_input_id, regmap);
+}
+
+const struct nt36xxx_chip_data default_config = {
+	.config = &nt36xxx_regmap_config_32bit,
+	.mmap = nt36676f_memory_maps,
+	.max_x = 1080,
+	.max_y = 2400,
+	.abs_x_max = 1080,
+	.abs_y_max = 2400,
+	.id = &nt36xxx_spi_input_id,
+};
+
+const struct nt36xxx_chip_data miatoll_tianma_nt36675 = {
+	.config = &nt36xxx_regmap_config_32bit,
+	.mmap = nt36675_memory_maps,
+	.fw_name = "novatek_ts_tianma_fw.bin",
+	.max_x = 1080,
+	.max_y = 2400,
+	.abs_x_max = 1080,
+	.abs_y_max = 2400,
+	.id = &nt36xxx_spi_input_id,
+};
+
+const struct nt36xxx_chip_data generic_nt36676f = {
+	.config = &nt36xxx_regmap_config_32bit,
+	.mmap = nt36676f_memory_maps,
+	.max_x = 1080,
+	.max_y = 2400,
+	.abs_x_max = 1080,
+	.abs_y_max = 2400,
+	.id = &nt36xxx_spi_input_id,
+};
+
+const struct nt36xxx_chip_data generic_nt36772 = {
+	.config = &nt36xxx_regmap_config_32bit,
+	.mmap = nt36772_memory_maps,
+	.max_x = 1080,
+	.max_y = 2400,
+	.abs_x_max = 1080,
+	.abs_y_max = 2400,
+	.id = &nt36xxx_spi_input_id,
+};
+
+const struct nt36xxx_chip_data generic_nt36525 = {
+	.config = &nt36xxx_regmap_config_32bit,
+	.mmap = nt36525_memory_maps,
+	.max_x = 1080,
+	.max_y = 2400,
+	.abs_x_max = 1080,
+	.abs_y_max = 2400,
+	.id = &nt36xxx_spi_input_id,
+};
+
+static const struct spi_device_id nt36xxx_spi_ids[] = {
+	{ "nt36675-spi", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, nt36xxx_spi_ids);
+
+static const struct of_device_id nt36xxx_spi_of_match[] = {
+	{ .compatible = "novatek,nt36675-spi", .data = &miatoll_tianma_nt36675, },
+	{ .compatible = "novatek,nt36672a-spi", .data = &miatoll_tianma_nt36675, },
+	{ .compatible = "novatek,nt36676f-spi", .data = &generic_nt36676f, },
+	{ .compatible = "novatek,nt36772-spi", .data = &generic_nt36772, },
+	{ .compatible = "novatek,nt36525-spi", .data = &generic_nt36525, },
+	/*
+	 * this is served for two special purpose.
+	 * (1) detect/display model only, and bail out in the end
+	 * (2) checking device varients, mixed use of novatek and focaltech spi ic
+	 * TODO: might add auto select mmap for unknown nvt device.
+	 */
+	{ .compatible = "novatek,NVT-default-spi", .data = &default_config, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nt36xxx_spi_of_match);
+
+static struct spi_driver nt36xxx_spi_driver = {
+	.driver = {
+		.name   = "nt36675-spi",
+		.of_match_table = nt36xxx_spi_of_match,
+		.pm = pm_sleep_ptr(&nt36xxx_pm_ops),
+	},
+	.probe = nt36xxx_spi_probe,
+	.id_table = nt36xxx_spi_ids,
+};
+module_spi_driver(nt36xxx_spi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("NT36XXX SPI Touchscreen driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_AUTHOR("George Chan <gchan9527@gmail.com>");

-- 
2.43.0



