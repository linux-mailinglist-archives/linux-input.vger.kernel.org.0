Return-Path: <linux-input+bounces-16496-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A4CAF36E
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 08:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2231E30819F3
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 07:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3E02BD582;
	Tue,  9 Dec 2025 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aW06MWMR"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2982BFC9B;
	Tue,  9 Dec 2025 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765266683; cv=none; b=jJtuwqgFcLOgG0YcGmseGDHOp09Kh9ABfmvshk4PHUJQLSoNNHyouRIUGUWosGAIwtSDWQ3uRHrn93xReM2pQ725wQXmTL7q5nXoRIfkupjqVE1q7IV2caFFw57LcZEVqMx0OuFjI0zism6UKaDNNTvXt51pKr2KfacxfeJM4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765266683; c=relaxed/simple;
	bh=OB+grOpXq9Mxj95V30qtt0Ngvra6qeeGMujiNZOXFG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tu52p3cDMUVP4N8l0tiqrfesRI7VpvICxzocNG18t1Agdc2qAiPlUJOGTGpqPc251dULG9hFVzazUQAnG+12pYLugechdLDHAsCZx7AA8SOQ6uw5WecL9oZGOiMYcGVRtbSDfVXmELB7fZpoeyyqHLh7YJzAwFAzcPwq4ROtftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aW06MWMR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765266682; x=1796802682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OB+grOpXq9Mxj95V30qtt0Ngvra6qeeGMujiNZOXFG8=;
  b=aW06MWMRg0jRzehklzRW/Anhy3oj7jyeFJRZIUisfZMsmWZkNiQksu/A
   n4EbXdTN3luQpmRmVnkBpFF5cLCrtm5qTrynGdF68Wj1WykNqWTy9EwFe
   mXpFJfvMY9gYF5wXjLuXnqa4jqj4iZ6HxTIKv9A4dLx6AGYHmf23PBrWB
   TdOqtNNy77RHyd5+0LlNS9SHlsE4/8I1WKv0mzb0HtD2MpIELQBnMTWW7
   xWQCc+0sbhUsdaDV6WwRw/RfXXE0sFUMKGUN/Ur/Q9WeD1I9Ww6rinqm/
   LB/4OcNsgBQcpm6Ju0qbtsn/oLrMEQJ5oBPXpWdEh0NEgr6XrTcayZhwu
   w==;
X-CSE-ConnectionGUID: OuABVViAROuOcKhZ/8GbNw==
X-CSE-MsgGUID: aAMaNu61Tr6ypQ4bOQw6Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66942726"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="66942726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:51:22 -0800
X-CSE-ConnectionGUID: KUl2hELkTQ2jTCKIRRVpxw==
X-CSE-MsgGUID: HmOPS4A0SLKYD4KJ15NuOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200599936"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 23:51:19 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>
Subject: [PATCH v2 4/4] HID: Intel-thc-hid: Intel-quicki2c: Add output report support
Date: Tue,  9 Dec 2025 15:52:15 +0800
Message-Id: <20251209075215.1535371-5-even.xu@intel.com>
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

Add support for HID output reports in the intel-quicki2c driver by
implementing the output_report callback in the HID low-level driver
interface.

This enables proper communication with HID devices that require
output report functionality, such as setting device configuration or
updating device firmware.

Tested-by: Rui Zhang <rui1.zhang@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
---
 .../intel-quicki2c/quicki2c-hid.c             |  8 ++++++++
 .../intel-quicki2c/quicki2c-protocol.c        | 19 +++++++++++++++++++
 .../intel-quicki2c/quicki2c-protocol.h        |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
index 5c3ec95bb3fd..580a760b3ffc 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
@@ -83,6 +83,13 @@ static int quicki2c_hid_power(struct hid_device *hid, int lvl)
 	return 0;
 }
 
+static int quicki2c_hid_output_report(struct hid_device *hid, u8 *buf, size_t count)
+{
+	struct quicki2c_device *qcdev = hid->driver_data;
+
+	return quicki2c_output_report(qcdev, buf, count);
+}
+
 static struct hid_ll_driver quicki2c_hid_ll_driver = {
 	.parse = quicki2c_hid_parse,
 	.start = quicki2c_hid_start,
@@ -91,6 +98,7 @@ static struct hid_ll_driver quicki2c_hid_ll_driver = {
 	.close = quicki2c_hid_close,
 	.power = quicki2c_hid_power,
 	.raw_request = quicki2c_hid_raw_request,
+	.output_report = quicki2c_hid_output_report,
 };
 
 /**
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index a287d9ee09c3..41271301215a 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -195,6 +195,25 @@ int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 	return buf_len;
 }
 
+int quicki2c_output_report(struct quicki2c_device *qcdev, void *buf, size_t buf_len)
+{
+	ssize_t len;
+	int ret;
+
+	len = quicki2c_init_write_buf(qcdev, 0, 0, false, buf, buf_len,
+				      qcdev->report_buf, qcdev->report_len);
+	if (len < 0)
+		return -EINVAL;
+
+	ret = thc_dma_write(qcdev->thc_hw, qcdev->report_buf, len);
+	if (ret) {
+		dev_err(qcdev->dev, "Output Report failed, ret %d\n", ret);
+		return ret;
+	}
+
+	return buf_len;
+}
+
 #define HIDI2C_RESET_TIMEOUT		5
 
 int quicki2c_reset(struct quicki2c_device *qcdev)
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
index db70e08c8b1c..6642cefb8a67 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
@@ -13,6 +13,7 @@ int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
 			unsigned int reportnum, void *buf, size_t buf_len);
 int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 			unsigned int reportnum, void *buf, size_t buf_len);
+int quicki2c_output_report(struct quicki2c_device *qcdev, void *buf, size_t buf_len);
 int quicki2c_get_device_descriptor(struct quicki2c_device *qcdev);
 int quicki2c_get_report_descriptor(struct quicki2c_device *qcdev);
 int quicki2c_reset(struct quicki2c_device *qcdev);
-- 
2.40.1


