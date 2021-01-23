Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D07301587
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 14:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbhAWNua (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 08:50:30 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:59751 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbhAWNuO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 08:50:14 -0500
Received: from envy.fritz.box ([82.207.207.243]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MF3Y8-1lEHbk2QvI-00FTaQ; Sat, 23 Jan 2021 14:47:28 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, corbet@lwn.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 8/8] Refactored PCIe driver
Date:   Sat, 23 Jan 2021 14:47:16 +0100
Message-Id: <20210123134716.13414-9-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210123134716.13414-1-mail@richard-neumann.de>
References: <20210123134716.13414-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vbypNy0x5Z35+GOaa+VXg//2hulHaxtfOqHQ3wJqdlR8UeM7psN
 bfp1fInfZbg9QnQezv0nJsErxJsqAnREBf6YFdA8oQHgRBSsjmSyF3ZfxonFMAhM2WuowWT
 xo9q9YIdMmVvlwQ+o0+jdiRnf9uSLJg2IIgXvTnE2aCKqsUZHCqP12WfRZ8Chvs9NzTcK4S
 Gx1EBdARiU0Ljqj/6JPPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yag9zLqr5vU=:D4VJ6iZVzZuJq6P0Lgc+sv
 0Si23PiqqcrjXWTvZjfPE3sVRtY3FPZ/vUcTEis0DEqpRRc8iaOAK8iF6UYP9SCHw+H/vTHDM
 xfJ/IK6ekQ6WUWlk5u1rStITWSeauwU9bYClEoCvfarlYokYHYs3AZJ3zAochTAyW8ZZJc3bw
 uubBoyghGbPduZ60aMCiRneBWCIG7P4WrzLGPP/zFqgC1h7m86vvE7rP7sAQ4TcF0tbUMJDSv
 NKC8vER93Fe8eYcFnByW/m0xpajwc+KVucyMJ88TNdT0Y7cIiVZyO53jzFbYYvJnIFcwgGpRy
 FgQ9jkEzKFd1EKS5blL/K4L8N9LHWgYyzgNk/dPOSPJKpr6Dm2M7EJl6urz/pWF+aYPOqcbTP
 UIxHim+luJMbk9ZEWSaZOz9YMc/gHoUcsB3unkflzUk0jVt6k0wYF8QRCSVz04ZZnygBAc/jj
 0sHbczb/OQ==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Refactored the PCIe driver to compile to a separate module, which only
handles the actual PCI device.
The driver exposes functions to read the sensor mask and start and stop
the respective sensors.
It is used by the platform driver to retrieve the sensor mask, as well by
the HID low-level driver to start and stop the respective sensors.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 drivers/hid/amd-sfh-hid/amd-sfh-pci.c  | 226 +++++++++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd-sfh-pci.h  | 112 ++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 152 -----------------
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h |  79 ---------
 4 files changed, 338 insertions(+), 231 deletions(-)
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-pci.c
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-pci.h
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h

diff --git a/drivers/hid/amd-sfh-hid/amd-sfh-pci.c b/drivers/hid/amd-sfh-hid/amd-sfh-pci.c
new file mode 100644
index 000000000000..7c52719c05c2
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/amd-sfh-pci.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * AMD Sensor Fusion Hub (SFH) PCIe driver
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Nehal Bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>
+ *          Richard Neumann <mail@richard-neumann.de>
+ */
+
+#include <linux/bitops.h>
+#include <linux/dma-mapping.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#include "amd-sfh-pci.h"
+
+/**
+ * amd_sfh_get_sensor_mask - Returns the sensors mask.
+ * @pci_dev:	The Sensor Fusion Hub PCI device
+ *
+ * Returns an integer representing the bitmask to match
+ * the sensors connected to the Sensor Fusion Hub.
+ */
+uint amd_sfh_get_sensor_mask(struct pci_dev *pci_dev)
+{
+	uint sensor_mask;
+	struct amd_sfh_dev *privdata = pci_get_drvdata(pci_dev);
+
+	sensor_mask = readl(privdata->mmio + AMD_P2C_MSG3);
+	/* Correct bit shift in firmware register */
+	sensor_mask = sensor_mask >> 4;
+
+	if (!sensor_mask)
+		pci_err(pci_dev, "[Firmware Bug]: No sensors marked active!\n");
+
+	return sensor_mask;
+}
+EXPORT_SYMBOL_GPL(amd_sfh_get_sensor_mask);
+
+/**
+ * amd_sfh_start_sensor- Starts the respective sensor.
+ * @pci_dev:	Sensor Fusion Hub PCI device
+ * @sensor_idx:	Sensor index
+ * @dma_handle:	DMA handle
+ * @interval:	Sensor poll interval
+ */
+void amd_sfh_start_sensor(struct pci_dev *pci_dev, enum sensor_idx sensor_idx,
+			  dma_addr_t dma_handle, unsigned int interval)
+{
+	struct amd_sfh_dev *privdata;
+	union amd_sfh_parm parm;
+	union amd_sfh_cmd cmd;
+
+	privdata = pci_get_drvdata(pci_dev);
+
+	cmd.ul = 0;
+	cmd.s.cmd_id = AMD_SFH_CMD_ENABLE_SENSOR;
+	cmd.s.interval = interval;
+	cmd.s.sensor_id = sensor_idx;
+
+	parm.ul = 0;
+	parm.s.buffer_layout = 1;
+	parm.s.buffer_length = 16;
+
+	writeq(dma_handle, privdata->mmio + AMD_C2P_MSG2);
+	writel(parm.ul, privdata->mmio + AMD_C2P_MSG1);
+	writel(cmd.ul, privdata->mmio + AMD_C2P_MSG0);
+}
+EXPORT_SYMBOL_GPL(amd_sfh_start_sensor);
+
+/**
+ * amd_sfh_stop_sensor- Stops the respective sensor.
+ * @pci_dev:	Sensor Fusion Hub PCI device
+ * @sensor_idx:	Sensors index
+ */
+void amd_sfh_stop_sensor(struct pci_dev *pci_dev, enum sensor_idx sensor_idx)
+{
+	struct amd_sfh_dev *privdata;
+	union amd_sfh_parm parm;
+	union amd_sfh_cmd cmd;
+
+	privdata = pci_get_drvdata(pci_dev);
+
+	cmd.ul = 0;
+	cmd.s.cmd_id = AMD_SFH_CMD_DISABLE_SENSOR;
+	cmd.s.interval = 0;
+	cmd.s.sensor_id = sensor_idx;
+
+	parm.ul = 0;
+
+	writeq(0x0, privdata->mmio + AMD_C2P_MSG2);
+	writel(parm.ul, privdata->mmio + AMD_C2P_MSG1);
+	writel(cmd.ul, privdata->mmio + AMD_C2P_MSG0);
+}
+EXPORT_SYMBOL_GPL(amd_sfh_stop_sensor);
+
+/**
+ * amd_sfh_stop_all_sensors- Stops all sensors on the SFH.
+ * @pci_dev:	Sensor Fusion Hub PCI device
+ */
+static void amd_sfh_stop_all_sensors(struct pci_dev *pci_dev)
+{
+	struct amd_sfh_dev *privdata;
+	union amd_sfh_parm parm;
+	union amd_sfh_cmd cmd;
+
+	privdata = pci_get_drvdata(pci_dev);
+
+	cmd.ul = 0;
+	cmd.s.cmd_id = AMD_SFH_CMD_STOP_ALL_SENSORS;
+	cmd.s.interval = 0;
+	cmd.s.sensor_id = 0;
+
+	parm.ul = 0;
+
+	writel(parm.ul, privdata->mmio + AMD_C2P_MSG1);
+	writel(cmd.ul, privdata->mmio + AMD_C2P_MSG0);
+}
+
+/**
+ * amd_sfh_clear_registers - Clears the C2P and P2C registers.
+ * @privdata:	PCI driver data
+ */
+static void amd_sfh_clear_registers(struct amd_sfh_dev *privdata)
+{
+	unsigned int reg;
+
+	/* Clear C2P registers */
+	for (reg = AMD_C2P_MSG0; reg <= AMD_C2P_MSG9; reg += 4)
+		writel(0, privdata->mmio + reg);
+
+	/* Clear P2C registers */
+	for (reg = AMD_P2C_MSG0; reg <= AMD_P2C_MSG2; reg += 4)
+		writel(0, privdata->mmio + reg);
+}
+
+/**
+ * amd_sfh_pci_init - Initializes the PCI device.
+ * @privdata:	PCI driver data
+ * @pci_dev:	PCI device
+ *
+ * Enables the PCI device and performs I/O mapping.
+ * Returns 0 on success or nonzero on errors.
+ */
+static int amd_sfh_pci_init(struct amd_sfh_dev *privdata,
+			    struct pci_dev *pci_dev)
+{
+	int rc;
+
+	rc = pcim_enable_device(pci_dev);
+	if (rc)
+		return rc;
+
+	rc = pcim_iomap_regions(pci_dev, BIT(2), pci_name(pci_dev));
+	if (rc)
+		return rc;
+
+	privdata->pci_dev = pci_dev;
+	privdata->mmio = pcim_iomap_table(pci_dev)[2];
+	pci_set_master(pci_dev);
+
+	rc = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(64));
+	if (rc)
+		rc = pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32));
+	if (rc)
+		return rc;
+
+	pci_set_drvdata(pci_dev, privdata);
+	pci_info(pci_dev, "AMD SFH device initialized\n");
+
+	return 0;
+}
+
+/**
+ * amd_sfh_pci_probe - Probes the PCI device driver.
+ * @pci_dev:	The handled PCI device
+ * @id:		PCI device ID
+ *
+ * Returns 0 on success or nonzero on errors.
+ */
+static int amd_sfh_pci_probe(struct pci_dev *pci_dev,
+			     const struct pci_device_id *id)
+{
+	struct amd_sfh_dev *privdata;
+
+	privdata = devm_kzalloc(&pci_dev->dev, sizeof(*privdata), GFP_KERNEL);
+	if (!privdata)
+		return -ENOMEM;
+
+	return amd_sfh_pci_init(privdata, pci_dev);
+}
+
+/**
+ * amd_sfh_pci_remove - Unloads the PCI device driver.
+ * @pci_dev:	The PCI device
+ */
+static void amd_sfh_pci_remove(struct pci_dev *pci_dev)
+{
+	struct amd_sfh_dev *privdata = pci_get_drvdata(pci_dev);
+
+	amd_sfh_stop_all_sensors(privdata->pci_dev);
+	pci_clear_master(pci_dev);
+	amd_sfh_clear_registers(privdata);
+}
+
+static const struct pci_device_id amd_sfh_pci_tbl[] = {
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_SFH) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, amd_sfh_pci_tbl);
+
+static struct pci_driver amd_sfh_pci_driver = {
+	.name		= "amd-sfh-pci",
+	.id_table	= amd_sfh_pci_tbl,
+	.probe		= amd_sfh_pci_probe,
+	.remove		= amd_sfh_pci_remove,
+};
+module_pci_driver(amd_sfh_pci_driver);
+
+MODULE_DESCRIPTION("AMD(R) Sensor Fusion Hub PCI driver");
+MODULE_AUTHOR("Shyam Sundar S K <Shyam-sundar.S-k@amd.com>");
+MODULE_AUTHOR("Nehal Bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>");
+MODULE_AUTHOR("Richard Neumann <mail@richard-neumann.de>");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/hid/amd-sfh-hid/amd-sfh-pci.h b/drivers/hid/amd-sfh-hid/amd-sfh-pci.h
new file mode 100644
index 000000000000..56f849776def
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/amd-sfh-pci.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ *  AMD Sensor Fusion Hub PCIe driver interface
+ *
+ *  Authors: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
+ *           Richard Neumann <mail@richard-neumann.de>
+ */
+
+#ifndef AMD_SFH_PCI_H
+#define AMD_SFH_PCI_H
+
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#define PCI_DEVICE_ID_AMD_SFH	0x15E4
+
+/**
+ * Sensor Fusion Hub communication registers
+ */
+enum {
+	/* SFH C2P Message Registers */
+	AMD_C2P_MSG0 = 0x10500,		/* SFH command register */
+	AMD_C2P_MSG1 = 0x10504,		/* SFH parameter register */
+	AMD_C2P_MSG2 = 0x10508,		/* DRAM Address Lo / Data 0 */
+	AMD_C2P_MSG3 = 0x1050c,		/* DRAM Address HI / Data 1 */
+	AMD_C2P_MSG4 = 0x10510,		/* Data 2 */
+	AMD_C2P_MSG5 = 0x10514,		/* Data 3 */
+	AMD_C2P_MSG6 = 0x10518,		/* Data 4 */
+	AMD_C2P_MSG7 = 0x1051c,		/* Data 5 */
+	AMD_C2P_MSG8 = 0x10520,		/* Data 6 */
+	AMD_C2P_MSG9 = 0x10524,		/* Data 7 */
+
+	/* SFH P2C Message Registers */
+	AMD_P2C_MSG0 = 0x10680,		/* Do not use */
+	AMD_P2C_MSG1 = 0x10684,		/* I2C0 interrupt register */
+	AMD_P2C_MSG2 = 0x10688,		/* I2C1 interrupt register */
+	AMD_P2C_MSG3 = 0x1068C,		/* SFH sensor info */
+	AMD_P2C_MSG_INTEN = 0x10690,	/* SFH interrupt gen register */
+	AMD_P2C_MSG_INTSTS = 0x10694,	/* Interrupt status */
+};
+
+/**
+ * The sensor indices on the AMD SFH device
+ * @ACCEL_IDX:	Index of the accelerometer
+ * @GYRO_IDX:	Index of the gyroscope
+ * @MAG_IDX:	Index of the magnetometer
+ * @ALS_IDX:	Index of the ambient light sensor
+ */
+enum sensor_idx {
+	ACCEL_IDX = 0,
+	GYRO_IDX,
+	MAG_IDX,
+	ALS_IDX = 19,
+};
+
+/**
+ * SFH command IDs
+ */
+enum {
+	AMD_SFH_CMD_NOOP = 0,
+	AMD_SFH_CMD_ENABLE_SENSOR,
+	AMD_SFH_CMD_DISABLE_SENSOR,
+	AMD_SFH_CMD_DUMP_SENSOR_INFO,
+	AMD_SFH_CMD_NUMBER_OF_SENSORS_DISCOVERED,
+	AMD_SFH_CMD_WHOAMI_REGCHIPID,
+	AMD_SFH_CMD_SET_DCD_DATA,
+	AMD_SFH_CMD_GET_DCD_DATA,
+	AMD_SFH_CMD_STOP_ALL_SENSORS,
+	AMD_SFH_CMD_INVALID = 0xF,
+};
+
+/**
+ * SFH command registers
+ */
+union amd_sfh_cmd {
+	u32 ul;
+	struct {
+		u32 cmd_id : 8;
+		u32 sensor_id : 8;
+		u32 interval : 16;
+	} s;
+};
+
+/**
+ * SFH command parameters
+ */
+union amd_sfh_parm {
+	u32 ul;
+	struct {
+		u32 buffer_layout : 2;
+		u32 buffer_length : 6;
+		u32 rsvd : 24;
+	} s;
+};
+
+/**
+ * struct amd_sfh_dev - AMD SFH PCI device data
+ * @pci_dev:		Handled PCI device
+ * @mmio:		iommapped registers
+ */
+struct amd_sfh_dev {
+	struct pci_dev *pci_dev;
+	void __iomem *mmio;
+};
+
+/* SFH PCI driver interface functions */
+uint amd_sfh_get_sensor_mask(struct pci_dev *pci_dev);
+void amd_sfh_start_sensor(struct pci_dev *pci_dev, enum sensor_idx sensor_idx,
+			  dma_addr_t dma_handle, unsigned int interval);
+void amd_sfh_stop_sensor(struct pci_dev *pci_dev, enum sensor_idx sensor_idx);
+
+#endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
deleted file mode 100644
index dbac16641662..000000000000
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ /dev/null
@@ -1,152 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * AMD MP2 PCIe communication driver
- * Copyright 2020 Advanced Micro Devices, Inc.
- *
- * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
- *	    Sandeep Singh <Sandeep.singh@amd.com>
- */
-
-#include <linux/bitops.h>
-#include <linux/delay.h>
-#include <linux/dma-mapping.h>
-#include <linux/interrupt.h>
-#include <linux/io-64-nonatomic-lo-hi.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-
-#include "amd_sfh_pcie.h"
-
-#define DRIVER_NAME	"pcie_mp2_amd"
-#define DRIVER_DESC	"AMD(R) PCIe MP2 Communication Driver"
-
-#define ACEL_EN		BIT(0)
-#define GYRO_EN		BIT(1)
-#define MAGNO_EN		BIT(2)
-#define ALS_EN		BIT(19)
-
-void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
-{
-	union sfh_cmd_param cmd_param;
-	union sfh_cmd_base cmd_base;
-
-	/* fill up command register */
-	memset(&cmd_base, 0, sizeof(cmd_base));
-	cmd_base.s.cmd_id = ENABLE_SENSOR;
-	cmd_base.s.period = info.period;
-	cmd_base.s.sensor_id = info.sensor_idx;
-
-	/* fill up command param register */
-	memset(&cmd_param, 0, sizeof(cmd_param));
-	cmd_param.s.buf_layout = 1;
-	cmd_param.s.buf_length = 16;
-
-	writeq(info.dma_address, privdata->mmio + AMD_C2P_MSG2);
-	writel(cmd_param.ul, privdata->mmio + AMD_C2P_MSG1);
-	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
-}
-
-void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
-{
-	union sfh_cmd_base cmd_base;
-
-	/* fill up command register */
-	memset(&cmd_base, 0, sizeof(cmd_base));
-	cmd_base.s.cmd_id = DISABLE_SENSOR;
-	cmd_base.s.period = 0;
-	cmd_base.s.sensor_id = sensor_idx;
-
-	writeq(0x0, privdata->mmio + AMD_C2P_MSG2);
-	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
-}
-
-void amd_stop_all_sensors(struct amd_mp2_dev *privdata)
-{
-	union sfh_cmd_base cmd_base;
-
-	/* fill up command register */
-	memset(&cmd_base, 0, sizeof(cmd_base));
-	cmd_base.s.cmd_id = STOP_ALL_SENSORS;
-	cmd_base.s.period = 0;
-	cmd_base.s.sensor_id = 0;
-
-	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
-}
-
-int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
-{
-	int activestatus, num_of_sensors = 0;
-
-	privdata->activecontrolstatus = readl(privdata->mmio + AMD_P2C_MSG3);
-	activestatus = privdata->activecontrolstatus >> 4;
-	if (ACEL_EN  & activestatus)
-		sensor_id[num_of_sensors++] = accel_idx;
-
-	if (GYRO_EN & activestatus)
-		sensor_id[num_of_sensors++] = gyro_idx;
-
-	if (MAGNO_EN & activestatus)
-		sensor_id[num_of_sensors++] = mag_idx;
-
-	if (ALS_EN & activestatus)
-		sensor_id[num_of_sensors++] = als_idx;
-
-	return num_of_sensors;
-}
-
-static void amd_mp2_pci_remove(void *privdata)
-{
-	amd_sfh_hid_client_deinit(privdata);
-	amd_stop_all_sensors(privdata);
-}
-
-static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-{
-	struct amd_mp2_dev *privdata;
-	int rc;
-
-	privdata = devm_kzalloc(&pdev->dev, sizeof(*privdata), GFP_KERNEL);
-	if (!privdata)
-		return -ENOMEM;
-
-	privdata->pdev = pdev;
-	pci_set_drvdata(pdev, privdata);
-	rc = pcim_enable_device(pdev);
-	if (rc)
-		return rc;
-
-	rc = pcim_iomap_regions(pdev, BIT(2), DRIVER_NAME);
-	if (rc)
-		return rc;
-
-	privdata->mmio = pcim_iomap_table(pdev)[2];
-	pci_set_master(pdev);
-	rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
-	if (rc) {
-		rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
-		return rc;
-	}
-	rc = devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
-	if (rc)
-		return rc;
-
-	return amd_sfh_hid_client_init(privdata);
-}
-
-static const struct pci_device_id amd_mp2_pci_tbl[] = {
-	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_MP2) },
-	{ }
-};
-MODULE_DEVICE_TABLE(pci, amd_mp2_pci_tbl);
-
-static struct pci_driver amd_mp2_pci_driver = {
-	.name		= DRIVER_NAME,
-	.id_table	= amd_mp2_pci_tbl,
-	.probe		= amd_mp2_pci_probe,
-};
-module_pci_driver(amd_mp2_pci_driver);
-
-MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_AUTHOR("Shyam Sundar S K <Shyam-sundar.S-k@amd.com>");
-MODULE_AUTHOR("Sandeep Singh <Sandeep.singh@amd.com>");
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
deleted file mode 100644
index 8f8d19b2cfe5..000000000000
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ /dev/null
@@ -1,79 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * AMD MP2 PCIe communication driver
- * Copyright 2020 Advanced Micro Devices, Inc.
- * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
- *	    Sandeep Singh <Sandeep.singh@amd.com>
- */
-
-#ifndef PCIE_MP2_AMD_H
-#define PCIE_MP2_AMD_H
-
-#include <linux/pci.h>
-
-#define PCI_DEVICE_ID_AMD_MP2	0x15E4
-
-#define ENABLE_SENSOR		1
-#define DISABLE_SENSOR		2
-#define STOP_ALL_SENSORS	8
-
-/* MP2 C2P Message Registers */
-#define AMD_C2P_MSG0	0x10500
-#define AMD_C2P_MSG1	0x10504
-#define AMD_C2P_MSG2	0x10508
-
-/* MP2 P2C Message Registers */
-#define AMD_P2C_MSG3	0x1068C /* Supported Sensors info */
-
-/* SFH Command register */
-union sfh_cmd_base {
-	u32 ul;
-	struct {
-		u32 cmd_id : 8;
-		u32 sensor_id : 8;
-		u32 period : 16;
-	} s;
-};
-
-union sfh_cmd_param {
-	u32 ul;
-	struct {
-		u32 buf_layout : 2;
-		u32 buf_length : 6;
-		u32 rsvd : 24;
-	} s;
-};
-
-struct sfh_cmd_reg {
-	union sfh_cmd_base cmd_base;
-	union sfh_cmd_param cmd_param;
-	phys_addr_t phys_addr;
-};
-
-enum sensor_idx {
-	accel_idx = 0,
-	gyro_idx = 1,
-	mag_idx = 2,
-	als_idx = 19
-};
-
-struct amd_mp2_dev {
-	struct pci_dev *pdev;
-	struct amdtp_cl_data *cl_data;
-	void __iomem *mmio;
-	u32 activecontrolstatus;
-};
-
-struct amd_mp2_sensor_info {
-	u8 sensor_idx;
-	u32 period;
-	dma_addr_t dma_address;
-};
-
-void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
-void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx);
-void amd_stop_all_sensors(struct amd_mp2_dev *privdata);
-int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id);
-int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata);
-int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata);
-#endif
-- 
2.30.0

