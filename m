Return-Path: <linux-input+bounces-8929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1E4A01D87
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A65416334F
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911621D61AC;
	Mon,  6 Jan 2025 02:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVe8koD9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2466919049B;
	Mon,  6 Jan 2025 02:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130760; cv=none; b=oRZlkoE0k09Hfa6OAlGOoLCZMx2Pk3AWQWlsjJc7aMRrLLQj0mU78uIaMclNOHK9nzfGaTZjcjP7vW2qyHOCQEpfeDsAjx4swuQezioZMjwda+GrabN6PXtKQMLjrJqfGOprmgttwmcv/2Mm+CUdtelihvsQvDHLmIRmVicAizE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130760; c=relaxed/simple;
	bh=E0xPtFuU/7BK/qjPeWZ28YR2StocmmTUKaEgH9vXUsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BSKN7RXALVNaIDXEtUnahqYDv+squKrE+l40EJvYMk6kszRidbP89+oW+rZYgOar/mXXKrk/BnNVrB94QMSNot3fRmZfqkTjMO/s9YoAFX2UMMMGDGgcUYuqX90TwvvloT3qUDDIwYC5zSypjLiF59o1pVLpQGPp+Cfe2ttg5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVe8koD9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130758; x=1767666758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E0xPtFuU/7BK/qjPeWZ28YR2StocmmTUKaEgH9vXUsk=;
  b=IVe8koD9KFEqAKNUMP54GG7xbAEY3K4hofDc97dyC0K1oeEEs77JszQw
   BauA96b0AliJxMCFePEmfzgoK5w8E7gEiYzvXHQRnrMmMzeA1/86YslHg
   t85BPgCLL+ehcr769hJntn1huZIiZueHaC4MaAjz+1MD7Nwb0f45ffGzo
   RnzghjNYcnubbNnyJFjyL1gPU1ICZvE9s2a+7qsQYwfJVc6D+kzJLae0B
   ZU1+If18qlV8Ml8Du3+4cwvr2Z3md6Z8vob7WTB0gtgPFtsvVck1EuXp8
   UiI09msg2BEXtEdjlY4Gwdb0xVtWDV1Q7xLR76KLEXWD1rziT0aS9fx+M
   Q==;
X-CSE-ConnectionGUID: bMbFw3alQWSXLuwmMXHsug==
X-CSE-MsgGUID: x3CaTtBgQxKy6hs0F/al+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171505"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171505"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:32:37 -0800
X-CSE-ConnectionGUID: rqBlmoWVQ0y2/j5hEOuBNA==
X-CSE-MsgGUID: 8FjS9JLtTFGFhssllDtMpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125596010"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:32:34 -0800
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
Subject: [PATCH v4 09/22] HID: intel-thc-hid: intel-thc: Add THC SPI config interfaces
Date: Mon,  6 Jan 2025 10:31:38 +0800
Message-Id: <20250106023151.3011329-10-even.xu@intel.com>
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

Add SPI bus related APIs to configure SPI operation parameters,
such as port type, bus frequency, bus IO mode, read/write OPcode,
and slave register addresses.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 229 ++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |   7 +
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  52 ++++
 3 files changed, 288 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 99dbaeef041c..8a439eb120b5 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1061,6 +1061,235 @@ int thc_interrupt_handler(struct thc_device *dev)
 }
 EXPORT_SYMBOL_NS_GPL(thc_interrupt_handler, "INTEL_THC");
 
+/**
+ * thc_port_select - Set THC port type
+ *
+ * @dev: The pointer of THC private device context
+ * @port_type: THC port type to use for current device
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_port_select(struct thc_device *dev, enum thc_port_type port_type)
+{
+	u32 ctrl, mask;
+
+	if (port_type == THC_PORT_TYPE_SPI) {
+		dev_dbg(dev->dev, "Set THC port type to SPI\n");
+		dev->port_type = THC_PORT_TYPE_SPI;
+
+		/* Enable delay of CS assertion and set to default value */
+		ctrl = THC_M_PRT_SPI_DUTYC_CFG_SPI_CSA_CK_DELAY_EN |
+		       FIELD_PREP(THC_M_PRT_SPI_DUTYC_CFG_SPI_CSA_CK_DELAY_VAL,
+				  THC_CSA_CK_DELAY_VAL_DEFAULT);
+		mask = THC_M_PRT_SPI_DUTYC_CFG_SPI_CSA_CK_DELAY_EN |
+		       THC_M_PRT_SPI_DUTYC_CFG_SPI_CSA_CK_DELAY_VAL;
+		regmap_write_bits(dev->thc_regmap, THC_M_PRT_SPI_DUTYC_CFG_OFFSET,
+				  mask, ctrl);
+	} else if (port_type == THC_PORT_TYPE_I2C) {
+		dev_dbg(dev->dev, "Set THC port type to I2C\n");
+		dev->port_type = THC_PORT_TYPE_I2C;
+
+		/* Set THC transition arbitration policy to frame boundary for I2C */
+		ctrl = FIELD_PREP(THC_M_PRT_CONTROL_THC_ARB_POLICY,
+				  THC_ARB_POLICY_FRAME_BOUNDARY);
+		mask = THC_M_PRT_CONTROL_THC_ARB_POLICY;
+
+		regmap_write_bits(dev->thc_regmap, THC_M_PRT_CONTROL_OFFSET, mask, ctrl);
+	} else {
+		dev_err(dev->dev, "unsupported THC port type: %d\n", port_type);
+		return -EINVAL;
+	}
+
+	ctrl = FIELD_PREP(THC_M_PRT_CONTROL_PORT_TYPE, port_type);
+	mask = THC_M_PRT_CONTROL_PORT_TYPE;
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_CONTROL_OFFSET, mask, ctrl);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_port_select, "INTEL_THC");
+
+#define THC_SPI_FREQUENCY_7M	7812500
+#define THC_SPI_FREQUENCY_15M	15625000
+#define THC_SPI_FREQUENCY_17M	17857100
+#define THC_SPI_FREQUENCY_20M	20833000
+#define THC_SPI_FREQUENCY_25M	25000000
+#define THC_SPI_FREQUENCY_31M	31250000
+#define THC_SPI_FREQUENCY_41M	41666700
+
+#define THC_SPI_LOW_FREQUENCY	THC_SPI_FREQUENCY_17M
+
+static u8 thc_get_spi_freq_div_val(struct thc_device *dev, u32 spi_freq_val)
+{
+	int frequency[] = {
+		THC_SPI_FREQUENCY_7M,
+		THC_SPI_FREQUENCY_15M,
+		THC_SPI_FREQUENCY_17M,
+		THC_SPI_FREQUENCY_20M,
+		THC_SPI_FREQUENCY_25M,
+		THC_SPI_FREQUENCY_31M,
+		THC_SPI_FREQUENCY_41M,
+	};
+	u8 frequency_div[] = {
+		THC_SPI_FRQ_DIV_2,
+		THC_SPI_FRQ_DIV_1,
+		THC_SPI_FRQ_DIV_7,
+		THC_SPI_FRQ_DIV_6,
+		THC_SPI_FRQ_DIV_5,
+		THC_SPI_FRQ_DIV_4,
+		THC_SPI_FRQ_DIV_3,
+	};
+	int size = ARRAY_SIZE(frequency);
+	u32 closest_freq;
+	u8 freq_div;
+	int i;
+
+	for (i = size - 1; i >= 0; i--)
+		if ((int)spi_freq_val - frequency[i] >= 0)
+			break;
+
+	if (i < 0) {
+		dev_err_once(dev->dev, "Not supported SPI frequency %d\n", spi_freq_val);
+		return THC_SPI_FRQ_RESERVED;
+	}
+
+	closest_freq = frequency[i];
+	freq_div = frequency_div[i];
+
+	dev_dbg(dev->dev,
+		"Setting SPI frequency: spi_freq_val = %u, Closest freq = %u\n",
+		spi_freq_val, closest_freq);
+
+	return freq_div;
+}
+
+/**
+ * thc_spi_read_config - Configure SPI bus read attributes
+ *
+ * @dev: The pointer of THC private device context
+ * @spi_freq_val: SPI read frequecy value
+ * @io_mode: SPI read IO mode
+ * @opcode: Read opcode
+ * @spi_rd_mps: SPI read max packet size
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_spi_read_config(struct thc_device *dev, u32 spi_freq_val,
+			u32 io_mode, u32 opcode, u32 spi_rd_mps)
+{
+	bool is_low_freq = false;
+	u32 cfg, mask;
+	u8 freq_div;
+
+	freq_div = thc_get_spi_freq_div_val(dev, spi_freq_val);
+	if (freq_div == THC_SPI_FRQ_RESERVED)
+		return -EINVAL;
+
+	if (spi_freq_val < THC_SPI_LOW_FREQUENCY)
+		is_low_freq = true;
+
+	cfg = FIELD_PREP(THC_M_PRT_SPI_CFG_SPI_TCRF, freq_div) |
+	      FIELD_PREP(THC_M_PRT_SPI_CFG_SPI_TRMODE, io_mode) |
+	      (is_low_freq ? THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN : 0) |
+	      FIELD_PREP(THC_M_PRT_SPI_CFG_SPI_RD_MPS, spi_rd_mps);
+	mask = THC_M_PRT_SPI_CFG_SPI_TCRF |
+	       THC_M_PRT_SPI_CFG_SPI_TRMODE |
+	       THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN |
+	       THC_M_PRT_SPI_CFG_SPI_RD_MPS;
+
+	regmap_write_bits(dev->thc_regmap,
+			  THC_M_PRT_SPI_CFG_OFFSET, mask, cfg);
+
+	if (io_mode == THC_QUAD_IO)
+		opcode = FIELD_PREP(THC_M_PRT_SPI_ICRRD_OPCODE_SPI_QIO, opcode);
+	else if (io_mode == THC_DUAL_IO)
+		opcode = FIELD_PREP(THC_M_PRT_SPI_ICRRD_OPCODE_SPI_DIO, opcode);
+	else
+		opcode = FIELD_PREP(THC_M_PRT_SPI_ICRRD_OPCODE_SPI_SIO, opcode);
+
+	regmap_write(dev->thc_regmap, THC_M_PRT_SPI_ICRRD_OPCODE_OFFSET, opcode);
+	regmap_write(dev->thc_regmap, THC_M_PRT_SPI_DMARD_OPCODE_OFFSET, opcode);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_spi_read_config, "INTEL_THC");
+
+/**
+ * thc_spi_write_config - Configure SPI bus write attributes
+ *
+ * @dev: The pointer of THC private device context
+ * @spi_freq_val: SPI write frequecy value
+ * @io_mode: SPI write IO mode
+ * @opcode: Write opcode
+ * @spi_wr_mps: SPI write max packet size
+ * @perf_limit: Performance limitation in unit of 10us
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_spi_write_config(struct thc_device *dev, u32 spi_freq_val,
+			 u32 io_mode, u32 opcode, u32 spi_wr_mps,
+			 u32 perf_limit)
+{
+	bool is_low_freq = false;
+	u32 cfg, mask;
+	u8 freq_div;
+
+	freq_div = thc_get_spi_freq_div_val(dev, spi_freq_val);
+	if (freq_div == THC_SPI_FRQ_RESERVED)
+		return -EINVAL;
+
+	if (spi_freq_val < THC_SPI_LOW_FREQUENCY)
+		is_low_freq = true;
+
+	cfg = FIELD_PREP(THC_M_PRT_SPI_CFG_SPI_TCWF, freq_div) |
+	      FIELD_PREP(THC_M_PRT_SPI_CFG_SPI_TWMODE, io_mode) |
+	      (is_low_freq ? THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN : 0) |
+	      FIELD_PREP(THC_M_PRT_SPI_CFG_SPI_WR_MPS, spi_wr_mps);
+	mask = THC_M_PRT_SPI_CFG_SPI_TCWF |
+	       THC_M_PRT_SPI_CFG_SPI_TWMODE |
+	       THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN |
+	       THC_M_PRT_SPI_CFG_SPI_WR_MPS;
+
+	regmap_write_bits(dev->thc_regmap,
+			  THC_M_PRT_SPI_CFG_OFFSET, mask, cfg);
+
+	if (io_mode == THC_QUAD_IO)
+		opcode = FIELD_PREP(THC_M_PRT_SPI_ICRRD_OPCODE_SPI_QIO, opcode);
+	else if (io_mode == THC_DUAL_IO)
+		opcode = FIELD_PREP(THC_M_PRT_SPI_ICRRD_OPCODE_SPI_DIO, opcode);
+	else
+		opcode = FIELD_PREP(THC_M_PRT_SPI_ICRRD_OPCODE_SPI_SIO, opcode);
+
+	regmap_write(dev->thc_regmap, THC_M_PRT_SPI_WR_OPCODE_OFFSET, opcode);
+
+	dev->perf_limit = perf_limit;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_spi_write_config, "INTEL_THC");
+
+/**
+ * thc_spi_input_output_address_config - Configure SPI input and output addresses
+ *
+ * @dev: the pointer of THC private device context
+ * @input_hdr_addr: input report header address
+ * @input_bdy_addr: input report body address
+ * @output_addr: output report address
+ */
+void thc_spi_input_output_address_config(struct thc_device *dev, u32 input_hdr_addr,
+					 u32 input_bdy_addr, u32 output_addr)
+{
+	regmap_write(dev->thc_regmap,
+		     THC_M_PRT_DEV_INT_CAUSE_ADDR_OFFSET, input_hdr_addr);
+	regmap_write(dev->thc_regmap,
+		     THC_M_PRT_RD_BULK_ADDR_1_OFFSET, input_bdy_addr);
+	regmap_write(dev->thc_regmap,
+		     THC_M_PRT_RD_BULK_ADDR_2_OFFSET, input_bdy_addr);
+	regmap_write(dev->thc_regmap,
+		     THC_M_PRT_WR_BULK_ADDR_OFFSET, output_addr);
+}
+EXPORT_SYMBOL_NS_GPL(thc_spi_input_output_address_config, "INTEL_THC");
+
 MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
 MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
 
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index d34fab243fdc..925355f19bae 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -98,5 +98,12 @@ void thc_change_ltr_mode(struct thc_device *dev, u32 ltr_mode);
 void thc_ltr_unconfig(struct thc_device *dev);
 u32 thc_int_cause_read(struct thc_device *dev);
 int thc_interrupt_handler(struct thc_device *dev);
+int thc_port_select(struct thc_device *dev, enum thc_port_type port_type);
+int thc_spi_read_config(struct thc_device *dev, u32 spi_freq_val,
+			u32 io_mode, u32 opcode, u32 spi_rd_mps);
+int thc_spi_write_config(struct thc_device *dev, u32 spi_freq_val,
+			 u32 io_mode, u32 opcode, u32 spi_wr_mps, u32 perf_limit);
+void thc_spi_input_output_address_config(struct thc_device *dev, u32 input_hdr_addr,
+					 u32 input_bdy_addr, u32 output_addr);
 
 #endif /* _INTEL_THC_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
index fb9c60f87666..94b1ebe0b069 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
@@ -636,6 +636,20 @@
 
 #define THC_M_PRT_SW_DMA_PRD_TABLE_LEN_THC_M_PRT_SW_DMA_PRD_TABLE_LEN	GENMASK(23, 0)
 
+#define THC_M_PRT_SPI_DUTYC_CFG_SPI_CSA_CK_DELAY_VAL		GENMASK(3, 0)
+#define THC_M_PRT_SPI_DUTYC_CFG_SPI_CSA_CK_DELAY_EN		BIT(25)
+
+/* CS Assertion delay default value */
+#define THC_CSA_CK_DELAY_VAL_DEFAULT		4
+
+/* ARB policy definition */
+/* Arbiter switches on packet boundary */
+#define THC_ARB_POLICY_PACKET_BOUNDARY		0
+/* Arbiter switches on Micro Frame boundary */
+#define THC_ARB_POLICY_UFRAME_BOUNDARY		1
+/* Arbiter switches on Frame boundary */
+#define THC_ARB_POLICY_FRAME_BOUNDARY		2
+
 #define THC_REGMAP_POLLING_INTERVAL_US		10 /* 10us */
 #define THC_PIO_DONE_TIMEOUT_US			USEC_PER_SEC /* 1s */
 
@@ -697,4 +711,42 @@ enum thc_pio_opcode {
 	THC_PIO_OP_I2C_TIC_WRITE_AND_READ = 0x1C,
 };
 
+/**
+ * THC SPI IO mode
+ * @THC_SINGLE_IO: single IO mode, 1(opcode) - 1(address) - 1(data)
+ * @THC_DUAL_IO: dual IO mode, 1(opcode) - 2(address) - 2(data)
+ * @THC_QUAD_IO: quad IO mode, 1(opcode) - 4(address) - 4(data)
+ * @THC_QUAD_PARALLEL_IO: parallel quad IO mode, 4(opcode) - 4(address) - 4(data)
+ */
+enum thc_spi_iomode {
+	THC_SINGLE_IO = 0,
+	THC_DUAL_IO = 1,
+	THC_QUAD_IO = 2,
+	THC_QUAD_PARALLEL_IO = 3,
+};
+
+/**
+ * THC SPI frequency divider
+ *
+ * This DIV final value is determined by THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN bit.
+ * If THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN isn't be set, THC takes the DIV value directly;
+ * If THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN is set, THC takes the DIV value multiply by 8.
+ *
+ * For example, if THC input clock is 125MHz:
+ * When THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN isn't set, THC_SPI_FRQ_DIV_3 means DIV is 3,
+ * THC final clock is 125 / 3 = 41.667MHz;
+ * When THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN is set, THC_SPI_FRQ_DIV_3 means DIV is 3 * 8,
+ * THC final clock is 125 / (3 * 8) = 5.208MHz;
+ */
+enum thc_spi_frq_div {
+	THC_SPI_FRQ_RESERVED = 0,
+	THC_SPI_FRQ_DIV_1 = 1,
+	THC_SPI_FRQ_DIV_2 = 2,
+	THC_SPI_FRQ_DIV_3 = 3,
+	THC_SPI_FRQ_DIV_4 = 4,
+	THC_SPI_FRQ_DIV_5 = 5,
+	THC_SPI_FRQ_DIV_6 = 6,
+	THC_SPI_FRQ_DIV_7 = 7,
+};
+
 #endif /* _INTEL_THC_HW_H_  */
-- 
2.40.1


