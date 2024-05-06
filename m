Return-Path: <linux-input+bounces-3479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F658BC576
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 03:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DF001C21023
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 01:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C2D2FB6;
	Mon,  6 May 2024 01:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMOytEP/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05AA3BBFF
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 01:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714959055; cv=none; b=UwrEA40w5pOKAvLANeAAZ++w0nLgYWVjPAZcVdmhiERUKcreqK+Dr0DHUS19aB2HhNNBIO7KQH5vhZv2mxGjQtpDiPECMXoaIyvxgMyJxUiFfUisngTQGGTm7LhCg/fHHmdaUvEcr8rE01BgPtjCV5G3w+zbWbaGiLTX5WcbOEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714959055; c=relaxed/simple;
	bh=FiM+puNJNqGWXVrLxkZrBbWhRMgcc8dtVC2049Q8vHY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F3sWX/wW4D9jVOHx//4A/7twpDqe27zbn5AzIuRhHIgd7i1DBFKOtOjQRmvf7HsQ2lIdVddp/dQciqrdopl1/Oh3vPTw9+KLPxb8Yi596/3ECJAn+SfJ8ViqDDAX5uHqfFGn4kKOEUk7OVWsII6Up2TrizCaplG6v7B6/Lz8AJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMOytEP/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714959052; x=1746495052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FiM+puNJNqGWXVrLxkZrBbWhRMgcc8dtVC2049Q8vHY=;
  b=iMOytEP/nXCY/PvYX5weHonhvnSkByqyP8Ok1vgQsIytx/c2sZcCmHRt
   RE9/hpIPI0l4Yk6w0eRgdtFUseOtK7ZUYVzi1s6wDrM5Y8mGqhLlnM1ZK
   mEg/82XAV7TGbpkdSBRh+2MdhCQJgMLjrYduBODIXhPiV/1uuumBAtZjv
   ld9G5e0kIwGFByUwXItWv2hGkXOCvGO4X6vq4bKlyOpIh8FWPCpPyNAoV
   aDoxvhx5ocRvri536ZLcGFrF/9tSlGtBvobj+GnXfLVy72bGjbxaBOVNE
   j1IUTVi6Md09/rLsAMbFlfjDRfOp+us1ElyoEaZAIDCuDv41vewH3dbRf
   g==;
X-CSE-ConnectionGUID: 31d8EabCT/qSalS6PPNe3w==
X-CSE-MsgGUID: uXSW3RcFQPiloMvwpuJ6dA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14503874"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14503874"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 18:30:52 -0700
X-CSE-ConnectionGUID: egAbinSJRRW8qYH2VyfaOg==
X-CSE-MsgGUID: ABQfRw0bQCu6nRQWpLiV6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28092929"
Received: from unknown (HELO ipg-l-lixuzha.sh.intel.com) ([10.239.153.157])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 18:30:50 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 5/5] HID: intel-ish-hid: handler multiple MNG_RESET_NOTIFY messages
Date: Mon,  6 May 2024 09:30:40 +0800
Message-Id: <20240506013040.10700-6-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506013040.10700-1-lixu.zhang@intel.com>
References: <20240506013040.10700-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enhances the firmware reset handler in the Intel Integrated
Sensor Hub (ISH) driver. Previously, the ISH firmware would send a
MNG_RESET_NOTIFY message in response to an empty IPC message from the
ish_wakeup function. With the introduction of the feature to load ISH
firmware from the host on the LunarLake platform, the ISH bootloader
now involves the IPC function. This results in an additional
MNG_RESET_NOTIFY message being sent by ISH bootloader after power on.
Consequently, the driver receives two MNG_RESET_NOTIFY messages during
system boot up. This can disrupt the dev->dev_state during the first
reset flow due to the subsequent reset notify message.

To address this, the patch modifies the fw_reset_work_fn function to skip
the execution of ishtp_reset_compl_handler during the first reset flow if
a reset is pending. The ishtp_reset_compl_handler will then be executed
during the second reset flow, ensuring the dev->dev_state is not disrupted.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index adce30f8ebff..3cd53fc80634 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -546,11 +546,11 @@ static int ish_fw_reset_handler(struct ishtp_device *dev)
 
 /**
  * fw_reset_work_fn() - FW reset worker function
- * @unused: not used
+ * @work: Work item
  *
  * Call ish_fw_reset_handler to complete FW reset
  */
-static void fw_reset_work_fn(struct work_struct *unused)
+static void fw_reset_work_fn(struct work_struct *work)
 {
 	int	rv;
 
@@ -562,7 +562,8 @@ static void fw_reset_work_fn(struct work_struct *unused)
 		wake_up_interruptible(&ishtp_dev->wait_hw_ready);
 
 		/* ISHTP notification in IPC_RESET sequence completion */
-		ishtp_reset_compl_handler(ishtp_dev);
+		if (!work_pending(work))
+			ishtp_reset_compl_handler(ishtp_dev);
 	} else
 		dev_err(ishtp_dev->devc, "[ishtp-ish]: FW reset failed (%d)\n",
 			rv);
-- 
2.34.1


