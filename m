Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C887358958B
	for <lists+linux-input@lfdr.de>; Thu,  4 Aug 2022 02:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiHDA7f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Aug 2022 20:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238861AbiHDA7d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Aug 2022 20:59:33 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5904B5F9A4
        for <linux-input@vger.kernel.org>; Wed,  3 Aug 2022 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659574770; x=1691110770;
  h=from:to:cc:subject:date:message-id;
  bh=1rAPp8yq9BWApfzk7xsOkTkrh8jYy6rQ5rjEw+7l9QE=;
  b=fZ9qU9jSOticXR5s9qEGFuG7dez0fJGwiuPTAUh0UGYX2mHOy8cH4/hH
   NuOT6QhdjymKXBA3chjFamXfofG7zg5mXYQnq3LDe9U+pyBbpCbi+Dtqo
   TeSdto8ZRrHIzuUOjkkroWAmtfDc83Caw/xjJZIRFvzTw+QIMMpo0jKHT
   qKRD3p6Xre5KgvWca3OFe2Qy2/4M8g0EtBd/3V2uTQOnKgJITEfVrLxlp
   Aq6PWh9eWUszHktEJU1c2Z/Xru1pF9VuwbVCkjySdprrB9KiAnWUsV06V
   5ZUvEzBm0rVbjzXX8n5+iMZ30+sXY+PBrUxsOWEjS1qgmtHb0STX6qmDo
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="276728325"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="276728325"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 17:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="662314937"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.108])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2022 17:59:28 -0700
From:   Even Xu <even.xu@intel.com>
To:     srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, Even Xu <even.xu@intel.com>
Subject: [PATCH] hid: intel-ish-hid: ishtp: Fix ishtp client sending disordered message
Date:   Thu,  4 Aug 2022 08:59:19 +0800
Message-Id: <1659574759-30159-1-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a timing issue captured during ishtp client sending stress tests.
It was observed during stress tests that ISH firmware is getting out of
ordered messages. This is a rare scenario as the current set of ISH client
drivers don't send much data to firmware. But this may not be the case
going forward.

When message size is bigger than IPC MTU, ishtp splits the message into
fragments and uses serialized async method to send message fragments.
The call stack:
ishtp_cl_send_msg_ipc->ipc_tx_callback(first fregment)->
ishtp_send_msg(with callback)->write_ipc_to_queue->
write_ipc_from_queue->callback->ipc_tx_callback(next fregment)......

When an ipc write complete interrupt is received, driver also calls
write_ipc_from_queue->ipc_tx_callback in ISR to start sending of next fragment.

Through ipc_tx_callback uses spin_lock to protect message splitting, as the
serialized sending method will call back to ipc_tx_callback again, so it doesn't
put sending under spin_lock, it causes driver cannot guarantee all fragments
be sent in order.

Considering this scenario:
ipc_tx_callback just finished a fragment splitting, and not call ishtp_send_msg
yet, there is a write complete interrupt happens, then ISR->write_ipc_from_queue
->ipc_tx_callback->ishtp_send_msg->write_ipc_to_queue......

Because ISR has higher exec priority than normal thread, this causes the new
fragment be sent out before previous fragment. This disordered message causes
invalid message to firmware.

The solution is, to send fragments synchronously:
Use ishtp_write_message writing fragments into tx queue directly one by one,
instead of ishtp_send_msg only writing one fragment with completion callback.
As no completion callback be used, so change ipc_tx_callback to ipc_tx_send.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/client.c | 68 ++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/client.c b/drivers/hid/intel-ish-hid/ishtp/client.c
index 405e0d5..df0a825 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client.c
@@ -626,13 +626,14 @@ static void ishtp_cl_read_complete(struct ishtp_cl_rb *rb)
 }
 
 /**
- * ipc_tx_callback() - IPC tx callback function
+ * ipc_tx_send() - IPC tx send function
  * @prm: Pointer to client device instance
  *
- * Send message over IPC either first time or on callback on previous message
- * completion
+ * Send message over IPC. Message will be split into fragments
+ * if message size is bigger than IPC FIFO size, and all
+ * fragments will be sent one by one.
  */
-static void ipc_tx_callback(void *prm)
+static void ipc_tx_send(void *prm)
 {
 	struct ishtp_cl	*cl = prm;
 	struct ishtp_cl_tx_ring	*cl_msg;
@@ -677,32 +678,41 @@ static void ipc_tx_callback(void *prm)
 			    list);
 	rem = cl_msg->send_buf.size - cl->tx_offs;
 
-	ishtp_hdr.host_addr = cl->host_client_id;
-	ishtp_hdr.fw_addr = cl->fw_client_id;
-	ishtp_hdr.reserved = 0;
-	pmsg = cl_msg->send_buf.data + cl->tx_offs;
+	while (rem > 0) {
+		ishtp_hdr.host_addr = cl->host_client_id;
+		ishtp_hdr.fw_addr = cl->fw_client_id;
+		ishtp_hdr.reserved = 0;
+		pmsg = cl_msg->send_buf.data + cl->tx_offs;
+
+		if (rem <= dev->mtu) {
+			/* Last fragment or only one packet */
+			ishtp_hdr.length = rem;
+			ishtp_hdr.msg_complete = 1;
+			/* Submit to IPC queue with no callback */
+			ishtp_write_message(dev, &ishtp_hdr, pmsg);
+			cl->tx_offs = 0;
+			cl->sending = 0;
 
-	if (rem <= dev->mtu) {
-		ishtp_hdr.length = rem;
-		ishtp_hdr.msg_complete = 1;
-		cl->sending = 0;
-		list_del_init(&cl_msg->list);	/* Must be before write */
-		spin_unlock_irqrestore(&cl->tx_list_spinlock, tx_flags);
-		/* Submit to IPC queue with no callback */
-		ishtp_write_message(dev, &ishtp_hdr, pmsg);
-		spin_lock_irqsave(&cl->tx_free_list_spinlock, tx_free_flags);
-		list_add_tail(&cl_msg->list, &cl->tx_free_list.list);
-		++cl->tx_ring_free_size;
-		spin_unlock_irqrestore(&cl->tx_free_list_spinlock,
-			tx_free_flags);
-	} else {
-		/* Send IPC fragment */
-		spin_unlock_irqrestore(&cl->tx_list_spinlock, tx_flags);
-		cl->tx_offs += dev->mtu;
-		ishtp_hdr.length = dev->mtu;
-		ishtp_hdr.msg_complete = 0;
-		ishtp_send_msg(dev, &ishtp_hdr, pmsg, ipc_tx_callback, cl);
+			break;
+		} else {
+			/* Send ipc fragment */
+			ishtp_hdr.length = dev->mtu;
+			ishtp_hdr.msg_complete = 0;
+			/* All fregments submitted to IPC queue with no callback */
+			ishtp_write_message(dev, &ishtp_hdr, pmsg);
+			cl->tx_offs += dev->mtu;
+			rem = cl_msg->send_buf.size - cl->tx_offs;
+		}
 	}
+
+	list_del_init(&cl_msg->list);
+	spin_unlock_irqrestore(&cl->tx_list_spinlock, tx_flags);
+
+	spin_lock_irqsave(&cl->tx_free_list_spinlock, tx_free_flags);
+	list_add_tail(&cl_msg->list, &cl->tx_free_list.list);
+	++cl->tx_ring_free_size;
+	spin_unlock_irqrestore(&cl->tx_free_list_spinlock,
+		tx_free_flags);
 }
 
 /**
@@ -720,7 +730,7 @@ static void ishtp_cl_send_msg_ipc(struct ishtp_device *dev,
 		return;
 
 	cl->tx_offs = 0;
-	ipc_tx_callback(cl);
+	ipc_tx_send(cl);
 	++cl->send_msg_cnt_ipc;
 }
 
-- 
2.7.4

