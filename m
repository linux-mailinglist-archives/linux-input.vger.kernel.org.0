Return-Path: <linux-input+bounces-12355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB2AB62E5
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E05E7AC6BB
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09C720010A;
	Wed, 14 May 2025 06:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+gol6pt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A71FE474;
	Wed, 14 May 2025 06:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203642; cv=none; b=blIFc7a8vH3kHCsKmzElhRYYH5Skn/rnljTvXiq5bRRTjM7Urzme+Xgu6I/9iOev1Q10mAYKr3cvkMC78XoucYLqNn85Do+V6w9n51m5ray/Lr6CQpNXi8AxlE7ibqEh9X83p8dg4lKa1tL0u/vcVYFqOf3HIuMkJmdKlhmE3DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203642; c=relaxed/simple;
	bh=phlcrKtcm+r39C2cbk9/jB1NX/uIKinxItUj6OZTG40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N2fAWSRUL8mYBl/8bTHRb3TUTTaupQyR5cqYT/Dk0plXn653UP3/JNAyIs5PZFjPmVlyXM778ZoIrcxvl1H9yfSIdE9Ep/chTAmYosQRweN1kUKjHxSqOxESQ7HiztiXLHuC6iEniF/2O+AN6oFPoN0Ir/5fnDjxXwK1VXVY3ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+gol6pt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747203641; x=1778739641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=phlcrKtcm+r39C2cbk9/jB1NX/uIKinxItUj6OZTG40=;
  b=b+gol6ptd8thXoGkJTlFwY4SOujWLDxoI9G3OC/stElW7kLWJrybh/vG
   wxleOUbFymcFinQqcCl5YmtP9SHEtXE2J1EkNODwysvM5xrHwQ3mjdz/x
   IyUkMGIN/O5HRGzkz3Q3UWRd64YTsOUGevaxZhFzoo8sQYvKvS3ExQm3N
   ZDsYiSc3M3oHPb421nzDhcCPsYIAVjW5OY/p02/T78aoR+fj2szXppGHd
   sc9pPDk+gNvlAX7ASazwwJ3CNX8zR1NgwgcaAD1QBj4Wh3o9az7Yzk5iq
   SvLArW0m1yuY/3+LHWB+CwcPdJcg7HmjhF0HXKdqbfc+YRZwqLgEJDCbZ
   g==;
X-CSE-ConnectionGUID: R8PutnWtRcaETqdRqHXE0g==
X-CSE-MsgGUID: nZm9Dv1pQBu/Ch5mp+QGbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48192363"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48192363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:20:40 -0700
X-CSE-ConnectionGUID: Niao6WWbRh+/1GZpNpUIGQ==
X-CSE-MsgGUID: u+mGJKl+R+2+RKgTG5DmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138866977"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 23:20:40 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v1 2/7] HID: Intel-thc-hid: Intel-thc: Refine code comments
Date: Wed, 14 May 2025 14:19:39 +0800
Message-Id: <20250514061944.125857-3-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250514061944.125857-1-even.xu@intel.com>
References: <20250514061944.125857-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align capitalization of the first characters for THC structure
definition comments in header files.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   | 16 ++++++-------
 .../intel-thc-hid/intel-thc/intel-thc-dma.h   | 24 +++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
index 0517fee2c668..fb4d9d875860 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
@@ -52,16 +52,16 @@ enum thc_int_type {
  * struct thc_device - THC private device struct
  * @thc_regmap: MMIO regmap structure for accessing THC registers
  * @mmio_addr: MMIO registers address
- * @thc_bus_lock: mutex locker for THC config
- * @port_type: port type of THC port instance
+ * @thc_bus_lock: Mutex locker for THC config
+ * @port_type: Port type of THC port instance
  * @pio_int_supported: PIO interrupt supported flag
  * @dma_ctx: DMA specific data
- * @write_complete_wait: signal event for DMA write complete
- * @swdma_complete_wait: signal event for SWDMA sequence complete
- * @write_done: bool value that indicates if DMA write is done
- * @swdma_done: bool value that indicates if SWDMA swquence is done
- * @perf_limit: the delay between read operation and write operation
- * @i2c_subip_regs: the copy of THC I2C sub-system registers for resuming restore
+ * @write_complete_wait: Signal event for DMA write complete
+ * @swdma_complete_wait: Signal event for SWDMA sequence complete
+ * @write_done: Bool value that indicates if DMA write is done
+ * @swdma_done: Bool value that indicates if SWDMA sequence is done
+ * @perf_limit: The delay between read operation and write operation
+ * @i2c_subip_regs: The copy of THC I2C sub-system registers for resuming restore
  */
 struct thc_device {
 	struct device *dev;
diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
index f799d1180e55..2664f35383d1 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
@@ -27,7 +27,7 @@
 
 /**
  * THC DMA channels:
- * @THC_RXDMA1: legacy channel, reserved for raw data reading
+ * @THC_RXDMA1: Legacy channel, reserved for raw data reading
  * @THC_RXDMA2: DMA to read HID data from touch device
  * @THC_TXDMA: DMA to write to touch device
  * @THC_SWDMA: SW triggered DMA to write and read from touch device
@@ -42,11 +42,11 @@ enum thc_dma_channel {
 
 /**
  * THC DMA Physical Memory Descriptor (PRD)
- * @dest_addr:		bit[53:0], destination address in system memory
- * @int_on_completion:	bit[63], if set, thc will trigger interrupt to driver
- * @len:		bit[87:64], length of this entry
- * @end_of_prd:		bit[88], if set, this entry is last one of current PRD table
- * @hw_status:		bit[90:89], hw status bits
+ * @dest_addr:		Bit[53:0], destination address in system memory
+ * @int_on_completion:	Bit[63], if set, thc will trigger interrupt to driver
+ * @len:		Bit[87:64], length of this entry
+ * @end_of_prd:		Bit[88], if set, this entry is last one of current PRD table
+ * @hw_status:		Bit[90:89], hardware status bits
  */
 struct thc_prd_entry {
 	u64  dest_addr : 54;
@@ -88,14 +88,14 @@ struct thc_prd_table {
  * struct thc_dma_configuration - THC DMA configure
  * @dma_channel: DMA channel for current DMA configuration
  * @prd_tbls_dma_handle: DMA buffer handle
- * @dir: direction of DMA for this config
+ * @dir: Direction of DMA for this config
  * @prd_tbls: PRD tables for current DMA
- * @sgls: array of pointers to scatter-gather lists
- * @sgls_nent: actual number of entries per sg list
- * @prd_tbl_num: actual number of PRD tables
- * @max_packet_size: size of the buffer needed for 1 DMA message (1 PRD table)
+ * @sgls: Array of pointers to scatter-gather lists
+ * @sgls_nent: Actual number of entries per scatter-gather list
+ * @prd_tbl_num: Actual number of PRD tables
+ * @max_packet_size: Size of the buffer needed for 1 DMA message (1 PRD table)
  * @prd_base_addr_high: High 32bits memory address where stores PRD table
- * @prd_base_addr_low: low 32bits memory address where stores PRD table
+ * @prd_base_addr_low: Low 32bits memory address where stores PRD table
  * @prd_cntrl: PRD control register value
  * @dma_cntrl: DMA control register value
  */
-- 
2.40.1


