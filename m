Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97513A2465
	for <lists+linux-input@lfdr.de>; Thu, 10 Jun 2021 08:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhFJGYD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Jun 2021 02:24:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:10603 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229911AbhFJGYC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Jun 2021 02:24:02 -0400
IronPort-SDR: wTKdSUwOucPBMQIZV6Gtm3bXPn3MfI6LA7QO2GgdlVYpON322uVWf3f86bqqFGBq5ZnbRzO5a9
 g9GYjPEA2iig==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="185610256"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; 
   d="scan'208";a="185610256"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 23:22:05 -0700
IronPort-SDR: XU6TCadIPGuNbVpJ6ae5zFbcYlDx2+qpS68heo9Ryle7BTaap6ODtyWF/oh3/74+GvCxA3BFBZ
 gXmJeeir8BJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; 
   d="scan'208";a="482702891"
Received: from shsensorbuild2.sh.intel.com ([10.239.132.180])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2021 23:22:03 -0700
From:   Even Xu <even.xu@intel.com>
To:     srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, Even Xu <even.xu@intel.com>
Subject: [PATCH 2/3] hid: intel-ish-hid: ishtp: Add dma_no_cache_snooping() callback
Date:   Thu, 10 Jun 2021 14:21:53 +0800
Message-Id: <1623306114-19208-3-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623306114-19208-1-git-send-email-even.xu@intel.com>
References: <1623306114-19208-1-git-send-email-even.xu@intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Different platforms have different DMA capability, on most of
platforms, DMA support cache snooping. But few platforms,
such as ElkhartLake (EHL), don't support cache snooping
which requires cache flush from driver.

So add a hardware level callback to let ishtp driver know if cache
flush is needed.

As most of platform support cache snooping, so driver will not
do cache flush by default, until platform implements this callback
and return true explicitly.

Acked-by: Pandruvada, Srinivas <srinivas.pandruvada@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/client.c    | 18 ++++++++++++++++++
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp/client.c b/drivers/hid/intel-ish-hid/ishtp/client.c
index 1cc1571..be443d6 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client.c
@@ -10,6 +10,7 @@
 #include <linux/wait.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
+#include <asm/cacheflush.h>
 #include "hbm.h"
 #include "client.h"
 
@@ -773,6 +774,14 @@ static void ishtp_cl_send_msg_dma(struct ishtp_device *dev,
 	/* write msg to dma buf */
 	memcpy(msg_addr, cl_msg->send_buf.data, cl_msg->send_buf.size);
 
+	/*
+	 * if current fw don't support cache snooping, driver have to
+	 * flush the cache manually.
+	 */
+	if (dev->ops->dma_no_cache_snooping &&
+		dev->ops->dma_no_cache_snooping(dev))
+		clflush_cache_range(msg_addr, cl_msg->send_buf.size);
+
 	/* send dma_xfer hbm msg */
 	off = msg_addr - (unsigned char *)dev->ishtp_host_dma_tx_buf;
 	ishtp_hbm_hdr(&hdr, sizeof(struct dma_xfer_hbm));
@@ -997,6 +1006,15 @@ void recv_ishtp_cl_msg_dma(struct ishtp_device *dev, void *msg,
 		}
 
 		buffer = rb->buffer.data;
+
+		/*
+		 * if current fw don't support cache snooping, driver have to
+		 * flush the cache manually.
+		 */
+		if (dev->ops->dma_no_cache_snooping &&
+			dev->ops->dma_no_cache_snooping(dev))
+			clflush_cache_range(msg, hbm->msg_length);
+
 		memcpy(buffer, msg, hbm->msg_length);
 		rb->buf_idx = hbm->msg_length;
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index 1cc6364..e443dc9 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -118,6 +118,7 @@ struct ishtp_hw_ops {
 			unsigned long buffer_length);
 	uint32_t	(*get_fw_status)(struct ishtp_device *dev);
 	void	(*sync_fw_clock)(struct ishtp_device *dev);
+	bool	(*dma_no_cache_snooping)(struct ishtp_device *dev);
 };
 
 /**
-- 
2.7.4

