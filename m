Return-Path: <linux-input+bounces-8930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84336A01D8C
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9841880555
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926921D63EE;
	Mon,  6 Jan 2025 02:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1rFJHHJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E31D6193;
	Mon,  6 Jan 2025 02:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130763; cv=none; b=UXZMbKnV/8jn9su2tbAdHX/kqmBxabtsW6Z67cDKxyAaAPD+8JI7teGTkXzSZDFzJiITRLhXlafbOe++Eu3v1qlJqrbua145hZGRhkjZqrlXb1u42If9cgDM/7QK18uP4CVzQ9wtFaEmoZFUYTsW0su76w9+o8kFoh1fMFFHP6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130763; c=relaxed/simple;
	bh=kzaXNbpx7AxUXVclpEXUhwjc8EwZI4I21X5uaDIlm/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p5gzUy803Z/RYLapdGGCYvKZt37NjpwRyhZML6mHxgakL8wYXfkzghNlrFl73b3N9vCmQOWNAJNUikOiu+/8piVwBJKLG/Pq9iWlfefQ4EUwdsv+T66aHmi8kLEPYzU+RVnCOt9dZlSKuXgmpYdu+zt8Xm3ibhcetv6hpdF3xF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1rFJHHJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130761; x=1767666761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kzaXNbpx7AxUXVclpEXUhwjc8EwZI4I21X5uaDIlm/c=;
  b=Z1rFJHHJt9yVIcVYO6849Hb0MOJLZQrW7Z+2Qp1s9cdsmYHFWDPo8dNA
   QaIXLYwIMsLcfl+QCUbG8WgpkmGIyt8fpzodga7hcU2DAy4U0rcCR4O7h
   YoKoLTwKvjQCOg8vPMDeFP1jiHvU8iIV1nHua/4YhEpsoDG00M2Z5b8Xe
   aL/JzoascnnxVmr213PacUPIz85br5xhSMvGJFt9CmCLwLHI4VzuAjnk9
   mmDe7a5kBt5TGlLmdUwFUTUXhyCbViv/QQyGwfVcY/XBjttvlrNAXagMC
   eIRbJljRqaf4Gd3IzpE5TkASd7hne3T/gVzZ5uo4VmDGXMcK4O8nlBcs5
   A==;
X-CSE-ConnectionGUID: 1ePxEupfQN6GuoqZK/+7Gg==
X-CSE-MsgGUID: 3sihbBnvQXS+WPnMSiV/5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171517"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171517"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:32:41 -0800
X-CSE-ConnectionGUID: GE7se2iTTaaUBXEIhyMIrQ==
X-CSE-MsgGUID: yxD99rEWTq2QgdBwmeWZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125596025"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:32:37 -0800
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
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 10/22] HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces
Date: Mon,  6 Jan 2025 10:31:39 +0800
Message-Id: <20250106023151.3011329-11-even.xu@intel.com>
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

Add I2C bus related APIs to initialize I2C sub-system parameters, such
as bus speed, slave address, address bit. As I2C sub-system hasn't
auto register save and restore support, provide APIs to do it manually.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 281 ++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |   7 +
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    | 129 ++++++++
 3 files changed, 417 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 8a439eb120b5..92a1dbe9a928 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1290,6 +1290,287 @@ void thc_spi_input_output_address_config(struct thc_device *dev, u32 input_hdr_a
 }
 EXPORT_SYMBOL_NS_GPL(thc_spi_input_output_address_config, "INTEL_THC");
 
+static int thc_i2c_subip_pio_read(struct thc_device *dev, const u32 address,
+				  u32 *size, u32 *buffer)
+{
+	int ret;
+
+	if (!size || *size == 0 || !buffer) {
+		dev_err(dev->dev, "Invalid input parameters, size %p, buffer %p\n",
+			size, buffer);
+		return -EINVAL;
+	}
+
+	if (mutex_lock_interruptible(&dev->thc_bus_lock))
+		return -EINTR;
+
+	ret = prepare_pio(dev, THC_PIO_OP_I2C_SUBSYSTEM_READ, address, *size);
+	if (ret < 0)
+		goto end;
+
+	pio_start(dev, 0, NULL);
+
+	ret = pio_wait(dev);
+	if (ret < 0)
+		goto end;
+
+	ret = pio_complete(dev, buffer, size);
+	if (ret < 0)
+		goto end;
+
+end:
+	mutex_unlock(&dev->thc_bus_lock);
+
+	if (ret)
+		dev_err_once(dev->dev, "Read THC I2C SubIP register failed %d, offset %u\n",
+			     ret, address);
+
+	return ret;
+}
+
+static int thc_i2c_subip_pio_write(struct thc_device *dev, const u32 address,
+				   const u32 size, const u32 *buffer)
+{
+	int ret;
+
+	if (size == 0 || !buffer) {
+		dev_err(dev->dev, "Invalid input parameters, size %u, buffer %p\n",
+			size, buffer);
+		return -EINVAL;
+	}
+
+	if (mutex_lock_interruptible(&dev->thc_bus_lock))
+		return -EINTR;
+
+	ret = prepare_pio(dev, THC_PIO_OP_I2C_SUBSYSTEM_WRITE, address, size);
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
+	if (ret < 0)
+		goto end;
+
+end:
+	mutex_unlock(&dev->thc_bus_lock);
+
+	if (ret)
+		dev_err_once(dev->dev, "Write THC I2C SubIP register failed %d, offset %u\n",
+			     ret, address);
+
+	return ret;
+}
+
+#define I2C_SUBIP_CON_DEFAULT		0x663
+#define I2C_SUBIP_INT_MASK_DEFAULT	0x7FFF
+#define I2C_SUBIP_RX_TL_DEFAULT		62
+#define I2C_SUBIP_TX_TL_DEFAULT		0
+#define I2C_SUBIP_DMA_TDLR_DEFAULT	7
+#define I2C_SUBIP_DMA_RDLR_DEFAULT	7
+
+static int thc_i2c_subip_set_speed(struct thc_device *dev, const u32 speed,
+				   const u32 hcnt, const u32 lcnt)
+{
+	u32 hcnt_offset, lcnt_offset;
+	u32 val;
+	int ret;
+
+	switch (speed) {
+	case THC_I2C_STANDARD:
+		hcnt_offset = THC_I2C_IC_SS_SCL_HCNT_OFFSET;
+		lcnt_offset = THC_I2C_IC_SS_SCL_LCNT_OFFSET;
+		break;
+
+	case THC_I2C_FAST_AND_PLUS:
+		hcnt_offset = THC_I2C_IC_FS_SCL_HCNT_OFFSET;
+		lcnt_offset = THC_I2C_IC_FS_SCL_LCNT_OFFSET;
+		break;
+
+	case THC_I2C_HIGH_SPEED:
+		hcnt_offset = THC_I2C_IC_HS_SCL_HCNT_OFFSET;
+		lcnt_offset = THC_I2C_IC_HS_SCL_LCNT_OFFSET;
+		break;
+
+	default:
+		dev_err_once(dev->dev, "Unsupported i2c speed %d\n", speed);
+		ret = -EINVAL;
+		return ret;
+	}
+
+	ret = thc_i2c_subip_pio_write(dev, hcnt_offset, sizeof(u32), &hcnt);
+	if (ret < 0)
+		return ret;
+
+	ret = thc_i2c_subip_pio_write(dev, lcnt_offset, sizeof(u32), &lcnt);
+	if (ret < 0)
+		return ret;
+
+	val = I2C_SUBIP_CON_DEFAULT & ~THC_I2C_IC_CON_SPEED;
+	val |= FIELD_PREP(THC_I2C_IC_CON_SPEED, speed);
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_CON_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static u32 i2c_subip_regs[] = {
+	THC_I2C_IC_CON_OFFSET,
+	THC_I2C_IC_TAR_OFFSET,
+	THC_I2C_IC_INTR_MASK_OFFSET,
+	THC_I2C_IC_RX_TL_OFFSET,
+	THC_I2C_IC_TX_TL_OFFSET,
+	THC_I2C_IC_DMA_CR_OFFSET,
+	THC_I2C_IC_DMA_TDLR_OFFSET,
+	THC_I2C_IC_DMA_RDLR_OFFSET,
+	THC_I2C_IC_SS_SCL_HCNT_OFFSET,
+	THC_I2C_IC_SS_SCL_LCNT_OFFSET,
+	THC_I2C_IC_FS_SCL_HCNT_OFFSET,
+	THC_I2C_IC_FS_SCL_LCNT_OFFSET,
+	THC_I2C_IC_HS_SCL_HCNT_OFFSET,
+	THC_I2C_IC_HS_SCL_LCNT_OFFSET,
+	THC_I2C_IC_ENABLE_OFFSET,
+};
+
+/**
+ * thc_i2c_subip_init - Initialize and configure THC I2C subsystem
+ *
+ * @dev: The pointer of THC private device context
+ * @target_address: Slave address of touch device (TIC)
+ * @speed: I2C bus frequency speed mode
+ * @hcnt: I2C clock SCL high count
+ * @lcnt: I2C clock SCL low count
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_i2c_subip_init(struct thc_device *dev, const u32 target_address,
+		       const u32 speed, const u32 hcnt, const u32 lcnt)
+{
+	u32 read_size = sizeof(u32);
+	u32 val;
+	int ret;
+
+	ret = thc_i2c_subip_pio_read(dev, THC_I2C_IC_ENABLE_OFFSET, &read_size, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= ~THC_I2C_IC_ENABLE_ENABLE;
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_ENABLE_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	ret = thc_i2c_subip_pio_read(dev, THC_I2C_IC_TAR_OFFSET, &read_size, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= ~THC_I2C_IC_TAR_IC_TAR;
+	val |= FIELD_PREP(THC_I2C_IC_TAR_IC_TAR, target_address);
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_TAR_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	ret = thc_i2c_subip_set_speed(dev, speed, hcnt, lcnt);
+	if (ret < 0)
+		return ret;
+
+	val = I2C_SUBIP_INT_MASK_DEFAULT;
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_INTR_MASK_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	val = I2C_SUBIP_RX_TL_DEFAULT;
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_RX_TL_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	val = I2C_SUBIP_TX_TL_DEFAULT;
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_TX_TL_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	val = THC_I2C_IC_DMA_CR_RDMAE | THC_I2C_IC_DMA_CR_TDMAE;
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_DMA_CR_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	val = I2C_SUBIP_DMA_TDLR_DEFAULT;
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_DMA_TDLR_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	val = I2C_SUBIP_DMA_RDLR_DEFAULT;
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_DMA_RDLR_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	ret = thc_i2c_subip_pio_read(dev, THC_I2C_IC_ENABLE_OFFSET, &read_size, &val);
+	if (ret < 0)
+		return ret;
+
+	val |= THC_I2C_IC_ENABLE_ENABLE;
+	ret = thc_i2c_subip_pio_write(dev, THC_I2C_IC_ENABLE_OFFSET, sizeof(u32), &val);
+	if (ret < 0)
+		return ret;
+
+	dev->i2c_subip_regs = devm_kzalloc(dev->dev, sizeof(i2c_subip_regs), GFP_KERNEL);
+	if (!dev->i2c_subip_regs)
+		return PTR_ERR(dev->i2c_subip_regs);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_i2c_subip_init, "INTEL_THC");
+
+/**
+ * thc_i2c_subip_regs_save - Save THC I2C sub-subsystem register values to THC device context
+ *
+ * @dev: The pointer of THC private device context
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_i2c_subip_regs_save(struct thc_device *dev)
+{
+	int ret;
+	u32 read_size = sizeof(u32);
+
+	for (int i = 0; i < ARRAY_SIZE(i2c_subip_regs); i++) {
+		ret = thc_i2c_subip_pio_read(dev, i2c_subip_regs[i],
+					     &read_size, (u32 *)&dev->i2c_subip_regs + i);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_i2c_subip_regs_save, "INTEL_THC");
+
+/**
+ * thc_i2c_subip_regs_restore - Restore THC I2C subsystem registers from THC device context
+ *
+ * @dev: The pointer of THC private device context
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_i2c_subip_regs_restore(struct thc_device *dev)
+{
+	int ret;
+	u32 write_size = sizeof(u32);
+
+	for (int i = 0; i < ARRAY_SIZE(i2c_subip_regs); i++) {
+		ret = thc_i2c_subip_pio_write(dev, i2c_subip_regs[i],
+					      write_size, (u32 *)&dev->i2c_subip_regs + i);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_i2c_subip_regs_restore, "INTEL_THC");
+
 MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
 MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index 925355f19bae..0517fee2c668 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -61,6 +61,7 @@ enum thc_int_type {
  * @write_done: bool value that indicates if DMA write is done
  * @swdma_done: bool value that indicates if SWDMA swquence is done
  * @perf_limit: the delay between read operation and write operation
+ * @i2c_subip_regs: the copy of THC I2C sub-system registers for resuming restore
  */
 struct thc_device {
 	struct device *dev;
@@ -78,6 +79,8 @@ struct thc_device {
 	bool swdma_done;
 
 	u32 perf_limit;
+
+	u32 *i2c_subip_regs;
 };
 
 struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr);
@@ -105,5 +108,9 @@ int thc_spi_write_config(struct thc_device *dev, u32 spi_freq_val,
 			 u32 io_mode, u32 opcode, u32 spi_wr_mps, u32 perf_limit);
 void thc_spi_input_output_address_config(struct thc_device *dev, u32 input_hdr_addr,
 					 u32 input_bdy_addr, u32 output_addr);
+int thc_i2c_subip_init(struct thc_device *dev, const u32 target_address,
+		       const u32 speed, const u32 hcnt, const u32 lcnt);
+int thc_i2c_subip_regs_save(struct thc_device *dev);
+int thc_i2c_subip_regs_restore(struct thc_device *dev);
 
 #endif /* _INTEL_THC_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
index 94b1ebe0b069..6729c4c25dab 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
@@ -749,4 +749,133 @@ enum thc_spi_frq_div {
 	THC_SPI_FRQ_DIV_7 = 7,
 };
 
+/* THC I2C sub-system registers */
+#define THC_I2C_IC_CON_OFFSET				0x0
+#define THC_I2C_IC_TAR_OFFSET				0x4
+#define THC_I2C_IC_SAR_OFFSET				0x8
+#define THC_I2C_IC_HS_MADDR_OFFSET			0xC
+#define THC_I2C_IC_DATA_CMD_OFFSET			0x10
+#define THC_I2C_IC_SS_SCL_HCNT_OFFSET			0x14
+#define THC_I2C_IC_UFM_SCL_HCNT_OFFSET			0x14
+#define THC_I2C_IC_SS_SCL_LCNT_OFFSET			0x18
+#define THC_I2C_IC_UFM_SCL_LCNT_OFFSET			0x18
+#define THC_I2C_IC_FS_SCL_HCNT_OFFSET			0x1C
+#define THC_I2C_IC_UFM_TBUF_CNT_OFFSET			0x1C
+#define THC_I2C_IC_FS_SCL_LCNT_OFFSET			0x20
+#define THC_I2C_IC_HS_SCL_HCNT_OFFSET			0x24
+#define THC_I2C_IC_HS_SCL_LCNT_OFFSET			0x28
+#define THC_I2C_IC_INTR_STAT_OFFSET			0x2C
+#define THC_I2C_IC_INTR_MASK_OFFSET			0x30
+#define THC_I2C_IC_RAW_INTR_STAT_OFFSET			0x34
+#define THC_I2C_IC_RX_TL_OFFSET				0x38
+#define THC_I2C_IC_TX_TL_OFFSET				0x3C
+#define THC_I2C_IC_CLR_INTR_OFFSET			0x40
+#define THC_I2C_IC_CLR_RX_UNDER_OFFSET			0x44
+#define THC_I2C_IC_CLR_RX_OVER_OFFSET			0x48
+#define THC_I2C_IC_CLR_TX_OVER_OFFSET			0x4C
+#define THC_I2C_IC_CLR_RD_REQ_OFFSET			0x50
+#define THC_I2C_IC_CLR_TX_ABRT_OFFSET			0x54
+#define THC_I2C_IC_CLR_RX_DONE_OFFSET			0x58
+#define THC_I2C_IC_CLR_ACTIVITY_OFFSET			0x5C
+#define THC_I2C_IC_CLR_STOP_DET_OFFSET			0x60
+#define THC_I2C_IC_CLR_START_DET_OFFSET			0x64
+#define THC_I2C_IC_CLR_GEN_CALL_OFFSET			0x68
+#define THC_I2C_IC_ENABLE_OFFSET			0x6C
+#define THC_I2C_IC_STATUS_OFFSET			0x70
+#define THC_I2C_IC_TXFLR_OFFSET				0x74
+#define THC_I2C_IC_RXFLR_OFFSET				0x78
+#define THC_I2C_IC_SDA_HOLD_OFFSET			0x7C
+#define THC_I2C_IC_TX_ABRT_SOURCE_OFFSET		0x80
+#define THC_I2C_IC_SLV_DATA_NACK_ONLY_OFFSET		0x84
+#define THC_I2C_IC_DMA_CR_OFFSET			0x88
+#define THC_I2C_IC_DMA_TDLR_OFFSET			0x8C
+#define THC_I2C_IC_DMA_RDLR_OFFSET			0x90
+#define THC_I2C_IC_SDA_SETUP_OFFSET			0x94
+#define THC_I2C_IC_ACK_GENERAL_CALL_OFFSET		0x98
+#define THC_I2C_IC_ENABLE_STATUS_OFFSET			0x9C
+#define THC_I2C_IC_FS_SPKLEN_OFFSET			0xA0
+#define THC_I2C_IC_UFM_SPKLEN_OFFSET			0xA0
+#define THC_I2C_IC_HS_SPKLEN_OFFSET			0xA4
+#define THC_I2C_IC_CLR_RESTART_DET_OFFSET		0xA8
+#define THC_I2C_IC_SCL_STUCK_AT_LOW_TIMEOUT_OFFSET	0xAC
+#define THC_I2C_IC_SDA_STUCK_AT_LOW_TIMEOUT_OFFSET	0xB0
+#define THC_I2C_IC_CLR_SCL_STUCK_DET_OFFSET		0xB4
+#define THC_I2C_IC_DEVICE_ID_OFFSET			0xB8
+#define THC_I2C_IC_SMBUS_CLK_LOW_SEXT_OFFSET		0xBC
+#define THC_I2C_IC_SMBUS_CLK_LOW_MEXT_OFFSET		0xC0
+#define THC_I2C_IC_SMBUS_THIGH_MAX_IDLE_COUNT_OFFSET	0xC4
+#define THC_I2C_IC_SMBUS_INTR_STAT_OFFSET		0xC8
+#define THC_I2C_IC_SMBUS_INTR_MASK_OFFSET		0xCC
+#define THC_I2C_IC_SMBUS_RAW_INTR_STAT_OFFSET		0xD0
+#define THC_I2C_IC_CLR_SMBUS_INTR_OFFSET		0xD4
+#define THC_I2C_IC_OPTIONAL_SAR_OFFSET			0xD8
+#define THC_I2C_IC_SMBUS_UDID_LSB_OFFSET		0xDC
+#define THC_I2C_IC_SMBUS_UDID_WORD0_OFFSET		0xDC
+#define THC_I2C_IC_SMBUS_UDID_WORD1_OFFSET		0xE0
+#define THC_I2C_IC_SMBUS_UDID_WORD2_OFFSET		0xE4
+#define THC_I2C_IC_SMBUS_UDID_WORD3_OFFSET		0xE8
+#define THC_I2C_IC_COMP_PARAM_1_OFFSET			0xF4
+#define THC_I2C_IC_COMP_VERSION_OFFSET			0xF8
+#define THC_I2C_IC_COMP_TYPE_OFFSET			0xFC
+
+/**
+ * THC I2C sub-system supported speed mode
+ */
+enum THC_I2C_SPEED_MODE {
+	THC_I2C_STANDARD = 1,
+	THC_I2C_FAST_AND_PLUS = 2,
+	THC_I2C_HIGH_SPEED = 3,
+};
+
+/* THC I2C sub-system register bits definition */
+#define THC_I2C_IC_ENABLE_ENABLE			BIT(0)
+#define THC_I2C_IC_ENABLE_ABORT				BIT(1)
+#define THC_I2C_IC_ENABLE_TX_CMD_BLOCK			BIT(2)
+#define THC_I2C_IC_ENABLE_SDA_STUCK_RECOVERY_ENABLE	BIT(3)
+#define THC_I2C_IC_ENABLE_SMBUS_CLK_RESET		BIT(16)
+#define THC_I2C_IC_ENABLE_SMBUS_SUSPEND_EN		BIT(17)
+#define THC_I2C_IC_ENABLE_SMBUS_ALERT_EN		BIT(18)
+
+#define THC_I2C_IC_CON_MASTER_MODE			BIT(0)
+#define THC_I2C_IC_CON_SPEED				GENMASK(2, 1)
+#define THC_I2C_IC_CON_IC_10BITADDR_SLAVE		BIT(3)
+#define THC_I2C_IC_CON_IC_10BITADDR_MASTER		BIT(4)
+#define THC_I2C_IC_CON_IC_RESTART_EN			BIT(5)
+#define THC_I2C_IC_CON_IC_SLAVE_DISABLE			BIT(6)
+#define THC_I2C_IC_CON_STOP_DET_IFADDRESSED		BIT(7)
+#define THC_I2C_IC_CON_TX_EMPTY_CTRL			BIT(8)
+#define THC_I2C_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
+#define THC_I2C_IC_CON_STOP_DET_IF_MASTER_ACTIVE	BIT(10)
+#define THC_I2C_IC_CON_BUS_CLEAR_FEATURE_CTRL		BIT(11)
+#define THC_I2C_IC_CON_OPTIONAL_SAR_CTRL		BIT(16)
+#define THC_I2C_IC_CON_SMBUS_SLAVE_QUICK_EN		BIT(17)
+#define THC_I2C_IC_CON_SMBUS_ARP_EN			BIT(18)
+#define THC_I2C_IC_CON_SMBUS_PERSISTENT_SLV_ADDR_EN	BIT(19)
+
+#define THC_I2C_IC_TAR_IC_TAR				GENMASK(9, 0)
+#define THC_I2C_IC_TAR_GC_OR_START			BIT(10)
+#define THC_I2C_IC_TAR_SPECIAL				BIT(11)
+#define THC_I2C_IC_TAR_IC_10BITADDR_MASTER		BIT(12)
+#define THC_I2C_IC_TAR_DEVICE_ID			BIT(13)
+#define THC_I2C_IC_TAR_SMBUS_QUICK_CMD			BIT(16)
+
+#define THC_I2C_IC_INTR_MASK_M_RX_UNDER			BIT(0)
+#define THC_I2C_IC_INTR_MASK_M_RX_OVER			BIT(1)
+#define THC_I2C_IC_INTR_MASK_M_RX_FULL			BIT(2)
+#define THC_I2C_IC_INTR_MASK_M_TX_OVER			BIT(3)
+#define THC_I2C_IC_INTR_MASK_M_TX_EMPTY			BIT(4)
+#define THC_I2C_IC_INTR_MASK_M_RD_REQ			BIT(5)
+#define THC_I2C_IC_INTR_MASK_M_TX_ABRT			BIT(6)
+#define THC_I2C_IC_INTR_MASK_M_RX_DONE			BIT(7)
+#define THC_I2C_IC_INTR_MASK_M_ACTIVITY			BIT(8)
+#define THC_I2C_IC_INTR_MASK_M_STOP_DET			BIT(9)
+#define THC_I2C_IC_INTR_MASK_M_START_DET		BIT(10)
+#define THC_I2C_IC_INTR_MASK_M_GEN_CALL			BIT(11)
+#define THC_I2C_IC_INTR_MASK_M_RESTART_DET		BIT(12)
+#define THC_I2C_IC_INTR_MASK_M_MASTER_ON_HOLD		BIT(13)
+#define THC_I2C_IC_INTR_MASK_M_SCL_STUCK_AT_LOW		BIT(14)
+
+#define THC_I2C_IC_DMA_CR_RDMAE				BIT(0)
+#define THC_I2C_IC_DMA_CR_TDMAE				BIT(1)
+
 #endif /* _INTEL_THC_HW_H_  */
-- 
2.40.1


