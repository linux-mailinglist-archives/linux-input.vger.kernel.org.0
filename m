Return-Path: <linux-input+bounces-2259-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC06872BE9
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 01:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C8741F22401
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 00:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A4819E;
	Wed,  6 Mar 2024 00:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gB1Q6Qxf"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89494612E
	for <linux-input@vger.kernel.org>; Wed,  6 Mar 2024 00:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709686600; cv=none; b=htgMilprmtA0fufWNXdxR/HamiRbpbggw3dEkiZHOrgK5fthAP46Vq2+9QHnBWRkQWgWD29ci/E99gY1WqN2HWmd6ErWObrOejh7igfA7DY9qHP58D6SoD1wZp2hlFAAUdIQjbkk/pxe+AFfJD/kCIQbDjTSMbMTXBjpQ7pnoqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709686600; c=relaxed/simple;
	bh=Zlwv2jkRcxSuh9VbM8IFeNGrOVnBUH1F68OIfu9aGIU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d+LlVZPCSOAcMF5yH/MJ5YmawQoK6JPoKMY953XIazXg9Ee1VPJTOAhglDepoc/i561o4Db4v3P8TZfdyfhV7tlF/cz5Y8fIT2fNGfeyM/nSoofLSQGu8wuw2efi5N9/jGLL6G6VtY+RiDWifyISOxOgBmorvsJ1x9Tp9FF5LyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gB1Q6Qxf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709686599; x=1741222599;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Zlwv2jkRcxSuh9VbM8IFeNGrOVnBUH1F68OIfu9aGIU=;
  b=gB1Q6QxfLKKqGbcdQ+d8sS7T8OPZWozX0w+oqGZRBEq57zZCDYXNWWHx
   XkBywqSYNmxhQwm7O/w+v49CCwfXLJc7cn1nO8RqZvgUbKrxz1Rc7+4w/
   3xSPBrSH+E165C95lw3i8Fr42HJnHz42RypVN3dQj0L0R0UUP9McO/zVc
   eESIhYVLmbG/IpwestSKuf35ZLJRtqGvtxwzCFbRWa9QDGBN4NUpeTgq9
   +R0+mWD8rCM3+dEOPuMyJK/OykQ0Av6xZ6OZBDw2coaIajqpi0QiHsCjs
   hM+hnD2j6eKaN5utMvknthcbka+W2LPatFSGQhPUMmHgYyKTEKz6Mbe42
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8094865"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8094865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 16:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9983837"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.198])
  by orviesa007.jf.intel.com with ESMTP; 05 Mar 2024 16:56:37 -0800
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Subject: [PATCH 1/2] HID: intel-ish-hid: Use PCI_VDEVICE() and rename device ID macros
Date: Wed,  6 Mar 2024 00:56:37 +0000
Message-Id: <20240306005638.2781839-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306005638.2781839-1-lixu.zhang@intel.com>
References: <20240306005638.2781839-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use PCI_VDEVICE() to simplify the device table, and rename these IDs to
follow the pattern PCI_DEVICE_ID_INTEL_*;

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Zhang, Lixu <lixu.zhang@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 44 +++++++++----------
 drivers/hid/intel-ish-hid/ipc/ipc.c     | 14 +++---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 58 ++++++++++++-------------
 3 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index f89b300417d7..a4484f3ba2be 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -13,28 +13,28 @@
 #include "hw-ish-regs.h"
 #include "ishtp-dev.h"
 
-#define CHV_DEVICE_ID		0x22D8
-#define BXT_Ax_DEVICE_ID	0x0AA2
-#define BXT_Bx_DEVICE_ID	0x1AA2
-#define APL_Ax_DEVICE_ID	0x5AA2
-#define SPT_Ax_DEVICE_ID	0x9D35
-#define CNL_Ax_DEVICE_ID	0x9DFC
-#define GLK_Ax_DEVICE_ID	0x31A2
-#define CNL_H_DEVICE_ID		0xA37C
-#define ICL_MOBILE_DEVICE_ID	0x34FC
-#define SPT_H_DEVICE_ID		0xA135
-#define CML_LP_DEVICE_ID	0x02FC
-#define CMP_H_DEVICE_ID		0x06FC
-#define EHL_Ax_DEVICE_ID	0x4BB3
-#define TGL_LP_DEVICE_ID	0xA0FC
-#define TGL_H_DEVICE_ID		0x43FC
-#define ADL_S_DEVICE_ID		0x7AF8
-#define ADL_P_DEVICE_ID		0x51FC
-#define ADL_N_DEVICE_ID		0x54FC
-#define RPL_S_DEVICE_ID		0x7A78
-#define MTL_P_DEVICE_ID		0x7E45
-#define ARL_H_DEVICE_ID		0x7745
-#define ARL_S_DEVICE_ID		0x7F78
+#define PCI_DEVICE_ID_INTEL_ISH_CHV		0x22D8
+#define PCI_DEVICE_ID_INTEL_ISH_BXT_Ax		0x0AA2
+#define PCI_DEVICE_ID_INTEL_ISH_BXT_Bx		0x1AA2
+#define PCI_DEVICE_ID_INTEL_ISH_APL_Ax		0x5AA2
+#define PCI_DEVICE_ID_INTEL_ISH_SPT_Ax		0x9D35
+#define PCI_DEVICE_ID_INTEL_ISH_CNL_Ax		0x9DFC
+#define PCI_DEVICE_ID_INTEL_ISH_GLK_Ax		0x31A2
+#define PCI_DEVICE_ID_INTEL_ISH_CNL_H		0xA37C
+#define PCI_DEVICE_ID_INTEL_ISH_ICL_MOBILE	0x34FC
+#define PCI_DEVICE_ID_INTEL_ISH_SPT_H		0xA135
+#define PCI_DEVICE_ID_INTEL_ISH_CML_LP		0x02FC
+#define PCI_DEVICE_ID_INTEL_ISH_CMP_H		0x06FC
+#define PCI_DEVICE_ID_INTEL_ISH_EHL_Ax		0x4BB3
+#define PCI_DEVICE_ID_INTEL_ISH_TGL_LP		0xA0FC
+#define PCI_DEVICE_ID_INTEL_ISH_TGL_H		0x43FC
+#define PCI_DEVICE_ID_INTEL_ISH_ADL_S		0x7AF8
+#define PCI_DEVICE_ID_INTEL_ISH_ADL_P		0x51FC
+#define PCI_DEVICE_ID_INTEL_ISH_ADL_N		0x54FC
+#define PCI_DEVICE_ID_INTEL_ISH_RPL_S		0x7A78
+#define PCI_DEVICE_ID_INTEL_ISH_MTL_P		0x7E45
+#define PCI_DEVICE_ID_INTEL_ISH_ARL_H		0x7745
+#define PCI_DEVICE_ID_INTEL_ISH_ARL_S		0x7F78
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index a49c6affd7c4..7cc412798fdf 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -78,7 +78,7 @@ static bool check_generated_interrupt(struct ishtp_device *dev)
 	bool interrupt_generated = true;
 	uint32_t pisr_val = 0;
 
-	if (dev->pdev->device == CHV_DEVICE_ID) {
+	if (dev->pdev->device == PCI_DEVICE_ID_INTEL_ISH_CHV) {
 		pisr_val = ish_reg_read(dev, IPC_REG_PISR_CHV_AB);
 		interrupt_generated =
 			IPC_INT_FROM_ISH_TO_HOST_CHV_AB(pisr_val);
@@ -117,7 +117,7 @@ static bool ish_is_input_ready(struct ishtp_device *dev)
  */
 static void set_host_ready(struct ishtp_device *dev)
 {
-	if (dev->pdev->device == CHV_DEVICE_ID) {
+	if (dev->pdev->device == PCI_DEVICE_ID_INTEL_ISH_CHV) {
 		if (dev->pdev->revision == REVISION_ID_CHT_A0 ||
 				(dev->pdev->revision & REVISION_ID_SI_MASK) ==
 				REVISION_ID_CHT_Ax_SI)
@@ -909,11 +909,11 @@ static uint32_t ish_ipc_get_header(struct ishtp_device *dev, int length,
  */
 static bool _dma_no_cache_snooping(struct ishtp_device *dev)
 {
-	return (dev->pdev->device == EHL_Ax_DEVICE_ID ||
-		dev->pdev->device == TGL_LP_DEVICE_ID ||
-		dev->pdev->device == TGL_H_DEVICE_ID ||
-		dev->pdev->device == ADL_S_DEVICE_ID ||
-		dev->pdev->device == ADL_P_DEVICE_ID);
+	return (dev->pdev->device == PCI_DEVICE_ID_INTEL_ISH_EHL_Ax ||
+		dev->pdev->device == PCI_DEVICE_ID_INTEL_ISH_TGL_LP ||
+		dev->pdev->device == PCI_DEVICE_ID_INTEL_ISH_TGL_H ||
+		dev->pdev->device == PCI_DEVICE_ID_INTEL_ISH_ADL_S ||
+		dev->pdev->device == PCI_DEVICE_ID_INTEL_ISH_ADL_P);
 }
 
 static const struct ishtp_hw_ops ish_hw_ops = {
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 56bd4f02f319..330916ed5bfd 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -24,29 +24,29 @@
 #include "hw-ish.h"
 
 static const struct pci_device_id ish_pci_tbl[] = {
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CHV_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, BXT_Ax_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, BXT_Bx_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, APL_Ax_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, SPT_Ax_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CNL_Ax_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, GLK_Ax_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CNL_H_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ICL_MOBILE_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, SPT_H_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CML_LP_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CMP_H_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, EHL_Ax_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_LP_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_H_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_S_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_P_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_N_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, RPL_S_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, MTL_P_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ARL_H_DEVICE_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ARL_S_DEVICE_ID)},
-	{0, }
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_CHV)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_BXT_Ax)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_BXT_Bx)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_APL_Ax)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_SPT_Ax)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_CNL_Ax)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_GLK_Ax)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_CNL_H)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ICL_MOBILE)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_SPT_H)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_CML_LP)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_CMP_H)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_EHL_Ax)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_TGL_LP)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_TGL_H)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ADL_S)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ADL_P)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ADL_N)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_RPL_S)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_MTL_P)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_H)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_S)},
+	{}
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
 
@@ -105,19 +105,19 @@ static int ish_init(struct ishtp_device *dev)
 
 static const struct pci_device_id ish_invalid_pci_ids[] = {
 	/* Mehlow platform special pci ids */
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xA309)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xA30A)},
+	{PCI_VDEVICE(INTEL, 0xA309)},
+	{PCI_VDEVICE(INTEL, 0xA30A)},
 	{}
 };
 
 static inline bool ish_should_enter_d0i3(struct pci_dev *pdev)
 {
-	return !pm_suspend_via_firmware() || pdev->device == CHV_DEVICE_ID;
+	return !pm_suspend_via_firmware() || pdev->device == PCI_DEVICE_ID_INTEL_ISH_CHV;
 }
 
 static inline bool ish_should_leave_d0i3(struct pci_dev *pdev)
 {
-	return !pm_resume_via_firmware() || pdev->device == CHV_DEVICE_ID;
+	return !pm_resume_via_firmware() || pdev->device == PCI_DEVICE_ID_INTEL_ISH_CHV;
 }
 
 /**
@@ -189,7 +189,7 @@ static int ish_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	init_waitqueue_head(&ishtp->resume_wait);
 
 	/* Enable PME for EHL */
-	if (pdev->device == EHL_Ax_DEVICE_ID)
+	if (pdev->device == PCI_DEVICE_ID_INTEL_ISH_EHL_Ax)
 		device_init_wakeup(dev, true);
 
 	ret = ish_init(ishtp);
@@ -222,7 +222,7 @@ static void ish_remove(struct pci_dev *pdev)
  */
 static void ish_shutdown(struct pci_dev *pdev)
 {
-	if (pdev->device == EHL_Ax_DEVICE_ID)
+	if (pdev->device == PCI_DEVICE_ID_INTEL_ISH_EHL_Ax)
 		pci_prepare_to_sleep(pdev);
 }
 
-- 
2.40.1


