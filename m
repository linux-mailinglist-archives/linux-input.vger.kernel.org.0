Return-Path: <linux-input+bounces-484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D963B804446
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 02:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086B71C20BAB
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 01:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7395C20E8;
	Tue,  5 Dec 2023 01:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwN3lMDt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257ABE6
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 17:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701741055; x=1733277055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=74+cxpGkP2u3JXxMgsOX+dkAN8VHdtpjOELt7RkZXeY=;
  b=FwN3lMDtDaasX+UJtUoWaKhSyQIg4TP78sJcaDdJRfWF4KfsUVMkdH+c
   t467yMSVckClqMVdG4ce1fJJuCyk0JyphS2YCQFxT0TL9SsqYSh4OR+SD
   0xvv5GRRxJbcKr27v859z+ltBP05rwByNVSRwKdxk3f/AgL78Bu0gZapd
   324RW7BfEOxjaahpNQOLMGcC0OmzC4ueVGSIhHglttZ10sQL3NqQCEV34
   kFA7Avf28/aht7BOL0mujAUVSbBCtv4L+y+t9zfoQbdZtov95AzuE9XXC
   Z4Ac8U0VTm5myhsp9zdVcH0BYj3f7dTur6MXVPl01MQuQN/lOv4FLE6Eb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12538521"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="12538521"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 17:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747041484"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="747041484"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2023 17:50:52 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	srinivas.pandruvada@linux.intel.com,
	bleung@chromium.org,
	tzungbi@kernel.org,
	groeck@chromium.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Even Xu <even.xu@intel.com>
Subject: [PATCH 1/4] HID: Intel-ish-hid: Ishtp: Add helper functions for client connection
Date: Tue,  5 Dec 2023 09:50:30 +0800
Message-Id: <1701741033-26222-2-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701741033-26222-1-git-send-email-even.xu@intel.com>
References: <1701741033-26222-1-git-send-email-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

For every ishtp client driver during initialization state, the flow is:
1 - Allocate an ISHTP client instance
2 - Reserve a host id and link the client instance
3 - Search a firmware client using UUID and get related
    client information
4 - Bind firmware client id to the ISHTP client instance
5 - Set the state the ISHTP client instance to CONNECTING
6 - Send connect request to firmware
7 - Register event callback for messages from the firmware

During deinitizalization state, the flow is:
9 - Set the state the ISHTP client instance to ISHTP_CL_DISCONNECTING
10 - Issue disconnect request to firmware
11 - Unlike the client instance
12 - Flush message queue
13 - Free ISHTP client instance

Step 2-7 are identical to the steps of client driver initialization
and driver reset flow, but reallocation of the RX/TX ring buffers
can be avoided in reset flow.

Also for step 9-12, they are identical to the steps of client driver
failure handling after connect request, driver reset flow and
driver removing.

So, add two helper functions to simplify client driver code.
ishtp_cl_establish_connection()
ishtp_cl_destroy_connection()

No functional changes are expected.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/client.c | 185 +++++++++++++++++++++++++++++--
 include/linux/intel-ish-client-if.h      |   3 +
 2 files changed, 177 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/client.c b/drivers/hid/intel-ish-hid/ishtp/client.c
index 2d92fc1..82c907f 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client.c
@@ -339,16 +339,17 @@ static bool ishtp_cl_is_other_connecting(struct ishtp_cl *cl)
 }
 
 /**
- * ishtp_cl_connect() - Send connect request to firmware
+ * ishtp_cl_connect_to_fw() - Send connect request to firmware
  * @cl: client device instance
  *
- * Send a connect request for a client to firmware. If successful it will
- * RX and TX ring buffers
+ * Send a connect request to the firmware and wait for firmware response.
+ * If there is successful connection response from the firmware, change
+ * client state to ISHTP_CL_CONNECTED, and bind client to related
+ * firmware client_id.
  *
- * Return: 0 if successful connect response from the firmware and able
- * to bind and allocate ring buffers or error code on failure
+ * Return: 0 for success and error code on failure
  */
-int ishtp_cl_connect(struct ishtp_cl *cl)
+static int ishtp_cl_connect_to_fw(struct ishtp_cl *cl)
 {
 	struct ishtp_device *dev;
 	int rets;
@@ -358,8 +359,6 @@ int ishtp_cl_connect(struct ishtp_cl *cl)
 
 	dev = cl->dev;
 
-	dev->print_log(dev, "%s() current_state = %d\n", __func__, cl->state);
-
 	if (ishtp_cl_is_other_connecting(cl)) {
 		dev->print_log(dev, "%s() Busy\n", __func__);
 		return	-EBUSY;
@@ -405,6 +404,38 @@ int ishtp_cl_connect(struct ishtp_cl *cl)
 		return rets;
 	}
 
+	return rets;
+}
+
+/**
+ * ishtp_cl_connect() - Build connection with firmware
+ * @cl: client device instance
+ *
+ * Call ishtp_cl_connect_to_fw() to connect and bind to firmware. If successful,
+ * allocate RX and TX ring buffers, and start flow control with firmware to
+ * start communication.
+ *
+ * Return: 0 if there is successful connection to the firmware, allocate
+ * ring buffers.
+ */
+int ishtp_cl_connect(struct ishtp_cl *cl)
+{
+	struct ishtp_device *dev;
+	int rets;
+
+	if (!cl || !cl->dev)
+		return -ENODEV;
+
+	dev = cl->dev;
+
+	dev->print_log(dev, "%s() current_state = %d\n", __func__, cl->state);
+
+	rets = ishtp_cl_connect_to_fw(cl);
+	if (rets) {
+		dev->print_log(dev, "%s() Connect to fw failed\n", __func__);
+		return rets;
+	}
+
 	rets = ishtp_cl_alloc_rx_ring(cl);
 	if (rets) {
 		dev->print_log(dev, "%s() Alloc RX ring failed\n", __func__);
@@ -422,16 +453,148 @@ int ishtp_cl_connect(struct ishtp_cl *cl)
 		return rets;
 	}
 
-	/* Upon successful connection and allocation, emit flow-control */
+	/*
+	 * Upon successful connection and allocation, start flow-control.
+	 */
 	rets = ishtp_cl_read_start(cl);
 
-	dev->print_log(dev, "%s() successful\n", __func__);
-
 	return rets;
 }
 EXPORT_SYMBOL(ishtp_cl_connect);
 
 /**
+ * ishtp_cl_establish_connection() - Establish connection with the firmware
+ * @cl: client device instance
+ * @uuid: uuid of the client to search
+ * @tx_size: TX ring buffer size
+ * @rx_size: RX ring buffer size
+ * @reset: true if called for reset connection, otherwise for first connection
+ *
+ * This is a helper function for client driver to build connection with firmware.
+ * If it's first time connecting to the firmware, set reset to false, this
+ * function will link client to bus, find client id and send connect request to
+ * the firmware.
+ *
+ * If it's called for reset handler where client lost connection after
+ * firmware reset, set reset to true, this function will reinit client state and
+ * establish connection again. In this case, this function reuses current client
+ * structure and ring buffers to avoid allocation failure and memory fragments.
+ *
+ * Return: 0 for successful connection with the firmware,
+ * or error code on failure
+ */
+int ishtp_cl_establish_connection(struct ishtp_cl *cl, const guid_t *uuid,
+				  int tx_size, int rx_size, bool reset)
+{
+	struct ishtp_device *dev;
+	struct ishtp_fw_client *fw_client;
+	int rets;
+
+	if (!cl || !cl->dev)
+		return -ENODEV;
+
+	dev = cl->dev;
+
+	ishtp_set_connection_state(cl, ISHTP_CL_INITIALIZING);
+
+	/* reinit ishtp_cl structure if call for reset */
+	if (reset) {
+		cl->host_client_id = 0;
+		cl->fw_client_id = 0;
+		cl->ishtp_flow_ctrl_creds = 0;
+		cl->out_flow_ctrl_creds = 0;
+
+		cl->last_tx_path = CL_TX_PATH_IPC;
+		cl->last_dma_acked = 1;
+		cl->last_dma_addr = NULL;
+		cl->last_ipc_acked = 1;
+
+		cl->sending = 0;
+		cl->err_send_msg = 0;
+		cl->err_send_fc = 0;
+
+		cl->send_msg_cnt_ipc = 0;
+		cl->send_msg_cnt_dma = 0;
+		cl->recv_msg_cnt_ipc = 0;
+		cl->recv_msg_cnt_dma = 0;
+		cl->recv_msg_num_frags = 0;
+		cl->ishtp_flow_ctrl_cnt = 0;
+		cl->out_flow_ctrl_cnt = 0;
+	}
+
+	/* link to bus */
+	rets = ishtp_cl_link(cl);
+	if (rets) {
+		dev->print_log(dev, "%s() ishtp_cl_link failed\n", __func__);
+		return rets;
+	}
+
+	/* find firmware client */
+	fw_client = ishtp_fw_cl_get_client(dev, uuid);
+	if (!fw_client) {
+		dev->print_log(dev,
+			       "%s() ish client uuid not found\n", __func__);
+		return -ENOENT;
+	}
+
+	ishtp_set_tx_ring_size(cl, tx_size);
+	ishtp_set_rx_ring_size(cl, rx_size);
+
+	ishtp_cl_set_fw_client_id(cl, ishtp_get_fw_client_id(fw_client));
+
+	ishtp_set_connection_state(cl, ISHTP_CL_CONNECTING);
+
+	/*
+	 * For reset case, not allocate tx/rx ring buffer which are already
+	 * done in ishtp_cl_connect() during first connection.
+	 */
+	if (reset) {
+		rets = ishtp_cl_connect_to_fw(cl);
+		if (!rets)
+			rets = ishtp_cl_read_start(cl);
+		else
+			dev->print_log(dev,
+				"%s() connect to fw failed\n", __func__);
+	} else {
+		rets = ishtp_cl_connect(cl);
+	}
+
+	return rets;
+}
+EXPORT_SYMBOL(ishtp_cl_establish_connection);
+
+/**
+ * ishtp_cl_destroy_connection() - Disconnect with the firmware
+ * @cl: client device instance
+ * @reset: true if called for firmware reset, false for normal disconnection
+ *
+ * This is a helper function for client driver to disconnect with firmware,
+ * unlink to bus and flush message queue.
+ */
+void ishtp_cl_destroy_connection(struct ishtp_cl *cl, bool reset)
+{
+	if (!cl)
+		return;
+
+	if (reset) {
+		/*
+		 * For reset case, connection is already lost during fw reset.
+		 * Just set state to DISCONNECTED is enough.
+		 */
+		ishtp_set_connection_state(cl, ISHTP_CL_DISCONNECTED);
+	} else {
+		if (cl->state != ISHTP_CL_DISCONNECTED) {
+			ishtp_set_connection_state(cl, ISHTP_CL_DISCONNECTING);
+			ishtp_cl_disconnect(cl);
+		}
+	}
+
+	ishtp_cl_unlink(cl);
+	ishtp_cl_flush_queues(cl);
+}
+EXPORT_SYMBOL(ishtp_cl_destroy_connection);
+
+/**
  * ishtp_cl_read_start() - Prepare to read client message
  * @cl: client device instance
  *
diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
index f45f133..7716226 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -94,6 +94,9 @@ int ishtp_cl_link(struct ishtp_cl *cl);
 void ishtp_cl_unlink(struct ishtp_cl *cl);
 int ishtp_cl_disconnect(struct ishtp_cl *cl);
 int ishtp_cl_connect(struct ishtp_cl *cl);
+int ishtp_cl_establish_connection(struct ishtp_cl *cl, const guid_t *uuid,
+				  int tx_size, int rx_size, bool reset);
+void ishtp_cl_destroy_connection(struct ishtp_cl *cl, bool reset);
 int ishtp_cl_send(struct ishtp_cl *cl, uint8_t *buf, size_t length);
 int ishtp_cl_flush_queues(struct ishtp_cl *cl);
 int ishtp_cl_io_rb_recycle(struct ishtp_cl_rb *rb);
-- 
2.7.4


