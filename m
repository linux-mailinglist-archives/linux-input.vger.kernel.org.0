Return-Path: <linux-input+bounces-14364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66867B3917E
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 04:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C4AA1C23158
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 02:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7A6247281;
	Thu, 28 Aug 2025 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCXnZYHL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15643A1DB;
	Thu, 28 Aug 2025 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347009; cv=none; b=F8ePnG8niNWzzdN0goAbBh2Em7RmA9ypuokq5qcjZoed0xB6ZpLHcyH27PwrEfvx1Ze4BqcWCtP/HhUSa1Yibta6iSb3ykIypKl0aDNJTTSd9I/EHwTwOJDlMlBEob07K7by1i7HjwR/SlYSFnEBrEwfB0Zz+rv94UaWw8W8cYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347009; c=relaxed/simple;
	bh=WxUJ9tmNAEylcStTgxI39YLpCqhsV0y5p/R4ZLC2z/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kMB1XBgAjV66PaXq3b9hS7y/UpSBsQd8eOlzv1xrA5c0QIfa7g7O7WgMk7jvc7EwhxXoo7TvMQHoO7lCVj/Lqj0ETtOqJ0KhNVTkrVmLPO0/mHhHQYBab1qlN0PvnvhRxDxyM6+lCqNtEmx2dlhvcpQAc+z7b7AMSSM0MbXzr6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCXnZYHL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756347007; x=1787883007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WxUJ9tmNAEylcStTgxI39YLpCqhsV0y5p/R4ZLC2z/Q=;
  b=DCXnZYHLgt9pbm9cj0YM9GkxynWalhPamf4EdTWbVCleP+FdkB0JU6aE
   yn67qLJyd7hz3nPmuQE7Vr78n98pVKWe3eJ9r2Qb4IkkPdEAh/RfBPRdG
   shkP6MuEvODmBEXtngm6KfJ3jBI0s3Pe+j8qjVoGVawP92s4GkCskQzIQ
   EK6cm3fo7JRVWodIpl1N3snBYz9g9n5k1diHLqt4zPyCyGBQ+pkm/kY5a
   7CoRcDvsYHeK2SVt5Enq4/a48EXJCZ5Kd/vzZFViOgeSg2Ug23dQ/rycc
   sbvYMgzIHDWcBAC7VHR+Qwi8cS4BPdcKrzYFdXzm2v5lZ5gl+ebnU+CTm
   Q==;
X-CSE-ConnectionGUID: M7+RnPs/TK6hgOUYJcr5Qw==
X-CSE-MsgGUID: CJMc0JjkTXCm7b92lFgHHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58531546"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58531546"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 19:10:07 -0700
X-CSE-ConnectionGUID: hDl8Dj0iT1SYLAPNckOfyw==
X-CSE-MsgGUID: DF2x7J0ZSDS+lxKl15qQKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170376699"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa008.fm.intel.com with ESMTP; 27 Aug 2025 19:10:05 -0700
From: Xinpeng Sun <xinpeng.sun@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>
Subject: [PATCH v2 2/2] hid: intel-thc-hid: intel-quickspi: Add WCL Device IDs
Date: Thu, 28 Aug 2025 10:09:59 +0800
Message-Id: <20250828021000.3299377-2-xinpeng.sun@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250828021000.3299377-1-xinpeng.sun@intel.com>
References: <20250828021000.3299377-1-xinpeng.sun@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add THC SPI WildcatLake device IDs.

Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
---
 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 2 ++
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 5e5f179dd113..84314989dc53 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -976,6 +976,8 @@ static const struct pci_device_id quickspi_pci_tbl[] = {
 	{PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_SPI_PORT2, &ptl), },
 	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT1, &ptl), },
 	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT2, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT1, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT2, &ptl), },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, quickspi_pci_tbl);
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
index 6fdf674b21c5..f3532d866749 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -19,6 +19,8 @@
 #define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_SPI_PORT2	0xE34B
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT1	0xE449
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT2	0xE44B
+#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT1 	0x4D49
+#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT2 	0x4D4B
 
 /* HIDSPI special ACPI parameters DSM methods */
 #define ACPI_QUICKSPI_REVISION_NUM			2
-- 
2.40.1


