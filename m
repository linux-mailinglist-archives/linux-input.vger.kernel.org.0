Return-Path: <linux-input+bounces-9170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D4BA0B1BC
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 09:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D25418864C4
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 08:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3761B234967;
	Mon, 13 Jan 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsqW+NVl"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B9D234966;
	Mon, 13 Jan 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758313; cv=none; b=nfgW956rfA1tFONtUFffKe5F4U+GU38J2DmZs1OfSf/Sz1ML5nMOaYglKqo0uvKlTXee0z9SYljMBrIyK/yLPethW/YOZsT16i6rUcu/Xk2wzrjoQNlSSXYL/BgbBbcxdd5jUaEZxqzwu3062bphyok0bTAIBM0HoG/h+IgbOYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758313; c=relaxed/simple;
	bh=GrdSH3kOGzSC9vh1I0PJRxR8hxojv7drGGKvsvoWZlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FDbh5amtfUO76VaURbZzSHm8ilO+Puow4/u0h7S3YVtfZYOqAXgD7z7OKffojPCi57XOB0t1yh2ruMCLhyn+Nj2ANAOJNrTewzpLR8O+HT1oBBu525OoMVzu4isHITX3GqiMfU50ZXtxFkoioV/zh2NX/NPWg3HXGIPieFMYniQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsqW+NVl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736758312; x=1768294312;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GrdSH3kOGzSC9vh1I0PJRxR8hxojv7drGGKvsvoWZlQ=;
  b=AsqW+NVl8uwK2yHsv9N94v/tcHdSO6HTljvyhI4xEuHe7h1oa6ADmKu4
   huiOxds+liQvO+Odb0xSG4PBvWYuyrQi9RZRJiRHPNzIrBltXJaX7OCFs
   VyhGMmsNQgtVIqMMFksiQKPKIcpBSsHqPl+9CW8xtw8MGeR9jOhXJdhb9
   XFsnuvUusmIxOzOYGkzZoU1BsKRzH9XV8yAt2NNpiiOvQPxU7PZ6iFLz+
   o8kzqUbzVjqfDQNmAHqkF5IDQjTzpBvXf2QfLkTBsrksRDxjsBBh8Ilvy
   +I4+I59zfcbkfTiEU5ljPBBiU167F8pvMrzuNJe+tWmmhORCe6kZmshJ3
   g==;
X-CSE-ConnectionGUID: nIDQHlccQh6f09c9UCmDYA==
X-CSE-MsgGUID: ATAbHgzvSzSV2naLMj0y6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48006961"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48006961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 00:51:51 -0800
X-CSE-ConnectionGUID: bkt7A2M3S3ilPM8x1iM7Cw==
X-CSE-MsgGUID: rBKHrMNLQX+XtT3LSctGgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109442639"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2025 00:51:48 -0800
From: Even Xu <even.xu@intel.com>
To: dan.carpenter@linaro.org
Cc: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH next] HID: intel-thc-hid: intel-quicki2c: fix potential memory corruption
Date: Mon, 13 Jan 2025 16:50:47 +0800
Message-Id: <20250113085047.2100403-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use U32 to get value from ACPI and explicitly cast to U16.

fixes: 5282e45ccbfa ("HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces")
Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index b56c72124821..2de93f4a25ca 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -118,6 +118,7 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 	struct acpi_device *adev = ACPI_COMPANION(qcdev->dev);
 	struct quicki2c_subip_acpi_parameter i2c_param;
 	struct quicki2c_subip_acpi_config i2c_config;
+	u32 hid_desc_addr;
 	int ret = -EINVAL;
 
 	if (!adev) {
@@ -131,10 +132,12 @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
 					     QUICKI2C_ACPI_REVISION_NUM,
 					     QUICKI2C_ACPI_FUNC_NUM_HID_DESC_ADDR,
 					     ACPI_TYPE_INTEGER,
-					     &qcdev->hid_desc_addr);
+					     &hid_desc_addr);
 	if (ret)
 		return ret;
 
+	qcdev->hid_desc_addr = (u16)hid_desc_addr;
+
 	ret = quicki2c_acpi_get_dsm_property(adev, &thc_platform_guid,
 					     QUICKI2C_ACPI_REVISION_NUM,
 					     QUICKI2C_ACPI_FUNC_NUM_ACTIVE_LTR_VAL,
-- 
2.40.1


