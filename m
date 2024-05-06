Return-Path: <linux-input+bounces-3477-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F6E8BC574
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 03:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 794AD1F211FF
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 01:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912D22FB6;
	Mon,  6 May 2024 01:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhPBC1XN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2B381AA
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 01:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714959049; cv=none; b=S6C9f/GrOa4zDkDSBoYLAp1fwr5Gm5B7yIs5f6VgsfDtxLnilZJCL8wSBA8Hrih1R4iYCobKVckYR5EltxJG6xVb0h+yfw/i4b4xCROz9iUkvQdUJqTI78q14GcryK0k+M3Xc6jPwO5D/5N3hn2xqk34cTGaPP+Jh1+TNzVWHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714959049; c=relaxed/simple;
	bh=EyJAlViozMA94Ttsq4HfOHgRMN2VJ6zTyHW2xv6rIwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JwrpQgmgv8/KvytxyAquMop1b2l5JhBXusp+KmdndQ864dPVFn4hXyMWaW/1ekTgTPNNk1HsoRDNIek/CdBXWZCzPdZZ7lFmRDUS5RxMeyctJZ7wmhuDHsvuX1A2B6bzkBCzs0bc2Kjjh3w1/iiw0rOcq03meZQLGS2SALZETW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhPBC1XN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714959048; x=1746495048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EyJAlViozMA94Ttsq4HfOHgRMN2VJ6zTyHW2xv6rIwc=;
  b=jhPBC1XNcU5pVVHopz6kktMm8v+6ULsV20wRNHERVWyYyLdyAlfyZh8J
   OhaLOeN/JRi0Aq2tw0emTSH2LkjhL2BOMqTxSNVe+ongIgAAy7HQVOLzo
   8+nN9pWUXESV/m8XabXZVrSG01lqno2HBlLbaYUxTvPBHfT0KqVg2VxpP
   YHohoi+Zoykcm+FBT+i2qT3WjlqSx0NnVH64FMP2K+KtQF+JqygbZzYqc
   Eewt+2OHWTrvYWGNIdW+LR61nPMy+b6V4X0JDFsoSOKucO68oU5/I0w08
   gggSaeirU3CD6LzugAToTOIpJrFusq+6V4+Wv6GSV9XPSJX337vRfzrwh
   Q==;
X-CSE-ConnectionGUID: kGksXvg6RAqLIVBPo2/MjQ==
X-CSE-MsgGUID: TBLbwPWOQaO/SRpZBX2dRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14503867"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14503867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 18:30:48 -0700
X-CSE-ConnectionGUID: fCtp+2E7QxmKBr2hm1JjyA==
X-CSE-MsgGUID: jwbBn9gpTtWU2QY5sCSsRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28092913"
Received: from unknown (HELO ipg-l-lixuzha.sh.intel.com) ([10.239.153.157])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 18:30:46 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 3/5] HID: intel-ish-hid: Add driver_data for specifying the firmware filename
Date: Mon,  6 May 2024 09:30:38 +0800
Message-Id: <20240506013040.10700-4-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506013040.10700-1-lixu.zhang@intel.com>
References: <20240506013040.10700-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces a new structure, ishtp_driver_data, to hold driver-specific
data, including the firmware filename for different hardware variants of
the Intel Integrated Sensor Hub (ISH).

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c     | 18 +++++++++++++++++-
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h | 17 +++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index e79d72f7db2a..d487227085b2 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -23,6 +23,19 @@
 #include "ishtp-dev.h"
 #include "hw-ish.h"
 
+enum ishtp_driver_data_index {
+	ISHTP_DRIVER_DATA_NONE,
+	ISHTP_DRIVER_DATA_LNL_M,
+};
+
+#define ISH_FW_FILENAME_LNL_M "intel/ish/ish_lnlm.bin"
+
+static struct ishtp_driver_data ishtp_driver_data[] = {
+	[ISHTP_DRIVER_DATA_LNL_M] = {
+		.fw_filename = ISH_FW_FILENAME_LNL_M,
+	},
+};
+
 static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_CHV)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_BXT_Ax)},
@@ -46,7 +59,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_MTL_P)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_H)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_S)},
-	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_LNL_M)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_LNL_M), .driver_data = ISHTP_DRIVER_DATA_LNL_M},
 	{}
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
@@ -167,6 +180,7 @@ static int ish_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 	hw = to_ish_hw(ishtp);
 	ishtp->print_log = ish_event_tracer;
+	ishtp->driver_data = &ishtp_driver_data[ent->driver_data];
 
 	/* mapping IO device memory */
 	hw->mem_addr = pcim_iomap_table(pdev)[0];
@@ -377,3 +391,5 @@ MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 
 MODULE_DESCRIPTION("Intel(R) Integrated Sensor Hub PCI Device Driver");
 MODULE_LICENSE("GPL");
+
+MODULE_FIRMWARE(ISH_FW_FILENAME_LNL_M);
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index 32142c7d9a04..ed294bf0bc8f 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -122,12 +122,29 @@ struct ishtp_hw_ops {
 	bool	(*dma_no_cache_snooping)(struct ishtp_device *dev);
 };
 
+/**
+ * struct ishtp_driver_data - Driver-specific data for ISHTP devices
+ *
+ * This structure holds driver-specific data that can be associated with each
+ * ISHTP device instance. It allows for the storage of data that is unique to
+ * a particular driver or hardware variant.
+ *
+ * @fw_filename: The firmware filename associated with a specific hardware
+ *               variant of the Intel Integrated Sensor Hub (ISH). This allows
+ *               the driver to load the correct firmware based on the device's
+ *               hardware variant.
+ */
+struct ishtp_driver_data {
+	char *fw_filename;
+};
+
 /**
  * struct ishtp_device - ISHTP private device struct
  */
 struct ishtp_device {
 	struct device *devc;	/* pointer to lowest device */
 	struct pci_dev *pdev;	/* PCI device to get device ids */
+	struct ishtp_driver_data *driver_data; /* pointer to driver-specific data */
 
 	/* waitq for waiting for suspend response */
 	wait_queue_head_t suspend_wait;
-- 
2.34.1


