Return-Path: <linux-input+bounces-15540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F3BE6194
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 04:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF27F3AE2BE
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A580F2036E9;
	Fri, 17 Oct 2025 02:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8YgqwKq"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03EC212575
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 02:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667577; cv=none; b=c/7UrNnw7S1xWFIW/t9X/Br6NdEMX0p+ilKw+Z/MrlWc0UWUwcifXOQvHdF1kj9UzdpyOhpIyWFFX70dCL8KNFm6KL2jw8iuyZGjhWFDBfzpnw3K3QHRPIxVEuG8zuEDmVT6VpxrKVYrFgPCCzmEK0s/NYXVteZWIUxzhcl9eww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667577; c=relaxed/simple;
	bh=AJOnnXbNfmjMBQ1bk6aC/19iUcQP/FxK9U8AeM6l2nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXNFp7MmVXRpdStvcKwLS7DqgX1tFAnwxqHLXNhwJm62xqhDDomEB/7J2DjebpfRXyb0sxA2Oen87i2iLaBBRinjJSynxuEnoyrNHtIH3eDHNxgyPQaK+r2GqLgcNEYOVNbMbg9DsaJbXPvglnZ0s3gFf7sv2UI9VENcYL5ZobU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8YgqwKq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667576; x=1792203576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AJOnnXbNfmjMBQ1bk6aC/19iUcQP/FxK9U8AeM6l2nA=;
  b=H8YgqwKqiX3/j9EYwuKN8FfySzAc+x9CQ2zHbvWG6eyowfTCk/ly/+/C
   tLYTB9xkU6VVYfSIICdJDfihPQRTltxKVRRUpYZiJ6oCIhW5mlmZL0P5J
   sqN89fPNa09Jz5l0r/s8/XTqBLDJTK977KdQCHCzJ8+EOKxl2UTLPsg1m
   JTB3TJ8O63pDe/gKKH2tzkRbVYpHa4kCsG5ZT/K93b/tLQgsAc+cmx3Wd
   zy8ATgDLRkIWXeEA7MRN01z87Z7lSGyivKYDrk76qS40sNEGuGGwIPpbf
   5MyA2VC5g1h/0m5y5+zdKwV4z4LhymaxZMZ8bRro4ReczkiGM4fcgy5i1
   A==;
X-CSE-ConnectionGUID: bsUboJJQSTuWJb0AtYr1tQ==
X-CSE-MsgGUID: un9f+2wHST2nYOgiXyskRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66738723"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66738723"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:19:36 -0700
X-CSE-ConnectionGUID: o6wcS0DVQfipjqeVxNsbRg==
X-CSE-MsgGUID: BGQd5OzbQRmkhuk0W2sOjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213586379"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 19:19:34 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH v2 6/6] HID: intel-ish-hid: ipc: Separate hibernate callbacks in dev_pm_ops
Date: Fri, 17 Oct 2025 10:22:18 +0800
Message-ID: <20251017022218.1292451-7-lixu.zhang@intel.com>
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

The same suspend and resume callbacks are used for both suspend-to-RAM/idle
and hibernation. These callbacks invoke pm_suspend_via_firmware() and
pm_resume_via_firmware(), respectively. In the .freeze() of hibernation,
pm_suspend_via_firmware() returns false, causing the driver to put ISH into
D0i3. However, during the .thaw(), pm_resume_via_firmware() returns true,
leading the driver to treat ISH as resuming from D3 instead of D0i3. The
asymmetric behavior between .freeze() and .thaw() during hibernation can
cause the client connection states on the firmware side and the driver side
to become inconsistent.

To address the inconsistent client connection states issue, separate
hibernate-related callbacks (freeze, thaw) in dev_pm_ops. Since ISH does
not need to save any firmware-related state when entering hibernation, it
is sufficient to call pci_save_state() in .freeze() to prevent the PCI bus
from changing the ISH power state. No actions are required in .thaw().

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index e4499c83c62e..1612e8cb23f0 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -397,7 +397,20 @@ static int __maybe_unused ish_resume(struct device *device)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ish_pm_ops, ish_suspend, ish_resume);
+static int __maybe_unused ish_freeze(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+
+	return pci_save_state(pdev);
+}
+
+static const struct dev_pm_ops __maybe_unused ish_pm_ops = {
+	.suspend = pm_sleep_ptr(ish_suspend),
+	.resume = pm_sleep_ptr(ish_resume),
+	.freeze = pm_sleep_ptr(ish_freeze),
+	.restore = pm_sleep_ptr(ish_resume),
+	.poweroff = pm_sleep_ptr(ish_suspend),
+};
 
 static ssize_t base_version_show(struct device *cdev,
 				 struct device_attribute *attr, char *buf)
-- 
2.43.0


