Return-Path: <linux-input+bounces-486-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C880444A
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 02:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A9D3281338
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 01:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A4617F1;
	Tue,  5 Dec 2023 01:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auDJoZ+B"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9D0109
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 17:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701741074; x=1733277074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jGLZARlbsv2XRBrw5ou1w2Rt32iIgd2CzYo/8wCzUZs=;
  b=auDJoZ+B27gIHsaartZM5OXrTKGRNFi1p5KOa0wGRtoHDXYklIGCAv0z
   IUqZPCUppIW2BskBwnoZx1eLlLul4BDzMknJQjw3rLD4tPVQSDM00u40m
   XX6c7Dk3YJzbPDarRaDlysSp3qQlfUkJIkQIhg3WxeTPrlLHr3R1YHAGZ
   KuZcvL9w5QPadgGyks7kJQWBKrHMlHIcplvl8rUrwJmKFgddGiVid214h
   V0O6ZcZXJEFBA2nOArHJlWFYuqalxkZVLwQ9GkpTf1Z4T6CGG3ZAR6pqa
   y2hqM5KG6pmPHc5K/QTQawIPSA3EXrrvQOmnSHx+ZyXjPb4qykP6U7wSw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12538564"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="12538564"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 17:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747041587"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="747041587"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2023 17:51:12 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	srinivas.pandruvada@linux.intel.com,
	bleung@chromium.org,
	tzungbi@kernel.org,
	groeck@chromium.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Even Xu <even.xu@intel.com>
Subject: [PATCH 3/4] HID: intel-ish-hid: ishtp-fw-loader: use helper functions for connection
Date: Tue,  5 Dec 2023 09:50:32 +0800
Message-Id: <1701741033-26222-4-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701741033-26222-1-git-send-email-even.xu@intel.com>
References: <1701741033-26222-1-git-send-email-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

Use helper functions ishtp_cl_establish_connection() and
ishtp_cl_destroy_connection() to establish and destroy connection
respectively. These functions are used during initialization, reset and
deinitialization flows.

No functional changes are expected.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 60 ++++++-----------------------
 1 file changed, 12 insertions(+), 48 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index 16aa030..e157863 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -840,43 +840,22 @@ static void load_fw_from_host_handler(struct work_struct *work)
  *
  * Return: 0 for success, negative error code for failure
  */
-static int loader_init(struct ishtp_cl *loader_ishtp_cl, int reset)
+static int loader_init(struct ishtp_cl *loader_ishtp_cl, bool reset)
 {
 	int rv;
-	struct ishtp_fw_client *fw_client;
 	struct ishtp_cl_data *client_data =
 		ishtp_get_client_data(loader_ishtp_cl);
 
 	dev_dbg(cl_data_to_dev(client_data), "reset flag: %d\n", reset);
 
-	rv = ishtp_cl_link(loader_ishtp_cl);
-	if (rv < 0) {
-		dev_err(cl_data_to_dev(client_data), "ishtp_cl_link failed\n");
-		return rv;
-	}
-
-	/* Connect to firmware client */
-	ishtp_set_tx_ring_size(loader_ishtp_cl, LOADER_CL_TX_RING_SIZE);
-	ishtp_set_rx_ring_size(loader_ishtp_cl, LOADER_CL_RX_RING_SIZE);
-
-	fw_client =
-		ishtp_fw_cl_get_client(ishtp_get_ishtp_device(loader_ishtp_cl),
-				       &loader_ishtp_id_table[0].guid);
-	if (!fw_client) {
-		dev_err(cl_data_to_dev(client_data),
-			"ISH client uuid not found\n");
-		rv = -ENOENT;
-		goto err_cl_unlink;
-	}
-
-	ishtp_cl_set_fw_client_id(loader_ishtp_cl,
-				  ishtp_get_fw_client_id(fw_client));
-	ishtp_set_connection_state(loader_ishtp_cl, ISHTP_CL_CONNECTING);
-
-	rv = ishtp_cl_connect(loader_ishtp_cl);
+	rv = ishtp_cl_establish_connection(loader_ishtp_cl,
+					   &loader_ishtp_id_table[0].guid,
+					   LOADER_CL_TX_RING_SIZE,
+					   LOADER_CL_RX_RING_SIZE,
+					   reset);
 	if (rv < 0) {
 		dev_err(cl_data_to_dev(client_data), "Client connect fail\n");
-		goto err_cl_unlink;
+		goto err_cl_disconnect;
 	}
 
 	dev_dbg(cl_data_to_dev(client_data), "Client connected\n");
@@ -885,17 +864,14 @@ static int loader_init(struct ishtp_cl *loader_ishtp_cl, int reset)
 
 	return 0;
 
-err_cl_unlink:
-	ishtp_cl_unlink(loader_ishtp_cl);
+err_cl_disconnect:
+	ishtp_cl_destroy_connection(loader_ishtp_cl, reset);
 	return rv;
 }
 
 static void loader_deinit(struct ishtp_cl *loader_ishtp_cl)
 {
-	ishtp_set_connection_state(loader_ishtp_cl, ISHTP_CL_DISCONNECTING);
-	ishtp_cl_disconnect(loader_ishtp_cl);
-	ishtp_cl_unlink(loader_ishtp_cl);
-	ishtp_cl_flush_queues(loader_ishtp_cl);
+	ishtp_cl_destroy_connection(loader_ishtp_cl, false);
 
 	/* Disband and free all Tx and Rx client-level rings */
 	ishtp_cl_free(loader_ishtp_cl);
@@ -914,19 +890,7 @@ static void reset_handler(struct work_struct *work)
 	loader_ishtp_cl = client_data->loader_ishtp_cl;
 	cl_device = client_data->cl_device;
 
-	/* Unlink, flush queues & start again */
-	ishtp_cl_unlink(loader_ishtp_cl);
-	ishtp_cl_flush_queues(loader_ishtp_cl);
-	ishtp_cl_free(loader_ishtp_cl);
-
-	loader_ishtp_cl = ishtp_cl_allocate(cl_device);
-	if (!loader_ishtp_cl)
-		return;
-
-	ishtp_set_drvdata(cl_device, loader_ishtp_cl);
-	ishtp_set_client_data(loader_ishtp_cl, client_data);
-	client_data->loader_ishtp_cl = loader_ishtp_cl;
-	client_data->cl_device = cl_device;
+	ishtp_cl_destroy_connection(loader_ishtp_cl, true);
 
 	rv = loader_init(loader_ishtp_cl, 1);
 	if (rv < 0) {
@@ -974,7 +938,7 @@ static int loader_ishtp_cl_probe(struct ishtp_cl_device *cl_device)
 	INIT_WORK(&client_data->work_fw_load,
 		  load_fw_from_host_handler);
 
-	rv = loader_init(loader_ishtp_cl, 0);
+	rv = loader_init(loader_ishtp_cl, false);
 	if (rv < 0) {
 		ishtp_cl_free(loader_ishtp_cl);
 		return rv;
-- 
2.7.4


