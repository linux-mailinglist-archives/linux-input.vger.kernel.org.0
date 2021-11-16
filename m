Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA7945391B
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 19:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239285AbhKPSEU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 13:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239282AbhKPSET (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 13:04:19 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7758CC061570
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 10:01:22 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id c71-20020a1c9a4a000000b0032cdcc8cbafso94015wme.3
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 10:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=jFzG0eJu3aT7PewTMVfmRJdFjNkQxt7OhcHVrbwn18w=;
        b=uLsaaDTqF/+x+C4rNB12vmIjHcJ2cw8IX8s4F5bJoCDs07GO7AVt/Je8Pl7Lm8YXyC
         UlsHDBGBn5UccKzoOxwKiihcJH7d+eMRhz7KG3J82h3eAaMjJ8BQ//ByjfaYw55fGU65
         t+Y5BdpJ7ZNKc/0Rdwia9EWGOkxSuucQk9E/tf9gxwNGfIOrcNn6hKPDtBymVRzOU2xd
         JScl99yD4cMwH7eOXN/N1IEw4+vybQ8IiuXgPbD0hpxTGUBH9PdOTBYMg52WG+ecBrE1
         WFTEGjLdZg72iotbMeU+CIl0+BjGuWwKyzOKCG+1HTZehav4lC5E6Ps5X+KsogeuSMCX
         Lr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jFzG0eJu3aT7PewTMVfmRJdFjNkQxt7OhcHVrbwn18w=;
        b=SDJZ1tTalHKF64RcrQsOaAlqjMRVuZ+LeEfGlkRfXsf+3Mb0gsq8r3WU7HjyCzISFP
         8gqPq8BPiT5Gqj5BaaHRBhr/R16QmMAGjfogYPE0NVHgTPSCS+gTPR8L8oZhKxErx4QF
         bxZow5TKmPl8cEK/tX6qB6IYjibWMre6if9A1xgkUXHyorfWnmx6X8cUrTtfRscc5PDJ
         5nX42Gc547TUy0UIceUZqKUouyfiCcwhlZdbERYVge/KSXMM64siu4VKNpwL6Ix2YBXB
         lkcjXsSwjz3muHEvEZQQ9zZ//IR7oTfcIeN6ff3V9CXOvndNJKIJKoTYG5o+MAHPybYp
         7FwQ==
X-Gm-Message-State: AOAM532iW6ajbC9BDssHVBSAf0xuesaojU6pnKoowAsO1uBh4OkSsmVx
        y/4zBQLEa9Gz5BoMpuC65NG9wvsecLSor89K
X-Google-Smtp-Source: ABdhPJxiRAez3qK/hCKRJkyLW++ECrqUo4kovpw1OUtaM7nT08E9sfmSyigAReezSV3+G45kkUFqoA==
X-Received: by 2002:a05:600c:4e51:: with SMTP id e17mr10283527wmq.127.1637085680779;
        Tue, 16 Nov 2021 10:01:20 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id p2sm3444725wmq.23.2021.11.16.10.01.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 10:01:20 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] Input: synaptics-rmi4 - Add support for V6 firmware upgrade
Date:   Tue, 16 Nov 2021 19:12:28 +0100
Message-Id: <1637086348-3626-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The firmware upgrade for V6 bootloaders is slighlty different from V5.
This has been tested with synaptics S3408 for both firmware & config
upgrade.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/input/rmi4/Makefile    |   2 +-
 drivers/input/rmi4/rmi_f34.c   |  29 +++--
 drivers/input/rmi4/rmi_f34.h   |  12 +-
 drivers/input/rmi4/rmi_f34v6.c | 258 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 289 insertions(+), 12 deletions(-)
 create mode 100644 drivers/input/rmi4/rmi_f34v6.c

diff --git a/drivers/input/rmi4/Makefile b/drivers/input/rmi4/Makefile
index 02f14c8..a4ccb9f 100644
--- a/drivers/input/rmi4/Makefile
+++ b/drivers/input/rmi4/Makefile
@@ -9,7 +9,7 @@ rmi_core-$(CONFIG_RMI4_F03) += rmi_f03.o
 rmi_core-$(CONFIG_RMI4_F11) += rmi_f11.o
 rmi_core-$(CONFIG_RMI4_F12) += rmi_f12.o
 rmi_core-$(CONFIG_RMI4_F30) += rmi_f30.o
-rmi_core-$(CONFIG_RMI4_F34) += rmi_f34.o rmi_f34v7.o
+rmi_core-$(CONFIG_RMI4_F34) += rmi_f34.o rmi_f34v7.o rmi_f34v6.o
 rmi_core-$(CONFIG_RMI4_F3A) += rmi_f3a.o
 rmi_core-$(CONFIG_RMI4_F54) += rmi_f54.o
 rmi_core-$(CONFIG_RMI4_F55) += rmi_f55.o
diff --git a/drivers/input/rmi4/rmi_f34.c b/drivers/input/rmi4/rmi_f34.c
index e5dca98..0cd6348 100644
--- a/drivers/input/rmi4/rmi_f34.c
+++ b/drivers/input/rmi4/rmi_f34.c
@@ -49,6 +49,9 @@ static int rmi_f34_command(struct f34_data *f34, u8 command,
 	struct rmi_device *rmi_dev = fn->rmi_dev;
 	int ret;
 
+	if (f34->bl_version == 6)
+		return rmi_f34v6_command(f34, command, timeout);
+
 	if (write_bl_id) {
 		ret = rmi_f34_write_bootloader_id(f34);
 		if (ret)
@@ -112,6 +115,8 @@ static irqreturn_t rmi_f34_attention(int irq, void *ctx)
 
 		if (!ret && !(status & 0x7f))
 			complete(&f34->v5.cmd_done);
+	} else if (f34->bl_version == 6) {
+		rmi_f34v6_read_flash_status(f34, &status);
 	} else {
 		ret = rmi_read_block(f34->fn->rmi_dev,
 				     f34->fn->fd.data_base_addr +
@@ -132,11 +137,16 @@ static int rmi_f34_write_blocks(struct f34_data *f34, const void *data,
 {
 	struct rmi_function *fn = f34->fn;
 	struct rmi_device *rmi_dev = fn->rmi_dev;
-	u16 address = fn->fd.data_base_addr + F34_BLOCK_DATA_OFFSET;
 	u8 start_address[] = { 0, 0 };
+	u16 address;
 	int i;
 	int ret;
 
+	if (f34->bl_version == 6)
+		address = fn->fd.data_base_addr + F34_BLOCK_DATA_OFFSET_V6;
+	else
+		address = fn->fd.data_base_addr + F34_BLOCK_DATA_OFFSET;
+
 	ret = rmi_write_block(rmi_dev, fn->fd.data_base_addr,
 			      start_address, sizeof(start_address));
 	if (ret) {
@@ -320,7 +330,7 @@ static ssize_t rmi_driver_bootloader_id_show(struct device *dev,
 	if (fn) {
 		f34 = dev_get_drvdata(&fn->dev);
 
-		if (f34->bl_version == 5)
+		if (f34->bl_version == 5 || f34->bl_version == 6)
 			return scnprintf(buf, PAGE_SIZE, "%c%c\n",
 					 f34->bootloader_id[0],
 					 f34->bootloader_id[1]);
@@ -375,7 +385,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
 			dev_err(dev, "%s: LTS not supported\n", __func__);
 			return -ENODEV;
 		}
-	} else if (f34->bl_version != 5) {
+	} else if (f34->bl_version != 5 && f34->bl_version != 6) {
 		dev_warn(dev, "F34 V%d not supported!\n",
 			 data->f34_container->fd.function_version);
 		return -ENODEV;
@@ -384,7 +394,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
 	/* Enter flash mode */
 	if (f34->bl_version == 7)
 		ret = rmi_f34v7_start_reflash(f34, fw);
-	else
+	else /* v5 & v6 */
 		ret = rmi_f34_enable_flash(f34);
 	if (ret)
 		return ret;
@@ -415,7 +425,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
 	/* Perform firmware update */
 	if (f34->bl_version == 7)
 		ret = rmi_f34v7_do_reflash(f34, fw);
-	else
+	else /* v5 & v6 */
 		ret = rmi_f34_update_firmware(f34, fw);
 
 	if (ret) {
@@ -532,11 +542,12 @@ static int rmi_f34_probe(struct rmi_function *fn)
 	f34->fn = fn;
 	dev_set_drvdata(&fn->dev, f34);
 
-	/* v5 code only supported version 0, try V7 probe */
-	if (version > 0)
+	if (version == 1)
+		return rmi_f34v6_probe(f34);
+	else if (version > 1)
 		return rmi_f34v7_probe(f34);
-
-	f34->bl_version = 5;
+	else
+		f34->bl_version = 5;
 
 	ret = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr,
 			     f34_queries, sizeof(f34_queries));
diff --git a/drivers/input/rmi4/rmi_f34.h b/drivers/input/rmi4/rmi_f34.h
index 99faa8c..b7db71e 100644
--- a/drivers/input/rmi4/rmi_f34.h
+++ b/drivers/input/rmi4/rmi_f34.h
@@ -12,6 +12,7 @@
 
 /* F34 register offsets. */
 #define F34_BLOCK_DATA_OFFSET	2
+#define F34_BLOCK_DATA_OFFSET_V6 1
 
 /* F34 commands */
 #define F34_WRITE_FW_BLOCK	0x2
@@ -40,6 +41,9 @@
 #define V7_PAYLOAD_OFFSET		5
 #define V7_BOOTLOADER_ID_OFFSET		1
 
+/* F34 V6 defines */
+#define V6_BOOTLOADER_ID_OFFSET		0
+
 #define IMAGE_HEADER_VERSION_10		0x10
 
 #define CONFIG_ID_SIZE			32
@@ -248,7 +252,7 @@ struct rmi_f34_firmware {
 	u8 data[];
 };
 
-struct f34v5_data {
+struct f34v5v6_data {
 	u16 block_size;
 	u16 fw_blocks;
 	u16 config_blocks;
@@ -300,13 +304,17 @@ struct f34_data {
 	int update_size;
 
 	union {
-		struct f34v5_data v5;
+		struct f34v5v6_data v5;
+		struct f34v5v6_data v6;
 		struct f34v7_data v7;
 	};
 };
 
+int rmi_f34v6_command(struct f34_data *f34, u8 cmd, unsigned int timeout);
+int rmi_f34v6_read_flash_status(struct f34_data *f34, u8 *status);
 int rmi_f34v7_start_reflash(struct f34_data *f34, const struct firmware *fw);
 int rmi_f34v7_do_reflash(struct f34_data *f34, const struct firmware *fw);
 int rmi_f34v7_probe(struct f34_data *f34);
+int rmi_f34v6_probe(struct f34_data *f34);
 
 #endif /* _RMI_F34_H */
diff --git a/drivers/input/rmi4/rmi_f34v6.c b/drivers/input/rmi4/rmi_f34v6.c
new file mode 100644
index 0000000..0dee10c
--- /dev/null
+++ b/drivers/input/rmi4/rmi_f34v6.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Linaro Ltd <loic.poulain@linaro.org>
+ */
+#define DEBUG
+
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/rmi.h>
+#include <linux/firmware.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <asm/unaligned.h>
+
+#include "rmi_driver.h"
+#include "rmi_f34.h"
+
+#define F34_V6_DATA_FLASH_CMD_OFF 2
+#define F34_V6_DATA_FLASH_STS_OFF 3
+#define F34_V6_DATA_BLOCK_OFF     1
+
+#define F34_V6_DATA_FLASH_STS_MSK 0x3f
+#define F34_V6_DATA_PROGE_STS_MSK 0x80
+#define F34_V6_DATA_FLASH_CMD_MSK 0x3f
+
+struct f34v6_query_00 {
+	__u8 bootloader_id0;
+	__u8 bootloader_id1;
+	__u8 bootloader_minor;
+	__u8 bootloader_major;
+	__le32 firmware_id;
+} __packed;
+
+struct f34v6_query_02 {
+	__le16 block_size;
+} __packed;
+
+struct f34v6_query_03 {
+	__le16 fw_block_count;
+	__le16 ui_config_block_count;
+	__le16 perm_config_block_count;
+	__le16 bootloader_config_block_count;
+} __packed;
+
+struct f34v6_ctrl_00 {
+	__u8 config_id[4];
+} __packed;
+
+struct f34v6_data_02 {
+	__u8 flash_cmd;
+} __packed;
+
+struct f34v6_data_03 {
+	__u8 status;
+} __packed;
+
+static int rmi_f34v6_read_version(struct f34_data *f34)
+{
+	struct rmi_function *fn = f34->fn;
+	struct f34v6_query_00 query_00;
+	int ret;
+
+	ret = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr, &query_00,
+			     sizeof(query_00));
+	if (ret)
+		return ret;
+
+	f34->bootloader_id[0] = query_00.bootloader_id0;
+	f34->bootloader_id[1] = query_00.bootloader_id1;
+	f34->bl_version = 6;
+
+	return 0;
+}
+
+static int rmi_f34v6_read_block_info(struct f34_data *f34)
+{
+	struct rmi_function *fn = f34->fn;
+	struct f34v6_query_02 query_02;
+	struct f34v6_query_03 query_03;
+	int ret;
+
+	ret = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr + 2, &query_02,
+			     sizeof(query_02));
+	if (ret)
+		return ret;
+
+	f34->v6.block_size = get_unaligned_le16(&query_02.block_size);
+
+	ret = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr + 3, &query_03,
+			     sizeof(query_03));
+	if (ret)
+		return ret;
+
+	f34->v6.fw_blocks = get_unaligned_le16(&query_03.fw_block_count);
+	f34->v6.config_blocks = get_unaligned_le16(&query_03.ui_config_block_count);
+
+	return 0;
+}
+
+static int rmi_f34v6_read_config_id(struct f34_data *f34)
+{
+	struct rmi_function *fn = f34->fn;
+	struct f34v6_ctrl_00 ctrl_00;
+	int ret;
+
+	ret = rmi_read_block(fn->rmi_dev, fn->fd.control_base_addr,
+			     &ctrl_00, sizeof(ctrl_00));
+	if (ret) {
+		dev_err(&fn->dev, "Failed to read config ID\n");
+		return ret;
+	}
+
+	snprintf(f34->configuration_id, sizeof(f34->configuration_id),
+		 "%02x%02x%02x%02x", ctrl_00.config_id[0], ctrl_00.config_id[1],
+		 ctrl_00.config_id[2], ctrl_00.config_id[3]);
+
+	return 0;
+}
+
+int rmi_f34v6_read_flash_status(struct f34_data *f34, u8 *status)
+{
+	struct rmi_function *fn = f34->fn;
+	struct f34v6_data_03 data_03;
+	struct f34v6_data_02 data_02;
+	int ret;
+
+	/* Any command running ? */
+	ret = rmi_read_block(fn->rmi_dev,
+			     fn->fd.data_base_addr + F34_V6_DATA_FLASH_CMD_OFF,
+			     &data_02, sizeof(data_02));
+	if (ret) {
+		dev_err(&fn->dev, "Failed to read flash command\n");
+		return ret;
+	}
+
+	/* Retrieve command Status */
+	ret = rmi_read_block(fn->rmi_dev,
+			     fn->fd.data_base_addr + F34_V6_DATA_FLASH_STS_OFF,
+			     &data_03, sizeof(data_03));
+	if (ret) {
+		dev_err(&fn->dev, "Failed to read flash status\n");
+		return ret;
+	}
+
+	if (status)
+		*status = data_03.status & F34_V6_DATA_FLASH_STS_MSK;
+
+	if ((data_03.status & F34_V6_DATA_PROGE_STS_MSK) !=
+	    (f34->v6.status & F34_V6_DATA_PROGE_STS_MSK)) {
+		dev_info(&fn->dev, "Programming %s\n",
+			 data_03.status & F34_V6_DATA_PROGE_STS_MSK ? "enabled" : "disabled");
+	}
+
+	WRITE_ONCE(f34->v6.status, data_03.status);
+
+	if (!(data_02.flash_cmd & F34_V6_DATA_FLASH_CMD_MSK))
+		complete(&f34->v6.cmd_done);
+
+	return 0;
+}
+
+static int rmi_f34v6_write_command(struct f34_data *f34, u8 cmd)
+{
+	struct rmi_function *fn = f34->fn;
+	int ret;
+
+	if (cmd == F34_ENABLE_FLASH_PROG || cmd == F34_ERASE_ALL || cmd == F34_ERASE_CONFIG) {
+		fn->rmi_dev->driver->set_irq_bits(fn->rmi_dev, fn->irq_mask);
+
+		/* Special case requiring identification */
+		ret = rmi_write_block(fn->rmi_dev,
+				      fn->fd.data_base_addr + F34_V6_DATA_BLOCK_OFF,
+				      f34->bootloader_id, 2);
+		if (ret) {
+			dev_err(&fn->dev, "%s: bootloader-id write error %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+
+	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s: writing cmd %02X\n", __func__, cmd);
+
+	ret = rmi_write_block(fn->rmi_dev,
+			      fn->fd.data_base_addr + F34_V6_DATA_FLASH_CMD_OFF,
+			      &cmd, sizeof(cmd));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+int rmi_f34v6_command(struct f34_data *f34, u8 cmd, unsigned int timeout)
+{
+	struct rmi_function *fn = f34->fn;
+	int ret;
+
+	init_completion(&f34->v6.cmd_done);
+
+	ret = rmi_f34v6_write_command(f34, cmd);
+	if (ret)
+		dev_err(&fn->dev, "%s: cmd %#02x error %d\n", __func__, cmd, ret);
+
+	ret = wait_for_completion_timeout(&f34->v6.cmd_done, msecs_to_jiffies(timeout));
+	if (!ret) {
+		rmi_f34v6_read_flash_status(f34, NULL);
+
+		dev_err(&fn->dev, "%s: cmd %#02x timed out, status: %#02x\n",
+			__func__, cmd, READ_ONCE(f34->v6.status));
+
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+int rmi_f34v6_probe(struct f34_data *f34)
+{
+	struct device *dev = &f34->fn->dev;
+	int ret;
+
+	init_completion(&f34->v6.cmd_done);
+	mutex_init(&f34->v6.flash_mutex);
+
+	ret = rmi_f34v6_read_version(f34);
+	if (ret) {
+		dev_err(dev, "Failed to read version\n");
+		return ret;
+	}
+
+	ret = rmi_f34v6_read_block_info(f34);
+	if (ret) {
+		dev_err(dev, "Failed to block info\n");
+		return ret;
+	}
+
+	ret = rmi_f34v6_read_config_id(f34);
+	if (ret) {
+		dev_err(dev, "Failed to block info\n");
+		return ret;
+	}
+
+	ret = rmi_f34v6_read_flash_status(f34, NULL);
+	if (ret) {
+		dev_err(dev, "Failed to read status\n");
+		return ret;
+	}
+
+	rmi_dbg(RMI_DEBUG_FN, dev, "Bootloader ID: %s\n", f34->bootloader_id);
+	rmi_dbg(RMI_DEBUG_FN, dev, "Configuration ID: %s\n", f34->configuration_id);
+	rmi_dbg(RMI_DEBUG_FN, dev, "Block size: %d\n", f34->v6.block_size);
+	rmi_dbg(RMI_DEBUG_FN, dev, "FW blocks: %d\n", f34->v6.fw_blocks);
+	rmi_dbg(RMI_DEBUG_FN, dev, "CFG blocks: %d\n", f34->v6.config_blocks);
+	rmi_dbg(RMI_DEBUG_FN, dev, "Programming: %s\n",
+		f34->v6.status & F34_V6_DATA_PROGE_STS_MSK ? "enabled" : "disabled");
+
+	return 0;
+}
-- 
2.7.4

