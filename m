Return-Path: <linux-input+bounces-487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E091580444B
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 02:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D8071C20A87
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 01:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A5F1C15;
	Tue,  5 Dec 2023 01:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXDcNN46"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232AEB4
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 17:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701741086; x=1733277086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Yz7zyOi/1m/oQ7AJrNBOhiEOJmOuLzeuWecOqZ96z18=;
  b=CXDcNN46MxtCsfDATpsaEe7tR8FkzyPcESxAcBG5A1VFVEuXhaYMxqeG
   HXJRP2+IyICQTanjgFup/LbB2Dzudh0bp7dx3TB3B56qVVzz0yU0nFbbI
   m29WDS3MSwIxi6MP1qkdl11c8u4zpOQlpmSGXbEGrOo5jQwYzZ8vZA6RB
   Og3jPc8SeO5Es+MeOet5tDAW0gcYni2ai3QfsrBprY8HNPxPV2KNOy7lv
   z1APWmNG0Bt9nTKt3/aaWxclTfQ0H5rEkGmFtZxPwBPjIfpYx/BeHZoLr
   4kRbFFXs8zIr3yVLUJzpGoIUesYzg4N29hmZk9DRA4RfRvxelyLZ7JReI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12538572"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="12538572"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 17:51:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747041614"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="747041614"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2023 17:51:23 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	srinivas.pandruvada@linux.intel.com,
	bleung@chromium.org,
	tzungbi@kernel.org,
	groeck@chromium.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Even Xu <even.xu@intel.com>
Subject: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper functions for connection
Date: Tue,  5 Dec 2023 09:50:33 +0800
Message-Id: <1701741033-26222-5-git-send-email-even.xu@intel.com>
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
 drivers/platform/chrome/cros_ec_ishtp.c | 74 +++++++--------------------------
 1 file changed, 15 insertions(+), 59 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index cb2031c..5ac37bd 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -367,55 +367,33 @@ static void ish_event_cb(struct ishtp_cl_device *cl_device)
 /**
  * cros_ish_init() - Init function for ISHTP client
  * @cros_ish_cl: ISHTP client instance
+ * @reset: true if called from reset handler
  *
  * This function complete the initializtion of the client.
  *
  * Return: 0 for success, negative error code for failure.
  */
-static int cros_ish_init(struct ishtp_cl *cros_ish_cl)
+static int cros_ish_init(struct ishtp_cl *cros_ish_cl, bool reset)
 {
 	int rv;
-	struct ishtp_device *dev;
-	struct ishtp_fw_client *fw_client;
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
 
-	rv = ishtp_cl_link(cros_ish_cl);
-	if (rv) {
-		dev_err(cl_data_to_dev(client_data),
-			"ishtp_cl_link failed\n");
-		return rv;
-	}
-
-	dev = ishtp_get_ishtp_device(cros_ish_cl);
-
-	/* Connect to firmware client */
-	ishtp_set_tx_ring_size(cros_ish_cl, CROS_ISH_CL_TX_RING_SIZE);
-	ishtp_set_rx_ring_size(cros_ish_cl, CROS_ISH_CL_RX_RING_SIZE);
-
-	fw_client = ishtp_fw_cl_get_client(dev, &cros_ec_ishtp_id_table[0].guid);
-	if (!fw_client) {
-		dev_err(cl_data_to_dev(client_data),
-			"ish client uuid not found\n");
-		rv = -ENOENT;
-		goto err_cl_unlink;
-	}
-
-	ishtp_cl_set_fw_client_id(cros_ish_cl,
-				  ishtp_get_fw_client_id(fw_client));
-	ishtp_set_connection_state(cros_ish_cl, ISHTP_CL_CONNECTING);
-
-	rv = ishtp_cl_connect(cros_ish_cl);
+	rv = ishtp_cl_establish_connection(cros_ish_cl,
+					   &cros_ec_ishtp_id_table[0].guid,
+					   CROS_ISH_CL_TX_RING_SIZE,
+					   CROS_ISH_CL_RX_RING_SIZE,
+					   reset);
 	if (rv) {
 		dev_err(cl_data_to_dev(client_data),
 			"client connect fail\n");
-		goto err_cl_unlink;
+		goto err_cl_disconnect;
 	}
 
 	ishtp_register_event_cb(client_data->cl_device, ish_event_cb);
 	return 0;
 
-err_cl_unlink:
-	ishtp_cl_unlink(cros_ish_cl);
+err_cl_disconnect:
+	ishtp_cl_destroy_connection(cros_ish_cl, reset);
 	return rv;
 }
 
@@ -427,10 +405,7 @@ static int cros_ish_init(struct ishtp_cl *cros_ish_cl)
  */
 static void cros_ish_deinit(struct ishtp_cl *cros_ish_cl)
 {
-	ishtp_set_connection_state(cros_ish_cl, ISHTP_CL_DISCONNECTING);
-	ishtp_cl_disconnect(cros_ish_cl);
-	ishtp_cl_unlink(cros_ish_cl);
-	ishtp_cl_flush_queues(cros_ish_cl);
+	ishtp_cl_destroy_connection(cros_ish_cl, false);
 
 	/* Disband and free all Tx and Rx client-level rings */
 	ishtp_cl_free(cros_ish_cl);
@@ -592,7 +567,6 @@ static void reset_handler(struct work_struct *work)
 	int rv;
 	struct device *dev;
 	struct ishtp_cl *cros_ish_cl;
-	struct ishtp_cl_device *cl_device;
 	struct ishtp_cl_data *client_data =
 		container_of(work, struct ishtp_cl_data, work_ishtp_reset);
 
@@ -600,26 +574,11 @@ static void reset_handler(struct work_struct *work)
 	down_write(&init_lock);
 
 	cros_ish_cl = client_data->cros_ish_cl;
-	cl_device = client_data->cl_device;
 
-	/* Unlink, flush queues & start again */
-	ishtp_cl_unlink(cros_ish_cl);
-	ishtp_cl_flush_queues(cros_ish_cl);
-	ishtp_cl_free(cros_ish_cl);
-
-	cros_ish_cl = ishtp_cl_allocate(cl_device);
-	if (!cros_ish_cl) {
-		up_write(&init_lock);
-		return;
-	}
-
-	ishtp_set_drvdata(cl_device, cros_ish_cl);
-	ishtp_set_client_data(cros_ish_cl, client_data);
-	client_data->cros_ish_cl = cros_ish_cl;
+	ishtp_cl_destroy_connection(cros_ish_cl, true);
 
-	rv = cros_ish_init(cros_ish_cl);
+	rv = cros_ish_init(cros_ish_cl, true);
 	if (rv) {
-		ishtp_cl_free(cros_ish_cl);
 		dev_err(cl_data_to_dev(client_data), "Reset Failed\n");
 		up_write(&init_lock);
 		return;
@@ -672,7 +631,7 @@ static int cros_ec_ishtp_probe(struct ishtp_cl_device *cl_device)
 	INIT_WORK(&client_data->work_ec_evt,
 		  ish_evt_handler);
 
-	rv = cros_ish_init(cros_ish_cl);
+	rv = cros_ish_init(cros_ish_cl, false);
 	if (rv)
 		goto end_ishtp_cl_init_error;
 
@@ -690,10 +649,7 @@ static int cros_ec_ishtp_probe(struct ishtp_cl_device *cl_device)
 	return 0;
 
 end_cros_ec_dev_init_error:
-	ishtp_set_connection_state(cros_ish_cl, ISHTP_CL_DISCONNECTING);
-	ishtp_cl_disconnect(cros_ish_cl);
-	ishtp_cl_unlink(cros_ish_cl);
-	ishtp_cl_flush_queues(cros_ish_cl);
+	ishtp_cl_destroy_connection(cros_ish_cl, false);
 	ishtp_put_device(cl_device);
 end_ishtp_cl_init_error:
 	ishtp_cl_free(cros_ish_cl);
-- 
2.7.4


