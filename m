Return-Path: <linux-input+bounces-14498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14663B44B46
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 03:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2FF81B27AEA
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 01:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D04145329;
	Fri,  5 Sep 2025 01:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WY/jJhe+"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43310A1E;
	Fri,  5 Sep 2025 01:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757036378; cv=none; b=t6lZvNEShjtvBGgJY5UUEdyUwRZugOu3VaTbI+6fCtW3CXKfgdoA4azHICoCPYtfuvU5xxuQiMFmmao47Nz8q7+fofa5TY1ysWOs5juliTdd3mqMOo9sZsmQEwNvga3yd1PD4daLMldhIvp2cA9A9r2nk1/WnmDe84Jsz8cB2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757036378; c=relaxed/simple;
	bh=20p4J8GcJibUNvbVOLMCaeTcmqPjpr4ASqz/XVqiZys=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s7QA/g0ScvSjzz1jcD+vAZyPtrnLXpRNRwPtNU5DI/9tffGunk5ocGLuCZQ5Ksmow452iueZoaVAgXv0uUsYO8XVK6q4X2VAfIQjeOxztlWqEzefXxlqf8Q87yW1/d0uHtMRU/Cv3leEe7KDnBRDWAPddI7IEEp8Txj0Z/sellY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WY/jJhe+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757036374; x=1788572374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=20p4J8GcJibUNvbVOLMCaeTcmqPjpr4ASqz/XVqiZys=;
  b=WY/jJhe+ko7UwxsKGA113SL7S3fHY67E2GlfWpIn1R/4F1IUAYZE7LW+
   V7CViFsJvHcxW1qAkssAUXl19h4iDAWpV2cy87kg+ntHfbkujjTSx0MfB
   5zfXPsbBD8w37REAnmJQFl9ejEatrF6haCIoBu0P5vMRYF7jkMxf+4opy
   4490qRqAFmMYuijVU9vrsfrV7F9mxtog2MRO44Hd65zyWRdkih98pMl1K
   iBX0GfQIyWD9zPEYcQ9RS43n+T2sAjIe2xi+/N46b01ICqp3yPar6adT2
   mxdX9xXoC3GN13mZ1uIozn5/jphilMn/TMzLRdAQpFh01a3FGWE1wGo9j
   w==;
X-CSE-ConnectionGUID: /DMvXW0dQUS/MSd06NT78Q==
X-CSE-MsgGUID: 5ccCWZpSQY6zJilq5lqHSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63220103"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63220103"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 18:39:34 -0700
X-CSE-ConnectionGUID: ZYIWPPZVTcm4xa3cD5LDoA==
X-CSE-MsgGUID: ZE4ta2bGTOW+LfeLaP+3OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="172855672"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa010.fm.intel.com with ESMTP; 04 Sep 2025 18:39:33 -0700
From: Xinpeng Sun <xinpeng.sun@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>
Subject: [PATCH RESEND v2] hid: intel-thc-hid: intel-quicki2c: support ACPI config for advanced features
Date: Fri,  5 Sep 2025 09:39:35 +0800
Message-Id: <20250905013935.1356008-1-xinpeng.sun@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a new BIOS enhancement that adds the capability to configure the
following two features of I2C subsystem introduced in commit 1ed0b48
("Intel-thc: Introduce max input size control") and commit 3f2a921
("Intel-thc: Introduce interrupt delay control"):
- Max input size control
- Interrupt delay control

As BIOS is used for the configuration of these two features, change driver
data usage to indicate hardware capability, and add corresponding ACPI
configuration support in QuickI2C driver.

Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 43 ++++++++++++++-----
 .../intel-quicki2c/quicki2c-dev.h             | 24 ++++++++++-
 2 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 854926b3cfd4..787c32557d24 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -23,6 +23,7 @@
 
 static struct quicki2c_ddata ptl_ddata = {
 	.max_detect_size = MAX_RX_DETECT_SIZE_PTL,
+	.max_interrupt_delay = MAX_RX_INTERRUPT_DELAY,
 };
 
 /* THC QuickI2C ACPI method to get device properties */
@@ -123,8 +124,8 @@ static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string
 static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 {
 	struct acpi_device *adev = ACPI_COMPANION(qcdev->dev);
-	struct quicki2c_subip_acpi_parameter i2c_param;
-	struct quicki2c_subip_acpi_config i2c_config;
+	struct quicki2c_subip_acpi_parameter i2c_param = {0};
+	struct quicki2c_subip_acpi_config i2c_config = {0};
 	u32 hid_desc_addr;
 	int ret = -EINVAL;
 
@@ -200,6 +201,21 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 		return -EOPNOTSUPP;
 	}
 
+	if (qcdev->ddata) {
+		qcdev->i2c_max_frame_size_enable = i2c_config.FSEN;
+		qcdev->i2c_int_delay_enable = i2c_config.INDE;
+
+		if (i2c_config.FSVL <= qcdev->ddata->max_detect_size)
+			qcdev->i2c_max_frame_size = i2c_config.FSVL;
+		else
+			qcdev->i2c_max_frame_size = qcdev->ddata->max_detect_size;
+
+		if (i2c_config.INDV <= qcdev->ddata->max_interrupt_delay)
+			qcdev->i2c_int_delay = i2c_config.INDV;
+		else
+			qcdev->i2c_int_delay = qcdev->ddata->max_interrupt_delay;
+	}
+
 	return 0;
 }
 
@@ -441,17 +457,24 @@ static void quicki2c_dma_adv_enable(struct quicki2c_device *qcdev)
 	 * max input length <= THC detect capability, enable the feature with device
 	 * max input length.
 	 */
-	if (qcdev->ddata->max_detect_size >=
-	    le16_to_cpu(qcdev->dev_desc.max_input_len)) {
-		thc_i2c_set_rx_max_size(qcdev->thc_hw,
-					le16_to_cpu(qcdev->dev_desc.max_input_len));
+	if (qcdev->i2c_max_frame_size_enable) {
+		if (qcdev->i2c_max_frame_size >=
+		    le16_to_cpu(qcdev->dev_desc.max_input_len)) {
+			thc_i2c_set_rx_max_size(qcdev->thc_hw,
+						le16_to_cpu(qcdev->dev_desc.max_input_len));
+		} else {
+			dev_warn(qcdev->dev,
+				 "Max frame size is smaller than hid max input length!");
+			thc_i2c_set_rx_max_size(qcdev->thc_hw,
+						le16_to_cpu(qcdev->i2c_max_frame_size));
+		}
 		thc_i2c_rx_max_size_enable(qcdev->thc_hw, true);
 	}
 
 	/* If platform supports interrupt delay feature, enable it with given delay */
-	if (qcdev->ddata->interrupt_delay) {
+	if (qcdev->i2c_int_delay_enable) {
 		thc_i2c_set_rx_int_delay(qcdev->thc_hw,
-					 qcdev->ddata->interrupt_delay);
+					 qcdev->i2c_int_delay * 10);
 		thc_i2c_rx_int_delay_enable(qcdev->thc_hw, true);
 	}
 }
@@ -464,10 +487,10 @@ static void quicki2c_dma_adv_enable(struct quicki2c_device *qcdev)
  */
 static void quicki2c_dma_adv_disable(struct quicki2c_device *qcdev)
 {
-	if (qcdev->ddata->max_detect_size)
+	if (qcdev->i2c_max_frame_size_enable)
 		thc_i2c_rx_max_size_enable(qcdev->thc_hw, false);
 
-	if (qcdev->ddata->interrupt_delay)
+	if (qcdev->i2c_int_delay_enable)
 		thc_i2c_rx_int_delay_enable(qcdev->thc_hw, false);
 }
 
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index d412eafcf9ea..0d423d5dd7a7 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -38,6 +38,8 @@
 
 /* PTL Max packet size detection capability is 255 Bytes */
 #define MAX_RX_DETECT_SIZE_PTL			255
+/* Max interrupt delay capability is 2.56ms */
+#define MAX_RX_INTERRUPT_DELAY			256
 
 /* Default interrupt delay is 1ms, suitable for most devices */
 #define DEFAULT_INTERRUPT_DELAY_US		(1 * USEC_PER_MSEC)
@@ -101,6 +103,10 @@ struct quicki2c_subip_acpi_parameter {
  * @HMTD: High Speed Mode Plus (3.4Mbits/sec) Serial Data Line Transmit HOLD Period
  * @HMRD: High Speed Mode Plus (3.4Mbits/sec) Serial Data Line Receive HOLD Period
  * @HMSL: Maximum length (in ic_clk_cycles) of suppressed spikes in High Speed Mode
+ * @FSEN: Maximum Frame Size Feature Enable Control
+ * @FSVL: Maximum Frame Size Value (unit in Bytes)
+ * @INDE: Interrupt Delay Feature Enable Control
+ * @INDV: Interrupt Delay Value (unit in 10 us)
  *
  * Those properties get from QUICKI2C_ACPI_METHOD_NAME_ISUB method, used for
  * I2C timing configure.
@@ -127,17 +133,22 @@ struct quicki2c_subip_acpi_config {
 	u64 HMTD;
 	u64 HMRD;
 	u64 HMSL;
+
+	u64 FSEN;
+	u64 FSVL;
+	u64 INDE;
+	u64 INDV;
 	u8 reserved;
 };
 
 /**
  * struct quicki2c_ddata - Driver specific data for quicki2c device
  * @max_detect_size: Identify max packet size detect for rx
- * @interrupt_delay: Identify interrupt detect delay for rx
+ * @interrupt_delay: Identify max interrupt detect delay for rx
  */
 struct quicki2c_ddata {
 	u32 max_detect_size;
-	u32 interrupt_delay;
+	u32 max_interrupt_delay;
 };
 
 struct device;
@@ -170,6 +181,10 @@ struct acpi_device;
  * @report_len: The length of input/output report packet
  * @reset_ack_wq: Workqueue for waiting reset response from device
  * @reset_ack: Indicate reset response received or not
+ * @i2c_max_frame_size_enable: Indicate max frame size feature enabled or not
+ * @i2c_max_frame_size: Max RX frame size (unit in Bytes)
+ * @i2c_int_delay_enable: Indicate interrupt delay feature enabled or not
+ * @i2c_int_delay: Interrupt detection delay value (unit in 10 us)
  */
 struct quicki2c_device {
 	struct device *dev;
@@ -200,6 +215,11 @@ struct quicki2c_device {
 
 	wait_queue_head_t reset_ack_wq;
 	bool reset_ack;
+
+	u32 i2c_max_frame_size_enable;
+	u32 i2c_max_frame_size;
+	u32 i2c_int_delay_enable;
+	u32 i2c_int_delay;
 };
 
 #endif /* _QUICKI2C_DEV_H_ */
-- 
2.40.1


