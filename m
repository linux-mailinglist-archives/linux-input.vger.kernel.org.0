Return-Path: <linux-input+bounces-5581-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4E9527D5
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 04:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246F32860F7
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 02:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B88F6D;
	Thu, 15 Aug 2024 02:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsqlpxDc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520E9475
	for <linux-input@vger.kernel.org>; Thu, 15 Aug 2024 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723687818; cv=none; b=gUzRYsq8kIhyZbrPFj57To0bcaZpbUkaniM/sEXzq8e0ukXwE1O32VRwUQtMIgOkqN0ZW4/wuj6NJ0X0F1iZGU3y2j5N+mjgK7JFFNejXzyEwF/e0cucVX+9nHr+IWbk3BT1YjCz6mffstSIl6JR5Er/3cZ1AtXTsXyZC5Otju8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723687818; c=relaxed/simple;
	bh=iLPwaTSVPkO34boqcOe77hU9ZzsSLX55jYi9pFMku8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DJfYcXK/rQb2R6Dk1S1VWfC80x0aF/G1h/3hMqTP+6PMdRN3szMfOrVvblZiKD4Qpk4bNAF4bzgRW0kZN0+yPmOKFQF1vh2zdvWsJ6C22VXxwLJyUqsAswDW9Ke/GymBUF2nXg+OfqnoADcLZKDcqYbeiHlfvl6StinSp1mQveo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsqlpxDc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723687817; x=1755223817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iLPwaTSVPkO34boqcOe77hU9ZzsSLX55jYi9pFMku8s=;
  b=lsqlpxDcwjWnh7GJm+yt8mD/aSQYi4t5c5R06e5RgIhQia2OgXCrJflZ
   3pgpHUZFJ1pUZiAJztI2D1VwsaXq9EtcIvO3PdWZJGK8rf2Cobqm6b9Ay
   Usd5JzxG8gr+DWQEEcOjx1s2/gKdcXNbH5q9Oyaku8q1fLDNzPzHeEDIZ
   vCNP63VTnpB7hDEAXLCR/28hYdq1f5juk2EieiEfh3CqIKo1H0HDl7Jaf
   kZsItxVJbio8J9fBKOH2NrHVlnymZtATwjrYkKZBC50gaFrEzOKLrOJpZ
   oL2nNSf/CW7d4J8DqFs+bsmSUC1nUbIxGrJzptJvAjyPoe6lUlus0dMAw
   g==;
X-CSE-ConnectionGUID: Nl2hwebnRr2ZNlpxv/SUEQ==
X-CSE-MsgGUID: 9+cHjIUyTFGRrIhZWjEbwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21796129"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21796129"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 19:10:11 -0700
X-CSE-ConnectionGUID: RudW+FGJSE6RxiSQ+RZuGw==
X-CSE-MsgGUID: 5j+yA5zaSryk+u5TT/bmbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="63635486"
Received: from ipg-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa005.fm.intel.com with ESMTP; 14 Aug 2024 19:10:08 -0700
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
Subject: [PATCH v2 2/3] HID: intel-ish-hid: Use CPU generation string in driver_data
Date: Thu, 15 Aug 2024 10:10:00 +0800
Message-Id: <20240815021001.936277-3-lixu.zhang@intel.com>
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
index fcca070bdecb..ff11ee4e38ed 100644
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
 
+#define ISH_FW_FILE_DEFAULT_FMT "intel/ish/ish_%s.bin"
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
+	snprintf(filename, sizeof(filename), ISH_FW_FILE_DEFAULT_FMT, gen);
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
+		dev_err(dev->devc, "request ISH firmware failed:%d\n", rv);
 		return;
 	}
 
-- 
2.34.1


