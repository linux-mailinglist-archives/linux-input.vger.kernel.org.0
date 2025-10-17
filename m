Return-Path: <linux-input+bounces-15537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D16BE618B
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 04:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F3F84E77E3
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BFA201004;
	Fri, 17 Oct 2025 02:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzFAu09g"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084B31F4CB3
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 02:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667572; cv=none; b=KluFQf8T8rvY1F8xhvYOLOxk85qrOrMa6QJb93w7eJn1d8WczWb5oi7VdcHEbD87hVOv/Q6TbzmDTkOBPYUxKumkOGxNsOmw5pN3V6cAuE/Vz2Ec1cpRJZqSKmWWLDaAKTN50SlE1oSNFYDFBepl91qfLPCA4Gqd7p1DSPfOxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667572; c=relaxed/simple;
	bh=3eZ/1aA7hzGzL4iRMS+2MxpV5sxOzK3XX8X5EfBnjsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nU4zo9sLm+aA/GSxLF4o9nL5qA10YWnKTC+cZtyDIhEtkN3/VsxyCJ/nfTbQHWzJ+TvEtCJFZl+05aAGzJMBbGoPKAOHC1wmEFjDtO80Fwfa7umxC/+eQPyLwnWo7r3Jv8+QxStkauHOCAJ5ulRaTpdCYcsxa3otH+RwURq+YA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzFAu09g; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667571; x=1792203571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3eZ/1aA7hzGzL4iRMS+2MxpV5sxOzK3XX8X5EfBnjsw=;
  b=HzFAu09gF2JqJuLRT5Suqr0ILBYF26hSJHt4Ozf+8565YKIQVTlZOwFY
   BEsNo52D7Z+XMJr5Jylj9GPSH8bClqgZhluiL6aBx0zzMWWj8zvPyRGBZ
   wLxSZ01zD5n/I1J/sD9NulO1xMm4lX/oPQRA2vxEPA1smE2nJQtcNBkMc
   Mv0GZifSU6yecYcj4Vh1Wu2AOxMJVfkQvX9BdjRz700RBJH4DSDOgnium
   MsENVKhBa/uJwXStY4qOmmE7jH5VOZ/h+/iGhfllY4UvY42Ge3Z5oVPV2
   2X1AJ6qpPU3JPF7YGwgPvhpwuQbGFPc7Mq2TB4i6sL45V+X2+uJVvczHZ
   w==;
X-CSE-ConnectionGUID: 4JyekmyRSsShnPVY61BWFw==
X-CSE-MsgGUID: zmjqECaZQ9SCKg+PWR9pXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66738711"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66738711"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:19:31 -0700
X-CSE-ConnectionGUID: ZsnGIEQ5RPCmQm67goPV4A==
X-CSE-MsgGUID: Qs3LHkT/QNadfjAI5oUlkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213586360"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 19:19:29 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH v2 3/6] HID: intel-ish-ipc: Reset clients state on resume from D3
Date: Fri, 17 Oct 2025 10:22:15 +0800
Message-ID: <20251017022218.1292451-4-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017022218.1292451-1-lixu.zhang@intel.com>
References: <20251017022218.1292451-1-lixu.zhang@intel.com>
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
index b748ac6fbfdc..e4499c83c62e 100644
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
 	queue_work(dev->unbound_wq, &resume_work);
 
 	return 0;
-- 
2.43.0


