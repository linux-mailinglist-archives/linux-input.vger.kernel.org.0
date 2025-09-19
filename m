Return-Path: <linux-input+bounces-14881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1999B87902
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 03:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A88A1644DE
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 01:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6B51C860F;
	Fri, 19 Sep 2025 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQDTZRfz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101BA1A4E70
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758243786; cv=none; b=Xq4By1w6tUwnQpiqqDPp31wsvUQfj//Ij3Tno+Ayo+Fp6vdYhpITmRI7WJ7JzYtYiFv1ZWMWmDmDm9Rl2eO/i8QlRA+iq/0ejDxlZp7+ciLiuQDdcyJ9qRIolOGOEOQjM/LERXQW91EXoV5biN3iEwEvpibzz208A/BqfdilS9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758243786; c=relaxed/simple;
	bh=IRRpd7vyVjgHEx+3OQHYiUS1SrWetYUx6bp6m6StQ4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Di4mN4CUd4VfD7lYrvUd0j3thJfBncHk7J0Mf6v/VrDnGrrLLWGYJNtT3qUt3xG+QE+2S3HVf+FlnBpmIrQg0ovxrOuoMu+NdXVuU1n5INxKNPH6iFde0JW24VP9EdJJYPUx2CmqlMeHkCow/FgBden+YTqa0gIYI9qSmmFJIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQDTZRfz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758243785; x=1789779785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IRRpd7vyVjgHEx+3OQHYiUS1SrWetYUx6bp6m6StQ4U=;
  b=NQDTZRfzAqaBlHKM1V8KgOKeJa/PupgIn12XZ4AraKUf7V48lOTFu1r8
   Pk5uGHZ31TcoPmG10t5w9TcfX92J6YzXxV7UdCnX0KKYfw7izapaEgqi3
   zKWR1otI9Xwkz7WnrlyoqOs6TMgcL/JeSMpRNpIx1l/eRqdbYH7+2xxDW
   0gbU5Pw+gOlQuF8vRRB94mEGo3RwMGutAteddNaXkNB0KMLTw2QlsKSo+
   hL2ZOH9P1kgUzVmY1BwX8zW57/6L7bzHfglB+LYsDGzwENbRr0pbu9wwX
   kVz80CYMe5VBy/uOJrA67DFP/HAVokOVlk1k+bQTmlBU8eqqID9/zhVEE
   Q==;
X-CSE-ConnectionGUID: eU9S/4bHSOW7lsbnMDB23g==
X-CSE-MsgGUID: Xm6t7aWmScis6wsTEvzi0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60535428"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60535428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:03:05 -0700
X-CSE-ConnectionGUID: /Jc2un2GTLeefC5uLGSVqw==
X-CSE-MsgGUID: LUUuonWjQyeJ2j9j/+QoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="180815170"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 18:03:04 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 4/6] HID: intel-ish-hid: ipc: Always schedule FW reset work on RESET_NOTIFY/ACK
Date: Fri, 19 Sep 2025 09:05:57 +0800
Message-ID: <20250919010559.165076-5-lixu.zhang@intel.com>
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
index 3ddaa2cd39d5..740566146f29 100644
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
-		schedule_work(&fw_reset_work);
-		break;
+		ish_send_reset_notify_ack(ishtp_dev);
+		fallthrough;
 
 	case MNG_RESET_NOTIFY_ACK:
 		dev->recvd_hw_ready = 1;
 		wake_up_interruptible(&dev->wait_hw_ready);
+		if (!work_pending(&fw_reset_work))
+			schedule_work(&fw_reset_work);
 		break;
 	}
 }
@@ -982,6 +980,7 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 		list_add_tail(&tx_buf->link, &dev->wr_free_list);
 	}
 
+	ishtp_dev = dev;
 	ret = devm_work_autocancel(&pdev->dev, &fw_reset_work, fw_reset_work_fn);
 	if (ret) {
 		dev_err(dev->devc, "Failed to initialise FW reset work\n");
-- 
2.43.0


