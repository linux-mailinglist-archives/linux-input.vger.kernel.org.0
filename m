Return-Path: <linux-input+bounces-16492-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5316ECAF338
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 08:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F6CE3011A53
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 07:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6512261B9C;
	Tue,  9 Dec 2025 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3F3UU8N"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D7F238150;
	Tue,  9 Dec 2025 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765266678; cv=none; b=VSJhjn3aHCx859wjJhiZMGFNghnueuNbtMKe8QwwxguI1Pb/N+pcnrVtNllWz+iOrEu+haWDqNl4ryqR7dS2OHnm8/1RMBpnJExtTKbb+DPpblffs4TmAtq6OwMnwXEsU1BSHDT5+Es9mxh6Yz2VTqh6OzvT7i9jAxQ1Cqxo0Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765266678; c=relaxed/simple;
	bh=X7gzcrK0aAd5Kpru55vWr3x3CCst6tZRCsKUzGkpRcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s5mDDuPd+Jcif2vVmOGAPwX9gOcrqIn6dRB676FLBo7n/vfXeXitGhZSHA/jwwjCFZR0Tj2/8ZCS8ZfaOUNpLR4tY7iR6KeeRgHhtAPAzT3jzVmXkHlyPZxjznuUQajGo9N1QbnPafrUza8VqhG5FxZ4YtjDOsaGGp6undXiLxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3F3UU8N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765266677; x=1796802677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X7gzcrK0aAd5Kpru55vWr3x3CCst6tZRCsKUzGkpRcg=;
  b=C3F3UU8NQJeqfy63WNfCMOlh0BjH4y054OjOj1kW26qmri1QiWnxJUOi
   6Mv+Bk+9vHgDNoYpMAaqaZPOhtUlfcbo8HaHhN7A5U4EIwyQO/5RGqIVc
   IQmxNg2SPdOZQKMQg/IX1Z86fSY2xlJfbgrzgmnWyyt6dSKdNVxiuHCnj
   JypcWct4jkCwIt7R6OhJVXd8DNUerqGE8uB97Vzzk9W5mxEgJnSTsHaEj
   T5VEsZkJxCa4QjdZu5sz9C08gNce0Rats1OtwNLGNcWUYFsPYuXOxqO0k
   41KxI24TL9X1LvBtYaQva8Ea9ww7Dm1rUZAM+I7bU2z1lH/T2+C40t7X0
   w==;
X-CSE-ConnectionGUID: C7q0gC0ZQsCrhUKwlWkC2Q==
X-CSE-MsgGUID: 3Fu20+GkQfGi6LWB202vAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66942707"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="66942707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:51:16 -0800
X-CSE-ConnectionGUID: 3gQi4zfXSPi5JMGyBAHgZg==
X-CSE-MsgGUID: zQCH4prpS/CBP+giQTIMAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200599859"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 23:51:14 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v2 1/4] HID: Intel-thc-hid: Intel-quicki2c: Use size_t for all length variables
Date: Tue,  9 Dec 2025 15:52:12 +0800
Message-Id: <20251209075215.1535371-2-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251209075215.1535371-1-even.xu@intel.com>
References: <20251209075215.1535371-1-even.xu@intel.com>
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


