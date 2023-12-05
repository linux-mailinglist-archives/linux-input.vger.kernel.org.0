Return-Path: <linux-input+bounces-485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DC804449
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 02:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B79511C20AC2
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 01:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DBA1870;
	Tue,  5 Dec 2023 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceEOIhtM"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17101B4
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 17:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701741071; x=1733277071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0/x9VUM85hre8h0sWYHVTpQMKRokf5WJjEgUvHHyKDY=;
  b=ceEOIhtMa3Dm70zxz8pk5ZHZytyOjQt2mAQqCfSrFBdv117jqiyeXUnn
   P/Lk7guGA5i/HKoZQ/QLL9T8pSwmWWTC6YazMsmMNznG0C3K8yZI3MSXm
   bPFFUfyrWXZWDTNWo5XT5JeQjdQSCDSBolfLIginMVnqZfTM+PjM3suuB
   Y1mqpCSsnoor6s636e0XMGshWULxZ18LJSPBMBijFFChWAQz9NRswHPM7
   3F7IssbQgxnecwxJTEmdtXn3rSNhcdC4OSYmnhi8Guuoty8atLmHKkqfi
   xkI9R0yG2Yjuel47hoOHxQwoKCPMmZ40DakuaeAB0RvEw5a346H8QIKLL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12538549"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="12538549"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 17:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747041519"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="747041519"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2023 17:51:02 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	srinivas.pandruvada@linux.intel.com,
	bleung@chromium.org,
	tzungbi@kernel.org,
	groeck@chromium.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Even Xu <even.xu@intel.com>
Subject: [PATCH 2/4] HID: intel-ish-hid: ishtp-hid-client: use helper functions for connection
Date: Tue,  5 Dec 2023 09:50:31 +0800
Message-Id: <1701741033-26222-3-git-send-email-even.xu@intel.com>
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
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 63 ++++++----------------------
 1 file changed, 13 insertions(+), 50 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index e3d70c5..fbd4f8e 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -639,47 +639,26 @@ static int ishtp_get_report_descriptor(struct ishtp_cl *hid_ishtp_cl,
  *
  * Return: 0 on success, non zero on error
  */
-static int hid_ishtp_cl_init(struct ishtp_cl *hid_ishtp_cl, int reset)
+static int hid_ishtp_cl_init(struct ishtp_cl *hid_ishtp_cl, bool reset)
 {
-	struct ishtp_device *dev;
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(hid_ishtp_cl);
-	struct ishtp_fw_client *fw_client;
 	int i;
 	int rv;
 
 	dev_dbg(cl_data_to_dev(client_data), "%s\n", __func__);
 	hid_ishtp_trace(client_data,  "%s reset flag: %d\n", __func__, reset);
 
-	rv = ishtp_cl_link(hid_ishtp_cl);
-	if (rv) {
-		dev_err(cl_data_to_dev(client_data),
-			"ishtp_cl_link failed\n");
-		return	-ENOMEM;
-	}
-
 	client_data->init_done = 0;
 
-	dev = ishtp_get_ishtp_device(hid_ishtp_cl);
-
-	/* Connect to FW client */
-	ishtp_set_tx_ring_size(hid_ishtp_cl, HID_CL_TX_RING_SIZE);
-	ishtp_set_rx_ring_size(hid_ishtp_cl, HID_CL_RX_RING_SIZE);
-
-	fw_client = ishtp_fw_cl_get_client(dev, &hid_ishtp_id_table[0].guid);
-	if (!fw_client) {
-		dev_err(cl_data_to_dev(client_data),
-			"ish client uuid not found\n");
-		return -ENOENT;
-	}
-	ishtp_cl_set_fw_client_id(hid_ishtp_cl,
-				  ishtp_get_fw_client_id(fw_client));
-	ishtp_set_connection_state(hid_ishtp_cl, ISHTP_CL_CONNECTING);
-
-	rv = ishtp_cl_connect(hid_ishtp_cl);
+	rv = ishtp_cl_establish_connection(hid_ishtp_cl,
+					   &hid_ishtp_id_table[0].guid,
+					   HID_CL_TX_RING_SIZE,
+					   HID_CL_RX_RING_SIZE,
+					   reset);
 	if (rv) {
 		dev_err(cl_data_to_dev(client_data),
 			"client connect fail\n");
-		goto err_cl_unlink;
+		goto err_cl_disconnect;
 	}
 
 	hid_ishtp_trace(client_data,  "%s client connected\n", __func__);
@@ -723,10 +702,7 @@ static int hid_ishtp_cl_init(struct ishtp_cl *hid_ishtp_cl, int reset)
 	return 0;
 
 err_cl_disconnect:
-	ishtp_set_connection_state(hid_ishtp_cl, ISHTP_CL_DISCONNECTING);
-	ishtp_cl_disconnect(hid_ishtp_cl);
-err_cl_unlink:
-	ishtp_cl_unlink(hid_ishtp_cl);
+	ishtp_cl_destroy_connection(hid_ishtp_cl, reset);
 	return rv;
 }
 
@@ -738,8 +714,7 @@ static int hid_ishtp_cl_init(struct ishtp_cl *hid_ishtp_cl, int reset)
  */
 static void hid_ishtp_cl_deinit(struct ishtp_cl *hid_ishtp_cl)
 {
-	ishtp_cl_unlink(hid_ishtp_cl);
-	ishtp_cl_flush_queues(hid_ishtp_cl);
+	ishtp_cl_destroy_connection(hid_ishtp_cl, false);
 
 	/* disband and free all Tx and Rx client-level rings */
 	ishtp_cl_free(hid_ishtp_cl);
@@ -749,33 +724,23 @@ static void hid_ishtp_cl_reset_handler(struct work_struct *work)
 {
 	struct ishtp_cl_data *client_data;
 	struct ishtp_cl *hid_ishtp_cl;
-	struct ishtp_cl_device *cl_device;
 	int retry;
 	int rv;
 
 	client_data = container_of(work, struct ishtp_cl_data, work);
 
 	hid_ishtp_cl = client_data->hid_ishtp_cl;
-	cl_device = client_data->cl_device;
 
 	hid_ishtp_trace(client_data, "%s hid_ishtp_cl %p\n", __func__,
 			hid_ishtp_cl);
 	dev_dbg(ishtp_device(client_data->cl_device), "%s\n", __func__);
 
-	hid_ishtp_cl_deinit(hid_ishtp_cl);
-
-	hid_ishtp_cl = ishtp_cl_allocate(cl_device);
-	if (!hid_ishtp_cl)
-		return;
-
-	ishtp_set_drvdata(cl_device, hid_ishtp_cl);
-	ishtp_set_client_data(hid_ishtp_cl, client_data);
-	client_data->hid_ishtp_cl = hid_ishtp_cl;
+	ishtp_cl_destroy_connection(hid_ishtp_cl, true);
 
 	client_data->num_hid_devices = 0;
 
 	for (retry = 0; retry < 3; ++retry) {
-		rv = hid_ishtp_cl_init(hid_ishtp_cl, 1);
+		rv = hid_ishtp_cl_init(hid_ishtp_cl, true);
 		if (!rv)
 			break;
 		dev_err(cl_data_to_dev(client_data), "Retry reset init\n");
@@ -841,7 +806,7 @@ static int hid_ishtp_cl_probe(struct ishtp_cl_device *cl_device)
 
 	ishtp_hid_print_trace = ishtp_trace_callback(cl_device);
 
-	rv = hid_ishtp_cl_init(hid_ishtp_cl, 0);
+	rv = hid_ishtp_cl_init(hid_ishtp_cl, false);
 	if (rv) {
 		ishtp_cl_free(hid_ishtp_cl);
 		return rv;
@@ -868,11 +833,9 @@ static void hid_ishtp_cl_remove(struct ishtp_cl_device *cl_device)
 			hid_ishtp_cl);
 
 	dev_dbg(ishtp_device(cl_device), "%s\n", __func__);
-	ishtp_set_connection_state(hid_ishtp_cl, ISHTP_CL_DISCONNECTING);
-	ishtp_cl_disconnect(hid_ishtp_cl);
+	hid_ishtp_cl_deinit(hid_ishtp_cl);
 	ishtp_put_device(cl_device);
 	ishtp_hid_remove(client_data);
-	hid_ishtp_cl_deinit(hid_ishtp_cl);
 
 	hid_ishtp_cl = NULL;
 
-- 
2.7.4


