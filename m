Return-Path: <linux-input+bounces-14307-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F8B355A2
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 09:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05712172177
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 07:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3E42F60A5;
	Tue, 26 Aug 2025 07:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P22uCQnl"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18514238C0A;
	Tue, 26 Aug 2025 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756193244; cv=none; b=kU9mbDzc+m0vqRhigpl2DWYI9O8NDTirsWbIwut4j9ZaNgDHdzfe3RP9SWjn7foaIFlk2LRFLRn9L1/oPZRerlnThvpmZhaXsIpF6vWguNkoXXi33bYcPosZU7+d0q2b+6d9oF9J3c/rOR6VcMCWzqyWVMhyMOJL69QpSqJzVpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756193244; c=relaxed/simple;
	bh=M7nUNJ5bteQr1eQ0l5GTxgCR/uLOuSTeWeNvL3k4Ocw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8mTvfS90pCXHHJmr5n/cpcA/alWefddFcO5WpcfGapcX3sHp6jP+JUhuigM2eLN/X3ewfm0s6cQqFhKdzuDlORakM3cnOzzPM8p0D7dl+fQ30IzO+1aILUac4r93OJxluQl/wlcZOgD2Ros9Y/936Jx/+LaliQ0zgs8IcwQdSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P22uCQnl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756193244; x=1787729244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M7nUNJ5bteQr1eQ0l5GTxgCR/uLOuSTeWeNvL3k4Ocw=;
  b=P22uCQnlqgGFmq5hHz6B6EubFA0lTtCwu9krCweUEfmYcs089WBFjXru
   2WZbWJeyc5GSxZtHGO5x8CTH7ukiKMACPcRkc6FHJ936CPl+IiJPIqrdO
   clSwKgxocUSv/I1kXLrUN15mjeDgVSP9To0/uwIwrscJxB37WJCq3jSKJ
   DIfT3G0iAbY8XROHfGNj0xYGJeLqiPtEtQHr9VazLQw/vbrGcTzYSEOl3
   PHGbMSfuk0hJhYx732DxI7mggNwPGxi8dVnWka3wCCY26DTZNZxPzZFXI
   PxDh/hPA0O14R93co/GdVx+sIhYW7EJXQ5tU37Vx9QimsE2I3g5EM7qzM
   A==;
X-CSE-ConnectionGUID: 1+l3TdHDQ6yYNhnYiOSJ/A==
X-CSE-MsgGUID: f+xlwOUSRAySsn0O4XV4Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69519242"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69519242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 00:27:23 -0700
X-CSE-ConnectionGUID: PWcL+QTTQaexhZ5VJ7FZOQ==
X-CSE-MsgGUID: 7J1w2/nDSwCsHBmmKOJ5UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173901890"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by orviesa004.jf.intel.com with ESMTP; 26 Aug 2025 00:27:21 -0700
From: Xinpeng Sun <xinpeng.sun@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>
Subject: [PATCH 2/2] hid: intel-thc-hid: intel-quickspi: Add WCL Device IDs
Date: Tue, 26 Aug 2025 15:27:01 +0800
Message-Id: <20250826072701.991046-2-xinpeng.sun@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250826072701.991046-1-xinpeng.sun@intel.com>
References: <20250826072701.991046-1-xinpeng.sun@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


