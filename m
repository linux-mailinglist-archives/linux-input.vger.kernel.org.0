Return-Path: <linux-input+bounces-15538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92163BE618E
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 04:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 137281A64B82
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6A1238D3A;
	Fri, 17 Oct 2025 02:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfSAsUhI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DD0219A7A
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 02:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667574; cv=none; b=jPweL4xP491hE43i0npJA8tpa3OkW8DOvHPiP7X2Li7xYP1/9oxm6csiHIhhq7pxPbHE0g/BTSIrcb/iiV/meMMRXSVhosgFsHzJtE5St1Mc27mZA+GymN5qt+ZApJHbuoL1giddPmgn3PPUmU0NBTYuTmr3grZKkbMs3eWHQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667574; c=relaxed/simple;
	bh=TvI3eOBia0pk78nNUZkmMAuHoZvdCmaWZl6N/155YJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCD5fcnsZPqczgSJPEd1ru7Zj0XjM1dBzxWu9QVWCnifFeLpPm+lXqQJl6FhNSognOARXU7jqGb+evZguF8ZF7JqkwPnJAqKviGgU7ZfrRFVNQmc3QCkFSaHc/lX5ex7m48Y82UydUAal5vWDxgx9DwMcCM9M91j+eUDxufWpYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfSAsUhI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667573; x=1792203573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TvI3eOBia0pk78nNUZkmMAuHoZvdCmaWZl6N/155YJk=;
  b=JfSAsUhIg3mq3MityZ2e3voPI6crjVx0clDyjCb1VLA3AJomysg68HAQ
   9sePqE/5qTWjOT+xOsHoAf8Lu2PDJccEdagCpce80zhFKhytg1Urr43iW
   X2Pkk3ptps1MkbEWXgJQaCF+eFCjgq6cGNi3wejT8QmAgaQCde6srF+z0
   qPbWSIRA12heBgRC8SZiUdV+moQbNmNmkmjpZjGcu6OwLnq7e3GX0crTQ
   BQDYFE93nNb/S2CFGjeVOnkTMZrnfqV0q3D3be5SFom0PbkQF5cJfPBns
   ifiPXno7/CfqrtxiGNFKFgMcFLiW6jYhSx9sQ7fgKbqizaGWZw00vhNqm
   g==;
X-CSE-ConnectionGUID: 4JH8JDMmRsmEG2dCg5iyIQ==
X-CSE-MsgGUID: 8haNlQwzRrSsEwk2RM4K/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66738714"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66738714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:19:33 -0700
X-CSE-ConnectionGUID: A2Pn+lZiQpSJ3/yvX76zYQ==
X-CSE-MsgGUID: b2b80r5ESb6oz7kH2eaVug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213586368"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 19:19:31 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH v2 4/6] HID: intel-ish-hid: ipc: Always schedule FW reset work on RESET_NOTIFY/ACK
Date: Fri, 17 Oct 2025 10:22:16 +0800
Message-ID: <20251017022218.1292451-5-lixu.zhang@intel.com>
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

Both ISH firmware and driver can actively send MNG_RESET_NOTIFY to initiate
an FW reset handshake. Upon receiving this, the peer should reply with
MNG_RESET_NOTIFY_ACK. Therefore, the driver should schedule the FW reset
handshake work function when receiving either MNG_RESET_NOTIFY or
MNG_RESET_NOTIFY_ACK.

Previously, driver only scheduled the work function on MNG_RESET_NOTIFY.
This patch ensures the work function is scheduled on both messages, but
only replies with MNG_RESET_NOTIFY_ACK when receiving MNG_RESET_NOTIFY.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 39 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 9958f2968c4f..01a139e17cb5 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -481,6 +481,20 @@ static int timed_wait_for_timeout(struct ishtp_device *dev, int condition,
 	return ret;
 }
 
+static void ish_send_reset_notify_ack(struct ishtp_device *dev)
+{
+	/* Read reset ID */
+	u32 reset_id = ish_reg_read(dev, IPC_REG_ISH2HOST_MSG) & 0xFFFF;
+
+	/*
+	 * Set HOST2ISH.ILUP. Apparently we need this BEFORE sending
+	 * RESET_NOTIFY_ACK - FW will be checking for it
+	 */
+	ish_set_host_rdy(dev);
+	/* Send RESET_NOTIFY_ACK (with reset_id) */
+	ipc_send_mng_msg(dev, MNG_RESET_NOTIFY_ACK, &reset_id, sizeof(u32));
+}
+
 #define TIME_SLICE_FOR_FW_RDY_MS		100
 #define TIME_SLICE_FOR_INPUT_RDY_MS		100
 #define TIMEOUT_FOR_FW_RDY_MS			2000
@@ -496,13 +510,9 @@ static int timed_wait_for_timeout(struct ishtp_device *dev, int condition,
  */
 static int ish_fw_reset_handler(struct ishtp_device *dev)
 {
-	uint32_t	reset_id;
 	unsigned long	flags;
 	int ret;
 
-	/* Read reset ID */
-	reset_id = ish_reg_read(dev, IPC_REG_ISH2HOST_MSG) & 0xFFFF;
-
 	/* Clear IPC output queue */
 	spin_lock_irqsave(&dev->wr_processing_spinlock, flags);
 	list_splice_init(&dev->wr_processing_list, &dev->wr_free_list);
@@ -521,15 +531,6 @@ static int ish_fw_reset_handler(struct ishtp_device *dev)
 	/* Send clock sync at once after reset */
 	ishtp_dev->prev_sync = 0;
 
-	/*
-	 * Set HOST2ISH.ILUP. Apparently we need this BEFORE sending
-	 * RESET_NOTIFY_ACK - FW will be checking for it
-	 */
-	ish_set_host_rdy(dev);
-	/* Send RESET_NOTIFY_ACK (with reset_id) */
-	ipc_send_mng_msg(dev, MNG_RESET_NOTIFY_ACK, &reset_id,
-			 sizeof(uint32_t));
-
 	/* Wait for ISH FW'es ILUP and ISHTP_READY */
 	ret = timed_wait_for_timeout(dev, WAIT_FOR_FW_RDY,
 				     TIME_SLICE_FOR_FW_RDY_MS,
@@ -563,8 +564,6 @@ static void fw_reset_work_fn(struct work_struct *work)
 	if (!rv) {
 		/* ISH is ILUP & ISHTP-ready. Restart ISHTP */
 		msleep_interruptible(TIMEOUT_FOR_HW_RDY_MS);
-		ishtp_dev->recvd_hw_ready = 1;
-		wake_up_interruptible(&ishtp_dev->wait_hw_ready);
 
 		/* ISHTP notification in IPC_RESET sequence completion */
 		if (!work_pending(work))
@@ -625,15 +624,14 @@ static void	recv_ipc(struct ishtp_device *dev, uint32_t doorbell_val)
 		break;
 
 	case MNG_RESET_NOTIFY:
-		if (!ishtp_dev) {
-			ishtp_dev = dev;
-		}
-		queue_work(dev->unbound_wq, &fw_reset_work);
-		break;
+		ish_send_reset_notify_ack(ishtp_dev);
+		fallthrough;
 
 	case MNG_RESET_NOTIFY_ACK:
 		dev->recvd_hw_ready = 1;
 		wake_up_interruptible(&dev->wait_hw_ready);
+		if (!work_pending(&fw_reset_work))
+			queue_work(dev->unbound_wq, &fw_reset_work);
 		break;
 	}
 }
@@ -1001,6 +999,7 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 		list_add_tail(&tx_buf->link, &dev->wr_free_list);
 	}
 
+	ishtp_dev = dev;
 	ret = devm_work_autocancel(&pdev->dev, &fw_reset_work, fw_reset_work_fn);
 	if (ret) {
 		dev_err(dev->devc, "Failed to initialise FW reset work\n");
-- 
2.43.0


