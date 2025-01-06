Return-Path: <linux-input+bounces-8924-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0976A01D79
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEB023A3FF2
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B35178362;
	Mon,  6 Jan 2025 02:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="En6bs66v"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53251196C7C;
	Mon,  6 Jan 2025 02:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130742; cv=none; b=KaAwGdufdMxQJqqWxqmbcBP8jfGvLS7bi8/GJgHP1acjcl+wWvYPoMaeS3WTvfPUPDgyj3dVnKi2vEOxR6AaOdXFvgzIKdCkAjoJtuLuwwnyO+w+vl7ZCFakxsWxMjtadU7HH9pCHlmiOCHUQUmd3qOMDDYrk4yxAGynkaVpd4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130742; c=relaxed/simple;
	bh=tLsUVpL0K4Q0TsCEeLX/SSO3z98fHqDyHiIzxjmue1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bp1ohnV4akWaNuvS6GcmyS66l/x0WaXlHJPE10ce/569gSAy38/aLB/n97OokD7TVXRigOcUW7TAdyanXTBixORNZggBKvLEgX/0ZFoSTAirxiyzXVwtNFAIidaXDRZtZhKEMfPd26dGA1wTA6cyLDBpd0hyw9PGA5y7/rUB3AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=En6bs66v; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130740; x=1767666740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tLsUVpL0K4Q0TsCEeLX/SSO3z98fHqDyHiIzxjmue1A=;
  b=En6bs66vOu4LgSmWCVRXsIXKO+2xY/QVeQ0qGzO93clHIlC5lLq1ymMN
   h+RwuuPVrzIy/CiodWzK9svmKYPOYOtqA4HsIrIYSyHTelrCwiBanETes
   TAAOQLEN3ULexPlXmP+Y+NVnBGHBHtqx34KxkzvukC/P3pzFRxoqX10oU
   9tNy5h0Tx/mWQLtyvbnVr5HKCZ8KGEZU3+E6lRc0prRg+ZJAqhvYS7ctF
   5E1y/z7FUm3Grta398tzswdP8ZXGphzC2S7uJ/6so6zeDvpkPag22MoyX
   G4elMv/BkvPFgRUbdjsCslzysFqoSXGWeBZYpKtLo6wqHG63toPU9fp34
   g==;
X-CSE-ConnectionGUID: EcxInw4+TGmWlHEd6BEioA==
X-CSE-MsgGUID: lJkOVbtYSgSr0FYcoWnJgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171443"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:32:19 -0800
X-CSE-ConnectionGUID: FIRzNg3WSSmi5abWKMkQNQ==
X-CSE-MsgGUID: AzNXuZnTRgqARQt5n5U9XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125595947"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:32:16 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org,
	mpearson-lenovo@squebb.ca
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 04/22] HID: intel-thc-hid: intel-thc: Add THC PIO operation APIs
Date: Mon,  6 Jan 2025 10:31:33 +0800
Message-Id: <20250106023151.3011329-5-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250106023151.3011329-1-even.xu@intel.com>
References: <20250106023151.3011329-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xinpeng Sun <xinpeng.sun@intel.com>

THC PIO (programmed I/O) operations are very similar with general
SPI/I2C read/write operation to access external slave device on the bus
through internal FIFO.

THC PIO operations are split into 4 steps:
1. prepare: configure hardware with correct opcode, slave address, and
            fill the PIO FIFO
2. start: set start bit to issue a bus send/receive
3. wait: wait for bus sending/receiving completion
4. complete: check send/receive data in FIFO and return

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 245 ++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  24 ++
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  23 ++
 3 files changed, 292 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index de7a0ed38c25..397250c38ae7 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1,9 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (c) 2024 Intel Corporation */
 
+#include <linux/bitfield.h>
 #include <linux/regmap.h>
 
 #include "intel-thc-dev.h"
+#include "intel-thc-hw.h"
 
 static int thc_regmap_read(void *context, unsigned int reg,
 			   unsigned int *val)
@@ -208,10 +210,253 @@ struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr)
 
 	thc_clear_state(thc_dev);
 
+	mutex_init(&thc_dev->thc_bus_lock);
+
 	return thc_dev;
 }
 EXPORT_SYMBOL_NS_GPL(thc_dev_init, "INTEL_THC");
 
+static int prepare_pio(const struct thc_device *dev, const u8 pio_op,
+		       const u32 address, const u32 size)
+{
+	u32 sts, ctrl, addr, mask;
+
+	regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, &sts);
+
+	/* Check if THC previous PIO still in progress */
+	if (sts & THC_M_PRT_SW_SEQ_STS_THC_SS_CIP) {
+		dev_err_once(dev->dev, "THC PIO is still busy!\n");
+		return -EBUSY;
+	}
+
+	/* Clear error bit and complete bit in state register */
+	sts |= THC_M_PRT_SW_SEQ_STS_THC_SS_ERR |
+	       THC_M_PRT_SW_SEQ_STS_TSSDONE;
+	regmap_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, sts);
+
+	/* Set PIO data size, opcode and interrupt capability */
+	ctrl = FIELD_PREP(THC_M_PRT_SW_SEQ_CNTRL_THC_SS_BC, size) |
+	       FIELD_PREP(THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CMD, pio_op);
+	if (dev->pio_int_supported)
+		ctrl |= THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CD_IE;
+
+	mask = THC_M_PRT_SW_SEQ_CNTRL_THC_SS_BC |
+	       THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CMD |
+	       THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CD_IE;
+	regmap_write_bits(dev->thc_regmap,
+			  THC_M_PRT_SW_SEQ_CNTRL_OFFSET, mask, ctrl);
+
+	/* Set PIO target address */
+	addr = FIELD_PREP(THC_M_PRT_SW_SEQ_DATA0_ADDR_THC_SW_SEQ_DATA0_ADDR, address);
+	mask = THC_M_PRT_SW_SEQ_DATA0_ADDR_THC_SW_SEQ_DATA0_ADDR;
+	regmap_write_bits(dev->thc_regmap,
+			  THC_M_PRT_SW_SEQ_DATA0_ADDR_OFFSET, mask, addr);
+	return 0;
+}
+
+static void pio_start(const struct thc_device *dev,
+		      u32 size_in_bytes, const u32 *buffer)
+{
+	if (size_in_bytes && buffer)
+		regmap_bulk_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_DATA1_OFFSET,
+				  buffer, size_in_bytes / sizeof(u32));
+
+	/* Enable Start bit */
+	regmap_write_bits(dev->thc_regmap,
+			  THC_M_PRT_SW_SEQ_CNTRL_OFFSET,
+			  THC_M_PRT_SW_SEQ_CNTRL_TSSGO,
+			  THC_M_PRT_SW_SEQ_CNTRL_TSSGO);
+}
+
+static int pio_complete(const struct thc_device *dev,
+			u32 *buffer, u32 *size)
+{
+	u32 sts, ctrl;
+
+	regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, &sts);
+	if (sts & THC_M_PRT_SW_SEQ_STS_THC_SS_ERR) {
+		dev_err_once(dev->dev, "PIO operation error\n");
+		return -EBUSY;
+	}
+
+	if (buffer && size) {
+		regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_CNTRL_OFFSET, &ctrl);
+		*size = FIELD_GET(THC_M_PRT_SW_SEQ_CNTRL_THC_SS_BC, ctrl);
+
+		regmap_bulk_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_DATA1_OFFSET,
+				 buffer, *size / sizeof(u32));
+	}
+
+	sts |= THC_M_PRT_SW_SEQ_STS_THC_SS_ERR | THC_M_PRT_SW_SEQ_STS_TSSDONE;
+	regmap_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, sts);
+	return 0;
+}
+
+static int pio_wait(const struct thc_device *dev)
+{
+	u32 sts = 0;
+	int ret;
+
+	ret = regmap_read_poll_timeout(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, sts,
+				       !(sts & THC_M_PRT_SW_SEQ_STS_THC_SS_CIP ||
+				       !(sts & THC_M_PRT_SW_SEQ_STS_TSSDONE)),
+				       THC_REGMAP_POLLING_INTERVAL_US, THC_PIO_DONE_TIMEOUT_US);
+	if (ret)
+		dev_err_once(dev->dev, "Timeout while polling PIO operation done\n");
+
+	return ret;
+}
+
+/**
+ * thc_tic_pio_read - Read data from touch device by PIO
+ *
+ * @dev: The pointer of THC private device context
+ * @address: Slave address for the PIO operation
+ * @size: Expected read data size
+ * @actual_size: The pointer of the actual data size read from touch device
+ * @buffer: The pointer of data buffer to store the data read from touch device
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_tic_pio_read(struct thc_device *dev, const u32 address,
+		     const u32 size, u32 *actual_size, u32 *buffer)
+{
+	u8 opcode;
+	int ret;
+
+	if (size <= 0 || !actual_size || !buffer) {
+		dev_err(dev->dev, "Invalid input parameters, size %u, actual_size %p, buffer %p\n",
+			size, actual_size, buffer);
+		return -EINVAL;
+	}
+
+	if (mutex_lock_interruptible(&dev->thc_bus_lock))
+		return -EINTR;
+
+	opcode = (dev->port_type == THC_PORT_TYPE_SPI) ?
+		 THC_PIO_OP_SPI_TIC_READ : THC_PIO_OP_I2C_TIC_READ;
+
+	ret = prepare_pio(dev, opcode, address, size);
+	if (ret < 0)
+		goto end;
+
+	pio_start(dev, 0, NULL);
+
+	ret = pio_wait(dev);
+	if (ret < 0)
+		goto end;
+
+	ret = pio_complete(dev, buffer, actual_size);
+
+end:
+	mutex_unlock(&dev->thc_bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(thc_tic_pio_read, "INTEL_THC");
+
+/**
+ * thc_tic_pio_write - Write data to touch device by PIO
+ *
+ * @dev: The pointer of THC private device context
+ * @address: Slave address for the PIO operation
+ * @size: PIO write data size
+ * @buffer: The pointer of the write data buffer
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_tic_pio_write(struct thc_device *dev, const u32 address,
+		      const u32 size, const u32 *buffer)
+{
+	u8 opcode;
+	int ret;
+
+	if (size <= 0 || !buffer) {
+		dev_err(dev->dev, "Invalid input parameters, size %u, buffer %p\n",
+			size, buffer);
+		return -EINVAL;
+	}
+
+	if (mutex_lock_interruptible(&dev->thc_bus_lock))
+		return -EINTR;
+
+	opcode = (dev->port_type == THC_PORT_TYPE_SPI) ?
+		 THC_PIO_OP_SPI_TIC_WRITE : THC_PIO_OP_I2C_TIC_WRITE;
+
+	ret = prepare_pio(dev, opcode, address, size);
+	if (ret < 0)
+		goto end;
+
+	pio_start(dev, size, buffer);
+
+	ret = pio_wait(dev);
+	if (ret < 0)
+		goto end;
+
+	ret = pio_complete(dev, NULL, NULL);
+
+end:
+	mutex_unlock(&dev->thc_bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(thc_tic_pio_write, "INTEL_THC");
+
+/**
+ * thc_tic_pio_write_and_read - Write data followed by read data by PIO
+ *
+ * @dev: The pointer of THC private device context
+ * @address: Slave address for the PIO operation
+ * @write_size: PIO write data size
+ * @write_buffer: The pointer of the write data buffer
+ * @read_size: Expected PIO read data size
+ * @actual_size: The pointer of the actual read data size
+ * @read_buffer: The pointer of PIO read data buffer
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_tic_pio_write_and_read(struct thc_device *dev, const u32 address,
+			       const u32 write_size, const u32 *write_buffer,
+			       const u32 read_size, u32 *actual_size, u32 *read_buffer)
+{
+	u32 i2c_ctrl, mask;
+	int ret;
+
+	if (dev->port_type == THC_PORT_TYPE_SPI) {
+		dev_err(dev->dev, "SPI port type doesn't support pio write and read!");
+		return -EINVAL;
+	}
+
+	if (mutex_lock_interruptible(&dev->thc_bus_lock))
+		return -EINTR;
+
+	/* Config i2c PIO write and read sequence */
+	i2c_ctrl = FIELD_PREP(THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_PIO_I2C_WBC, write_size);
+	mask = THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_PIO_I2C_WBC;
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_OFFSET,
+			  mask, i2c_ctrl);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_OFFSET,
+			  THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_I2C_RW_PIO_EN,
+			  THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_I2C_RW_PIO_EN);
+
+	ret = prepare_pio(dev, THC_PIO_OP_I2C_TIC_WRITE_AND_READ, address, read_size);
+	if (ret < 0)
+		goto end;
+
+	pio_start(dev, write_size, write_buffer);
+
+	ret = pio_wait(dev);
+	if (ret < 0)
+		goto end;
+
+	ret = pio_complete(dev, read_buffer, actual_size);
+
+end:
+	mutex_unlock(&dev->thc_bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(thc_tic_pio_write_and_read, "INTEL_THC");
+
 MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
 MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index 7060f0a36cbd..88a9f606a6a9 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -5,21 +5,45 @@
 #define _INTEL_THC_DEV_H_
 
 #include <linux/cdev.h>
+#include <linux/mutex.h>
 
 #define THC_REGMAP_COMMON_OFFSET  0x10
 #define THC_REGMAP_MMIO_OFFSET    0x1000
 
+/*
+ * THC Port type
+ * @THC_PORT_TYPE_SPI: This port is used for HIDSPI
+ * @THC_PORT_TYPE_I2C: This port is used for HIDI2C
+ */
+enum thc_port_type {
+	THC_PORT_TYPE_SPI = 0,
+	THC_PORT_TYPE_I2C = 1,
+};
+
 /**
  * struct thc_device - THC private device struct
  * @thc_regmap: MMIO regmap structure for accessing THC registers
  * @mmio_addr: MMIO registers address
+ * @thc_bus_lock: mutex locker for THC config
+ * @port_type: port type of THC port instance
+ * @pio_int_supported: PIO interrupt supported flag
  */
 struct thc_device {
 	struct device *dev;
 	struct regmap *thc_regmap;
 	void __iomem *mmio_addr;
+	struct mutex thc_bus_lock;
+	enum thc_port_type port_type;
+	bool pio_int_supported;
 };
 
 struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr);
+int thc_tic_pio_read(struct thc_device *dev, const u32 address,
+		     const u32 size, u32 *actual_size, u32 *buffer);
+int thc_tic_pio_write(struct thc_device *dev, const u32 address,
+		      const u32 size, const u32 *buffer);
+int thc_tic_pio_write_and_read(struct thc_device *dev, const u32 address,
+			       const u32 write_size, const u32 *write_buffer,
+			       const u32 read_size, u32 *actual_size, u32 *read_buffer);
 
 #endif /* _INTEL_THC_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
index 8b3a962e7e64..60f5f657be62 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
@@ -636,4 +636,27 @@
 
 #define THC_M_PRT_SW_DMA_PRD_TABLE_LEN_THC_M_PRT_SW_DMA_PRD_TABLE_LEN	GENMASK(23, 0)
 
+#define THC_REGMAP_POLLING_INTERVAL_US		10 /* 10us */
+#define THC_PIO_DONE_TIMEOUT_US			USEC_PER_SEC /* 1s */
+
+/*
+ * THC PIO opcode default value
+ * @THC_PIO_OP_SPI_TIC_READ: THC opcode for SPI PIO read
+ * @THC_PIO_OP_SPI_TIC_WRITE: THC opcode for SPI PIO write
+ * @THC_PIO_OP_I2C_SUBSYSTEM_READ: THC opcode for read I2C subsystem registers
+ * @THC_PIO_OP_I2C_SUBSYSTEM_WRITE: THC opcode for write I2C subsystem registers
+ * @THC_PIO_OP_I2C_TIC_READ: THC opcode for read I2C device
+ * @THC_PIO_OP_I2C_TIC_WRITE: THC opcode for write I2C device
+ * @THC_PIO_OP_I2C_TIC_WRITE_AND_READ: THC opcode for write followed by read I2C device
+ */
+enum thc_pio_opcode {
+	THC_PIO_OP_SPI_TIC_READ = 0x4,
+	THC_PIO_OP_SPI_TIC_WRITE = 0x6,
+	THC_PIO_OP_I2C_SUBSYSTEM_READ = 0x12,
+	THC_PIO_OP_I2C_SUBSYSTEM_WRITE = 0x13,
+	THC_PIO_OP_I2C_TIC_READ = 0x14,
+	THC_PIO_OP_I2C_TIC_WRITE = 0x18,
+	THC_PIO_OP_I2C_TIC_WRITE_AND_READ = 0x1C,
+};
+
 #endif /* _INTEL_THC_HW_H_  */
-- 
2.40.1


