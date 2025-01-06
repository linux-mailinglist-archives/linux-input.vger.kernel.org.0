Return-Path: <linux-input+bounces-8928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD5A01D85
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC13A3A3EDA
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453CA1D5CC5;
	Mon,  6 Jan 2025 02:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8Ua8LE4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE018E02D;
	Mon,  6 Jan 2025 02:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130757; cv=none; b=riqKvrzhRg/Bs7pQ1OGkbBLaRYcS435+UN6vAFHsIlYrhcai9Pr1CHbWVX4kUquceaRtuUdhyaGsYq0kavFnsdHCuWW1w6kBuP2iQ+SmNebVjGuMiL2yMOuFkyXU1kES9pQ8AhIAN94540sxneIrjlAVo8wlVw1Jj7xj8NbNHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130757; c=relaxed/simple;
	bh=FvsxmzbSD5UNtigF5EHA17GG0ucryxh0b8Fyb+1qNBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iwjU0V+WSI6OGy8/0F0ABlNamP008/3pUVe9XfNbmLj8oCOspuouN0gze5isgI2amc9qyydZIONqdphfzZ/MKX29eTBlQz0uv8n5JC4W/6d2hKOH2C6SbdF+TkROipz5wYq5oyYnO2ZsazNFcZgdV0d82T4gLRT/LNHvDjwwVE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8Ua8LE4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130755; x=1767666755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FvsxmzbSD5UNtigF5EHA17GG0ucryxh0b8Fyb+1qNBI=;
  b=I8Ua8LE4i5QeFbzgjuDxr77cSEgHYuZRGj4UREnIdoII3Xnh8kQjS9Ey
   DtazO97Rv7k/YVmywjELHpHSHttCEkjTJzr7KVkjOa0NMqXcq0t+rZXLg
   rmq1Zo+s37l5dXhHne0s7/uGsdtuGsD8l++ejeCgR8VuBjQVa3OqyVgfL
   fL+2kIjpB821QhcDTesggh9VfqdP3EZqAiYaXP6PNf9MvF+sctF9/n6Y/
   SxBlqCapvEY01PSIem+SWdzjEPuIpKMXhMcHDnhZtXLURoRCxKp/d+LyW
   QcEf+nI3/D3IzfbFKNfHFQ093budO5kq0knpjCYivVA2za1rz8wJhT3rH
   Q==;
X-CSE-ConnectionGUID: 0K54VttJSHigBP2cWJGj2A==
X-CSE-MsgGUID: hMSDPUhfTGu2gV5zP4TVVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171494"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171494"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:32:34 -0800
X-CSE-ConnectionGUID: zAhRufAXQByOa3E55R01PQ==
X-CSE-MsgGUID: EYzM8oVwQraf12FZSHg0hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125595999"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:32:30 -0800
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
Subject: [PATCH v4 08/22] HID: intel-thc-hid: intel-thc: Add THC interrupt handler
Date: Mon,  6 Jan 2025 10:31:37 +0800
Message-Id: <20250106023151.3011329-9-even.xu@intel.com>
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

Add common interrupt handler to clear interrupt status and return
interrupt type to caller for future handling.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 259 ++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  27 ++
 2 files changed, 286 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index f09832016d9c..99dbaeef041c 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -802,6 +802,265 @@ void thc_ltr_unconfig(struct thc_device *dev)
 }
 EXPORT_SYMBOL_NS_GPL(thc_ltr_unconfig, "INTEL_THC");
 
+/**
+ * thc_int_cause_read - Read interrupt cause register value
+ *
+ * @dev: The pointer of THC private device context
+ *
+ * Return: The interrupt cause register value
+ */
+u32 thc_int_cause_read(struct thc_device *dev)
+{
+	u32 int_cause;
+
+	regmap_read(dev->thc_regmap,
+		    THC_M_PRT_DEV_INT_CAUSE_REG_VAL_OFFSET, &int_cause);
+
+	return int_cause;
+}
+EXPORT_SYMBOL_NS_GPL(thc_int_cause_read, "INTEL_THC");
+
+static void thc_print_txn_error_cause(const struct thc_device *dev)
+{
+	bool known_error = false;
+	u32 cause = 0;
+
+	regmap_read(dev->thc_regmap, THC_M_PRT_ERR_CAUSE_OFFSET, &cause);
+
+	if (cause & THC_M_PRT_ERR_CAUSE_PRD_ENTRY_ERR) {
+		dev_err(dev->dev, "TXN Error: Invalid PRD Entry\n");
+		known_error = true;
+	}
+	if (cause & THC_M_PRT_ERR_CAUSE_BUF_OVRRUN_ERR) {
+		dev_err(dev->dev, "TXN Error: THC Buffer Overrun\n");
+		known_error = true;
+	}
+	if (cause & THC_M_PRT_ERR_CAUSE_FRAME_BABBLE_ERR) {
+		dev_err(dev->dev, "TXN Error: Frame Babble\n");
+		known_error = true;
+	}
+	if (cause & THC_M_PRT_ERR_CAUSE_INVLD_DEV_ENTRY) {
+		dev_err(dev->dev, "TXN Error: Invalid Device Register Setting\n");
+		known_error = true;
+	}
+
+	/* Clear interrupt status bits */
+	regmap_write(dev->thc_regmap, THC_M_PRT_ERR_CAUSE_OFFSET, cause);
+
+	if (!known_error)
+		dev_err(dev->dev, "TXN Error does not match any known value: 0x%X\n",
+			cause);
+}
+
+/**
+ * thc_interrupt_handler - Handle THC interrupts
+ *
+ * THC interrupts include several types: external touch device (TIC) non-DMA
+ * interrupts, PIO completion interrupts, DMA interrtups, I2C subIP raw
+ * interrupts and error interrupts.
+ *
+ * This is a help function for interrupt processing, it detects interrupt
+ * type, clear the interrupt status bit and return the interrupt type to caller
+ * for future processing.
+ *
+ * @dev: The pointer of THC private device context
+ *
+ * Return: The combined flag for interrupt type
+ */
+int thc_interrupt_handler(struct thc_device *dev)
+{
+	u32 read_sts_1, read_sts_2, read_sts_sw, write_sts;
+	u32 int_sts, err_cause, seq_cntrl, seq_sts;
+	int interrupt_type = 0;
+
+	regmap_read(dev->thc_regmap,
+		    THC_M_PRT_READ_DMA_INT_STS_1_OFFSET, &read_sts_1);
+
+	if (read_sts_1 & THC_M_PRT_READ_DMA_INT_STS_NONDMA_INT_STS) {
+		dev_dbg(dev->dev, "THC non-DMA device interrupt\n");
+
+		regmap_write(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_1_OFFSET,
+			     NONDMA_INT_STS_BIT);
+
+		interrupt_type |= BIT(THC_NONDMA_INT);
+
+		return interrupt_type;
+	}
+
+	regmap_read(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET, &int_sts);
+
+	if (int_sts & THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS) {
+		dev_err(dev->dev, "THC transaction error, int_sts: 0x%08X\n", int_sts);
+		thc_print_txn_error_cause(dev);
+
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     TXN_ERR_INT_STS_BIT);
+
+		interrupt_type |= BIT(THC_TXN_ERR_INT);
+
+		return interrupt_type;
+	}
+
+	regmap_read(dev->thc_regmap, THC_M_PRT_ERR_CAUSE_OFFSET, &err_cause);
+	regmap_read(dev->thc_regmap,
+		    THC_M_PRT_READ_DMA_INT_STS_2_OFFSET, &read_sts_2);
+
+	if (err_cause & THC_M_PRT_ERR_CAUSE_BUF_OVRRUN_ERR ||
+	    read_sts_1 & THC_M_PRT_READ_DMA_INT_STS_STALL_STS ||
+	    read_sts_2 & THC_M_PRT_READ_DMA_INT_STS_STALL_STS) {
+		dev_err(dev->dev, "Buffer overrun or RxDMA engine stalled!\n");
+		thc_print_txn_error_cause(dev);
+
+		regmap_write(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_2_OFFSET,
+			     THC_M_PRT_READ_DMA_INT_STS_STALL_STS);
+		regmap_write(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_1_OFFSET,
+			     THC_M_PRT_READ_DMA_INT_STS_STALL_STS);
+		regmap_write(dev->thc_regmap, THC_M_PRT_ERR_CAUSE_OFFSET,
+			     THC_M_PRT_ERR_CAUSE_BUF_OVRRUN_ERR);
+
+		interrupt_type |= BIT(THC_TXN_ERR_INT);
+
+		return interrupt_type;
+	}
+
+	if (int_sts & THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS) {
+		dev_err_once(dev->dev, "THC FATAL error, int_sts: 0x%08X\n", int_sts);
+
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     TXN_FATAL_INT_STS_BIT);
+
+		interrupt_type |= BIT(THC_FATAL_ERR_INT);
+
+		return interrupt_type;
+	}
+
+	regmap_read(dev->thc_regmap,
+		    THC_M_PRT_SW_SEQ_CNTRL_OFFSET, &seq_cntrl);
+	regmap_read(dev->thc_regmap,
+		    THC_M_PRT_SW_SEQ_STS_OFFSET, &seq_sts);
+
+	if (seq_cntrl & THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CD_IE &&
+	    seq_sts & THC_M_PRT_SW_SEQ_STS_TSSDONE) {
+		dev_dbg(dev->dev, "THC_SS_CD_IE and TSSDONE are set\n");
+		interrupt_type |= BIT(THC_PIO_DONE_INT);
+	}
+
+	if (read_sts_1 & THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS) {
+		dev_dbg(dev->dev, "Got RxDMA1 Read Interrupt\n");
+
+		regmap_write(dev->thc_regmap,
+			     THC_M_PRT_READ_DMA_INT_STS_1_OFFSET, read_sts_1);
+
+		interrupt_type |= BIT(THC_RXDMA1_INT);
+	}
+
+	if (read_sts_2 & THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS) {
+		dev_dbg(dev->dev, "Got RxDMA2 Read Interrupt\n");
+
+		regmap_write(dev->thc_regmap,
+			     THC_M_PRT_READ_DMA_INT_STS_2_OFFSET, read_sts_2);
+
+		interrupt_type |= BIT(THC_RXDMA2_INT);
+	}
+
+	regmap_read(dev->thc_regmap,
+		    THC_M_PRT_READ_DMA_INT_STS_SW_OFFSET, &read_sts_sw);
+
+	if (read_sts_sw & THC_M_PRT_READ_DMA_INT_STS_DMACPL_STS) {
+		dev_dbg(dev->dev, "Got SwDMA Read Interrupt\n");
+
+		regmap_write(dev->thc_regmap,
+			     THC_M_PRT_READ_DMA_INT_STS_SW_OFFSET, read_sts_sw);
+
+		dev->swdma_done = true;
+		wake_up_interruptible(&dev->swdma_complete_wait);
+
+		interrupt_type |= BIT(THC_SWDMA_INT);
+	}
+
+	regmap_read(dev->thc_regmap,
+		    THC_M_PRT_WRITE_INT_STS_OFFSET, &write_sts);
+
+	if (write_sts & THC_M_PRT_WRITE_INT_STS_THC_WRDMA_CMPL_STATUS) {
+		dev_dbg(dev->dev, "Got TxDMA Write complete Interrupt\n");
+
+		regmap_write(dev->thc_regmap,
+			     THC_M_PRT_WRITE_INT_STS_OFFSET, write_sts);
+
+		dev->write_done = true;
+		wake_up_interruptible(&dev->write_complete_wait);
+
+		interrupt_type |= BIT(THC_TXDMA_INT);
+	}
+
+	if (int_sts & THC_M_PRT_INT_STATUS_DEV_RAW_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_DEV_RAW_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_UNDER_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_UNDER_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_OVER_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_OVER_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_FULL_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_FULL_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_OVER_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_OVER_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_EMPTY_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_EMPTY_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_ABRT_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_ABRT_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_ACTIVITY_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_ACTIVITY_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_SCL_STUCK_AT_LOW_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_SCL_STUCK_AT_LOW_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_STOP_DET_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_STOP_DET_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_START_DET_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_START_DET_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+	if (int_sts & THC_M_PRT_INT_STATUS_THC_I2C_IC_MST_ON_HOLD_INT_STS) {
+		regmap_write(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
+			     THC_M_PRT_INT_STATUS_THC_I2C_IC_MST_ON_HOLD_INT_STS);
+		interrupt_type |= BIT(THC_I2CSUBIP_INT);
+	}
+
+	if (!interrupt_type)
+		interrupt_type |= BIT(THC_UNKNOWN_INT);
+
+	return interrupt_type;
+}
+EXPORT_SYMBOL_NS_GPL(thc_interrupt_handler, "INTEL_THC");
+
 MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
 MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index c25f2fd57c76..d34fab243fdc 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -23,6 +23,31 @@ enum thc_port_type {
 	THC_PORT_TYPE_I2C = 1,
 };
 
+/**
+ * THC interrupt flag
+ * @THC_NONDMA_INT: THC non-DMA interrupt
+ * @THC_RXDMA1_INT: THC RxDMA1 interrupt
+ * @THC_RXDMA2_INT: THC RxDMA2 interrupt
+ * @THC_SWDMA_INT: THC SWDMA interrupt
+ * @THC_TXDMA_INT: THC TXDMA interrupt
+ * @THC_PIO_DONE_INT: THC PIO complete interrupt
+ * @THC_I2CSUBIP_INT: THC I2C subsystem interrupt
+ * @THC_TXN_ERR_INT: THC transfer error interrupt
+ * @THC_FATAL_ERR_INT: THC fatal error interrupt
+ */
+enum thc_int_type {
+	THC_NONDMA_INT = 0,
+	THC_RXDMA1_INT = 1,
+	THC_RXDMA2_INT = 2,
+	THC_SWDMA_INT = 3,
+	THC_TXDMA_INT = 4,
+	THC_PIO_DONE_INT = 5,
+	THC_I2CSUBIP_INT = 6,
+	THC_TXN_ERR_INT = 7,
+	THC_FATAL_ERR_INT = 8,
+	THC_UNKNOWN_INT
+};
+
 /**
  * struct thc_device - THC private device struct
  * @thc_regmap: MMIO regmap structure for accessing THC registers
@@ -71,5 +96,7 @@ int thc_interrupt_quiesce(const struct thc_device *dev, bool int_quiesce);
 void thc_ltr_config(struct thc_device *dev, u32 active_ltr_us, u32 lp_ltr_us);
 void thc_change_ltr_mode(struct thc_device *dev, u32 ltr_mode);
 void thc_ltr_unconfig(struct thc_device *dev);
+u32 thc_int_cause_read(struct thc_device *dev);
+int thc_interrupt_handler(struct thc_device *dev);
 
 #endif /* _INTEL_THC_DEV_H_ */
-- 
2.40.1


