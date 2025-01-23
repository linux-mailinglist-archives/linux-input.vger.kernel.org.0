Return-Path: <linux-input+bounces-9483-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53259A19C3B
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 02:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ADAB16A100
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 01:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC91017993;
	Thu, 23 Jan 2025 01:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhO8Pgj4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1C1EA65
	for <linux-input@vger.kernel.org>; Thu, 23 Jan 2025 01:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737595782; cv=none; b=KILWLSjEkO8bVhXzEmP54VnO1LJ0MonXEm4cQMvBK4u8gggbK+vqoXjO5opSSMR30DvCn9r4BV4mjADptwhJ8BQN1gVTHjcGQ96WXBzk26EG9TB+zwqv+5Kbx694e1o0WsfejYluFdfVKZaDHjV9FEo6CN80FerMx+VMm7YEkV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737595782; c=relaxed/simple;
	bh=neFESMxLfro4Q8OGLcREN5OXxWDdIfweEgV2pPFXK5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OkL7OSxR1nv8lip5h/r/Z9KOfTmA8M9WIMfCkokjv3iv8UkM2xE2aXhvllzcXjX+pgq6PaGPsqKREXiss4VeTC1ULC8XKIDzXZOFIJAHCo2s6kv2yk6+MnbJJn+IrTG/NAelgbunzd1fdSk1Ny+98p6d+H2lk3XQpvXaRgHCy4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhO8Pgj4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737595780; x=1769131780;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=neFESMxLfro4Q8OGLcREN5OXxWDdIfweEgV2pPFXK5Q=;
  b=bhO8Pgj4oWreI2bChL8Z8uxZhBDHLkNnNdZZ/FOd2x+WoNe+19LpV0Fv
   NyrWNBnk9t93GC5V/dv8KTmcMaD40SY1lcjet0CdQq7sE7RZ9kcnWWUlZ
   Ze0x9I8baeWLZDcIsYbWai6y1eDLVX9LSoW7qsufQqQqiyBSrTgjb+eYC
   YEBTk7mbtI7iA4UeUmX+yqvIjgeuPT10Z3ZdEWKM4q7Yf07XCYjQbSoC4
   cyg2IzZ6/+AYF8gPAj/1pJCUCRpNfLHdeFQAxKluL3v7J8TpwNpPGMv+S
   Dgj4vENsYojPE0HuWQ1ia3nSaYlrC0q1r+dLJBElYejxLVITa2b6I0a+U
   g==;
X-CSE-ConnectionGUID: GUH2YeeqRraGhqk8VQXNZQ==
X-CSE-MsgGUID: ZDjMbUwqQ7iMNt3CziRDAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37780879"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="37780879"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 17:29:40 -0800
X-CSE-ConnectionGUID: PQ7SyozpTMmMAjTP7FujZg==
X-CSE-MsgGUID: Cc39gPzaThyvwwEHAYnmhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="107132160"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jan 2025 17:29:38 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hemin.han@intel.com,
	selina.wang@intel.com
Subject: [PATCH] HID: intel-ish-hid: ipc: Add Panther Lake PCI device IDs
Date: Thu, 23 Jan 2025 09:30:44 +0800
Message-ID: <20250123013044.806257-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device IDs of Panther Lake-H and Panther Lake-P into ishtp support
list.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 2 ++
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index cdd80c653918..07e90d51f073 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -36,6 +36,8 @@
 #define PCI_DEVICE_ID_INTEL_ISH_ARL_H		0x7745
 #define PCI_DEVICE_ID_INTEL_ISH_ARL_S		0x7F78
 #define PCI_DEVICE_ID_INTEL_ISH_LNL_M		0xA845
+#define PCI_DEVICE_ID_INTEL_ISH_PTL_H		0xE345
+#define PCI_DEVICE_ID_INTEL_ISH_PTL_P		0xE445
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 9e2401291a2f..ff0fc8010072 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -26,9 +26,11 @@
 enum ishtp_driver_data_index {
 	ISHTP_DRIVER_DATA_NONE,
 	ISHTP_DRIVER_DATA_LNL_M,
+	ISHTP_DRIVER_DATA_PTL,
 };
 
 #define ISH_FW_GEN_LNL_M "lnlm"
+#define ISH_FW_GEN_PTL "ptl"
 
 #define ISH_FIRMWARE_PATH(gen) "intel/ish/ish_" gen ".bin"
 #define ISH_FIRMWARE_PATH_ALL "intel/ish/ish_*.bin"
@@ -37,6 +39,9 @@ static struct ishtp_driver_data ishtp_driver_data[] = {
 	[ISHTP_DRIVER_DATA_LNL_M] = {
 		.fw_generation = ISH_FW_GEN_LNL_M,
 	},
+	[ISHTP_DRIVER_DATA_PTL] = {
+		.fw_generation = ISH_FW_GEN_PTL,
+	},
 };
 
 static const struct pci_device_id ish_pci_tbl[] = {
@@ -63,6 +68,8 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_H)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_S)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_LNL_M), .driver_data = ISHTP_DRIVER_DATA_LNL_M},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_PTL_H), .driver_data = ISHTP_DRIVER_DATA_PTL},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_PTL_P), .driver_data = ISHTP_DRIVER_DATA_PTL},
 	{}
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);

base-commit: 232f121837ad8b1c21cc80f2c8842a4090c5a2a0
-- 
2.40.1


