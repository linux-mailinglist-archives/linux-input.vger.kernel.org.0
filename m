Return-Path: <linux-input+bounces-5535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC794FC69
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 05:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405CF1F21F75
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 03:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5717918EAB;
	Tue, 13 Aug 2024 03:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UumnHofd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF501CAA4
	for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 03:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723520869; cv=none; b=nFdRzRwGEmhGCSd1Z7MrEzDoqqec4fmcMdZDoFsvZLq9CYASN+nvxFKoknOoPrcK/YGJTQwI4D0wnAu/gh8txi5brOfojp0ptBdIihUzoeX1Xv1Z5vyxBjjild9Qu+eHNQsPf5/bYJYuYT4YujUvaC9c8dZQlf7sIya4+1X6UvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723520869; c=relaxed/simple;
	bh=XexzcJYzVKR5+ZDWKdJxzylbfimXqoCF5XLfEW0eNwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QgtEI+HIhAdCZ5jMrBbVG/0kPZIm8bRnberRW6hPrUWzC0VDzj8lh93wF8XK1wm/ZZrG0SZEE3ioGK834jkQphz7fS885UrBtETBwvDeovikS+FUFkybGI+WBVQsPZsyb7rq+FGoSJBHxMD4kGNuHPG7eVNMBP02fKZQbLXBLFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UumnHofd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723520868; x=1755056868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XexzcJYzVKR5+ZDWKdJxzylbfimXqoCF5XLfEW0eNwI=;
  b=UumnHofdB+b3uifFaIZ4kPo1hPRU6BfLrKaYAOKZPi++1piEr0qt9BR/
   R2uVv5olguKCHIDnHSRtLnO/68lFwf6x6D6ZP0Q290r5uWs76cPwEkBNn
   L44Bpq3Gip5gGfZYDht0x+HVnne3kO6po8v8aDXPhY8ZAbkbTn8AxVXhl
   CRTRSEkIyyDCRy8VmVB8C4eSf1EUIg6pRKx0GyVVcMgLjqYcNyPVp99DD
   zNg2npoLWKuhkwhAaFrnr9m5ubwk66SawQCgkXXhde15h2uY6WvEnKtoS
   vXDO24kzeDtOhq4ZlFeUj/tkGD6w6xuaJyh9YpEruIhYDt4XGXU2j0VAt
   A==;
X-CSE-ConnectionGUID: eIEQAt1lQ0S+kZjR4REcQQ==
X-CSE-MsgGUID: xclXrZleQo6GuuqxeLGjlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21819918"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21819918"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 20:47:47 -0700
X-CSE-ConnectionGUID: IofHxrNrS3+eP5RGavtv0Q==
X-CSE-MsgGUID: hExiOn1ST4O7VfygbGf90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58396428"
Received: from ipg-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2024 20:47:45 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hemin.han@intel.com,
	yoshi.wang@intel.com,
	even.xu@intel.com
Subject: [PATCH 3/3] hid: intel-ish-hid: Add support for vendor customized firmware loading
Date: Tue, 13 Aug 2024 11:47:36 +0800
Message-Id: <20240813034736.812475-4-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240813034736.812475-1-lixu.zhang@intel.com>
References: <20240813034736.812475-1-lixu.zhang@intel.com>
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
index b4b15279c9c4..11f1a08e17f4 100644
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
 #define ISH_FW_FILE_DEFALUT_FMT "intel/ish/ish_%s.bin"
 
 #define ISH_FW_FILENAME_LEN_MAX 56
 
+#define ISH_CRC_INIT (~0u)
+#define ISH_CRC_XOROUT (~0u)
+
+static inline int _request_ish_firmware(const struct firmware **firmware_p,
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
-	snprintf(filename, sizeof(filename), ISH_FW_FILE_DEFALUT_FMT, gen);
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
+	snprintf(filename, sizeof(filename), ISH_FW_FILE_DEFALUT_FMT, gen);
+	return _request_ish_firmware(firmware_p, filename, dev);
 }
 
 /**
-- 
2.34.1


