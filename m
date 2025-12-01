Return-Path: <linux-input+bounces-16408-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCA0C96015
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 08:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E2F273418EA
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 07:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF5A2C0277;
	Mon,  1 Dec 2025 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwradLVx"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B62C029C;
	Mon,  1 Dec 2025 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764574215; cv=none; b=VInOyucU157cQ4hvy9Hu/ikAIyPUT5Qk6tFnGd/RIE5XoeWODxzbYxBcOow9u9wcEKLNOZ/n7MGFyKO6FEGBn9nljeadSRSiMj6DE2Pf9IjXZmthvo2AjRg5boA3Dr23nWhSdbJGsdjTCU6D4CIU5LFjwEedO/DMEGgODhecyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764574215; c=relaxed/simple;
	bh=X7gzcrK0aAd5Kpru55vWr3x3CCst6tZRCsKUzGkpRcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q/Yn1rttTamaE05bzxJQ3AlwWXdtIqJ5XtytFQdg+4Mcj5Pi9YMZ9KyB8IvbjgGUj/ajq2l6luKaLxzFacZazEButWb8I0yI7fprfPtJGlkzAa5nqzmD4WWGh6wHevwiE2LvmOATuHwzosAiWfsu7X+n6c+CJvEOdZm4Z6/EihU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwradLVx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764574214; x=1796110214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X7gzcrK0aAd5Kpru55vWr3x3CCst6tZRCsKUzGkpRcg=;
  b=AwradLVxXYtFim9MSkmHlUVFeRcV3RsRdgyahlbOwHvhaY3JNNoo+GUv
   tMLimva3Y9XDoYg6+u5lVfE6D4krNM5sf04tkocSCsDWjoY093T1AbTgn
   CmAwXf9yBdQYex2nFU8gCViWfLs34BTEnxLKNHpWDA2p9BcVvJMCtNFBQ
   tVUhAGPmO2YPXY130DJCuW/5vOxHHLRWuC0jBPy03sBX/F8Rh9cr6/Tg7
   si8SoVlLwUgKaw81qdbbuTqm8c2jingQ56DxVdHhT7H++L1BbaF9ZMpnD
   SDP2S72ntg4JvcNsA41XbIBra7QCTtEjEen+2iMgLnG7X/RRCckdq1iwA
   Q==;
X-CSE-ConnectionGUID: r6HyPHa+Qlu/LMFz9Kktaw==
X-CSE-MsgGUID: 0q2Zlxw+RfSCqgCyhzSNew==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="69097626"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="69097626"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 23:30:13 -0800
X-CSE-ConnectionGUID: m0xsXCZfRNaZiOePrd2Zww==
X-CSE-MsgGUID: otvsgnzfRcCOBAO2FBXEjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193886735"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa006.fm.intel.com with ESMTP; 30 Nov 2025 23:30:11 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v1 1/4] HID: Intel-thc-hid: Intel-quicki2c: Use size_t for all length variables
Date: Mon,  1 Dec 2025 15:30:44 +0800
Message-Id: <20251201073047.3313824-2-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251201073047.3313824-1-even.xu@intel.com>
References: <20251201073047.3313824-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert all length-related variables in the QuickI2C protocol layer to use
size_t type to follow kernel coding conventions.

This includes:
- All buffer length parameters and variables
- Return values of quicki2c_encode_cmd() function which represents
  encoded command buffer size.
- Return values of quicki2c_init_write_buf() function which represents
  process result: either prepared output buffer size or error code.

This change improves type consistency and aligns with standard kernel
practices for memory size representation, reducing potential issues
with size calculations and comparisons.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 .../intel-quicki2c/quicki2c-dev.h             |  2 +-
 .../intel-quicki2c/quicki2c-protocol.c        | 55 +++++++++----------
 .../intel-quicki2c/quicki2c-protocol.h        |  4 +-
 3 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index 2cb5471a8133..33a1e3db1cb2 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -213,7 +213,7 @@ struct quicki2c_device {
 	u8 *report_descriptor;
 	u8 *input_buf;
 	u8 *report_buf;
-	u32 report_len;
+	size_t report_len;
 
 	wait_queue_head_t reset_ack_wq;
 	bool reset_ack;
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index a63f8c833252..013cbbb39efd 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -13,11 +13,11 @@
 #include "quicki2c-hid.h"
 #include "quicki2c-protocol.h"
 
-static int quicki2c_init_write_buf(struct quicki2c_device *qcdev, u32 cmd, int cmd_len,
-				   bool append_data_reg, u8 *data, int data_len,
-				   u8 *write_buf, int write_buf_len)
+static ssize_t quicki2c_init_write_buf(struct quicki2c_device *qcdev, u32 cmd, size_t cmd_len,
+				       bool append_data_reg, u8 *data, size_t data_len,
+				       u8 *write_buf, size_t write_buf_len)
 {
-	int buf_len, offset = 0;
+	size_t buf_len, offset = 0;
 
 	buf_len = HIDI2C_REG_LEN + cmd_len;
 
@@ -51,10 +51,10 @@ static int quicki2c_init_write_buf(struct quicki2c_device *qcdev, u32 cmd, int c
 	return buf_len;
 }
 
-static int quicki2c_encode_cmd(struct quicki2c_device *qcdev, u32 *cmd_buf,
-			       u8 opcode, u8 report_type, u8 report_id)
+static size_t quicki2c_encode_cmd(struct quicki2c_device *qcdev, u32 *cmd_buf,
+				  u8 opcode, u8 report_type, u8 report_id)
 {
-	int cmd_len;
+	size_t cmd_len;
 
 	*cmd_buf = FIELD_PREP(HIDI2C_CMD_OPCODE, opcode) |
 		   FIELD_PREP(HIDI2C_CMD_REPORT_TYPE, report_type);
@@ -72,22 +72,20 @@ static int quicki2c_encode_cmd(struct quicki2c_device *qcdev, u32 *cmd_buf,
 }
 
 static int write_cmd_to_txdma(struct quicki2c_device *qcdev, int opcode,
-			      int report_type, int report_id, u8 *buf, int buf_len)
+			      int report_type, int report_id, u8 *buf, size_t buf_len)
 {
-	size_t write_buf_len;
-	int cmd_len, ret;
+	size_t cmd_len;
+	ssize_t len;
 	u32 cmd;
 
 	cmd_len = quicki2c_encode_cmd(qcdev, &cmd, opcode, report_type, report_id);
 
-	ret = quicki2c_init_write_buf(qcdev, cmd, cmd_len, buf ? true : false, buf,
+	len = quicki2c_init_write_buf(qcdev, cmd, cmd_len, buf ? true : false, buf,
 				      buf_len, qcdev->report_buf, qcdev->report_len);
-	if (ret < 0)
-		return ret;
-
-	write_buf_len = ret;
+	if (len < 0)
+		return len;
 
-	return thc_dma_write(qcdev->thc_hw, qcdev->report_buf, write_buf_len);
+	return thc_dma_write(qcdev->thc_hw, qcdev->report_buf, len);
 }
 
 int quicki2c_set_power(struct quicki2c_device *qcdev, enum hidi2c_power_state power_state)
@@ -126,13 +124,13 @@ int quicki2c_get_report_descriptor(struct quicki2c_device *qcdev)
 }
 
 int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
-			unsigned int reportnum, void *buf, u32 buf_len)
+			unsigned int reportnum, void *buf, size_t buf_len)
 {
 	struct hidi2c_report_packet *rpt;
-	size_t write_buf_len, read_len = 0;
-	int cmd_len, rep_type;
+	size_t cmd_len, read_len = 0;
+	int rep_type, ret;
+	ssize_t len;
 	u32 cmd;
-	int ret;
 
 	if (report_type == HID_INPUT_REPORT) {
 		rep_type = HIDI2C_INPUT;
@@ -145,25 +143,22 @@ int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
 
 	cmd_len = quicki2c_encode_cmd(qcdev, &cmd, HIDI2C_GET_REPORT, rep_type, reportnum);
 
-	ret = quicki2c_init_write_buf(qcdev, cmd, cmd_len, true, NULL, 0,
+	len = quicki2c_init_write_buf(qcdev, cmd, cmd_len, true, NULL, 0,
 				      qcdev->report_buf, qcdev->report_len);
-	if (ret < 0)
-		return ret;
-
-	write_buf_len = ret;
+	if (len < 0)
+		return len;
 
 	rpt = (struct hidi2c_report_packet *)qcdev->input_buf;
 
-	ret = thc_swdma_read(qcdev->thc_hw, qcdev->report_buf, write_buf_len,
-			     NULL, rpt, &read_len);
+	ret = thc_swdma_read(qcdev->thc_hw, qcdev->report_buf, len, NULL, rpt, &read_len);
 	if (ret) {
-		dev_err_once(qcdev->dev, "Get report failed, ret %d, read len (%zu vs %d)\n",
+		dev_err_once(qcdev->dev, "Get report failed, ret %d, read len (%zu vs %zu)\n",
 			     ret, read_len, buf_len);
 		return ret;
 	}
 
 	if (HIDI2C_DATA_LEN(le16_to_cpu(rpt->len)) != buf_len || rpt->data[0] != reportnum) {
-		dev_err_once(qcdev->dev, "Invalid packet, len (%d vs %d) report id (%d vs %d)\n",
+		dev_err_once(qcdev->dev, "Invalid packet, len (%d vs %zu) report id (%d vs %d)\n",
 			     le16_to_cpu(rpt->len), buf_len, rpt->data[0], reportnum);
 		return -EINVAL;
 	}
@@ -174,7 +169,7 @@ int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
 }
 
 int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
-			unsigned int reportnum, void *buf, u32 buf_len)
+			unsigned int reportnum, void *buf, size_t buf_len)
 {
 	int rep_type;
 	int ret;
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
index bf4908cce59c..db70e08c8b1c 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
@@ -10,9 +10,9 @@ struct quicki2c_device;
 
 int quicki2c_set_power(struct quicki2c_device *qcdev, enum hidi2c_power_state power_state);
 int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
-			unsigned int reportnum, void *buf, u32 buf_len);
+			unsigned int reportnum, void *buf, size_t buf_len);
 int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
-			unsigned int reportnum, void *buf, u32 buf_len);
+			unsigned int reportnum, void *buf, size_t buf_len);
 int quicki2c_get_device_descriptor(struct quicki2c_device *qcdev);
 int quicki2c_get_report_descriptor(struct quicki2c_device *qcdev);
 int quicki2c_reset(struct quicki2c_device *qcdev);
-- 
2.40.1


