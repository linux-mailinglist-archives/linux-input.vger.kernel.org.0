Return-Path: <linux-input+bounces-12749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF905AD2BA8
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 03:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 448643AFD02
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 01:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950181ACED3;
	Tue, 10 Jun 2025 01:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUgpaEkC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090319C578
	for <linux-input@vger.kernel.org>; Tue, 10 Jun 2025 01:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520780; cv=none; b=Bw607yT6XT0D21+rPA9ir3nWqcLK2hAWiOBWzoAE3VdTp9w4qpVgxvY64RGqErh8E+13DQE68p9P1w0ylkXnjLKROVJn8H7yorSVEyXC0dT9bFc/YfSobvjU/d5N4DinX5hm4efMdXvKIHnr/1eXXtrKhotjhwTqkamSzRogyws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520780; c=relaxed/simple;
	bh=7uc5w4CKuPQq8/vgMUWTPfsXGSiarEgGvZ9VSfMBGtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZkvAPUTyysAHwNAGSHzb/CyfoqCWxyN+mJ+7XttpmAKEu545EOgWXdPRq4VedfwJBruQFk6ch/iundPDxZF66FNo7Uiq0zNHXjeONW3GiCf7Ev5EO+S/5Jquzi9GMRxRsyP5HTIiHsKnR5OW9U82bsUdTd3filp9GvtiJji9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUgpaEkC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749520779; x=1781056779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7uc5w4CKuPQq8/vgMUWTPfsXGSiarEgGvZ9VSfMBGtg=;
  b=NUgpaEkCVg5BGw1seOivFZPWr+srlaCdjbUCxskpEEpeq9oTXbM+fQoV
   MhvZQTIlkodbphkKHex1scG2adKtO1OAyzgswmGt8M3UJc+9frN2vHlQh
   0iFApkBgHB8t5WT+yjvkRUnnIxmqHKPoQrATMFrKJXV9BU+PeTGfkSwPq
   kwr89h3VJiB0MBN2zCRlOUwyQFf259MmAMj9wc8EtmZ2fqfpRTz32n+AC
   0wi3XJ0lZMSHba//4JYMnx7b97OicD9/oB2clNs89X+8a6KgFdfX/JiCo
   fX++3YZhhlL1TLdejomX43EV7AlNpJSYUny27BeRXCvASDFhMi0XvHWqN
   w==;
X-CSE-ConnectionGUID: LtNn8wxZTNeTvyxujLIMfw==
X-CSE-MsgGUID: fN1JL0SDRgGQs5bsrExXDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51757962"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51757962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 18:59:39 -0700
X-CSE-ConnectionGUID: bSM7ko0BSbWJcBWXenZS0Q==
X-CSE-MsgGUID: BnpL+dCTSa6cpCadtRT0Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="146568475"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jun 2025 18:59:37 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	even.xu@intel.com,
	zhifeng.wang@intel.com,
	selina.wang@intel.com
Subject: [PATCH 2/2] HID: intel-ish-hid: ipc: Add Wildcat Lake PCI device ID
Date: Tue, 10 Jun 2025 10:01:32 +0800
Message-ID: <20250610020132.1544110-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610020132.1544110-1-lixu.zhang@intel.com>
References: <20250610020132.1544110-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device ID of Wildcat Lake into ishtp support list.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index 07e90d51f073..fa5d68c36313 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -38,6 +38,7 @@
 #define PCI_DEVICE_ID_INTEL_ISH_LNL_M		0xA845
 #define PCI_DEVICE_ID_INTEL_ISH_PTL_H		0xE345
 #define PCI_DEVICE_ID_INTEL_ISH_PTL_P		0xE445
+#define PCI_DEVICE_ID_INTEL_ISH_WCL		0x4D45
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 0db41ed74a14..c57483224db6 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -27,10 +27,12 @@ enum ishtp_driver_data_index {
 	ISHTP_DRIVER_DATA_NONE,
 	ISHTP_DRIVER_DATA_LNL_M,
 	ISHTP_DRIVER_DATA_PTL,
+	ISHTP_DRIVER_DATA_WCL,
 };
 
 #define ISH_FW_GEN_LNL_M "lnlm"
 #define ISH_FW_GEN_PTL "ptl"
+#define ISH_FW_GEN_WCL "wcl"
 
 #define ISH_FIRMWARE_PATH(gen) "intel/ish/ish_" gen ".bin"
 #define ISH_FIRMWARE_PATH_ALL "intel/ish/ish_*.bin"
@@ -42,6 +44,9 @@ static struct ishtp_driver_data ishtp_driver_data[] = {
 	[ISHTP_DRIVER_DATA_PTL] = {
 		.fw_generation = ISH_FW_GEN_PTL,
 	},
+	[ISHTP_DRIVER_DATA_WCL] = {
+		.fw_generation = ISH_FW_GEN_WCL,
+	},
 };
 
 static const struct pci_device_id ish_pci_tbl[] = {
@@ -70,6 +75,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_DEVICE_DATA(INTEL, ISH_LNL_M, ISHTP_DRIVER_DATA_LNL_M)},
 	{PCI_DEVICE_DATA(INTEL, ISH_PTL_H, ISHTP_DRIVER_DATA_PTL)},
 	{PCI_DEVICE_DATA(INTEL, ISH_PTL_P, ISHTP_DRIVER_DATA_PTL)},
+	{PCI_DEVICE_DATA(INTEL, ISH_WCL, ISHTP_DRIVER_DATA_WCL)},
 	{}
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.43.0


