Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2983A2467
	for <lists+linux-input@lfdr.de>; Thu, 10 Jun 2021 08:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhFJGYG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Jun 2021 02:24:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:10611 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229778AbhFJGYF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Jun 2021 02:24:05 -0400
IronPort-SDR: mq1UJxuc1IV2w1XkST+/nzGEmjtex+Vpyf1Gfcj3Xj/SFzvLTgAYK7PVsKripuY2kKJ9Rg+GMJ
 jVfng+ZOu4ZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="185610269"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; 
   d="scan'208";a="185610269"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 23:22:10 -0700
IronPort-SDR: uqd8o3yUzwQcQv82l5+O7O6CqraZQJ+nf8hXev/W3s5quidbY85zYrebySqcejH+0PAHCWzfx2
 965lfUz23SRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; 
   d="scan'208";a="482702912"
Received: from shsensorbuild2.sh.intel.com ([10.239.132.180])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2021 23:22:08 -0700
From:   Even Xu <even.xu@intel.com>
To:     srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, Even Xu <even.xu@intel.com>
Subject: [PATCH 3/3] hid: intel-ish-hid: ipc: Specify that EHL no cache snooping
Date:   Thu, 10 Jun 2021 14:21:54 +0800
Message-Id: <1623306114-19208-4-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623306114-19208-1-git-send-email-even.xu@intel.com>
References: <1623306114-19208-1-git-send-email-even.xu@intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Specify that EHL doesn't support DMA cache snooping.

Acked-by: Pandruvada, Srinivas <srinivas.pandruvada@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 47bbeb8..89ea2ff 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -889,6 +889,29 @@ static uint32_t ish_ipc_get_header(struct ishtp_device *dev, int length,
 	return drbl_val;
 }
 
+/**
+ * _dma_no_cache_snooping()
+ *
+ * Check on current platform, DMA supports cache snooping or not.
+ * This callback is used to notify uplayer driver if manully cache
+ * flush is needed when do DMA operation.
+ *
+ * Please pay attention to this callback implementation, if declare
+ * having cache snooping on a cache snooping not supported platform
+ * will cause uplayer driver receiving mismatched data; and if
+ * declare no cache snooping on a cache snooping supported platform
+ * will cause cache be flushed twice and performance hit.
+ *
+ * @dev: ishtp device pointer
+ *
+ * Return: false - has cache snooping capability
+ *         true - no cache snooping, need manually cache flush
+ */
+static bool _dma_no_cache_snooping(struct ishtp_device *dev)
+{
+	return dev->pdev->device == EHL_Ax_DEVICE_ID;
+}
+
 static const struct ishtp_hw_ops ish_hw_ops = {
 	.hw_reset = _ish_hw_reset,
 	.ipc_reset = _ish_ipc_reset,
@@ -897,7 +920,8 @@ static const struct ishtp_hw_ops ish_hw_ops = {
 	.write = write_ipc_to_queue,
 	.get_fw_status = _ish_read_fw_sts_reg,
 	.sync_fw_clock = _ish_sync_fw_clock,
-	.ishtp_read_hdr = _ishtp_read_hdr
+	.ishtp_read_hdr = _ishtp_read_hdr,
+	.dma_no_cache_snooping = _dma_no_cache_snooping
 };
 
 /**
-- 
2.7.4

