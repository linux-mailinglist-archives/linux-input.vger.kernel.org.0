Return-Path: <linux-input+bounces-14882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE59AB87905
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 03:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799AB1CC16D4
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 01:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951CE34BA28;
	Fri, 19 Sep 2025 01:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kw56fP+I"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8D1DF26B
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758243788; cv=none; b=YYHzkKxvoVe1Gh6oY6Vf+dEeBJbBO+BCous2Uc8kTttIRJEMCbi2fxR96yxqVsSuav6ORGfmZInsBk8WGUNOLLibOxqpZLL3VQ2nhxXykM1gvaGoGX9zYrJO174kF1pOBJztLVujAxCTO7+OJhy2uieciBrCwLtS2RNRoDXikxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758243788; c=relaxed/simple;
	bh=lIy5F0lZQLLq/0aYz1Rx9y6t32NtK1iZVx2Im1k3n9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOarSMVJAQv5QEvVbG5B7joW+HzfjwsEQ1kVvEnncuTSIMpOxwOFvhWucbjWb/ToAKLWAhW3IVq0lhVxkUHB1mNYQNJh29M22ZfxLYbONnJacOx9c3wIOVEehD8OMTBRVE8E6J3K9U3dkwdRj0+u7qUmIesBDfNcpfb0H2cAq0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kw56fP+I; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758243787; x=1789779787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lIy5F0lZQLLq/0aYz1Rx9y6t32NtK1iZVx2Im1k3n9w=;
  b=Kw56fP+IS2JUw41XvBM5828kUWzIaJZ42XlJGZzKUFU8HjpmlaXoOOLw
   ChkE39Fsw/xJplLRqpTsXzEjEtd35uaWc6NcXRBd0eBYDZyhOpH7JnCDy
   c6BRJY0EWmPmhHaGPCLzfp404x/fAaO5fIIokUGTi6280qdJNFfXkr4HC
   uq+LDSTuTs4qz4mKWaFHx4pCwYnGGBke1eN6Al/QxA1RMFmJuuw8kQGET
   MaQsO1ceKRCS2TdMQwR+M3F68AnJf3WXtY6tphSTKjcZMKlMgPMrhfoH8
   XzZ2H7YhOZnoi0gjZY1vv5fd7ovBLwPjrFcyBBygD9vW9k1FPirYowgPK
   A==;
X-CSE-ConnectionGUID: BAQ1Nh1WR9m3tz9A6xh3Ig==
X-CSE-MsgGUID: fmrb2FnKQxuG5+NhjWkhSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60535441"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60535441"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:03:07 -0700
X-CSE-ConnectionGUID: sgPKaYkmRXaPQhHibPNY+A==
X-CSE-MsgGUID: CYYk3/+3RhmzF10MDgPJWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="180815175"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 18:03:06 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 5/6] HID: intel-ish-hid: Use IPC RESET instead of void message in ish_wakeup()
Date: Fri, 19 Sep 2025 09:05:58 +0800
Message-ID: <20250919010559.165076-6-lixu.zhang@intel.com>
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

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 34 ++++++++++-------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 740566146f29..b5cd17994df4 100644
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
@@ -792,9 +798,7 @@ static int _ish_hw_reset(struct ishtp_device *dev)
 	pci_write_config_word(pdev, pdev->pm_cap + PCI_PM_CTRL, csr);
 
 	/* Now we can enable ISH DMA operation and wakeup ISHFW */
-	ish_wakeup(dev);
-
-	return	0;
+	return ish_wakeup(dev);
 }
 
 /**
@@ -855,21 +859,7 @@ int ish_hw_start(struct ishtp_device *dev)
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


