Return-Path: <linux-input+bounces-12359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856DAB62F9
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F83D86237E
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DE21FCFF1;
	Wed, 14 May 2025 06:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+H/rt/E"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC204205E26;
	Wed, 14 May 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203655; cv=none; b=i1GdTs5e34FEbUpxnKkcPcY33EjLArpRa9NfIa6leWl/VpWVYivukLPcV9mhYjf0l8k+u9ZLI8IUNf9ry4/uvFUTAA6/DemMqtiH8QhzTfR48/i8kaCmmTwPRGM3uZk6tQrMcJPaTFr9suIJ+JaKV2KMZbbSdYxm6g18OgW9Xmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203655; c=relaxed/simple;
	bh=1tgzxSLFx2JfvRSdwXN0XFOEZ02uDz+Zo/XR6mX329Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=md4QP40cR6nAgz+i6mW+npdNEfZmnVPbABLInr5FMEznvBWgK/qKqYRAjNnYYIvc7trfhlyyZUiaqG5+TEAvpniCI2TevnuQt850bQSWorgdppUmZ1N/1q/HmVJnMj+JstESPjweC++LqaWoNsVTY4mXOCZve5S6pAuivSsXUa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+H/rt/E; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747203654; x=1778739654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1tgzxSLFx2JfvRSdwXN0XFOEZ02uDz+Zo/XR6mX329Y=;
  b=J+H/rt/EkyzYxuleYOBnqYRJrqxE4XQCsBZoaOTirpVwatoiZRjQ/+i4
   /7iZEaush8cta+wfSmekinz+1N86Tjmb1zVi1l/Rt35ysT9iFLD22hSs3
   JZx36+FGOVjCtAgiP1NopDb1lSoBdR3Sd8tKKBFKUltCcG8GivYYCUX8b
   rfkA8o8A7StpHmfwrZVkl1CU2iIONoXMHlimU2koKD5zHo+e/65X7Dsv2
   4P1AV8+LoMRwighm//5Kmyuq7zldgUpK5dGkHFmCwoFyGKPaXRkfyqfhb
   ejA/bUiNkqfhN2Cs747UQb0OoecqoyXpiCsRqhzauBTui+gb0EhSjd88M
   A==;
X-CSE-ConnectionGUID: p93DycxcQqGcFPmwW+ogjw==
X-CSE-MsgGUID: 7tTzALOvToSIaI1etcGggw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48192377"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48192377"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:20:53 -0700
X-CSE-ConnectionGUID: NYg76PM8RbuHQqssV3qHhw==
X-CSE-MsgGUID: vMEEcurzR0iSBWsYcyq/vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138867032"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 23:20:52 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Chong Han <chong.han@intel.com>
Subject: [PATCH v1 7/7] HID: Intel-thc-hid: Intel-quicki2c: Add two new features to PTL
Date: Wed, 14 May 2025 14:19:44 +0800
Message-Id: <20250514061944.125857-8-even.xu@intel.com>
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

On Panther Lake platform (PTL), THC hardware introduces two new features
for I2C subsystem:
- Input max input size control
- Input interrupt delay

This patch adds above new advanced features into QuickI2C driver, and
enables max input size control feature on PTL to improve QuickI2C
driver compatibility.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Chong Han <chong.han@intel.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 62 +++++++++++++++++--
 .../intel-quicki2c/quicki2c-dev.h             |  6 ++
 2 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 918cb9eb6b50..40faba5bd81d 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -18,6 +18,10 @@
 #include "quicki2c-hid.h"
 #include "quicki2c-protocol.h"
 
+struct quicki2c_ddata ptl_ddata = {
+	.max_detect_size = MAX_RX_DETECT_SIZE_PTL,
+};
+
 /* THC QuickI2C ACPI method to get device properties */
 /* HIDI2C device method */
 static guid_t i2c_hid_guid =
@@ -413,6 +417,50 @@ static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
 	qcdev->state = QUICKI2C_DISABLED;
 }
 
+/**
+ * quicki2c_dma_adv_enable - Configure and enable DMA advanced features
+ * @qcdev: Pointer to the quicki2c_device structure
+ *
+ * If platform supports THC DMA advanced features, such as max input size
+ * control or interrupt delay, configures and enables them.
+ */
+static void quicki2c_dma_adv_enable(struct quicki2c_device *qcdev)
+{
+	/*
+	 * If platform supports max input size control feature and touch device
+	 * max input length <= THC detect capability, enable the feature with device
+	 * max input length.
+	 */
+	if (qcdev->ddata->max_detect_size >=
+	    le16_to_cpu(qcdev->dev_desc.max_input_len)) {
+		thc_i2c_set_rx_max_size(qcdev->thc_hw,
+					le16_to_cpu(qcdev->dev_desc.max_input_len));
+		thc_i2c_rx_max_size_enable(qcdev->thc_hw, true);
+	}
+
+	/* If platform supports interrupt delay feature, enable it with given delay */
+	if (qcdev->ddata->interrupt_delay) {
+		thc_i2c_set_rx_int_delay(qcdev->thc_hw,
+					 qcdev->ddata->interrupt_delay);
+		thc_i2c_rx_int_delay_enable(qcdev->thc_hw, true);
+	}
+}
+
+/**
+ * quicki2c_dma_adv_disable - Disable DMA advanced features
+ * @qcdev: Pointer to the quicki2c device structure
+ *
+ * Disable all DMA advanced features if platform supports.
+ */
+static void quicki2c_dma_adv_disable(struct quicki2c_device *qcdev)
+{
+	if (qcdev->ddata->max_detect_size)
+		thc_i2c_rx_max_size_enable(qcdev->thc_hw, false);
+
+	if (qcdev->ddata->interrupt_delay)
+		thc_i2c_rx_int_delay_enable(qcdev->thc_hw, false);
+}
+
 /**
  * quicki2c_dma_init - Configure THC DMA for QuickI2C device
  * @qcdev: Pointer to the quicki2c_device structure
@@ -452,6 +500,9 @@ static int quicki2c_dma_init(struct quicki2c_device *qcdev)
 		return ret;
 	}
 
+	if (qcdev->ddata)
+		quicki2c_dma_adv_enable(qcdev);
+
 	return 0;
 }
 
@@ -466,6 +517,9 @@ static void quicki2c_dma_deinit(struct quicki2c_device *qcdev)
 {
 	thc_dma_unconfigure(qcdev->thc_hw);
 	thc_dma_release(qcdev->thc_hw);
+
+	if (qcdev->ddata)
+		quicki2c_dma_adv_disable(qcdev);
 }
 
 /**
@@ -929,10 +983,10 @@ static const struct dev_pm_ops quicki2c_pm_ops = {
 static const struct pci_device_id quicki2c_pci_tbl[] = {
 	{ PCI_DEVICE_DATA(INTEL, THC_LNL_DEVICE_ID_I2C_PORT1, NULL) },
 	{ PCI_DEVICE_DATA(INTEL, THC_LNL_DEVICE_ID_I2C_PORT2, NULL) },
-	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT1, NULL) },
-	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2, NULL) },
-	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1, NULL) },
-	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2, NULL) },
+	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT1, &ptl_ddata) },
+	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
+	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1, &ptl_ddata) },
+	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, quicki2c_pci_tbl);
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index e130598d13c1..93d6fa982d60 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -36,6 +36,12 @@
 #define QUICKI2C_DEFAULT_LP_LTR_VALUE		500
 #define QUICKI2C_RPM_TIMEOUT_MS			500
 
+/* PTL Max packet size detection capability is 255 Bytes */
+#define MAX_RX_DETECT_SIZE_PTL			255
+
+/* Default interrupt delay is 1ms, suitable for most devices */
+#define DEFAULT_INTERRUPT_DELAY_US		(1 * USEC_PER_MSEC)
+
 /*
  * THC uses runtime auto suspend to dynamically switch between THC active LTR
  * and low power LTR to save CPU power.
-- 
2.40.1


