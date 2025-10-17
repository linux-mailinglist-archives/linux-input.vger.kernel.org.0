Return-Path: <linux-input+bounces-15539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C78BE6191
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 04:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD6781A64D99
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2D513B280;
	Fri, 17 Oct 2025 02:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDOLsFBQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6691F4CB3
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 02:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667576; cv=none; b=oYg7HbgxP4C3b1pgeOUMqK1OCIAv+2gNOZII6o8OqAp1pHnZz1mMfs/ZwUtLTGW+G5kdNPsKYQnig3nKxyu5+DArY8jxq8bp9QrMt6Y+xArigBrry7zMRmSXqD+ajfuHIsL/aGc0s2Uyu2mdhcNk/xNuOrbj/QejQFmnotZ07as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667576; c=relaxed/simple;
	bh=S+0/tcLHhhVBVlnGbHYRAIvYChm9ZJG60+Dp037PIPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpujekLVPPrI6JR3ytJ3MY7NfMSFuk7B6wnUSLYTwM8Whri1WuWZEGWarr2SjasZOXG/LgC55CicVwZdWa/DTY//QiNtRMvtXsUkapbkbq5uqPl5r8m6dmBPE0zFfsdoKpDzqV34CefLpX8XFBZ/kRd3NIX0TQPA2UeV2vqd9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDOLsFBQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667575; x=1792203575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S+0/tcLHhhVBVlnGbHYRAIvYChm9ZJG60+Dp037PIPg=;
  b=jDOLsFBQgvxeYs1KHsSLLi4kwnlT84PBtaUksuGDGDum1m673IIwdu0k
   0OVHtWg6yODzvXql1GZRzGOPkooBSo9DJtETbfnpwiyEbDDWQPtdbsxCE
   qYgGDSBc81h/svNgtIfZsEibO+reLuiCyMv6jsP6rsx6fZ2rUZEt7b839
   JT/FmERF4KU6WomevkT8bHsKWACwB7mgCfgJqcLAn9oifiCMVEdMqJiKW
   hX9H3E8OtMJgQnEWTPS+Lfypqw717SbHWxlZmMrsLr9Rj7bzYtHeC2Wpl
   PJKWONyD4RVrvjeCOyjAleAqbuadpjJqfqejlFI/1QD9Y9dIjJNqTxkZG
   Q==;
X-CSE-ConnectionGUID: aE6PUPBMQUWW99DVnM6PaQ==
X-CSE-MsgGUID: QiFIRcIrRl6dw/ehEQj4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66738719"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66738719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:19:34 -0700
X-CSE-ConnectionGUID: ZfqcnmZoQM6Lz3nh6a1ifg==
X-CSE-MsgGUID: UAKSuJ4IQDK35bwy6GeYSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213586376"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 19:19:32 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH v2 5/6] HID: intel-ish-hid: Use IPC RESET instead of void message in ish_wakeup()
Date: Fri, 17 Oct 2025 10:22:17 +0800
Message-ID: <20251017022218.1292451-6-lixu.zhang@intel.com>
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

On ISH power-up, the bootloader enters sleep after preparing to load the
main firmware, waiting for the driver to be ready. When the driver is
ready, it sends a void message to wake up the bootloader and load the main
firmware. The main firmware then sends MNG_RESET_NOTIFY to the driver for
handshake.

This void message-based IPC handshake only works if the main firmware has
not been loaded. During hibernation resume, if the restore kernel has the
ISH driver, the driver wakes up the bootloader to load the main firmware
and perform IPC handshake. However, when switching to the image kernel,
since the main firmware is already loaded, sending a void message in the
.restore() callback does not trigger IPC handshake.

By sending MNG_RESET_NOTIFY (IPC RESET message) in ish_wakeup() instead of
a void message, we can explicitly wake up the bootloader and perform IPC
handshake, regardless of the firmware state. Additionally, since
ish_ipc_reset() already waits for recvd_hw_ready, the redundant wait for
recvd_hw_ready in ish_hw_start() is removed.

The timeout for waiting for HW ready is set to 10 seconds, matching the
original timeout value used in ish_wakeup(), to ensure reliable wakeup on
hardware that requires more time, such as the Lenovo ThinkPad X1 Titanium
Gen 1.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 39 ++++++++++++-----------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 01a139e17cb5..59355e4a61f8 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -728,22 +728,28 @@ int ish_disable_dma(struct ishtp_device *dev)
  * ish_wakeup() - wakeup ishfw from waiting-for-host state
  * @dev: ishtp device pointer
  *
- * Set the dma enable bit and send a void message to FW,
+ * Set the dma enable bit and send a IPC RESET message to FW,
  * it wil wakeup FW from waiting-for-host state.
+ *
+ * Return: 0 for success else error code.
  */
-static void ish_wakeup(struct ishtp_device *dev)
+static int ish_wakeup(struct ishtp_device *dev)
 {
+	int ret;
+
 	/* Set dma enable bit */
 	ish_reg_write(dev, IPC_REG_ISH_RMP2, IPC_RMP2_DMA_ENABLED);
 
 	/*
-	 * Send 0 IPC message so that ISH FW wakes up if it was already
+	 * Send IPC RESET message so that ISH FW wakes up if it was already
 	 * asleep.
 	 */
-	ish_reg_write(dev, IPC_REG_HOST2ISH_DRBL, IPC_DRBL_BUSY_BIT);
+	ret = ish_ipc_reset(dev);
 
 	/* Flush writes to doorbell and REMAP2 */
 	ish_reg_read(dev, IPC_REG_ISH_HOST_FWSTS);
+
+	return ret;
 }
 
 /**
@@ -792,11 +798,11 @@ static int _ish_hw_reset(struct ishtp_device *dev)
 	pci_write_config_word(pdev, pdev->pm_cap + PCI_PM_CTRL, csr);
 
 	/* Now we can enable ISH DMA operation and wakeup ISHFW */
-	ish_wakeup(dev);
-
-	return	0;
+	return ish_wakeup(dev);
 }
 
+#define RECVD_HW_READY_TIMEOUT (10 * HZ)
+
 /**
  * _ish_ipc_reset() - IPC reset
  * @dev: ishtp device pointer
@@ -831,7 +837,8 @@ static int _ish_ipc_reset(struct ishtp_device *dev)
 	}
 
 	wait_event_interruptible_timeout(dev->wait_hw_ready,
-					 dev->recvd_hw_ready, 2 * HZ);
+					 dev->recvd_hw_ready,
+					 RECVD_HW_READY_TIMEOUT);
 	if (!dev->recvd_hw_ready) {
 		dev_err(dev->devc, "Timed out waiting for HW ready\n");
 		rv = -ENODEV;
@@ -855,21 +862,7 @@ int ish_hw_start(struct ishtp_device *dev)
 	set_host_ready(dev);
 
 	/* After that we can enable ISH DMA operation and wakeup ISHFW */
-	ish_wakeup(dev);
-
-	/* wait for FW-initiated reset flow */
-	if (!dev->recvd_hw_ready)
-		wait_event_interruptible_timeout(dev->wait_hw_ready,
-						 dev->recvd_hw_ready,
-						 10 * HZ);
-
-	if (!dev->recvd_hw_ready) {
-		dev_err(dev->devc,
-			"[ishtp-ish]: Timed out waiting for FW-initiated reset\n");
-		return	-ENODEV;
-	}
-
-	return 0;
+	return ish_wakeup(dev);
 }
 
 /**
-- 
2.43.0


