Return-Path: <linux-input+bounces-8579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AED9F27DB
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89DA9165119
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882625A79B;
	Mon, 16 Dec 2024 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HG0KYfNC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49AF3BBF2;
	Mon, 16 Dec 2024 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313320; cv=none; b=Ep30eN1J4TArd3w3gDIIDW/kTI2M5ic0wZstCCF8SQG21XV7KBbuSum9ZEv9rvkdLTQy49sCqKOJIaMUPrqjJIKf+ofeiaEpwat9w9Ks2YoGnJSUalCrQQ98yRmFi6WD8tarzuib8Oj64GdORgtgMbQcZpRQss7+by1b8R772Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313320; c=relaxed/simple;
	bh=wSLx/hVjhFBPyiR2r0qHi6tjKq3RUgdfZv/yKffH6q8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HEqyucq+Lj5HxWqvyKmuPNaUnKyQmDN521qpe+NKobpQYiBTeiyxPjFHVdh5SOtVYArRIrjgScpvMK1fP9vZCuHVY/DysAI6510c2bPVDaczWuH/ypVYTw68ls7f5WLLnH/tjf0N1gcI7sXsxrAwli8qvjFrHw2SwKnQpSE0Bfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HG0KYfNC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313318; x=1765849318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wSLx/hVjhFBPyiR2r0qHi6tjKq3RUgdfZv/yKffH6q8=;
  b=HG0KYfNCuCRHl6Ex/FnS86vk1TNwbhh6W05Wb/d7v5UVxk7v1Oa/eyn7
   WZ+LyeATIxtrVuatGUkPXXTlwHV+zuEenX7aHKKQJzOncfMyr/Wd2HUsr
   NDX7Z2bOb41BZ+I1eYg5N73NHXhsGpwymZg0NK8ljJv/xDGR7Aner9F8j
   5ZW7AhADKfMfS9abS4diMnJiniLEqEOBtMylLrZBCEG5BAHNcNM9R15i3
   IHsxxQiU5FHs6ozjJ5lw9FX69m7LEYaX6xavINfCWAqkEmmGSdTC00Ldu
   Ui/nAysEiwtJBAMU7e6YaHeTGrm1dUiDeBsb2ecpS/SirL7zP8BkVcQU+
   w==;
X-CSE-ConnectionGUID: Ika5MXaLS4Cy7T6Ba+7q2A==
X-CSE-MsgGUID: sOzinDIITyuSBViQiEePig==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34012957"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34012957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:41:57 -0800
X-CSE-ConnectionGUID: Mz8RI44uRq2XKealGCBJig==
X-CSE-MsgGUID: Zzu6RRKtSOugUkaP3CY/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084173"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:41:53 -0800
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
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 03/22] HID: intel-thc-hid: intel-thc: Add THC registers definition
Date: Mon, 16 Dec 2024 09:41:08 +0800
Message-Id: <20241216014127.3722172-4-even.xu@intel.com>
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

From: Xinpeng Sun <xinpeng.sun@intel.com>

Add THC Hardware register definitions and descriptions.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    | 639 ++++++++++++++++++
 1 file changed, 639 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
new file mode 100644
index 000000000000..8b3a962e7e64
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
@@ -0,0 +1,639 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _INTEL_THC_HW_H_
+#define _INTEL_THC_HW_H_
+
+#include <linux/bits.h>
+
+/* THC registers offset */
+/* Touch Host Controller Control Register */
+#define THC_M_PRT_CONTROL_OFFSET		0x1008
+/* THC SPI Bus Configuration Register */
+#define THC_M_PRT_SPI_CFG_OFFSET		0x1010
+/* THC SPI Bus Read Opcode Register */
+#define THC_M_PRT_SPI_ICRRD_OPCODE_OFFSET	0x1014
+/* THC SPI Bus Read Opcode Register */
+#define THC_M_PRT_SPI_DMARD_OPCODE_OFFSET	0x1018
+/* THC SPI Bus Write Opcode Register */
+#define THC_M_PRT_SPI_WR_OPCODE_OFFSET		0x101C
+/* THC Interrupt Enable Register */
+#define THC_M_PRT_INT_EN_OFFSET			0x1020
+/* THC Interrupt Status Register */
+#define THC_M_PRT_INT_STATUS_OFFSET		0x1024
+/* THC Error Cause Register */
+#define THC_M_PRT_ERR_CAUSE_OFFSET		0x1028
+/* THC SW sequencing Control */
+#define THC_M_PRT_SW_SEQ_CNTRL_OFFSET		0x1040
+/* THC SW sequencing Status */
+#define THC_M_PRT_SW_SEQ_STS_OFFSET		0x1044
+/* THC SW Sequencing Data DW0 or SPI Address Register */
+#define THC_M_PRT_SW_SEQ_DATA0_ADDR_OFFSET	0x1048
+/* THC SW sequencing Data DW1 */
+#define THC_M_PRT_SW_SEQ_DATA1_OFFSET		0x104C
+/* THC SW sequencing Data DW2 */
+#define THC_M_PRT_SW_SEQ_DATA2_OFFSET		0x1050
+/* THC SW sequencing Data DW3 */
+#define THC_M_PRT_SW_SEQ_DATA3_OFFSET		0x1054
+/* THC SW sequencing Data DW4 */
+#define THC_M_PRT_SW_SEQ_DATA4_OFFSET		0x1058
+/* THC SW sequencing Data DW5 */
+#define THC_M_PRT_SW_SEQ_DATA5_OFFSET		0x105C
+/* THC SW sequencing Data DW6 */
+#define THC_M_PRT_SW_SEQ_DATA6_OFFSET		0x1060
+/* THC SW sequencing Data DW7 */
+#define THC_M_PRT_SW_SEQ_DATA7_OFFSET		0x1064
+/* THC SW sequencing Data DW8 */
+#define THC_M_PRT_SW_SEQ_DATA8_OFFSET		0x1068
+/* THC SW sequencing Data DW9 */
+#define THC_M_PRT_SW_SEQ_DATA9_OFFSET		0x106C
+/* THC SW sequencing Data DW10 */
+#define THC_M_PRT_SW_SEQ_DATA10_OFFSET		0x1070
+/* THC SW sequencing Data DW11 */
+#define THC_M_PRT_SW_SEQ_DATA11_OFFSET		0x1074
+/* THC SW sequencing Data DW12 */
+#define THC_M_PRT_SW_SEQ_DATA12_OFFSET		0x1078
+/* THC SW sequencing Data DW13 */
+#define THC_M_PRT_SW_SEQ_DATA13_OFFSET		0x107C
+/* THC SW sequencing Data DW14 */
+#define THC_M_PRT_SW_SEQ_DATA14_OFFSET		0x1080
+/* THC SW sequencing Data DW15 */
+#define THC_M_PRT_SW_SEQ_DATA15_OFFSET		0x1084
+/* THC SW sequencing Data DW16 */
+#define THC_M_PRT_SW_SEQ_DATA16_OFFSET		0x1088
+/* THC Write PRD Base Address Register Low */
+#define THC_M_PRT_WPRD_BA_LOW_OFFSET		0x1090
+/* THC Write PRD Base Address Register High */
+#define THC_M_PRT_WPRD_BA_HI_OFFSET		0x1094
+/* THC Write DMA Control */
+#define THC_M_PRT_WRITE_DMA_CNTRL_OFFSET	0x1098
+/* THC Write Interrupt Status */
+#define THC_M_PRT_WRITE_INT_STS_OFFSET		0x109C
+/* THC Write DMA Error Register */
+#define THC_M_PRT_WRITE_DMA_ERR_OFFSET		0x10A0
+/* THC device address for the bulk write */
+#define THC_M_PRT_WR_BULK_ADDR_OFFSET		0x10B4
+/* THC Device Interrupt Cause Register Address */
+#define THC_M_PRT_DEV_INT_CAUSE_ADDR_OFFSET	0x10B8
+/* THC Device Interrupt Cause Register Value */
+#define THC_M_PRT_DEV_INT_CAUSE_REG_VAL_OFFSET	0x10BC
+/* THC TXDMA Frame Count */
+#define THC_M_PRT_TX_FRM_CNT_OFFSET		0x10E0
+/* THC TXDMA Packet Count */
+#define THC_M_PRT_TXDMA_PKT_CNT_OFFSET		0x10E4
+/* THC Device Interrupt Count on this port */
+#define THC_M_PRT_DEVINT_CNT_OFFSET		0x10E8
+/* Touch Device Interrupt Cause register Format Configuration Register 1 */
+#define THC_M_PRT_DEVINT_CFG_1_OFFSET		0x10EC
+/* Touch Device Interrupt Cause register Format Configuration Register 2 */
+#define THC_M_PRT_DEVINT_CFG_2_OFFSET		0x10F0
+/* THC Read PRD Base Address Low for the 1st RXDMA */
+#define THC_M_PRT_RPRD_BA_LOW_1_OFFSET		0x1100
+/* THC Read PRD Base Address High for the 1st RXDMA */
+#define THC_M_PRT_RPRD_BA_HI_1_OFFSET		0x1104
+/* THC Read PRD Control for the 1st RXDMA */
+#define THC_M_PRT_RPRD_CNTRL_1_OFFSET		0x1108
+/* THC Read DMA Control for the 1st RXDMA */
+#define THC_M_PRT_READ_DMA_CNTRL_1_OFFSET	0x110C
+/* THC Read Interrupt Status for the 1st RXDMA */
+#define THC_M_PRT_READ_DMA_INT_STS_1_OFFSET	0x1110
+/* THC Read DMA Error Register for the 1st RXDMA */
+#define THC_M_PRT_READ_DMA_ERR_1_OFFSET		0x1114
+/* Touch Sequencer GuC Tail Offset Address Low for the 1st RXDMA */
+#define THC_M_PRT_GUC_OFFSET_LOW_1_OFFSET	0x1118
+/* Touch Sequencer GuC Tail Offset Address High for the 1st RXDMA */
+#define THC_M_PRT_GUC_OFFSET_HI_1_OFFSET	0x111C
+/* Touch Host Controller GuC Work Queue Item Size for the 1st RXDMA */
+#define THC_M_PRT_GUC_WORKQ_ITEM_SZ_1_OFFSET	0x1120
+/* Touch Host Controller GuC Control register for the 1st RXDMA */
+#define THC_M_PRT_GUC_WORKQ_SZ_1_OFFSET		0x1124
+/* Touch Sequencer Control for the 1st DMA */
+#define THC_M_PRT_TSEQ_CNTRL_1_OFFSET		0x1128
+/* Touch Sequencer GuC Doorbell Address Low for the 1st RXDMA */
+#define THC_M_PRT_GUC_DB_ADDR_LOW_1_OFFSET	0x1130
+/* Touch Sequencer GuC Doorbell Address High for the 1st RXDMA */
+#define THC_M_PRT_GUC_DB_ADDR_HI_1_OFFSET	0x1134
+/* Touch Sequencer GuC Doorbell Data */
+#define THC_M_PRT_GUC_DB_DATA_1_OFFSET		0x1138
+/* Touch Sequencer GuC Tail Offset Initial Value for the 1st RXDMA */
+#define THC_M_PRT_GUC_OFFSET_INITVAL_1_OFFSET	0x1140
+/* THC Device Address for the bulk/touch data read for the 1st RXDMA */
+#define THC_M_PRT_RD_BULK_ADDR_1_OFFSET		0x1170
+/* THC Gfx/SW Doorbell Count from the 1st Stream RXDMA on this port */
+#define THC_M_PRT_DB_CNT_1_OFFSET		0x11A0
+/* THC Frame Count from the 1st Stream RXDMA on this port */
+#define THC_M_PRT_FRM_CNT_1_OFFSET		0x11A4
+/* THC Micro Frame Count from the 1st Stream RXDMA on this port */
+#define THC_M_PRT_UFRM_CNT_1_OFFSET		0x11A8
+/* THC Packet Count from the 1st Stream RXDMA on this port */
+#define THC_M_PRT_RXDMA_PKT_CNT_1_OFFSET	0x11AC
+/*
+ * THC Software Interrupt Count from the 1st Stream RXDMA
+ * on this port
+ */
+#define THC_M_PRT_SWINT_CNT_1_OFFSET		0x11B0
+/* Touch Sequencer Frame Drop Counter for the 1st RXDMA */
+#define THC_M_PRT_FRAME_DROP_CNT_1_OFFSET	0x11B4
+/* THC Coaescing 1 */
+#define THC_M_PRT_COALESCE_1_OFFSET		0x11B8
+/* THC Read PRD Base Address Low for the 2nd RXDMA */
+#define THC_M_PRT_RPRD_BA_LOW_2_OFFSET		0x1200
+/* THC Read PRD Base Address High for the 2nd RXDMA */
+#define THC_M_PRT_RPRD_BA_HI_2_OFFSET		0x1204
+/* THC Read PRD Control for the 2nd RXDMA */
+#define THC_M_PRT_RPRD_CNTRL_2_OFFSET		0x1208
+/* THC Read DMA Control for the 2nd RXDMA */
+#define THC_M_PRT_READ_DMA_CNTRL_2_OFFSET	0x120C
+/* THC Read Interrupt Status for the 2nd RXDMA */
+#define THC_M_PRT_READ_DMA_INT_STS_2_OFFSET	0x1210
+/* THC Read DMA Error Register for the 2nd RXDMA */
+#define THC_M_PRT_READ_DMA_ERR_2_OFFSET		0x1214
+/* Touch Sequencer GuC Tail Offset Address Low for the 2nd RXDMA */
+#define THC_M_PRT_GUC_OFFSET_LOW_2_OFFSET	0x1218
+/* Touch Sequencer GuC Tail Offset Address High for the 2nd RXDMA */
+#define THC_M_PRT_GUC_OFFSET_HI_2_OFFSET	0x121C
+/* Touch Host Controller GuC Work Queue Item Size for the 2nd RXDMA */
+#define THC_M_PRT_GUC_WORKQ_ITEM_SZ_2_OFFSET	0x1220
+/* Touch Host Controller GuC Control register for the 2nd RXDMA */
+#define THC_M_PRT_GUC_WORKQ_SZ_2_OFFSET		0x1224
+/* Touch Sequencer Control for the 2nd DMA */
+#define THC_M_PRT_TSEQ_CNTRL_2_OFFSET		0x1228
+/* Touch Sequencer GuC Doorbell Address Low for the 2nd RXDMA */
+#define THC_M_PRT_GUC_DB_ADDR_LOW_2_OFFSET	0x1230
+/* Touch Sequencer GuC Doorbell Address High for the 2nd RXDMA */
+#define THC_M_PRT_GUC_DB_ADDR_HI_2_OFFSET	0x1234
+/* Touch Sequencer GuC Doorbell Data for PRD2 */
+#define THC_M_PRT_GUC_DB_DATA_2_OFFSET		0x1238
+/* Touch Sequencer GuC Tail Offset Initial Value for the 2nd RXDMA */
+#define THC_M_PRT_GUC_OFFSET_INITVAL_2_OFFSET	0x1240
+/* THC Device Address for the bulk/touch data read for the 2nd RXDMA */
+#define THC_M_PRT_RD_BULK_ADDR_2_OFFSET		0x1270
+/* THC Gfx/SW Doorbell Count from the 2nd Stream RXDMA on this port */
+#define THC_M_PRT_DB_CNT_2_OFFSET		0x12A0
+/* THC Frame Count from the 2nd Stream RXDMA on this port */
+#define THC_M_PRT_FRM_CNT_2_OFFSET		0x12A4
+/* THC Micro Frame Count from the 2nd Stream RXDMA on this port */
+#define THC_M_PRT_UFRM_CNT_2_OFFSET		0x12A8
+/* THC Packet Count from the 2nd Stream RXDMA on this port */
+#define THC_M_PRT_RXDMA_PKT_CNT_2_OFFSET	0x12AC
+/*
+ * THC Software Interrupt Count from the 2nd Stream RXDMA
+ * on this port
+ */
+#define THC_M_PRT_SWINT_CNT_2_OFFSET		0x12B0
+/* Touch Sequencer Frame Drop Counter for the 2nd RXDMA */
+#define THC_M_PRT_FRAME_DROP_CNT_2_OFFSET	0x12B4
+/* THC Coaescing 2 */
+#define THC_M_PRT_COALESCE_2_OFFSET		0x12B8
+/* THC SPARE REGISTER */
+#define THC_M_PRT_SPARE_REG_OFFSET		0x12BC
+/* THC Read PRD Base Address Low for the SW RXDMA */
+#define THC_M_PRT_RPRD_BA_LOW_SW_OFFSET		0x12C0
+/* THC Read PRD Base Address High for the SW RXDMA */
+#define THC_M_PRT_RPRD_BA_HI_SW_OFFSET		0x12C4
+/* THC Read PRD Control for the SW RXDMA */
+#define THC_M_PRT_RPRD_CNTRL_SW_OFFSET		0x12C8
+/* THC Read DMA Control for the SW RXDMA */
+#define THC_M_PRT_READ_DMA_CNTRL_SW_OFFSET	0x12CC
+/* THC Read Interrupt Status for the SW RXDMA */
+#define THC_M_PRT_READ_DMA_INT_STS_SW_OFFSET	0x12D0
+/* Touch Sequencer Control for the SW DMA */
+#define THC_M_PRT_TSEQ_CNTRL_SW_OFFSET		0x12D4
+/* Address for the bulk read for SW DMA engine */
+#define THC_M_PRT_RD_BULK_ADDR_SW_OFFSET	0x12D8
+/* THC Frame Count from the SW RXDMA on this port */
+#define THC_M_PRT_FRM_CNT_SW_OFFSET		0x12DC
+/* THC Packet Count from the SW RXDMA on this port */
+#define THC_M_PRT_RXDMA_PKT_CNT_SW_OFFSET	0x12E0
+/* SW DMA PRD Table Length */
+#define THC_M_PRT_SW_DMA_PRD_TABLE_LEN_OFFSET	0x12E4
+/* THC timing based Frame/Interrupt caolescing control register for 1st RXDMA */
+#define THC_M_PRT_COALESCE_CNTRL_1_OFFSET	0x12E8
+/* THC timing based Frame/Interrupt caolescing control register for 2nd RXDMA */
+#define THC_M_PRT_COALESCE_CNTRL_2_OFFSET	0x12EC
+/* Touch Sequencer PRD Table Empty Counter for the 1st RXDMA */
+#define THC_M_PRT_PRD_EMPTY_CNT_1_OFFSET	0x12F0
+/* Touch Sequencer PRD Table Empty Counter for the 2nd RXDM */
+#define THC_M_PRT_PRD_EMPTY_CNT_2_OFFSET	0x12F4
+/* THC coalescing status to reflect the current coalescing FSM state for 1st RXDMA */
+#define THC_M_PRT_COALESCE_STS_1_OFFSET		0x12F8
+/* THC coalescing status to reflect the current coalescing FSM state for 2nd RXDMA */
+#define THC_M_PRT_COALESCE_STS_2_OFFSET		0x12FC
+/* THC Register for the SPI Port Duty Cycle Configuration */
+#define THC_M_PRT_SPI_DUTYC_CFG_OFFSET		0x1300
+/* THC Register for SW I2C Wtite Sequecning control */
+#define THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_OFFSET	0x1304
+/* THC current Timestamp Register for RXDMA1 */
+#define THC_M_PRT_TIMESTAMP_1_OFFSET		0x1308
+/* THC current Timestamp Register for RXDMA2 */
+#define THC_M_PRT_TIMESTAMP_2_OFFSET		0x130C
+/* Current SYNC Event Timestamp Register */
+#define THC_M_PRT_SYNC_TIMESTAMP_OFFSET		0x1310
+/* THC Display Sync Register */
+#define THC_M_PRT_DISP_SYNC_OFFSET		0x1314
+/* THC Display Sync Register */
+#define THC_M_PRT_DISP_SYNC_2_OFFSET		0x1318
+/* THC Register for SW I2C Wtite Sequecning control */
+#define THC_M_PRT_I2C_CFG_OFFSET		0x131C
+
+/* THC register bits definition */
+#define TXN_ERR_INT_STS_BIT			BIT(28)
+#define TXN_FATAL_INT_STS_BIT			BIT(30)
+
+#define NONDMA_INT_STS_BIT			BIT(4)
+#define EOF_INT_STS_BIT				BIT(5)
+
+#define THC_CFG_DID_VID_VID		        GENMASK(15, 0)
+#define THC_CFG_DID_VID_DID		        GENMASK(31, 16)
+
+#define THC_CFG_STS_CMD_IOSE			BIT(0)
+#define THC_CFG_STS_CMD_MSE			BIT(1)
+#define THC_CFG_STS_CMD_BME			BIT(2)
+#define THC_CFG_STS_CMD_SPCYC			BIT(3)
+#define THC_CFG_STS_CMD_MWRIEN			BIT(4)
+#define THC_CFG_STS_CMD_VGAPS			BIT(5)
+#define THC_CFG_STS_CMD_PERRR			BIT(6)
+#define THC_CFG_STS_CMD_SERREN			BIT(8)
+#define THC_CFG_STS_CMD_FBTBEN			BIT(9)
+#define THC_CFG_STS_CMD_INTD			BIT(10)
+#define THC_CFG_STS_CMD_INTS			BIT(19)
+#define THC_CFG_STS_CMD_CAPL			BIT(20)
+#define THC_CFG_STS_CMD_MCAP			BIT(21)
+#define THC_CFG_STS_CMD_FBTBC			BIT(23)
+#define THC_CFG_STS_CMD_MDPE			BIT(24)
+#define THC_CFG_STS_CMD_DEVT			GENMASK(26, 25)
+#define THC_CFG_STS_CMD_STA			BIT(27)
+#define THC_CFG_STS_CMD_RTA			BIT(28)
+#define THC_CFG_STS_CMD_RMA			BIT(29)
+#define THC_CFG_STS_CMD_SSE			BIT(30)
+#define THC_CFG_STS_CMD_DPE			BIT(31)
+
+#define THC_CFG_CC_RID_RID			GENMASK(7, 0)
+#define THC_CFG_CC_RID_PI			GENMASK(15, 8)
+#define THC_CFG_CC_RID_SCC			GENMASK(23, 16)
+#define THC_CFG_CC_RID_BCC			GENMASK(31, 24)
+
+#define THC_CFG_BIST_HTYPE_LT_CLS_CLSZ		GENMASK(7, 0)
+#define THC_CFG_BIST_HTYPE_LT_CLS_LT		GENMASK(15, 8)
+#define THC_CFG_BIST_HTYPE_LT_CLS_HTYPE		GENMASK(22, 16)
+#define THC_CFG_BIST_HTYPE_LT_CLS_MFD		BIT(23)
+
+#define THC_CFG_BAR0_LOW_MEMSPACE		BIT(0)
+#define THC_CFG_BAR0_LOW_TYP			GENMASK(2, 1)
+#define THC_CFG_BAR0_LOW_PREFETCH		BIT(3)
+#define THC_CFG_BAR0_LOW_MEMSIZE		GENMASK(14, 4)
+#define THC_CFG_BAR0_LOW_MEMBAR			GENMASK(31, 15)
+#define THC_CFG_BAR0_HI_MEMBAR			GENMASK(31, 0)
+
+#define THC_CFG_SID_SVID_SSVID			GENMASK(15, 0)
+#define THC_CFG_SID_SVID_SSID			GENMASK(31, 16)
+
+#define THC_CFG_CAPP_CP				GENMASK(7, 0)
+
+#define THC_CFG_INT_ILINE			GENMASK(7, 0)
+#define THC_CFG_INT_IPIN			GENMASK(15, 8)
+
+#define THC_CFG_UR_STS_CTL_URRE			BIT(0)
+#define THC_CFG_UR_STS_CTL_URD			BIT(1)
+#define THC_CFG_UR_STS_CTL_FD			BIT(2)
+
+#define THC_CFG_MSIMC_MSINP_MSICID_CAPID	GENMASK(7, 0)
+#define THC_CFG_MSIMC_MSINP_MSICID_NXTP	        GENMASK(15, 8)
+#define THC_CFG_MSIMC_MSINP_MSICID_MSIE		BIT(16)
+#define THC_CFG_MSIMC_MSINP_MSICID_MMC	        GENMASK(19, 17)
+#define THC_CFG_MSIMC_MSINP_MSICID_MMEN	        GENMASK(22, 20)
+#define THC_CFG_MSIMC_MSINP_MSICID_XAC		BIT(23)
+#define THC_CFG_MSIMC_MSINP_MSICID_PVMC		BIT(24)
+#define THC_CFG_MSIMA_MADDR		        GENMASK(31, 2)
+#define THC_CFG_MSIMUA_MAUDDR		        GENMASK(31, 0)
+#define THC_CFG_MSIMD_MDAT			GENMASK(15, 0)
+
+#define THC_CFG_PMCAP_PMNP_PMCID_CAPP	        GENMASK(7, 0)
+#define THC_CFG_PMCAP_PMNP_PMCID_NXTP	        GENMASK(15, 8)
+#define THC_CFG_PMCAP_PMNP_PMCID_VER	        GENMASK(18, 16)
+#define THC_CFG_PMCAP_PMNP_PMCID_PMECLK		BIT(19)
+#define THC_CFG_PMCAP_PMNP_PMCID_DSI		BIT(21)
+#define THC_CFG_PMCAP_PMNP_PMCID_AUXC	        GENMASK(24, 22)
+#define THC_CFG_PMCAP_PMNP_PMCID_D1S		BIT(25)
+#define THC_CFG_PMCAP_PMNP_PMCID_D2S		BIT(26)
+#define THC_CFG_PMCAP_PMNP_PMCID_PMES	        GENMASK(31, 27)
+
+#define THC_CFG_PMD_PMCSRBSE_PMCSR_PWRST	GENMASK(1, 0)
+#define THC_CFG_PMD_PMCSRBSE_PMCSR_NSR		BIT(3)
+#define THC_CFG_PMD_PMCSRBSE_PMCSR_PMEEN	BIT(8)
+#define THC_CFG_PMD_PMCSRBSE_PMCSR_DSEL	        GENMASK(12, 9)
+#define THC_CFG_PMD_PMCSRBSE_PMCSR_DS	        GENMASK(14, 13)
+#define THC_CFG_PMD_PMCSRBSE_PMCSR_PMESTS	BIT(15)
+
+#define THC_CFG_DEVIDLE_CAPPID		        GENMASK(7, 0)
+#define THC_CFG_DEVIDLE_NCAPPP		        GENMASK(15, 8)
+#define THC_CFG_DEVIDLE_LENGTH		        GENMASK(23, 16)
+#define THC_CFG_DEVIDLE_REV		        GENMASK(27, 24)
+#define THC_CFG_DEVIDLE_VID		        GENMASK(31, 28)
+
+#define THC_CFG_VSHDR_VSECID		        GENMASK(15, 0)
+#define THC_CFG_VSHDR_VSECR		        GENMASK(19, 16)
+#define THC_CFG_VSHDR_VSECL		        GENMASK(31, 20)
+
+#define THC_CFG_SWLTRPTR_VALID			BIT(0)
+#define THC_CFG_SWLTRPTR_BARNUM		        GENMASK(3, 1)
+#define THC_CFG_SWLTRPTR_SWLTRLOC		GENMASK(31, 4)
+
+#define THC_CFG_DEVIDLEPTR_VALID		BIT(0)
+#define THC_CFG_DEVIDLEPTR_BARNUM		GENMASK(3, 1)
+#define THC_CFG_DEVIDLEPTR_DEVIDLELOC	        GENMASK(31, 4)
+#define THC_CFG_DEVIDLEPOL_POLV		        GENMASK(9, 0)
+#define THC_CFG_DEVIDLEPOL_POLS		        GENMASK(12, 10)
+
+#define THC_CFG_PCE_SPE				BIT(0)
+#define THC_CFG_PCE_I3E				BIT(1)
+#define THC_CFG_PCE_D3HE			BIT(2)
+#define THC_CFG_PCE_SE				BIT(3)
+#define THC_CFG_PCE_HAE				BIT(5)
+
+#define THC_CFG_MANID_PROC			GENMASK(7, 0)
+#define THC_CFG_MANID_MID			GENMASK(15, 8)
+#define THC_CFG_MANID_MSID			GENMASK(23, 16)
+#define THC_CFG_MANID_DOT			GENMASK(27, 24)
+
+#define THC_M_CMN_DEVIDLECTRL_CIP		BIT(0)
+#define THC_M_CMN_DEVIDLECTRL_IR		BIT(1)
+#define THC_M_CMN_DEVIDLECTRL_DEVIDLE		BIT(2)
+#define THC_M_CMN_DEVIDLECTRL_RR		BIT(3)
+#define THC_M_CMN_DEVIDLECTRL_IRC		BIT(4)
+
+#define THC_M_CMN_LTR_CTRL_OFFSET		0x14
+#define THC_M_CMN_LTR_CTRL_ACTIVE_LTR_REQ	BIT(0)
+#define THC_M_CMN_LTR_CTRL_ACTIVE_LTR_EN	BIT(1)
+#define THC_M_CMN_LTR_CTRL_LP_LTR_REQ		BIT(2)
+#define THC_M_CMN_LTR_CTRL_LP_LTR_EN		BIT(3)
+#define THC_M_CMN_LTR_CTRL_LP_LTR_SCALE	        GENMASK(6, 4)
+#define THC_M_CMN_LTR_CTRL_LP_LTR_VAL	        GENMASK(16, 7)
+#define THC_M_CMN_LTR_CTRL_ACT_LTR_SCALE	GENMASK(19, 17)
+#define THC_M_CMN_LTR_CTRL_ACT_LTR_VAL	        GENMASK(29, 20)
+#define THC_M_CMN_LTR_CTRL_LAST_LTR_SENT	GENMASK(31, 30)
+
+#define THC_M_PRT_CONTROL_TSFTRST		BIT(0)
+#define THC_M_PRT_CONTROL_THC_DEVINT_QUIESCE_EN	BIT(1)
+#define THC_M_PRT_CONTROL_THC_DEVINT_QUIESCE_HW_STS	BIT(2)
+#define THC_M_PRT_CONTROL_DEVRST		BIT(3)
+#define THC_M_PRT_CONTROL_THC_DRV_LOCK_EN	BIT(13)
+#define THC_M_PRT_CONTROL_THC_INSTANCE_INDEX	GENMASK(18, 16)
+#define THC_M_PRT_CONTROL_PORT_INDEX	        GENMASK(22, 20)
+#define THC_M_PRT_CONTROL_THC_ARB_POLICY	GENMASK(25, 24)
+#define THC_M_PRT_CONTROL_THC_BIOS_LOCK_EN	BIT(27)
+#define THC_M_PRT_CONTROL_PORT_SUPPORTED	BIT(28)
+#define THC_M_PRT_CONTROL_SPI_IO_RDY		BIT(29)
+#define THC_M_PRT_CONTROL_PORT_TYPE	        GENMASK(31, 30)
+
+#define THC_M_PRT_SPI_CFG_SPI_TRDC		GENMASK(1, 0)
+#define THC_M_PRT_SPI_CFG_SPI_TRMODE	        GENMASK(3, 2)
+#define THC_M_PRT_SPI_CFG_SPI_TCRF		GENMASK(6, 4)
+#define THC_M_PRT_SPI_CFG_SPI_RD_MPS	        GENMASK(15, 7)
+#define THC_M_PRT_SPI_CFG_SPI_TWMODE	        GENMASK(19, 18)
+#define THC_M_PRT_SPI_CFG_SPI_TCWF		GENMASK(22, 20)
+#define THC_M_PRT_SPI_CFG_SPI_LOW_FREQ_EN	BIT(23)
+#define THC_M_PRT_SPI_CFG_SPI_WR_MPS	        GENMASK(31, 24)
+
+#define THC_M_PRT_SPI_ICRRD_OPCODE_SPI_SIO	GENMASK(31, 24)
+#define THC_M_PRT_SPI_ICRRD_OPCODE_SPI_DIO	GENMASK(23, 16)
+#define THC_M_PRT_SPI_ICRRD_OPCODE_SPI_QIO	GENMASK(15, 8)
+
+#define THC_M_PRT_INT_EN_SIPE				BIT(0)
+#define THC_M_PRT_INT_EN_SBO				BIT(1)
+#define THC_M_PRT_INT_EN_SIDR				BIT(2)
+#define THC_M_PRT_INT_EN_SOFB				BIT(3)
+#define THC_M_PRT_INT_EN_INVLD_DEV_ENTRY_INT_EN		BIT(9)
+#define THC_M_PRT_INT_EN_FRAME_BABBLE_ERR_INT_EN	BIT(10)
+#define THC_M_PRT_INT_EN_BUF_OVRRUN_ERR_INT_EN		BIT(12)
+#define THC_M_PRT_INT_EN_PRD_ENTRY_ERR_INT_EN		BIT(13)
+#define THC_M_PRT_INT_EN_DISP_SYNC_EVT_INT_EN		BIT(14)
+#define THC_M_PRT_INT_EN_DEV_RAW_INT_EN			BIT(15)
+#define THC_M_PRT_INT_EN_FATAL_ERR_INT_EN		BIT(16)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_RX_UNDER_INT_EN	BIT(17)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_RX_OVER_INT_EN	BIT(18)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_RX_FULL_INT_EN	BIT(19)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_TX_OVER_INT_EN	BIT(20)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_TX_EMPTY_INT_EN	BIT(21)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_TX_ABRT_INT_EN	BIT(22)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_SCL_STUCK_AT_LOW_DET_INT_EN	BIT(24)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_STOP_DET_INT_EN	BIT(25)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_START_DET_INT_EN	BIT(26)
+#define THC_M_PRT_INT_EN_THC_I2C_IC_MST_ON_HOLD_INT_EN	BIT(27)
+#define THC_M_PRT_INT_EN_TXN_ERR_INT_EN			BIT(29)
+#define THC_M_PRT_INT_EN_GBL_INT_EN			BIT(31)
+
+#define THC_M_PRT_INT_STATUS_DISP_SYNC_EVT_INT_STS		BIT(14)
+#define THC_M_PRT_INT_STATUS_DEV_RAW_INT_STS			BIT(15)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_UNDER_INT_STS	BIT(17)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_OVER_INT_STS		BIT(18)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_RX_FULL_INT_STS		BIT(19)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_OVER_INT_STS		BIT(20)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_EMPTY_INT_STS	BIT(21)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_TX_ABRT_INT_STS		BIT(22)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_ACTIVITY_INT_STS	BIT(23)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_SCL_STUCK_AT_LOW_INT_STS	BIT(24)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_STOP_DET_INT_STS	BIT(25)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_START_DET_INT_STS	BIT(26)
+#define THC_M_PRT_INT_STATUS_THC_I2C_IC_MST_ON_HOLD_INT_STS	BIT(27)
+#define THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS			BIT(28)
+#define THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS			BIT(30)
+
+#define THC_M_PRT_ERR_CAUSE_INVLD_DEV_ENTRY	BIT(9)
+#define THC_M_PRT_ERR_CAUSE_FRAME_BABBLE_ERR	BIT(10)
+#define THC_M_PRT_ERR_CAUSE_BUF_OVRRUN_ERR	BIT(12)
+#define THC_M_PRT_ERR_CAUSE_PRD_ENTRY_ERR	BIT(13)
+#define THC_M_PRT_ERR_CAUSE_FATAL_ERR_CAUSE	GENMASK(23, 16)
+
+#define THC_M_PRT_SW_SEQ_CNTRL_TSSGO		BIT(0)
+#define THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CD_IE	BIT(1)
+#define THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CMD	GENMASK(15, 8)
+#define THC_M_PRT_SW_SEQ_CNTRL_THC_SS_BC	GENMASK(31, 16)
+#define THC_M_PRT_SW_SEQ_STS_TSSDONE		BIT(0)
+#define THC_M_PRT_SW_SEQ_STS_THC_SS_ERR		BIT(1)
+#define THC_M_PRT_SW_SEQ_STS_THC_SS_CIP		BIT(3)
+#define THC_M_PRT_SW_SEQ_DATA0_ADDR_THC_SW_SEQ_DATA0_ADDR	GENMASK(31, 0)
+#define THC_M_PRT_SW_SEQ_DATA1_THC_SW_SEQ_DATA1		        GENMASK(31, 0)
+
+#define THC_M_PRT_WPRD_BA_LOW_THC_M_PRT_WPRD_BA_LOW	        GENMASK(31, 12)
+#define THC_M_PRT_WPRD_BA_HI_THC_M_PRT_WPRD_BA_HI		GENMASK(31, 0)
+
+#define THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_START		BIT(0)
+#define THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC_ERROR	BIT(1)
+#define THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC		BIT(2)
+#define THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC_DMACPL	BIT(3)
+#define THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_UHS			BIT(23)
+#define THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_PTEC		GENMASK(31, 24)
+
+#define THC_M_PRT_WRITE_INT_STS_THC_WRDMA_CMPL_STATUS		BIT(0)
+#define THC_M_PRT_WRITE_INT_STS_THC_WRDMA_ERROR_STS		BIT(1)
+#define THC_M_PRT_WRITE_INT_STS_THC_WRDMA_IOC_STS		BIT(2)
+#define THC_M_PRT_WRITE_INT_STS_THC_WRDMA_ACTIVE		BIT(3)
+
+#define THC_M_PRT_WR_BULK_ADDR_THC_M_PRT_WR_BULK_ADDR	        GENMASK(31, 0)
+
+#define THC_M_PRT_DEV_INT_CAUSE_ADDR_THC_M_PRT_DEV_INT_CAUSE_ADDR	GENMASK(31, 0)
+#define THC_M_PRT_DEV_INT_CAUSE_REG_VAL_INTERRUPT_TYPE	        GENMASK(3, 0)
+#define THC_M_PRT_DEV_INT_CAUSE_REG_VAL_MICRO_FRAME_SIZE	GENMASK(23, 4)
+#define THC_M_PRT_DEV_INT_CAUSE_REG_VAL_BEGINNING_OF_FRAME	BIT(29)
+#define THC_M_PRT_DEV_INT_CAUSE_REG_VAL_END_OF_FRAME		BIT(30)
+#define THC_M_PRT_DEV_INT_CAUSE_REG_VAL_FRAME_TYPE		BIT(31)
+
+#define THC_M_PRT_TX_FRM_CNT_THC_M_PRT_TX_FRM_CNT		GENMASK(30, 0)
+#define THC_M_PRT_TX_FRM_CNT_THC_M_PRT_TX_FRM_CNT_RST		BIT(31)
+
+#define THC_M_PRT_TXDMA_PKT_CNT_THC_M_PRT_TXDMA_PKT_CNT	        GENMASK(30, 0)
+#define THC_M_PRT_TXDMA_PKT_CNT_THC_M_PRT_TXDMA_PKT_CNT_RST	BIT(31)
+
+#define THC_M_PRT_DEVINT_CNT_THC_M_PRT_DEVINT_CNT		GENMASK(30, 0)
+#define THC_M_PRT_DEVINT_CNT_THC_M_PRT_DEVINT_CNT_RST		BIT(31)
+
+#define THC_M_PRT_DEVINT_CFG_1_THC_M_PRT_INTTYP_OFFSET	        GENMASK(4, 0)
+#define THC_M_PRT_DEVINT_CFG_1_THC_M_PRT_INTTYP_LEN	        GENMASK(9, 5)
+#define THC_M_PRT_DEVINT_CFG_1_THC_M_PRT_EOF_OFFSET	        GENMASK(14, 10)
+#define THC_M_PRT_DEVINT_CFG_1_THC_M_PRT_SEND_ICR_US_EN		BIT(15)
+#define THC_M_PRT_DEVINT_CFG_1_THC_M_PRT_INTTYP_DATA_VAL	GENMASK(31, 16)
+
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_UFSIZE_OFFSET	        GENMASK(4, 0)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_UFSIZE_LEN	        GENMASK(9, 5)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_UFSIZE_UNIT	        GENMASK(15, 12)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_FTYPE_IGNORE		BIT(16)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_FTYPE_VAL		BIT(17)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_RXDMA_ADDRINC_DIS	BIT(24)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_TXDMA_ADDRINC_DIS	BIT(25)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_RXDMA_PKT_STRM_EN	BIT(26)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_TXDMA_PKT_STRM_EN	BIT(27)
+#define THC_M_PRT_DEVINT_CFG_2_THC_M_PRT_DEVINT_POL		BIT(28)
+
+#define THC_M_PRT_RPRD_BA_LOW_1_THC_M_PRT_RPRD_BA_LOW	        GENMASK(31, 12)
+#define THC_M_PRT_RPRD_BA_HI_1_THC_M_PRT_RPRD_BA_HI	        GENMASK(31, 0)
+
+#define THC_M_PRT_RPRD_CNTRL_PCD		GENMASK(6, 0)
+#define THC_M_PRT_RPRD_CNTRL_PTEC		GENMASK(15, 8)
+#define THC_M_PRT_RPRD_CNTRL_PREFETCH_WM	GENMASK(19, 16)
+
+#define THC_M_PRT_READ_DMA_CNTRL_START		BIT(0)
+#define THC_M_PRT_READ_DMA_CNTRL_IE_ERROR	BIT(1)
+#define THC_M_PRT_READ_DMA_CNTRL_IE_IOC		BIT(2)
+#define THC_M_PRT_READ_DMA_CNTRL_IE_STALL	BIT(3)
+#define THC_M_PRT_READ_DMA_CNTRL_IE_NDDI	BIT(4)
+#define THC_M_PRT_READ_DMA_CNTRL_IE_EOF		BIT(5)
+#define THC_M_PRT_READ_DMA_CNTRL_IE_DMACPL	BIT(7)
+#define THC_M_PRT_READ_DMA_CNTRL_TPCRP	        GENMASK(15, 8)
+#define THC_M_PRT_READ_DMA_CNTRL_TPCWP	        GENMASK(23, 16)
+#define THC_M_PRT_READ_DMA_CNTRL_INT_SW_DMA_EN	BIT(28)
+#define THC_M_PRT_READ_DMA_CNTRL_SOO		BIT(29)
+#define THC_M_PRT_READ_DMA_CNTRL_UHS		BIT(30)
+#define THC_M_PRT_READ_DMA_CNTRL_TPCPR		BIT(31)
+
+#define THC_M_PRT_READ_DMA_INT_STS_DMACPL_STS	BIT(0)
+#define THC_M_PRT_READ_DMA_INT_STS_ERROR_STS	BIT(1)
+#define THC_M_PRT_READ_DMA_INT_STS_IOC_STS	BIT(2)
+#define THC_M_PRT_READ_DMA_INT_STS_STALL_STS	BIT(3)
+#define THC_M_PRT_READ_DMA_INT_STS_NONDMA_INT_STS	BIT(4)
+#define THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS	BIT(5)
+#define THC_M_PRT_READ_DMA_INT_STS_ACTIVE	BIT(8)
+
+#define THC_M_PRT_READ_DMA_ERR_1_DLERR		BIT(0)
+
+#define THC_M_PRT_GUC_OFFSET_LOW_1_THC_M_PRT_GUC_OFFSET_LOW	GENMASK(31, 3)
+#define THC_M_PRT_GUC_OFFSET_HI_1_THC_M_PRT_GUC_OFFSET_HI	GENMASK(31, 0)
+#define THC_M_PRT_GUC_WORKQ_ITEM_SZ_1_WORKQ_ITEM_SZ	        GENMASK(23, 0)
+#define THC_M_PRT_GUC_WORKQ_SZ_1_WORKQ_SZ       GENMASK(23, 0)
+#define THC_M_PRT_GUC_WORKQ_SZ_1_FCD	        GENMASK(27, 24)
+#define THC_M_PRT_GUC_WORKQ_SZ_1_GIC	        GENMASK(31, 28)
+
+#define THC_M_PRT_TSEQ_CNTRL_1_RGD		BIT(2)
+#define THC_M_PRT_TSEQ_CNTRL_1_EGP		BIT(3)
+#define THC_M_PRT_TSEQ_CNTRL_1_RTO		BIT(4)
+#define THC_M_PRT_TSEQ_CNTRL_1_EWOG		BIT(5)
+#define THC_M_PRT_TSEQ_CNTRL_1_RWOGC		BIT(6)
+#define THC_M_PRT_TSEQ_CNTRL_1_RX_DATA_FIFO_WR_WM		GENMASK(25, 16)
+#define THC_M_PRT_TSEQ_CNTRL_1_RESET_PREP_CHICKEN		BIT(30)
+#define THC_M_PRT_TSEQ_CNTRL_1_INT_EDG_DET_EN			BIT(31)
+
+#define THC_M_PRT_GUC_DB_ADDR_LOW_1_GUC_DB_ADDR_LOW	        GENMASK(31, 2)
+#define THC_M_PRT_GUC_DB_ADDR_HI_1_GUC_DB_ADDR_HI		GENMASK(31, 0)
+#define THC_M_PRT_GUC_DB_DATA_1_GUC_DB_DATA		        GENMASK(31, 0)
+#define THC_M_PRT_GUC_OFFSET_INITVAL_1_THC_M_PRT_GUC_OFFSET_INITVAL	GENMASK(31, 0)
+
+#define THC_M_PRT_RD_BULK_ADDR_1_THC_M_PRT_RD_BULK_ADDR	        GENMASK(31, 0)
+
+#define THC_M_PRT_DB_CNT_1_THC_M_PRT_DB_CNT		        GENMASK(30, 0)
+#define THC_M_PRT_DB_CNT_1_THC_M_PRT_DB_CNT_RST			BIT(31)
+
+#define THC_M_PRT_FRM_CNT_1_THC_M_PRT_FRM_CNT		        GENMASK(30, 0)
+#define THC_M_PRT_FRM_CNT_1_THC_M_PRT_FRM_CNT_RST		BIT(31)
+
+#define THC_M_PRT_UFRM_CNT_1_THC_M_PRT_UFRM_CNT		        GENMASK(30, 0)
+#define THC_M_PRT_UFRM_CNT_1_THC_M_PRT_UFRM_CNT_RST		BIT(31)
+
+#define THC_M_PRT_RXDMA_PKT_CNT_1_THC_M_PRT_RXDMA_PKT_CNT	GENMASK(30, 0)
+#define THC_M_PRT_RXDMA_PKT_CNT_1_THC_M_PRT_RXDMA_PKT_CNT_RST	BIT(31)
+
+#define THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT		GENMASK(30, 0)
+#define THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST		BIT(31)
+
+#define THC_M_PRT_FRAME_DROP_CNT_1_NOFD			        GENMASK(30, 0)
+#define THC_M_PRT_FRAME_DROP_CNT_1_RFDC				BIT(31)
+
+#define THC_M_PRT_COALESCE_1_COALESCE_TIMEOUT		        GENMASK(6, 0)
+
+#define THC_M_PRT_RPRD_BA_LOW_2_THC_M_PRT_RPRD_BA_LOW	        GENMASK(31, 12)
+#define THC_M_PRT_RPRD_BA_HI_2_THC_M_PRT_RPRD_BA_HI	        GENMASK(31, 0)
+
+#define THC_M_PRT_READ_DMA_ERR_2_DLERR				BIT(0)
+
+#define THC_M_PRT_GUC_OFFSET_LOW_2_THC_M_PRT_GUC_OFFSET_LOW     GENMASK(31, 3)
+#define THC_M_PRT_GUC_OFFSET_HI_2_THC_M_PRT_GUC_OFFSET_HI	GENMASK(31, 0)
+
+#define THC_M_PRT_GUC_WORKQ_ITEM_SZ_2_WORKQ_ITEM_SZ	        GENMASK(23, 0)
+#define THC_M_PRT_GUC_WORKQ_SZ_2_WORKQ_SZ			GENMASK(23, 0)
+#define THC_M_PRT_GUC_WORKQ_SZ_2_FCD			        GENMASK(27, 24)
+#define THC_M_PRT_GUC_WORKQ_SZ_2_GIC			        GENMASK(31, 28)
+
+#define THC_M_PRT_TSEQ_CNTRL_2_RGD				BIT(2)
+#define THC_M_PRT_TSEQ_CNTRL_2_EGP				BIT(3)
+#define THC_M_PRT_TSEQ_CNTRL_2_RTO				BIT(4)
+
+#define THC_M_PRT_GUC_DB_ADDR_LOW_2_GUC_DB_ADDR_LOW	        GENMASK(31, 2)
+#define THC_M_PRT_GUC_DB_ADDR_HI_2_GUC_DB_ADDR_HI		GENMASK(31, 0)
+
+#define THC_M_PRT_GUC_DB_DATA_2_GUC_DB_DATA		        GENMASK(31, 0)
+
+#define THC_M_PRT_GUC_OFFSET_INITVAL_2_THC_M_PRT_GUC_OFFSET_INITVAL	GENMASK(31, 0)
+
+#define THC_M_PRT_RD_BULK_ADDR_2_THC_M_PRT_RD_BULK_ADDR	        GENMASK(31, 0)
+
+#define THC_M_PRT_DB_CNT_2_THC_M_PRT_DB_CNT		        GENMASK(30, 0)
+#define THC_M_PRT_DB_CNT_2_THC_M_PRT_DB_CNT_RST			BIT(31)
+
+#define THC_M_PRT_FRM_CNT_2_THC_M_PRT_FRM_CNT		        GENMASK(30, 0)
+#define THC_M_PRT_FRM_CNT_2_THC_M_PRT_FRM_CNT_RST		BIT(31)
+
+#define THC_M_PRT_UFRM_CNT_2_THC_M_PRT_UFRM_CNT		        GENMASK(30, 0)
+#define THC_M_PRT_UFRM_CNT_2_THC_M_PRT_UFRM_CNT_RST		BIT(31)
+
+#define THC_M_PRT_RXDMA_PKT_CNT_2_THC_M_PRT_RXDMA_PKT_CNT	GENMASK(30, 0)
+#define THC_M_PRT_RXDMA_PKT_CNT_2_THC_M_PRT_RXDMA_PKT_CNT_RST	BIT(31)
+
+#define THC_M_PRT_SWINT_CNT_2_THC_M_PRT_SWINT_CNT		GENMASK(30, 0)
+#define THC_M_PRT_SWINT_CNT_2_THC_M_PRT_SWINT_CNT_RST		BIT(31)
+
+#define THC_M_PRT_FRAME_DROP_CNT_2_NOFD			        GENMASK(30, 0)
+#define THC_M_PRT_FRAME_DROP_CNT_2_RFDC				BIT(31)
+
+#define THC_M_PRT_COALESCE_2_COALESCE_TIMEOUT		        GENMASK(6, 0)
+
+#define THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_I2C_RW_PIO_EN		BIT(23)
+#define THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_PIO_I2C_WBC	        GENMASK(31, 26)
+
+#define THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_RX_DLEN_EN	BIT(23)
+#define THC_M_PRT_RPRD_CNTRL_SW_THC_SWDMA_I2C_WBC		GENMASK(31, 26)
+
+#define THC_M_PRT_PRD_EMPTY_CNT_1_RPTEC				BIT(31)
+#define THC_M_PRT_PRD_EMPTY_CNT_2_RPTEC				BIT(31)
+
+#define THC_M_PRT_SW_DMA_PRD_TABLE_LEN_THC_M_PRT_SW_DMA_PRD_TABLE_LEN	GENMASK(23, 0)
+
+#endif /* _INTEL_THC_HW_H_  */
-- 
2.40.1


