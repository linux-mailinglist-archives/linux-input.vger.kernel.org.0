Return-Path: <linux-input+bounces-8582-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D139F27E3
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBE2B1657DF
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3747137750;
	Mon, 16 Dec 2024 01:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEkzqOq5"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFF084A2F;
	Mon, 16 Dec 2024 01:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313331; cv=none; b=TfnkRJy6mkcnMwlnIEna5vuGEYnfkrq5glbwcdbUu3V7RuNeFQAowxgyjd0z1pWlAMf7DpfsUDMB2Jg5i4QkGvbUyjyV8DxtrRBOKTAmxMdBHrgYJi0koiVv0WkFby2TBxRKlLsEMrFg0iAobkFY0YPNx6KUFTsbhaIMH3WH4Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313331; c=relaxed/simple;
	bh=ZTqupYNLBmFeS1Ol0b9p2hzpE52u7Cwg+rUOhYfn06E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OMoJGsXyFWqRZxaiL6VN2T98qBYOh2JIE+IPdq1B8Ewqso4sfGwh8xgjvsBNFHlsLo7ljTV5BMAg2KQIHCERBiGGCrG/20yU8wgfXlfDCX8pNa7aIKFuusasnHvmnlXp+8lR25HTryiUeY5vp2K0G/fnlA4Z59rHvwEqSWxD/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEkzqOq5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313329; x=1765849329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZTqupYNLBmFeS1Ol0b9p2hzpE52u7Cwg+rUOhYfn06E=;
  b=OEkzqOq5HhhSFTo8UcUza/DPOHuTjuE0ydL11tOcC018zszJLy+kE+JB
   zPRwYX5d0SRwGyW8nRIp8rlVD9NGWBNKgGJnaVfFrPW5LTK5Bi6iDWPoI
   7ov/RP6fi+XAknSwahTvY2dcX69VNJb/1nu2xk7GTFsNHyndcl5wsIYux
   4lKA3qzoD07aeH++RiWKKe0lsjRC7JhZ1SbEDfb1GcJXekK/YNIqyTNUY
   ivANM1A07UpPfSfDJ6zjvYDMU8KE5A8VyOjdPAHJ7WZrd20edewl91Tyt
   pOKfdL+GnOCP0mNwBr8tUZDbKVArbdLscwrHNnoHil74tRy74B0iX7urY
   g==;
X-CSE-ConnectionGUID: KZFMJo5KQ5mShop6L/i3kQ==
X-CSE-MsgGUID: JgEzhn5qQu6iQ2NG4XtVig==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34012981"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34012981"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:42:08 -0800
X-CSE-ConnectionGUID: 1T/vRRhCQhWfimp+/u0AqQ==
X-CSE-MsgGUID: OhXM4e0rT5qZShu4HXuJOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084201"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:42:05 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 06/22] HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
Date: Mon, 16 Dec 2024 09:41:11 +0800
Message-Id: <20241216014127.3722172-7-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241216014127.3722172-1-even.xu@intel.com>
References: <20241216014127.3722172-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As THC PIO only has 64 bytes FIFO length, THC DMAs are introduced to
send/recevie large data packets.

THC has three types of DMA channels: Read DMA channel (RxDMA), Write DMA
channel (TxDMA) and Software DMA (SWDMA).

In addition to basic DMA functions, THC RxDMA also includes an auto
hardware sequence which can handle external touch device's interrupt
automatically without software involved. THC RxDMA channel usually is
used for handling touch input reports.

THC TxDMA is very similar with general IO TxDMA, and usually is used
for sending command/request to exteranl touch device.

THC SWDMA can perform read, write followed by read operation
according to different configurations. Unlike RxDMA triggered by bus
activity, SWDMA can be triggered by SW driver at any time, for example:
- Retrieving an input report without interrupt
- Sending command followed by reading response

THC DMA operation flow includes 4 steps:
1. Allocate DMA buffers
2. Configure opcode, fill PRD table with DMA buffers, enable DMA channel
3. Wait for completion, read out DMA buffers and update buffer pointers
4. Stop DMA and release DMA buffers

THC Hardware layer driver provides APIs for all above DMA Steps.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-thc-hid/Makefile            |   1 +
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   |   8 +
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  18 +
 .../intel-thc-hid/intel-thc/intel-thc-dma.c   | 969 ++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dma.h   | 146 +++
 5 files changed, 1142 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h

diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index bebb60bedfeb..b9709cc5e9eb 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -7,5 +7,6 @@
 
 obj-$(CONFIG_INTEL_THC_HID) += intel-thc.o
 intel-thc-objs += intel-thc/intel-thc-dev.o
+intel-thc-objs += intel-thc/intel-thc-dma.o
 
 ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index e16810b2fb9d..4cb9ceaf395c 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -211,6 +211,14 @@ struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr)
 	thc_clear_state(thc_dev);
 
 	mutex_init(&thc_dev->thc_bus_lock);
+	init_waitqueue_head(&thc_dev->write_complete_wait);
+	init_waitqueue_head(&thc_dev->swdma_complete_wait);
+
+	thc_dev->dma_ctx = thc_dma_init(thc_dev);
+	if (!thc_dev->dma_ctx) {
+		dev_err_once(device, "DMA context init failed\n");
+		return ERR_PTR(-ENOMEM);
+	}
 
 	return thc_dev;
 }
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index bef48c25c195..f775b972b4f5 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -6,6 +6,9 @@
 
 #include <linux/cdev.h>
 #include <linux/mutex.h>
+#include <linux/workqueue.h>
+
+#include "intel-thc-dma.h"
 
 #define THC_REGMAP_COMMON_OFFSET  0x10
 #define THC_REGMAP_MMIO_OFFSET    0x1000
@@ -27,6 +30,12 @@ enum thc_port_type {
  * @thc_bus_lock: mutex locker for THC config
  * @port_type: port type of THC port instance
  * @pio_int_supported: PIO interrupt supported flag
+ * @dma_ctx: DMA specific data
+ * @write_complete_wait: signal event for DMA write complete
+ * @swdma_complete_wait: signal event for SWDMA sequence complete
+ * @write_done: bool value that indicates if DMA write is done
+ * @swdma_done: bool value that indicates if SWDMA swquence is done
+ * @perf_limit: the delay between read operation and write operation
  */
 struct thc_device {
 	struct device *dev;
@@ -35,6 +44,15 @@ struct thc_device {
 	struct mutex thc_bus_lock;
 	enum thc_port_type port_type;
 	bool pio_int_supported;
+
+	struct thc_dma_context *dma_ctx;
+
+	wait_queue_head_t write_complete_wait;
+	wait_queue_head_t swdma_complete_wait;
+	bool write_done;
+	bool swdma_done;
+
+	u32 perf_limit;
 };
 
 struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr);
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
new file mode 100644
index 000000000000..eb23bea77686
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
@@ -0,0 +1,969 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/overflow.h>
+#include <linux/regmap.h>
+#include <linux/scatterlist.h>
+
+#include "intel-thc-dev.h"
+#include "intel-thc-dma.h"
+#include "intel-thc-hw.h"
+
+static void dma_set_prd_base_addr(struct thc_device *dev, u64 physical_addr,
+				  struct thc_dma_configuration *dma_config)
+{
+	u32 addr_high, addr_low;
+
+	if (!dma_config->is_enabled)
+		return;
+
+	addr_high = upper_32_bits(physical_addr);
+	addr_low = lower_32_bits(physical_addr);
+
+	regmap_write(dev->thc_regmap, dma_config->prd_base_addr_high, addr_high);
+	regmap_write(dev->thc_regmap, dma_config->prd_base_addr_low, addr_low);
+}
+
+static void dma_set_start_bit(struct thc_device *dev,
+			      struct thc_dma_configuration *dma_config)
+{
+	u32 ctrl, mask, mbits, data, offset;
+
+	if (!dma_config->is_enabled)
+		return;
+
+	switch (dma_config->dma_channel) {
+	case THC_RXDMA1:
+	case THC_RXDMA2:
+		if (dma_config->dma_channel == THC_RXDMA2) {
+			mbits = FIELD_PREP(THC_M_PRT_DEVINT_CFG_1_THC_M_PRT_INTTYP_DATA_VAL,
+					   THC_BITMASK_INTERRUPT_TYPE_DATA);
+			mask = THC_M_PRT_DEVINT_CFG_1_THC_M_PRT_INTTYP_DATA_VAL;
+			regmap_write_bits(dev->thc_regmap,
+					  THC_M_PRT_DEVINT_CFG_1_OFFSET, mask, mbits);
+		}
+
+		mbits = THC_M_PRT_READ_DMA_CNTRL_IE_EOF |
+			THC_M_PRT_READ_DMA_CNTRL_SOO |
+			THC_M_PRT_READ_DMA_CNTRL_IE_STALL |
+			THC_M_PRT_READ_DMA_CNTRL_IE_ERROR |
+			THC_M_PRT_READ_DMA_CNTRL_START;
+
+		mask = THC_M_PRT_READ_DMA_CNTRL_TPCWP | mbits;
+		mask |= THC_M_PRT_READ_DMA_CNTRL_INT_SW_DMA_EN;
+		ctrl = FIELD_PREP(THC_M_PRT_READ_DMA_CNTRL_TPCWP, THC_POINTER_WRAPAROUND) | mbits;
+		offset = dma_config->dma_channel == THC_RXDMA1 ?
+			 THC_M_PRT_READ_DMA_CNTRL_1_OFFSET : THC_M_PRT_READ_DMA_CNTRL_2_OFFSET;
+		regmap_write_bits(dev->thc_regmap, offset, mask, ctrl);
+		break;
+
+	case THC_SWDMA:
+		mbits = THC_M_PRT_READ_DMA_CNTRL_IE_DMACPL |
+			THC_M_PRT_READ_DMA_CNTRL_IE_IOC |
+			THC_M_PRT_READ_DMA_CNTRL_SOO |
+			THC_M_PRT_READ_DMA_CNTRL_START;
+
+		mask = THC_M_PRT_READ_DMA_CNTRL_TPCWP | mbits;
+		ctrl = FIELD_PREP(THC_M_PRT_READ_DMA_CNTRL_TPCWP, THC_POINTER_WRAPAROUND) | mbits;
+		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_SW_OFFSET,
+				  mask, ctrl);
+		break;
+
+	case THC_TXDMA:
+		regmap_write_bits(dev->thc_regmap, THC_M_PRT_WRITE_INT_STS_OFFSET,
+				  THC_M_PRT_WRITE_INT_STS_THC_WRDMA_CMPL_STATUS,
+				  THC_M_PRT_WRITE_INT_STS_THC_WRDMA_CMPL_STATUS);
+
+		/* Select interrupt or polling method upon Write completion */
+		if (dev->dma_ctx->use_write_interrupts)
+			data = THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC_DMACPL;
+		else
+			data = 0;
+
+		data |= THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_START;
+		mask = THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC_DMACPL |
+		       THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_START;
+		regmap_write_bits(dev->thc_regmap, THC_M_PRT_WRITE_DMA_CNTRL_OFFSET,
+				  mask, data);
+		break;
+
+	default:
+		break;
+	}
+}
+
+static void dma_set_prd_control(struct thc_device *dev, u8 entry_count, u8 cb_depth,
+				struct thc_dma_configuration *dma_config)
+{
+	u32 ctrl, mask;
+
+	if (!dma_config->is_enabled)
+		return;
+
+	if (dma_config->dma_channel == THC_TXDMA) {
+		mask = THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_PTEC;
+		ctrl = FIELD_PREP(THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_PTEC, entry_count);
+	} else {
+		mask = THC_M_PRT_RPRD_CNTRL_PTEC | THC_M_PRT_RPRD_CNTRL_PCD;
+		ctrl = FIELD_PREP(THC_M_PRT_RPRD_CNTRL_PTEC, entry_count) |
+		       FIELD_PREP(THC_M_PRT_RPRD_CNTRL_PCD, cb_depth);
+	}
+
+	regmap_write_bits(dev->thc_regmap, dma_config->prd_cntrl, mask, ctrl);
+}
+
+static void dma_clear_prd_control(struct thc_device *dev,
+				  struct thc_dma_configuration *dma_config)
+{
+	u32 mask;
+
+	if (!dma_config->is_enabled)
+		return;
+
+	if (dma_config->dma_channel == THC_TXDMA)
+		mask = THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_PTEC;
+	else
+		mask = THC_M_PRT_RPRD_CNTRL_PTEC | THC_M_PRT_RPRD_CNTRL_PCD;
+
+	regmap_write_bits(dev->thc_regmap, dma_config->prd_cntrl, mask, 0);
+}
+
+static u8 dma_get_read_pointer(struct thc_device *dev,
+			       struct thc_dma_configuration *dma_config)
+{
+	u32 ctrl, read_pointer;
+
+	regmap_read(dev->thc_regmap, dma_config->dma_cntrl, &ctrl);
+	read_pointer = FIELD_GET(THC_M_PRT_READ_DMA_CNTRL_TPCRP, ctrl);
+
+	dev_dbg(dev->dev, "THC_M_PRT_READ_DMA_CNTRL 0x%x offset 0x%x TPCRP 0x%x\n",
+		ctrl, dma_config->dma_cntrl, read_pointer);
+
+	return read_pointer;
+}
+
+static u8 dma_get_write_pointer(struct thc_device *dev,
+				struct thc_dma_configuration *dma_config)
+{
+	u32 ctrl, write_pointer;
+
+	regmap_read(dev->thc_regmap, dma_config->dma_cntrl, &ctrl);
+	write_pointer = FIELD_GET(THC_M_PRT_READ_DMA_CNTRL_TPCWP, ctrl);
+
+	dev_dbg(dev->dev, "THC_M_PRT_READ_DMA_CNTRL 0x%x offset 0x%x TPCWP 0x%x\n",
+		ctrl, dma_config->dma_cntrl, write_pointer);
+
+	return write_pointer;
+}
+
+static void dma_set_write_pointer(struct thc_device *dev, u8 value,
+				  struct thc_dma_configuration *dma_config)
+{
+	u32 ctrl, mask;
+
+	mask = THC_M_PRT_READ_DMA_CNTRL_TPCWP;
+	ctrl = FIELD_PREP(THC_M_PRT_READ_DMA_CNTRL_TPCWP, value);
+	regmap_write_bits(dev->thc_regmap, dma_config->dma_cntrl, mask, ctrl);
+}
+
+static size_t dma_get_max_packet_size(struct thc_device *dev,
+				      struct thc_dma_configuration *dma_config)
+{
+	return dma_config->max_packet_size;
+}
+
+static void dma_set_max_packet_size(struct thc_device *dev, size_t size,
+				    struct thc_dma_configuration *dma_config)
+{
+	if (size) {
+		dma_config->max_packet_size = ALIGN(size, SZ_4K);
+		dma_config->is_enabled = true;
+	}
+}
+
+static void thc_copy_one_sgl_to_prd(struct thc_device *dev,
+				    struct thc_dma_configuration *config,
+				    unsigned int ind)
+{
+	struct thc_prd_table *prd_tbl;
+	struct scatterlist *sg;
+	int j;
+
+	prd_tbl = &config->prd_tbls[ind];
+
+	for_each_sg(config->sgls[ind], sg, config->sgls_nent[ind], j) {
+		prd_tbl->entries[j].dest_addr =
+				sg_dma_address(sg) >> THC_ADDRESS_SHIFT;
+		prd_tbl->entries[j].len = sg_dma_len(sg);
+		prd_tbl->entries[j].hw_status = 0;
+		prd_tbl->entries[j].end_of_prd = 0;
+	}
+
+	/* Set the end_of_prd flag in the last filled entry */
+	if (j > 0)
+		prd_tbl->entries[j - 1].end_of_prd = 1;
+}
+
+static void thc_copy_sgls_to_prd(struct thc_device *dev,
+				 struct thc_dma_configuration *config)
+{
+	unsigned int i;
+
+	memset(config->prd_tbls, 0, array_size(PRD_TABLE_SIZE, config->prd_tbl_num));
+
+	for (i = 0; i < config->prd_tbl_num; i++)
+		thc_copy_one_sgl_to_prd(dev, config, i);
+}
+
+static int setup_dma_buffers(struct thc_device *dev,
+			     struct thc_dma_configuration *config,
+			     enum dma_data_direction dir)
+{
+	size_t prd_tbls_size = array_size(PRD_TABLE_SIZE, config->prd_tbl_num);
+	unsigned int i, nent = PRD_ENTRIES_NUM;
+	dma_addr_t dma_handle;
+	void *cpu_addr;
+	size_t buf_sz;
+	int count;
+
+	if (!config->is_enabled)
+		return 0;
+
+	memset(config->sgls, 0, sizeof(config->sgls));
+	memset(config->sgls_nent, 0, sizeof(config->sgls_nent));
+
+	cpu_addr = dma_alloc_coherent(dev->dev, prd_tbls_size,
+				      &dma_handle, GFP_KERNEL);
+	if (!cpu_addr)
+		return -ENOMEM;
+
+	config->prd_tbls = cpu_addr;
+	config->prd_tbls_dma_handle = dma_handle;
+
+	buf_sz = dma_get_max_packet_size(dev, config);
+
+	/* Allocate and map the scatter-gather lists, one for each PRD table */
+	for (i = 0; i < config->prd_tbl_num; i++) {
+		config->sgls[i] = sgl_alloc(buf_sz, GFP_KERNEL, &nent);
+		if (!config->sgls[i] || nent > PRD_ENTRIES_NUM) {
+			dev_err_once(dev->dev, "sgl_alloc (%uth) failed, nent %u\n",
+				     i, nent);
+			return -ENOMEM;
+		}
+		count = dma_map_sg(dev->dev, config->sgls[i], nent, dir);
+
+		config->sgls_nent[i] = count;
+	}
+
+	thc_copy_sgls_to_prd(dev, config);
+
+	return 0;
+}
+
+static void thc_reset_dma_settings(struct thc_device *dev)
+{
+	/* Stop all DMA channels and reset DMA read pointers */
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_START, 0);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_2_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_START, 0);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_SW_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_START, 0);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_WRITE_DMA_CNTRL_OFFSET,
+			  THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_START, 0);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_TPCPR,
+			  THC_M_PRT_READ_DMA_CNTRL_TPCPR);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_2_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_TPCPR,
+			  THC_M_PRT_READ_DMA_CNTRL_TPCPR);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_SW_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_TPCPR,
+			  THC_M_PRT_READ_DMA_CNTRL_TPCPR);
+}
+
+static void release_dma_buffers(struct thc_device *dev,
+				struct thc_dma_configuration *config)
+{
+	size_t prd_tbls_size = array_size(PRD_TABLE_SIZE, config->prd_tbl_num);
+	unsigned int i;
+
+	if (!config->is_enabled)
+		return;
+
+	for (i = 0; i < config->prd_tbl_num; i++) {
+		if (!config->sgls[i] | !config->sgls_nent[i])
+			continue;
+
+		dma_unmap_sg(dev->dev, config->sgls[i],
+			     config->sgls_nent[i],
+			     config->dir);
+
+		sgl_free(config->sgls[i]);
+		config->sgls[i] = NULL;
+	}
+
+	memset(config->prd_tbls, 0, prd_tbls_size);
+
+	if (config->prd_tbls) {
+		dma_free_coherent(dev->dev, prd_tbls_size, config->prd_tbls,
+				  config->prd_tbls_dma_handle);
+		config->prd_tbls = NULL;
+		config->prd_tbls_dma_handle = 0;
+	}
+}
+
+struct thc_dma_context *thc_dma_init(struct thc_device *dev)
+{
+	struct thc_dma_context *dma_ctx;
+
+	dma_ctx = devm_kzalloc(dev->dev, sizeof(*dma_ctx), GFP_KERNEL);
+	if (!dma_ctx)
+		return NULL;
+
+	dev->dma_ctx = dma_ctx;
+
+	dma_ctx->dma_config[THC_RXDMA1].dma_channel = THC_RXDMA1;
+	dma_ctx->dma_config[THC_RXDMA2].dma_channel = THC_RXDMA2;
+	dma_ctx->dma_config[THC_TXDMA].dma_channel = THC_TXDMA;
+	dma_ctx->dma_config[THC_SWDMA].dma_channel = THC_SWDMA;
+
+	dma_ctx->dma_config[THC_RXDMA1].dir = DMA_FROM_DEVICE;
+	dma_ctx->dma_config[THC_RXDMA2].dir = DMA_FROM_DEVICE;
+	dma_ctx->dma_config[THC_TXDMA].dir = DMA_TO_DEVICE;
+	dma_ctx->dma_config[THC_SWDMA].dir = DMA_FROM_DEVICE;
+
+	dma_ctx->dma_config[THC_RXDMA1].prd_tbl_num = PRD_TABLES_NUM;
+	dma_ctx->dma_config[THC_RXDMA2].prd_tbl_num = PRD_TABLES_NUM;
+	dma_ctx->dma_config[THC_TXDMA].prd_tbl_num = 1;
+	dma_ctx->dma_config[THC_SWDMA].prd_tbl_num = 1;
+
+	dma_ctx->dma_config[THC_RXDMA1].prd_base_addr_high = THC_M_PRT_RPRD_BA_HI_1_OFFSET;
+	dma_ctx->dma_config[THC_RXDMA2].prd_base_addr_high = THC_M_PRT_RPRD_BA_HI_2_OFFSET;
+	dma_ctx->dma_config[THC_TXDMA].prd_base_addr_high = THC_M_PRT_WPRD_BA_HI_OFFSET;
+	dma_ctx->dma_config[THC_SWDMA].prd_base_addr_high = THC_M_PRT_RPRD_BA_HI_SW_OFFSET;
+
+	dma_ctx->dma_config[THC_RXDMA1].prd_base_addr_low = THC_M_PRT_RPRD_BA_LOW_1_OFFSET;
+	dma_ctx->dma_config[THC_RXDMA2].prd_base_addr_low = THC_M_PRT_RPRD_BA_LOW_2_OFFSET;
+	dma_ctx->dma_config[THC_TXDMA].prd_base_addr_low = THC_M_PRT_WPRD_BA_LOW_OFFSET;
+	dma_ctx->dma_config[THC_SWDMA].prd_base_addr_low = THC_M_PRT_RPRD_BA_LOW_SW_OFFSET;
+
+	dma_ctx->dma_config[THC_RXDMA1].prd_cntrl = THC_M_PRT_RPRD_CNTRL_1_OFFSET;
+	dma_ctx->dma_config[THC_RXDMA2].prd_cntrl = THC_M_PRT_RPRD_CNTRL_2_OFFSET;
+	dma_ctx->dma_config[THC_TXDMA].prd_cntrl = THC_M_PRT_WRITE_DMA_CNTRL_OFFSET;
+	dma_ctx->dma_config[THC_SWDMA].prd_cntrl = THC_M_PRT_RPRD_CNTRL_SW_OFFSET;
+
+	dma_ctx->dma_config[THC_RXDMA1].dma_cntrl = THC_M_PRT_READ_DMA_CNTRL_1_OFFSET;
+	dma_ctx->dma_config[THC_RXDMA2].dma_cntrl = THC_M_PRT_READ_DMA_CNTRL_2_OFFSET;
+	dma_ctx->dma_config[THC_TXDMA].dma_cntrl = THC_M_PRT_WRITE_DMA_CNTRL_OFFSET;
+	dma_ctx->dma_config[THC_SWDMA].dma_cntrl = THC_M_PRT_READ_DMA_CNTRL_SW_OFFSET;
+
+	/* Enable write DMA completion interrupt by default */
+	dma_ctx->use_write_interrupts = 1;
+
+	return dma_ctx;
+}
+
+/**
+ * thc_dma_set_max_packet_sizes - Set max packet sizes for all DMA engines
+ *
+ * @dev: The pointer of THC private device context
+ * @mps_read1: RxDMA1 max packet size
+ * @mps_read2: RxDMA2 max packet size
+ * @mps_write: TxDMA max packet size
+ * @mps_swdma: Software DMA max packet size
+ *
+ * If mps is not 0, it means the corresponding DMA channel is used, then set
+ * the flag to turn on this channel.
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_dma_set_max_packet_sizes(struct thc_device *dev, size_t mps_read1,
+				 size_t mps_read2, size_t mps_write,
+				 size_t mps_swdma)
+{
+	if (!dev->dma_ctx) {
+		dev_err_once(dev->dev,
+			     "Cannot set max packet sizes because DMA context is NULL!\n");
+		return -EINVAL;
+	}
+
+	dma_set_max_packet_size(dev, mps_read1, &dev->dma_ctx->dma_config[THC_RXDMA1]);
+	dma_set_max_packet_size(dev, mps_read2, &dev->dma_ctx->dma_config[THC_RXDMA2]);
+	dma_set_max_packet_size(dev, mps_write, &dev->dma_ctx->dma_config[THC_TXDMA]);
+	dma_set_max_packet_size(dev, mps_swdma, &dev->dma_ctx->dma_config[THC_SWDMA]);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_dma_set_max_packet_sizes, "INTEL_THC");
+
+/**
+ * thc_dma_allocate - Allocate DMA buffers for all DMA engines
+ *
+ * @dev: The pointer of THC private device context
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_dma_allocate(struct thc_device *dev)
+{
+	int ret, chan;
+
+	for (chan = 0; chan < MAX_THC_DMA_CHANNEL; chan++) {
+		ret = setup_dma_buffers(dev, &dev->dma_ctx->dma_config[chan],
+					dev->dma_ctx->dma_config[chan].dir);
+		if (ret < 0) {
+			dev_err_once(dev->dev, "DMA setup failed for DMA channel %d\n", chan);
+			goto release_bufs;
+		}
+	}
+
+	return 0;
+
+release_bufs:
+	while (chan--)
+		release_dma_buffers(dev, &dev->dma_ctx->dma_config[chan]);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(thc_dma_allocate, "INTEL_THC");
+
+/**
+ * thc_dma_release - Release DMA buffers for all DMA engines
+ *
+ * @dev: The pointer of THC private device context
+ */
+void thc_dma_release(struct thc_device *dev)
+{
+	int chan;
+
+	for (chan = 0; chan < MAX_THC_DMA_CHANNEL; chan++)
+		release_dma_buffers(dev, &dev->dma_ctx->dma_config[chan]);
+}
+EXPORT_SYMBOL_NS_GPL(thc_dma_release, "INTEL_THC");
+
+static int calc_prd_entries_num(struct thc_prd_table *prd_tbl,
+				size_t mes_len, u8 *nent)
+{
+	*nent = DIV_ROUND_UP(mes_len, THC_MIN_BYTES_PER_SG_LIST_ENTRY);
+	if (*nent > PRD_ENTRIES_NUM)
+		return -EMSGSIZE;
+
+	return 0;
+}
+
+static size_t calc_message_len(struct thc_prd_table *prd_tbl, u8 *nent)
+{
+	size_t mes_len = 0;
+	unsigned int j;
+
+	for (j = 0; j < PRD_ENTRIES_NUM; j++) {
+		mes_len += prd_tbl->entries[j].len;
+		if (prd_tbl->entries[j].end_of_prd)
+			break;
+	}
+
+	*nent = j + 1;
+
+	return mes_len;
+}
+
+/**
+ * thc_dma_configure - Configure DMA settings for all DMA engines
+ *
+ * @dev: The pointer of THC private device context
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_dma_configure(struct thc_device *dev)
+{
+	struct thc_dma_context *dma_ctx = dev->dma_ctx;
+	int chan;
+
+	thc_reset_dma_settings(dev);
+
+	if (!dma_ctx) {
+		dev_err_once(dev->dev, "Cannot do DMA configure because DMA context is NULL\n");
+		return -EINVAL;
+	}
+
+	for (chan = 0; chan < MAX_THC_DMA_CHANNEL; chan++) {
+		dma_set_prd_base_addr(dev,
+				      dma_ctx->dma_config[chan].prd_tbls_dma_handle,
+				      &dma_ctx->dma_config[chan]);
+
+		dma_set_prd_control(dev, PRD_ENTRIES_NUM - 1,
+				    dma_ctx->dma_config[chan].prd_tbl_num - 1,
+				    &dma_ctx->dma_config[chan]);
+	}
+
+	/* Start read2 DMA engine */
+	dma_set_start_bit(dev, &dma_ctx->dma_config[THC_RXDMA2]);
+
+	dev_dbg(dev->dev, "DMA configured successfully!\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(thc_dma_configure, "INTEL_THC");
+
+/**
+ * thc_dma_unconfigure - Unconfigure DMA settings for all DMA engines
+ *
+ * @dev: The pointer of THC private device context
+ */
+void thc_dma_unconfigure(struct thc_device *dev)
+{
+	int chan;
+
+	for (chan = 0; chan < MAX_THC_DMA_CHANNEL; chan++) {
+		dma_set_prd_base_addr(dev, 0, &dev->dma_ctx->dma_config[chan]);
+		dma_clear_prd_control(dev, &dev->dma_ctx->dma_config[chan]);
+	}
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_START, 0);
+
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_2_OFFSET,
+			  THC_M_PRT_READ_DMA_CNTRL_START, 0);
+}
+EXPORT_SYMBOL_NS_GPL(thc_dma_unconfigure, "INTEL_THC");
+
+static int thc_wait_for_dma_pause(struct thc_device *dev, enum thc_dma_channel channel)
+{
+	u32 ctrl_reg, sts_reg, sts;
+	int ret;
+
+	ctrl_reg = (channel == THC_RXDMA1) ? THC_M_PRT_READ_DMA_CNTRL_1_OFFSET :
+			((channel == THC_RXDMA2) ? THC_M_PRT_READ_DMA_CNTRL_2_OFFSET :
+						   THC_M_PRT_READ_DMA_CNTRL_SW_OFFSET);
+
+	regmap_write_bits(dev->thc_regmap, ctrl_reg, THC_M_PRT_READ_DMA_CNTRL_START, 0);
+
+	sts_reg = (channel == THC_RXDMA1) ? THC_M_PRT_READ_DMA_INT_STS_1_OFFSET :
+			((channel == THC_RXDMA2) ? THC_M_PRT_READ_DMA_INT_STS_2_OFFSET :
+						   THC_M_PRT_READ_DMA_INT_STS_SW_OFFSET);
+
+	ret = regmap_read_poll_timeout(dev->thc_regmap, sts_reg, sts,
+				       !(sts & THC_M_PRT_READ_DMA_INT_STS_ACTIVE),
+				       THC_DEFAULT_RXDMA_POLLING_US_INTERVAL,
+				       THC_DEFAULT_RXDMA_POLLING_US_TIMEOUT);
+
+	if (ret) {
+		dev_err_once(dev->dev,
+			     "Timeout while waiting for DMA %d stop\n", channel);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int read_dma_buffer(struct thc_device *dev,
+			   struct thc_dma_configuration *read_config,
+			   u8 prd_table_index, void *read_buff)
+{
+	struct thc_prd_table *prd_tbl;
+	struct scatterlist *sg;
+	size_t mes_len, ret;
+	u8 nent;
+
+	if (prd_table_index >= read_config->prd_tbl_num) {
+		dev_err_once(dev->dev, "PRD table index %d too big\n", prd_table_index);
+		return -EINVAL;
+	}
+
+	prd_tbl = &read_config->prd_tbls[prd_table_index];
+	mes_len = calc_message_len(prd_tbl, &nent);
+	if (mes_len > read_config->max_packet_size) {
+		dev_err(dev->dev,
+			"Message length %zu is bigger than buffer length %lu\n",
+			mes_len, read_config->max_packet_size);
+		return -EMSGSIZE;
+	}
+
+	sg = read_config->sgls[prd_table_index];
+	ret = sg_copy_to_buffer(sg, nent, read_buff, mes_len);
+	if (ret != mes_len) {
+		dev_err_once(dev->dev, "Copied %zu bytes instead of requested %zu\n",
+			     ret, mes_len);
+		return -EIO;
+	}
+
+	return mes_len;
+}
+
+static void update_write_pointer(struct thc_device *dev,
+				 struct thc_dma_configuration *read_config)
+{
+	u8 write_ptr = dma_get_write_pointer(dev, read_config);
+
+	if (write_ptr + 1 == THC_WRAPAROUND_VALUE_ODD)
+		dma_set_write_pointer(dev, THC_POINTER_WRAPAROUND, read_config);
+	else if (write_ptr + 1 == THC_WRAPAROUND_VALUE_EVEN)
+		dma_set_write_pointer(dev, 0, read_config);
+	else
+		dma_set_write_pointer(dev, write_ptr + 1, read_config);
+}
+
+static int is_dma_buf_empty(struct thc_device *dev,
+			    struct thc_dma_configuration *read_config,
+			    u8 *read_ptr, u8 *write_ptr)
+{
+	*read_ptr = dma_get_read_pointer(dev, read_config);
+	*write_ptr = dma_get_write_pointer(dev, read_config);
+
+	if ((*read_ptr & THC_POINTER_MASK) == (*write_ptr & THC_POINTER_MASK))
+		if (*read_ptr != *write_ptr)
+			return true;
+
+	return false;
+}
+
+static int thc_dma_read(struct thc_device *dev,
+			struct thc_dma_configuration *read_config,
+			void *read_buff, size_t *read_len, int *read_finished)
+{
+	u8 read_ptr, write_ptr, prd_table_index;
+	int status;
+
+	if (!is_dma_buf_empty(dev, read_config, &read_ptr, &write_ptr)) {
+		prd_table_index = write_ptr & THC_POINTER_MASK;
+
+		status = read_dma_buffer(dev, read_config, prd_table_index, read_buff);
+		if (status <= 0) {
+			dev_err_once(dev->dev, "read DMA buffer failed %d\n", status);
+			return -EIO;
+		}
+
+		*read_len = status;
+
+		/* Clear the relevant PRD table */
+		thc_copy_one_sgl_to_prd(dev, read_config, prd_table_index);
+
+		/* Increment the write pointer to let the HW know we have processed this PRD */
+		update_write_pointer(dev, read_config);
+	}
+
+	/*
+	 * This function only reads one frame from PRD table for each call, so we need to
+	 * check if all DMAed data is read out and return the flag to the caller. Caller
+	 * should repeatedly call thc_dma_read() until all DMAed data is handled.
+	 */
+	if (read_finished)
+		*read_finished = is_dma_buf_empty(dev, read_config, &read_ptr, &write_ptr) ? 1 : 0;
+
+	return 0;
+}
+
+/**
+ * thc_rxdma_read - Read data from RXDMA buffer
+ *
+ * @dev: The pointer of THC private device context
+ * @dma_channel: The RXDMA engine of read data source
+ * @read_buff: The pointer of the read data buffer
+ * @read_len: The pointer of the read data length
+ * @read_finished: The pointer of the flag indicating if all pending data has been read out
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_rxdma_read(struct thc_device *dev, enum thc_dma_channel dma_channel,
+		   void *read_buff, size_t *read_len, int *read_finished)
+{
+	struct thc_dma_configuration *dma_config;
+	int ret;
+
+	dma_config = &dev->dma_ctx->dma_config[dma_channel];
+
+	if (!dma_config->is_enabled) {
+		dev_err_once(dev->dev, "The DMA channel %d is not enabled", dma_channel);
+		return -EINVAL;
+	}
+
+	if (!read_buff || !read_len) {
+		dev_err(dev->dev, "Invalid input parameters, read_buff %p, read_len %p\n",
+			read_buff, read_len);
+		return -EINVAL;
+	}
+
+	if (dma_channel >= THC_TXDMA) {
+		dev_err(dev->dev, "Unsupported DMA channel for RxDMA read, %d\n", dma_channel);
+		return -EINVAL;
+	}
+
+	ret = thc_dma_read(dev, dma_config, read_buff, read_len, read_finished);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(thc_rxdma_read, "INTEL_THC");
+
+static int thc_swdma_read_start(struct thc_device *dev, void *write_buff,
+				size_t write_len, u32 *prd_tbl_len)
+{
+	u32 mask, val, data0 = 0, data1 = 0;
+	int ret;
+
+	ret = thc_interrupt_quiesce(dev, true);
+	if (ret)
+		return ret;
+
+	if (thc_wait_for_dma_pause(dev, THC_RXDMA1) || thc_wait_for_dma_pause(dev, THC_RXDMA2))
+		return -EIO;
+
+	thc_reset_dma_settings(dev);
+
+	mask = THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_WBC |
+	       THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_RX_DLEN_EN;
+	val = FIELD_PREP(THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_WBC, write_len) |
+	      ((!prd_tbl_len) ? THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_RX_DLEN_EN : 0);
+	regmap_write_bits(dev->thc_regmap, THC_M_PRT_RPRD_CNTRL_SW_OFFSET,
+			  mask, val);
+
+	if (prd_tbl_len) {
+		mask = THC_M_PRT_SW_DMA_PRD_TABLE_LEN_THC_M_PRT_SW_DMA_PRD_TABLE_LEN;
+		val = FIELD_PREP(THC_M_PRT_SW_DMA_PRD_TABLE_LEN_THC_M_PRT_SW_DMA_PRD_TABLE_LEN,
+				 *prd_tbl_len);
+		regmap_write_bits(dev->thc_regmap, THC_M_PRT_SW_DMA_PRD_TABLE_LEN_OFFSET,
+				  mask, val);
+	}
+
+	if (write_len <= sizeof(u32)) {
+		for (int i = 0; i < write_len; i++)
+			data0 |= *(((u8 *)write_buff) + i) << (i * 8);
+
+		regmap_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_DATA0_ADDR_OFFSET, data0);
+	} else if (write_len <= 2 * sizeof(u32)) {
+		data0 = *(u32 *)write_buff;
+		regmap_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_DATA0_ADDR_OFFSET, data0);
+
+		for (int i = 0; i < write_len - sizeof(u32); i++)
+			data1 |= *(((u8 *)write_buff) + sizeof(u32) + i) << (i * 8);
+
+		regmap_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_DATA1_OFFSET, data1);
+	}
+	dma_set_start_bit(dev, &dev->dma_ctx->dma_config[THC_SWDMA]);
+
+	return 0;
+}
+
+static int thc_swdma_read_completion(struct thc_device *dev)
+{
+	int ret;
+
+	ret = thc_wait_for_dma_pause(dev, THC_SWDMA);
+	if (ret)
+		return ret;
+
+	thc_reset_dma_settings(dev);
+
+	dma_set_start_bit(dev, &dev->dma_ctx->dma_config[THC_RXDMA2]);
+
+	ret = thc_interrupt_quiesce(dev, false);
+
+	return ret;
+}
+
+/**
+ * thc_swdma_read - Use software DMA to read data from touch device
+ *
+ * @dev: The pointer of THC private device context
+ * @write_buff: The pointer of write buffer for SWDMA sequence
+ * @write_len: The write data length for SWDMA sequence
+ * @prd_tbl_len: The prd table length of SWDMA engine, can be set to NULL
+ * @read_buff: The pointer of the read data buffer
+ * @read_len: The pointer of the read data length
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_swdma_read(struct thc_device *dev, void *write_buff, size_t write_len,
+		   u32 *prd_tbl_len, void *read_buff, size_t *read_len)
+{
+	int ret;
+
+	if (!(&dev->dma_ctx->dma_config[THC_SWDMA])->is_enabled) {
+		dev_err_once(dev->dev, "The SWDMA channel is not enabled");
+		return -EINVAL;
+	}
+
+	if (!read_buff || !read_len) {
+		dev_err(dev->dev, "Invalid input parameters, read_buff %p, read_len %p\n",
+			read_buff, read_len);
+		return -EINVAL;
+	}
+
+	if (mutex_lock_interruptible(&dev->thc_bus_lock))
+		return -EINTR;
+
+	dev->swdma_done = false;
+
+	ret = thc_swdma_read_start(dev, write_buff, write_len, prd_tbl_len);
+	if (ret)
+		goto end;
+
+	ret = wait_event_interruptible_timeout(dev->swdma_complete_wait, dev->swdma_done, 1 * HZ);
+	if (ret <= 0 || !dev->swdma_done) {
+		dev_err_once(dev->dev, "timeout for waiting SWDMA completion\n");
+		ret = -ETIMEDOUT;
+		goto end;
+	}
+
+	ret = thc_dma_read(dev, &dev->dma_ctx->dma_config[THC_SWDMA], read_buff, read_len, NULL);
+	if (ret)
+		goto end;
+
+	ret = thc_swdma_read_completion(dev);
+
+end:
+	mutex_unlock(&dev->thc_bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(thc_swdma_read, "INTEL_THC");
+
+static int write_dma_buffer(struct thc_device *dev,
+			    void *buffer, size_t buf_len)
+{
+	struct thc_dma_configuration *write_config = &dev->dma_ctx->dma_config[THC_TXDMA];
+	struct thc_prd_table *prd_tbl;
+	struct scatterlist *sg;
+	unsigned long len_left;
+	size_t ret;
+	u8 nent;
+	int i;
+
+	/* There is only one PRD table for write */
+	prd_tbl = &write_config->prd_tbls[0];
+
+	if (calc_prd_entries_num(prd_tbl, buf_len, &nent) < 0) {
+		dev_err(dev->dev, "Tx message length too big (%zu)\n", buf_len);
+		return -EOVERFLOW;
+	}
+
+	sg = write_config->sgls[0];
+	ret = sg_copy_from_buffer(sg, nent, buffer, buf_len);
+	if (ret != buf_len) {
+		dev_err_once(dev->dev, "Copied %zu bytes instead of requested %zu\n",
+			     ret, buf_len);
+		return -EIO;
+	}
+
+	prd_tbl = &write_config->prd_tbls[0];
+	len_left = buf_len;
+
+	for_each_sg(write_config->sgls[0], sg, write_config->sgls_nent[0], i) {
+		if (sg_dma_address(sg) == 0 || sg_dma_len(sg) == 0) {
+			dev_err_once(dev->dev, "SGList: zero address or length\n");
+			return -EINVAL;
+		}
+
+		prd_tbl->entries[i].dest_addr =
+				sg_dma_address(sg) >> THC_ADDRESS_SHIFT;
+
+		if (len_left < sg_dma_len(sg)) {
+			prd_tbl->entries[i].len = len_left;
+			prd_tbl->entries[i].end_of_prd = 1;
+			break;
+		}
+
+		prd_tbl->entries[i].len = sg_dma_len(sg);
+		prd_tbl->entries[i].end_of_prd = 0;
+
+		len_left -= sg_dma_len(sg);
+	}
+
+	dma_set_prd_control(dev, i, 0, write_config);
+
+	return 0;
+}
+
+static void thc_ensure_performance_limitations(struct thc_device *dev)
+{
+	unsigned long delay_usec = 0;
+	/*
+	 * Minimum amount of delay the THC / QUICKSPI driver must wait
+	 * between end of write operation and begin of read operation.
+	 * This value shall be in 10us multiples.
+	 */
+	if (dev->perf_limit > 0) {
+		delay_usec = dev->perf_limit * 10;
+		udelay(delay_usec);
+	}
+}
+
+static void thc_dma_write_completion(struct thc_device *dev)
+{
+	thc_ensure_performance_limitations(dev);
+}
+
+/**
+ * thc_dma_write - Use TXDMA to write data to touch device
+ *
+ * @dev: The pointer of THC private device context
+ * @buffer: The pointer of write data buffer
+ * @buf_len: The write data length
+ *
+ * Return: 0 on success, other error codes on failed.
+ */
+int thc_dma_write(struct thc_device *dev, void *buffer, size_t buf_len)
+{
+	bool restore_interrupts = false;
+	u32 sts, ctrl;
+	int ret;
+
+	if (!(&dev->dma_ctx->dma_config[THC_TXDMA])->is_enabled) {
+		dev_err_once(dev->dev, "The TxDMA channel is not enabled\n");
+		return -EINVAL;
+	}
+
+	if (!buffer || buf_len <= 0) {
+		dev_err(dev->dev, "Invalid input parameters, buffer %p\n, buf_len %zu\n",
+			buffer, buf_len);
+		return -EINVAL;
+	}
+
+	regmap_read(dev->thc_regmap, THC_M_PRT_WRITE_INT_STS_OFFSET, &sts);
+	if (sts & THC_M_PRT_WRITE_INT_STS_THC_WRDMA_ACTIVE) {
+		dev_err_once(dev->dev, "THC TxDMA is till active and can't start again\n");
+		return -EBUSY;
+	}
+
+	if (mutex_lock_interruptible(&dev->thc_bus_lock))
+		return -EINTR;
+
+	regmap_read(dev->thc_regmap, THC_M_PRT_CONTROL_OFFSET, &ctrl);
+
+	ret = write_dma_buffer(dev, buffer, buf_len);
+	if (ret)
+		goto end;
+
+	if (dev->perf_limit && !(ctrl & THC_M_PRT_CONTROL_THC_DEVINT_QUIESCE_HW_STS)) {
+		ret = thc_interrupt_quiesce(dev, true);
+		if (ret)
+			goto end;
+
+		restore_interrupts = true;
+	}
+
+	dev->write_done = false;
+
+	dma_set_start_bit(dev, &dev->dma_ctx->dma_config[THC_TXDMA]);
+
+	ret = wait_event_interruptible_timeout(dev->write_complete_wait, dev->write_done, 1 * HZ);
+	if (ret <= 0 || !dev->write_done) {
+		dev_err_once(dev->dev, "timeout for waiting TxDMA completion\n");
+		ret = -ETIMEDOUT;
+		goto end;
+	}
+
+	thc_dma_write_completion(dev);
+	mutex_unlock(&dev->thc_bus_lock);
+	return 0;
+
+end:
+	mutex_unlock(&dev->thc_bus_lock);
+
+	if (restore_interrupts)
+		ret = thc_interrupt_quiesce(dev, false);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(thc_dma_write, "INTEL_THC");
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
new file mode 100644
index 000000000000..ca923ff2bef9
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
@@ -0,0 +1,146 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _INTEL_THC_DMA_H_
+#define _INTEL_THC_DMA_H_
+
+#include <linux/bits.h>
+#include <linux/dma-mapping.h>
+#include <linux/sizes.h>
+#include <linux/time64.h>
+#include <linux/types.h>
+
+#define THC_POINTER_MASK		GENMASK(6, 0)
+#define THC_POINTER_WRAPAROUND		0x80
+#define THC_WRAPAROUND_VALUE_ODD	0x10
+#define THC_WRAPAROUND_VALUE_EVEN	0x90
+#define THC_MIN_BYTES_PER_SG_LIST_ENTRY SZ_4K
+
+#define THC_DEFAULT_RXDMA_POLLING_US_INTERVAL 100
+#define THC_DEFAULT_RXDMA_POLLING_US_TIMEOUT  (10 * USEC_PER_MSEC)
+
+/*
+ * THC needs 1KB aligned address, dest_addr is 54 bits, not 64,
+ * so don't need to send the lower 10-bits of address.
+ */
+#define THC_ADDRESS_SHIFT 10
+
+/**
+ * THC DMA channels:
+ * @THC_RXDMA1: legacy channel, reserved for raw data reading
+ * @THC_RXDMA2: DMA to read HID data from touch device
+ * @THC_TXDMA: DMA to write to touch device
+ * @THC_SWDMA: SW triggered DMA to write and read from touch device
+ */
+enum thc_dma_channel {
+	THC_RXDMA1 = 0,
+	THC_RXDMA2 = 1,
+	THC_TXDMA = 2,
+	THC_SWDMA = 3,
+	MAX_THC_DMA_CHANNEL
+};
+
+/**
+ * THC DMA Physical Memory Descriptor (PRD)
+ * @dest_addr:		bit[53:0], destination address in system memory
+ * @int_on_completion:	bit[63], if set, thc will trigger interrupt to driver
+ * @len:		bit[87:64], length of this entry
+ * @end_of_prd:		bit[88], if set, this entry is last one of current PRD table
+ * @hw_status:		bit[90:89], hw status bits
+ */
+struct thc_prd_entry {
+	u64  dest_addr : 54;
+	u64  reserved1 : 9;
+	u64  int_on_completion : 1;
+	u64  len : 24;
+	u64  end_of_prd : 1;
+	u64  hw_status : 2;
+	u64  reserved2 : 37;
+};
+
+/*
+ * Max OS memory fragmentation will be at a 4KB boundary, thus to address 1MB
+ * of virtually contiguous memory 256 PRD entries are required for a single
+ * PRD Table. SW writes the number of PRD Entries for each PRD table in the
+ * THC_M_PRT_RPRD_CNTRL.PTEC register field. The PRD entry's length must be
+ * multiple of 4KB except for the last entry in a PRD table.
+ * This is the max possible number of etries supported by HW, in practise we
+ * there will be less entries in each prd table(the actual number will be
+ * given by scatter-gather list allocation).
+ */
+#define PRD_ENTRIES_NUM 16
+
+/*
+ * Number of PRD tables equals to number of data buffers.
+ * The max number of PRD tables supported by the HW is 128,
+ * but we allocate only 16.
+ */
+#define PRD_TABLES_NUM  16
+
+/* THC DMA Physical Memory Descriptor Table */
+struct thc_prd_table {
+	struct thc_prd_entry entries[PRD_ENTRIES_NUM];
+};
+
+#define PRD_TABLE_SIZE	sizeof(struct thc_prd_table)
+
+/**
+ * struct thc_dma_configuration - THC DMA configure
+ * @dma_channel: DMA channel for current DMA configuration
+ * @prd_tbls_dma_handle: DMA buffer handle
+ * @dir: direction of DMA for this config
+ * @prd_tbls: PRD tables for current DMA
+ * @sgls: array of pointers to scatter-gather lists
+ * @sgls_nent: actual number of entries per sg list
+ * @prd_tbl_num: actual number of PRD tables
+ * @max_packet_size: size of the buffer needed for 1 DMA message (1 PRD table)
+ * @prd_base_addr_high: High 32bits memory address where stores PRD table
+ * @prd_base_addr_low: low 32bits memory address where stores PRD table
+ * @prd_cntrl: PRD control register value
+ * @dma_cntrl: DMA control register value
+ */
+struct thc_dma_configuration {
+	enum thc_dma_channel dma_channel;
+	dma_addr_t prd_tbls_dma_handle;
+	enum dma_data_direction dir;
+	bool is_enabled;
+
+	struct thc_prd_table *prd_tbls;
+	struct scatterlist *sgls[PRD_TABLES_NUM];
+	u8 sgls_nent[PRD_TABLES_NUM];
+	u8 prd_tbl_num;
+
+	size_t max_packet_size;
+	u32 prd_base_addr_high;
+	u32 prd_base_addr_low;
+	u32 prd_cntrl;
+	u32 dma_cntrl;
+};
+
+/*
+ * THC DMA context
+ * Store all THC Channel configures
+ */
+struct thc_dma_context {
+	struct thc_dma_configuration dma_config[MAX_THC_DMA_CHANNEL];
+	u8 use_write_interrupts;
+};
+
+struct thc_device;
+
+int  thc_dma_set_max_packet_sizes(struct thc_device *dev,
+				  size_t mps_read1, size_t mps_read2,
+				  size_t mps_write, size_t mps_swdma);
+int  thc_dma_allocate(struct thc_device *dev);
+int  thc_dma_configure(struct thc_device *dev);
+void thc_dma_unconfigure(struct thc_device *dev);
+void thc_dma_release(struct thc_device *dev);
+int  thc_rxdma_read(struct thc_device *dev, enum thc_dma_channel dma_channel,
+		    void *read_buff, size_t *read_len, int *read_finished);
+int  thc_swdma_read(struct thc_device *dev, void *write_buff, size_t write_len,
+		    u32 *prd_tbl_len, void *read_buff, size_t *read_len);
+int  thc_dma_write(struct thc_device *dev, void *buffer, size_t buf_len);
+
+struct thc_dma_context *thc_dma_init(struct thc_device *dev);
+
+#endif /* _INTEL_THC_DMA_H_ */
-- 
2.40.1


