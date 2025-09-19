Return-Path: <linux-input+bounces-14880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8BB878FF
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 03:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A07A3AD6F4
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 01:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED61C192B90;
	Fri, 19 Sep 2025 01:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKnSI9dd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B91D1DDC2C
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758243784; cv=none; b=icm/4kveW5a/ZgMy9iXIEBZzCdLXDhFtVpweJZw30jzEjIzKg/S7MArH5rsgxGl+L6F4ZnluOrAufOjfghOOqmQACZJ1cHtnbRP12pJQUE35aA2/IZSqeyfDx75vKEVC90wf4ylyGSzOaP4cBNx424AdgfAAFE0gKSM5RloElwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758243784; c=relaxed/simple;
	bh=ImfLdSfGhjgbPCPgvAy41KT2RRRLrby3zKQAFOR7c+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PETfIaOmRWSW0CPK7spgVTFX+vz7DVN9wx+WbkZSNgtmbzxmoHsVnOyYy/CndPjDW1U+vlpRqgia8rJ9mvhhtArikOphnl5nyZaTaF9aVksPN3qx26Baklt8Mi3uYXlFNxWcNDRiKK20sYQ7vPuKeoEoO5RAG07GUCDkk5FQ4fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKnSI9dd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758243783; x=1789779783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ImfLdSfGhjgbPCPgvAy41KT2RRRLrby3zKQAFOR7c+k=;
  b=cKnSI9ddPCyfU/B6fUU5ed7Euw3DwpKCu46I0nUjeXtqv4UaBVAboenT
   iRRtnY5NVFq7KDRtUmBO1vOoWtiMCjAPgpQYTkzm/iLwD6oirCELT2BmT
   Qn5Cj8AtvGoOx1BoMvOJp5Z4eg/w4S1G47XFVLfdIy5+3DUGT3my7I7t7
   uSpcQNN09/sHMP4UE51A2WACzKpr35AWIijDP3ZrXiKJTEkaPpSK52HLp
   HP4VkCMTcz8jfT1CMow0U2QdfeiaFvAW1wLrv4IksHPZYafLkb7+/MVTL
   DzWoI3RA+Nzy6rXxLgpk/Ld/LUE/0IYTkH2ml8ZaGCYLs3UUCtkKx0DgL
   w==;
X-CSE-ConnectionGUID: gx1PcJRpTjKbrJzcpOXp0w==
X-CSE-MsgGUID: cMS1E6igRMWy2ZhWAZlrlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60535416"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60535416"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:03:03 -0700
X-CSE-ConnectionGUID: D5cQi88TQnuyRu+AdHlnbg==
X-CSE-MsgGUID: 0TZovRmISva7ZHE2/1zaQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="180815159"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 18:03:02 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 3/6] HID: intel-ish-ipc: Reset clients state on resume from D3
Date: Fri, 19 Sep 2025 09:05:56 +0800
Message-ID: <20250919010559.165076-4-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919010559.165076-1-lixu.zhang@intel.com>
References: <20250919010559.165076-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ISH resumes from D3, the connection between ishtp clients and firmware
is lost. The ish_resume() function schedules resume_work asynchronously to
re-initiate the connection and then returns immediately. This can cause a
race where the upper-layer ishtp client driver's .resume() may execute
before the connection is fully restored, leaving the client in a stale
connected state. If the client sends messages during this window, the
firmware cannot respond.

To avoid this, reset the ishtp clients' state before returning from
ish_resume() if ISH is resuming from D3.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 9d150ce234f2..ccd195adbbd6 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -147,6 +147,12 @@ static inline bool ish_should_enter_d0i3(struct pci_dev *pdev)
 
 static inline bool ish_should_leave_d0i3(struct pci_dev *pdev)
 {
+	struct ishtp_device *dev = pci_get_drvdata(pdev);
+	u32 fwsts = dev->ops->get_fw_status(dev);
+
+	if (dev->suspend_flag || !IPC_IS_ISH_ILUP(fwsts))
+		return false;
+
 	return !pm_resume_via_firmware() || pdev->device == PCI_DEVICE_ID_INTEL_ISH_CHV;
 }
 
@@ -277,10 +283,8 @@ static void __maybe_unused ish_resume_handler(struct work_struct *work)
 {
 	struct pci_dev *pdev = to_pci_dev(ish_resume_device);
 	struct ishtp_device *dev = pci_get_drvdata(pdev);
-	uint32_t fwsts = dev->ops->get_fw_status(dev);
 
-	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag
-			&& IPC_IS_ISH_ILUP(fwsts)) {
+	if (ish_should_leave_d0i3(pdev)) {
 		if (device_may_wakeup(&pdev->dev))
 			disable_irq_wake(pdev->irq);
 
@@ -384,6 +388,10 @@ static int __maybe_unused ish_resume(struct device *device)
 	ish_resume_device = device;
 	dev->resume_flag = 1;
 
+	/* If ISH resume from D3, reset ishtp clients before return */
+	if (!ish_should_leave_d0i3(pdev))
+		ishtp_reset_handler(dev);
+
 	schedule_work(&resume_work);
 
 	return 0;
-- 
2.43.0


