Return-Path: <linux-input+bounces-14079-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E60B298E3
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 07:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 905D87A2542
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 05:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADE326561D;
	Mon, 18 Aug 2025 05:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3MHcpGJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17A117C21E;
	Mon, 18 Aug 2025 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755494928; cv=none; b=JM+s5wr/tVGSv5vhfGY55wELj9JAmniDFqWqvYjOm0W+gWNbeMB/qPgHiLOelt/Whv2fC9tShU/6M3TGw45/PbQQthp6d3iM5T21c6vrCgJbAO5exsfWT6xceK5+FmVTObQ5uCYUh73NQ01uSkz2xa56hoMeQhFGFthNle7NyxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755494928; c=relaxed/simple;
	bh=Lju446+VFnAGH07necx+bCz4xPBSkFPZKat92i9SKMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OotrGkxJZrM0WLC99cZm8FgxHSC5NOXKvvKmHaQ49jwdhmqeusHZ/XKYDmg46kDkf28tLfRIOZ8TDr2NghyeM9LvIeVdI29HGUxsNNDL+2BuAf7H5uj3hXbkUrx0IS5Jmn6ZfK6biTUlduJsoyweDDyhSMSpmRcvJQmTMysJpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3MHcpGJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755494926; x=1787030926;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lju446+VFnAGH07necx+bCz4xPBSkFPZKat92i9SKMY=;
  b=P3MHcpGJr6yjOcRS0+Y+/WYz3G+AFIshvO0PD2CAReHqbouirPBwHyEE
   vcQwjSbgah/8JV3SnPRxUrumOHLH0MMCDZCYxXd+ffeE8ByLHb1JoY8Ub
   6yzeupTxevPaJntGH7ltS0OA21JbMRItZfmDo9cg/7hETk/rzZhdtRlwl
   ptD5aJefIqqPFBs2+VyDDM9YUv9cG+HJJlhWYIsFbHueJylyCGV2eS6Qp
   viCJ/c3XR4eqPmTwMXY7PnLvj3Mau6x0iWW/kd47iwrUR1mCHmAJxalHv
   8csCOk+VSIBhCXQqvfsc0HpbEMvu+TrcBXLr6yZZQRUpvIILvwStQXjLo
   w==;
X-CSE-ConnectionGUID: AqkWu/uCSi+HkgJAQrOMVA==
X-CSE-MsgGUID: ktwkWWUvRryHpz+t3yMoIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69162114"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69162114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 22:28:46 -0700
X-CSE-ConnectionGUID: NzWq7Mv/SiGQUpD0TVtWrQ==
X-CSE-MsgGUID: uDtnkXa1TIezzlLwO4oP9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171714622"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa005.fm.intel.com with ESMTP; 17 Aug 2025 22:28:44 -0700
From: Xinpeng Sun <xinpeng.sun@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>
Subject: [PATCH] hid: intel-thc-hid: intel-quicki2c: support ACPI config for advanced features
Date: Mon, 18 Aug 2025 13:27:53 +0800
Message-Id: <20250818052753.435888-1-xinpeng.sun@intel.com>
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
Reviewed-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 43 ++++++++++++++-----
 .../intel-quicki2c/quicki2c-dev.h             | 24 ++++++++++-
 2 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index e944a6ccb776..f122fde879b9 100644
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
 
@@ -440,17 +456,24 @@ static void quicki2c_dma_adv_enable(struct quicki2c_device *qcdev)
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
@@ -463,10 +486,10 @@ static void quicki2c_dma_adv_enable(struct quicki2c_device *qcdev)
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
index 93d6fa982d60..b78c8864d39e 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -38,6 +38,8 @@
 
 /* PTL Max packet size detection capability is 255 Bytes */
 #define MAX_RX_DETECT_SIZE_PTL			255
+/* Max interrupt delay capability is 2.56ms */
+#define MAX_RX_INTERRUPT_DELAY			256
 
 /* Default interrupt delay is 1ms, suitable for most devices */
 #define DEFAULT_INTERRUPT_DELAY_US		(1 * USEC_PER_MSEC)
@@ -100,6 +102,10 @@ struct quicki2c_subip_acpi_parameter {
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
@@ -126,16 +132,21 @@ struct quicki2c_subip_acpi_config {
 	u64 HMTD;
 	u64 HMRD;
 	u64 HMSL;
+
+	u64 FSEN;
+	u64 FSVL;
+	u64 INDE;
+	u64 INDV;
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
@@ -168,6 +179,10 @@ struct acpi_device;
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
@@ -198,6 +213,11 @@ struct quicki2c_device {
 
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


