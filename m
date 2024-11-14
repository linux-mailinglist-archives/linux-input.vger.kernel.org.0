Return-Path: <linux-input+bounces-8084-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE59C8294
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E94CB272C0
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEC41F7789;
	Thu, 14 Nov 2024 05:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndRtSAAn"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44311F76CE;
	Thu, 14 Nov 2024 05:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731562506; cv=none; b=btH/QDM84th5ANH90AM5YQ5TUz58dwS7gZLYcBX6fCuIfTDmebQafk6P82GHJ6N7RdTNutyJBmuLRFPCzQZ+b7Zrj+omdbZ+sNGOuT9W3k8vcHmXcscGAEy5I0GGoWKmiN6HG2jVLtVNvnyLQjp0GVBKrxjYYjo10kE46JvrgdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731562506; c=relaxed/simple;
	bh=ShjIkkth7DR2pEL1lZvmZ7T0ZEHaEQ6BMb9wSggmXkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jSWF+4HK2ksu7aOC84akr4aElfNGVv1fg+lKjqWyFoezgE1xiQrK0OLzFAUHGYEx+04m6uYf+rW93U+//vfXWFxqEQhNvnj+UC5KQoHvP3drXgrWSvGfxz4J1iI6b+4m9H7heKnygR70s/VnC+FInItup+jto5/dITcQVcpicA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndRtSAAn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731562505; x=1763098505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ShjIkkth7DR2pEL1lZvmZ7T0ZEHaEQ6BMb9wSggmXkU=;
  b=ndRtSAAnvOo2Tyxslmjyiqz6ePz9K6pgGQ5X/T3nRshuH8GOw341B3lH
   nqjFNTzX1iOops9/+nY3iZ9TmSkHTnZ21KA1jVHXMFcHyQ10A7C5KpSKP
   bF95D728fyGHLT7rdkGNK5wbmI0nHYC+6vLsgsnZtG7q9RqO6GjAe+e+c
   QbtwsFN44k2JLokhqs8AFElOvoYSLcJbFk6NTuCmeh/YloXa96uvLl8Gs
   FHyn3nRfyu0dVDTT1K0px4BiDtoN1wc8DQOfM1yJJJwnRgCTDPUvWRY4e
   X4fd3FgiPrT08y2y+ASJoau/VT4RdM2VKLHCqRL1gqSCSgbZLjmsEX5Bg
   w==;
X-CSE-ConnectionGUID: Gyo6pj3iTMmHqZJY6GtBrQ==
X-CSE-MsgGUID: whhZyQOKRKqwDnIFK6wPew==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30869105"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="30869105"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 21:35:04 -0800
X-CSE-ConnectionGUID: E//XSgg3TSOxGnIKlcSdgw==
X-CSE-MsgGUID: pkjsET8xRGGULwLkzDP0jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="92891621"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2024 21:35:01 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 13/22] HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
Date: Thu, 14 Nov 2024 13:34:07 +0800
Message-Id: <20241114053416.4085715-14-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241114053416.4085715-1-even.xu@intel.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add functions to query QuickSPI ACPI DSD parameters and provide APIs for
DSM method accessing.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-quickspi/pci-quickspi.c             | 189 ++++++++++++++++++
 .../intel-quickspi/quickspi-dev.h             |  54 +++++
 2 files changed, 243 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index ae17341503b4..707068b5dc4d 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -1,6 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (c) 2024 Intel Corporation */
 
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -9,6 +11,7 @@
 #include <linux/pci.h>
 
 #include "intel-thc-dev.h"
+#include "intel-thc-hw.h"
 
 #include "quickspi-dev.h"
 
@@ -24,6 +27,186 @@ struct quickspi_driver_data ptl = {
 	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL,
 };
 
+/* THC QuickSPI ACPI method to get device properties */
+/* HIDSPI Method: {6e2ac436-0fcf-41af-a265-b32a220dcfab} */
+static guid_t hidspi_guid =
+	GUID_INIT(0x6e2ac436, 0x0fcf, 0x41af, 0xa2, 0x65, 0xb3, 0x2a,
+		  0x22, 0x0d, 0xcf, 0xab);
+
+/* QuickSpi Method: {300D35b7-ac20-413e-8e9c-92e4dafd0afe} */
+static guid_t thc_quickspi_guid =
+	GUID_INIT(0x300d35b7, 0xac20, 0x413e, 0x8e, 0x9c, 0x92, 0xe4,
+		  0xda, 0xfd, 0x0a, 0xfe);
+
+/* Platform Method: {84005682-5b71-41a4-0x8d668130f787a138} */
+static guid_t thc_platform_guid =
+	GUID_INIT(0x84005682, 0x5b71, 0x41a4, 0x8d, 0x66, 0x81, 0x30,
+		  0xf7, 0x87, 0xa1, 0x38);
+
+/**
+ * thc_acpi_get_property - Query device ACPI parameter
+ *
+ * @adev: point to ACPI device
+ * @guid: ACPI method's guid
+ * @rev: ACPI method's revision
+ * @func: ACPI method's function number
+ * @type: ACPI parameter's data type
+ * @prop_buf: point to return buffer
+ *
+ * This is a helper function for device to query its ACPI parameters.
+ *
+ * Return: 0 if successful or ENODEV on failed.
+ */
+static int thc_acpi_get_property(struct acpi_device *adev, const guid_t *guid,
+				 u64 rev, u64 func, acpi_object_type type, void *prop_buf)
+{
+	acpi_handle handle = acpi_device_handle(adev);
+	union acpi_object *obj;
+
+	obj = acpi_evaluate_dsm_typed(handle, guid, rev, func, NULL, type);
+	if (!obj) {
+		acpi_handle_err(handle,
+				"Error _DSM call failed, rev: %llu, func: %llu, type: %u\n",
+				rev, func, type);
+		return -ENODEV;
+	}
+
+	if (type == ACPI_TYPE_INTEGER)
+		*(u32 *)prop_buf = (u32)obj->integer.value;
+	else if (type == ACPI_TYPE_BUFFER)
+		memcpy(prop_buf, obj->buffer.pointer, obj->buffer.length);
+
+	ACPI_FREE(obj);
+
+	return 0;
+}
+
+/**
+ * quickspi_get_acpi_resources - Query all quickspi devices' ACPI parameters
+ *
+ * @qsdev: point to quickspi device
+ *
+ * This function gets all quickspi devices' ACPI resource.
+ *
+ * Return: 0 if successful or error code on failed.
+ */
+static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(qsdev->dev);
+	int ret = -EINVAL;
+
+	if (!adev) {
+		dev_err(qsdev->dev, "no valid ACPI companion\n");
+		return ret;
+	}
+
+	qsdev->acpi_dev = adev;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_HDR_ADDR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->input_report_hdr_addr);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_BDY_ADDR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->input_report_bdy_addr);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_OUTPUT_REP_ADDR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->output_report_addr);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_READ_OPCODE,
+				    ACPI_TYPE_BUFFER,
+				    &qsdev->spi_read_opcode);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_WRITE_OPCODE,
+				    ACPI_TYPE_BUFFER,
+				    &qsdev->spi_write_opcode);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_IO_MODE,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->spi_read_io_mode);
+	if (ret)
+		return ret;
+
+	if (qsdev->spi_read_io_mode & SPI_WRITE_IO_MODE)
+		qsdev->spi_write_io_mode = FIELD_GET(SPI_IO_MODE_OPCODE, qsdev->spi_read_io_mode);
+	else
+		qsdev->spi_write_io_mode = THC_SINGLE_IO;
+
+	qsdev->spi_read_io_mode = FIELD_GET(SPI_IO_MODE_OPCODE, qsdev->spi_read_io_mode);
+
+	ret = thc_acpi_get_property(adev, &thc_quickspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_CONNECTION_SPEED,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->spi_freq_val);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &thc_quickspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_LIMIT_PACKET_SIZE,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->limit_packet_size);
+	if (ret)
+		return ret;
+
+	if (qsdev->limit_packet_size || !qsdev->driver_data)
+		qsdev->spi_packet_size = DEFAULT_MIN_PACKET_SIZE_VALUE;
+	else
+		qsdev->spi_packet_size = qsdev->driver_data->max_packet_size_value;
+
+	ret = thc_acpi_get_property(adev, &thc_quickspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_PERFORMANCE_LIMIT,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->performance_limit);
+	if (ret)
+		return ret;
+
+	qsdev->performance_limit = FIELD_GET(PERFORMANCE_LIMITATION, qsdev->performance_limit);
+
+	ret = thc_acpi_get_property(adev, &thc_platform_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_ACTIVE_LTR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->active_ltr_val);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &thc_platform_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_LP_LTR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->low_power_ltr_val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * quickspi_irq_quick_handler - The ISR of the quickspi driver
  *
@@ -113,6 +296,12 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
 		return ERR_PTR(ret);
 	}
 
+	ret = quickspi_get_acpi_resources(qsdev);
+	if (ret) {
+		dev_err(dev, "Get ACPI resources failed, ret = %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
 	thc_interrupt_config(qsdev->thc_hw);
 
 	thc_interrupt_enable(qsdev->thc_hw, true);
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
index 335b32363d7f..deb24dd1a0fa 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -15,6 +15,28 @@
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT1	0xE449
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT2	0xE44B
 
+/* HIDSPI special ACPI parameters DSM methods */
+#define ACPI_QUICKSPI_REVISION_NUM			2
+#define ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_HDR_ADDR	1
+#define ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_BDY_ADDR	2
+#define ACPI_QUICKSPI_FUNC_NUM_OUTPUT_REP_ADDR		3
+#define ACPI_QUICKSPI_FUNC_NUM_READ_OPCODE		4
+#define ACPI_QUICKSPI_FUNC_NUM_WRITE_OPCODE		5
+#define ACPI_QUICKSPI_FUNC_NUM_IO_MODE			6
+
+/* QickSPI device special ACPI parameters DSM methods */
+#define ACPI_QUICKSPI_FUNC_NUM_CONNECTION_SPEED		1
+#define ACPI_QUICKSPI_FUNC_NUM_LIMIT_PACKET_SIZE	2
+#define ACPI_QUICKSPI_FUNC_NUM_PERFORMANCE_LIMIT	3
+
+/* Platform special ACPI parameters DSM methods */
+#define ACPI_QUICKSPI_FUNC_NUM_ACTIVE_LTR		1
+#define ACPI_QUICKSPI_FUNC_NUM_LP_LTR			2
+
+#define SPI_WRITE_IO_MODE				BIT(13)
+#define SPI_IO_MODE_OPCODE				GENMASK(15, 14)
+#define PERFORMANCE_LIMITATION				GENMASK(15, 0)
+
 /* Packet size value, the unit is 16 bytes */
 #define DEFAULT_MIN_PACKET_SIZE_VALUE			4
 #define MAX_PACKET_SIZE_VALUE_MTL			128
@@ -41,6 +63,7 @@ struct device;
 struct pci_dev;
 struct thc_device;
 struct hid_device;
+struct acpi_device;
 
 /**
  * struct quickspi_device -  THC QuickSpi device struct
@@ -48,10 +71,26 @@ struct hid_device;
  * @pdev: point to PCI device
  * @thc_hw: point to THC device
  * @hid_dev: point to hid device
+ * @acpi_dev: point to ACPI device
  * @driver_data: point to quickspi specific driver data
  * @state: THC SPI device state
  * @mem_addr: MMIO memory address
  * @dev_desc: device descriptor for HIDSPI protocol
+ * @input_report_hdr_addr: device input report header address
+ * @input_report_bdy_addr: device input report body address
+ * @output_report_bdy_addr: device output report address
+ * @spi_freq_val: device supported max SPI frequnecy, in Hz
+ * @spi_read_io_mode: device supported SPI read io mode
+ * @spi_write_io_mode: device supported SPI write io mode
+ * @spi_read_opcode: device read opcode
+ * @spi_write_opcode: device write opcode
+ * @limit_packet_size: 1 - limit read/write packet to 64Bytes
+ *                     0 - device no packet size limiation for read/write
+ * @performance_limit: delay time, in ms.
+ *                     if device has performance limitation, must give a delay
+ *                     before write operation after a read operation.
+ * @active_ltr_val: THC active LTR value
+ * @low_power_ltr_val: THC low power LTR value
  * @report_descriptor: store a copy of device report descriptor
  */
 struct quickspi_device {
@@ -59,12 +98,27 @@ struct quickspi_device {
 	struct pci_dev *pdev;
 	struct thc_device *thc_hw;
 	struct hid_device *hid_dev;
+	struct acpi_device *acpi_dev;
 	struct quickspi_driver_data *driver_data;
 	enum quickspi_dev_state state;
 
 	void __iomem *mem_addr;
 
 	struct hidspi_dev_descriptor dev_desc;
+	u32 input_report_hdr_addr;
+	u32 input_report_bdy_addr;
+	u32 output_report_addr;
+	u32 spi_freq_val;
+	u32 spi_read_io_mode;
+	u32 spi_write_io_mode;
+	u32 spi_read_opcode;
+	u32 spi_write_opcode;
+	u32 limit_packet_size;
+	u32 spi_packet_size;
+	u32 performance_limit;
+
+	u32 active_ltr_val;
+	u32 low_power_ltr_val;
 
 	u8 *report_descriptor;
 };
-- 
2.40.1


