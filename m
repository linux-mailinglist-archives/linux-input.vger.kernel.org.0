Return-Path: <linux-input+bounces-5582-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A45079527D6
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 04:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31A721F24943
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 02:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEE3C144;
	Thu, 15 Aug 2024 02:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O57W7cQc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CF3BA20
	for <linux-input@vger.kernel.org>; Thu, 15 Aug 2024 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723687818; cv=none; b=UmDRszKxdZUXkkbWnktL3CV7BaiOZqdHKLSbxalpmWeNlF8gRQoEA2id1lb2kJQKITr9drFrgKbr5i5wY1/HRzoa8wyieOwUsJXpjVFwE5z2ABcsVA+rMSkGGKO0HYAbcrg2rwp3kQ13glnyUNh2VPqXC2hb0sOL986bdpmjLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723687818; c=relaxed/simple;
	bh=qy6rFW2Ca7IeP9dj5MULCx0bT5yDxg5gpzSH1XS5jNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h7VYggo9GmGh0xmkY0Y8ahQ7wPnRZ8Fp/0aK5g0quGdZh556P5PV7HFG+PgxoOcH7obR2tQzQdIeftsnhQvNEl1aIYzOv9/9Cg9xDYpyfU0n1/A1qBlse6Eb/D1/jCqn5plaVCJT+yNBYa12qhjhXfm6qcY9Z+e5K9CWs7dbfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O57W7cQc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723687817; x=1755223817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qy6rFW2Ca7IeP9dj5MULCx0bT5yDxg5gpzSH1XS5jNo=;
  b=O57W7cQcZ8bXypYW79wMb5VgDf0/U3olt1pmaXfQ7iS9MKhNEDkQ0wcu
   Xon/lZZirpTzNZNhEmlo/goZ9ap9J5XPPhAVDgITsXcnUzFLMrUonNhR9
   lRkvJPFLfjQC6joP/qZd+Jbul0CLkg2bjt6SgUjPkDSF4oTqP2aJRKcGK
   YP18YXsumK2k82hHpZwXJc2XbiomDduwRDZV/fT/4amqxIL353DFSwbqj
   S2KLASbUe75yoiIzsTOXOCr6XdLzJViMCJ3X32UMFD9ZGey9MUaGkTFYM
   m+Qj6YYMTVLrfy8k5bPTniuUDp6vAv1f4V7QRj2V83H/KgeQvse9iqUZH
   Q==;
X-CSE-ConnectionGUID: txOaXGqoS3KtWolFzuq7bg==
X-CSE-MsgGUID: 4HjgE24CS2G/Yz9PRz0Zvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21796133"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21796133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 19:10:14 -0700
X-CSE-ConnectionGUID: tP7paeRbQymVObfduXp++A==
X-CSE-MsgGUID: D1tukIZyR9KMK5nGborGIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="63635503"
Received: from ipg-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa005.fm.intel.com with ESMTP; 14 Aug 2024 19:10:11 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hemin.han@intel.com,
	yoshi.wang@intel.com,
	even.xu@intel.com,
	ilpo.jarvinen@linux.intel.com
Subject: [PATCH v2 3/3] hid: intel-ish-hid: Add support for vendor customized firmware loading
Date: Thu, 15 Aug 2024 10:10:01 +0800
Message-Id: <20240815021001.936277-4-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240815021001.936277-1-lixu.zhang@intel.com>
References: <20240815021001.936277-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enhance the firmware loader to support the loading of vendor-specific
customized firmware for the Intel Integrated Sensor Hub (ISH). The
loader now constructs firmware file names based on the DMI_SYS_VENDOR,
DMI_PRODUCT_NAME, and DMI_PRODUCT_SKU information in Desktop Management
Interface (DMI). The loader will attempt to load the firmware files
following a specific naming convention in sequence. If successful, it
will skip the remaining files.

For more details, please refer to Documentation/hid/intel-ish-hid.rst.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c  |   2 +
 drivers/hid/intel-ish-hid/ishtp/loader.c | 104 ++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index f20463082dc4..aae0d965b47b 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -31,6 +31,7 @@ enum ishtp_driver_data_index {
 #define ISH_FW_GEN_LNL_M "lnlm"
 
 #define ISH_FIRMWARE_PATH(gen) "intel/ish/ish_" gen ".bin"
+#define ISH_FIRMWARE_PATH_ALL "intel/ish/ish_*.bin"
 
 static struct ishtp_driver_data ishtp_driver_data[] = {
 	[ISHTP_DRIVER_DATA_LNL_M] = {
@@ -400,3 +401,4 @@ MODULE_DESCRIPTION("Intel(R) Integrated Sensor Hub PCI Device Driver");
 MODULE_LICENSE("GPL");
 
 MODULE_FIRMWARE(ISH_FIRMWARE_PATH(ISH_FW_GEN_LNL_M));
+MODULE_FIRMWARE(ISH_FIRMWARE_PATH_ALL);
diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index ff11ee4e38ed..f76c4437a1f5 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -35,8 +35,10 @@
 
 #include <linux/cacheflush.h>
 #include <linux/container_of.h>
+#include <linux/crc32.h>
 #include <linux/dev_printk.h>
 #include <linux/dma-mapping.h>
+#include <linux/dmi.h>
 #include <linux/errno.h>
 #include <linux/firmware.h>
 #include <linux/gfp_types.h>
@@ -193,21 +195,117 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 	return 0;
 }
 
+#define ISH_FW_FILE_VENDOR_NAME_SKU_FMT "intel/ish/ish_%s_%08x_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_SKU_FMT "intel/ish/ish_%s_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_NAME_FMT "intel/ish/ish_%s_%08x_%08x.bin"
+#define ISH_FW_FILE_VENDOR_FMT "intel/ish/ish_%s_%08x.bin"
 #define ISH_FW_FILE_DEFAULT_FMT "intel/ish/ish_%s.bin"
 
 #define ISH_FW_FILENAME_LEN_MAX 56
 
+#define ISH_CRC_INIT (~0u)
+#define ISH_CRC_XOROUT (~0u)
+
+static int _request_ish_firmware(const struct firmware **firmware_p,
+					const char *name, struct device *dev)
+{
+	int ret;
+
+	dev_dbg(dev, "Try to load firmware: %s\n", name);
+	ret = firmware_request_nowarn(firmware_p, name, dev);
+	if (!ret)
+		dev_info(dev, "load firmware: %s\n", name);
+
+	return ret;
+}
+
+/**
+ * request_ish_firmware() - Request and load the ISH firmware.
+ * @firmware_p: Pointer to the firmware image.
+ * @dev: Device for which firmware is being requested.
+ *
+ * This function attempts to load the Integrated Sensor Hub (ISH) firmware
+ * for the given device in the following order, prioritizing custom firmware
+ * with more precise matching patterns:
+ *
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_NAME_CRC32)_${PRODUCT_SKU_CRC32}.bin
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_NAME_CRC32).bin
+ *   ish_${fw_generation}_${SYS_VENDOR_CRC32}.bin
+ *   ish_${fw_generation}.bin
+ *
+ * The driver will load the first matching firmware and skip the rest. If no
+ * matching firmware is found, it will proceed to the next pattern in the
+ * specified order. If all searches fail, the default Intel firmware, listed
+ * last in the order above, will be loaded.
+ *
+ * The firmware file name is constructed using CRC32 checksums of strings.
+ * This is done to create a valid file name that does not contain spaces
+ * or special characters which may be present in the original strings.
+ *
+ * The CRC-32 algorithm uses the following parameters:
+ *   Poly: 0x04C11DB7
+ *   Init: 0xFFFFFFFF
+ *   RefIn: true
+ *   RefOut: true
+ *   XorOut: 0xFFFFFFFF
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
 static int request_ish_firmware(const struct firmware **firmware_p,
 				struct device *dev)
 {
+	const char *gen, *sys_vendor, *product_name, *product_sku;
 	struct ishtp_device *ishtp = dev_get_drvdata(dev);
-	const char *gen;
+	u32 vendor_crc, name_crc, sku_crc;
 	char filename[ISH_FW_FILENAME_LEN_MAX];
+	int ret;
 
 	gen = ishtp->driver_data->fw_generation;
-	snprintf(filename, sizeof(filename), ISH_FW_FILE_DEFAULT_FMT, gen);
+	sys_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
+	product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+
+	if (sys_vendor)
+		vendor_crc = crc32(ISH_CRC_INIT, sys_vendor, strlen(sys_vendor)) ^ ISH_CRC_XOROUT;
+	if (product_name)
+		name_crc = crc32(ISH_CRC_INIT, product_name, strlen(product_name)) ^ ISH_CRC_XOROUT;
+	if (product_sku)
+		sku_crc = crc32(ISH_CRC_INIT, product_sku, strlen(product_sku)) ^ ISH_CRC_XOROUT;
+
+	if (sys_vendor && product_name && product_sku) {
+		snprintf(filename, sizeof(filename), ISH_FW_FILE_VENDOR_NAME_SKU_FMT, gen,
+			 vendor_crc, name_crc, sku_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	if (sys_vendor && product_sku) {
+		snprintf(filename, sizeof(filename), ISH_FW_FILE_VENDOR_SKU_FMT, gen, vendor_crc,
+			 sku_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
 
-	return request_firmware(firmware_p, filename, dev);
+	if (sys_vendor && product_name) {
+		snprintf(filename, sizeof(filename), ISH_FW_FILE_VENDOR_NAME_FMT, gen, vendor_crc,
+			 name_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	if (sys_vendor) {
+		snprintf(filename, sizeof(filename), ISH_FW_FILE_VENDOR_FMT, gen, vendor_crc);
+		ret = _request_ish_firmware(firmware_p, filename, dev);
+		if (!ret)
+			return 0;
+	}
+
+	snprintf(filename, sizeof(filename), ISH_FW_FILE_DEFAULT_FMT, gen);
+	return _request_ish_firmware(firmware_p, filename, dev);
 }
 
 /**
-- 
2.34.1


