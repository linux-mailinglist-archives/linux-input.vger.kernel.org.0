Return-Path: <linux-input+bounces-7174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9CC995CBE
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 03:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F451F23310
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 01:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFB4E573;
	Wed,  9 Oct 2024 01:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+eiHJ07"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B42770B
	for <linux-input@vger.kernel.org>; Wed,  9 Oct 2024 01:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728436225; cv=none; b=PklsOYOMEYxcJmuf27iw5MdLscyDGm7P0Y4NzQrnua2K9+63snWSVYbVt6bJf/E+rBfcd/LN1BBH76lzGxXcOq9SZjRwClG+KfjfwWgRCykfgiC/4cw9kQ5iRhgIt4qX5LZW6F0yd/0YZg+ARFvwzeJw+rSfbYGMHmERMjaKNNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728436225; c=relaxed/simple;
	bh=MXnMbmPzw7ee3iIlqCDDdc/Llt7JHDV2BIDe3jbSREo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MDxhv5SGy3RRLVSN5RQ0UgUoyHLasILpksJe8B+AXX+XzW9BIQOeZ8z+xtKgzpMTGDQoWbr1JAhprRPV3MrfpDiyIcSlNy6k2cG2aFONdz4qh4Gs6oduFCX94GepaYDDgrCsjMmiN1BQQmlsY1txNpXqeLblLhlshv0EGvjOC8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+eiHJ07; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728436224; x=1759972224;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MXnMbmPzw7ee3iIlqCDDdc/Llt7JHDV2BIDe3jbSREo=;
  b=H+eiHJ07zykf8VcHAGHLUoyKfIS4z2R3scTsVvQo/AtMlqnT8d1hNnB0
   njruLneVAkPYE8ASPJuNK322ZvqcWUv57PjOrk3v8fFy4xLBWfgnj0Tw3
   3ui71h+ce76qTLKVWwxKSViYlr/Jo7j2XruAzOqZEtVoQndn1Uls06cxP
   ZiXN7i7QIdLuacQIJqfqn2qoZvmbL0UoWFNOkfdMmSSC0FvuZtXaSzMNX
   MKJQEAnDrB409zwgmexiqcdddeyT9LHIOPmhHXhdImKFKrZ2VXvLdPMiR
   vdZW85Y1sttx/fK22PiHHxcGnl23etSdbyIOxGSnZEgx4+lLt+JC3v4EF
   Q==;
X-CSE-ConnectionGUID: L/EewE5UT8GMy9uiZphtBg==
X-CSE-MsgGUID: HUIfiyYNQK+s8DADWCWL9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27153239"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="27153239"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 18:10:23 -0700
X-CSE-ConnectionGUID: bP/iYPXBTMmU05HG22VxqQ==
X-CSE-MsgGUID: ESRiMidYRF6h23rJ2jChYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="76179870"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa008.fm.intel.com with ESMTP; 08 Oct 2024 18:10:21 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	zhifeng.wang@intel.com,
	even.xu@intel.com,
	neo.wong@intel.com,
	hemin.han@intel.com,
	yoshi.wang@intel.com
Subject: [PATCH] HID: intel-ish-hid: Add firmware version sysfs attributes
Date: Wed,  9 Oct 2024 09:10:23 +0800
Message-ID: <20241009011023.497147-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce sysfs attributes to the intel-ish-ipc driver to expose the base
and project firmware versions for ISH devices that load firmware from the
host.

The build tool embeds these versions into the ISH global manifest within
the firmware binary during the firmware build process. The driver, upon
loading the firmware, extracts this version information from the manifest
and makes it accessible via sysfs. The base version corresponds to the
firmware version provided in Intel's Firmware Development Kit (FDK), while
the project version reflects the vendor-customized firmware derived from
the FDK.

These attributes provide userspace tools and applications with the
ability to easily query the firmware versions, which is essential for
firmware validation and troubleshooting.

Example usages:
  $ cat /sys/devices/pci0000\:00/0000\:00\:12.0/firmware/base_version
  5.8.0.7716

  $ cat /sys/devices/pci0000\:00/0000\:00\:12.0/firmware/project_version
  5.8.0.12472

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c     | 45 +++++++++++++++++++++
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h | 12 ++++++
 drivers/hid/intel-ish-hid/ishtp/loader.c    | 35 +++++++++++++++-
 drivers/hid/intel-ish-hid/ishtp/loader.h    | 34 ++++++++++++++++
 4 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index aae0d965b47b..9e2401291a2f 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -381,6 +381,50 @@ static int __maybe_unused ish_resume(struct device *device)
 
 static SIMPLE_DEV_PM_OPS(ish_pm_ops, ish_suspend, ish_resume);
 
+static ssize_t base_version_show(struct device *cdev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct ishtp_device *dev = dev_get_drvdata(cdev);
+
+	return sysfs_emit(buf, "%u.%u.%u.%u\n", dev->base_ver.major,
+			  dev->base_ver.minor, dev->base_ver.hotfix,
+			  dev->base_ver.build);
+}
+static DEVICE_ATTR_RO(base_version);
+
+static ssize_t project_version_show(struct device *cdev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct ishtp_device *dev = dev_get_drvdata(cdev);
+
+	return sysfs_emit(buf, "%u.%u.%u.%u\n", dev->prj_ver.major,
+			  dev->prj_ver.minor, dev->prj_ver.hotfix,
+			  dev->prj_ver.build);
+}
+static DEVICE_ATTR_RO(project_version);
+
+static struct attribute *ish_firmware_attrs[] = {
+	&dev_attr_base_version.attr,
+	&dev_attr_project_version.attr,
+	NULL
+};
+
+static umode_t firmware_is_visible(struct kobject *kobj, struct attribute *attr,
+				   int i)
+{
+	struct ishtp_device *dev = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return dev->driver_data->fw_generation ? attr->mode : 0;
+}
+
+static const struct attribute_group ish_firmware_group = {
+	.name = "firmware",
+	.attrs = ish_firmware_attrs,
+	.is_visible = firmware_is_visible,
+};
+
+__ATTRIBUTE_GROUPS(ish_firmware);
+
 static struct pci_driver ish_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = ish_pci_tbl,
@@ -388,6 +432,7 @@ static struct pci_driver ish_driver = {
 	.remove = ish_remove,
 	.shutdown = ish_shutdown,
 	.driver.pm = &ish_pm_ops,
+	.dev_groups = ish_firmware_groups,
 };
 
 module_pci_driver(ish_driver);
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index cdacce0a4c9d..effbb442c727 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -140,6 +140,13 @@ struct ishtp_driver_data {
 	char *fw_generation;
 };
 
+struct ish_version {
+	u16 major;
+	u16 minor;
+	u16 hotfix;
+	u16 build;
+};
+
 /**
  * struct ishtp_device - ISHTP private device struct
  */
@@ -236,6 +243,11 @@ struct ishtp_device {
 	/* Dump to trace buffers if enabled*/
 	ishtp_print_log print_log;
 
+	/* Base version of Intel's released firmware */
+	struct ish_version base_ver;
+	/* Vendor-customized project version */
+	struct ish_version prj_ver;
+
 	/* Debug stats */
 	unsigned int	ipc_rx_cnt;
 	unsigned long long	ipc_rx_bytes_cnt;
diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index f76c4437a1f5..f34086b29cf0 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -308,6 +308,28 @@ static int request_ish_firmware(const struct firmware **firmware_p,
 	return _request_ish_firmware(firmware_p, filename, dev);
 }
 
+static int copy_manifest(const struct firmware *fw, struct ish_global_manifest *manifest)
+{
+	u32 offset;
+
+	for (offset = 0; offset + sizeof(*manifest) < fw->size; offset += ISH_MANIFEST_ALIGNMENT) {
+		memcpy(manifest, fw->data + offset, sizeof(*manifest));
+
+		if (le32_to_cpu(manifest->sig_fourcc) == ISH_GLOBAL_SIG)
+			return 0;
+	}
+
+	return -1;
+}
+
+static void copy_ish_version(struct version_in_manifest *src, struct ish_version *dst)
+{
+	dst->major = le16_to_cpu(src->major);
+	dst->minor = le16_to_cpu(src->minor);
+	dst->hotfix = le16_to_cpu(src->hotfix);
+	dst->build = le16_to_cpu(src->build);
+}
+
 /**
  * ishtp_loader_work() - Load the ISHTP firmware
  * @work: The work structure
@@ -336,6 +358,7 @@ void ishtp_loader_work(struct work_struct *work)
 	struct loader_xfer_query query = { .header = cpu_to_le32(query_hdr.val32), };
 	struct loader_start start = { .header = cpu_to_le32(start_hdr.val32), };
 	union loader_recv_message recv_msg;
+	struct ish_global_manifest manifest;
 	const struct firmware *ish_fw;
 	void *dma_bufs[FRAGMENT_MAX_NUM] = {};
 	u32 fragment_size;
@@ -372,7 +395,7 @@ void ishtp_loader_work(struct work_struct *work)
 		if (rv)
 			continue; /* try again if failed */
 
-		dev_dbg(dev->devc, "ISH Version %u.%u.%u.%u\n",
+		dev_dbg(dev->devc, "ISH Bootloader Version %u.%u.%u.%u\n",
 			recv_msg.query_ack.version_major,
 			recv_msg.query_ack.version_minor,
 			recv_msg.query_ack.version_hotfix,
@@ -390,6 +413,16 @@ void ishtp_loader_work(struct work_struct *work)
 			continue; /* try again if failed */
 
 		dev_info(dev->devc, "firmware loaded. size:%zu\n", ish_fw->size);
+		if (!copy_manifest(ish_fw, &manifest)) {
+			copy_ish_version(&manifest.base_ver, &dev->base_ver);
+			copy_ish_version(&manifest.prj_ver, &dev->prj_ver);
+			dev_info(dev->devc, "FW base version: %u.%u.%u.%u\n",
+				 dev->base_ver.major, dev->base_ver.minor,
+				 dev->base_ver.hotfix, dev->base_ver.build);
+			dev_info(dev->devc, "FW project version: %u.%u.%u.%u\n",
+				 dev->prj_ver.major, dev->prj_ver.minor,
+				 dev->prj_ver.hotfix, dev->prj_ver.build);
+		}
 		break;
 	} while (--retry);
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.h b/drivers/hid/intel-ish-hid/ishtp/loader.h
index 308b96085a4d..4dda038b4947 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.h
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.h
@@ -10,6 +10,7 @@
 
 #include <linux/bits.h>
 #include <linux/jiffies.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 #include "ishtp-dev.h"
@@ -228,4 +229,37 @@ struct ish_firmware_variant {
  */
 void ishtp_loader_work(struct work_struct *work);
 
+/* ISH Manifest alignment in binary is 4KB aligned */
+#define ISH_MANIFEST_ALIGNMENT SZ_4K
+
+/* Signature for ISH global manifest */
+#define ISH_GLOBAL_SIG 0x47485349	/* FourCC 'I', 'S', 'H', 'G' */
+
+struct version_in_manifest {
+	__le16 major;
+	__le16 minor;
+	__le16 hotfix;
+	__le16 build;
+};
+
+/**
+ * struct ish_global_manifest - global manifest for ISH
+ * @sig_fourcc: Signature FourCC, should be 'I', 'S', 'H', 'G'.
+ * @len: Length of the manifest.
+ * @header_version: Version of the manifest header.
+ * @flags: Flags for additional information.
+ * @base_ver: Base version of Intel's released firmware.
+ * @reserved: Reserved space for future use.
+ * @prj_ver: Vendor-customized project version.
+ */
+struct ish_global_manifest {
+	__le32 sig_fourcc;
+	__le32 len;
+	__le32 header_version;
+	__le32 flags;
+	struct version_in_manifest base_ver;
+	__le32 reserved[13];
+	struct version_in_manifest prj_ver;
+};
+
 #endif /* _ISHTP_LOADER_H_ */

base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
-- 
2.43.0


