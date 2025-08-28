Return-Path: <linux-input+bounces-14363-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E1B3917C
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 04:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A171C230EA
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 02:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1435F2405E3;
	Thu, 28 Aug 2025 02:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmAzwi+q"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFF1E487;
	Thu, 28 Aug 2025 02:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347008; cv=none; b=EkpQ/eGEEs0YRdI8RdfoLznzT/qIaIZghJ7Xo6iUiHhayBlfcKLB+wUp/T21rKqQOgkULUaJYsyKGKY2T+6bQ/gEDHF7TKoRqlbIjlh4gp5Wae+5qh6c+74f0FLpe6FbGHwlRQO4S8JIAq3bJbeEpgegAhnTSlZ46GrYk0/UhLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347008; c=relaxed/simple;
	bh=MXzCHTELELaYCr08y0wGmlaWQw+OjzUn3eNiAITRUrA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AZ84O0edmrIi9C6LjhlGqC2bJpOwFyuaF3WSxzH3dsMqlXzkbuXHplECuQK6SGQpAzPgxeN8FB/bDM8hjWj5m54YNVTDZBIlXWvp/bQdG07WcGIaF2+1zjJsLBqOmAZC+QZI1vPe5UyBBzy+vRNe92wqx+37RRJ7dA3cW4hEa8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmAzwi+q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756347006; x=1787883006;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MXzCHTELELaYCr08y0wGmlaWQw+OjzUn3eNiAITRUrA=;
  b=mmAzwi+q3I9F2+KBxfHHDFvXQy0frIAruOPlX54WB4nFUcg8+jNjE5Z6
   2CBM5rEmHChtKvegmtAWXyCo6d3vqOsC3/QTdKulYRoXlyPHNo+2pn01N
   jNyWu6UL0WWmBE/tAbuqnzVzrHBYsEVOj3xTbwfI7s/S9L4UalcU8S9Kz
   jL0uabDaLJlnQVhm6hAQgfYQXeERbX2Hrk2Ya2WcmG5xVN9YaiKTKX8t/
   Ev9PF8qRGszTX9CWkxARsgY6S1wDKMmYSFG8L0FlfuUcF8IOsXfJNp/oy
   NOGXIONA56u5NhI2HVWpAmyLvKtkO1DhQG89fcLfsZUfJ2anbcsTuvhQj
   w==;
X-CSE-ConnectionGUID: KZD7qpejTrSTHeu7MJQKiA==
X-CSE-MsgGUID: 5PX/6ulKTCKFDCNibadUng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58531543"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58531543"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 19:10:05 -0700
X-CSE-ConnectionGUID: udjpwxEHTNe9vTdxxTPMGQ==
X-CSE-MsgGUID: MiQmGgRlSgeuJbD2Tm0deg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170376690"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa008.fm.intel.com with ESMTP; 27 Aug 2025 19:10:03 -0700
From: Xinpeng Sun <xinpeng.sun@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>
Subject: [PATCH v2 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device IDs
Date: Thu, 28 Aug 2025 10:09:58 +0800
Message-Id: <20250828021000.3299377-1-xinpeng.sun@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add THC I2C WildcatLake device IDs.

Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
---
 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 ++
 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index f122fde879b9..17b1f2df8f8a 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -1019,6 +1019,8 @@ static const struct pci_device_id quicki2c_pci_tbl[] = {
 	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
 	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1, &ptl_ddata) },
 	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
+	{ PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_I2C_PORT1, &ptl_ddata) },
+	{ PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, quicki2c_pci_tbl);
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index b78c8864d39e..240492a38c24 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -13,6 +13,8 @@
 #define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_I2C_PORT2	0xE34A
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT1	0xE448
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT2	0xE44A
+#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_I2C_PORT1 	0x4D48
+#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_I2C_PORT2 	0x4D4A
 
 /* Packet size value, the unit is 16 bytes */
 #define MAX_PACKET_SIZE_VALUE_LNL			256
-- 
2.40.1


