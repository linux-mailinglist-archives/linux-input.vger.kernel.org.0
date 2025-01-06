Return-Path: <linux-input+bounces-8938-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B3A01DA6
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0613A459C
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826291D9A49;
	Mon,  6 Jan 2025 02:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnKTw0CX"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A029158DD8;
	Mon,  6 Jan 2025 02:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130791; cv=none; b=apk3y4OaJvHNUtC4CtTHbxBdxXryIvpZ3KAJ55LUrtIz+scS7mZRyCf7IcLvibrrwnypWjxQDItJHg+azreHSpJ64Mr0f5srZiJP1fbrdG7WQ97wPVlDFHVPiTbK3JIeYkamti5lmMKWWOKJJtPY9Uzks0Li023m3dU72sdBIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130791; c=relaxed/simple;
	bh=KQwLa0AACmagq7GqoHNWbvwFwdAXf/RKkD3PRqdq5Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJPjlzdeZag3HZpZNF6GruhTnD76BcxNb1rwLcOJiLIo/aqbB9pEirDOmLMmWkJEeREPvVNihgdIgj4H7t9mYMUCQ05CCSlp0l3HZKwMT8IbPAFPBeX4A1oPfpkhqJF04M4xFzGlDFTp1CExqM9X3Sd5uA3r/kFd2Yq+1iAfqng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnKTw0CX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130789; x=1767666789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KQwLa0AACmagq7GqoHNWbvwFwdAXf/RKkD3PRqdq5Dc=;
  b=mnKTw0CXS5FOtcMfLASPivmdotpqxZJlobbKBc4cSeAwCW3s/55z7+IP
   kSriK3iwXRmOAHLbtPQsEWsLY8R0F3+b1bH9yQCdBPQTk/2PP63lxWVgw
   Bzh2bKXzxH3OddXJRPKlcGH65r2CKuIobSh9hN+2/Crp2Bb3OKxOEfOU6
   LMgwz6LZ11jKCJVYVwGGUcYSJFci85SzV55BwAexRFKzqy4eaCc9IgCfL
   CJHfnPd6FBeBYSJ8zaTakwiL0oXsAwXHtTv7V0ueeU6J3dDH7nGyXWiPL
   2NKYwhswcrbAp3U+b8r4j9WIxtjvOKgB6ZmZhx9V9FLYrhYZomaPY2Q8e
   A==;
X-CSE-ConnectionGUID: 8yl8TvMKRO+Uc9t7MUpgSA==
X-CSE-MsgGUID: hJKguZ6STw6HhzUGSkxbGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171608"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:33:08 -0800
X-CSE-ConnectionGUID: dGvEgsGRTnKIt/SP5pNcyg==
X-CSE-MsgGUID: X8pI4SQ9SNmgZNwA+xqNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125596106"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:33:05 -0800
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
Subject: [PATCH v4 18/22] HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver hid layer
Date: Mon,  6 Jan 2025 10:31:47 +0800
Message-Id: <20250106023151.3011329-19-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250106023151.3011329-1-even.xu@intel.com>
References: <20250106023151.3011329-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add HID Low level driver callbacks and hid probe function to register
QucikI2C as a HID driver, and external touch device as a HID device.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/hid/intel-thc-hid/Makefile            |   1 +
 .../intel-quicki2c/quicki2c-dev.h             |  11 ++
 .../intel-quicki2c/quicki2c-hid.c             | 142 ++++++++++++++++++
 .../intel-quicki2c/quicki2c-hid.h             |  14 ++
 include/linux/hid-over-i2c.h                  |  44 ++++++
 5 files changed, 212 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.h
 create mode 100644 include/linux/hid-over-i2c.h

diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index 4d4f02e1c415..91bde6d6aa14 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -16,5 +16,6 @@ intel-quickspi-objs += intel-quickspi/quickspi-protocol.o
 
 obj-$(CONFIG_INTEL_QUICKI2C) += intel-quicki2c.o
 intel-quicki2c-objs += intel-quicki2c/pci-quicki2c.o
+intel-quicki2c-objs += intel-quicki2c/quicki2c-hid.o
 
 ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index 90c4ffe5ccfa..9e2a863d8135 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -4,6 +4,8 @@
 #ifndef _QUICKI2C_DEV_H_
 #define _QUICKI2C_DEV_H_
 
+#include <linux/hid-over-i2c.h>
+
 #define THC_LNL_DEVICE_ID_I2C_PORT1	0xA848
 #define THC_LNL_DEVICE_ID_I2C_PORT2	0xA84A
 #define THC_PTL_H_DEVICE_ID_I2C_PORT1	0xE348
@@ -26,23 +28,32 @@ enum quicki2c_dev_state {
 struct device;
 struct pci_dev;
 struct thc_device;
+struct hid_device;
 
 /**
  * struct quicki2c_device -  THC QuickI2C device struct
  * @dev: point to kernel device
  * @pdev: point to PCI device
  * @thc_hw: point to THC device
+ * @hid_dev: point to hid device
  * @driver_data: point to quicki2c specific driver data
  * @state: THC I2C device state
  * @mem_addr: MMIO memory address
+ * @dev_desc: device descriptor for HIDI2C protocol
+ * @report_descriptor: store a copy of device report descriptor
  */
 struct quicki2c_device {
 	struct device *dev;
 	struct pci_dev *pdev;
 	struct thc_device *thc_hw;
+	struct hid_device *hid_dev;
 	enum quicki2c_dev_state state;
 
 	void __iomem *mem_addr;
+
+	struct hidi2c_dev_descriptor dev_desc;
+
+	u8 *report_descriptor;
 };
 
 #endif /* _QUICKI2C_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
new file mode 100644
index 000000000000..4236603f3f76
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#include <linux/hid.h>
+#include <linux/input.h>
+
+#include "quicki2c-dev.h"
+#include "quicki2c-hid.h"
+
+/**
+ * quicki2c_hid_parse() - HID core parse() callback
+ *
+ * @hid: HID device instance
+ *
+ * This function gets called during call to hid_add_device
+ *
+ * Return: 0 on success and non zero on error.
+ */
+static int quicki2c_hid_parse(struct hid_device *hid)
+{
+	struct quicki2c_device *qcdev = hid->driver_data;
+
+	if (qcdev->report_descriptor)
+		return hid_parse_report(hid, qcdev->report_descriptor,
+					le16_to_cpu(qcdev->dev_desc.report_desc_len));
+
+	dev_err_once(qcdev->dev, "invalid report descriptor\n");
+	return -EINVAL;
+}
+
+static int quicki2c_hid_start(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void quicki2c_hid_stop(struct hid_device *hid)
+{
+}
+
+static int quicki2c_hid_open(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void quicki2c_hid_close(struct hid_device *hid)
+{
+}
+
+static int quicki2c_hid_raw_request(struct hid_device *hid,
+				    unsigned char reportnum,
+				    __u8 *buf, size_t len,
+				    unsigned char rtype, int reqtype)
+{
+	return 0;
+}
+
+static int quicki2c_hid_power(struct hid_device *hid, int lvl)
+{
+	return 0;
+}
+
+static struct hid_ll_driver quicki2c_hid_ll_driver = {
+	.parse = quicki2c_hid_parse,
+	.start = quicki2c_hid_start,
+	.stop = quicki2c_hid_stop,
+	.open = quicki2c_hid_open,
+	.close = quicki2c_hid_close,
+	.power = quicki2c_hid_power,
+	.raw_request = quicki2c_hid_raw_request,
+};
+
+/**
+ * quicki2c_hid_probe() - Register HID low level driver
+ *
+ * @qcdev: point to quicki2c device
+ *
+ * This function is used to allocate and add HID device.
+ *
+ * Return: 0 on success, non zero on error.
+ */
+int quicki2c_hid_probe(struct quicki2c_device *qcdev)
+{
+	struct hid_device *hid;
+	int ret;
+
+	hid = hid_allocate_device();
+	if (IS_ERR(hid))
+		return PTR_ERR(hid);
+
+	hid->ll_driver = &quicki2c_hid_ll_driver;
+	hid->bus = BUS_PCI;
+	hid->dev.parent = qcdev->dev;
+	hid->driver_data = qcdev;
+	hid->version = le16_to_cpu(qcdev->dev_desc.version_id);
+	hid->vendor = le16_to_cpu(qcdev->dev_desc.vendor_id);
+	hid->product = le16_to_cpu(qcdev->dev_desc.product_id);
+	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X", "quicki2c-hid",
+		 hid->vendor, hid->product);
+
+	ret = hid_add_device(hid);
+	if (ret) {
+		hid_destroy_device(hid);
+		return ret;
+	}
+
+	qcdev->hid_dev = hid;
+
+	return 0;
+}
+
+/**
+ * quicki2c_hid_remove() - Destroy HID device
+ *
+ * @qcdev: point to quicki2c device
+ *
+ * Return: 0 on success, non zero on error.
+ */
+void quicki2c_hid_remove(struct quicki2c_device *qcdev)
+{
+	hid_destroy_device(qcdev->hid_dev);
+}
+
+/**
+ * quicki2c_hid_send_report() - Send HID input report data to HID core
+ *
+ * @qcdev: point to quicki2c device
+ * @data: point to input report data buffer
+ * @data_len: the length of input report data
+ *
+ * Return: 0 on success, non zero on error.
+ */
+int quicki2c_hid_send_report(struct quicki2c_device *qcdev,
+			     void *data, size_t data_len)
+{
+	int ret;
+
+	ret = hid_input_report(qcdev->hid_dev, HID_INPUT_REPORT, data, data_len, 1);
+	if (ret)
+		dev_err(qcdev->dev, "Failed to send HID input report, ret = %d.\n", ret);
+
+	return ret;
+}
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.h
new file mode 100644
index 000000000000..e80df5f339fe
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _QUICKI2C_HID_H_
+#define _QUICKI2C_HID_H_
+
+struct quicki2c_device;
+
+int quicki2c_hid_send_report(struct quicki2c_device *qcdev,
+			     void *data, size_t data_size);
+int quicki2c_hid_probe(struct quicki2c_device *qcdev);
+void quicki2c_hid_remove(struct quicki2c_device *qcdev);
+
+#endif /* _QUICKI2C_HID_H_ */
diff --git a/include/linux/hid-over-i2c.h b/include/linux/hid-over-i2c.h
new file mode 100644
index 000000000000..b70626723a38
--- /dev/null
+++ b/include/linux/hid-over-i2c.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Intel Corporation */
+
+#ifndef _HID_OVER_I2C_H_
+#define _HID_OVER_I2C_H_
+
+/**
+ * struct hidi2c_dev_descriptor - HIDI2C device descriptor definition
+ * @dev_desc_len: The length of the complete device descriptor, fixed to 0x1E (30).
+ * @bcd_ver: The version number of the HIDI2C protocol supported.
+ *           In binary coded decimal (BCD) format.
+ * @report_desc_len: The length of the report descriptor
+ * @report_desc_reg: The register address to retrieve report descriptor
+ * @input_reg: the register address to retrieve input report
+ * @max_input_len: The length of the largest possible HID input (or feature) report
+ * @output_reg: the register address to send output report
+ * @max_output_len: The length of the largest output (or feature) report
+ * @cmd_reg: the register address to send command
+ * @data_reg: the register address to send command data
+ * @vendor_id: Device manufacturers vendor ID
+ * @product_id: Device unique model/product ID
+ * @version_id: Device’s unique version
+ * @reserved0: Reserved and should be 0
+ * @reserved1: Reserved and should be 0
+ */
+struct hidi2c_dev_descriptor {
+	__le16 dev_desc_len;
+	__le16 bcd_ver;
+	__le16 report_desc_len;
+	__le16 report_desc_reg;
+	__le16 input_reg;
+	__le16 max_input_len;
+	__le16 output_reg;
+	__le16 max_output_len;
+	__le16 cmd_reg;
+	__le16 data_reg;
+	__le16 vendor_id;
+	__le16 product_id;
+	__le16 version_id;
+	__le16 reserved0;
+	__le16 reserved1;
+} __packed;
+
+#endif /* _HID_OVER_I2C_H_ */
-- 
2.40.1


