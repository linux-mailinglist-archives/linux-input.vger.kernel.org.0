Return-Path: <linux-input+bounces-5534-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F1494FC67
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 05:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08ECF1F21FAC
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 03:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3AC1C287;
	Tue, 13 Aug 2024 03:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNs2nfIT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E218EAB
	for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 03:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723520867; cv=none; b=OLrXTVedr3epxeBIXdW1ll5jg8CZLjF1rP8uHTbk0Cu8eEd7wztwkIpyWLU6tQSCpYIiBa8/5mkZlJQ4BWXWN6itgpprSJmJeg+IKwMu7C8Xb61FeB6phlv7OPqiVgOK+GM9plHHcGQbsfSxG+gEOosPdmZqaD7sDXmSAwE0yZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723520867; c=relaxed/simple;
	bh=/wCyHvaHnJ82oAfr4vzwD5hYWqjDid6gYkWy4Kge0Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YMxSzfSFz9ftJfEWdAhlDgFidDQteNixkwlb0eRiXHugwJQgzeVg+Q4r37xSuZ1nuz82t7H6XhpuVPro6UOcRunyh6Z/PontjwxkSTQrxkiZij/l2rW+Xkd29Bzjv9+A+ijzG2zqKfy0faB9VoKmQD+OOMxZ9SCmknB0zZpXuPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNs2nfIT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723520866; x=1755056866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/wCyHvaHnJ82oAfr4vzwD5hYWqjDid6gYkWy4Kge0Mo=;
  b=GNs2nfITPt5rlqEHqSaq25gD+zyClqSExDczlpZp1qpKth1yk38h/eAI
   EMxFgz9tP0CYtxmg473DcnZKUlAPg8u12gtcKOPeVwTlJijSdJTeLSFJF
   StW9/H8q770Kwqqn+KTeUwinoCKOKm9XxavxZM+WlovO4qiqDjQwMttcK
   eJ/XAz10DlsRucN6OsipLxw1K9tCC/NWJAynShe32iQ3fjKbIASBI0yF9
   N7gXhW6/TP404uV1ekELyfUEMbmf/A0VHpFzVSwAfATSC8G4CjZlOGFof
   RoBEL0Exk5A4wxt9UyjqALzppLsP2LhUq4UNTXLWYHBhLyhpPL20ZYofz
   A==;
X-CSE-ConnectionGUID: SqpLdIdcQK6FJ+fIhzEdwg==
X-CSE-MsgGUID: QXruE91uRzamOAD8D/GxSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21819914"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21819914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 20:47:45 -0700
X-CSE-ConnectionGUID: zEy9nsPaS7aEFG0Qk33zLw==
X-CSE-MsgGUID: uOCHBu7NSSiJtQCT4Fd7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58396412"
Received: from ipg-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2024 20:47:43 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hemin.han@intel.com,
	yoshi.wang@intel.com,
	even.xu@intel.com
Subject: [PATCH 2/3] HID: intel-ish-hid: Use CPU generation string in driver_data
Date: Tue, 13 Aug 2024 11:47:35 +0800
Message-Id: <20240813034736.812475-3-lixu.zhang@intel.com>
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

ISH allows vendors to customize ISH firmware. To differentiate different
vendors and load the correct firmware, Intel defined a firmware file
name format. As part of the filename, there is a "generation" string. To
load correct format the driver must know the generation name to create
file name.

In the absence of any vendor specific firmware, default ISH firmware is
loaded.

Currently full ISH firmware file name is stored as part of driver data.
This file name already includes the generation name. For example, for
Lunar Lake, the name is ish_lnlm.bin, where "lnlm" is the generation.

So instead of storing both generation name and ISH default firmware file
name, just store generation name and create the default ISH firmware
file name string during initialization.

No functional changes are expected.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c     |  8 ++++---
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  8 ++++---
 drivers/hid/intel-ish-hid/ishtp/loader.c    | 23 ++++++++++++++++++---
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index f82428d7f6c3..f20463082dc4 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -28,11 +28,13 @@ enum ishtp_driver_data_index {
 	ISHTP_DRIVER_DATA_LNL_M,
 };
 
-#define ISH_FW_FILENAME_LNL_M "intel/ish/ish_lnlm.bin"
+#define ISH_FW_GEN_LNL_M "lnlm"
+
+#define ISH_FIRMWARE_PATH(gen) "intel/ish/ish_" gen ".bin"
 
 static struct ishtp_driver_data ishtp_driver_data[] = {
 	[ISHTP_DRIVER_DATA_LNL_M] = {
-		.fw_filename = ISH_FW_FILENAME_LNL_M,
+		.fw_generation = ISH_FW_GEN_LNL_M,
 	},
 };
 
@@ -397,4 +399,4 @@ MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_DESCRIPTION("Intel(R) Integrated Sensor Hub PCI Device Driver");
 MODULE_LICENSE("GPL");
 
-MODULE_FIRMWARE(ISH_FW_FILENAME_LNL_M);
+MODULE_FIRMWARE(ISH_FIRMWARE_PATH(ISH_FW_GEN_LNL_M));
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index 181838c3d7ac..cdacce0a4c9d 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -129,13 +129,15 @@ struct ishtp_hw_ops {
  * ISHTP device instance. It allows for the storage of data that is unique to
  * a particular driver or hardware variant.
  *
- * @fw_filename: The firmware filename associated with a specific hardware
+ * @fw_generation: The generation name associated with a specific hardware
  *               variant of the Intel Integrated Sensor Hub (ISH). This allows
  *               the driver to load the correct firmware based on the device's
- *               hardware variant.
+ *               hardware variant. For example, "lnlm" for the Lunar Lake-M
+ *               platform. The generation name must not exceed 8 characters
+ *               in length.
  */
 struct ishtp_driver_data {
-	char *fw_filename;
+	char *fw_generation;
 };
 
 /**
diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index fcca070bdecb..b4b15279c9c4 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -43,6 +43,7 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/pfn.h>
+#include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/wait.h>
@@ -192,6 +193,23 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 	return 0;
 }
 
+#define ISH_FW_FILE_DEFALUT_FMT "intel/ish/ish_%s.bin"
+
+#define ISH_FW_FILENAME_LEN_MAX 56
+
+static int request_ish_firmware(const struct firmware **firmware_p,
+				struct device *dev)
+{
+	struct ishtp_device *ishtp = dev_get_drvdata(dev);
+	const char *gen;
+	char filename[ISH_FW_FILENAME_LEN_MAX];
+
+	gen = ishtp->driver_data->fw_generation;
+	snprintf(filename, sizeof(filename), ISH_FW_FILE_DEFALUT_FMT, gen);
+
+	return request_firmware(firmware_p, filename, dev);
+}
+
 /**
  * ishtp_loader_work() - Load the ISHTP firmware
  * @work: The work structure
@@ -220,7 +238,6 @@ void ishtp_loader_work(struct work_struct *work)
 	struct loader_xfer_query query = { .header = cpu_to_le32(query_hdr.val32), };
 	struct loader_start start = { .header = cpu_to_le32(start_hdr.val32), };
 	union loader_recv_message recv_msg;
-	char *filename = dev->driver_data->fw_filename;
 	const struct firmware *ish_fw;
 	void *dma_bufs[FRAGMENT_MAX_NUM] = {};
 	u32 fragment_size;
@@ -228,9 +245,9 @@ void ishtp_loader_work(struct work_struct *work)
 	int retry = ISHTP_LOADER_RETRY_TIMES;
 	int rv;
 
-	rv = request_firmware(&ish_fw, filename, dev->devc);
+	rv = request_ish_firmware(&ish_fw, dev->devc);
 	if (rv < 0) {
-		dev_err(dev->devc, "request firmware %s failed:%d\n", filename, rv);
+		dev_err(dev->devc, "request ish firmware failed:%d\n", rv);
 		return;
 	}
 
-- 
2.34.1


