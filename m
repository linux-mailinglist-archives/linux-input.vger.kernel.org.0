Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0C78798A09
	for <lists+linux-input@lfdr.de>; Fri,  8 Sep 2023 17:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244528AbjIHPc2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Sep 2023 11:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234734AbjIHPc1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Sep 2023 11:32:27 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2141FC6
        for <linux-input@vger.kernel.org>; Fri,  8 Sep 2023 08:32:15 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEA621BF20C;
        Fri,  8 Sep 2023 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1694187133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GSV3V+rXeW/uT5GmE6gL7uI0bHsapzZbj6YXpqQCAog=;
        b=TzYEUx+5Uo4CE2VgnaMuAiCXXWgotFo3sgD+IjMgMpPYTN4LCjlXIPTwnM0apqqj60Nxxw
        SRKt0d530JAINiZn5GXN0yYEhagFOwRyWqPi2a98Sd5vaoSK/shuD87X/uB1WsSLrWFlKr
        zc9OSKCsfIOzmGDyOeVaSdG7Ko57M5Q0qc1W6NoFw75DAp+AsoCzNCuLOY7q+gssyIWnzY
        pBUmZUcz9Bqr9gA+0mKwGXxZLbuLx/Q5ds8r1kD3vLnRbqBHEaybbZak3ongSIfm9cnEXa
        1JcEel+SFxdGl5xwpiipJC7ZWQoyzq0euFr75fqP29/ECMI6OLZKF70QVwnALw==
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     linux-input@vger.kernel.org
Cc:     mark.satterthwaite@touchnetix.com, pedro.torruella@touchnetix.com,
        bartp@baasheep.co.uk, hannah.rossiter@touchnetix.com,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        bsp-development.geo@leica-geosystems.com,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH] Input: add driver for TouchNetix aXiom touchscreen
Date:   Fri,  8 Sep 2023 17:32:03 +0200
Message-Id: <20230908153203.122062-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908153203.122062-1-kamel.bouhara@bootlin.com>
References: <20230908153203.122062-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a new driver for the TouchNetix's aXiom family of
multi-touch controller. This driver only support i2c
and can be later adapted for SPI and USB support.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/axiom_core.c        | 382 ++++++++++++++++++
 drivers/input/touchscreen/axiom_core.h        | 140 +++++++
 drivers/input/touchscreen/axiom_i2c.c         | 349 ++++++++++++++++
 7 files changed, 892 insertions(+)
 create mode 100644 drivers/input/touchscreen/axiom_core.c
 create mode 100644 drivers/input/touchscreen/axiom_core.h
 create mode 100644 drivers/input/touchscreen/axiom_i2c.c

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..b0a3ed451f15 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -175,6 +175,8 @@ patternProperties:
   "^awinic,.*":
     description: Shanghai Awinic Technology Co., Ltd.
   "^axentia,.*":
+    description: TouchNetix
+  "^axiom,.*":
     description: Axentia Technologies AB
   "^axis,.*":
     description: Axis Communications AB
diff --git a/MAINTAINERS b/MAINTAINERS
index 389fe9e38884..43add48257d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3373,6 +3373,13 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
 F:	drivers/hwmon/axi-fan-control.c
 
+AXIOM I2C TOUCHSCREEN DRIVER
+M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/input/touchscreen/axiom_core.c
+F:	drivers/input/touchscreen/axiom_i2.c
+
 AXXIA I2C CONTROLLER
 M:	Krzysztof Adamski <krzysztof.adamski@nokia.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index e3e2324547b9..08a770a0c5e5 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -150,6 +150,17 @@ config TOUCHSCREEN_AUO_PIXCIR
 	  To compile this driver as a module, choose M here: the
 	  module will be called auo-pixcir-ts.
 
+config TOUCHSCREEN_AXIOM_I2C
+	tristate "AXIOM based multi-touch panel controllers"
+	help
+	  Say Y here if you have a axiom touchscreen connected to
+	  your system.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called axiom_i2c.
+
 config TOUCHSCREEN_BU21013
 	tristate "BU21013 based touch panel controllers"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 62bd24f3ac8e..59a3234ddb09 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_TOUCHSCREEN_ADS7846)	+= ads7846.o
 obj-$(CONFIG_TOUCHSCREEN_AR1021_I2C)	+= ar1021_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_ATMEL_MXT)	+= atmel_mxt_ts.o
 obj-$(CONFIG_TOUCHSCREEN_AUO_PIXCIR)	+= auo-pixcir-ts.o
+obj-$(CONFIG_TOUCHSCREEN_AXIOM_I2C)	+= axiom_core.o axiom_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_BU21013)	+= bu21013_ts.o
 obj-$(CONFIG_TOUCHSCREEN_BU21029)	+= bu21029_ts.o
 obj-$(CONFIG_TOUCHSCREEN_CHIPONE_ICN8318)	+= chipone_icn8318.o
diff --git a/drivers/input/touchscreen/axiom_core.c b/drivers/input/touchscreen/axiom_core.c
new file mode 100644
index 000000000000..d381afd7fb84
--- /dev/null
+++ b/drivers/input/touchscreen/axiom_core.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TouchNetix aXiom Touchscreen Driver
+ *
+ * Copyright (C) 2020-2023 TouchNetix Ltd.
+ *
+ * Author(s): Mark Satterthwaite <mark.satterthwaite@touchnetix.com>
+ *            Pedro Torruella <pedro.torruella@touchnetix.com>
+ *            Bart Prescott <bartp@baasheep.co.uk>
+ *            Hannah Rossiter <hannah.rossiter@touchnetix.com>
+ *
+ */
+
+#include <linux/crc16.h>
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+
+#include "axiom_core.h"
+
+/**
+ * Decodes and populates the local u31 structure.
+ * Given a buffer of data read from page 0 of u31 in an aXiom device.
+ */
+void axiom_get_dev_info(struct axiom_data *ts, char *info)
+{
+	struct axiom_devinfo *devinfo = &ts->devinfo;
+
+	if (devinfo) {
+		devinfo->bootloader_mode = ((info[1] & 0x80) != 0) ? 1 : 0;
+		devinfo->device_id = ((info[1] & 0x7F) << 8) | info[0];
+		devinfo->fw_minor = info[2];
+		devinfo->fw_major = info[3];
+		devinfo->fw_info_extra = (info[4]) | (info[5] << 8);
+		devinfo->bootloader_fw_ver_minor = info[6];
+		devinfo->bootloader_fw_ver_major = info[7];
+		devinfo->jedec_id = (info[8]) | (info[9] << 8);
+		devinfo->num_usages = info[10];
+		devinfo->silicon_revision = info[11];
+	}
+}
+EXPORT_SYMBOL_GPL(axiom_get_dev_info);
+
+/**
+ * Decodes and populates the local Usage Table.
+ * Given a buffer of data read from page 1 onwards of u31 from an aXiom
+ * device.
+ */
+char axiom_populate_usage_table(struct axiom_data *ts, char *rx_data)
+{
+	u32 usage_id = 0;
+	char max_report_len = 0;
+	struct axiom_devinfo *device_info;
+	struct usage_entry *usage_table;
+
+	device_info = &ts->devinfo;
+	usage_table = ts->usage_table;
+
+	for (usage_id = 0; usage_id < device_info->num_usages; usage_id++) {
+		u16 offset = (usage_id * U31_BYTES_PER_USAGE);
+		char id = rx_data[offset + 0];
+		char start_page = rx_data[offset + 1];
+		char num_pages = rx_data[offset + 2];
+		char max_offset = ((rx_data[offset + 3] & 0x7F) + 1) * 2;
+
+		/* Store the entry into the usage table */
+		usage_table[usage_id].id = id;
+		usage_table[usage_id].is_report = ((num_pages == 0) ? 1 : 0);
+		usage_table[usage_id].start_page = start_page;
+		usage_table[usage_id].num_pages = num_pages;
+
+		dev_dbg(ts->pdev, "Usage %2u Info: %*ph\n", usage_id,
+			U31_BYTES_PER_USAGE, &rx_data[offset]);
+
+		/* Identify the max report length the module will receive */
+		if ((usage_table[usage_id].is_report)
+		    && (max_offset > max_report_len))
+			max_report_len = max_offset;
+	}
+	ts->usage_table_populated = true;
+
+	return max_report_len;
+}
+EXPORT_SYMBOL_GPL(axiom_populate_usage_table);
+
+/**
+ * Translate usage/page/offset triplet into physical address.
+ *
+ * @usage: groups of registers
+ * @page: page to which the usage belongs to offset
+ * @offset of the usage
+ */
+u16
+usage_to_target_address(struct axiom_data *ts, char usage, char page,
+			char offset)
+{
+	struct axiom_devinfo *device_info;
+	struct usage_entry *usage_table;
+	u16 target_address;
+	u32 i;
+
+	device_info = &ts->devinfo;
+	usage_table = ts->usage_table;
+
+	/* At the moment the convention is that u31 is always at physical address 0x0 */
+	if (!ts->usage_table_populated && (usage == DEVINFO_USAGE_ID)) {
+		target_address = ((page << 8) + offset);
+	} else if (ts->usage_table_populated) {
+		for (i = 0; i < device_info->num_usages; i++) {
+			if (usage_table[i].id == usage) {
+				if (page < usage_table[i].num_pages) {
+					target_address =
+					    ((usage_table[i].start_page + page) << 8) + offset;
+				} else {
+					target_address = 0xFFFF;
+					dev_err(ts->pdev,
+						"Invalid usage table! usage: %u, page: %u, offset: %u\n",
+						usage, page, offset);
+				}
+				break;
+			}
+		}
+	} else {
+		target_address = 0xFFFF;
+		dev_err(ts->pdev, "Unpopulated usage table for usage: %u\n",
+			usage);
+	}
+
+	dev_dbg(ts->pdev, "target_address is 0x%04x for usage: %u page %u\n",
+		target_address, usage, page);
+
+	return target_address;
+}
+EXPORT_SYMBOL_GPL(usage_to_target_address);
+
+void axiom_remove(struct axiom_data *ts)
+{
+	if (ts->usage_table)
+		ts->usage_table_populated = false;
+
+	if (ts->input_dev)
+		input_unregister_device(ts->input_dev);
+}
+EXPORT_SYMBOL_GPL(axiom_remove);
+
+/*
+ * Support function to axiom_process_u41_report.
+ * It generates input-subsystem events for every target.
+ * After calling this function the caller shall issue
+ * a Sync to the input sub-system.
+ */
+static bool
+axiom_process_u41_report_target(struct axiom_data *ts,
+				struct axiom_target_report *target)
+{
+	struct input_dev *input_dev = ts->input_dev;
+	enum axiom_target_state current_state;
+	struct u41_target *target_prev_state;
+	struct device *pdev = ts->pdev;
+	bool update = false;
+	int slot;
+
+	/* Verify the target index */
+	if (target->index >= U41_MAX_TARGETS) {
+		dev_dbg(pdev, "Invalid target index! %u\n", target->index);
+		return false;
+	}
+
+	target_prev_state = &ts->targets[target->index];
+
+	current_state =
+	    ((target->present == 0) ? TARGET_STATE_NOT_PRESENT : (target->z >=
+								  0) ?
+	     TARGET_STATE_TOUCHING : (target->z > PROX_LEVEL)
+	     && (target->z < 0) ? TARGET_STATE_HOVER : (target->z ==
+							PROX_LEVEL) ?
+	     TARGET_STATE_PROX : TARGET_STATE_NOT_PRESENT);
+	if ((target_prev_state->state == current_state)
+	    && (target_prev_state->x == target->x)
+	    && (target_prev_state->y == target->y)
+	    && (target_prev_state->z == target->z)) {
+		return false;
+	}
+
+	slot = target->index;
+
+	dev_dbg(pdev, "U41 Target T%u, slot:%u present:%u, x:%u, y:%u, z:%d\n",
+		target->index, slot, target->present,
+		target->x, target->y, target->z);
+
+	switch (current_state) {
+	default:
+	case TARGET_STATE_NOT_PRESENT:
+	case TARGET_STATE_PROX:
+		{
+			if (target_prev_state->insert) {
+				update = true;
+				target_prev_state->insert = false;
+				input_mt_slot(input_dev, slot);
+
+				if (slot == 0)
+					input_report_key(input_dev, BTN_LEFT,
+							 0);
+
+				input_mt_report_slot_inactive(input_dev);
+				/* make sure the previous coordinates are all off */
+				/* screen when the finger comes back */
+				target->x = target->y = 65535;
+				target->z = PROX_LEVEL;
+			}
+			break;
+		}
+	case TARGET_STATE_HOVER:
+	case TARGET_STATE_TOUCHING:
+		{
+			target_prev_state->insert = true;
+			update = true;
+			input_mt_slot(input_dev, slot);
+			input_report_abs(input_dev, ABS_MT_TRACKING_ID, slot);
+			input_report_abs(input_dev, ABS_MT_POSITION_X,
+					 target->x);
+			input_report_abs(input_dev, ABS_X, target->x);
+			input_report_abs(input_dev, ABS_MT_POSITION_Y,
+					 target->y);
+			input_report_abs(input_dev, ABS_Y, target->y);
+
+			if (current_state == TARGET_STATE_TOUCHING) {
+				input_report_abs(input_dev, ABS_MT_DISTANCE, 0);
+				input_report_abs(input_dev, ABS_DISTANCE, 0);
+				input_report_abs(input_dev, ABS_MT_PRESSURE,
+						 target->z);
+				input_report_abs(input_dev, ABS_PRESSURE,
+						 target->z);
+			} else {
+				input_report_abs(input_dev, ABS_MT_DISTANCE,
+						 -target->z);
+				input_report_abs(input_dev, ABS_DISTANCE,
+						 -target->z);
+				input_report_abs(input_dev, ABS_MT_PRESSURE, 0);
+				input_report_abs(input_dev, ABS_PRESSURE, 0);
+			}
+
+			if (slot == 0)
+				input_report_key(input_dev, BTN_LEFT,
+						 (current_state ==
+						  TARGET_STATE_TOUCHING));
+
+			break;
+		}
+	}
+
+	target_prev_state->state = current_state;
+	target_prev_state->x = target->x;
+	target_prev_state->y = target->y;
+	target_prev_state->z = target->z;
+
+	if (update)
+		input_mt_sync_frame(input_dev);
+
+	return update;
+}
+
+/**
+ * Take a raw buffer with u41 report data and decode it.
+ * Also generate input events if needed.
+ * @rx_buf: ptr to a byte array [0]: Usage number [1]: Status LSB [2]: Status MSB
+ */
+void axiom_process_u41_report(struct axiom_data *ts, char *rx_buf)
+{
+	struct axiom_target_report target;
+	struct input_dev *input_dev = ts->input_dev;
+	bool update_done = false;
+	u16 target_status;
+	u32 i;
+
+	if (rx_buf[0] != 0x41) {
+		dev_err(ts->pdev,
+			"Data in buffer does not have expected u41 format.\n");
+		return;
+	}
+
+	target_status = ((rx_buf[1]) | (rx_buf[2] << 8));
+
+	for (i = 0; i < U41_MAX_TARGETS; i++) {
+		target.index = i;
+		target.present = ((target_status & (1 << i)) != 0) ? 1 : 0;
+		target.x = (rx_buf[(i * 4) + 3]) | (rx_buf[(i * 4) + 4] << 8);
+		target.y = (rx_buf[(i * 4) + 5]) | (rx_buf[(i * 4) + 6] << 8);
+		target.z = (s8) (rx_buf[i + 43]);
+		update_done |= axiom_process_u41_report_target(ts, &target);
+	}
+
+	if (update_done)
+		input_sync(input_dev);
+}
+EXPORT_SYMBOL_GPL(axiom_process_u41_report);
+
+void axiom_process_u46_report(struct axiom_data *ts, char *rx_buf)
+{
+	struct input_dev *input_dev = ts->input_dev;
+	u16 aux_value;
+	u32 event_value;
+	u32 i = 0;
+
+	for (i = 0; i < U46_AUX_CHANNELS; i++) {
+		aux_value =
+		    ((rx_buf[(i * 2) + 2] << 8) | (rx_buf[(i * 2) + 1])) &
+		    U46_AUX_MASK;
+		event_value = (i << 16) | (aux_value);
+		input_event(input_dev, EV_MSC, MSC_RAW, event_value);
+	}
+
+	input_mt_sync(input_dev);
+	input_sync(input_dev);
+}
+EXPORT_SYMBOL_GPL(axiom_process_u46_report);
+
+/**
+ * Support function to axiom_process_report.
+ * It validates the crc and multiplexes the axiom reports to the appropriate
+ * report handler
+ */
+void axiom_process_report(struct axiom_data *ts, char *report_data)
+{
+	struct device *pdev = ts->pdev;
+	char usage = report_data[1];
+	u16 crc_report;
+	u16 crc_calc;
+	char len;
+
+	if ((report_data[0] & COMMS_OVERFLOW_MSK) != 0)
+		ts->report_overflow_counter++;
+
+	len = (report_data[0] & COMMS_REPORT_LEN_MSK) << 1;
+	if (len == 0) {
+		dev_err(pdev, "Zero length report discarded.\n");
+		return;
+	}
+
+	dev_dbg(pdev, "Payload Data %*ph\n", len, report_data);
+
+	/* Validate the report CRC */
+	crc_report = (report_data[len - 1] << 8) | (report_data[len - 2]);
+	/* Length is in 16 bit words and remove the size of the CRC16 itself */
+	crc_calc = crc16(0, report_data, (len - 2));
+
+	if (crc_calc != crc_report) {
+		dev_err(pdev,
+			"CRC mismatch! Expected: %#x, Calculated CRC: %#x.\n",
+			crc_report, crc_calc);
+		return;
+	}
+
+	switch (usage) {
+	case USAGE_2DCTS_REPORT_ID:
+		axiom_process_u41_report(ts, &report_data[1]);
+		break;
+
+	case USAGE_2AUX_REPORT_ID:
+		/* This is an aux report (force) */
+		axiom_process_u46_report(ts, &report_data[1]);
+		break;
+
+	case USAGE_2HB_REPORT_ID:
+		/* This is a heartbeat report */
+		break;
+
+	default:
+		break;
+	}
+
+	ts->report_counter++;
+}
+EXPORT_SYMBOL_GPL(axiom_process_report);
+
+MODULE_AUTHOR("Kamel Bouhara <kamel.bouhara@bootlin.com>");
+MODULE_DESCRIPTION("aXiom touchscreen core logic");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("axiom");
diff --git a/drivers/input/touchscreen/axiom_core.h b/drivers/input/touchscreen/axiom_core.h
new file mode 100644
index 000000000000..f129d28671ff
--- /dev/null
+++ b/drivers/input/touchscreen/axiom_core.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TouchNetix aXiom Touchscreen Driver
+ *
+ * Copyright (C) 2020-2023 TouchNetix Ltd.
+ *
+ * Author(s): Mark Satterthwaite <mark.satterthwaite@touchnetix.com>
+ *            Pedro Torruella <pedro.torruella@touchnetix.com>
+ *            Bart Prescott <bartp@baasheep.co.uk>
+ *            Hannah Rossiter <hannah.rossiter@touchnetix.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ */
+
+#ifndef __AXIOM_CORE_H
+#define __AXIOM_CORE_H
+
+/* Enables the raw data for up to 4 force channels to be sent to the input subsystem */
+#define U46_ENABLE_RAW_FORCE_DATA
+
+/**
+ * u31 has 2 pages for usage table entries.
+ * (2 * AX_COMMS_PAGE_SIZE) / U31_BYTES_PER_USAGE = 85
+ */
+#define U31_MAX_USAGES		(85U)
+#define U41_MAX_TARGETS		(10U)
+#define U46_AUX_CHANNELS	(4U)
+#define U46_AUX_MASK		(0xFFFU)
+#define U31_BYTES_PER_USAGE	(6U)
+#define USAGE_2DCTS_REPORT_ID	(0x41U)
+#define USAGE_2AUX_REPORT_ID	(0x46U)
+#define USAGE_2HB_REPORT_ID	(0x01U)
+#define PROX_LEVEL		(-128)
+#define AX_U31_PAGE0_LENGTH	(0x0C)
+#define AX_COMMS_WRITE		(0x00U)
+#define AX_COMMS_READ		(0x80U)
+#define AX_COMMS_BYTES_MASK	(0xFFU)
+
+#define DEVINFO_USAGE_ID	0x31
+#define REPORT_USAGE_ID		0x34
+
+#define REBASELINE_CMD		0x03
+
+#define COMMS_MAX_USAGE_PAGES	(3)
+#define AX_COMMS_PAGE_SIZE	(256)
+
+#define COMMS_OVERFLOW_MSK	(0x80)
+#define COMMS_REPORT_LEN_MSK	(0x7F)
+
+#include <linux/input.h>
+
+struct axiom_devinfo {
+	char bootloader_fw_ver_major;
+	char bootloader_fw_ver_minor;
+	char bootloader_mode;
+	u16 device_id;
+	char fw_major;
+	char fw_minor;
+	u16 fw_info_extra;
+	u16 jedec_id;
+	char num_usages;
+	char silicon_revision;
+};
+
+/**
+ * Describes parameters of a specific usage, essenstially a single element of
+ * the "Usage Table"
+ */
+struct usage_entry {
+	char id;
+	char is_report;
+	char start_page;
+	char num_pages;
+};
+
+/**
+ * Holds state of a "Target", A.K.A. as a "touch", but called a target as it
+ * can be a detected "target" prior to touch, eg, hovering.
+ */
+enum axiom_target_state {
+	TARGET_STATE_NOT_PRESENT = 0,
+	TARGET_STATE_PROX = 1,
+	TARGET_STATE_HOVER = 2,
+	TARGET_STATE_TOUCHING = 3,
+	TARGET_STATE_MIN = TARGET_STATE_NOT_PRESENT,
+	TARGET_STATE_MAX = TARGET_STATE_TOUCHING,
+};
+
+struct u41_target {
+	enum axiom_target_state state;
+	u16 x;
+	u16 y;
+	s8 z;
+	bool insert;
+	bool touch;
+};
+
+struct axiom_target_report {
+	u8 index;
+	u8 present;
+	u16 x;
+	u16 y;
+	s8 z;
+};
+
+struct axiom_cmd_header {
+	u16 target_address;
+	u16 length:15;
+	u16 read:1;
+	char write_data[];
+};
+
+struct axiom_data {
+	struct axiom_devinfo devinfo;
+	struct device *pdev;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *irq_gpio;
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	char max_report_len;
+	u32 report_overflow_counter;
+	u32 report_counter;
+	char rx_buf[COMMS_MAX_USAGE_PAGES * AX_COMMS_PAGE_SIZE];
+	struct u41_target targets[U41_MAX_TARGETS];
+	struct usage_entry usage_table[U31_MAX_USAGES];
+	bool usage_table_populated;
+};
+
+extern u16 usage_to_target_address(struct axiom_data *ts, char usage,
+				   char page, char offset);
+extern void axiom_process_report(struct axiom_data *ts, char *report_data);
+extern char axiom_populate_usage_table(struct axiom_data *ts, char *rx_data);
+extern void axiom_remove(struct axiom_data *ts);
+extern void axiom_get_dev_info(struct axiom_data *ts, char *info);
+
+#endif				/* __AXIOM_CORE_H */
diff --git a/drivers/input/touchscreen/axiom_i2c.c b/drivers/input/touchscreen/axiom_i2c.c
new file mode 100644
index 000000000000..ddb898ad3744
--- /dev/null
+++ b/drivers/input/touchscreen/axiom_i2c.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TouchNetix aXiom Touchscreen Driver
+ *
+ * Copyright (C) 2020-2023 TouchNetix Ltd.
+ *
+ * Author(s): Bart Prescott <bartp@baasheep.co.uk>
+ *            Pedro Torruella <pedro.torruella@touchnetix.com>
+ *            Mark Satterthwaite <mark.satterthwaite@touchnetix.com>
+ *            Hannah Rossiter <hannah.rossiter@touchnetix.com>
+ *
+ */
+
+#include "axiom_core.h"
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/string.h>
+
+/**
+ * aXiom devices are typically configured to report
+ * touches at a rate of 100Hz (10ms). For systems
+ * that require polling for reports, 100ms seems like
+ * an acceptable polling rate.
+ * When reports are polled, it will be expected to
+ * occasionally observe the overflow bit being set
+ * in the reports. This indicates that reports are not
+ * being read fast enough.
+ */
+#define POLL_INTERVAL_DEFAULT_MS 100
+
+static int
+axiom_i2c_read(struct i2c_client *client, u8 usage, u8 page, u8 *buf, u16 len)
+{
+	struct axiom_cmd_header cmd_header;
+	struct axiom_data *ts = i2c_get_clientdata(client);
+	struct i2c_msg msg[2];
+	int ret;
+
+	/* Build the header */
+	cmd_header.target_address = usage_to_target_address(ts, usage, page, 0);
+	cmd_header.length = len;
+	cmd_header.read = 1;
+
+	msg[0].addr = client->addr;
+	msg[0].flags = 0;
+	msg[0].len = sizeof(cmd_header);
+	msg[0].buf = (u8 *)&cmd_header;
+
+	msg[1].addr = client->addr;
+	msg[1].flags = I2C_M_RD;
+	msg[1].len = len;
+	msg[1].buf = (char *)buf;
+
+	ret = i2c_transfer(client->adapter, msg, 2);
+	if (ret != ARRAY_SIZE(msg)) {
+		dev_err(&client->dev,
+			"Failed reading usage %#x page %#x, error=%d\n", usage,
+			page, ret);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int
+axiom_i2c_write(struct i2c_client *client, u8 usage, u8 page, u8 *buf, u16 len)
+{
+	struct axiom_cmd_header cmd_header;
+	struct axiom_data *ts = i2c_get_clientdata(client);
+	struct i2c_msg msg[2];
+	int ret;
+
+	cmd_header.target_address = usage_to_target_address(ts, usage, page, 0);
+	cmd_header.length = len;
+	cmd_header.read = 0;
+
+	msg[0].addr = client->addr;
+	msg[0].flags = 0;
+	msg[0].len = sizeof(cmd_header);
+	msg[0].buf = (u8 *)&cmd_header;
+
+	msg[1].addr = client->addr;
+	msg[1].flags = 0;
+	msg[1].len = len;
+	msg[1].buf = (char *)buf;
+
+	ret = i2c_transfer(client->adapter, msg, 2);
+	if (ret != 2) {
+		dev_err(&client->dev,
+			"Failed to write usage %#x page %#x, error=%d\n", usage,
+			page, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void axiom_i2c_poll(struct input_dev *input_dev)
+{
+	struct axiom_data *ts = input_get_drvdata(input_dev);
+	char *rx_data = ts->rx_buf;
+
+	axiom_i2c_read(ts->client, REPORT_USAGE_ID, 0, rx_data,
+		       ts->max_report_len);
+	axiom_process_report(ts, rx_data);
+}
+
+/**
+ * Retrieve, store and print the axiom device information
+ */
+int axiom_discover(struct axiom_data *ts)
+{
+	char *rx_data = &ts->rx_buf[0];
+	struct device *pdev = ts->pdev;
+	int ret;
+
+	/* First the first page of u31 to get the device information and */
+	/* the number of usages */
+	ret =
+	    axiom_i2c_read(ts->client, DEVINFO_USAGE_ID, 0, rx_data,
+			   AX_U31_PAGE0_LENGTH);
+	if (ret)
+		return ret;
+
+	axiom_get_dev_info(ts, rx_data);
+
+	dev_dbg(pdev, "Data Decode:\n");
+	dev_dbg(pdev, "  Bootloader Mode: %u\n", ts->devinfo.bootloader_mode);
+	dev_dbg(pdev, "  Device ID      : %04x\n", ts->devinfo.device_id);
+	dev_dbg(pdev, "  Firmware Rev   : %02x.%02x\n", ts->devinfo.fw_major,
+		ts->devinfo.fw_minor);
+	dev_dbg(pdev, "  Bootloader Rev : %02x.%02x\n",
+		ts->devinfo.bootloader_fw_ver_major,
+		ts->devinfo.bootloader_fw_ver_minor);
+	dev_dbg(pdev, "  FW Extra Info  : %04x\n", ts->devinfo.fw_info_extra);
+	dev_dbg(pdev, "  Silicon        : %02x\n", ts->devinfo.jedec_id);
+	dev_dbg(pdev, "  Num Usages     : %04x\n", ts->devinfo.num_usages);
+
+	/* Read the second page of u31 to get the usage table */
+	ret = axiom_i2c_read(ts->client, DEVINFO_USAGE_ID, 1, rx_data,
+			     (U31_BYTES_PER_USAGE * ts->devinfo.num_usages));
+	if (ret)
+		return ret;
+
+	ts->max_report_len = axiom_populate_usage_table(ts, rx_data);
+	dev_dbg(pdev, "Max Report Length: %u\n", ts->max_report_len);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(axiom_discover);
+
+/**
+ * Rebaseline the touchscreen, effectively zero-ing it
+ */
+void axiom_rebaseline(struct axiom_data *ts)
+{
+	struct device *pdev = ts->pdev;
+	char buffer[8] = { 0 };
+	int ret;
+
+	memset(buffer, 0, sizeof(buffer));
+
+	buffer[0] = REBASELINE_CMD;
+
+	ret = axiom_i2c_write(ts->client, 0x02, 0, buffer, sizeof(buffer));
+	if (ret)
+		dev_err(pdev, "Rebaseline failed\n");
+
+	dev_info(pdev, "Capture Baseline Requested\n");
+}
+EXPORT_SYMBOL_GPL(axiom_rebaseline);
+
+static irqreturn_t axiom_irq(int irq, void *handle)
+{
+	struct axiom_data *ts = handle;
+	u8 *rx_data = &ts->rx_buf[0];
+
+	axiom_i2c_read(ts->client, REPORT_USAGE_ID, 0, rx_data, ts->max_report_len);
+	axiom_process_report(ts, rx_data);
+
+	return IRQ_HANDLED;
+}
+
+static int axiom_i2c_probe(struct i2c_client *client)
+{
+	struct axiom_data *ts;
+	struct device *pdev = &client->dev;
+	struct input_dev *input_dev;
+	int error;
+	int target;
+
+	ts = devm_kzalloc(pdev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	ts->irq_gpio = devm_gpiod_get_optional(pdev, "irq", GPIOD_IN);
+	if (IS_ERR(ts->irq_gpio)) {
+		error = PTR_ERR(ts->irq_gpio);
+		dev_err(pdev, "failed to request irq GPIO: %d", error);
+		return error;
+	}
+
+	ts->reset_gpio = devm_gpiod_get_optional(pdev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ts->reset_gpio)) {
+		error = PTR_ERR(ts->reset_gpio);
+		dev_err(pdev, "failed to request reset GPIO: %d", error);
+		return error;
+	}
+
+	if (ts->irq_gpio) {
+		error =
+		    devm_request_threaded_irq(pdev, client->irq, NULL,
+					      axiom_irq,
+					      IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					      "axiom_irq", ts);
+		if (error != 0) {
+			dev_err(pdev, "Failed to request IRQ %u (error: %d)\n",
+				client->irq, error);
+			return error;
+		}
+	}
+
+	ts->client = client;
+	ts->pdev = pdev;
+	ts->usage_table_populated = false;
+
+	i2c_set_clientdata(client, ts);
+
+	axiom_discover(ts);
+	axiom_rebaseline(ts);
+
+	input_dev = devm_input_allocate_device(ts->pdev);
+	if (!input_dev) {
+		dev_err(pdev, "Failed to allocate input device\n");
+		return -ENOMEM;
+	}
+
+	input_dev->name = "TouchNetix aXiom Touchscreen";
+	input_dev->phys = "input/axiom_ts";
+
+	/* Single Touch */
+	input_set_abs_params(input_dev, ABS_X, 0, 65535, 0, 0);
+	input_set_abs_params(input_dev, ABS_Y, 0, 65535, 0, 0);
+
+	/* Multi Touch */
+	/* Min, Max, Fuzz (expected noise in px, try 4?) and Flat */
+	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 65535, 0, 0);
+	/* Min, Max, Fuzz (expected noise in px, try 4?) and Flat */
+	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, 65535, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_TOOL_TYPE, 0, MT_TOOL_MAX, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_DISTANCE, 0, 127, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 127, 0, 0);
+
+	/* Registers the axiom device as a touch screen instead of as a mouse pointer */
+	input_mt_init_slots(input_dev, U41_MAX_TARGETS, INPUT_MT_DIRECT);
+
+	input_set_capability(input_dev, EV_KEY, BTN_LEFT);
+
+	/* Enables the raw data for up to 4 force channels to be sent to the */
+	/* input subsystem */
+	set_bit(EV_REL, input_dev->evbit);
+	set_bit(EV_MSC, input_dev->evbit);
+	/* Declare that we support "RAW" Miscellaneous events */
+	set_bit(MSC_RAW, input_dev->mscbit);
+
+	if (!ts->irq_gpio) {
+		error = input_setup_polling(input_dev, axiom_i2c_poll);
+		if (error) {
+			dev_err(ts->pdev, "Unable to set up polling: %d\n",
+				error);
+			return error;
+		}
+		input_set_poll_interval(input_dev, POLL_INTERVAL_DEFAULT_MS);
+	}
+
+	error = input_register_device(input_dev);
+	if (error != 0) {
+		dev_err(ts->pdev,
+			"Could not register with Input Sub-system., error=%d\n",
+			error);
+		return error;
+	}
+
+	ts->input_dev = input_dev;
+	input_set_drvdata(ts->input_dev, ts);
+
+	dev_info(pdev, "AXIOM: I2C driver registered with Input Sub-System.\n");
+
+	/* Delay just a smidge before enabling the IRQ */
+	udelay(10);
+
+	/* Ensure that all reports are initialised to not be present. */
+	for (target = 0; target < U41_MAX_TARGETS; target++)
+		ts->targets[target].state = TARGET_STATE_NOT_PRESENT;
+
+	return 0;
+}
+
+static void axiom_i2c_remove(struct i2c_client *client)
+{
+	struct axiom_data *ts = i2c_get_clientdata(client);
+
+	axiom_remove(ts);
+}
+
+static const struct i2c_device_id axiom_i2c_id_table[] = {
+	{"ax54a"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(i2c, axiom_i2c_id_table);
+
+static const struct of_device_id axiom_i2c_dt_ids[] = {
+	{
+	 .compatible = "axiom,ax54a",
+	 .data = "axiom",
+	 },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, axiom_i2c_dt_ids);
+
+static struct i2c_driver axiom_i2c_driver = {
+	.driver = {
+		   .name = "axiom_i2c",
+		   .of_match_table = of_match_ptr(axiom_i2c_dt_ids),
+		   },
+	.id_table = axiom_i2c_id_table,
+	.probe = axiom_i2c_probe,
+	.remove = axiom_i2c_remove,
+};
+
+module_i2c_driver(axiom_i2c_driver);
+
+MODULE_AUTHOR("Kamel Bouhara <kamel.bouhara@bootlin.com>");
+MODULE_DESCRIPTION("aXiom touchscreen I2C bus driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("axiom");
-- 
2.25.1

